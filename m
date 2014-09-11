From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Update the usage helper message
Date: Thu, 11 Sep 2014 23:29:49 +1000
Message-ID: <20140911132949.GA21036@voom.fritz.box>
References: <1410419797-93754-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410419797-93754-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2014 at 03:16:37PM +0800, Wang Long wrote:
> if #define DEFAULT_FDT_VERSION     17
> The message
> 	Blob version to produce, defaults to %d (for dtb and asm output)
> should be
> 	Blob version to produce, defaults to 17 (for dtb and asm output)
>=20
> This patch fix it, and delete the redundant 't'.
>=20
> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEaPNAAoJEGw4ysog2bOSMFwP/0uS1DfujFiVgxhVDPEDTrcf
zkjWLWQw5BP87yb7sZQ9VlPDN4oOPD6tDdhyFSK6DC4riDT3G/yz6O21kGtA9qrY
AhwZDf98qCDbgoQa3vhVVZBfEpv6+Eddsgb2rIKa+Lb9t8eTYGlqgLMLxEiyb4mq
8fCPhCi+VgPqMU27zC295fJLW8LXEYiGwx9h93vcGYEP6L8DeaDL44zxzFtmln7m
EHduI59muPgHVBq3eyN3Pt9fgjbJt4SRuoQPiUfKlRz0sF/zUsk2wZhymgeQsh06
Q/l1ShXb5BwCheo99/sLOokDaspY3bwweYQfltzRnQBNZ/v1noLXrZ8/PEmKpBOx
Z8KebcREVsXhFsmzUb50VfYpb4/o1+Dbc4rSeHfXwrXM6TCcaTomB64tLLDlFMJy
w8rrhaCrsIlCogNvM6V7rcpPqnnkmw/bP5UinNhkF9ec1SFT4E65VFMOmVph+IPy
GdQZoNlz2EEC5ObbuXAnLJ0FdS0MVwFMOMlJ+assi11DSF2UwazbhKHAVu1Se1U+
MWCgVhT88QgpwRq8sD9NrgTvQw7s+fMjkXFMuBhNLt6Ry9o3zPskLVQyIC0foQLz
b3U8Oi6z3VMXjiS/hr4QDqjevhIbA5M+bVEKVU9XmGQ02CEwY7jfIVYWN9X5BJRT
pSpee+hMwTvjjhz++Qk1
=pwbJ
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
