From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 22 Oct 2020 08:32:54 -0400
Message-ID: <20201022123254.GH14816@bill-the-cat>
References: <CAPnjgZ3jPciWmoVpuoYb9KC2h3eCevZsq+1BzefCOCAFCDoseQ@mail.gmail.com>
 <20201019014213.GA11625@yekko.fritz.box>
 <20201019123700.GH14816@bill-the-cat>
 <20201020020907.GA64103@yekko.fritz.box>
 <20201021224914.GB14816@bill-the-cat>
 <20201022040013.GB1821515@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jzvFrOA4xKmGRWOs"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JSBUvhUp3xtx5Rhb/vbKgIEvWVhCM/t+/cwjivIUIzo=;
        b=SFR8ZmDKSmlpul6UDPhUOPcQg4n++qrvET+MiMxRzHK4H/Y6xpxOThC2HaJPohm+YG
         x8/ma/eMGUeLiI5+xT0OBEDTlZtaA3MF0KSY4xHMDpSTfA2LCCMWKJkaD6R9vVI2DsuN
         tgHa3ryk/u+65tDhXm0JIWZhWOqBHeYURTWSY=
Content-Disposition: inline
In-Reply-To: <20201022040013.GB1821515-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--jzvFrOA4xKmGRWOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson wrote:
> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
> > On Tue, Oct 20, 2020 at 01:09:07PM +1100, David Gibson wrote:
> > > On Mon, Oct 19, 2020 at 08:37:00AM -0400, Tom Rini wrote:
> > > > On Mon, Oct 19, 2020 at 12:42:13PM +1100, David Gibson wrote:
> > > > > On Fri, Oct 16, 2020 at 03:46:41PM -0600, Simon Glass wrote:
> > > > > > Hi Tom,
> > > > > >=20
> > > > > > On Fri, 16 Oct 2020 at 13:36, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wro=
te:
> > > > > > >
> > > > > > > Hey all,
> > > > > > >
> > > > > > > With my U-Boot hat on, I'm trying to move us up from 84e414b0=
b5bc in dtc
> > > > > > > to cbca977ea121.  I'm seeing some rather worrying size increa=
ses
> > > > > > > however.  For example, on an aarch64 board such as leez-rk339=
9 we have:
> > > > > > >      leez-rk3399    : all +2696 spl/u-boot-spl:all +1116 spl/=
u-boot-spl:text +1116 text +2696
> > > > > > >         u-boot: add: 0/0, grow: 42/0 bytes: 2696/0 (2696)
> > > > > > >           function                                   old     =
new   delta
> > > > > > >           do_fdt                                    3992    4=
308    +316
> > > > > > >           fdt_check_header                           276     =
492    +216
> > > > > > >           fdt_add_property_                          388     =
556    +168
> > > > > > >           fdt_ro_probe_                              128     =
252    +124
> > > > > > >           fdt_packblocks_                            176     =
296    +120
> > > > > > >           fdt_open_into                              392     =
512    +120
> > > > > > >           fdt_blocks_misordered_                      96     =
216    +120
> > > > > > >           fdt_get_mem_rsv                            108     =
220    +112
> > > > > > >           fdt_offset_ptr                             104     =
208    +104
> > > > > > >           fdt_get_string                             288     =
388    +100
> > > > > > >           fdt_splice_                                148     =
228     +80
> > > > > > >           fdt_valid                                  204     =
276     +72
> > > > > > >           fdt_getprop_by_offset                      184     =
256     +72
> > > > > > >           fdt_splice_mem_rsv_                         96     =
152     +56
> > > > > > >           fdt_num_mem_rsv                             60     =
116     +56
> > > > > > >           fdt_splice_struct_                          96     =
144     +48
> > > > > > >           fdt_shrink_to_minimum                      220     =
268     +48
> > > > > > >           fdt_rw_probe_                              108     =
156     +48
> > > > > > >           fdt_mem_rsv                                 60     =
108     +48
> > > > > > >           fdt_getprop_namelen                        100     =
148     +48
> > > > > > >           fdt_get_property_by_offset_                100     =
148     +48
> > > > > > >           fdt_get_name                               164     =
212     +48
> > > > > > >           efi_install_fdt                            964    1=
012     +48
> > > > > > >           boot_get_fdt                               888     =
936     +48
> > > > > > >           fdt_move                                    80     =
116     +36
> > > > > > >           reserve_fdt                                 72     =
 96     +24
> > > > > > >           reloc_fdt                                   76     =
100     +24
> > > > > > >           image_setup_libfdt                         284     =
308     +24
> > > > > > >           fit_image_load                            1608    1=
632     +24
> > > > > > >           fit_image_get_data_and_size                172     =
196     +24
> > > > > > >           fit_get_end                                 16     =
 40     +24
> > > > > > >           fdt_next_tag                               256     =
280     +24
> > > > > > >           fdt_header_size                             12     =
 36     +24
