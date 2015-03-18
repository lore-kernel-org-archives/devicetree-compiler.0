From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add missing functions to shared library
Date: Wed, 18 Mar 2015 11:41:09 +1100
Message-ID: <20150318004109.GM5741@voom.redhat.com>
References: <1426608034-27189-1-git-send-email-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYjDATHXTWnytHRU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426608034-27189-1-git-send-email-julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--zYjDATHXTWnytHRU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 04:00:34PM +0000, Julien Grall wrote:
> The commit 4e76ec7 "libfdt: Add fdt_next_subnode() to permit easy
> subnode iteration" adds new functions (fdt_{first,next}_subnode) but
> forgot to mark them as 'global' in the shared library.
>=20
> Signed-off-by: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Good catch, thanks.

Applied.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zYjDATHXTWnytHRU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVCMmlAAoJEGw4ysog2bOSNTcP/1T1dOJwGt3+f7gOKIM7Fjwo
UdNCKiF8oWCoMBMAja1Rr1srfLDm4mGeRopeDQxqEZLe8tv03CdePBDGluW91fSs
cv67/JINTWMy3YksUPHsRi+7zuducw1JDO6PVBcqOKXIqs+HMdAQj82BTFWcP/1T
6GbObQK8wV+yaElQIBnsTNWJ2RSlpJOE0WV5SHEjzx+QvfVbgYnjnu31jnrsFKzc
n17wXdjet4/EGAY+hI5twXdv2P6tNjbZ1s2AZWnecTAwG2JxZQY9ruKiWDchFTdX
Tsc+hrWa6YG32gE2YnoY4gEBZJHQVAmnzqIbvfkCERO1srbr9yrsER4yxOHJ9Vbr
aTObm99bGSKgeFUp/reo17mj04IWjYnbFSLRf4fl19B4hVQdSXpCpGjYJTMGRG1w
V/2y1/o5LhkDmn+i7AjmrVKgEuuEGZNUcM2CoFDh0pICTCc0BMv+QviRjvizTsIa
cjDF48AnOgaX+SutFOQVvL3X90MzkMztMI26iu5zeknGDvkzfBdJg71zsUyE0hdX
NWJj2GT4IBRATTVsa+Cd8Kcd+NeeAjTGai/M44wbq6RL40U6bqOPlhdOS+yV/cLe
y03UjmwuqKmNqXSnU+y6OSqQwos8fFOI13ckwNPmeg1iaEpAlgwEMSRnkVCeLmax
cXBr8yCtjlQncsNq/u8I
=ffgi
-----END PGP SIGNATURE-----

--zYjDATHXTWnytHRU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
