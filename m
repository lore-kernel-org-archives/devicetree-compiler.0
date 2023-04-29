From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Bug or feature? /somenode overwrites /somenode@17 in fdt-overlay
Date: Sat, 29 Apr 2023 16:21:06 +1000
Message-ID: <ZEy3UiOailJ8/JxA@yekko>
References: <20230425145504.tswuitufzikuhmnz@pengutronix.de>
 <ZEtvOVy3eZwgubMr@yekko>
 <20230428180441.hn34wlwevuj75zml@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kDWdmBb+9VpA6s+g"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682751134;
        bh=Jfw+/2mQ6xaxxWmE+AQXxrzvGW1ccbp2dJpYj8OWtP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cVxNp5ufgBgbE2htVBLZ7SkPcwuu6Uwa5FQsTsmh1Qljk+y4kRGJR0CyA9G+/61Au
         HkwDFSe0UGpR1EI8suCDmm4cwJ3pCy8Z1Ilriik3pJHJvDDorR5NC4bnoc+R2IhpGf
         h/ah0O+CqFPICtZTq6G+Y7gm/chwi5cYnvEzzIVY=
Content-Disposition: inline
In-Reply-To: <20230428180441.hn34wlwevuj75zml-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--kDWdmBb+9VpA6s+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 08:04:41PM +0200, Uwe Kleine-K=F6nig wrote:
> Helle David,
>=20
> On Fri, Apr 28, 2023 at 05:01:13PM +1000, David Gibson wrote:
> > On Tue, Apr 25, 2023 at 04:55:04PM +0200, Uwe Kleine-K=F6nig wrote:
> > > TL;DR: The node &{/somenode} in my overlay overwrites &{/somenode@27}.
> > > Is this expected?
> >=20
> > Huh, this is a really interesting case.  So I think the overall answer
> > is "no" that's not expected.  However, what exactly we should do
> > instead is not entirely obvious
>=20
> IMHO there is a need for a set of different lookup functions.

Hmm.. I'm not yet convinced.

> Something like fdt_subnode_offset_strict() that does a lookup without
> unit address interpolation. And maybe rename fdt_path_offset to
> fdt_path_offset_lax() (but keep the name without suffix for API/ABI
> compatibility). And the same for all functions that have a similar
> issue.
>=20
> Then all internal usages could be reviewed and switched to the right
> variant.

Hrm.  I think having two ways of looking up paths adds potential
confusion, so we need a very strong case if we're going to do that.

> Changing the lax variants to error out if there is no unambiguous match
> also sounds like a good idea.

This however, we should do.

> > This happens as a consequence of the fact that that using a path
> > reference here is interpreted just like a path reference anywhere -
> > and I don't think we want to change that.
> >=20
> > DT paths - for convenience, and to match long standing OF conventions
> > - allow you to omit the unit addresses, and will resolve to something
> > matching the base name.
> >=20
> > The case of overlays is particularly surprising, but it occurs to me
> > that this could also be confusing for other uses of path references:
> >=20
> > / {
> >     somenode@abcd1234fedc9876 {
> >         . . .
> >     };
> >     othernode@100 {
> >         something =3D <&{/somenode}>;
> >     };
> > }
> >=20
> > Could be desirable for brevity.  However it becomes ambiguous and
> > potentially confusing if another somenode@<different address> is added
> > later.
> >=20
> > So, I think when resolving path references, we should stop just
> > accepting the first match we find, but instead search the whole tree
> > and trip an error if it's ambiguous.  That should avoid the confusing
> > situation you encountered
> >=20
> > > I have the following base and overlay dts files:
> > >=20
> > > 	uwe@taurus:~/tmp/fdtoverlay$ cat base.dts
> > > 	/dts-v1/;
> > >=20
> > > 	/ {
> > > 		somenode@12 {
> > > 			property =3D <0x2a>;
> > > 		};
> > >=20
> > > 		somenode@27 {
> > > 			property =3D <0x20>;
> > > 		};
> > > 	};
> > > 	uwe@taurus:~/tmp/fdtoverlay$ cat overlay.dts
> > > 	/dts-v1/;
> > > 	/plugin/;
> > >=20
> > > 	&{/somenode} {
> > > 		property =3D <0x17>;
> > > 	};
> > >=20
> > > When compiling these and using them with fdtoverlay I see that
> > > /somenode@12 is overwritten(. And if I swap the order of /somenode@12
> > > and /somenode@27 in base.dts, the latter is overwritten instead):
> >=20
> > Of course in the case of runtime overlays we can't perform this check
> > at compile time.  We can, and probably should, check for ambiguity in
> > path reference during overlay application.  However, that doesn't
> > entirely address the problem - because we don't know everything about
> > the base tree, doing this is kind of bad practice in an overlay.
>=20
> Agreed. However it's unclear to me what information is missing. Of
> course you don't know the base tree at the time the overlay is compiled,
> but at application time the available information should be complete,
> shouldn't it?

Right, at overlay application time we have all the information.
However at overlay application time our options for reporting and
handling errors are typically rather more constrained than at compile
time.

