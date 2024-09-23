Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C14D53F
	for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 03:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727062905; cv=none; b=XzhC1iL71IOVd9Ldi0pVsyYrk3258xu4D3SpWxKp5pAPi7B7OvBQxjCbo0gCRNL/Gy8MBtS4cQhcH3niuPty11wE8zvgaHfc7ZOzRa4sMxFDsPjcJtVXrQ/teWtqZpEXMfxZNLmD1SJqldUK30gATxoFoiClrCZPfEbsCKmk3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727062905; c=relaxed/simple;
	bh=uB0fwRuwDx2BF7tOCjkaAl2YO5qlDBA+bviQzZh9SCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHnOLL+c0JcaNyZlAvS+4wCeb5Qc6iP7RlJMoN8sszIRI2jEGOBgQ5I8NWHQpuAVKe3tZtEOQtQp0yHhiHmb35YW5X237459sGo6BMoYK9XTs3xVJ0mFs9lvbs6ft3NA8P1HrcWwR9Vg79+HILQvcCMS8nnunYOp7vmVAOTyVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZFqbkLxH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZFqbkLxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1727062896;
	bh=LcLp5p6yAi9Arxpxfxz+9eH7O8CkYZzUpWoe5sGV6i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFqbkLxHgYiaDRUfvD/Z7dEIWhtYfuAoNbdqnYFz0LmrN0qTXrBXHyCG7C92cwRET
	 xKGwncAwwZEuQ6WuUkgEAp3G/WVz+6yhGjPg+zxPYUKD1dpLJEsagbYcROY8xFP6Ua
	 Yp6vKlN9BQGphX7gMmLewF9VpBw6+Vw/98A3Ws3YC40ftO2QFwuzJss6Y2Ysmzkor+
	 dYz1h1DdcLH9YAeXvQ0bXfY/uZqUxVQIRpUmOJp8BBlZGUEzH0ki9pafuOFffj4UFY
	 oixpnMk0tGKfufKCIlg/KJu3nFJ65ozg0OIewCJygRhErltnbPG/pb3MW+dUSZ/6J6
	 ydj3/8F/Us/aw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XBph06tCcz4x42; Mon, 23 Sep 2024 13:41:36 +1000 (AEST)
Date: Mon, 23 Sep 2024 13:41:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <ZvDjW7W1096FW8XL@zatzit.fritz.box>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tw3huiGcMxN8u9X/"
Content-Disposition: inline
In-Reply-To: <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>


--Tw3huiGcMxN8u9X/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 10:04:56PM +0530, Ayush Singh wrote:
> On 9/18/24 08:06, David Gibson wrote:
>=20
> > On Mon, Sep 16, 2024 at 03:10:52PM +0530, Ayush Singh wrote:
> > > On 9/12/24 09:08, David Gibson wrote:
> > >=20
> > > > On Mon, Sep 09, 2024 at 12:54:34PM +0530, Ayush Singh wrote:
> > > > > On 9/9/24 10:33, David Gibson wrote:
> > > > >=20
> > > > > > On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
> > > > > > > Add ability to resolve symbols pointing to phandles instead o=
f strings.
> > > > > > >=20
> > > > > > > Combining this with existing fixups infrastructure allows cre=
ating
> > > > > > > symbols in overlays that refer to undefined phandles. This is=
 planned to
> > > > > > > be used for addon board chaining [1].
> > > > > > I don't think this "autodetection" of whether the value is a ph=
andle
> > > > > > or path is a good idea.  Yes, it's probably unlikely to get it =
wrong
> > > > > > in practice, but sloppy cases like this have a habit of coming =
back to
> > > > > > bite you later on.  If you want this, I think you need to desig=
n a new
> > > > > > way of encoding the new options.
> > > > > Would something like `__symbols_phandle__` work?
> > > > Preferable to the overloaded values in the original version, certai=
nly.
> > > I can whip it up if that would be sufficient. But if we are talking a=
bout
> > > any big rewrite, well, I would like to get the details for that sorte=
d out
> > > first.
> > Fair enough.
> >=20
> > > > > It should be fairly
> > > > > straightforward to do. I am not sure how old devicetree compilers=
 will react
