Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A70612CDBC
	for <devicetree-compiler@vger.kernel.org>; Fri, 16 Feb 2024 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708117609; cv=none; b=XqsSswJxZaU9YUN/d3XAYTg4Wv/9aaDjEJuCw15OP8rdSHYYqlx1P+ZsW79uEUdGhG9wqt1fZ3T/WaVGoA06rAFTk7A0xfuzQETp1R1t1laDcM8eEbHmzduIOKNn/GdJE0JZ5LGqe808YIk7CfDM7VWmZVu/RhjtiWl+IYs3EI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708117609; c=relaxed/simple;
	bh=DHw0kI96klS8YsV1yjSd5VSIN7Rj86wG/BJ5W+ZhfW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAG9ohiz5gHLj+Ujf+OHw/fFdHnqeOekQn2wgUi5wYKtkRVr/mRk97fQ0wadPCU4jy6IFyaOvBvJJSxEblDvymb9SMC1XcEdqhDo6lwFq/OHd1KDaIahGAis2Qwip7FQsBV6QyljDyfSSAl+KbkiCmzYeph38d/WaT0D8aJr93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rb5Pq-0004Fj-T3; Fri, 16 Feb 2024 22:06:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rb5Pp-0018pp-Nc; Fri, 16 Feb 2024 22:06:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rb5Pp-006I4b-26;
	Fri, 16 Feb 2024 22:06:37 +0100
Date: Fri, 16 Feb 2024 22:06:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>, 
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <fgyaporsv6l5jqtseabnhzykf4xlfwrxmnpokqanxoyfkzkkfi@kkdu7cfdkgnt>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yamb2yugmupnwza"
Content-Disposition: inline
In-Reply-To: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org


--4yamb2yugmupnwza
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Feb 16, 2024 at 07:19:20PM +0100, Uwe Kleine-K=F6nig wrote:
> A phandle in an overlay is not supposed to overwrite a phandle that
> already exists in the base dtb as this breaks references to the
> respective node in the base.
>=20
> So add another iteration over the fdto that checks for such overwrites
> and fixes the fdto phandle's value to match the fdt's.
>=20
> A test is added that checks that newly added phandles and existing
> phandles work as expected.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

After sending the patch out I had a nice idea for an optimisation here.
It doesn't make the process faster, but improves the result.

If phandle with the (shifted) value 17 is changed to 5, there is no
phandle with the value 17 in the end. So while iterating over the fdto
to replace all phandles with value 17 by 5 all values > 17 can be
reduced by one. This way the phandle allocation in the resulting dtb is
continuous if both inputs have continuous numbers.

This can be implemented by the patch below on top of the patch I'm
replying to.

Best regards
Uwe

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 914acc5b14a6..bfdba50dee50 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -529,15 +529,25 @@ static int overlay_adjust_node_conflicting_phandle(vo=
id *fdto, int node,
 	int child;
=20
 	php =3D fdt_getprop(fdto, node, "phandle", &len);
-	if (php && len =3D=3D sizeof(*php) && fdt32_to_cpu(*php) =3D=3D fdto_phan=
dle) {
-		ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
+	if (php && len =3D=3D sizeof(*php)) {
+		if (fdt32_to_cpu(*php) =3D=3D fdto_phandle)
+			ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
+		else if (fdt32_to_cpu(*php) > fdto_phandle)
+			ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt32_to_cpu(*ph=
p) - 1);
+		else
+			ret =3D 0;
 		if (ret)
 			return ret;
 	}
=20
 	php =3D fdt_getprop(fdto, node, "linux,phandle", &len);
-	if (php && len =3D=3D sizeof(*php) && fdt32_to_cpu(*php) =3D=3D fdto_phan=
dle) {
-		ret =3D fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phandle=
);
+	if (php && len =3D=3D sizeof(*php)) {
+		if (fdt32_to_cpu(*php) =3D=3D fdto_phandle)
+			ret =3D fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phandl=
e);
+		else if (fdt32_to_cpu(*php) > fdto_phandle)
+			ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt32_to_cpu(*ph=
p) - 1);
+		else
+			ret =3D 0;
 		if (ret)
 			return ret;
 	}
@@ -609,23 +619,27 @@ static int overlay_update_node_conflicting_references=
(void *fdto, int tree_node,
 			 */
 			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
=20
-			if (fdt32_to_cpu(adj_val) =3D=3D fdto_phandle) {
+			if (fdt32_to_cpu(adj_val) < fdto_phandle)
+				continue;
=20
+			if (fdt32_to_cpu(adj_val) =3D=3D fdto_phandle)
 				adj_val =3D cpu_to_fdt32(fdt_phandle);
+			else
+				adj_val =3D cpu_to_fdt32(fdt32_to_cpu(adj_val) - 1);
=20
-				ret =3D fdt_setprop_inplace_namelen_partial(fdto,
-									  tree_node,
-									  name,
-									  strlen(name),
-									  poffset,
-									  &adj_val,
-									  sizeof(adj_val));
-				if (ret =3D=3D -FDT_ERR_NOSPACE)
-					return -FDT_ERR_BADOVERLAY;
=20
-				if (ret)
-					return ret;
-			}
+			ret =3D fdt_setprop_inplace_namelen_partial(fdto,
+								  tree_node,
+								  name,
+								  strlen(name),
+								  poffset,
+								  &adj_val,
+								  sizeof(adj_val));
+			if (ret =3D=3D -FDT_ERR_NOSPACE)
+				return -FDT_ERR_BADOVERLAY;
+
+			if (ret)
+				return ret;
 		}
 	}
=20
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4yamb2yugmupnwza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXPzlwACgkQj4D7WH0S
/k4VJQf/eQKBHIO6lsZdrSKEjZkqgdmYiaWLpenqXYzvSBxjKtNNNAP8iMVaYvRM
gGzM/2erMpmxZfq52oKANpBoK7d0IvHzSn1/MzXVTJgKAiSkVjbpvs6FCkjpGXdK
Qec4VmYY/vfw9QUVJ74eRe1iTlpue7AsJAW0cn0zZkcJCGOAiwNEW8lF4JtIMcDs
fxxRdBpDS7D4Cbg0jSd0fWA/qWRZX96907CRzXwkGZLXl1Y54gYD7PH2SNKVc6dW
4b9fQwvixvnonXjUDLR/bO/kJXbusu9dnB8/QmFSwitCA2pRQTurQkyA3HzO6TaH
ub/0A6lJf2nzAwoEQ2hzF8uvCJLPlg==
=o79H
-----END PGP SIGNATURE-----

--4yamb2yugmupnwza--
