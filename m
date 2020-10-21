From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Wed, 21 Oct 2020 18:49:14 -0400
Message-ID: <20201021224914.GB14816@bill-the-cat>
References: <CAPnjgZ3jPciWmoVpuoYb9KC2h3eCevZsq+1BzefCOCAFCDoseQ@mail.gmail.com>
 <20201019014213.GA11625@yekko.fritz.box>
 <20201019123700.GH14816@bill-the-cat>
 <20201020020907.GA64103@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="37i9OoQ5PQ5SPlsS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jbm8h6jo5UffO4GNeDHAEVMSduHE264NvYf5N2+eth8=;
        b=Hi7YoMzV4BZfgyAK1DZlx4c17OSCXYbj4uDlx/vd1RDrQMqNK3sGCnlaHwpSbte8/v
         5sIz0u4UbUwvfvOq2XLmfU7R9knMBW0rWefZH/0SMETokDh4GDTwONd566d12HMG8acg
         7QhB9+FKidwV54vfJ8a8KtF5o8mElKsyfVMSo=
Content-Disposition: inline
In-Reply-To: <20201020020907.GA64103-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--37i9OoQ5PQ5SPlsS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 01:09:07PM +1100, David Gibson wrote:
> On Mon, Oct 19, 2020 at 08:37:00AM -0400, Tom Rini wrote:
> > On Mon, Oct 19, 2020 at 12:42:13PM +1100, David Gibson wrote:
> > > On Fri, Oct 16, 2020 at 03:46:41PM -0600, Simon Glass wrote:
> > > > Hi Tom,
> > > >=20
> > > > On Fri, 16 Oct 2020 at 13:36, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > > >
> > > > > Hey all,
> > > > >
> > > > > With my U-Boot hat on, I'm trying to move us up from 84e414b0b5bc=
 in dtc
> > > > > to cbca977ea121.  I'm seeing some rather worrying size increases
> > > > > however.  For example, on an aarch64 board such as leez-rk3399 we=
 have:
> > > > >      leez-rk3399    : all +2696 spl/u-boot-spl:all +1116 spl/u-bo=
ot-spl:text +1116 text +2696
> > > > >         u-boot: add: 0/0, grow: 42/0 bytes: 2696/0 (2696)
> > > > >           function                                   old     new =
  delta
> > > > >           do_fdt                                    3992    4308 =
   +316
> > > > >           fdt_check_header                           276     492 =
   +216
> > > > >           fdt_add_property_                          388     556 =
   +168
> > > > >           fdt_ro_probe_                              128     252 =
   +124
> > > > >           fdt_packblocks_                            176     296 =
   +120
> > > > >           fdt_open_into                              392     512 =
   +120
> > > > >           fdt_blocks_misordered_                      96     216 =
   +120
> > > > >           fdt_get_mem_rsv                            108     220 =
   +112
> > > > >           fdt_offset_ptr                             104     208 =
   +104
> > > > >           fdt_get_string                             288     388 =
   +100
> > > > >           fdt_splice_                                148     228 =
    +80
> > > > >           fdt_valid                                  204     276 =
    +72
> > > > >           fdt_getprop_by_offset                      184     256 =
    +72
> > > > >           fdt_splice_mem_rsv_                         96     152 =
    +56
> > > > >           fdt_num_mem_rsv                             60     116 =
    +56
> > > > >           fdt_splice_struct_                          96     144 =
    +48
> > > > >           fdt_shrink_to_minimum                      220     268 =
    +48
> > > > >           fdt_rw_probe_                              108     156 =
    +48
> > > > >           fdt_mem_rsv                                 60     108 =
    +48
> > > > >           fdt_getprop_namelen                        100     148 =
    +48
> > > > >           fdt_get_property_by_offset_                100     148 =
    +48
> > > > >           fdt_get_name                               164     212 =
    +48
> > > > >           efi_install_fdt                            964    1012 =
    +48
> > > > >           boot_get_fdt                               888     936 =
    +48
> > > > >           fdt_move                                    80     116 =
    +36
> > > > >           reserve_fdt                                 72      96 =
    +24
