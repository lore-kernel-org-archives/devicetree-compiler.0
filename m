From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] dtc: fix missing string in usage_opts_help
Date: Mon, 4 Sep 2023 12:51:18 +1000
Message-ID: <ZPVGJrsOKaKyOrmu@zatzit>
References: <20230904020058.1935334-1-charles.perry@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IfX5BDwHSWlUbSC6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1693804454;
        bh=2qr5ltDTRuh9Kaea8jdj2rYoQvp+UadpZxxPQbxXVSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QmHARmE2lxNbeYj8+q+lT1mxstX3HCY1vk4u3hpEx37vGCM72j6JDjxCuKx6Hlo8u
         sTiqnJgE1Sp6FhDeKIFqbA7YHiV7abm7pZL4iUfM7bhASjGt8TLjchYk/n9i5KLLD0
         1xuebnrWCp1zpv/5lMLlCQJCEVMg8hQleAnhE5lY=
Content-Disposition: inline
In-Reply-To: <20230904020058.1935334-1-charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--IfX5BDwHSWlUbSC6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 03, 2023 at 07:00:57PM -0700, Charles Perry wrote:
> This fixes the output of the `dtc --help` command as the last few
> entries were offset by one.
>=20
> Signed-off-by: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

Good catch, but when I apply this the descriptions still don't line up
with the correct options.  I think the new entry has been added in the
wrong order?

> ---
>  dtc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index d2e4e2b..775d527 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -107,6 +107,7 @@ static const char * const usage_opts_help[] =3D {
>  	"\n\tEnable generation of symbols",
>  	"\n\tEnable auto-alias of labels",
>  	"\n\tAnnotate output .dts with input source file and line (-T -T for mo=
re details)",
> +	"\n\tPossibly generates a __local_fixups__ and a __fixups__ node at the=
 root node",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
>  	NULL,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IfX5BDwHSWlUbSC6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmT1RgcACgkQzQJF27ox
2GfehA/8D8Dxro6KcxTlr9gUL2Ue+qVT/weA2Qv2qIvYjC+VCvbrOIM9/TkwWQro
EPkkosK/NBQNqHKw3qGuazfz+RnVL97q6kHnCx9k8+/ms9E/ci4FI8YCl31gov3t
tel1rCcVXk1StDPSnrTJdDeQrP9wFgQceV/OvEZ/dRSpIMcCHKGZot3QncUiE+lY
msw2IcZgMoO41+bJXTec3YMC5+F8DCpiOkx8zGzcDNKxQvw334qBNp6hznUO3Ovw
U+ajcRMgF04/hHLKbFvRBoQkcg6m2qui06rcDFd2gE7MMeVlgpCDGqdEmoY9Swg4
xXb+1VvUN2hHd9tdyEb1rk9iGKwDIgW+yxGYR3RpgH0Y+gzjzMVYilMJhM4X7fcw
Q7X/ChmH1z18X9KL0vH5z0NKAIH4rqY6mbIE2j/SReOnfrZXMPikThmXXqiSV+2U
oPx5OpVdF4ILb4w/jd6kWFKktT2Ix3DYXkne+46BOVOxpD4iHprpdmVLf1FP0oDV
bKAHHcrvtlw4ylswJ0TM6N1lqSWo87qx4qbejqBepyEpHFWhLXKk0V0WpHR2z2/S
EZsF7cWp16Itr4zN1AsmMnYmegP1O2gqGUQNIti+aCdY3fUjLPSBGZmyShFaYVqN
QPvGqs1afaaPO/BNFdUXderCGGdFczYf8wN6AS8KhggPB432RAk=
=w80Z
-----END PGP SIGNATURE-----

--IfX5BDwHSWlUbSC6--
