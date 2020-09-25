From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 00/14] libfdt: Fix signed/unsigned comparison warnings
Date: Fri, 25 Sep 2020 14:12:43 +1000
Message-ID: <20200925041243.GA2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rmZDAlAp7pllCg/D"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601007890;
        bh=RUiZu80XjB3/RAZ8k8k4Yi5kmHjRGBKiXFSM4Lwo178=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BHOk2kK97T59p2CIfCv27LygmBF5+WJNcX7cAAeEHpJb3ON+YXVdcspRP0tkpvIRl
         bQgPehBMM8PMPJ9f10YDedD7pKcotLOxnFyz3Eea4qc4wHUzZhBjLMkKy2lv7PvaYZ
         5DdY+jThnXHg6H1qIkX640u4z7YnLKEreSTT1T/I=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--rmZDAlAp7pllCg/D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:49PM +0100, Andre Przywara wrote:
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
> The first four patches change types, the next six ones use casts after
> we made sure the values are not negative.
>=20
> This is only covering libfdt for now (which is what those other projects
> care about). There are more issues with dtc, but they can be addressed
> later.
>=20
> Not sure if some of these checks should be gated by can_assume() calls.
>=20
> Please have a look, happy to discuss the invididual cases.

Thanks so much for these.  I've applied about half of them, the rest I
have mostly minor comments for.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rmZDAlAp7pllCg/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9tbjsACgkQbDjKyiDZ
s5ICBA/9H4woHUd1XTIS9ZiFQ+Y9f4YW3tQFXRA35p9PXZ9kSUk+CpfvxUwpWwsk
/BhCJDQMOcDaq5YsnLv2yE8Z/HIrbgD6LBSiKUP5NaXKqD0y2LLwvg6lPE+0aKPD
w1mzw1xY8/H5t4YVx3GXGkO67kaURVIBE4Ln6mXFW6ISnBKk+eF9kfpOkHFkIunk
QljtSAEqC1IYbeqElyT/0+o7PbT04ljeBOKXGe9FReScGBY9fbwwAXyidLu2p1aV
wmGHsdEBRnwLip1DgFsFyyEJ/4jHTa4m1PHwOqsIFX0j/TFfbDpKmZ93q8jfAW8j
HMVheRMkF4QLPe+VXdwPovn1pPxlk8GErpu7h/006I6wR1aQsZr4UUcJ1gz07YwO
9SBQHJNtfY9G3e2A/ohrcsV/4F3mnZpb3u6HScUmKvVSe9FBb394YL7RE/ekdz5L
Eg1NyjbYUIPPLFSrPJ0x0OSj15UxWF1iEYMcpWe5jpn0RQoQDdkHV97OrwXK/b+z
kiyeK2mfUGa+sw4uS9JoXraJhwvKmIykLnglaz2Otuz1LMLb5CBxA36DrQfMcoJy
1DtUtpeVDja7QFfXI88YStFLJJW9lg4S6J3kM5wWFA/taiWf+BjmSi7n197atcGx
9cHGNf3F6k+ZjdArwsnXrYFbIwHcOtz3U5nmlbZQ2int4mKEU1k=
=7hRS
-----END PGP SIGNATURE-----

--rmZDAlAp7pllCg/D--
