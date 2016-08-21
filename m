From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,02/13] scripts: Makefile.lib: Sanitize DTB names
Date: Sun, 21 Aug 2016 11:06:54 -0400
Message-ID: <20160821150654.GU5342@bill-the-cat>
References: <20160705082646.25044-3-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EDQ/wMYGX5nr2pOQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AHn/+KbdwQuj1DrOMqtXqEMd8Z1P6oKXD+7s6sIlbSU=;
        b=Lc4I2amb7cY1xif5Lda8xIXN2aMHlx/ZFkI65xIPcjendKmv/1lG7j8/11+0bRLzXH
         OFg+cZjOPQupPXA/Ve90VA8eV2S0fytw9Qml+h2TR/RVGlnb+4aAflu6o3MrEsefM62z
         baii5KlgZ1RtgpODIL7qGaNVY6Yqy5R8KeZzg=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-3-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--EDQ/wMYGX5nr2pOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:35AM +0200, Maxime Ripard wrote:

> Having dashes as a separator in the DTB name is a quite common practice.
>=20
> However, the current code to generate objects from DTBs assumes the
> separator is an underscore, leading to a compilation error when building a
> device tree with dashes.
>=20
> Replace all the dashes in the DTB name to generate the symbols name, which
> should solve this issue.
>=20
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--EDQ/wMYGX5nr2pOQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOOAAoJEIf59jXTHXZS6GEP/it5PlQ1n3nSWpmvq3sX8zis
nN/brNf+3Sgn9Ke2sO5SEqz5nXcBfEJ9Vu1ptXLpe7l3zceJD3G3hCLbXWmn8tCN
edECRs6K57Hvog0efIqfXQK/QztUJgbURdF/AJgj4KveteQwMnKszNxGmhW1dP0U
+FRmpO27y3c9sIPA34iNhSSDFs4RiZ2utTat0cUPdnVdkdJvW5Aag3N3rif2gkTJ
7JGP9mDgFx8OwBKBYkHJyeEwBG3IrvLr+HZUdsbwJTVqTw/FD4ppbVqV6EANGDnE
NKAoPe0K/L1vVweQQmC6ZcVMT+lsQWXqYej25hoX/uQj0wf73RopYWtFz1XKtkSM
sFH16P7Xt6E0fEF1xoYRux3Y5fVYq4YyY4HkcfAAIe9cwXvJQQJxlcfh9TOl0ZT/
RWvKKWJjZT0DtvvjR+/vipnMnB0jH5I+8k6VWMq5Gelj8SAv1u9pzapjJ/yfeSCg
8bJ/iEU4y97k3mhvkp811zxMefIATcYqgVJHs4c/MoeRiTsC8qMa1Z6VZpF41QVa
UhPKQoAgb0Xj4vTXT1LC9xPzDaA1txTm3thk94+vFOgSycRljaO/TI0Q36NnzJc8
hTHZ2N5w76hpmiUf0H/sl8MYjiEvKY4Fkw+eI5EPaJh1UboFnTbz6qiH4I61y/cd
ilKMgWOmqzif793/VY4a
=EHsw
-----END PGP SIGNATURE-----

--EDQ/wMYGX5nr2pOQ--
