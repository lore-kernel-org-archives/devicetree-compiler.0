From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc v1.4.4 released
Date: Fri, 10 Mar 2017 11:39:13 +1100
Message-ID: <20170310003913.GU19967@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O9T4zNOkGnr0n+A/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1489106357;
        bh=HVdfsvmbGWdtgObzZHhKNHd/1sXzAgHnXAVAwEIIf/M=;
        h=Date:From:To:Subject:From;
        b=IvxdcIUnoIBB3GJoB/KXqu9Z4LSFb6TDmrz5dhMFdykYPsSs+qSa47T1ZUkj2Ozbz
         ojWPf3jT/LxZXOWt0QN40xDHg5l0zSw6NuRQBeu0SKmCYcp3qKPqOvZyULUehVJXEJ
         K3xX0H6v6MbydP8nBwZCckguSf5g7hshn+PfI/Z4=
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--O9T4zNOkGnr0n+A/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It turns out that dtc 1.4.3 - and most previous versions - have a
serious build bug on a number of distros: libfdt.h incorrectly defines
some system reserved __* macros for use with sparse.  These conflict
with some system headers on RHEL7 and probably several other Linux
distributions.

This quick fix release includes patches to correct those build
failures.  It also has a tiny handful of other cleanups.

Source can be downloaded from the usual git tree at:
    git://git.kernel.org/pub/scm/utils/dtc/dtc.git   tag 'v1.4.3'

Or in tarball form from:
    https://www.kernel.org/pub/software/utils/dtc/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O9T4zNOkGnr0n+A/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYwfWwAAoJEGw4ysog2bOSc4MP/2gO4kl7/zj0/KUeutdGZJcy
bjTst1VoaBpHXyCFBTkduFnf+uMq8lQAPmRoPIo1/56WMgOXX71UuwVwkrCdLRHi
8m0uoyr6Qs7FsffS4SM/PwyuUn62wAQBwILLe5yNJokjO8v+8TH2tRO0cIVBKT/U
1FRr/D5GVsVVRcD2hQAl1esNKIRnvcyS5nZIjUdJ6QY0j0m2iUhRP2b0fy6QoFhL
5qxqt8zV3ly7pvlWyxEYPWezoWLfCXsdWXjqWcQP0qWXCJuRrXcigk37Tuf6mNJO
RVkLmPjn3yrv76jEGqHeOSNYvBKNYXAaJYweVClPmnj9oNDrzuCyHR7Qv+OVI6Jp
eKQuJzQL5zyRqpUFuDZjWcrD13Tvuu7QBedGVQi1K3LTtfiqR3bfBl7T8HYqDedm
pE4GsBSzLLooTFMPKeOG+WfkDfoQHZee6KI5n6zuW+cGkFqxuG94UaG+r2iDJ+6I
6KhjhoACsPgZ8k3vvOQxPchsIbl3a8NVL/T6z6D5MsnWHpEAgD9bInIYOMVoWz3z
nyz/JlemHDNLltWHqbEQwS7z8w9fQGfilPDupXQyDtZEEDRJcMPBx7rzWqIctE96
sNafQ8HIkdgXgFSbN9VPI1lP8HNg8QS9ZbUjM5YzBu2Pmenxq+pw2viGNCen7/TR
hJ+WNkeR2H1UIQYm80bW
=mCFk
-----END PGP SIGNATURE-----

--O9T4zNOkGnr0n+A/--
