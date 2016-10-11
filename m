From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/4] libfdt: A few overlay fixes
Date: Tue, 11 Oct 2016 21:18:53 +1100
Message-ID: <20161011101853.GG8952@umbus.fritz.box>
References: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
 <20161007040835.GA29155@umbus.fritz.box>
 <20161011081606.GN3462@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1476194268;
        bh=Tu/nEy2Zr+nmoYKenlNWcmltSGIkswM2+rs8OFYHy5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZYy7aC/INzSMv3OQEZKeOhTQl2I//Ydpo5vs4a3vrzp6R4ZXjDWvUkBqsKysYkz1G
         XmN8L0uPvC1DdQJG6RRryxr/ZfnznTxerNgbmEl2woIjJb/tZbw9TnAgOiOSa35lyG
         HawXtWdeXOszxnSgdhqgdnhvnOq608AYPX0fKlBk=
Content-Disposition: inline
In-Reply-To: <20161011081606.GN3462@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 10:16:06AM +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Fri, Oct 07, 2016 at 03:08:35PM +1100, David Gibson wrote:
> >   - The testcases re-use the same file name for the intermediate
> >     dtbs.  That's not a terrible problem, but it can make sorting out
> >     what's going on when there are multiple errors in a test run
> >     harder
>=20
> I'm not sure how exactly you want me to fix that. All the overlays
> have a different name already. Or do you want me to rename the base
> device tree as well?

Uh.. looking again the problem is less extensive than I thought.

It's just that the variants of the base tree compiled with and without
-@ are given the same output name.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX/LyNAAoJEGw4ysog2bOSMyYQAOajFt19B+oziLsOwjQeucXk
II+JQXchgjd+7gaepo3QPCR/b9uEkDJFpGWV544vvaPfMUyMRF2uHVf/0uO//FlD
cfXJk4kFStUOwRcNYmtlsRZUp5VNfL1EU/uEAIqafGjpgv4QKFSQdmFiZygAXER5
lb2WbWXfap8xnyX1tHZ9Nic/zyQeMEh/QdSS0C2jngWNf/7n/VUghgC5LqUQzQyC
v1u9aP6S0zGvW+qfuSO6DZZ+5Ecm65TXV100sYlKAYfSfweztHO8iE9L9qbJ26vp
XyG1UIFMJe5ap+n+A2s5n7S9ycA3gN4SD/o4pwjb5sIY0xoZ2j8kpqkzr0N5B22E
/fNOrGEyMNT6eoFRpKtWXUOGQxLSwmvYooTIjhRFB4i1UFFjIHc0iqsd/Dqv8mQg
nkASrpcQkW/AsCEYY0n9a9WF1y68ApzdlNDPTCWf7l+xyapPlMmBNUIo2YCWUL9y
vQ+aQDmlA0IeXW/5UQzstJ1vqQxCh9Pg/JOo4wwplUh2BfpjiCb9QenCaHNZNHQr
W5kQ+GXT9XWOl1OpnUf+87L9SihZDI0HYLhVcEeNXttPlyLRzTO8cUegrbP3aQ02
DKGClldo2iX1sUxrm3d1/C+2LvBXeYAexpPgrxz4KNQ9H+FEcrDUN7nXtAWo7r0U
90piUW7icLC4NRvQbUC1
=D1uD
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