> > > > >           reloc_fdt                                   76     100 =
    +24
> > > > >           image_setup_libfdt                         284     308 =
    +24
> > > > >           fit_image_load                            1608    1632 =
    +24
> > > > >           fit_image_get_data_and_size                172     196 =
    +24
> > > > >           fit_get_end                                 16      40 =
    +24
> > > > >           fdt_next_tag                               256     280 =
    +24
> > > > >           fdt_header_size                             12      36 =
    +24
> > > > >           fdt_get_property_namelen_                  212     236 =
    +24
> > > > >           fdt_get_property_namelen                    44      68 =
    +24
> > > > >           fdt_get_phandle                            120     144 =
    +24
> > > > >           fdt_del_node                                96     120 =
    +24
> > > > >           fdt_del_mem_rsv                            112     136 =
    +24
> > > > >           fdt_add_subnode_namelen                    284     308 =
    +24
> > > > >           fdt_add_mem_rsv                            124     148 =
    +24
> > > > >           common_diskboot                            680     704 =
    +24
> > > > >           fdt_next_subnode                            80      88 =
     +8
> > > > >         spl-u-boot-spl: add: 1/-1, grow: 25/-2 bytes: 1176/-60 (1=
116)
> > > > >           function                                   old     new =
  delta
> > > > >           fdt_get_mem_rsv                             52     236 =
   +184
> > > > >           fdt_add_property_                          340     484 =
   +144
> > > > >           fdt_get_name                                68     152 =
    +84
> > > > >           fdt_splice_                                148     228 =
    +80
> > > > >           fdt_num_mem_rsv                             64     128 =
    +64
> > > > >           fdt_splice_mem_rsv_                         96     152 =
    +56
> > > > >           fdt_offset_ptr                              52     104 =
    +52
> > > > >           fdt_splice_struct_                          96     144 =
    +48
> > > > >           fdt_shrink_to_minimum                      220     268 =
    +48
> > > > >           fdt_get_property_by_offset_                 36      84 =
    +48
> > > > >           fdt_ro_probe_                                -      36 =
    +36
> > > > >           fdt_subnode_offset_namelen                 200     232 =
    +32
> > > > >           spl_load_simple_fit                        848     872 =
    +24
> > > > >           spl_fit_append_fdt                         196     220 =
    +24
> > > > >           fdt_getprop_by_offset                       80     104 =
    +24
> > > > >           fdt_get_string                              64      88 =
    +24
> > > > >           fdt_get_property_namelen_                  200     224 =
    +24
> > > > >           fdt_get_phandle                            120     144 =
    +24
> > > > >           fdt_del_mem_rsv                            104     128 =
    +24
> > > > >           fdt_check_header                            28      52 =
    +24
> > > > >           fdt_add_subnode_namelen                    260     284 =
    +24
> > > > >           fdt_add_mem_rsv                            112     136 =
    +24
> > > > >           fdt_next_tag                               192     212 =
    +20
> > > > >           fdt_path_offset_namelen                    240     256 =
    +16
> > > > >           fdt_supernode_atdepth_offset               160     172 =
    +12
> > > > >           fdt_node_offset_by_phandle                 120     132 =
    +12
> > > > >           fdt_mem_rsv                                 20       - =
    -20
> > > > >           fdt_check_prop_offset_                      64      44 =
    -20
> > > > >           fdt_check_node_offset_                      64      44 =
    -20
> > > > >
> > > > > And note that for the SPL case we're already setting ASSUME_MASK =
to
> > > > > 0xff so there's maximum savings already being done there.  Does a=
nyone
> > > > > have ideas on where / how to further tweak code size?  Thanks!
> > > >=20
> > > > +David Gibson
> > > >=20
> > > > I suspect there are more checks that need to be made conditional.
> > >=20
> > > Seems likely.
> >=20
> > OK.  Does that mean you're going to take a look?
>=20
> No, sorry, my time for dtc is very limited.

OK, fair point.

