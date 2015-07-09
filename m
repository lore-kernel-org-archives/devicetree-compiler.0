From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtdump: fix output of bytestring properties
Date: Thu, 9 Jul 2015 13:50:26 +1000
Message-ID: <20150709035026.GA18868@voom.redhat.com>
References: <559D4DCE.4040000@mcst.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <559D4DCE.4040000-wnI+JWxWOPs@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Prusov Igor Vladimirovich <Igor.V.Prusov-wnI+JWxWOPs@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 07:20:30PM +0300, Prusov Igor Vladimirovich wrote:
> Currently, when fdtdump prints bytestring property, it prints ffffff=20
> in front of bytes with first bit equal to 1 (0x80 - 0xff)
>=20
> For example:
> property =3D [80];
> will become
> property =3D [ffffff80];
> This patch fixes it.

Actually, it's worse than that.  It will print incorrectly on
platforms where char is signed by default, but not on those where it
is unsigned by default.

> Signed-off-by: Igor Prusov <Igor.V.Prusov-wnI+JWxWOPs@public.gmane.org>
> ---
>  util.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for this, but there are a couple of problems with this patch
that make it difficult for me to apply directly.

First, the usual convention is to diff the whole tree, not individual
files, so the resulting patch can be applied with -p1.

Second, it looks like your mailer has mangled the patch, replacing
tabs with spaces, which means it won't apply directly.

Please check those if you send patches in future.

FOr this specific bug, I'd actually prefer a slightly different fix,
so I've gone ahead and applied my own slightly different fix.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVne+CAAoJEGw4ysog2bOSNq4QAIpLpm4mdJKnnhPdQARaPs/U
utp13oEVGdKobgWl82VG5KcJdcysoNErUlq2kLSN7GJu4w9CdikBssoExq7hnfsp
zBOaGAIgMcH+yc3ihV4P1Mw1pVIfZlZRpmahM3x4GiESnKROFGypHU4YYcIjVgNi
DleICBeTKCrMI/UiuzyYNba/vrMwXr5UMgTyz52qvX+0xC6SK5NAEpm9EmEBhjVw
pybkjczyQJ1I6HU1zaiY3aahMo0l8lkCnwhHWKmvbRPPVWfXT/6gRiF4jVaOj6dW
i/E4hzyM1haknyMtXzJgz3oSjrKtl+l0nsQ2jCa9+7v/Nyw0yD1uFWDqetS3vIHS
Tf8bfd0+iAJhYOMYjU92v0CQC450P3j+i2hytJkoF2l6cOMf3KOKqf2L98tO6Kp+
JLDFr57zmUEYvReYnO5+p/wiU8FlcyqvL1AvmRnv4FvLuSd7nOe3TrYe8+0YTZNm
Ftqjl6F1cdvMSoCBkHcBNhvkYGAMeXAMWcadt2VixyEb3SgDQiAdl+jY1sDVgZIp
oZLDtMS/IdWZKLQxdHcyPIMPPOcldhY11mdf4xrE29eZiiNL0ajR8xqW3X5FX5sp
w6QVIKwJk83TuPDmWHDAjPEG04a/hHjt8chl5VnbyO1uRmoq45Xh585XxVzOexHO
lTXbc4emxlS1aoz08U0h
=z43L
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
