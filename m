From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: potential regression between 1.6.0 and 1.6.1
Date: Fri, 14 Oct 2022 10:59:56 +1100
Message-ID: <Y0imfMpFF7biNyeE@yekko>
References: <AM6PR10MB2102BC4BB6C50FBC26F10557F3259@AM6PR10MB2102.EURPRD10.PROD.OUTLOOK.COM>
 <CAL_Jsq+xu-A39D2Gp=3PjHMg99T0x0qpyEr9gFtGORbS=xmYCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tBqTps5mVdD9qdln"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1665705607;
        bh=FdNdYn/yQV7Yv8bQthPwgv/Hj8ii6P1eqoV41L4/tIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AtSQ/+120KTB0gTLtedwSNvcZlIvj6vsZPh0YXtRan8VFoOOXasclx8v6YZoVH2w+
         Qa8XJ5eqlzlAgbU7S9Zn9x2rmqcFBh7hh+g3HFRFH5FgKXdc7UE68TPQhA/PCLP27R
         Jp03HgSWuOBo7tPXCYgVzhWAtF9sIyhzBhgs5qHg=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+xu-A39D2Gp=3PjHMg99T0x0qpyEr9gFtGORbS=xmYCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Quentin Kaiser <quentin.kaiser-JH/mD2RVu8LQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--tBqTps5mVdD9qdln
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2022 at 02:05:39PM -0500, Rob Herring wrote:
> On Thu, Oct 13, 2022 at 11:36 AM Quentin Kaiser
> <quentin.kaiser-JH/mD2RVu8LQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > Hi,
> >
> > We identified a =E2=80=9Cregression=E2=80=9D between dtc 1.6.0 and 1.6.=
1 introduced by commit 9d7888cbf19c2930992844e69a097dc71e5a7354.
>=20
> It's always good practice to Cc the author of the commit and quote the su=
bject.
>=20
> > As part of a firmware extraction framework that we built and open sourc=
ed (https://unblob.org), we have integration test files making sure our cha=
nges do not modify the way we extract specific file types.
> > We do so by extracting integration test files and identifying changes u=
sing diff. Within this extraction framework, we have a handler that convert=
 DTBs to DTS using the dtc command line tool.
> >
> > The test suite was failing on one of our colleague=E2=80=99s machine bu=
t not on ours, and we identified that the only difference was the DTC versi=
on (1.5.0 vs 1.6.1).
> >
> > You can reproduce it with the iMX6 Sabrelite DTB file available at http=
s://github.com/FAlinux-SoftwareinLife/silfa/blob/master/OS/kernel/imx6q-sab=
relite.dtb using this command:
> >
> > dtc -I dtb -O dts imx6q-sabrelite.dtb 2>/dev/null | grep min-voltage
> >
> > Here=E2=80=99s a diff showing the difference between the two generated =
DTS (one with 1.5.0, the other with 1.6.1):
> >
> > diff /tmp/1.5.0.dts /tmp/1.6.1.dts
> > 852c852
> > <                       regulator-min-microvolt =3D <0xc3500>;
> > ---
> > >                       regulator-min-microvolt =3D "\0\f5";
> > 859c859
> > <                       min-voltage =3D <0xc3500>;
> > ---
> > >                       min-voltage =3D "\0\f5";
>=20
> .dts output encoding from a dtb is a guess at best and is not
> reliable. Anything that looks like ascii is going to get output that
> way. That said, while a \0 at the start is a valid string in dts, it's
> probably not likely in practice and we should not decode the data as
> ascii in that case.

Right.  Like any decompilation, we have to make guesses as to what the
original intent was.  In case it wasn't clear from Rob's comment,
those two outputs describe the exact same content in the dtb:

In big-endian 0xc3500 is bytes:		0x00 0x0c 0x35 0x00

The string "\0\f5" is characters:	'\0'  '\f' '5'  '\0'
which have byte values:			0x00 0x0c 0x35 0x00

I think the behaviour change was introduced by 9d7888cb "dtc: Consider
one-character strings as strings".  Previously we used to guess "not a
string" if there were as many or more \0s as non \0 characters, now
it's only if there are strictly more \0s than non \0 characters.
The change was made so that the fairly common string "/" would be
rendered as a string, rather than as bytes [2f 00].  But you'll note
that your example hits the same condition.

One can imagine tweaks to these heuristics that would get this case
"right": e.g. require at least one non-\0 character before each \0, or
don't consider \f and other escapable control characters as "string"
characters in isstring().  I'd consider patches that made such a
change, but ultimately these are just a guess at the dt author's
intention, so they can never be infallible.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tBqTps5mVdD9qdln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmNIpnUACgkQgypY4gEw
YSImEQ/+JX5grqYdR+vIoerxTt/O9JpvBGc2ZqjHxMLCthxSbn1TcGhbSatgjxCb
vVbIZwkYYYqQ5zvILPgFpND2qXEtw2puUUgAQ/50fjRnH4kDOBiN7qD4wbh4ZWif
KElIwtN+/p1BTmaijXTd00AHfvrKJL6U8Z9FrWP6prylIXguavntE+/EBHRZGYFs
oyggBnEhzL+QpFs3R+qpQCzF3F378NF9rsgvVsqFDCMj1mG7PEVggy3PFYerngEj
MLulAktoV+JjTcU5i+BF93lzGQ46/WI6zvAuUVMnW3gE9NPTszujINgmF4Q8YSAI
0JO1Dg9zLqVpnl6A0yipTdaZfCF7ZiY76KLbxav8oqYdFLLFcBEGOyyre4Lorsv5
cm6+zLO1AsTTvnCE1lUY+/rdQbTRcRyGFGDkzPmNG3t+vP0Xc4ZDplFxwHc91WLt
q5jC8SPv2KxoF9C+rQPygX4m5uAlvqmPMepHZvqauR07gGD+jiyNQSdHPjHCInR9
slnOcO2qgV4M3TQRXy0Ing2yxBiPB/S5v8IpYYZFuRUg07dMl6iPffXTzl7mdTJp
4UCokJWHAiVTfSgqTjfJJjWbtD+f1ZVgYP/teCwrK0dFvdP5cmiQJ7GGIQrzpNjn
jQ6VTzkJq1FiWWeJnlFmWBHoIfZnMx3cE59mVrE5yyxDtsWmNxc=
=+QFR
-----END PGP SIGNATURE-----

--tBqTps5mVdD9qdln--
