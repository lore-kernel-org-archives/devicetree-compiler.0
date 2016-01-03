From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Catch unsigned 32bit overflow when parsing flattened
 device tree offsets
Date: Sun, 3 Jan 2016 20:32:49 +1100
Message-ID: <20160103093249.GF9329@voom.BigPond>
References: <20160103084335.0b411e1c@kryten>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160103084335.0b411e1c@kryten>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2016 at 08:43:35AM +1100, Anton Blanchard wrote:
> We have a couple of checks of the form:
>=20
>     if (offset+size > totalsize)
>         die();
>=20
> We need to check that offset+size doesn't overflow, otherwise the check
> will pass, and we may access past totalsize.
>=20
> Found with AFL.
>=20
> Signed-off-by: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> ---
>=20
> I've attached an example device tree, do we want to add binary blobs
> to the test suite?

I've generally avoided it, but I forget exactly why.  Usually I try to
generate the testcases as dts and compile them, but I'm guessing this dtb is
something that shouldn't be possible as good output from dtc.

It would be possible to construct it from test/trees.S, but just
including the binary blob might be simpler.

Certainly I would like to include this testcase into the testsuite,
one way or another.

> diff --git a/flattree.c b/flattree.c
> index bd99fa2..ec14954 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -889,7 +889,7 @@ struct boot_info *dt_from_blob(const char *fname)
> =20
>  	if (version >=3D 3) {
>  		uint32_t size_str =3D fdt32_to_cpu(fdt->size_dt_strings);
> -		if (off_str+size_str > totalsize)
> +		if ((off_str+size_str < off_str) || (off_str+size_str > totalsize))
>  			die("String table extends past total size\n");
>  		inbuf_init(&strbuf, blob + off_str, blob + off_str + size_str);
>  	} else {
> @@ -898,7 +898,7 @@ struct boot_info *dt_from_blob(const char *fname)
> =20
>  	if (version >=3D 17) {
>  		size_dt =3D fdt32_to_cpu(fdt->size_dt_struct);
> -		if (off_dt+size_dt > totalsize)
> +		if ((off_dt+size_dt < off_dt) || (off_dt+size_dt > totalsize))
>  			die("Structure block extends past total size\n");
>  	}
> =20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWiOrBAAoJEGw4ysog2bOSGc4P/RhkRYDD2ZlVoxro5rGHmYkD
t8N7KalBsR2HL2GsBT94IERJtIcfUcYQEr7iNWVEclqiTH9zMsJ8XLm2H8mnAOYv
GGvi3hFDrlbrcuDVxAwnVW9V/q3psmxrvHFSlTJAFSPJUSy44Su+vW71fm5UtLjy
TKzn8T+aqFcOHi1nz8W/3H5tfZLKFPI+d6tpVOXf+NNsfbKLgQfhvO8raAwwhkCJ
QQV6DQn00rGz1ZExSv1O7MngZx0wq1mQNSX61OJlZp/cmXyoFOFzNaj853avJTSg
oaayLH64yFxDgn1srJJ8nlr/qIo5PhEluLPSElUhp2M4U2d4yyyCp1e/1+UEb8F/
RubtlRQkJxC9qmEdw1KF3LvYvvPQ146EVgD8OXdOLNu9pHZyRFtA8RLOYnWxFnwm
qDYu62iBgxSs9RXNXIkb/yZl8rHKZjknFbPRlYj4UhNGQrHR7aSpyFadFqt5OpAT
l4rgCRerZhsj9egiu+aNPpr6VDLEshyw1UvqG8g/PtGTKQb/83FOypFjIF/FSVuA
CeVzTBRxP4JOBRj3hMU1XGPtK/NjeqlgqCDPONnMQ5n84SVlZ5YepDxlvFhlJJWp
iU8vxqXwmNyyN3iojl0wQG/ujlsZD0ey5Zfj0n3dWauV1qpR2+pABR1booe/X5vp
lDLkmp6LbHXU5AAYK5Wa
=DVBt
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
