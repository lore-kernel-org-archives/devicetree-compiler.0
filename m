From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: columns
Date: Mon, 8 Jan 2018 17:12:33 +1100
Message-ID: <20180108061233.GB2131@umbus.fritz.box>
References: <alpine.DEB.2.20.1801061739130.2579@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515392206;
        bh=nNfVF+CNLgaUXS8nXG8S4qgAUKe4tYuRAVybvXxeHHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iXI+mkCXO8xMfJtAYRNfv4nTfB0+7au/qlQJND1l0zlTB0pD1i78bDKCOFoxcb3uu
         RSMQHB2+1G8ajB38aSsg52xfTJX5I65MplPN8mbsVX75l2aU/lReM37TFfblSaKyu+
         LlC9PV4wtj46JQl5iAPReA3HFS/1bCqXQhT70i9s=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801061739130.2579@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 06, 2018 at 05:43:20PM +0100, Julia Lawall wrote:
> Hello,
>=20
> I have been working with Frank Rowand on a v7 of file and line number
> annotations in the -O dts output of the device tree compiler.
>=20
> I wanted to make an --annotate-full option that would print the full
> filename, and starting and ending line and column numbers.
>=20
> The following commit:
>=20
> commit 728c5e87c655c17c2fbc1d5386b12ff328e0fc76
> Author: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Date:   Tue Dec 8 14:24:42 2009 +1100
>=20
> extends the position mechanism with columns, but considers a tab to be 8
> column.  Would it be ok to drop this feature?  I have the impression that
> counting 1 column for a tab would be more useful for actually finding the
> referenced code.

Hrm.  I set it up that way initially so that the reported columns
would match what shows up inside an editor (e.g. emacs
'column-number-mode').

So, I think I'll need to see a more developed case for why not
expanding tabs this way is preferable before making the change.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpTC84ACgkQbDjKyiDZ
s5LO0g//TJN5MkNaVK3bqwfq3RUIlYD3QYaZ2bUTW+7nUN9C5/z2DHq/rcb7qIOi
38gJ+Vsnh6qOkrgumGDuAt5n1YNwzNCNjEnEuwr6hhBArlPYuvRsUy/D8keOcXKh
z1xoeIabrzpoqzvSaBVHlF3P8kQb/odIg8Gsxdqbb8F/8ng7s6nVdxz1GbHjWC9u
QWf0p7gA6jSVv5Fc5CVattGATKhwnCpVeeXHs7CRcpyrWBvs6VnsAMiD9Z75fCMT
OOoINicLGuY6CQ8lvMK2Lgith4PE/LnEWIX3KNwp6Po7MWOO9GbK4tylOFmKBr7/
/caz8JYyeybsRxjy6iveECOH/hf9nX0y9uJ8gGGbj/+mjrCGd8BZfVQQD+ZE+dwR
WRo/I8LZNIGeHrvh14HIqdNIqjLfx0W8+avmZvH5vZxOgMVQGN2KvhKmU0OgTKGQ
PtyS5xfssEGiZXTG6UK32lKAvbmtr9dHRuW9euPT5//rl0b9gyZweKIXYJC7vz7s
eszRd6ydss8GzdBwBqyAyKKhMF90i4sSE9KSU1rjB5O/+RICkoXjT+NDw9W1pjRw
DKmqBRVOFu2GhYWwY71YvtQ2mraMxEP2OQG0ZdJVAhujwfCdIEeAigq8wCr17hat
R/rxup/eW6zq1lteZISZ1M3EE3uoP5RnsDOCSulTJCgFflLoPeg=
=uSkQ
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