> > Unfortunately, we can't outright ban (or deprecate) fragment targets
> > with no unit address, because we might need to update a node which has
> > no unit address.
> >=20
> > We could change the semantics of runtime overlays so that paths are
> > interpreted strictly - no missing unit addresses allowed.  I'm pretty
> > disinclined to do that though: it means paths there would be
> > interpreted differently from how they are everywhere else.  It could,
> > at least in theory, break existing overlays that work in situations
> > where the target is not ambiguous.  This might even make some sensible
> > seeming overlays impossible: imagine an overlay designed to patch a
> > property on the ethernet node for a closely related family of SoCs.
> > We only expect there to be one ethernet on the SoC, but maybe
> > different minor revisions changed the NIC's address.  With the current
> > behaviour a single overlay can handle both revisions, with the changed
> > behaviour it couldn't.
> >=20
> > Another thing to bear in mind is that if you're using path-target
> > overlays you're already kind of in fragile hack territory.  A base
> > tree that's designed for overlay patching should be exporting symbols
> > with a clear convention on what labels a compatible overlay can
> > expect.
> >=20
> > > uwe@taurus:~/tmp/fdtoverlay$ dtc -I dts -O dtb -o base.dtb base.dts &=
& dtc -I dts -O dtb -o overlay.dtb overlay.dts && fdtoverlay -i base.dtb -o=
 base+overlay.dtb overlay.dtb && fdtdump base+overlay.dtb
> > > base.dts:4.14-6.4: Warning (unit_address_vs_reg): /somenode@12: node =
has a unit name, but no reg or ranges property
> > > base.dts:8.14-10.4: Warning (unit_address_vs_reg): /somenode@27: node=
 has a unit name, but no reg or ranges property
> > >=20
> > > **** fdtdump is a low-level debugging tool, not meant for general use.
> > > **** If you want to decompile a dtb, you probably want
> > > ****     dtc -I dtb -O dts <filename>
> > >=20
> > > /dts-v1/;
> > > // magic:		0xd00dfeed
> > > // totalsize:		0x99 (153)
> > > // off_dt_struct:	0x38
> > > // off_dt_strings:	0x90
> > > // off_mem_rsvmap:	0x28
> > > // version:		17
> > > // last_comp_version:	16
> > > // boot_cpuid_phys:	0x0
> > > // size_dt_strings:	0x9
> > > // size_dt_struct:	0x58
> > >=20
> > > / {
> > >     somenode@12 {
> > >         property =3D <0x00000017>;
> > >     };
> > >     somenode@27 {
> > >         property =3D <0x00000020>;
> > >     };
> > > };
> > >=20
> > > I was surprised and wonder if this is as designed or if this is a bug
> > > that should be fixed. Any insights?
> >=20
> > As above, it's not really either.  This is a consequence of applying
> > established rules in a new situation where the results are a bit
> > counterintuitive.
> >=20
> > I think the best we can do is to report error on ambiguous path
> > resolution, both within dtc itself and in the overlay application code
> > of libfdt.
>=20
> I agree that changing existing code paths might be fragile.
>=20
> Still adding the strict flavour variants of the affected functions is a
> good idea. Then future usages can consciously choose which semantic is
> intended.

Yeah... see that's a decision I'd prefer avoiding making people make
unless we really can't avoid it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kDWdmBb+9VpA6s+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRMtzkACgkQzQJF27ox
2GcMlRAAk5wtobI11/d9lKpGuKog0cX4a4VYbWRqSzgDfIa4jplVP8pf0GqiRVjO
rLdBWPbWdymVY/qcliwzsRBMw6QmE24Xuaz1dTQg/p8FQ61OlB/6N3XRXzH9PpOK
yNQeCprIZ826mbNfhyZ5slxIGeRoWQ/S0ok6eMk9RsrHm1529+dzNjXCpAYotyIp
Mk3FsmL3SI4qfoCe/6jXHQ+QEc0DUiPaIsmjxMwmPZMlc2kEVCF5f63knVOav5gK
6IMv7gbVW/E6vPoi6Ye8xLMheEiK/7MRhbwBYRiNMeOl0MwN1AC0N4SUv2FIjuLc
y7CgZJge1tBnsEzhpGYFttBJfksfQ7r9BT5zy5vzkgfsLuU6mGqG2kN89HDarDRC
/uQjxZxGDjlljQt335YPROWzoVX61MeIoj0xhIhY78kNHSXcp/BD6DlEWgY7Jjwx
JdYCWclCkkr165rXX9vxvs3XFO7jbhlWlMImODcxHdne7k6TMLJWdXIgWzGVa781
81qUKHDNVM6mCw+k31B16t5uQ1Mnj7AzO4gtUDU06bXlHZokTS9UMwenB1y/xpdD
3VY29L3h+plAZ5HWK+h3ekToNaHKNkLQbAlyW/pVfls+T4ogLY+ZkzdXnOpyhZDG
rheOecqYyaAWF0MHU+WlhmrLlNcMlh3duZMpPR2mD1+nzIuxnXI=
=lDik
-----END PGP SIGNATURE-----

--kDWdmBb+9VpA6s+g--
