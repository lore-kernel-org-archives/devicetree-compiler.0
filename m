From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,12/13] cmd: fdt: add fdt overlay application
 subcommand
Date: Sun, 21 Aug 2016 11:08:01 -0400
Message-ID: <20160821150801.GE5342@bill-the-cat>
References: <20160705082646.25044-13-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="l8YfOjwMha7d9KWK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L2hYMq9syJLqB0lAnaDuiLrWjCcJgvtpBhf75bN2nPo=;
        b=HAFYKg1MIwhRSLE/WLjMAT+xip5uuQZrwuGwKtsydNLJGY3bZAIK5gugQAInSkWdrr
         Smmcq61OhJdvhZlxsU+G/hMa+YA+W/0voh/Heuk3nhXraHIV78nPWrVimd5NyeLAXGUd
         /I0i2HT32LUncELpsfxRRDnJQ1KEgO33BNztc=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-13-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--l8YfOjwMha7d9KWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:45AM +0200, Maxime Ripard wrote:

> The device tree overlays are a good way to deal with user-modifyable
> boards or boards with some kind of an expansion mechanism where we can
> easily plug new board in (like the BBB or the raspberry pi).
>=20
> However, so far, the usual mechanism to deal with it was to have in Linux
> some driver detecting the expansion boards plugged in and then request
> these overlays using the firmware interface.
>=20
> That works in most cases, but in some cases, you might want to have the
> overlays applied before the userspace comes in. Either because the new
> board requires some kind of an early initialization, or because your root
> filesystem is accessed through that expansion board.
>=20
> The easiest solution in such a case is to simply have the component before
> Linux applying that overlay, removing all these drawbacks.
>=20
> Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--l8YfOjwMha7d9KWK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucPRAAoJEIf59jXTHXZS52UQAMCH6auzXqyVaY5/qt2E3K5g
tCcigdPE8POnYSUO8RGSAsQqSGLNuPx0wHym1Ge+H2l8YeeS9cZx+2nG84Xbtc/G
xXz/9LaZlROeikdrgwEHllmR1dL2l5kD+6nK3cSv5Spu54hCnoMse8z7YhbHGmcc
rM4X4/tlKW36lyrbSc9rRccgqFEytg6vX/KQG4MWmpykk+ujmAjkAWKEDeEZlFjp
NSdUNNTcGxsYfFcSKZZc7gmbXuc9m7JiQmjjLDuyCJhPxDjjfK0kaoUCCHfP2I6S
amonqbeh2VIQOunk4bAliVrHcQ8zACZoaMnHqGKpf7cER7PewRSyRBx5fzi2aKfG
TybEtdsKiPFqx87tdYvkmQygNCL9mcUvOSyklM+Nro4eEF2a7hcXF9NRevVBgxZH
EsUmxM72kxAuALoqaqPap5KdN9D/5Q+MlMDiTWfZMsEe4yBiebFDDeM6lqN+MB09
pqGK1lOFnsHRTMPJRv2A9VDAiZDvRBAhxK7yWL7COvhh4Fkk6LBrBom1IUSFiP82
jlEcX9GXdQAzbkMvd4OsHEcgiJfBtAu41KltclGFOKCu4pI7kGkiqn7PPdVUdwkk
N/SdreS2mYJilSIRg6yj08Ml+bvdYUSyGjrIPs28Fqc7iitp4ir4UMX4lK7ccP23
AcHr6i9dsdGloFuK0zjV
=C9PF
-----END PGP SIGNATURE-----

--l8YfOjwMha7d9KWK--
