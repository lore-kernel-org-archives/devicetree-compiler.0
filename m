From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Tue, 31 Jan 2017 10:49:32 +1100
Message-ID: <20170130234932.GB14879@umbus.fritz.box>
References: <1485767585.7612.23.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1485823397;
        bh=tuWKuUIUo3PGu7CO3y/nDXsCEePWzxbQDE4za9OKdUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MAlEUOny0uzJTYwQyN1Jt2Kpy8VrpvSujj8Icv6IjmBVda7MtRyYvpZlMp/i9i8aX
         NY8db3ujJEYg71Qiu/R1RIkoPgmFQVX5OkkRgFgGuclgiwzkose5NMVSvI6CsRNB2k
         SEAz2Y84OAhR0NLUqoZYYHGcctkuSu27X7Sq60xQ=
Content-Disposition: inline
In-Reply-To: <1485767585.7612.23.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 09:13:05AM +0000, Ian Campbell wrote:
> Hello,
>=20
> I wasn't sure how/where to make a wishlist bug report, so I hope this
> will suffice, am happy to be pointed in a different direction though.
>=20
> I recently[0] stumbled over around 1,000 of these:
>     Warning (unit_address_vs_reg): Node /soc has a reg or ranges property=
, but no unit name
>     Warning (unit_address_vs_reg): Node /soc/main-oscillator has a reg or=
 ranges property, but no unit name
>     Warning (unit_address_vs_reg): Node /soc has a reg or ranges property=
, but no unit name
>     Warning (unit_address_vs_reg): Node /soc has a reg or ranges property=
, but no unit name
>     Warning (unit_address_vs_reg): Node /soc/main-oscillator has a reg or=
 ranges property, but no unit name
>     Warning (unit_address_vs_reg): Node /soc has a reg or ranges property=
, but no unit name
>     Warning (unit_address_vs_reg): Node /soc/main-oscillator has a reg or=
 ranges property, but no unit name
>=20
> When building the split device tree repo[1] from the Linux source
> (essential it's a build of every single dts in the kernel source).
>=20
> The cause of the warning is an issue which needs to be fixed but I
> thought I would mention that it would be very useful (I expect) if dtc
> would include the offending file in warnings (like e.g. gcc would), not
> just because of the number of *.dtb being built here but also due to
> #include and /include/ of .dtsi files.

Right, having the filenames - and line numbers - there would certainly
be helpful.  Unfortunately, it's not at all trivial to implement.  As
someone said in a different thread, these checks take place (and have
to) after the tree is completely parsed and we no longer have source
locations readily to hand.

It might be possible to attach (optional) srcpos * markers to each
node and property in the live tree.  However, that runs into other
complications: when using dts includes nodes can be merges of
information from several different dtsi files.  So, a node can be
composed of information from several non-contiguous chunks of source
=66rom different files.  It's not clear what should be printed in that
case.

If you can see a reasonable way to do this, I'd love to see patches
for it, but I certainly don't have time to tackle it myself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYj9EKAAoJEGw4ysog2bOSWA8P/j331UBxF81pOZdAGAES77fL
8QPNuJpx9TL4ZdbaWTucHFgwgzkGNfyEa/fjpfwyoy66HO8wmKKQDdu8j+LTD9OX
V2AY9F2QSewyP+oVL3NsnicDtoPo6bNr0sPkI82Q5+0uCFdkADijXxw1oSXpe/lN
Pf3uPlGNTLoc894KvjG1YOf8zOewXlhUvWHhUD6ifvabzL1/BG2vsvarH3o+0b3k
PsoPrF8t/IeWs4j9DuwKw8eSw7nDKLf3mDI5Hvp3t0jc4rR6wiFrZ6PNYVgYa12A
7ZVLH7zlzUAi7jTylJ5RrfIUCqM7q6wq/l5ZfIzUKhNcdEW9zEY2cbGOYM4X7Qk/
psBzXtXp0qhusc810QpB1n9Lz4dXbGTwghDGIbahXrb28AwqanKx2kOw8Qf+eqxe
+gzdLIMgRtKxY0xjcQriVC+5/yttxkBccQRBtzbDQVp+aEsX/O1cKwsVI+YUB9z2
IIeTpsl2qB0IEDy0zbcAquHAC9t3X5BOlIGP5dwZStjn1AV1oaD90HRgf3EPYBl0
708Xpju7FZQYXJXA9KmeISpvR2HPUMrfII3+7J6ingNcBNBGpfZ5rSDZ4VWCLd7R
fAPYQAxeETPsRuZd+lN7MO5bU00Q5mzwTep+gV4Bu0Q9zhQyx6reHYp5zm1dadFB
A+cNiOzGrGgcmjAtS6JT
=1vLo
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
