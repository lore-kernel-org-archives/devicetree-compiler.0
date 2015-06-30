From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/3] allow a second parameter to be the output file name
Date: Tue, 30 Jun 2015 15:11:19 +1000
Message-ID: <20150630051119.GK26353@voom.redhat.com>
References: <1432595483-26153-1-git-send-email-osp@andrep.de>
 <1432595483-26153-4-git-send-email-osp@andrep.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dxRQSzdsN/lOP445"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432595483-26153-4-git-send-email-osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--dxRQSzdsN/lOP445
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 12:11:23AM +0100, Andre Przywara wrote:
> If there is more than one file name specified on the command line,
> assume it is the output file name.
> This allows to use a more intuitive cp-style command line syntax,
> which (together with the input type guessing) allows something like:
> $ dtc input.dts output.dtb
> (or the other way round) to cover the most common usage scenarios.
>=20
> Signed-off-by: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>

Nack to this, sorry.

I'd prefer to model our command line on other compilers, and -o is a
more common convention there.

I would however, accept a patch to guess an output name based on input
name if -o is not specified, allowing the output name to be omitted
entirely in common cases.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dxRQSzdsN/lOP445
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVkiT3AAoJEGw4ysog2bOS/vcQAJ/tPHEDVtJzj6kYiTGWQ3gY
636BckEC41Pslm8awM/GC5nrENSem/+RWyv7HN4yXsjAIK265z0fD6lLiyFskHUK
T6WBla7t0u9R+VnokCIbdE8xi2BgQ3aD0WfGLHUPo1Wc6o9zQQvwSKNH2Sjxg0dF
pVAYT18GkVITY6uLnkxfMC6htwccXjTdhLtkTMLV/GwulNWbusiJG4Q9bHmqu24L
7fJvYsRJTLGPgdOeXiQZpqTVyNWRryDYz6pwzbbg9qwdI7V4ktED7bWRakG6G1S4
UYkJ1A9DBiAt7zBhvbNB2YJL8l7qRbe12/Qis2ClW9Mnh89363q7I0cXtPBS7lK3
BRAq3iu/aeYN/CXOADLrbT9KpPlj2o5TEqifwkfXCm4mRBr87ep1L0/FYMWj7lBi
LbHGBI3AqhWnpiWXO51Ilw7DrYPlBaMM9TleiE5pnOIzSSFvmwZMo8miXTfwED7C
3+dOp2R9EyZV/miKsKvrxcqwrIkk1NkvHqbdWFwJWOmdowuTaUuffsLsimzny9mA
ekXxz517ZD1pzI8IiL4nrd3Ut5tbO3KbBjV4i+F/sBAgT3s7wCA4DQ9c4CSIMWR9
AjIubLon2Kx0EmHFHjS5khvhbRSFnFlq3tceKdz5haZZEhkQOvY94SqE9xGaDdWh
6DZJ8MA4M9ToP2KYmxm8
=m+Ai
-----END PGP SIGNATURE-----

--dxRQSzdsN/lOP445--