> > > > > to it though?
> > > > Well, the devicetree compiler itself never actually looks at the
> > > > overlay encoding stuff.  The relevant thing is libfdt's overlay
> > > > application logic... and any other implementations of overlay handl=
ing
> > > > that are out there.
> > > >=20
> > > > At which I should probably emphasize that changes to the overlay
> > > > format aren't really mine to approve or not.  It's more or less an
> > > > open standard, although not one with a particularly formal definiti=
on.
> > > > Of course, libfdt's implementation - and therefore I - do have a fa=
ir
> > > > bit of influence on what's considered the standard.
> > > So do I need to start a discussion for this somewhere other than the
> > > devicetree-compiler mailing list? Since ZephyrRTOS is also using devi=
cetree,
> > > maybe things need to be discussed with them as well?
> > <devicetree-spec@vger.kernel.org> and <devicetree@vger.kernel.org> are
> > the obvious candidate places.  There will be substantial overlap with
> > devicetree-compiler of course, but not total probably.
> >=20
> > > > > I really do not think having a different syntax for phandle symbo=
ls would be
> > > > > good since that would mean we will have 2 ways to represent phand=
les:
> > > > >=20
> > > > > 1. For __symbols__
> > > > >=20
> > > > > 2. For every other node.
> > > > I'm really not sure what you're getting at here.
> > > I just meant that I would like to keep the syntax the same:
> > >=20
> > > sym =3D <&abc>;
> > Ok, the syntax for creating them in dts, rather than the encoding
> > within the dtb.  Why are you manually creating symbols?
> >=20
> > So.. aside from all the rest, I don't really understand why you want
> > to encode the symbols as phandles rather than paths.
>=20
> It's for connector stacking using the approach described here [0].

Thanks for the link.

> To go into more detail, let us assume that we have a mikrobus connector on
> the base board. We connect an addon board that exposes a grove connector.
> Now to describe the parent i2c adapter of the grove connector, we cannot
> really specify the full node path. However, having support for phandles
> would make writing the overlay for such an addon board possible.
>=20
> In practice it might look as follows:
>=20
>=20
> mikrobus-connector.dtso
>=20
>=20
> &{/} {
>=20
> =A0=A0 __symbols__ {
>=20
> =A0=A0=A0 =A0=A0=A0 MIKROBUS_SCL_I2C =3D "path";
>=20
> =A0=A0=A0 =A0=A0=A0 ...
>=20
> =A0=A0=A0 };
>=20
> }
>=20
>=20
> grove-connector-addon.dtso
>=20
>=20
> &{/} {
>=20
> =A0=A0=A0 __symbols__ {
>=20
> =A0=A0=A0 =A0=A0=A0 GROVE_PIN1_I2C =3D <&MIKROBUS_SCL_I2C>;
>=20
> =A0=A0=A0 };
>=20
> };

So, essentially you're just adding new labels as aliases to existing
labels?

Ok, I can see at least two ways of doing that which I think are a more
natural fit than allowing symbols to be phandles.

# Method 1: Allow path references in overlays

dts allows references both in integer context:
	foo =3D <&bar>;
in which case it resolves to a phandle, but also in string/bytestring conte=
xt:
	foo =3D &bar;
In which case it resolves to a path.

Runtime overlays, only support the former, but could be extended to
support the latter form.  It would be a trickier than phandle
references, because updating a path reference would require expanding
/ shrinking the property including it, but I don't think it's super
difficult.

It might be somewhat harder to imlpement than your original proposal,
but it's conceptually simpler and more versatile.  In fact it removes
a currently existing asymmetry between what dts and overlays can do.

# Method 2: /aliases

/__symbols__ is very similar to the much older IEEE1275 concept of
/aliases.  In fact they're encoded identically except for appearing in
/aliases instead of /__symbols__.  The original use for these was in
interactive Open Firmware, so you could type, say, "dev hd" instead of
"dev /pci@XXXXXXXX/scsi@X,Y/lun@XX/..." or whatever path the primary
hard disk had.  Arguably, __symbols__ should never have been invented,
and we should have just used /aliases.  This is the kind of thing I
mean when I say they overlay encoding wasn't very well thought out.

