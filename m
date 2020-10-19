From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Mon, 19 Oct 2020 08:37:00 -0400
Message-ID: <20201019123700.GH14816@bill-the-cat>
References: <CAPnjgZ3jPciWmoVpuoYb9KC2h3eCevZsq+1BzefCOCAFCDoseQ@mail.gmail.com>
 <20201019014213.GA11625@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OegvuwtT7hTkfb5j"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b6+xWPH+jOcm4X/2ObQT5qTwV6qPS+KtWKhn9dMk150=;
        b=WZRDunFtYsonnIhBDaS9vClY0q4E1KUeQ8a3vcRIT2GAsOc7HGZHPpnin996/u6QRa
         gD68Xgx/Uzr2SDH8s9buy7qW0SvmYmPh1ooI317ypPCoDN/3fBGwBUz61fw+WAoe/iJg
         e8tlnvtpAvoMonYUb29Ij8SuCjMz8RU6GwsaQ=
Content-Disposition: inline
In-Reply-To: <20201019014213.GA11625-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--OegvuwtT7hTkfb5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 12:42:13PM +1100, David Gibson wrote:
> On Fri, Oct 16, 2020 at 03:46:41PM -0600, Simon Glass wrote:
> > Hi Tom,
> >=20
> > On Fri, 16 Oct 2020 at 13:36, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > Hey all,
> > >
> > > With my U-Boot hat on, I'm trying to move us up from 84e414b0b5bc in =
dtc
> > > to cbca977ea121.  I'm seeing some rather worrying size increases
> > > however.  For example, on an aarch64 board such as leez-rk3399 we hav=
e:
> > >      leez-rk3399    : all +2696 spl/u-boot-spl:all +1116 spl/u-boot-s=
pl:text +1116 text +2696
> > >         u-boot: add: 0/0, grow: 42/0 bytes: 2696/0 (2696)
> > >           function                                   old     new   de=
lta
> > >           do_fdt                                    3992    4308    +=
316
> > >           fdt_check_header                           276     492    +=
216
> > >           fdt_add_property_                          388     556    +=
168
> > >           fdt_ro_probe_                              128     252    +=
124
> > >           fdt_packblocks_                            176     296    +=
120
> > >           fdt_open_into                              392     512    +=
120
> > >           fdt_blocks_misordered_                      96     216    +=
120
> > >           fdt_get_mem_rsv                            108     220    +=
112
> > >           fdt_offset_ptr                             104     208    +=
104
> > >           fdt_get_string                             288     388    +=
100
> > >           fdt_splice_                                148     228     =
+80
> > >           fdt_valid                                  204     276     =
+72
> > >           fdt_getprop_by_offset                      184     256     =
+72
> > >           fdt_splice_mem_rsv_                         96     152     =
+56
> > >           fdt_num_mem_rsv                             60     116     =
+56
> > >           fdt_splice_struct_                          96     144     =
+48
> > >           fdt_shrink_to_minimum                      220     268     =
+48
> > >           fdt_rw_probe_                              108     156     =
+48
> > >           fdt_mem_rsv                                 60     108     =
+48
> > >           fdt_getprop_namelen                        100     148     =
+48
> > >           fdt_get_property_by_offset_                100     148     =
+48
> > >           fdt_get_name                               164     212     =
+48
> > >           efi_install_fdt                            964    1012     =
+48
> > >           boot_get_fdt                               888     936     =
+48
> > >           fdt_move                                    80     116     =
+36
> > >           reserve_fdt                                 72      96     =
+24
> > >           reloc_fdt                                   76     100     =
+24
> > >           image_setup_libfdt                         284     308     =
+24
> > >           fit_image_load                            1608    1632     =
+24
> > >           fit_image_get_data_and_size                172     196     =
+24
> > >           fit_get_end                                 16      40     =
+24
> > >           fdt_next_tag                               256     280     =
+24
> > >           fdt_header_size                             12      36     =
+24
> > >           fdt_get_property_namelen_                  212     236     =
+24
> > >           fdt_get_property_namelen                    44      68     =
+24
> > >           fdt_get_phandle                            120     144     =
+24
> > >           fdt_del_node                                96     120     =
+24
> > >           fdt_del_mem_rsv                            112     136     =
+24
> > >           fdt_add_subnode_namelen                    284     308     =
+24
> > >           fdt_add_mem_rsv                            124     148     =
+24
> > >           common_diskboot                            680     704     =
+24
> > >           fdt_next_subnode                            80      88     =
 +8
