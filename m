From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 09/12] libfdt: Add fdt_getprop_namelen_w
Date: Mon, 27 Jun 2016 01:49:29 +1000
Message-ID: <20160626154929.GT15625@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-10-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638813535=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1466956117;
 bh=rRkiaP5SEeCiVMolYSvOAmXECvVLmzQZIA+0szvGV4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YlAHvZ8bCiSlmQgSYM7CRHtk7ahzSEACYFYRfos/50yVApYT8nhF0HTomu9Y+nELE
 DxwRhur1YkF+quZM1c6e+zNit4xU3EX2ManxiWNM8aCKuw4Z7q5J2MJRUHLJJSZ7Qu
 7uI4N0YafovNVFPhlVf54ZcBnTRRgetABEioxQDM=
In-Reply-To: <20160624142757.32735-10-maxime.ripard@free-electrons.com>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alexander Kaplan <alex@nextthing.co>, devicetree-compiler@vger.kernel.org


--===============1638813535==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fberPwKQctZF/fXp"
Content-Disposition: inline


--fberPwKQctZF/fXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 04:27:54PM +0200, Maxime Ripard wrote:
> Add a function to retrieve a writeable property only by the first
> characters of its name.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  include/libfdt.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index dbe8a0efca87..b8758de3ae54 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -619,6 +619,13 @@ const void *fdt_getprop_by_offset(const void *fdt, i=
nt offset,
>   */
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>  				const char *name, int namelen, int *lenp);
> +static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
> +					  const char *name, int namelen,
> +					  int *lenp)
> +{
> +	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
> +						      namelen, lenp);
> +}

I believe you used this in your new setprop_inpace implementation.  So
the series needs to be re-ordered to avoid breaking bisection.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fberPwKQctZF/fXp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb/mJAAoJEGw4ysog2bOSBsIP/jwQ/GbX4XIQfgtsR0T7UfTY
XAZ4cDY5fGOob3SzWREu+vsU98xNHJ9g+Zr/OCTw5i6dMQpLDEN5bctjlkcauPer
25MuII0sKGaMeuKfD5UWxr9m4kG0d11Bm00PQ+syqMqfRFBpuYoTDpthscQrMsWe
WxG5YQ3bsaGNDfeKGxjUcqsFM5GfvJ2wlqkBfolPlfiwOzOkCec5iaNuKTEy0f47
FrZe2WRaejtHT4+9LOAsxjLFCi9Ftdc+L1xEVzl3MdkaqI1s7GgC1KPsCV+K7jhM
nfYaQ5dbpfVFi6tsxQN2mr1AsXHrnOfwKJJP6roRro4QP6fxYFpcgOHJGz2lVRRd
BXrSGMItgoKzy/KUEoEEQX+QS/MHEwKmlec+f4NWPMWZ23p40o6jbRPpMGnQaT3a
Jz6Y11NyPIRj6cKgr1R4LUuGD9gQH3hRsRc1owF88Xy0pTvGM22liPD7418SI2ic
oxKO5VSpT4+vHuxecbTu/9kuzQI9ooe9LxOwTimt8R+ZWiO6+Ro2rSUg2SMj8qMD
KNyOSwjHmWC7Lj5sovAteyF3RmZ5vaY+kiyEmZG2uQF/u8XZ/296oJVi/qg5dDk8
n6BEX2wDYOP8hGU0zG3QQ9mMggIauMb5savnXW4QKW1wZmJblPJC7Z7iTHmr1QB+
92w0OSioZmazn64LiLPk
=TiG/
-----END PGP SIGNATURE-----

--fberPwKQctZF/fXp--

--===============1638813535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1638813535==--