But, here's the thing:

a) aliases can be defined in terms of other aliases:

	aliases {
		scsi0 =3D "/pci@XXXXX/pci-bridge@X,Y/scsi@X,Y";
		hd =3D "scsi0/lun@YY";
	}

b) fdt_path_offset() already resolves aliases

If given a path without a leading '/', it will look up the first
component as an alias, then look up the rest of the path relative to
that.

So, in your example, if the base layer defined MIKROBUS_SCL_I2C as
an alias rather than a symbol, then in the next layer you could have:

&{/} {
     	aliases {
		GROVE_PIN1_I2C =3D "MIKROBUS_SCL_I2C";
	}
}

libfdt should already resolve this when applying overlays, because it
just calls fdt_path_offset().

So your only remainingly difficulty is /aliases versus /__symbols__.
It would be fairly simple to make overlay application expand
__symbols__ in much the same way as aliases.  Or, you could just have
a copy of everything in __symbols__ in aliases as well (which might be
a path to eventually deprecating /__symbols__).  dtc already has the
-A flag which will but all labels into /aliases, very much like -@
will put them all in /__symbols__.

[snip]
> Well, a lot of work is still going in this direction [1]. I myself
> am trying to use it for mikroBUS connectors.

Sure, and I can see why: it seems tantalizingly close to working
simply.  But that doesn't mean it won't have limitations that will
bite you down the track.

> The reason for using devicetree overlays for such connectors is
> because of their loose nature (mikroBUS is also open
> connector). This means that as long as the sensor/ device can make
> do with the pins provided by mikroBUS connector, it can be an addon
> board. And there is no limitation of staking the boards. So one can
> do rpi hat -> mikrbus connectors -> grove connector -> grove some
> addon board.

For example, the very fact that these are loose exposes you to one
pretty obvious limitation here.  Suppose some future board has a
connector with enough pins that you can hang two independent grove
connectors off it, and someone makes a hat/shield/whatever that does
exactly that.  But now the grove addon dtbs need to be different
depending on whether they attach to grove connector 1 or grove
connector 2.

The old "connector binding" proposals I was describing aimed to
decouple the type of the connector from the instance of the connector
for exactly this sort of case.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Tw3huiGcMxN8u9X/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbw41oACgkQzQJF27ox
2GfQuw/5AfzSdD1ppPt3JoHgbSpwN30FcxnoTATQx2sbcNNCamPyMPm+T7B6tG6O
hzfrRn4bvD0Qfl0Rh7AdViJ0ZUA4IyotoOmP/HL9GeMQ0iWPwTzu7AxKvwVgaKHL
HLvpzfGM1oYHojes9UgKxpUQCoL0Cj6mLVpk18uElbmCjx3HM+966NtiVF0b/bRP
u5TK5mvbBd8XwSY3zjPi/zSUgEvBUPx3UsNBdkIBkBs0b4CKIyeFSz302vtqRkGD
4Vl6a1zRoZKUv+LYseolDgiM0cQgCWAm98eNxbhYOCLvoSehC3pK+uGSHVN+jDsF
HhCrLBeOskjq4rbgH4uB0GLldM4PquKDZwy7g1XVxZ9GvkLBpwdLoHQICKaW3MGj
b+mrUXtWNbSeUrb8DEu10EXY+95rDGTN8kn5EzfNzzcJ8g4YUS/zzNwfr8ikceB0
hooD4S5bcEbypNq5Y79xADL5dO7ZL3max2hXRsG6Rp0O/S5UbT3may8+AWGTWJ4D
WFbUau2mKtjy2QffiRJSDHilhdImEu+4AuCnK5puybfD5RZIhnF7+A+YN01UU/Ji
macJ8W+KGRKpwzRKESED5ux/MBrXHSQFdSgLHwnCPLvjV/G2G8APmTxUz0q2H2oV
/8xu76cEYZfA3ut0SLaZ3FnmY/nuVmWnZPOrpyFWKr7ATdMOhWU=
=BJLU
-----END PGP SIGNATURE-----

--Tw3huiGcMxN8u9X/--
