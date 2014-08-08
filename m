From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Properly handle embedded nul delimited string lists
Date: Fri, 8 Aug 2014 19:18:32 +1000
Message-ID: <20140808091832.GF10949@voom.redhat.com>
References: <1407358323-14044-1-git-send-email-jack@codezen.org>
 <1407358323-14044-2-git-send-email-jack@codezen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407358323-14044-2-git-send-email-jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 03:52:03PM -0500, Jack Miller wrote:
> For example:
>=20
> reserved-names=3D"res1\0res2\0res3";
>=20
> Where \0 is an actual embedded NUL in the source instead of a string
> escape. To achieve this, use the len given by the lexer instead of
> strlen.
>=20
> Without this patch dtc will mangle the output and possibly hang on
> realloc.

Looks good to me.  Applied, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT5JXoAAoJEGw4ysog2bOStOEP/Ap0977LZQSm9s+dTbJo6/WS
bW80KKa5FUhadzFX0XEEuGtyvURE8thn7McySSJOxf60zNFFCkdOTq871QP45pRx
6XyWLovxK+RoS7XLtzCdMkkx2CQP6+MNOj+O8KVuOE3A7upwJOT+q9cJMw4SAMKW
2M5gawabUtjspP1vQLENKU/fH8cIZeaH5rVLZdh3SuRHy7jtTc4pxeYOwKeZK9gq
nt1pgeG9iLJ3pL3A+LCCD5PsifnTja2ygs5ojfgabQ7caogE+kqDPES2Wydhz3B4
0gqO9VQa4YmMoWcJoVUvWB3mUlryMuhtIzRgEMxcQajqwD//jRG378sagfR4QdA5
f6M7wpaHnke0lnwe7MFGwNbtNp+xJdkBwloLvtaR15+UCB7om9ik9nc+U821vW11
dP5O2NG9UMpWgteLc4LaNd+pjyYsxNkYO771Wh9EwWFZrEK2TBHn8uFLMPq6Ti5M
tKVP3yU8cS2bw8glUVhrGK913KY51oLcfM0tBaPbGwStfT7mxlbA1xuPkwPfmoI1
KNggqRQ9w0BGgCO1HxDheICV6cKy8QGtHo4zOYXIfFFvWr8nvpARk1JVFMRec0c5
Y8FN09ryQWkzOTtyOdDMm1p0qtPT0XTGtGk31LZ5B6imda981+Fp4BRC/40H+l9t
N93Jvgv+xhb64G8qmNYo
=Iwyu
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