> > >         spl-u-boot-spl: add: 1/-1, grow: 25/-2 bytes: 1176/-60 (1116)
> > >           function                                   old     new   de=
lta
> > >           fdt_get_mem_rsv                             52     236    +=
184
> > >           fdt_add_property_                          340     484    +=
144
> > >           fdt_get_name                                68     152     =
+84
> > >           fdt_splice_                                148     228     =
+80
> > >           fdt_num_mem_rsv                             64     128     =
+64
> > >           fdt_splice_mem_rsv_                         96     152     =
+56
> > >           fdt_offset_ptr                              52     104     =
+52
> > >           fdt_splice_struct_                          96     144     =
+48
> > >           fdt_shrink_to_minimum                      220     268     =
+48
> > >           fdt_get_property_by_offset_                 36      84     =
+48
> > >           fdt_ro_probe_                                -      36     =
+36
> > >           fdt_subnode_offset_namelen                 200     232     =
+32
> > >           spl_load_simple_fit                        848     872     =
+24
> > >           spl_fit_append_fdt                         196     220     =
+24
> > >           fdt_getprop_by_offset                       80     104     =
+24
> > >           fdt_get_string                              64      88     =
+24
> > >           fdt_get_property_namelen_                  200     224     =
+24
> > >           fdt_get_phandle                            120     144     =
+24
> > >           fdt_del_mem_rsv                            104     128     =
+24
> > >           fdt_check_header                            28      52     =
+24
> > >           fdt_add_subnode_namelen                    260     284     =
+24
> > >           fdt_add_mem_rsv                            112     136     =
+24
> > >           fdt_next_tag                               192     212     =
+20
> > >           fdt_path_offset_namelen                    240     256     =
+16
> > >           fdt_supernode_atdepth_offset               160     172     =
+12
> > >           fdt_node_offset_by_phandle                 120     132     =
+12
> > >           fdt_mem_rsv                                 20       -     =
-20
> > >           fdt_check_prop_offset_                      64      44     =
-20
> > >           fdt_check_node_offset_                      64      44     =
-20
> > >
> > > And note that for the SPL case we're already setting ASSUME_MASK to
> > > 0xff so there's maximum savings already being done there.  Does anyone
> > > have ideas on where / how to further tweak code size?  Thanks!
> >=20
> > +David Gibson
> >=20
> > I suspect there are more checks that need to be made conditional.
>=20
> Seems likely.

OK.  Does that mean you're going to take a look?

> Though, as I've opined before, from what I understand the SPL is *so*
> restricted an environment, I'm not really convinced DTs are the right
> tool for the job there.

SPL is space constrained, which is why we mask out all of the safety
checks.  But we still generally have enough memory that this is fine.
This specific board has 256KiB for SPL, for example.  But I'm not just
concerned about 1KiB of growth when everything is masked off, I'm also
concerned about 2KiB of growth over a changelog that doesn't read like
it added a bunch of stuff that should cause everything to grow, either.

--=20
Tom

--OegvuwtT7hTkfb5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+NiGgACgkQFHw5/5Y0
tyzucQv/cUEM5DOltR7gYtRMY0MOyktIijnQOtPqJsekKU26OnRBL40Lap5shcKA
5CG63fUuPFMSthCnCzhXCNMLM6M6KJHs2JKiroTNeOUcTyM2uEU9LjPzJcZGnXId
0voULHjfrCt3lA67rAjKJzPF7ublmRCj70JG9jyfjZun/ApgjslwIddiutWiKKCc
0mEgqlqp8nZQOItqz/qdzouRhsnX6crx+F4lOSNsFEV1OGCSeR053kN0adOeVwLz
7fiKgcN8SQdLcjBSvP1AljShk7ncWy00qNJKuLUk3Qaj/m7i33xmYNzOcimYhkfz
xzNiN0xj+ewJQ/UJyknqaV4I6rXMt0I3SvE9jlBx/GeVTuQgTaQVoTd2HiBbemww
vU7/uH2Q3XWzYSJO0lreFDSk7W8yqhmsxzSxGoy3jNNAHI7mUCTS5ynv0V5McEa1
zNGpSXkFKzq3b+3lrG47Avk6882OYRquOOA/lOXSVkq6CaINXuJCimuZwAwKIoSB
6UIr0G2P
=9C3x
-----END PGP SIGNATURE-----

--OegvuwtT7hTkfb5j--
