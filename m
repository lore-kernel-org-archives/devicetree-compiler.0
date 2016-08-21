From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,09/13] libfdt: Add fdt_getprop_namelen_w
Date: Sun, 21 Aug 2016 11:07:35 -0400
Message-ID: <20160821150735.GB5342@bill-the-cat>
References: <20160705082646.25044-10-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GjiSaFH9IIUbbImY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ke/THgEBXKqG37DPwk46o2YW48cdXZWCllQtsK3L4RQ=;
        b=KvjCWvm3ih+wWs6+lpAhw8mUw20RrU7ZaVr6Qyp89fn2gDuAuokq1ChzCpMZZd39Sg
         irW7vyUEpbFtolSTkb5ZyW2pPNe5L8ABNuzXS3GgSHSXL4YzST8Lm5VUUEQ7ReygZucv
         XP0GVvfG1Y55z9xlHptS7+S7j6qnQPxEd2UJI=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-10-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--GjiSaFH9IIUbbImY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:42AM +0200, Maxime Ripard wrote:

> Add a function to retrieve a writeable property only by the first
> characters of its name.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--GjiSaFH9IIUbbImY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucO3AAoJEIf59jXTHXZS8aIQAKS1OoQRSSR2pUZzZYgZwszI
kzt+kETzqbyxzK94tNoNZZ3s8E3yWJRdVD+YlyAmGuVyuYFcxCvoo3nFxyskbeNs
a+xAOi7/IK34kbnXS1405ZItBPFAgBYV/lUUWxpovQMr+61MnFinzCGICAPy7HLl
7p2bgo2GPkS1fSwcUp7lkk9zwULfWSsGPEkRI89grTgw2STOe6DSlEo6PPx6LM84
uBjCEtH35smzEMqOKQYFTywEqDY5c595Q7dquK3yvZTWwToQgR8bdAoarHYHo3xG
VFRlWSl3ZbDvcvEP5FaDuEYHRwBgvNOQk2H59qBXwhB1c0gzj/rxLIt1HWGfG4+w
UqIE3GSRyYW/41W1Ileu4vMFEYnd8DdqfdXRHawXiiQLaZaWyY2SFuI6qcEBSE6e
YwWYXHNuHH7AeewQPEOHyDlCDshopiUxKiic7sTUZnb5FqHKcfOsMh+j9gUhoRTH
4SvoPPhhT3K2MUYQEMYffISe5uT5TlkUFIPYoKQ48hO3w5D6kyjmjZVNyMl0wWau
lghF6LvKUuklW4XxKFAd4PynKj+CAuLq0H+4ciReNDpsQkro75APJC9ncPbA+rrK
nGaIYMP3q7ZqPDOM4SicaoiojYJYm9wC02o7XLzpZSG9FGlY45iyjY19qpAe8GAo
eaaaA3pKEQcQsjXM+MHW
=NVun
-----END PGP SIGNATURE-----

--GjiSaFH9IIUbbImY--
