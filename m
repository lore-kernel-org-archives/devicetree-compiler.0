From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 04/14] libfdt: fdt_add_string_(): Fix comparison warning
Date: Fri, 2 Oct 2020 22:25:25 +1000
Message-ID: <20201002122525.GP1844@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-5-andre.przywara@arm.com>
 <20200924010145.GJ2298@yekko.fritz.box>
 <74c57a12-db86-ec9f-5c91-f0419c24de4b@arm.com>
 <20201002000140.GA1844@yekko.fritz.box>
 <3d6281e8-bd95-b2db-2b80-446f9a98ea66@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SavPGzlo48F1Gxyz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601645803;
        bh=ty3BepYL2LwGGVePhLz8cyH5tYDtHNNYh5+pIUHjlag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I+RtH2zMSpP+EZClhCSgGlnWuHSR0ixqE2nlcc1VKJljWHLDeJpi2shg1kmsnr4lC
         fxBWrFLZYwgQ6Qdcs+hGnn/xeG1rHrY+C4LzYVU90TfwJgxhc/a2kZYzc3D7BSAOPB
         Hj3VR6yKftEzEAHlVWtQCkG4JYi50o8Z1SGiN/7Y=
Content-Disposition: inline
In-Reply-To: <3d6281e8-bd95-b2db-2b80-446f9a98ea66-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--SavPGzlo48F1Gxyz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 10:31:06AM +0100, Andr=E9 Przywara wrote:
> On 02/10/2020 01:01, David Gibson wrote:
>=20
> Hi David,
>=20
> > On Thu, Oct 01, 2020 at 04:33:50PM +0100, Andr=E9 Przywara wrote:
> >> On 24/09/2020 02:01, David Gibson wrote:
> >>> On Mon, Sep 21, 2020 at 05:52:53PM +0100, Andre Przywara wrote:
> >>>> With -Wsign-compare, compilers warn about a mismatching signedness
> >>>> in a comparison in fdt_add_string_().
> >>>>
> >>>> As struct_top can only be positive, just use an unsigned type for it,
> >>>> and avoid the signedness difference.
> >>>>
> >>>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> >>>
> >>> I'm not sure this is right.  Well.. I'm also not sure it was right
> >>> before.  Adding some more context to explain why..
> >>>
> >>>> ---
> >>>>  libfdt/fdt_sw.c | 3 ++-
> >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> >>>> index d10a720..d65e9c8 100644
> >>>> --- a/libfdt/fdt_sw.c
> >>>> +++ b/libfdt/fdt_sw.c
> >>>> @@ -249,7 +249,8 @@ static int fdt_add_string_(void *fdt, const char=
 *s)
> >>>>  	char *strtab =3D (char *)fdt + fdt_totalsize(fdt);
> >>>>  	int strtabsize =3D fdt_size_dt_strings(fdt);
> >>>>  	int len =3D strlen(s) + 1;
> >>>> -	int struct_top, offset;
> >>>> +	unsigned int struct_top;
> >>>> +	int offset;
> >>>> =20
> >>>>  	offset =3D -strtabsize - len;
> >>>>  	struct_top =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
> >>>> 	if (fdt_totalsize(fdt) + offset < struct_top)
> >>>> 		return 0; /* no more room :( */
> >>>
> >>> So strtabsize and len will always be positive (or, if they're not,
> >>> that's another problem), so offset is always negative.  Which means we
> >>> need the signed addition between totalsize and offset for this to be
> >>> correct.
> >>>
> >>> So I suspect we want to make 'len' and 'offset' unsigned as well,
> >>> reverse the sign on offset and make it a subtraction in the if instead
> >>> of an addition-of-negative.
> >>
> >> Ah, yes, much better! To be honest I just did my due diligence on *thi=
s*
> >> function before, because all those minus signs confused me quite a lot.
> >> But your approach makes it much clearer what is going on here.
> >>
> >> So if I get this correctly, this function really returns the *negative*
> >> offset of the new string, which will end up in the property, for now?
> >> And at the end we translate all negative values into the actual offset=
s?
> >> And there is initially a gap between the dt_struct part and the string
> >> table, to allow both growing towards each other, without needing to
> >> rewrite everything, every time?
> >=20
> > Yes, that's correct.  During sequential write mode, to avoid excessive
> > memmove()s, the structure block grows up from the bottom of the
> > buffer, while the strings block grows down from the top.  Because the
> > "start" (lowest offset) of the strings block is moving, we can't use
> > offsets from that (without having to adjust all the offsets in the
> > structure block all the time).  So, we use negative offsets from the
> > "end" (highest offset).  I'm scare quoting "start" and "end" because
> > the header records the highest offset of the string block as its
> > "start", which is why the offsets are negative - that makes some of
> > the code paths more common with the normal dtb case.
> >=20
> >> Is this documented somewhere? Shall this approach be described in a
> >> comment at the top of this file?
> >=20
> > No, I don't think it is.  So, yes there probably should be a big
> > explanatory comment.  Patches welcome?
> Yes, that was the idea, just want to double check that I got this right.
>=20
> > Note that this isn't supposed to be an externally visible format,
> > you're always supposed to use fdt_finish() to convert it into a
> > regular dtb before handing it off to any other piece of code.  We use
> > a different magic number in the header while we're in this state to
> > avoid anything mistaking this for a regular dtb.
>=20
> Yeah, I understand, but the different magics and the negative offsets
> were quite confusing at first, until I discovered the whole story.
> Since the library is typically embedded into other projects, I think
> it's a good idea to document this, in case people follow some rabbit
> with ctags ...

Yes, that makes sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SavPGzlo48F1Gxyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl93HDMACgkQbDjKyiDZ
s5LoeQ/7BncjphhaGBMkHdzg2LNJKEasChy1zTsjZsMODSiZNuEDYqCZbkKeYObN
byIvIyRZMhV9sR1uH/zMZmPPeK3cjz1qNDGBWCjifTQs0p77KDlX84Sbw+UQRznm
rTjRCOMEc0fyYM/EckF7PdQpL8BOXhkEucr1bUaUgx/wdMNbgEw0kk5HLmwzXZBK
wXbyeU7ChtWvjn+X++ZBWP9uYLaHA3RuntI3REyIdXnwaARsbKAZALfU2RexTHdA
AvfFi6AZSyBs/iwTyQ868sx2Gcm5wpydc73enb0ZaH2hFP7ARuI5gJauenguedeo
EOMUK6EMcwVS7iY45mjsjSJjuLYP3mwQQKkFNlcE2wgMCpFoTumE1c08N3mI3pz1
78kZAZppMZb5VXgxr4ijf60qqcxxoNLBFBss/bOXWbChhQ3Xvkj6avT5a7T7u0Iq
rd/mQdk5eoOqx4l9cxGLjzYzIq3FeLlM3J+ggdwIDcqFSqm+JBKxQFNCh2rA2B+i
iYyTe7K48UziBzF3XgnE5R+hBfrlm1FOkF62YJGkS9HjIdIPSy93P4N4KQq2svJS
cTPnpUgVBQAByeYGG+aDkQ/Y0IFFMNsS6so86LmXGy3Ytjzx/5/ofsp1zZIG01S2
qQy+m60MhOaRlUpmty4P1PkrSxkn7Z86GP1oZyRmWTO7inXaqkI=
=xyoO
-----END PGP SIGNATURE-----

--SavPGzlo48F1Gxyz--
