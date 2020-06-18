From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: trivial typo fix
Date: Thu, 18 Jun 2020 16:26:51 +1000
Message-ID: <20200618062651.GA17085@umbus.fritz.box>
References: <20200618042117.131731-1-patrick.oppenlander@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1592463073;
        bh=sTcNpiJRF/Pw76lgvA+/1KEaBA4ez99SOhw4adFjuN8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UVRdxShhorvcEvybYMv2FhofXVx4oSCmikwh/hCxjPEio0V0jYn09ACOkJS4A2We3
         fuC/vkzc4Qmcqn42K0DNmTbp42ghXtsDfsNw5f8MxskWoFuiBQjOUJ916TPcBnOO8S
         +ac2PJj7R6pYCHM9whvuGuuB2yh/vjuGl7mPT0os=
Content-Disposition: inline
In-Reply-To: <20200618042117.131731-1-patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 02:21:17PM +1000, patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wro=
te:
> From: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Signed-off-by: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_sw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 26759d5..94ce4bb 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -32,7 +32,7 @@ static int fdt_sw_probe_(void *fdt)
>  /* 'memrsv' state:	Initial state after fdt_create()
>   *
>   * Allowed functions:
> - *	fdt_add_reservmap_entry()
> + *	fdt_add_reservemap_entry()
>   *	fdt_finish_reservemap()		[moves to 'struct' state]
>   */
>  static int fdt_sw_probe_memrsv_(void *fdt)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7rCSgACgkQbDjKyiDZ
s5LsJA//SQqcQbtulgXWwgzoVLuDdlFLSTvy13dmA7iJaWCWXzf8lnxfdtMHZCpL
RvcL4K67RfbQ45yzfAavl134gYFMyoD3yombIDziYfkxJ13U6VsceizCv7gW95LF
uZF2VnDlUNVPTzbx7Jmu2JPBcTSrG46sgTpc+h7s20EFHMwkUKiaHYi1R5F2U6ha
JO0wrwt6I2qybof1EiiYa6GYtDqi3KNkaQa7Cgh4EtjwQMM2uqkQLttFdwTKuVKm
D8G/Optl9WMRVUDCMnSAT+txMxo8yIrHod1f7nb+oTxjHlKyRxDFH5ROkhw6xS5f
xGpxoj3FrA6lg6M5f6Q9g6W1EG+glkkSQfGqRBwYC+1WJFLl/CXw/AZZyyBuFKqv
bRM3FRch5g8N8sL7cXly6AseB1w/8eb6qdJ9ozulWVcYyiUQQlaq+BfNqgd5GtXf
Om6iDtGMpAn6Ox7XiAmhhNBS+FVfXV+6m4p/sedUPDgj8IR8bMz9IzebOm9UQHD8
OuBW9D/k7nESdWjzZjhOZxl+2hN+W7eqXI+IYydcZFhqEkM0FA9eJSFuSCtT6q9v
O/jxPX7mnFFVD0GTvGfjVoJF+09sJy32CIVcWGwpQudvWHopg8Ta7bomZYC2e8o4
w5P76+daPdzTPmEAtYp6gSp4A9hzBRmc4wgCPQyTaXb2hHeB6aU=
=YzI9
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
