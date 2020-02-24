From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 4/8] libfdt: Add support for disabling sanity checks
Date: Mon, 24 Feb 2020 16:57:35 +1100
Message-ID: <20200224055735.GJ1751@umbus.fritz.box>
References: <20200220214557.176528-1-sjg@chromium.org>
 <20200220214557.176528-5-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1582526632;
        bh=xHxp1Bj5vR1FLmGtNfSKZvPjlsCzGGue68yELlDOgX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h1FNzxe0uC8J+jYp5vdrlzH8//QVfZUrSeTWKpa9z/S+g/SkGvnefGHHYJweX5mxK
         he0w4eVCSFjjOCosUxomi34BQdiqgd3JVO54mNuL9CcU8vme6B+4KliJsq5K2aKhfW
         YpZam4e/PiGjxArL4Ob27kyAIlnZxrYPo2kuGMOQ=
Content-Disposition: inline
In-Reply-To: <20200220214557.176528-5-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 02:45:53PM -0700, Simon Glass wrote:
> Allow enabling ASSUME_VALID_INPUT to disable sanity checks on the device
> tree and the parameters to libfdt. This assumption covers that cases where
> the problem could be with either.

[snip]
> @@ -614,7 +634,8 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
> =20
>  	err =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
>  	if (err)
> -		return (err < 0) ? err : -FDT_ERR_INTERNAL;
> +		return (can_assume(VALID_INPUT) || err < 0) ? err :
> +			-FDT_ERR_INTERNAL;

As noted elsewhere, FDT_ERR_INTERNAL checks can be split out separately.

>  	return nodedepth;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5TZc4ACgkQbDjKyiDZ
s5KNow//Xnz7Eh3lNFKdUkXQz0phRC0I0Lc1w37LQ3l7Zf29JXo0cRfwgofkAZ2D
tVf+ycaYdURuuGfAihKBBgSQQ216Rwc2+qZ2FNAnTnXWw8GlgawYtbhjdbbktf/K
zu6az9yNAY8M6PdD0SR0+nfe3hDY6HSNLmJ8p9Th6KjZLypgitNUL+K+fdGl4ysc
RHTV+UzW3i6UoSIomovQ3GkEm/QIoYD5KHO6KmaU8BKj5MtlYjl/tRIliwFxLxDC
bfhkCV5GJ74fX8Wn0dtuaPXNPhd5n7ryCts7n3lXHHN4sz+F8PTRoqPFdx4N2F3w
vWfKWzXYaw2XsvE6c3Y074a77F8rtBjB27D91LIWF/YcTagca9IQWFEAN4nnSScX
CQr/eS3xlQAJOH9gQ6+tz4mv6K+0M1zYa7ZY3VdqNYcArZhpTd2rzXsTCVvJgRQh
3njf52RCMl8R5UQMomuxT8U+rsA2Oz15Ez6jOVIJBDMY+S7pNlJpqrI7bekdjgDk
FV+fcmczionH35X6CtIpAxq0jYFDSBkiB4OVrmsBgELY7WC+MeKRDwDzCrkSUgrk
4v7um/seLGj6hClWbrLW15oozxqIUGnhy4xqLmq7xJBNQ+zYqgMpnXBrAmP9KtfW
Wx4yIpftYtA4DFUZrXyyKwnuPWFhev+64391jxFAqx4bSYsHJGM=
=yOiG
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--
