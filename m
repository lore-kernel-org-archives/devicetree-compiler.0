From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Thu, 4 Jan 2018 14:16:13 +1100
Message-ID: <20180104031613.GY24581@umbus.fritz.box>
References: <20180101041518.23806-1-kevans@FreeBSD.org>
 <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
 <20180103025856.GL24581@umbus.fritz.box>
 <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
 <20180103035510.GO24581@umbus.fritz.box>
 <CACNAnaGwpwRO27d2trLBqZjtiZYP1HBP=ck6GJ2N8VrTNehnFw@mail.gmail.com>
 <20180104005407.GS24581@umbus.fritz.box>
 <CACNAnaGEV=YDFsLbGBN+O68dJnDXeRwd0YaXWb2u3x1rSdkF8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MqIM5Iaa8ROQPHlo"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515035827;
        bh=WvTnD/mSarhTH16oWzpvGTCk1v8yD7V006Uy7oUtdmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c2HOsyHAojgMUBlxjHP3oJh9D2PaA+K/i4RjBcUAx2VG+NrY+v+kp7bispUiwPpAS
         zzz4WuLQz5QG5CBhvy6nA8v4K+xT+ivW/h3/x9p1DBg99nzux3XEZfYu5Sk3AB52S5
         alNlBHwjI3KFwa8+Fwg59WpGVYgo1EI1hoRsXvag=
Content-Disposition: inline
In-Reply-To: <CACNAnaGEV=YDFsLbGBN+O68dJnDXeRwd0YaXWb2u3x1rSdkF8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--MqIM5Iaa8ROQPHlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 07:47:55PM -0600, Kyle Evans wrote:
> On Wed, Jan 3, 2018 at 6:54 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Jan 03, 2018 at 08:03:27AM -0600, Kyle Evans wrote:
> >> On Tue, Jan 2, 2018 at 9:55 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > [... snip ...]
> >> > Great.  MacOS support is interesting in particular, because unlike
> >> > FreeBSD, I can set up a Travis build to test it there, which means I=
'm
> >> > much more likely to catch regressions.  In fact, looks like I have a
> >> > stale branch here that added an OSX build to the travis.yml - I think
> >> > some of the errors you've found and didn't have time to debug them
> >> > (debugging when your only host is indirect through Travis is pretty
> >> > painful).
> >>
> >> It'd be interesting to see those results as of recent. Their userland
> >> should be similar enough in the ways you care about for the results to
> >> likely be relevant to us, I would think.
> >
> > I rebased and tried it again:
> >     https://travis-ci.org/dgibson/dtc/jobs/324587391
> >
> > Looks like we're getting problems with the interesting way I (ab)use
> > the assembler to produce a test blob.  I've hit a number of problems
> > with that over time, so I'd really like to replace it with something
> > else.  Unfortunately, I haven't yet thought of a replacement that
> > wouldn't be a pain in the arse.
>=20
> That's interesting- I wonder what version of LLVM this maps to? Or are
> they so far gone that it doesn't matter? We've got an effort over here
> going to replace our system linker with LLD; the version of LLD that
> we're optionally using on -HEAD right now has no problem with this:
>=20
> $ ld.lld --version
> LLD 5.0.1 (FreeBSD 320880) (compatible with GNU linkers)

I think the problem is at the asm level, rather than the linker level.
Specifically I think it's failing to realize that expressions of the
form (sym2 - sym1) where sym2 and sym1 are both local labels are
actually assemble time constant and don't need relocation, even if the
symbols themselves do.

If they actually did need relocation, I don't think they're in a form
I'd expect any linker to be able to cope with (or even the ELF format
itself).

I suppose it's possible there's something in the OSX ABI which means
these things really can't be assemble time evaluated, in which case
we'd be pretty stuck.

According to the Travis logs it's using:

$ gcc --version
Configured with: --prefix=3D/Applications/Xcode.app/Contents/Developer/usr =
--with-gxx-include-dir=3D/usr/include/c++/4.2.1
Apple LLVM version 8.1.0 (clang-802.0.42)
Target: x86_64-apple-darwin16.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDe=
fault.xctoolchain/usr/bin

I'm assuming it will be using the same LLVM version for assembling as
compiling.  Given how out of date the Linux images often are on
Travis, it wouldn't suprise me of the OSX ones are as well.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MqIM5Iaa8ROQPHlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNnHsACgkQbDjKyiDZ
s5KSHxAAl2R4vvpY/G8t1wyaLQkjba73zugZVlnVGGIwDgWI1oEGU3llnjlg6kaX
3/c73YUt4f7sZ+7DqnoXCR98jsyKNqKTJi07M+yQ1gXqsNjsU+FYBwg6b21/kycw
truy2IheuyLXO/SYUrKgi9zLsbVCZkV2a452a+pdd4XYn3J6tlQlzPHMXcMr5FVB
ygX1MwNAB43T/pKgW8+PSwSb1hFSkMAOIdG+yVj4L0vL1/IGyxb+W9FXgzdmR7mx
xEMpGtgOD0a5CQTOI5ST7NDzsxd7jv1vNthGB+2DXq0pKWZsDM0i9p0XqFyfzfr2
LbmYhXVzrwRxTmBLNdG8Z/Bv2+TZQTitGAJcFfpt78qd6x19P6bnHzcZoPxeBdOn
rzhpMFketYwKpc8nH5eqGo44n6CHB9f2gvZPegKjDKvB+jTJBolNVHq3/RMdamaN
ZzVJWLOJYx8B23IJMNpY41pS1d8tlcnZQ4SjhdRWiJslaV/shWEKpOdJnXjbV3PJ
nscwVZTk9EEcpqWwEcmQQEv6BQ3PJjZAEHQTN0NKeDzL39puAnnsxi4gAwfC3ZCA
pVclqOfnKE/B/m8pq+U1h+jwjPs6QhI0ggpmzRx4tZ+QPkhlMCm9uA+QZXRymnB9
5RWa7cph3LKaPkLjUOuR04yQauX7L+tKnKFuu9oRP1d7SYZ/eZs=
=EvyU
-----END PGP SIGNATURE-----

--MqIM5Iaa8ROQPHlo--
