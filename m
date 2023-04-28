From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Bug or feature? /somenode overwrites /somenode@17 in fdt-overlay
Date: Fri, 28 Apr 2023 17:01:13 +1000
Message-ID: <ZEtvOVy3eZwgubMr@yekko>
References: <20230425145504.tswuitufzikuhmnz@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yO7KfA7YyQ1CsWUb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682665288;
        bh=5l6XS12i/KLLcifV6/iXSLSoQxX3mFEBlplVTzKrfcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N9Ed279sxYZ/VzB3YwOT9Zz/xyyoKxwfj1mh0MtfLp9wsuIl06HaeSizPcfWqMF1R
         JFGFLMtpoGlxkOB96v014oPSBCKa+8dLKF29z9ieoerbnnxu5LRrjpq9sVH6dukIqQ
         Cq5ZEczqjmzNbmowKcSdIQi37lSs0daewwIjrskk=
Content-Disposition: inline
In-Reply-To: <20230425145504.tswuitufzikuhmnz-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--yO7KfA7YyQ1CsWUb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 04:55:04PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> TL;DR: The node &{/somenode} in my overlay overwrites &{/somenode@27}.
> Is this expected?

Huh, this is a really interesting case.  So I think the overall answer
is "no" that's not expected.  However, what exactly we should do
instead is not entirely obvious

This happens as a consequence of the fact that that using a path
reference here is interpreted just like a path reference anywhere -
and I don't think we want to change that.

DT paths - for convenience, and to match long standing OF conventions
- allow you to omit the unit addresses, and will resolve to something
matching the base name.

The case of overlays is particularly surprising, but it occurs to me
that this could also be confusing for other uses of path references:

/ {
    somenode@abcd1234fedc9876 {
        . . .
    };
    othernode@100 {
        something =3D <&{/somenode}>;
    };
}

Could be desirable for brevity.  However it becomes ambiguous and
potentially confusing if another somenode@<different address> is added
later.

So, I think when resolving path references, we should stop just
accepting the first match we find, but instead search the whole tree
and trip an error if it's ambiguous.  That should avoid the confusing
situation you encountered

> I have the following base and overlay dts files:
>=20
> 	uwe@taurus:~/tmp/fdtoverlay$ cat base.dts
> 	/dts-v1/;
>=20
> 	/ {
> 		somenode@12 {
> 			property =3D <0x2a>;
> 		};
>=20
> 		somenode@27 {
> 			property =3D <0x20>;
> 		};
> 	};
> 	uwe@taurus:~/tmp/fdtoverlay$ cat overlay.dts
> 	/dts-v1/;
> 	/plugin/;
>=20
> 	&{/somenode} {
> 		property =3D <0x17>;
> 	};
>=20
> When compiling these and using them with fdtoverlay I see that
> /somenode@12 is overwritten(. And if I swap the order of /somenode@12
> and /somenode@27 in base.dts, the latter is overwritten instead):

Of course in the case of runtime overlays we can't perform this check
at compile time.  We can, and probably should, check for ambiguity in
path reference during overlay application.  However, that doesn't
entirely address the problem - because we don't know everything about
the base tree, doing this is kind of bad practice in an overlay.

Unfortunately, we can't outright ban (or deprecate) fragment targets
with no unit address, because we might need to update a node which has
no unit address.

We could change the semantics of runtime overlays so that paths are
interpreted strictly - no missing unit addresses allowed.  I'm pretty
disinclined to do that though: it means paths there would be
interpreted differently from how they are everywhere else.  It could,
at least in theory, break existing overlays that work in situations
where the target is not ambiguous.  This might even make some sensible
seeming overlays impossible: imagine an overlay designed to patch a
property on the ethernet node for a closely related family of SoCs.
We only expect there to be one ethernet on the SoC, but maybe
different minor revisions changed the NIC's address.  With the current
behaviour a single overlay can handle both revisions, with the changed
behaviour it couldn't.

Another thing to bear in mind is that if you're using path-target
overlays you're already kind of in fragile hack territory.  A base
tree that's designed for overlay patching should be exporting symbols
with a clear convention on what labels a compatible overlay can
expect.

> uwe@taurus:~/tmp/fdtoverlay$ dtc -I dts -O dtb -o base.dtb base.dts && dt=
c -I dts -O dtb -o overlay.dtb overlay.dts && fdtoverlay -i base.dtb -o bas=
e+overlay.dtb overlay.dtb && fdtdump base+overlay.dtb
> base.dts:4.14-6.4: Warning (unit_address_vs_reg): /somenode@12: node has =
a unit name, but no reg or ranges property
> base.dts:8.14-10.4: Warning (unit_address_vs_reg): /somenode@27: node has=
 a unit name, but no reg or ranges property
>=20
> **** fdtdump is a low-level debugging tool, not meant for general use.
> **** If you want to decompile a dtb, you probably want
> ****     dtc -I dtb -O dts <filename>
>=20
> /dts-v1/;
> // magic:		0xd00dfeed
> // totalsize:		0x99 (153)
> // off_dt_struct:	0x38
> // off_dt_strings:	0x90
> // off_mem_rsvmap:	0x28
> // version:		17
> // last_comp_version:	16
> // boot_cpuid_phys:	0x0
> // size_dt_strings:	0x9
> // size_dt_struct:	0x58
>=20
> / {
>     somenode@12 {
>         property =3D <0x00000017>;
>     };
>     somenode@27 {
>         property =3D <0x00000020>;
>     };
> };
>=20
> I was surprised and wonder if this is as designed or if this is a bug
> that should be fixed. Any insights?

As above, it's not really either.  This is a consequence of applying
established rules in a new situation where the results are a bit
counterintuitive.

I think the best we can do is to report error on ambiguous path
resolution, both within dtc itself and in the overlay application code
of libfdt.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yO7KfA7YyQ1CsWUb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRLbzMACgkQzQJF27ox
2Gescg//QEjqTgBO19A94oNWrdierf1nKo6nDdtwym636Yjn+mDbxw+rupgVgX+h
jpeYdJVpe+9Y7TPLtnE7mwjNRhb8WCJn8KIRG4NYeMDFXMOEpQIJCBmzuKkCslFf
DDJe+eQBlH8mtY5bzXB8bh6TYFCrVa+nyOt/Hmknse773nW19wzhbbsrrZV575ns
oC5lWBUEdC/+SGNm4DDs+5VXlwRhGIgMOURBVqhcP9WkNt5MwcjfFI2/li5c2lym
w6O9frAZaL/wtStcQL8Q7plPYqmYmf2ldtZJoEgEPRnTZkUpBVHlrWZBOJMHsOJj
ZmJ/3qh9X3SEwi2CAMLU0KzPla/5jYKn2S9fQrPA03PsDB5Ae7doJb+Q6bLFfcpp
TJITfuP6r0ioRcMvYNap0CLZFR0o8ifavHoyHM41vyAKoMaG67M3CGypaTWbBC6y
PbYMZr+5MaT/L1mACOPBR2I7DYK/ZpTRWzw2S4UB4QqXAHm8yDgu4DJpU+MRfZ9V
rw/qJIfefE9Jg0gNd7C6H4OwqOw8x5umbv3FBrL3yN5iPnIyb7nBF/aiMcG+Okxv
s74SqqSkXgka8+uyDinkrr/e0FzTNZ82whsgwhj1FrEEBpPICVtnwMon5Yflgpk2
hAdLOz9lCxA5ZvujKwiUMcMYWycuKOy4gCk5HDGHGhrytfOWFUM=
=Iw1Z
-----END PGP SIGNATURE-----

--yO7KfA7YyQ1CsWUb--
