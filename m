From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,13/13] tests: Introduce DT overlay tests
Date: Sun, 21 Aug 2016 11:08:07 -0400
Message-ID: <20160821150807.GF5342@bill-the-cat>
References: <20160705082646.25044-14-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ROA1rv1+fHr2QGor"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6gsxEGwCCj6+e1KOmWiDSQwmZgEhK1rQnnF4bLzLxB4=;
        b=bKAqwUByqSJdpWhScek5epWddFn4T7fYD2koE6Q6NmSxnossMTiw3jDWla451Dcali
         tcRHfE9bw9TqTGinfUHTu2QJVaik/p62EybuRhKRtyiY+NfmERyOm6v/3tgYu5EmS8ad
         K0bezawGfPy/PMWq+AAL/BSTR/dnAa6G6Ccxs=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-14-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--ROA1rv1+fHr2QGor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:46AM +0200, Maxime Ripard wrote:

> This adds a bunch of unit tests for the "fdt apply" command.
>=20
> They've all been run successfully in the sandbox. However, as you still
> require an out-of-tree dtc with overlay support, this is disabled by
> default.
>=20
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--ROA1rv1+fHr2QGor
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucPXAAoJEIf59jXTHXZSVGQP/j6/VDDTOgSny7leepCNdGSM
kVEDynLUX/PY488BKYzVZzf89jce1TnO3YOuvHh3k5xrwKAZEKE7uuxt6J7+K2xZ
HcqB2zJ14fzWHtWS/fuEqSOtzfTd0+Km6SnHpBwrpMVrdXFunfarMqGelug6AXu8
qlN0acX8H6moZNHJ+lsWQ9km40AInKHMwcrbsj2S0tEKYxm19vEI50vcRW8EMowo
qIKmwKcksixfYLq1u6A3X4kU+lwLe1D2QpT2I1Qv7O0rUEEq0u5vPKZaoNekzfUA
QGVKRcDzhwPD4euHfkPQPNd6OxQfuNZmp5a65kGQWIi8q4g8AQkgmg7StwnXtHSy
v5pNXOkcWesA5TrIyee4EhpS2JqtcSwpITTi0Qy6e0UFo1p3g5B1o3RoGiWowcG1
oYGjJ20Qn4ZPjJKf1K081kNWmKtodutJNyhD2RQyf+yeHhNvumb6GDIPL1jObQP9
syW66a+psEmbEIlBCQ03RNmThw3sFP5MGBpvLdsflUZ5qNN/LiYDReT0ev81rhUS
+jreGG/8hnTRRNG5jNsmoByR2qMdMW2L7JIIJYSJhuW4BDTguzIIuXmn0RYxqTo0
F8qdl1aDktUE4MLvJTsvkzq9TxN+FCsZJzTvQM9GhNxbTr9AlbQPCAnOZHgcD8A4
Lw8VlMk24TQLueFRfxO7
=lGSo
-----END PGP SIGNATURE-----

--ROA1rv1+fHr2QGor--
