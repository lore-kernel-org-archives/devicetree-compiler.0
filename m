From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix undefined behaviour in fdt_splice_()
Date: Fri, 13 Mar 2020 11:24:12 +1100
Message-ID: <20200313002412.GE711223@umbus.fritz.box>
References: <f2d09e81-7cb8-c5cc-9699-1ac05b0626ff@suse.com>
 <20200311045914.GY660117@umbus.fritz.box>
 <4eaa4349-edbf-eb53-637d-b62a20befddd@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1584059094;
        bh=HrplTtce9Smra2c2Kb0VJmefNQOdk7QnpTpRGBmjm9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eIGwExw5oxzRmqaHjYhiTp7VTTsFDjlmYQ6Q/EbkYeQyTHDtYFsl4iuKY5/7l1EQ/
         V20hpfgPPP2uCubRKkBUEXLtXlHCfOO8kYlyZh0E+qmLD7uE5cBQtmzI+Gn2GzcKaQ
         3+PKWPmSu7NysmBmUmxwocMNNMEr22smVcENogUE=
Content-Disposition: inline
In-Reply-To: <4eaa4349-edbf-eb53-637d-b62a20befddd-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2020 at 09:19:06AM +0100, Jan Beulich wrote:
> David,
>=20
> On 11.03.2020 05:59, David Gibson wrote:
> > On Thu, Mar 05, 2020 at 03:04:45PM +0100, Jan Beulich wrote:
> >> libfdt: fix undefined behaviour in fdt_splice_()
> >>
> >> Along the lines of commit d0b3ab0a0f46 ("libfdt: Fix undefined behavio=
ur
> >> in fdt_offset_ptr()"), fdt_splice_() similarly may not use pointer
> >> arithmetic to do overflow checks. (The left side of the checks added by
> >> d4c7c25c9ed1 ["libfdt: check for potential overrun in _fdt_splice()"]
> >> doesn't really lend itself to similar replacement though.)
> >>
> >> Signed-off-by: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>
> >=20
> > Applied, thanks.
>=20
> would you mind pointing me at the tree that you applied this to?
> >From looking around I got the impression that
>=20
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git
>=20
> would be the master tree, but I can't see any commit there newer
> than from 8 days ago. The reason I'm asking is because I found
> the issue originally in the Xen tree, which had imported libfdt
> from the DTC project, and in order to submit the (backported)
> fix there I'd like to be able to name the master tree's commit
> hash.

Oh, sorry, I just forgot to push it out from my local tree.  It should
be there now.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5q0qkACgkQbDjKyiDZ
s5LRIw//Q3X4mskZqGLfxnPFaUe7BfkubrOs4rrPEyhDqHV9+1HuhNbiotvZS7AU
lFFFh/RhHMLL7jMzb6Hn4UgWniYpuqIs+JktyK4U80bkhllVKRz6cHMxU1VxnWsE
DnV2iI/LP81ZDrc3n380NWpgHSBwDrKxXQ5HOEJCcfFJokmPwVK8dT7m9+6Qo0XO
x8KiMuATer3JV8iZHfxMallg5ZcgFA8CpL3u5TNHlviHrw6F9DQCNKk/nXuBWfif
tnoz6gcPgFiSD0XassBGcPHYubGKkxYl3TOtySwNgsug33tmQvoluAlMPPmSJJmt
1jfzNXSZmLXRo9crO6KGRPyHBCyzc/5e+aS8Za07/c43ob0rY3Bd4O96uA/kc6KQ
IfsqHaWcgj/aWUgMn85XL7NZshEGwwFEkAwZjS8weczgwEFWSynKbOzGf1lwfS0A
ALAd/8ly/pG+CSijnT91zzxLJUprAKAqnI1+18EXihsmx/4ZojVLFOksiADZ6ijy
tuwzwZ+6vIR/1CflbfTYsu6Awxd6nu5TCtAhMeWavl6qLUOPmr1LjMEiLRLSV7PC
n5zXKjvhwNgsrX3aNl5NzxOjiaG3Fw2MaLltIcYFwDeDp2BkN11sjRD2eCD959wO
vbUjjgakmIKEAi7GZthmDuY7NCegSjpehS+dDHzBMC7tFEKGiLc=
=mEVU
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--
