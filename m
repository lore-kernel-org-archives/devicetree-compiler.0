From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Thu, 2 Feb 2017 16:05:53 +1100
Message-ID: <20170202050553.GF13219@umbus.fritz.box>
References: <1485767585.7612.23.camel@hellion.org.uk>
 <20170130234932.GB14879@umbus.fritz.box>
 <1485851088.7612.32.camel@hellion.org.uk>
 <20170201001654.GB30639@umbus.fritz.box>
 <20170201010004.GG30639@umbus.fritz.box>
 <1485934446.7612.36.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486011965;
        bh=fjkNnfJxX2jze2tHAJva51rvaPPMMx8hxcGGASjSTw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SmPsMTz/SWsCV2s2bbcNIUDcExki8IxpkRdJ5fu4oECZMUqR2/VVsHXlESxhALbo0
         aHFdLGVXpifK1+lGWBS1y0cLpj1gtvlA9/tWtrIARM40jQIPo5f1n6FxsCPpNHYPO0
         sniit1zOSqy4JQn8Hkjt+m7Z128tIYhJRi7H5KBA=
Content-Disposition: inline
In-Reply-To: <1485934446.7612.36.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--4f28nU6agdXSinmL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2017 at 07:34:06AM +0000, Ian Campbell wrote:
> On Wed, 2017-02-01 at 12:00 +1100, David Gibson wrote:
> > On Wed, Feb 01, 2017 at 11:16:54AM +1100, David Gibson wrote:
> > > On Tue, Jan 31, 2017 at 08:24:48AM +0000, Ian Campbell wrote:
> > > > On Tue, 2017-01-31 at 10:49 +1100, David Gibson wrote:
> > > > > On Mon, Jan 30, 2017 at 09:13:05AM +0000, Ian Campbell wrote:
> > > > > > Hello,
> > > > > >=A0
> > > > > > I wasn't sure how/where to make a wishlist bug report, so I hop=
e this
> > > > > > will suffice, am happy to be pointed in a different direction t=
hough.
> > > > > >=A0
> > > > > > I recently[0] stumbled over around 1,000 of these:
> > > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a re=
g or ranges property, but no unit name
> > > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-osc=
illator has a reg or ranges property, but no unit name
> > > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a re=
g or ranges property, but no unit name
> > > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a re=
g or ranges property, but no unit name
> > > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-osc=
illator has a reg or ranges property, but no unit name
> > > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc has a re=
g or ranges property, but no unit name
> > > > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): Node /soc/main-osc=
illator has a reg or ranges property, but no unit name
> > > > > >=A0
> > > > > > When building the split device tree repo[1] from the Linux sour=
ce
> > > > > > (essential it's a build of every single dts in the kernel sourc=
e).
> > > > > >=A0
> > > > > > The cause of the warning is an issue which needs to be fixed bu=
t I
> > > > > > thought I would mention that it would be very useful (I expect)=
 if dtc
> > > > > > would include the offending file in warnings (like e.g. gcc wou=
ld), not
> > > > > > just because of the number of *.dtb being built here but also d=
ue to
> > > > > > #include and /include/ of .dtsi files.
> > > > >=A0
> > > > > Right, having the filenames - and line numbers - there would cert=
ainly
> > > > > be helpful.=A0=A0Unfortunately, it's not at all trivial to implem=
ent.=A0=A0As
> > > > > someone said in a different thread, these checks take place (and =
have
> > > > > to) after the tree is completely parsed and we no longer have sou=
rce
> > > > > locations readily to hand.
> > > >=A0
> > > > Would it be easier (or possible) to print the name of the eventuall=
y-
> > > > to-be-output binary? At the moment=A0the user is left guessing whic=
h one
> > > > of 1,200 *.dtb files they just built produced each of the similar
> > > > number of warnings. If the message was instead:
> > > >=A0
> > > >=A0=A0=A0=A0=A0Warning (unit_address_vs_reg): arch/arm/boot/dts/foo.=
dtb: Node /soc has a ...
> > > >=A0
> > > > Then that would at least be something to go on.
> > > >=A0
> > > > In fact, given the checks are on the final tree, naming the output =
file
> > > >=A0=A0in the messages seems fairly logical (you could even imagine d=
oing
> > > > these checks in a separate linter tool after the fact, given the *.=
dtb
> > > > as input, I suppose)
> > >=A0
> > > Hm, possible, though a bit messy to do within dtc.=A0=A0The output fi=
le is
> >=20
> > s/is/isn't/=A0=A0duh.
> >=20
> > > currently passed into that section of the code, but I guess we could
> > > add it.
> > >=A0
> > > However, it seems this would more easily be fixed from the Makefile
> > > side: if you echo a (suitably abbreviated) dtc command line, then it
> > > should become obvious which dtb the errors are associated with.
>=20
> Not with "make -j12" sadly. I suppose people could rerun make without
> the -j to figure out where the warning came from, but it seems rather
> suboptimal to me.

Yeah, I guess.  Given it's possible though I'm disinclined to make a
change to dtc myself.  Feel free to send a patch and I'll think about
it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkr4xAAoJEGw4ysog2bOS+AMP/RieVgmDJTomGms1krMTAvBG
9pq4Kkm5tmnjGLLLCpMf2eZ2ajooJj+//rUmGeTiz7NVQUgM/+NhL7e2yUxZ1KjV
6wyguqJs0XwkZuky4Ri2T+keUiE6UMDiGDmOZnV5db909pHpQGvuPftqL3hxrAmz
VkqkUHBn52MNp/KBvN6GZyszf3ItL6IS27SXaiJbuo+VVilR8x4Xm2nIOSxouuEE
LoC2WAZVFibUIl6ExbRDcSd+suAzwKAL8qcpAcaqPjTJi4cAb501uvyRl2/p94ZT
vHlqhuRhz6MciFwhuirtaiXW0RZYJ5f8RGwSYmX5by8/fxG2th+G/UaEipMcNGoM
MOgR5he/qgEXBvUewtwVa2VsYM079yANqnDuqjPbEyp+GluuXu1P5ugvauLdBYSt
Hw1Tv2AMJEKTpNlErUxVHR8UHqN2WbOj24IriyyXMiPm3MsLDtnZKG+2N6/BXigk
N8LsIHRTCfEdM3UvsODEQ2MjM29HWUiynqaOtaF7JQdXgob3wvQ5q/T+QIsYq9kS
DSmKW/P/Bjuxaqu9BqHYCnlfLrZJr8qNNq11m7uDa41dgEMGHqfsDSPrjJfUWAzN
RTI4+N15E0G5yRYaMbhfi44lMelbBTUrUEUlX+qvko1DLGdxrm/cs2ePy+NOIhPk
W2htM+7DPS53pU0Ldoja
=AreX
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
