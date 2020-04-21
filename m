From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: bus error on sparc64 running type-preservation test
Date: Tue, 21 Apr 2020 13:22:04 +1000
Message-ID: <20200421032204.GD52174@umbus.fritz.box>
References: <001f01d611ad$f1f44420$d5dccc60$@turelinckx.be>
 <002001d611b0$c2dd7d20$48987760$@turelinckx.be>
 <20200414062534.GL48061@umbus.fritz.box>
 <4c0be4b4-7f6e-4612-af7b-dfffb400597a@www.fastmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1587446417;
        bh=sZ18GqCGXwMH90oa/OWSuFB4fKvHeB4F2micKWaYQ6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jUKsNz6jayyOu0Ezl6UfAeS3Nnm+4Tj4vUoq7+r9t8X6Kjtux5fgU9iby2NMZtYcS
         C0BEjAF599RRIMMcxWUbTjQQ83Zjf2NtN8REF1tDx3VMRC8LbErZH//qq3BSmOfpZ8
         vUk4PFwtCGY2fBhCnN2eCwGlc4+4MeoAmXMsX/Gc=
Content-Disposition: inline
In-Reply-To: <4c0be4b4-7f6e-4612-af7b-dfffb400597a-jFIJ+Wc5/Vo7lZ9V/NTDHw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Turelinckx <tom-HiypchcOusz53ZRCpReHOg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 06:34:24PM +0200, Tom Turelinckx wrote:
> Hi,
>=20
> On Tue, Apr 14, 2020, at 8:25 AM, David Gibson wrote:
> > I've just merged and pushed a change which I think will fix this to
> > the master branch. Could you build and test that please?
>=20
> It seems to work, thanks!
>=20
> I've verified on debian sparc64 that make and make check succeed when I c=
heckout b28464a, while make check fails with bus error when I checkout 87a6=
56a.
>=20
> I've also verified that the debian src package version 1.6.0-1 builds suc=
cessfully on sparc64 with patch b28464a applied locally, and that the same =
package with the same patch applied still builds successfully on amd64. Tho=
se are the only archs I have access to.
>=20
> > If you can make a minimal testcase which triggers this problem and
> > submit it as an addition to the dtc testsuite, that would be terrific.
>=20
> I have limited experience with C development, and zero experience
> with alignment issues, DTC or its test suite, so I can't be of much
> help here...

The relevant part of the test suite is nearly all shell.  But I
realized this isn't actually relevant anyway.  I thought the problem
was that we didn't have a test which exercised this unaligned case -
but you said it tripped on the type preservation test, so there is a
testcase there already.  I assume it wasn't caught before just because
sparc64 is more sensitive to misaligned loads than on the archs I
generally build for.  I would have thought ARM would have caught it,
but apparently not.  I can't think of any easy way to extend the
testsuite to handle that, so there's not really anything to be done
here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6eZtwACgkQbDjKyiDZ
s5KZ+Q/9FSCJkXIFF/aciNX+sfLsLbGDvyvw2K5NGo4EWcE1wUEwFxpD4yOAh3HM
SOGnZ/Xkq51UoJ57JEJ9sNPtCAMZhXypVLovl8IST5dEnvTJmNQwesChqouKJ222
APo+HCUdiDwfKRNL51rnUp/mRLhd3xsFOkI2ZQMdrZKP4+P/S0PncLWh1nDfZZDS
Ifi+WgOCxo47b91r1yAZoZltFtHKmOJ3fyUB+VJhjLojv7lnHTI2DM6/SJbx14F7
OBjxD9h7iICS6fCyOFt5gFqrNuUCRlNavPYg1KbiY3LT3zR+1ZUALOtxM0MISRos
vtzaTJ9SLYHOOjaChNiqJBVsAK3POhxlucHCl0XvahZfVY0COw1W/AmbzFNcdc5A
418onqcEo38aQXThQbM7yyw35BPOlR7+Phfs1/C8Kj/bDo/u9QQIEVtvewZl4TDb
RimV5vWCEzw/vzFHMxWyEvQ7q+7qI3QEwAToUkpfywQClBbSPqAdTZCDeWsJXjwV
4vD+2fqFbyWUwVbkZk9AlK4Yrss+jOi5RnWVbxiLHFwr12aOvto/XLtG2JXv49UE
RyxWaRUpOhMjtbeDCH8WJfgtTHbe4DZvBM6ZyLnkd4wt67DopyQ7Zb/gtnZnAewS
vzv5uaz9KmpvO5QnBfO3IPqjczRAazkFC62fjKRpYcv+KeyS4fo=
=7w+q
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
