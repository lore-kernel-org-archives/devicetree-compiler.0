From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/6] libfdt: Fix signed/unsigned comparison warnings
Date: Fri, 2 Oct 2020 11:03:24 +1000
Message-ID: <20201002010324.GH1844@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kHRd/tpU31Zn62xO"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602063;
        bh=sFcJyF+iTB8BLAZUNUBjY64ttHSOiRRXlyE9WADT0p8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iH8sQyzN1U0g8XFNN1dXVtE5fJilZ5LZzEdroZCPKlRGFyyAhWZPaVlhNb2C2rNY/
         Txs0lwlAVU9gSLKI16p040wz4wD75/75WY6S34bnKtBTU/cCsoQNFkssRrNRpaGc8E
         M0izDgQgh4pb9LbuJigEM3ugaEdAwcjHQw7erPVs=
Content-Disposition: inline
In-Reply-To: <20201001164630.4980-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--kHRd/tpU31Zn62xO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:46:24PM +0100, Andre Przywara wrote:
> Those are the six remaining patches of the initial post to fix the
> C comparison warnings.
> I reworked the fixes according to David's comments, and took quite a
> different approach for some of them.
> Changelog below.
>=20
> The series is against https://github.com/dgibson/dtc/commits/main
> ------------------------------------
>=20
> When libfdt is compiled with -Wsign-compare or -Wextra, GCC emits quite
> some warnings about the signedness of the operands not matching:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> libfdt/fdt.c:140:18: error: comparison between signed and unsigned intege=
r expressions [-Werror=3Dsign-compare]
>    if ((absoffset < offset)
> .....
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This does not occur under normal conditions in the dtc repo, but might
> show up when libfdt is embedded in another project. There have been repor=
ts
> from U-Boot and Trusted-Firmware-A.
>=20
> The underlying issue is mostly due to C's promotion behaviour (ANSI C
> section 6.1.3.8) when dealing with operands of different signedness
> (but same size): Signed values get implictly casted to unsigned, which
> is not typically what we want if they could have been negative.
>=20
> The Internet(TM) suggests that blindly applying casts is probably doing
> more harm than it helps, so this series tries to fix the underlying
> issues properly.
> In libfdt, some types are somewhat suboptimal ("int bufsize" comes to min=
d);
> some signed types are due to them being returned along wih error values in
> other functions (node offsets).
> So these fixes here have been based on the following assumptions:
> - We cannot change the prototype of exported functions.
> - It's better to change types (for local variables) than to cast.
> - If we have established that a signed value is not negative, we can safe=
ly
>   cast it to an unsigned type.
>=20
> I split up the fixes in small chunks, to make them easier to review.
>=20
> This is only covering libfdt for now (which is what those other projects
> care about). There are more issues with dtc, but they can be addressed
> later.
>=20
> Please have a look, happy to discuss the invididual cases.

Thanks again for this work.  I've applied all the remaining patches,
although I have some comments for some followups I think would be
good.

At this point can we turn on -Wsign-compare by default?  That sounds
like a good idea to stop these problems creeping back in.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kHRd/tpU31Zn62xO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92fFkACgkQbDjKyiDZ
s5ILMA//QIvpI+Hlnrg21Cx9Nvrg5Ud7YJvUTCHYCGUZ3R358Kq3N+1MimIj5cK9
2idsDqVpbcskkdHXRYqPE80LF3kdgbPjwVhFoPVU4DcqPX6ixGEecEj/WIPpnjir
FPJAC4DleSuvlomDqY/HWDE5LfhXxTFJ4VUYLAMbs2nbeDa2Tu2ny8n4DuEV69D7
PeZ+YkD7eGWt8JcIEvqH6rtxaNegUuOBxMCecvEXBeuP14VBdOXosnZ05JVYAx12
w9u5TXb9SLBNMVghzK9kfyRrg/Coi3oBxK76SbEX8rTXE2YL8C7DiQp5zXp7wrnO
XRpXjg85uPM2sDCtrT/0e8wvnp5j2znj1IsZaDzf6VZwDnMAJo3ZP/jRGQJkdBm3
8kzRMVjv08GLlpbvGYK83Un5Z57FRY5PbRpuRPeFye/8Bx30QMWRfzhNWx9k0SAc
FJ+JfNMbXRC6+t7ojEJR9BSs4knAbuZRasLBFfcK7HoCjpFZimCXyRc7QhlwF/3T
wWf6Z8Vt6N4OnCR3u4o+HPbeqWFJb0P1TrND/EU5Q+7PUb8YrMUZqm0/mzYdyJI9
7KsusUM5jGL3VR1ZmnTIZZ1AgaVaxc+m0jpWcZkqq7IplbIiKy2Qu0GK59ALrRTc
0t26c2v5/4dgGWUAQPDPxtEJ0F68Sjw8WhXNTEynk9fJcxJmnwo=
=Qdza
-----END PGP SIGNATURE-----

--kHRd/tpU31Zn62xO--
