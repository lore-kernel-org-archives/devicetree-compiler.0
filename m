From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dtc: fix missing string in usage_opts_help
Date: Tue, 5 Sep 2023 12:00:06 +1000
Message-ID: <ZPaLptpUoz535asg@zatzit>
References: <20230904143104.1941715-1-charles.perry@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JrZZXEzVcan3QMv/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1693882566;
        bh=j5LLuAwmwduNBYMHHADXxPUhCUMdiSuct9gDzRzf6Ss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oB9mnthaYcIu2qoQzy4qgCQbqbIQBfcL6+7zwJREaGRoPoeZWOB8JAouluop30fr7
         zRGQiMjTjYHZ0ucV397FySL81l12ezbHD/0p7ZcgPzTzWEIW24qylPqDjCde+Pr/bo
         r61pFmOR6QTdvRqqMnbedU8qO/J82dtirotH18ck=
Content-Disposition: inline
In-Reply-To: <20230904143104.1941715-1-charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--JrZZXEzVcan3QMv/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2023 at 07:31:03AM -0700, Charles Perry wrote:
> This fixes the output of the `dtc --help` command as the last few
> entries were offset by one.
>=20
> Signed-off-by: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

Merged, thanks.

> ---
> Put the string at the right place in usage_opts_help
>=20
>  dtc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index d2e4e2b..0655c2e 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -105,6 +105,7 @@ static const char * const usage_opts_help[] =3D {
>  	"\n\tEnable/disable warnings (prefix with \"no-\")",
>  	"\n\tEnable/disable errors (prefix with \"no-\")",
>  	"\n\tEnable generation of symbols",
> +	"\n\tPossibly generates a __local_fixups__ and a __fixups__ node at the=
 root node",
>  	"\n\tEnable auto-alias of labels",
>  	"\n\tAnnotate output .dts with input source file and line (-T -T for mo=
re details)",
>  	"\n\tPrint this help and exit",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JrZZXEzVcan3QMv/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmT2i48ACgkQzQJF27ox
2GeuWg/+KnFvFvekigP1mOpDd09xvlA9zn+9sqwnjCU1P+EI+yhUur/f/NGJvrAC
V2TaND7uZe65l6qH8W8SKpq3o5KuegfIhi40gKhiE9RFMZ/USH9ArUwZGuezO8/N
IidECxMFyQioLGxl/BRVFBAyZadxrXiVHLTcfPON/UK/VVQYcIyND0hDho7/DcGW
P1pDKGqJE6hvQxPxr43NJjDwMhHm9QB8IfNqRZaqEluEltmHrb4XKvayIg3zhO85
Qu7jOTx6y/GQw0wRyPzwOv+8qvazgD+YD/Z/6lC7825z5y5VXvsVGQgNN3p3+Bnr
TmEF4mZpkgsRY0aZk3UR8MuUeR+WQL+wfB+5PuZYpKzhJ8CoiTV7CBgPJj/bpHqP
rgp1D3PL6q3XZE/eGNJUfkd1bn3Ec4QjXR/a+9vUAuNpRw3T+a6AOv9oLaWMWRJM
74XLy0clfO14ohvnsPDU6gp3C3aiXQPgHFqa3f60sfZihX4/tiPcbizZoofIJI3+
6Au/fiiHhQhuucMKynBmMwskHhvq4YKmMwATXpMtvPLse6M4NQXRQEN5z5QPhM5y
kppNTK+KeQ/q30stURdmSfCkMgrLIN7wPos9NkiIECwhqjEUvOd2yBIO2xrYXfOw
sdMQG5CJjA6b3YI17pKU9S1kb71FNbXVeGDEj1qslcHn2dOKFhA=
=DuFY
-----END PGP SIGNATURE-----

--JrZZXEzVcan3QMv/--
