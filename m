From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Size growth?
Date: Fri, 16 Oct 2020 15:46:41 -0600
Message-ID: <CAPnjgZ3jPciWmoVpuoYb9KC2h3eCevZsq+1BzefCOCAFCDoseQ@mail.gmail.com>
References: <20201016193639.GZ14816@bill-the-cat>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bCw6ji4Czn6b5KUxkxT7QRabgLpjWO6IegO+hs3ddpU=;
        b=ZfQWbYgnwkoPm0Y/zL2GvAweNtb+zv+3zMyuHfDFDOX2X/FBcu38PA8IoXA8Rz6K4X
         1iYrW8cr0UqeiFDF3ARAey2a9TYrIm6jp79WcMlO2FZtfADJbrYv7appGFlDLoHq3vrX
         UcVX6RMi8Hq+mXkYwutdGNQ21dN12+QamK09E=
In-Reply-To: <20201016193639.GZ14816@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Tom,

On Fri, 16 Oct 2020 at 13:36, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>
> Hey all,
>
> With my U-Boot hat on, I'm trying to move us up from 84e414b0b5bc in dtc
> to cbca977ea121.  I'm seeing some rather worrying size increases
> however.  For example, on an aarch64 board such as leez-rk3399 we have:
>      leez-rk3399    : all +2696 spl/u-boot-spl:all +1116 spl/u-boot-spl:text +1116 text +2696
>         u-boot: add: 0/0, grow: 42/0 bytes: 2696/0 (2696)
>           function                                   old     new   delta
>           do_fdt                                    3992    4308    +316
>           fdt_check_header                           276     492    +216
>           fdt_add_property_                          388     556    +168
>           fdt_ro_probe_                              128     252    +124
>           fdt_packblocks_                            176     296    +120
>           fdt_open_into                              392     512    +120
>           fdt_blocks_misordered_                      96     216    +120
>           fdt_get_mem_rsv                            108     220    +112
>           fdt_offset_ptr                             104     208    +104
>           fdt_get_string                             288     388    +100
>           fdt_splice_                                148     228     +80
>           fdt_valid                                  204     276     +72
>           fdt_getprop_by_offset                      184     256     +72
>           fdt_splice_mem_rsv_                         96     152     +56
>           fdt_num_mem_rsv                             60     116     +56
>           fdt_splice_struct_                          96     144     +48
>           fdt_shrink_to_minimum                      220     268     +48
>           fdt_rw_probe_                              108     156     +48
>           fdt_mem_rsv                                 60     108     +48
>           fdt_getprop_namelen                        100     148     +48
>           fdt_get_property_by_offset_                100     148     +48
>           fdt_get_name                               164     212     +48
>           efi_install_fdt                            964    1012     +48
>           boot_get_fdt                               888     936     +48
>           fdt_move                                    80     116     +36
>           reserve_fdt                                 72      96     +24
>           reloc_fdt                                   76     100     +24
>           image_setup_libfdt                         284     308     +24
>           fit_image_load                            1608    1632     +24
>           fit_image_get_data_and_size                172     196     +24
>           fit_get_end                                 16      40     +24
>           fdt_next_tag                               256     280     +24
>           fdt_header_size                             12      36     +24
>           fdt_get_property_namelen_                  212     236     +24
>           fdt_get_property_namelen                    44      68     +24
>           fdt_get_phandle                            120     144     +24
>           fdt_del_node                                96     120     +24
>           fdt_del_mem_rsv                            112     136     +24
>           fdt_add_subnode_namelen                    284     308     +24
>           fdt_add_mem_rsv                            124     148     +24
>           common_diskboot                            680     704     +24
>           fdt_next_subnode                            80      88      +8
>         spl-u-boot-spl: add: 1/-1, grow: 25/-2 bytes: 1176/-60 (1116)
>           function                                   old     new   delta
>           fdt_get_mem_rsv                             52     236    +184
>           fdt_add_property_                          340     484    +144
>           fdt_get_name                                68     152     +84
>           fdt_splice_                                148     228     +80
>           fdt_num_mem_rsv                             64     128     +64
>           fdt_splice_mem_rsv_                         96     152     +56
>           fdt_offset_ptr                              52     104     +52
>           fdt_splice_struct_                          96     144     +48
>           fdt_shrink_to_minimum                      220     268     +48
>           fdt_get_property_by_offset_                 36      84     +48
>           fdt_ro_probe_                                -      36     +36
>           fdt_subnode_offset_namelen                 200     232     +32
>           spl_load_simple_fit                        848     872     +24
>           spl_fit_append_fdt                         196     220     +24
>           fdt_getprop_by_offset                       80     104     +24
>           fdt_get_string                              64      88     +24
>           fdt_get_property_namelen_                  200     224     +24
>           fdt_get_phandle                            120     144     +24
>           fdt_del_mem_rsv                            104     128     +24
>           fdt_check_header                            28      52     +24
>           fdt_add_subnode_namelen                    260     284     +24
>           fdt_add_mem_rsv                            112     136     +24
>           fdt_next_tag                               192     212     +20
>           fdt_path_offset_namelen                    240     256     +16
>           fdt_supernode_atdepth_offset               160     172     +12
>           fdt_node_offset_by_phandle                 120     132     +12
>           fdt_mem_rsv                                 20       -     -20
>           fdt_check_prop_offset_                      64      44     -20
>           fdt_check_node_offset_                      64      44     -20
>
> And note that for the SPL case we're already setting ASSUME_MASK to
> 0xff so there's maximum savings already being done there.  Does anyone
> have ideas on where / how to further tweak code size?  Thanks!

+David Gibson

I suspect there are more checks that need to be made conditional.

Regards,
Simon

> --
> Tom
