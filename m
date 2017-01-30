From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] manual: Fix typo it -> in
Date: Mon, 30 Jan 2017 12:32:07 +1100
Message-ID: <20170130013207.GD14757@umbus>
References: <20170125193034.12180-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1485748730;
        bh=bi4bMPwF3HklwRNgOfCpd7SSuyjlmn2dFMiBPMpJcWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fjrPl7cmYdpTASMvQnPhNhEIp1RzvHPHLzUhENH7LpsXIV3vgRpToLgJg95oau2vg
         ohtRRNvu/UasC7NGYkBIyxN8R8gnWiMO1gUy2qWLBQ1xAed1snx5nZy4wbwKM7O+L3
         JvN/Q3+cesESq+MKRQB0WqOZ1BoQuVn7FHxnvptY=
Content-Disposition: inline
In-Reply-To: <20170125193034.12180-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 11:30:34AM -0800, Stephen Boyd wrote:
> Two its in a row can't be right.
>=20
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  Documentation/manual.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 74e27c4c4ee1..2f073501f82b 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -228,7 +228,7 @@ Node may contain sub-nodes to obtain a hierarchical s=
tructure.
>  For example:
> =20
>      - A child node named "childnode" whose unit name is
> -      "childnode at address".  It it turn has a string property
> +      "childnode at address".  It in turn has a string property
>        called "childprop".
> =20
>  	childnode@addresss {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYjpeUAAoJEGw4ysog2bOSRFEP/A/OZvL1TwV5B710aaqFD+cc
DD59pZSGRhhtuQolmiJo3L8ivRJjsrhjeGChmguxj8I5GkS23rxFQhGFQ97sCeWY
xBjVu9/CLzDLxfpwlNrLFN9zshR6eQom1GRFD17JhU2LOSTv1YshWKPaJmSCkE+f
6C0mix1XqthDXwPYSEz94q/8JttR0TuapxSLjDgjcgOlJ6QTR5szpuxUxeN1o4A9
Yj3lnX1mfg8l4OxHb11Gq1qPS/IZYvkHVAT37SzRpxGms/UYUFg/MS0NHFk/06Pm
hVL8EfvTwF1eo2sL79/MeOVUqzxYxJAVE6D5cuRc/tGfI5z9XtJuzKHxSeWa+Kec
3u/gQNOXDY50gVvqjjQlooHURqWJlnQCKR5L3vzYEnyCJtAw2dHhGbWi22f9GQKJ
dBnQGsE4EI9M5xNjEMZUTT4twijER0LD0jWn6TnKmd0wNWAigiOFpD2c23pTsHZy
QI78JlVHdcsZykm4zh/ZtuDm/JQ1hsNmS7hn+w9koGYt3n9mnfq6efdpXj+6JdsL
wwya3HcZpcVY+EPKUSnULfdt2uhe94fZ5nLxnmMuEIjgZER0A3m096ZBv0/pkjTq
dp4vhd3epfFGpoF9SyepUV0TPXtjQk0bX3GKDFgpKbJGaCmfEnqJHXe6nR4fSKWp
6/KB5SF39GM/rs6qs7Nb
=1l6k
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
