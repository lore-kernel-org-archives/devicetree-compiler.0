From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 04/14] libfdt: fdt_add_string_(): Fix comparison warning
Date: Fri, 2 Oct 2020 10:01:40 +1000
Message-ID: <20201002000140.GA1844@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-5-andre.przywara@arm.com>
 <20200924010145.GJ2298@yekko.fritz.box>
 <74c57a12-db86-ec9f-5c91-f0419c24de4b@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602062;
        bh=lerSF4jwV4vaZGvixXqMsUrIVzfJfh/LtMRd8AVUpis=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eSxi322rmm1byMe7DJGZNfVI/wbyY9GFg0RpzPjW6JlOnuPZkmeJ6DkECgxFUJ/FG
         HNFBLjdKVCLurWRcXVT3yRnVxUCTl0XWcEld1ReE3janxP31Rr3gUlkqcGalegyodD
         Vo4+V2+oGabQrG/9sfOh2PdProEJRg1fKiiH9PyY=
Content-Disposition: inline
In-Reply-To: <74c57a12-db86-ec9f-5c91-f0419c24de4b-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 04:33:50PM +0100, Andr=E9 Przywara wrote:
> On 24/09/2020 02:01, David Gibson wrote:
> > On Mon, Sep 21, 2020 at 05:52:53PM +0100, Andre Przywara wrote:
> >> With -Wsign-compare, compilers warn about a mismatching signedness
> >> in a comparison in fdt_add_string_().
> >>
> >> As struct_top can only be positive, just use an unsigned type for it,
> >> and avoid the signedness difference.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> >=20
> > I'm not sure this is right.  Well.. I'm also not sure it was right
> > before.  Adding some more context to explain why..
> >=20
> >> ---
> >>  libfdt/fdt_sw.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> >> index d10a720..d65e9c8 100644
> >> --- a/libfdt/fdt_sw.c
> >> +++ b/libfdt/fdt_sw.c
> >> @@ -249,7 +249,8 @@ static int fdt_add_string_(void *fdt, const char *=
s)
> >>  	char *strtab =3D (char *)fdt + fdt_totalsize(fdt);
> >>  	int strtabsize =3D fdt_size_dt_strings(fdt);
> >>  	int len =3D strlen(s) + 1;
> >> -	int struct_top, offset;
> >> +	unsigned int struct_top;
> >> +	int offset;
> >> =20
> >>  	offset =3D -strtabsize - len;
> >>  	struct_top =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
> >> 	if (fdt_totalsize(fdt) + offset < struct_top)
> >> 		return 0; /* no more room :( */
> >=20
> > So strtabsize and len will always be positive (or, if they're not,
> > that's another problem), so offset is always negative.  Which means we
> > need the signed addition between totalsize and offset for this to be
> > correct.
> >=20
> > So I suspect we want to make 'len' and 'offset' unsigned as well,
> > reverse the sign on offset and make it a subtraction in the if instead
> > of an addition-of-negative.
>=20
> Ah, yes, much better! To be honest I just did my due diligence on *this*
> function before, because all those minus signs confused me quite a lot.
> But your approach makes it much clearer what is going on here.
>=20
> So if I get this correctly, this function really returns the *negative*
> offset of the new string, which will end up in the property, for now?
> And at the end we translate all negative values into the actual offsets?
> And there is initially a gap between the dt_struct part and the string
> table, to allow both growing towards each other, without needing to
> rewrite everything, every time?

Yes, that's correct.  During sequential write mode, to avoid excessive
memmove()s, the structure block grows up from the bottom of the
buffer, while the strings block grows down from the top.  Because the
"start" (lowest offset) of the strings block is moving, we can't use
offsets from that (without having to adjust all the offsets in the
structure block all the time).  So, we use negative offsets from the
"end" (highest offset).  I'm scare quoting "start" and "end" because
the header records the highest offset of the string block as its
"start", which is why the offsets are negative - that makes some of
the code paths more common with the normal dtb case.

> Is this documented somewhere? Shall this approach be described in a
> comment at the top of this file?

No, I don't think it is.  So, yes there probably should be a big
explanatory comment.  Patches welcome?

Note that this isn't supposed to be an externally visible format,
you're always supposed to use fdt_finish() to convert it into a
regular dtb before handing it off to any other piece of code.  We use
a different magic number in the header while we're in this state to
avoid anything mistaking this for a regular dtb.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92beIACgkQbDjKyiDZ
s5K9vRAA2s0CnBWARDn6rW/UQO4ZSe3I5PpLdo1DCkvPnlvkspcewOFlpBlTOkWz
+gzaR3Pp0BV8GBn8zI9GfygyfJhqBtT5hfsbOxfzefBVzCjBfGzL4VNM/Qu1CdkR
x5HU3KF73F2d6ZEXqNGOt/RrqtfsK6+nCvCJaerPMTPrIIi+bzOa+fLnbHGob0UN
pW42zl3DSZpoQAjjZDhkbGDn3RYMHDf5gk2hBaGRpeKTWD0Q3yPbzlRjCADlWnCc
smQhJQaYxIyq+LfTqlXIpJ863lU5hsBtCo7MpE7wFRM+QzIRzz4RybElMaZV3zsa
hFEJkb0PNgRDWwtGSkMNpqae6ktEJoWSAu94avxo3IGmcutHJ0kF+67RmOO7w8Qa
+b9I0XsiG6IP5BiMVwjdYa5leXdLGNK+VKMHJMWD3xsKbtPwediZ+A11BF8I+7CY
wGoOaJNHJGUUQH+cMu31v/pfie0rRm+mk7mIj82nC0F1ER40no2OCOBJ98cSFXx2
esUGoNymREKCFsjAtT1KHce0BnBV8fZelVBUtFhGdsmqf3FgpAPqLV8zrWyAWvtf
/BnUClhzTogDgzCLVuOqkwe4vreDiiup9iAAxWAgPsCQLAeL+isozr2gjFG5WP+6
iIfSaTf9QMky2PELxiXXcN2sgC7Te3Zkn5JzAp6QZea1Pq0YvUk=
=j6kp
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
