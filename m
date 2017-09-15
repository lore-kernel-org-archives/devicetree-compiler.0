From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Patch for device tree compiler, export stringlist functions
 (resend as text/plain hopefully)
Date: Fri, 15 Sep 2017 16:39:50 +1000
Message-ID: <20170915063950.GH5250@umbus.fritz.box>
References: <DB6PR0701MB271276D697034D3480A0F2A7F96F0@DB6PR0701MB2712.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1505463317;
        bh=WSI+4ZFCjXXcCfjXQu2EAnhguYH4QjnXl9qlMRrTwLM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WRPbnruUtBP3KnttD70nsRxG1s08a/kSoj78tSpUuV9TyqfJlT5qQ3NTXY1UzgIxU
         YClBmrL2QQe7+l34lqqgo8Fj4FdKVal59IogCRwUSOqzl4VXLlmXDkAJhMuSYfKsjf
         +FPjF62hQ90wFxGZG635xx/ptyVLPl/KURSws4Qs=
Content-Disposition: inline
In-Reply-To: <DB6PR0701MB271276D697034D3480A0F2A7F96F0-5NEnem0e2WEkGHNhdFSn+TMcllmSiLMWnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "Huober, Reiner (Nokia - DE/Ulm)" <reiner.huober-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2017 at 01:23:13PM +0000, Huober, Reiner (Nokia - DE/Ulm) w=
rote:
> Hi
>=20
> (resend as plain text hopefully)

It came through as plain text ok, but for future reference, it's
preferred to include patches inline, rather than as an attachment.
>=20
> I have a patch for libfdt inside the device tree compiler. It add
> missing exports to the linker script

Patch looks good, but I'll need a Signed-off-by line in order to apply
it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm7dbYACgkQbDjKyiDZ
s5JdNxAAlm2/4eEcuHXvNlGOYxTxQWfB1ZiDBb3O3984z46d+nwonsmrLxZDjUBE
+4ckRkQBfZxFH1kL0ohJuNw2yt6posBJpfaT+YXhadx/AzNlsFttK2Jiy/g+t0VK
EQMomLvTtCGCSCCt+HAdbcjHrykbvDkiwc+DQRcbJoD/fIi6eA+eKDmaZqCi+WXU
qtkOfqvy6keBcoLi1ba+BTfh3vjTNZzVxpsHRYi1Gh3gZP41TCrPWzdYGzqvDbJc
wEd6aXAiQ2TCi6NiQQooUp6CdFkUed7951XRrlpPw+P1LMDKaMTMeADKbJ6JdI9P
Wuh4JC+qneFn96WJ3zRrMGKnVV8W6gQNCcRGjSukNAwx1zQM5rwxQzRXxaprlRnl
rH5rvVcdwXML3zC64I/L3vn/XaHv4tpmINsACrR3Gt13t3faC0uW/BTCMLwFRovb
fzf7jREhsT4szP3dikajBhxEl9131hM5MHoMZ5UqH7gnEfZT+Lj5vb5WQ2jO6DvU
GM8fucB9Mx0jOBrYkLuu0X0XZqQKtP6zSJAVV5heF6W8BnTayJt0xu6LxLy0qrRN
71O16D32eUTeS+yPl4YgKXPxiqaAIyFk+w24xIRJU4Xov2o8y+6tqi9qAuvFdKlo
U3HgpW0rFZxnXR5XclDGNugkxWVg8vmrABBCAyxr0h3XWiy/2hI=
=LbZF
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--
