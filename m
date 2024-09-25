Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AD158527
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Sep 2024 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249302; cv=none; b=F8leelf3rWwtRHSc5E2LuIcfUAaH87itppwXqOBOA+DOBlEvAlfRgR820U9xfhQhNoG1VYNBlw4CU8VpqC9BjUpA1mnNmUha1oO5CuLqCPZAbM/VYYqxtJ5//cH2eEOs0Ac0UGirFK3CYuQPLVnksvjifXYY22hwUntZyTJ6gJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249302; c=relaxed/simple;
	bh=6YjjwcXAIdsi4Th2HlsQG9KFq47RsS3szInEwbBV/as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afEhR2XimgVcx274ibwIngYo7lIj2mIajr7LSsKP586fNLVFH91z7PHoJ1T36B0yt+01sst+cVPP88rM1ufJv/nUh1GOTCf9v5rzAhSE4eIRwq34YgX9eyuds05H/K892VZCdPl3IHWzhf+dAZVABLmVjkqxdD+ag5Uy4qVcwtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=fIA9GLNn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="fIA9GLNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1727249295;
	bh=z0qkEXmFJOE2FX3WvDoi9xhYZ7z12ERb1mH2k9wble4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIA9GLNnCqwNcCKsqh2pUHKZmLWCITrNPZAle8jLr2RJCqHkZYrd/pXRtax7jgE87
	 ifLcHe9aDWdETsfMMwuLUvEQ6HMpbpWsZJvOVUIvX1IckqM2UjEQRqGbuEh25uAklB
	 l5S+d/HLVh7+1xvaEonI3Q4qvIJgMfjoDlGZ6uLvJ95zon4EMI7reggpwpiw0L1PNv
	 TqkroN4uhA4aMNUMxbrzpaM/dwOB429JOewDlM1aSkjfmFMTpdt9LlLBkveRzM69tZ
	 x3jefq76Hvzg+nHHO2NwJ46s+01mnBqnqMydjuT4+t02UbZHYMv4CdQMaQFsmD71xB
	 9WXMzJ/6gd1Xw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XD7cb2gpcz4xPY; Wed, 25 Sep 2024 17:28:15 +1000 (AEST)
Date: Wed, 25 Sep 2024 17:28:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <ZvO7iUv06vxIvdpX@zatzit.fritz.box>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
 <99c2b16b-a9bc-4808-966c-96b60889876f@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p2GSgZJXYT05305G"
Content-Disposition: inline
In-Reply-To: <99c2b16b-a9bc-4808-966c-96b60889876f@beagleboard.org>


--p2GSgZJXYT05305G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 12:11:36PM +0530, Ayush Singh wrote:
> On 9/23/24 09:11, David Gibson wrote:
> > On Fri, Sep 20, 2024 at 10:04:56PM +0530, Ayush Singh wrote:
> > > On 9/18/24 08:06, David Gibson wrote:
[snip]
> > > Well, a lot of work is still going in this direction [1]. I myself
> > > am trying to use it for mikroBUS connectors.
> > Sure, and I can see why: it seems tantalizingly close to working
> > simply.  But that doesn't mean it won't have limitations that will
> > bite you down the track.
>=20
> Well, my previous attempts at not using devicetree for the addon boards w=
as
> met with 2 main arguments:
>=20
> 1. Hardware should be described with devicetree.
>
> 2. There can exist a fairly complicated addon board which will not work
> without devicetree.
>=20
> Additionally, it was mentioned that if something is missing from the
> devicetree, I should look at extending device trees instead of trying to
> bypass it. So, here we are.

Absolutely.  This isn't about not using a devicetree, it's about the
mechanism for updating the devicetree with plug in components.
Overlays, as they're currently specced, are simple and easy... but
also crude, limited and sloppily designed.


>=20
> > > The reason for using devicetree overlays for such connectors is
> > > because of their loose nature (mikroBUS is also open
> > > connector). This means that as long as the sensor/ device can make
> > > do with the pins provided by mikroBUS connector, it can be an addon
> > > board. And there is no limitation of staking the boards. So one can
> > > do rpi hat -> mikrbus connectors -> grove connector -> grove some
> > > addon board.
> > For example, the very fact that these are loose exposes you to one
> > pretty obvious limitation here.  Suppose some future board has a
> > connector with enough pins that you can hang two independent grove
> > connectors off it, and someone makes a hat/shield/whatever that does
> > exactly that.  But now the grove addon dtbs need to be different
> > depending on whether they attach to grove connector 1 or grove
> > connector 2.
> >=20
> > The old "connector binding" proposals I was describing aimed to
> > decouple the type of the connector from the instance of the connector
> > for exactly this sort of case.
>=20
>=20
> Do you have a link to the "connector binding" proposal you are mentioning
> here? I really believe having a better way to support such connectors is
> really important for embedded systems. And I am okay with adding any miss=
ing
> bits to make it a reality.
>=20
> With `PREEMPT_RT` patches being merged, it is probably a good time to
> improve embedded linux.

I don't think there was ever a proposal written up as such.  It was
just an idea floating around the mailing lists.  I did manage to dig
up what were meant to be some illustrative examples of the idea.
Alas, without any explanatory notes.  It was last modified in 2016,
but let's see what I can remember in terms of context.  Note that all
of the below was a quick draft - it would certainly need polish and
all syntax is negotiable.  In particular the use of the /plugin/
keyword might not be compatible with its current use for overlays, so
that would probably need changing.


The idea is that a base board could define specific "connectors",
which could describe what buses / pins / interrupts / whatever were
exposed on that connector.  Each connector instance had some local
aliases referencing the nodes in the base board the connector could
alter.

