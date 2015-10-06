From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v6 1/3] dtc: protect against null pointer dereference
 in srcpos_string()
Date: Tue, 6 Oct 2015 21:46:13 +1100
Message-ID: <20151006104613.GN3861@voom.fritz.box>
References: <560F5D15.9060606@gmail.com>
 <560F5E44.9080006@gmail.com>
 <20151006041000.GI3861@voom.fritz.box>
 <56137904.9080203@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uMPAU7A2Er6+wvsD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56137904.9080203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--uMPAU7A2Er6+wvsD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2015 at 12:32:20AM -0700, Frank Rowand wrote:
> On 10/5/2015 9:10 PM, David Gibson wrote:
> > On Fri, Oct 02, 2015 at 09:49:08PM -0700, Frank Rowand wrote:
> >> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >>
> >> Check for NULL pos before dereferencing it in srcpos_string().
> >>
> >> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >> ---
> >>  srcpos.c |    6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> Index: b/srcpos.c
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> --- a/srcpos.c
> >> +++ b/srcpos.c
> >> @@ -268,11 +268,13 @@ srcpos_string(struct srcpos *pos)
> >>  	char *pos_str;
> >>  	int rc;
> >> =20
> >> -	if (pos)
> >> +	if (pos && pos->file)
> >>  		fname =3D pos->file->name;
> >> =20
> >> =20
> >> -	if (pos->first_line !=3D pos->last_line)
> >> +	if (!pos)
> >> +		rc =3D asprintf(&pos_str, "%s:<no-line>", fname);
> >> +	else if (pos->first_line !=3D pos->last_line)
> >=20
> > This logic still seems backwards to me.  I'd really prefer the !pos
> > check to go first, then !pos->file, then the normal case.
> >=20
>=20
> Checking !pos first results in either an early return, a goto,
> or more deeply nesting the

Early return is fine by me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uMPAU7A2Er6+wvsD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWE6Z1AAoJEGw4ysog2bOSByoP/2PbWlV4aIaFgnRp857GHiig
30Mqu7O9gmFrgcK0+t+G8sPWGP2ltU3KAcYk9y3GWKFnHnhW8pRJru6idRLCOFft
aWQqU28kYJuwzLDatx96yLLFnLd8/ZXewQNs8+ouvZ4kHO/oz6P4J7qJIMoMBrBP
fc3434beOwxg+bXwk051eoOnw+B8w5SPh5hlv6eIw3i9sPhJWZnnCKrYe0p15Cva
xpPBccuNyaVOgRGziSQ1hN8iSAdb30oWt++qUvn5tFM4xGdM5sZCK9GUjqVjg1GT
7+nzr8C2FaSIJVCFiEAkOFpEXdwwBrSx+fmdJR6ZryNhhSfMfhEaSDT8/Qq9sPv6
Ms05wU46LH46cAh+XfDd0WuFOLlNMqRP0X7jxmTCTADXkXdGtkEGcyHOTaP/NtV2
SXkEClv10q16HVdRM3dmD6sBqQhrbOy63g5jrN11brNHeNduYO29O6aEK3J9Le6M
EMiunYkXVdU3xgvm+N3PcpZK4JQH2hm6MJ92E5bYHByWBhW2Hra9vnMJtKwtNF1e
OuKbbBY2skgmkbh7dXbTFyc1zN7dFb3AajhwLMwhb/SEvkHYDjRhWmyNygpckWGl
4p3LU54seXbjTkujes9DgH1Yvzj3wh5BgGeWBxtG6QOLFapnvGJo+L/HKg8YtKUH
FssvBO+rAB08oXtwrDAV
=BxPr
-----END PGP SIGNATURE-----

--uMPAU7A2Er6+wvsD--
