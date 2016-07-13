From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] convert-dtsv0-lexer.l: fix memory leak
Date: Wed, 13 Jul 2016 12:04:46 +1000
Message-ID: <20160713020446.GC14615@voom.fritz.box>
References: <1468362950-32027-1-git-send-email-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468376719;
	bh=NujvN7CWjqUeV9/gEobXgmmvpMJYB/ilijz5tP4UcxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m68ATPd5xquq+HgJpcgKds6Hy659GXV24XxCqNcCVCc+gjdO1KsfiRdntQNeDVDOj
	 sF38kx5U/Iu0zUM9REeWf9Rgb3S7TOSSdqULMhDf+SNpuNkF5myRc1kpHwPdJzDZD7
	 3dBxspUxnvQ8pM1Vxtr5sAEOdI+PrYuy8YOluTXA=
Content-Disposition: inline
In-Reply-To: <1468362950-32027-1-git-send-email-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 12:35:50AM +0200, Jean-Christophe Dubois wrote:
> CID 132822 (#1 of 1): Resource leak (RESOURCE_LEAK)
> 9. leaked_storage: Variable newname going out of scope leaks the storage =
it points to
>=20
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
> ---
>  convert-dtsv0-lexer.l | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
> index 259e527..8d8289b 100644
> --- a/convert-dtsv0-lexer.l
> +++ b/convert-dtsv0-lexer.l
> @@ -208,6 +208,12 @@ static void convert_file(const char *fname)
>  	char *newname;
> =20
>  	newname =3D xmalloc(len + sizeof(suffix));
> +
> +	if (!newname) {
> +		die("failed to allocate memory for input file %s: %s\n",
> +		    fname, strerror(errno));
> +	}
> +

This hunk is unnecessary.  xmalloc() already die()s rather than failing.

>  	memcpy(newname, fname, len);
>  	memcpy(newname + len, suffix, sizeof(suffix));
> =20
> @@ -223,6 +229,8 @@ static void convert_file(const char *fname)
> =20
>  	while(yylex())
>  		;
> +
> +	free(newname);
>  }
> =20
>  int main(int argc, char *argv[])

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhaG+AAoJEGw4ysog2bOSOJ0QAMMDyzwZ1V6MZ9yB5ny0R38M
tsvCt0cm38Lom/XTWjB0ECHQyi2tEKEK42PBlKRv4tejkOimSGFNwZVySWf/ETYA
7QyK4tRDqbe+d06FNNRSVjTxuFBER915NHdEiFHbkopSfGNmfe8yupGBU4R6BAMF
NouthGu0nSa6D1HemfdorsCdL1GkEgHhxtlEsWB/oq96BFL3s0y1skjdaotKLFbE
UX+TP7Qe1PbWiEIfnxFp3rc4UER7swYt3jUY8D0WCukVsDJZp4xsD1MqUTKF2f2z
kCHFxKCP35eup6gKmExhfaDVXInXVj0h+d9WMMLmjiANAKK/2t9YlEBL7i9/J4kc
ApeW2hI5fcVlXId0W7xko6ocLM87gJSJQ0/9A0ToNyRZx0vVCAUGNONC8cEfRN9H
mpQUmvgMKBwmW2L2ipU0Yv5wf1NfG3zsD7kX/yfPwef3Vbfd17Ac5h3ALB6M8USn
OZuSw2OHVrSFeOdWJpXXSpldZGNeh561wU77Csi9PSq1sKAy5Dw/PLY4M7hMTXJU
zjwwOHTtLbWumxHRVfbSejZI5pksKQd4pwKoM/ZMsTNdQm32VmMxq99W/Avl9sTb
k4tf60FuJyM0XU6p2Lr/bHOtG262XcvXpOMyOI6XaWHowREM3Z1I7H7FIyV47ooh
ptjy8bny33kbE6F4wZoe
=RHcO
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
