From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Bug or feature? /somenode overwrites /somenode@17 in fdt-overlay
Date: Fri, 28 Apr 2023 20:04:41 +0200
Message-ID: <20230428180441.hn34wlwevuj75zml@pengutronix.de>
References: <20230425145504.tswuitufzikuhmnz@pengutronix.de>
 <ZEtvOVy3eZwgubMr@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6uuy2fvljtbvixn6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ZEtvOVy3eZwgubMr@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--6uuy2fvljtbvixn6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Helle David,

On Fri, Apr 28, 2023 at 05:01:13PM +1000, David Gibson wrote:
> On Tue, Apr 25, 2023 at 04:55:04PM +0200, Uwe Kleine-K=F6nig wrote:
> > TL;DR: The node &{/somenode} in my overlay overwrites &{/somenode@27}.
> > Is this expected?
>=20
> Huh, this is a really interesting case.  So I think the overall answer
> is "no" that's not expected.  However, what exactly we should do
> instead is not entirely obvious

IMHO there is a need for a set of different lookup functions.

Something like fdt_subnode_offset_strict() that does a lookup without
unit address interpolation. And maybe rename fdt_path_offset to
fdt_path_offset_lax() (but keep the name without suffix for API/ABI
compatibility). And the same for all functions that have a similar
issue.

Then all internal usages could be reviewed and switched to the right
variant.

Changing the lax variants to error out if there is no unambiguous match
also sounds like a good idea.

> This happens as a consequence of the fact that that using a path
> reference here is interpreted just like a path reference anywhere -
> and I don't think we want to change that.
>=20
> DT paths - for convenience, and to match long standing OF conventions
> - allow you to omit the unit addresses, and will resolve to something
> matching the base name.
>=20
> The case of overlays is particularly surprising, but it occurs to me
> that this could also be confusing for other uses of path references:
>=20
> / {
>     somenode@abcd1234fedc9876 {
>         . . .
>     };
>     othernode@100 {
>         something =3D <&{/somenode}>;
>     };
> }
>=20
> Could be desirable for brevity.  However it becomes ambiguous and
> potentially confusing if another somenode@<different address> is added
> later.
>=20
> So, I think when resolving path references, we should stop just
> accepting the first match we find, but instead search the whole tree
> and trip an error if it's ambiguous.  That should avoid the confusing
> situation you encountered
>=20
> > I have the following base and overlay dts files:
> >=20
> > 	uwe@taurus:~/tmp/fdtoverlay$ cat base.dts
> > 	/dts-v1/;
> >=20
> > 	/ {
> > 		somenode@12 {
> > 			property =3D <0x2a>;
> > 		};
> >=20
> > 		somenode@27 {
> > 			property =3D <0x20>;
> > 		};
> > 	};
> > 	uwe@taurus:~/tmp/fdtoverlay$ cat overlay.dts
> > 	/dts-v1/;
> > 	/plugin/;
> >=20
> > 	&{/somenode} {
> > 		property =3D <0x17>;
> > 	};
> >=20
> > When compiling these and using them with fdtoverlay I see that
> > /somenode@12 is overwritten(. And if I swap the order of /somenode@12
> > and /somenode@27 in base.dts, the latter is overwritten instead):
>=20
> Of course in the case of runtime overlays we can't perform this check
> at compile time.  We can, and probably should, check for ambiguity in
> path reference during overlay application.  However, that doesn't
> entirely address the problem - because we don't know everything about
> the base tree, doing this is kind of bad practice in an overlay.

Agreed. However it's unclear to me what information is missing. Of
course you don't know the base tree at the time the overlay is compiled,
but at application time the available information should be complete,
shouldn't it?

> Unfortunately, we can't outright ban (or deprecate) fragment targets
> with no unit address, because we might need to update a node which has
> no unit address.
>=20
> We could change the semantics of runtime overlays so that paths are
> interpreted strictly - no missing unit addresses allowed.  I'm pretty
> disinclined to do that though: it means paths there would be
> interpreted differently from how they are everywhere else.  It could,
> at least in theory, break existing overlays that work in situations
> where the target is not ambiguous.  This might even make some sensible
> seeming overlays impossible: imagine an overlay designed to patch a
> property on the ethernet node for a closely related family of SoCs.
> We only expect there to be one ethernet on the SoC, but maybe
> different minor revisions changed the NIC's address.  With the current
> behaviour a single overlay can handle both revisions, with the changed
> behaviour it couldn't.
>=20
> Another thing to bear in mind is that if you're using path-target
> overlays you're already kind of in fragile hack territory.  A base
> tree that's designed for overlay patching should be exporting symbols
> with a clear convention on what labels a compatible overlay can
> expect.
>=20
> > uwe@taurus:~/tmp/fdtoverlay$ dtc -I dts -O dtb -o base.dtb base.dts && =
dtc -I dts -O dtb -o overlay.dtb overlay.dts && fdtoverlay -i base.dtb -o b=
ase+overlay.dtb overlay.dtb && fdtdump base+overlay.dtb
> > base.dts:4.14-6.4: Warning (unit_address_vs_reg): /somenode@12: node ha=
s a unit name, but no reg or ranges property
> > base.dts:8.14-10.4: Warning (unit_address_vs_reg): /somenode@27: node h=
as a unit name, but no reg or ranges property
> >=20
> > **** fdtdump is a low-level debugging tool, not meant for general use.
> > **** If you want to decompile a dtb, you probably want
> > ****     dtc -I dtb -O dts <filename>
> >=20
> > /dts-v1/;
> > // magic:		0xd00dfeed
> > // totalsize:		0x99 (153)
> > // off_dt_struct:	0x38
> > // off_dt_strings:	0x90
> > // off_mem_rsvmap:	0x28
> > // version:		17
> > // last_comp_version:	16
> > // boot_cpuid_phys:	0x0
> > // size_dt_strings:	0x9
> > // size_dt_struct:	0x58
> >=20
> > / {
> >     somenode@12 {
> >         property =3D <0x00000017>;
> >     };
> >     somenode@27 {
> >         property =3D <0x00000020>;
> >     };
> > };
> >=20
> > I was surprised and wonder if this is as designed or if this is a bug
> > that should be fixed. Any insights?
>=20
> As above, it's not really either.  This is a consequence of applying
> established rules in a new situation where the results are a bit
> counterintuitive.
>=20
> I think the best we can do is to report error on ambiguous path
> resolution, both within dtc itself and in the overlay application code
> of libfdt.

I agree that changing existing code paths might be fragile.

Still adding the strict flavour variants of the affected functions is a
good idea. Then future usages can consciously choose which semantic is
intended.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6uuy2fvljtbvixn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRMCrgACgkQj4D7WH0S
/k4b4wf/UZyGqXvC/GtLD9t3u5d3/g6bl4I0TRPvBGNfsHdXDZCl3tXwZPa6ng14
9uQn7/FmtGqnI1gbWVWcGz79BfJL49BZshDGcuyZ+coCx8IYAmlzhBjB7hi4f10y
QWoJ8iVeF3Xr8d0/XdXZ4ShIU+Dy/1oQ7SZnmHjLCfY7OFhHTTeGaKeWFaZBBfk9
wTKAL9ondlgmlHbqDwgyo30kHoIphUu8/e08rw7teIt60GPwIMlMatxngoQMe82N
IGr1fABwxE3xjw22dQWpFgz61zdZlk6vFH0j9mA/pIfnMWPVld2zjVUgtMkvg77w
IAmH7LCgee70NhdCzeQqLzxm7Ehpeg==
=5aOQ
-----END PGP SIGNATURE-----

--6uuy2fvljtbvixn6--