> > > > > > >           fdt_get_property_namelen_                  212     =
236     +24
> > > > > > >           fdt_get_property_namelen                    44     =
 68     +24
> > > > > > >           fdt_get_phandle                            120     =
144     +24
> > > > > > >           fdt_del_node                                96     =
120     +24
> > > > > > >           fdt_del_mem_rsv                            112     =
136     +24
> > > > > > >           fdt_add_subnode_namelen                    284     =
308     +24
> > > > > > >           fdt_add_mem_rsv                            124     =
148     +24
> > > > > > >           common_diskboot                            680     =
704     +24
> > > > > > >           fdt_next_subnode                            80     =
 88      +8
> > > > > > >         spl-u-boot-spl: add: 1/-1, grow: 25/-2 bytes: 1176/-6=
0 (1116)
> > > > > > >           function                                   old     =
new   delta
> > > > > > >           fdt_get_mem_rsv                             52     =
236    +184
> > > > > > >           fdt_add_property_                          340     =
484    +144
> > > > > > >           fdt_get_name                                68     =
152     +84
> > > > > > >           fdt_splice_                                148     =
228     +80
> > > > > > >           fdt_num_mem_rsv                             64     =
128     +64
> > > > > > >           fdt_splice_mem_rsv_                         96     =
152     +56
> > > > > > >           fdt_offset_ptr                              52     =
104     +52
> > > > > > >           fdt_splice_struct_                          96     =
144     +48
> > > > > > >           fdt_shrink_to_minimum                      220     =
268     +48
> > > > > > >           fdt_get_property_by_offset_                 36     =
 84     +48
> > > > > > >           fdt_ro_probe_                                -     =
 36     +36
> > > > > > >           fdt_subnode_offset_namelen                 200     =
232     +32
> > > > > > >           spl_load_simple_fit                        848     =
872     +24
> > > > > > >           spl_fit_append_fdt                         196     =
220     +24
> > > > > > >           fdt_getprop_by_offset                       80     =
104     +24
> > > > > > >           fdt_get_string                              64     =
 88     +24
> > > > > > >           fdt_get_property_namelen_                  200     =
224     +24
> > > > > > >           fdt_get_phandle                            120     =
144     +24
> > > > > > >           fdt_del_mem_rsv                            104     =
128     +24
> > > > > > >           fdt_check_header                            28     =
 52     +24
> > > > > > >           fdt_add_subnode_namelen                    260     =
284     +24
> > > > > > >           fdt_add_mem_rsv                            112     =
136     +24
> > > > > > >           fdt_next_tag                               192     =
212     +20
> > > > > > >           fdt_path_offset_namelen                    240     =
256     +16
> > > > > > >           fdt_supernode_atdepth_offset               160     =
172     +12
> > > > > > >           fdt_node_offset_by_phandle                 120     =
132     +12
> > > > > > >           fdt_mem_rsv                                 20     =
  -     -20
> > > > > > >           fdt_check_prop_offset_                      64     =
 44     -20
> > > > > > >           fdt_check_node_offset_                      64     =
 44     -20
> > > > > > >
> > > > > > > And note that for the SPL case we're already setting ASSUME_M=
ASK to
> > > > > > > 0xff so there's maximum savings already being done there.  Do=
es anyone
> > > > > > > have ideas on where / how to further tweak code size?  Thanks!
> > > > > >=20
> > > > > > +David Gibson
> > > > > >=20
> > > > > > I suspect there are more checks that need to be made conditiona=
l.
> > > > >=20
> > > > > Seems likely.
> > > >=20
> > > > OK.  Does that mean you're going to take a look?
> > >=20
> > > No, sorry, my time for dtc is very limited.
> >=20
> > OK, fair point.
> >=20
> > > > > Though, as I've opined before, from what I understand the SPL is =
*so*
> > > > > restricted an environment, I'm not really convinced DTs are the r=
ight
> > > > > tool for the job there.
> > > >=20
> > > > SPL is space constrained, which is why we mask out all of the safety
> > > > checks.  But we still generally have enough memory that this is fin=
e.
> > > > This specific board has 256KiB for SPL, for example.  But I'm not j=
ust
> > > > concerned about 1KiB of growth when everything is masked off, I'm a=
lso
> > > > concerned about 2KiB of growth over a changelog that doesn't read l=
ike
> > > > it added a bunch of stuff that should cause everything to grow,
> > > > either.
> > >=20
> > > Yeah, that's a good point.  It's certainly not obvious to me what
> > > would have caused the growth.  I think we'll need a revision by
> > > revision test to see where it was added.
> >=20
> > So, with a bit of playing around, I've used buildman to give us that,
> > for the leez-rk3399 platform.  The full results are at
> > https://gist.github.com/trini/e42cc848d38bfc77e0124d3ace86d95d and note
> > that build #6, "scripts/dtc: Update to upstream version
> > v1.4.6-22-g24b1f3f064d4" is the first interesting one (#5 was a resync
> > entirely to dtc's 84e414b0b5bc rather than strictly what U-Boot has).
>=20
> Right.. I was meaning stepping through the dtc upstream revisions, not
> just the uboot revisions, so you get a fine grained idea of where the
> increase is coming from.