So, a board with a "widget" socket which exposes two interrupt lines,
an I2C bus and an MMIO bus might look roughly like this:

/dts-v1/;

/ {
	compatible =3D "foo,oldboard";
	ranges;
	soc@... {
		ranges;
		mmio: mmio-bus@... {
			#address-cells =3D <2>;
			#size-cells =3D <2>;
			ranges;
		};
		i2c: i2c@... {
		};
		intc: intc@... {
			#interrupt-cells =3D <2>;
		};
	};

	connectors {
		widget1 {
			compatible =3D "foo,widget-socket";
			w1_irqs: irqs {
				interrupt-controller;
				#address-cells =3D <0>;
				#interrupt-cells =3D <1>;
				interrupt-map-mask =3D <0xffffffff>;
				interrupt-map =3D <
					0 &intc 7 0
					1 &intc 8 0
				>;
			};
			aliases =3D {
				i2c =3D &i2c;
				intc =3D &w1_irqs;
				mmio =3D &mmio;
			};
		};
	};
};


A later version of the board might expose two widget sockets that are
backwards compatible with the original widget but also add some new
features.  It might look like this:

/dts-v1/;

/ {
	compatible =3D "foo,newboard";
	ranges;
	soc@... {
		ranges;=09
		mmio: mmio-bus@... {
			#address-cells =3D <2>;
			#size-cells =3D <2>;
			ranges;
		};
		i2c0: i2c@... {
		};
		i2c1: i2c@... {
		};
		intc: intc@... {
		};
	};

	connectors {
		widget1 {
			compatible =3D "foo,widget-socket-v2", "foo,widget-socket";
			w1_irqs: irqs {
				interrupt-controller;
				#address-cells =3D <0>;
				#interrupt-cells =3D <1>;
				interrupt-map-mask =3D <0xffffffff>;
				interrupt-map =3D <
					0 &intc 17 0
					1 &intc 8 0
				>;
			};
			aliases =3D {
				i2c =3D &i2c0;
				intc =3D &w1_irqs;
				mmio =3D &mmio;
			};
		};
		widget2 {
			compatible =3D "foo,widget-socket-v2", "foo,widget-socket";
			w2_irqs: irqs {
				interrupt-controller;
				#address-cells =3D <0>;
				#interrupt-cells =3D <1>;
				interrupt-map-mask =3D <0xffffffff>;
				interrupt-map =3D <
					0 &intc 9 0
					1 &intc 10 0
				>;
			};
			aliases =3D {
				i2c =3D &i2c1;
				widget-irqs =3D &w2_irqs;
				mmio =3D &mmio;
			};
		};
	};
};


A plugin device tree describing something which plugs into a widget
socket might look like this.  Note that it specifies the *type* of
socket it goes into ("foo,widget-socket"), but not the specific
instance of a socket it goes into.  When plugging this into a
"foo,newboard" you'd have to specify whether this is attaching to the
widget1 or widget2 socket.

/dts-v1/;

/plugin/ foo,widget-socket {
	compatible =3D "foo,whirligig-widget";
};

&i2c {
	whirligig-controller@... {
		...
		interrupt-parent =3D <&widget-irqs>;
		interrupts =3D <0>;
	};
};

A plugin could also expose a secondary connector.  Here's one which
adds a "superbus" controller mapped into the parent's MMIO bus.

/dts-v1/;

/plugin/ foo,widget-socket-v2 {
	compatible =3D "foo,superduper-widget};

	connectors {
		compatible =3D "foo,super-socket";
		aliases {
			superbus =3D &superbus;
		};=09
	};
};

&mmio {
	superbus: super-bridge@100000000 {
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		ranges =3D <0x0  0xabcd0000 0x12345600  0x100>;
	};
};

&i2c {
	super-controller@... {
		...
	};
	duper-controller@... {
	};
};


--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--p2GSgZJXYT05305G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbzu4gACgkQzQJF27ox
2Gdz7Q//W+me4Ssw/aSNtyzS6jPknGeNjj3zowreFjXJMAAWjvJd/2fIdXwXub0o
4H6JcjeP1/WFtNqPpn8xIs231Y/2zybNKNdvLCY7bJjwTXtIFT4AzFEhESskJdHW
AP+7ldHcP/KRmr/uPEJEzD0CVjm/yayTz34YF+Lv2B+PqRUfBsZOBzBqYJMsd+0L
+mVlVEyfwigoIqsmmH7MpkhZ/QfRNRAYlb/qBMs03i585ngGiTabrtgIsDxY2rqJ
wjt7qJdeHB4HlQF4sQJoxPA/KPAFzsGN2WC9Z/m1rTZwyeriwrEuELlQpUINCSGj
m5QaBq7YBrtxV3dgji2FgMudSPqQd622Q9cOl09Sa0jq2I+MDsAWIcDmWlYGJpRH
iasVIegj4AdwAWNE3lkwkolg3yYc6JMZeWafEYKWBiVXHKvqk6jSSo7vL2OTYexT
ort5dexW8hAwXsETxP466WCSf1nlpMXKXunZWZ8zcF7DhdajrFxdifaUe757J09S
ApOU/xoJkaUUR9IRwANwUCEifTpQTekcPd8TDptAy5tjlZfxBin/TvDUWcfKud+v
akNe+ugtD/P7+R1DfTJM9DGYs73IUdSSqg86YHgBrLZSslm0jycLhAs8Raa+ls3e
FrA12zt/UxeOXDu4jbzL3eTdx8okj6oV2AeqrpuoGV/OKZ8CRIU=
=hOlj
-----END PGP SIGNATURE-----

--p2GSgZJXYT05305G--
