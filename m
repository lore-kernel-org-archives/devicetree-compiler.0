From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Mon, 21 Sep 2020 16:00:08 +1000
Message-ID: <20200921060008.GB11979@yekko.fritz.box>
References: <20200112185209.75847-1-sjg@chromium.org>
 <20200116064955.GR54439@umbus>
 <CAPnjgZ2vbphSbvohBD3YTswX2WtKdVxgs9Ltg9vFfrEQyr2LGw@mail.gmail.com>
 <20200117092332.GW54439@umbus>
 <a6622ba6-71f5-135a-f215-bc3741d9b721@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600668014;
        bh=TwCR8uP0W1vXOsKy/we51CHR3tJmQpEDj6aKtU1WReg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TnPzPDARbWC8gys1O8eWRPTxLdUPDuC6Cqn+3t44P0274IXANbJpXEJIdVVZlHAan
         Q4mcEa99wabb+lpbVic3KM3Dst9BMJ8s5cyyx9VIemuM5nuH6+KWhQeWPoy/tXDazd
         mIG4BI9hLmxWsejW4mZe3axbBh8ErkvB48xmVu+0=
Content-Disposition: inline
In-Reply-To: <a6622ba6-71f5-135a-f215-bc3741d9b721-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 11:26:44AM +0100, Andr=C3=A9 Przywara wrote:
> On 17/01/2020 09:23, David Gibson wrote:
>=20
> Hi,
>=20
> > On Thu, Jan 16, 2020 at 08:58:12PM +1300, Simon Glass wrote:
> >> Hi David,
> >>
> >> On Thu, 16 Jan 2020 at 19:50, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
> >>>
> >>> On Sun, Jan 12, 2020 at 11:52:08AM -0700, Simon Glass wrote:
> >>>> These warnings appear when building U-Boot on x86 and some other tar=
gets.
> >>>> Correct them by adding casts.
> >>>>
> >>>> Example:
> >>>>
> >>>> scripts/dtc/libfdt/fdt.c: In function =E2=80=98fdt_offset_ptr=E2=80=
=99:
> >>>> scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer expr=
essions of different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=
=98int=E2=80=99 [-Wsign-compare]
> >>>>    if ((absoffset < offset)
> >>>>
> >>>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>>
> >>> Hmm.  So squashing warnings is certainly a good thing in general.
> >>>
> >>> Unfortunately, I'm really uncomfortable with most of these changes.
> >>> In a number of cases they are outright wrong.  In most of the others,
> >>> the code was already correct.  I dislike adding casts to suppress
> >>> spurious warnings on correct code because that can end up hiding real
> >>> problems which might be introduced by future changes.
> >>>
> >>> Case by case details below.
> >>
> >> Thanks for the review. I agree this is all really horrible,
> >> particularly in light of the fact that it doesn't fix bugs and perhaps
> >> introduces some.
> >>
> >> This was just a quick patch to silence the warnings. If we do make
> >> fixes here we should really make sure that there are test cases to
> >> trigger each check. I suspect we have some but not all.
> >=20
> > Yeah, adding some safety test cases for egregiously bad input like
> > negative buffer sizes is probably a good idea.
> >=20
> >> What do you think we should do? The warnings are going to be very
> >> annoying for people. I could perhaps split the patch up and work
> >> through things one by one.
> >=20
> > Yeah, we want to find some way to remove the warnings, and I think
> > splitting up and working piece by piece will be necessary.
>=20
> Has anyone done anything on that front?
> If not, I would take a deep breath and try to tackle this one by one. I
> was grudgingly ignoring this in U-Boot so far, but it popped up in
> Trusted Firmware now as well, so I have a business reason (TM).

> > I think the very first step, is to find definitive info on what
> > exactly the defined behaviour of C is with a signed vs. unsigned
> > comparison.
> >=20
> > The help text of -Wsign-compare seems to imply that assuming:
> >=20
> > 	signed int a;
> > 	unsigned int b;
> >=20
> > then=20
> > 	if (a < b) ...
> >=20
> > is equivalent to
> > 	if ((unsigned int)a < b) ...
> >=20
> > But I thought that this was not the case.  Rather, I thought it was
> > supposed to always evaluate to true if b > INT_MAX.  We need to know
> > which is the case as a starting point.

I since had a brief look at this, and it appears I was wrong about
this behaviour, which makes this whole project rather more urgent.
I'd still appreciate someone looking at the standards to double check,
though.

I'm unlikely to have time to look at this myself, though, so I'd be
very happy if you took this on, and I'll do my absolute best to review
and merge promptly.

Fwiw, the more "bite-size" the patches are, the easier it is for me to
review.  So I'd suggest fixing just a small set of related cases at a
time, with a clear justification for why the new semantics are correct
in the commit message.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9oQWgACgkQbDjKyiDZ
s5LFexAAnnXhXqBwbxEI51Xj097nFJIQbRYAcrZEIpOUTf7MC0JLP4zd4kGi6Vpi
8gbF9BfGoG9CUzTAjjJTBE2smdJPv+BBR5toIcNNkia3RNCEpPpPhuCuwbsSpv5z
vDBCIAHWQ1CeXDH63it0GLUe8EW0dqvpYEJ21ci3sw8THQPSEiZh61AwLpjDqPy6
Ur8nsiduwMvgVHDHWUw1jbBkyr24F7krTRtRd6roLpcZ/v2hIRWqo+d4K5J6OUQD
8PS2Ja4Cuyc4F+kyWb3rKJYv08OrdlVyKgtCaK7PlhavLVr/5I0FYxr7MUzN8NnG
ha2YasMND7l8kbkxsqiVDRcp8UDK+/v4urVJDbdMG5d309BDTHLwy1+LaRb/hPvx
VUOrCf5B4ufop5rdnC5jK0Avpzkxzcj9WzV6wVC/rdO79UEkSkJxGvv8POvlslu0
uIac5D2OeWJNVtSI3Le4sbVo6BXfroq4x4+8ybz31xDVc9PkNK/T5DKsJaKaA8Cx
zSE0qZEAKbfimw6jeIVdxcIwlGCSRu17j8DebBSTCAF2/NAn4dblAc5xGpf/8tj4
aiqiibv+H25UU9isthfGdEH9w+TCj7zP53r0fh2qNdhAF1sviT9l1aRvVKqNFkuN
GDaziBnbBMtN+TLz5WtEW5Sa9NszmJltmJOFKiCTgF2JlLpUppQ=
=dsLD
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
