From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Size growth?
Date: Fri, 16 Oct 2020 15:36:39 -0400
Message-ID: <20201016193639.GZ14816@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lwR2mBJ7UDqzn7Ff"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=rbYGDQkxu24zJpQXfH8uP6joxrqcbCWscQ+4lw5LPUI=;
        b=rSbo1kOQo1BqGHOs2iDGvJox5PRIMz+M7iL2VcLK+mho8msimrIsl4suejBDtAukp3
         Iw4jzS2wngMN+GId7oQmq21U00S8FbJWeT8EvWXrJc1n6SVHRQcBaOPbpUlDPVt9CH2P
         bocYi5ogOY8NkLbIOiynwYM/fVb62vxWmNkmQ=
Content-Disposition: inline
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--lwR2mBJ7UDqzn7Ff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

With my U-Boot hat on, I'm trying to move us up from 84e414b0b5bc in dtc
to cbca977ea121.  I'm seeing some rather worrying size increases
however.  For example, on an aarch64 board such as leez-rk3399 we have:
     leez-rk3399    : all +2696 spl/u-boot-spl:all +1116 spl/u-boot-spl:tex=
t +1116 text +2696
        u-boot: add: 0/0, grow: 42/0 bytes: 2696/0 (2696)
          function                                   old     new   delta
          do_fdt                                    3992    4308    +316
          fdt_check_header                           276     492    +216
          fdt_add_property_                          388     556    +168
          fdt_ro_probe_                              128     252    +124
          fdt_packblocks_                            176     296    +120
          fdt_open_into                              392     512    +120
          fdt_blocks_misordered_                      96     216    +120
          fdt_get_mem_rsv                            108     220    +112
          fdt_offset_ptr                             104     208    +104
          fdt_get_string                             288     388    +100
          fdt_splice_                                148     228     +80
          fdt_valid                                  204     276     +72
          fdt_getprop_by_offset                      184     256     +72
          fdt_splice_mem_rsv_                         96     152     +56
          fdt_num_mem_rsv                             60     116     +56
          fdt_splice_struct_                          96     144     +48
          fdt_shrink_to_minimum                      220     268     +48
          fdt_rw_probe_                              108     156     +48
          fdt_mem_rsv                                 60     108     +48
          fdt_getprop_namelen                        100     148     +48
          fdt_get_property_by_offset_                100     148     +48
          fdt_get_name                               164     212     +48
          efi_install_fdt                            964    1012     +48
          boot_get_fdt                               888     936     +48
          fdt_move                                    80     116     +36
          reserve_fdt                                 72      96     +24
          reloc_fdt                                   76     100     +24
          image_setup_libfdt                         284     308     +24
          fit_image_load                            1608    1632     +24
          fit_image_get_data_and_size                172     196     +24
          fit_get_end                                 16      40     +24
          fdt_next_tag                               256     280     +24
          fdt_header_size                             12      36     +24
          fdt_get_property_namelen_                  212     236     +24
          fdt_get_property_namelen                    44      68     +24
          fdt_get_phandle                            120     144     +24
          fdt_del_node                                96     120     +24
          fdt_del_mem_rsv                            112     136     +24
          fdt_add_subnode_namelen                    284     308     +24
          fdt_add_mem_rsv                            124     148     +24
          common_diskboot                            680     704     +24
          fdt_next_subnode                            80      88      +8
        spl-u-boot-spl: add: 1/-1, grow: 25/-2 bytes: 1176/-60 (1116)
          function                                   old     new   delta
          fdt_get_mem_rsv                             52     236    +184
          fdt_add_property_                          340     484    +144
          fdt_get_name                                68     152     +84
          fdt_splice_                                148     228     +80
          fdt_num_mem_rsv                             64     128     +64
          fdt_splice_mem_rsv_                         96     152     +56
          fdt_offset_ptr                              52     104     +52
          fdt_splice_struct_                          96     144     +48
          fdt_shrink_to_minimum                      220     268     +48
          fdt_get_property_by_offset_                 36      84     +48
          fdt_ro_probe_                                -      36     +36
          fdt_subnode_offset_namelen                 200     232     +32
          spl_load_simple_fit                        848     872     +24
          spl_fit_append_fdt                         196     220     +24
          fdt_getprop_by_offset                       80     104     +24
          fdt_get_string                              64      88     +24
          fdt_get_property_namelen_                  200     224     +24
          fdt_get_phandle                            120     144     +24
          fdt_del_mem_rsv                            104     128     +24
          fdt_check_header                            28      52     +24
          fdt_add_subnode_namelen                    260     284     +24
          fdt_add_mem_rsv                            112     136     +24
          fdt_next_tag                               192     212     +20
          fdt_path_offset_namelen                    240     256     +16
          fdt_supernode_atdepth_offset               160     172     +12
          fdt_node_offset_by_phandle                 120     132     +12
          fdt_mem_rsv                                 20       -     -20
          fdt_check_prop_offset_                      64      44     -20
          fdt_check_node_offset_                      64      44     -20

And note that for the SPL case we're already setting ASSUME_MASK to
0xff so there's maximum savings already being done there.  Does anyone
have ideas on where / how to further tweak code size?  Thanks!

--=20
Tom

--lwR2mBJ7UDqzn7Ff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+J9kQACgkQFHw5/5Y0
tyx0qwwAqDI5CllQbDaVMJC8FT2+suVsDDZia5HxbSLB17dcBr1w/kbEWAgj457k
3nMRscI0hlX+083P/9wfS+TGGq8nNPvt/G2wbmxDM4LHy+RvDiQRAB9mQsbrf1an
B2mUJ0x17iC39R+LoUtkZ1qlR+nPkRJ0m34lT8Va8TQaZ/WQjRGoam0a0sjgM+jY
b3mWCbXpqCCCqGWambyhZafqPlEdzxnjimsNSm3yI85De6O4ZxUTBqgI/QnwlQtm
947KL1IGfhJUoducMLUiziFJ1LjAr3Iq4rqgPjpvb0wdCHZyqKanB2tkoGUwy/2h
+BukvRCT+PuT1N/9QCyawoE33Ld9r/AfK3I97ov5XZDvNwvIv6IRQS8o1X81rod2
KwJiE2V7ICf1jXdcYaiB7kt8vM2Q9HoyJG3Bt25w3RyZ4nns1wpLt5Q2xnkcyhRA
+5cWiXI2rLbs2QDZuA4WXAEj9lXzi2tc8yuL/uDA71dw+Aw3B+CjbHCM+3Agdzke
Adkb5s7l
=ietR
-----END PGP SIGNATURE-----

--lwR2mBJ7UDqzn7Ff--
