From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/2] checks: Improve i2c reg property checking
Date: Thu, 4 Jun 2020 17:14:48 +1000
Message-ID: <20200604071448.GJ228651@umbus.fritz.box>
References: <20200528085650.1417942-1-joel@jms.id.au>
 <20200528085650.1417942-3-joel@jms.id.au>
 <20200602080104.4vqobktck357j52v@mobilestation>
 <CAHp75VdkBbDhFSYQYxuej=XH1MYAq-p6AWZZRLpW_iKt9D31_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zYo4Elh1vtcYNvbq"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1591254899;
        bh=3uGi9bhteSUKHX4dK9fb2u7dJ+8y8PDGwBDZ768ai2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iMqSQbhOLghOv8X+Om/fx5cEcudjWzNmthFNcIWGmNAa4SlMWdJQhmzBLoZitwxys
         Cgx6ii6pcWf/O7HgXFlc+Q05riMwz5ihgpsBCUzhZJWLiJ04MC3Lcf7wmh5NnLVJuD
         83r0rV6pN3vVi046+JSxemJ45pvi8WWX51MbHU98=
Content-Disposition: inline
In-Reply-To: <CAHp75VdkBbDhFSYQYxuej=XH1MYAq-p6AWZZRLpW_iKt9D31_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>


--zYo4Elh1vtcYNvbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 11:28:05AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 2, 2020 at 11:03 AM Serge Semin
> <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org> wrote:
> > On Thu, May 28, 2020 at 06:26:50PM +0930, Joel Stanley wrote:
>=20
> ...
>=20
> > > +#define I2C_TEN_BIT_ADDRESS  (1 << 31)
> >
> > As Andy neatly pointed out here:
> > https://lore.kernel.org/lkml/20200527133656.GV1634618-XvqNBM/wLWRrdx17CPfAsWGXanvQGlWp@public.gmane.org=
m/
> > (1 << 31) is UB.
>=20
> Thanks, Serge. Yes, we have to use 1U in the definitions (for 31 is
> necessary, for the rest is for the sake of consistency).

Joel, I know it seems trivial, but I'm a bit flat out right now.  Can
you please resend with the 1U fix applied.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zYo4Elh1vtcYNvbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7Yn2gACgkQbDjKyiDZ
s5Ko2A/9EOz5F+OpHM6Hm/PfSqeuTj9ieOtOrCEsi0IDwfYm/dzM9guvfG+vwkrT
2czUMP6/43KnMagvyA3aUlWZIFSNb1+clF24ugP5JWZB8rGnzNgCbfNXRmDiS03C
eATNtJuGeDR6b+o2pmn72go3cnJlBVJYfXJTuaue7YWVNR+LLZR0/QVne77+BQ7H
7Ca0FCMJv6tBGjqTP1ImBeqFvLWaaHwJOcg5VkTVldzjHYB5nmHWvYkoIuqIu4Ld
Cw5qJ+L10+eLb+dcVnn6OBkRiLMFQZ/wVHMQoCjv06nLGaJCaAULy1A7kzweVQnT
NDJOUnX0hoTPb/1Q6PYd+ecn5oMxrs9KDS8KYxzRSRdMyet4u+G0ikZRQwjXYeHj
RKa82UaKQVYx4ePRyxxwClOobHT8KA3Ra7LAmK5Q6lyI1aHt7OlzW7y+XnDHrUNX
4Ov/KKTCiL9HUaHxr06f389p+EVWf5kOLe586bMFhx8Dp3EFMEa5ITyOSqyp1b0d
yOsmWe15AYnKHOsJtzN1Ln8IXsTO1HtWpBOrSPFK/FKO4A1DyKycVsNvuGNB+i2t
xppu7se6M8CQEu/ZfJXqgqRwKkvSm7lTcn+a2n3cmdKAgvOdLDLlul/yu4fc2PqY
sWD3XaoXpVIaqrptnZW8h4KC5SEPa42W8vgLyIwZib9cccp8oBs=
=F2/h
-----END PGP SIGNATURE-----

--zYo4Elh1vtcYNvbq--
