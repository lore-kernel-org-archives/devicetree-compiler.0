From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Missing exports in dtc 1.4.1 release - Make new release adding
 them?
Date: Sat, 3 Sep 2016 21:11:26 +1000
Message-ID: <20160903111126.GF2990@voom.fritz.box>
References: <20160901200821.373f862c@scratchpost.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XStn23h1fwudRqtG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1472900965;
        bh=9DtlhJwndJ3maM3pr4mtMjLssTzhxjYrUeySpDOB2pg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=emNC5oX956qYiNcIAslMu8xaM2rsaKmeT5djMOpCrLdFFLDHtiwx1ub/KTMAkZ38h
         KI7IyEqdomFm4urdtx4rFAL1q1zmbKTUOvb2eCPXVyDpIlwKPgm09gZQbgNxKYeUMz
         vIjChVevDgg60EViC45twEvrhdd9kwueYdRnyxoU=
Content-Disposition: inline
In-Reply-To: <20160901200821.373f862c-bxPqe3T81XXwRsdMLXbzog@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Danny Milosavljevic <dannym-bxPqe3T81XXwRsdMLXbzog@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--XStn23h1fwudRqtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2016 at 08:08:21PM +0200, Danny Milosavljevic wrote:
> Hi,
>=20
> I'm packaging dtc for the GNU Guix distribution.
>=20
> In the process we found that Debian patches dtc 1.4.1 in order to add mis=
sing exports fdt_first_subnode, fdt_next_subnode, fdt_address_cells, fdt_si=
ze_cells, fdt_stringlist_contains, fdt_resize.
>=20
> Are these supposed to be exported?

Yes they are.  In fact a patch already got merged upstream to add them
(and some others) to the version.lds - it just didn't go into a
release yet.

> If so, could you make a bugfix release tarball with just these
> added?

I packaged up a release with the latest git, including the export of
these symbols, and a handful of other small bugfixes.

>=20
> The patches are:
> >From a4b093f7366fdb429ca1781144d3985fa50d0fbb Mon Sep 17 00:00:00 2001
> From: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Tue, 17 Mar 2015 16:00:34 +0000
> Subject: [PATCH] libfdt: Add missing functions to shared library
>=20
> The commit 4e76ec7 "libfdt: Add fdt_next_subnode() to permit easy
> subnode iteration" adds new functions (fdt_{first,next}_subnode) but
> forgot to mark them as 'global' in the shared library.
>=20
> Signed-off-by: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  libfdt/version.lds | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index 80b322b..941208e 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -54,6 +54,8 @@ LIBFDT_1.2 {
>  		fdt_get_property_by_offset;
>  		fdt_getprop_by_offset;
>  		fdt_next_property_offset;
> +		fdt_first_subnode;
> +		fdt_next_subnode;
> =20
>  	local:
>  		*;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XStn23h1fwudRqtG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJXyq/eAAoJEGw4ysog2bOS8K0P/jGdJ+3SQugLzQ+0nxYBBYVY
AlNzboBcY81ivavCjj2VKWo8LxYhvWeFHOq1f9kYRpcwBp+f7mDQGVDLsWiuRC21
zcrxL+78IZzMsUF/or7u6+4M6iCXCS4W0vU9m1aUWZtLDdj4m+gxpOpLhVw/+YGT
mD8NfCr9NRp06+VLWxosMxSHXMihKxA5p4GrIQcrJ5olg70m6KMoT+DG6ZvcylCQ
m5JzheSua6vCOHvTFn20ok+R87fx1FSSlMEP5mhfBlMk1DWLr4SpkH4fjw/ix1xh
HHvn/L+YyLZA6ewz6dHhlN8Xg4fLNoPfTP5YbhS00bsJKwQs2P9XfS9PSdQaeXHV
26RdBqXBvnnkOH8xMo4p1PI/iIKQ0Vb0U4g7IqanClaEEERsMmYU9a67sXrlvx7O
XFVGT34zz9IG1koTmmS6sBpCPPrjxg4eF4NV/b3RKDXAkaEdSW4oQIu6TJb2+R4/
MvB0Ht3vK+bF+5SjchUJXVN0gaeziA2drddTj4l/10Z4ax9uCYf2F6Hgg35n1NMC
obrgAmjGPA3ac0mylSpn6e2eoCf/jW0WP5lyvZlCGNCoqGWZfqAKaEbZn3cxbs+Z
L9o4eLoXup81zd5pnhg6vKp80io3t6V5h9IGxaxjQwNrh42MYTL8uy6w6B2zKcal
k8beCic8EdoeBl42FY9H
=Bim+
-----END PGP SIGNATURE-----

--XStn23h1fwudRqtG--