> > > Though, as I've opined before, from what I understand the SPL is *so*
> > > restricted an environment, I'm not really convinced DTs are the right
> > > tool for the job there.
> >=20
> > SPL is space constrained, which is why we mask out all of the safety
> > checks.  But we still generally have enough memory that this is fine.
> > This specific board has 256KiB for SPL, for example.  But I'm not just
> > concerned about 1KiB of growth when everything is masked off, I'm also
> > concerned about 2KiB of growth over a changelog that doesn't read like
> > it added a bunch of stuff that should cause everything to grow,
> > either.
>=20
> Yeah, that's a good point.  It's certainly not obvious to me what
> would have caused the growth.  I think we'll need a revision by
> revision test to see where it was added.

So, with a bit of playing around, I've used buildman to give us that,
for the leez-rk3399 platform.  The full results are at
https://gist.github.com/trini/e42cc848d38bfc77e0124d3ace86d95d and note
that build #6, "scripts/dtc: Update to upstream version
v1.4.6-22-g24b1f3f064d4" is the first interesting one (#5 was a resync
entirely to dtc's 84e414b0b5bc rather than strictly what U-Boot has).

But what does all of this _mean_ ?  I kinda think I have an answer now.
One of the things that sticks out is 6dcb8ba408ec adds a lot and
11738cf01f15 reduces it just a little.

With a re-revert again locally, there's just a few size
growths now to look in to on the SPL side:
     leez-rk3399    : all +8 spl/u-boot-spl:all +180 spl/u-boot-spl:text +1=
80 text +8
        u-boot: add: 0/0, grow: 3/-1 bytes: 28/-20 (8)
          function                                   old     new   delta
          fdt_move                                    80      92     +12
          fdt_splice_                                148     156      +8
          fdt_offset_ptr                             104     112      +8
          fdt_get_string                             288     268     -20
        spl-u-boot-spl: add: 1/0, grow: 9/-2 bytes: 220/-40 (180)
          function                                   old     new   delta
          fdt_get_name                                68     128     +60
          fdt_get_mem_rsv                             52      96     +44
          fdt_subnode_offset_namelen                 200     232     +32
          fdt_next_tag                               192     212     +20
          fdt_path_offset_namelen                    240     256     +16
          fdt_supernode_atdepth_offset               160     172     +12
          fdt_ro_probe_                                -      12     +12
          fdt_node_offset_by_phandle                 120     132     +12
          fdt_splice_                                148     156      +8
          fdt_offset_ptr                              52      56      +4
          fdt_check_prop_offset_                      64      44     -20
          fdt_check_node_offset_                      64      44     -20

Of those, I'm not 100% sure.  That might well end up being Simon's
suggestion of a few places needing a check they don't have, I'm not
sure.

--=20
Tom

--37i9OoQ5PQ5SPlsS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+QuuYACgkQFHw5/5Y0
tyxzswv/cQMdIKrRNyr/fBDBxKbNRoFwK68JsAEumGlnfyIvE8UE7DfWINhG+1FA
ck1NVtKoAfFHrjXCmISwoB+1EmFHGXLN7nNd3CTp9rs7cT0tCM7MhLX3c649tHLh
9C+FdOVsihHdLeQvxoUA/OxSLMvzXKOGocJfoU6zSxuI7hFhCPx7DmnFHuSf4/ru
hrZu3O0sM5lSykFe1i9renQK1RiVygcKCVB3rjH/ypSJmmc013g67q66Ak73O3Lg
Se03rSAD32pQbDgmjBttyxWc1SAaxhfk51vb8hNjzPiOkV8BAWaSl7smjlJg4bR+
6ZBlMM4Wz8ohpy1W5IJyDiuLsZxDqe8EIfWUzyD4GM93iHzQLU9aa+XntgJiSqoO
0oA0pLrJCjrb2gPY4hKHNFObcOzlxJtovg+37964nOgI5rlCEc2hoPvsbLamynSb
9MCofNwrSpcUJZ37qEVI7U+UxS1rVCt7nuVmAuMaklTpf601ZCb9UwhoGap+3nou
Pvp/rOm4
=OBkD
-----END PGP SIGNATURE-----

--37i9OoQ5PQ5SPlsS--
