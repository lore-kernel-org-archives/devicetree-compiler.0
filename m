From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,08/13] libfdt: Add fdt_path_offset_namelen
Date: Sun, 21 Aug 2016 11:07:29 -0400
Message-ID: <20160821150729.GA5342@bill-the-cat>
References: <20160705082646.25044-9-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="csti59zOqP8qx56L"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xfnDT+GDs5l0E8W9/uHF0AP45UIGfQJ1EehL711+lWY=;
        b=cEG/x0T4oKRHDDa1HLYqkbXDBS0qX4Lmm85GPjwHvIpB0kA0yp6nCZzZWmjV0u5UBN
         OsIMr1C0gfmnv2mCl09jkTjERLGJT9jUAIo/8EakAdcb4jkibi643h1fNW5dgrmBYiPS
         uwgjC5LRf0RH/GPlBwFztslxJhq1guJpWXEwg=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-9-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--csti59zOqP8qx56L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:41AM +0200, Maxime Ripard wrote:

> Add a namelen variant of fdt_path_offset to retrieve the node offset using
> only a fixed number of characters.
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--csti59zOqP8qx56L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOxAAoJEIf59jXTHXZSeh4P/jdHq5z4yO7jhuhEbl8+BFb1
eT7V4uj83E8vz1u/LjTTcLJSXLiMGe2Ml+HKF7CRKxNYA+vFWnNeJST3juw/7/4l
QOShno/R46tiOgHVzmJbu2FHsf41sKr/FwvLPJgUWU+CuAIS4N1OsZgPYECcnQ7x
4exmRzQJRJyBVpy6YwVnQ257YDLEzwiJastmM3yjyUFx3MMeZW8YPa1dCb+Ak0Vl
pS01yIQl4aJXrntEVTZdwmFzJSAsQLliany5unVYz1N2QKw8p8C+7/6HsDflP+Gg
BB6WK+gSCv6vVc2qPvwaOJ3ORQblPD7kljQ0lYiHYlN+7r4sNNIdD/fuNjh2Dyc+
3yeKqdRU4sJUs0ZvBfXtw2DdXhOOo49XZIGHLiYI+y2bfKaNxfAFAsT6L/N5H1l0
to+J7ZimdLuL6I6Czw0/tbMph+DbLURVTmNYgCsBGaY0CxuVFNG8S7KZLz5zK1LO
uVe/MpcV2QYqjzF9bNzJMETloVsmV9USUB4fsJKpJwBNhsew9F5bryqknL1tcM8e
VgNy6PCreBSKlmOaovY2qoY2o1anjo6TKK+pHi0BXaAIhorr+dZUGQdPbsf8nOyi
QVBw3TBYOOwwTdLW/3k0vCzVaKPWEC9uj1UBqA/fSBcIEDl4v9R2rv5S8PsX8Dkl
aFkOvahgqYoJQAklXCTP
=e/v0
-----END PGP SIGNATURE-----

--csti59zOqP8qx56L--