Yes, that's what that link is.  I imported every revision from point A
to point B, and built U-Boot for it, and checked the sizes, since we
have tooling for that.  It's possible the bloat-o-meter script in the
kernel could be used, but I'm not sure what the right target(s) in dtc
would be, to get any useful information out.

> > But what does all of this _mean_ ?  I kinda think I have an answer now.
> > One of the things that sticks out is 6dcb8ba408ec adds a lot and
> > 11738cf01f15 reduces it just a little.
>=20
> Ah, that's a tricky one.  If we don't handle unaligned accesses we
> instead get intermittent bug reports where it just crashes.

We really need to talk about that then.  There was a problem of people
turning off the sanity check for making sure the entire device tree was
aligned and then having everything crash.

> I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and it will just
> break for either an unaligned dtb (unlikely) or if you attempt to load
> an unaligned value from a property (more likely, but don't add the
> flag if you're not sure you don't need it).

So long as it's abstracted in such a way that we don't grow the size of
everything again, yes, that is the right way forward I think.  These
tests still introduce a big boot-time slowdown as well.

> > With a re-revert again locally, there's just a few size
> > growths now to look in to on the SPL side:
> >      leez-rk3399    : all +8 spl/u-boot-spl:all +180 spl/u-boot-spl:tex=
t +180 text +8
> >         u-boot: add: 0/0, grow: 3/-1 bytes: 28/-20 (8)
> >           function                                   old     new   delta
> >           fdt_move                                    80      92     +12
> >           fdt_splice_                                148     156      +8
> >           fdt_offset_ptr                             104     112      +8
> >           fdt_get_string                             288     268     -20
> >         spl-u-boot-spl: add: 1/0, grow: 9/-2 bytes: 220/-40 (180)
> >           function                                   old     new   delta
> >           fdt_get_name                                68     128     +60
> >           fdt_get_mem_rsv                             52      96     +44
> >           fdt_subnode_offset_namelen                 200     232     +32
> >           fdt_next_tag                               192     212     +20
> >           fdt_path_offset_namelen                    240     256     +16
> >           fdt_supernode_atdepth_offset               160     172     +12
> >           fdt_ro_probe_                                -      12     +12
> >           fdt_node_offset_by_phandle                 120     132     +12
> >           fdt_splice_                                148     156      +8
> >           fdt_offset_ptr                              52      56      +4
> >           fdt_check_prop_offset_                      64      44     -20
> >           fdt_check_node_offset_                      64      44     -20
> >=20
> > Of those, I'm not 100% sure.  That might well end up being Simon's
> > suggestion of a few places needing a check they don't have, I'm not
> > sure.
>=20
> Maybe.  Really need to know which dtc/libfdt revision makes the
> changes to decipher that.

Yes, there's a few suggestive dtc revisions that change the size of
those functions in the full gist.  I think some of the satisfy Coverity
changes had small impact, but I didn't look for fdt_get_name /
fdt_get_mem_rsv.

--=20
Tom

--jzvFrOA4xKmGRWOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+Re/MACgkQFHw5/5Y0
tywC7AwAhZf4fvI1eLhSJrLimX8I82DcSvsTl4mGY5bwdgg+IF+SPH6pvi0IV/x6
xC3/RKqd5pl6UX31va8kyhPZYw0zLMFygp81KkJjTwH8tvdOogpK4gzEqY7BDwm7
3BviF9l6eL41OCcdCnH3sIVNw0GgGz1+zo6wsJzeJHNoN77AndDYwVX8DKH7Zs6B
GQWpH+haPQdkMfpzFVkSk7aWmbeeNK5WUGm5Bz9+/7wkjftq2g2lUeGpamPeLM0b
LIYjuJDkmZbeIvzfd4D/B5MZ4u8/HntharwnppSKHGLnZdHtIYLMB+r1Z0aFtfpY
vju58d8L7+5ijWfoO5i4Vzw2CvJEIRw0187wgatoCLETq3WZ4D5DCgNGd/vgp+qk
+uWyNVpzMaXmK5C+9UqlZeqgAeCl46KIqsJCnNy0XmtfVWsfu4nnkiMnx+3ReM4c
SMwu5AXAcoSPj2ubRbSJk0zMtLZCmuGItjHHaLXsDyIgT7xKdgQmIV2NxjcKFiuy
khQABc3G
=cP+k
-----END PGP SIGNATURE-----

--jzvFrOA4xKmGRWOs--
