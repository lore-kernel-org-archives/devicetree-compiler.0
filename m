From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,03/13] vsprintf: Include stdarg for va_list
Date: Sun, 21 Aug 2016 11:06:59 -0400
Message-ID: <20160821150659.GV5342@bill-the-cat>
References: <20160705082646.25044-4-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NZ00oluAJr3A0NMv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OvCPjD7bz+Nk3wKUsbB61YrdRivtzgpcz11yPv6IZ+E=;
        b=LdwbzOxZHGyxCRHBtL+cKe0EA37AsBJy6HNW6FzIlO7U3iMOMTwDxKFUhF8KwEB1Sn
         M4gnUho176ay0Rv8x7q1zmqPt2fUFzMWnV4kQ1evc9J58W/I9sZ5KE917UE1xpVPJdHK
         5mVIGdq/OvPkfM0zxsGU4YzOxKRpN9rQbh1hQ=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-4-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--NZ00oluAJr3A0NMv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:36AM +0200, Maxime Ripard wrote:

> vsprintf.h doesn't include the stdarg.h file, which means that it relies =
on
> the files that include vsprintf.h to include stdarg.h as well.
>=20
> Add an explicit include to avoid build errors when simply including that
> file.
>=20
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--NZ00oluAJr3A0NMv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOTAAoJEIf59jXTHXZSh2kP/RCCq9Uh8BJ3/fpi3c9EVN0o
Jc3I6f8IUoFc6lp+JbSMxvBuZJnQqS5z7t8RSVMcgNMIQanao0fk9jFSd9GlmWGu
GFRkaohuE2xw3Pox38EzuXjz7RJXpTUL1PsKPlay4JXbw59EmwEme4phCBPqs372
8IkKxJjdJ/BOaQVQm58Odj+4gmgercqLKlLSFrGLxK/sh3RQlAlx2ynsSfegFh/H
VYaGZidvdqJ3WNDE+QcYAcwjt22hbcFTxoYpiRFNksBmU7blbfMrLZ7qjcUqHK7Z
aLMHmZgF3Oy/KpHzxU79xatCiJJ6XG13kRDo4WQlB5gKPyjeFH4vUCXI5Gmw49EO
O5oEwSgJ4cs+cDXjniV31+xGIrvfZIaNtJsPFsVTcpeahL1ZuaeddNafJlSvHZkD
cJEhJaw2d3OBVYGIXUM3GzW7KPr9vJSGB09fHW9XiJ6oFmWv6Xya88YqPehL56fB
wtZHESilD7tk4IHTnIRhkzQVjXEhjVu9PSQmqmvw5HKPiDG6o9zO6tp6PVzRphJi
YqdqGicIX4drirLJC2F/hXmqyuXYVj28jStX7P6icQxjFTrWEvz8fS1jE9g55oYr
+Zqq8Jg+wosy2Sf76NouiGtNdp82ULog3gc/+17erO6tBLNyxiOD7OiSvrv17TbF
XZiwQ0hRif+H8+9Qya+A
=pyhW
-----END PGP SIGNATURE-----

--NZ00oluAJr3A0NMv--
