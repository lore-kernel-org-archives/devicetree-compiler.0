From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Sun, 21 Jan 2018 20:40:19 +1100
Message-ID: <20180121094019.GA28199@umbus>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20180119214803.24934-1-nwhitehorn@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516527634;
        bh=8dro0lNlUJeCj5O6bjGpoW20mcBPXVUkSFpZzIZqGc4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eBGVc86CLiUyd7ibgPTt9G1jECIMcCMsU2sZR0IaKoH0gO38XLeK1g7hnPlHo9tTM
         DzrAn8Ui6FAPphTfr0WNqdzW/4TiUmoqSqFH1Hc0XPKxmRY1KMHhZKBMjcjul48u3E
         ihsChP8L6uEowrghhIlCXkfLCZTQtH9DbfeIRPis=
Content-Disposition: inline
In-Reply-To: <20180119214803.24934-1-nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2018 at 09:48:03PM +0000, nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org wrote:
> From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>=20
> This can be useful in particular in the kernel when booting on systems
> with FDT-emitting firmware that is out of date. Releases of kexec-tools
> on ppc64 prior to the end of 2014 are notable examples of such.
>=20
> Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> ---
>=20
> This version of the patch fixes a number of style issues and removes some
> unnecessary redundant code noted in review.

As suggested, please implement the change to use
fdt_get_property_namelen_() in fdt_getprop_namelen().  Plus I spotted
one other bug..

[snip]
> +	if (fdt_version(fdt) < 0x10) {
> +		/*
> +		 * For old FDT versions, match the naming conventions of V16:
> +		 * give only the leaf name (after all /). The actual tree
> +		 * contents are loosely checked.
> +		 */
> +		const char *leaf;
> +		leaf =3D strrchr(nameptr, '/');
> +		if (leaf =3D=3D NULL) {
> +			err =3D FDT_ERR_BADVALUE;

The error codes are defined positive, but used negative, so this needs
to be err =3D -FDT_ERR_BADVAULE,  Except, actually, I think BADSTRUCTURE
would be a better option.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpkYAAACgkQbDjKyiDZ
s5Lgmw/8CDzlG+4J1rl3A1SMNvcszoIuOsWcXF0yJ4gz6jmq3fXTGDxWzHveJMCf
C2wXP4IqsSMXUO9Xr9ZAqL1fRh5Ur5ftF8tvU2WZ3QJ9d/TFcAJSStyd0+SA4nA8
5QGRTmH2PCmnz5okmJNEmS1ZYxBfG67FJRutmZuQ//6W5XVkTc91lqKafntKKiYs
kiRp3BpFdCLQcl5+oHS9A7pdkDyE848RqDiJrYs+Fmk7W0fyt8s4uNbzjjSTDeeA
8/Ys0/1tU/Zfb5kY+NgVw/d6cA8ciZI7jjNsOeLmMAJ7dtpwk8ky7ZlPco6UhQKh
MZZ4v8sgxt2YP3qMuBLVha/+fr2fEqP/frqH2PiasTb0MJ7bVjlL039QuNjXw94I
WmMic0uBzVrkJA0xpH/BvftdmuP+V0kcdzmN2Mo2du/8rry8UcKBDuRMope4Q40g
Vcq3X7YmpzTRCSsEqWVsvhHGlsZ07JL7e6UVE/xSdmhocxekfsw+GnQ/VvVt07Pk
pYWnCRm0fc3ESRIimshhvICWqFTD7bSz4U2CwOxZ5v4oMCzqIMzD6fSz9dnMFCpv
CBkUAkBzR9CcmWEseq+pRVYQbV9bk3CEWUQUjxUlxRY1eFFahI9c0uaaMkmCGpzG
A2Q9fLF5KgWuVqpbJwn3XUGRcWCdAgkZEtY7PpR/1YoRtyuA2/I=
=3tyg
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
