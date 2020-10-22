From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 22 Oct 2020 15:00:13 +1100
Message-ID: <20201022040013.GB1821515@yekko.fritz.box>
References: <CAPnjgZ3jPciWmoVpuoYb9KC2h3eCevZsq+1BzefCOCAFCDoseQ@mail.gmail.com>
 <20201019014213.GA11625@yekko.fritz.box>
 <20201019123700.GH14816@bill-the-cat>
 <20201020020907.GA64103@yekko.fritz.box>
 <20201021224914.GB14816@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603340253;
        bh=1TEM+Lml4Uv6I5gytKdqI3y59zr0tTzMRUzegVEfYqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cvpi9ATqaqYMbykRID+kZT7gBKyfjhi8c9FzLuk59HPOfs13Bs4bN1fPxnWIS3sG1
         oKpQnzDv8kTZrOEx/gkLxJ2S4tLa9G+Kc02kBk7ZLWqdfNmGEyHDY5EaLwyfsRiulV
         bEUIJIaXLKFHvZ0tMK/8w3bFqWy9effcZYZKmAFU=
Content-Disposition: inline
In-Reply-To: <20201021224914.GB14816@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
> On Tue, Oct 20, 2020 at 01:09:07PM +1100, David Gibson wrote:
> > On Mon, Oct 19, 2020 at 08:37:00AM -0400, Tom Rini wrote:
> > > On Mon, Oct 19, 2020 at 12:42:13PM +1100, David Gibson wrote:
> > > > On Fri, Oct 16, 2020 at 03:46:41PM -0600, Simon Glass wrote:
> > > > > Hi Tom,
> > > > >=20
> > > > > On Fri, 16 Oct 2020 at 13:36, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > > > >
> > > > > > Hey all,
> > > > > >
> > > > > > With my U-Boot hat on, I'm trying to move us up from 84e414b0b5=
bc in dtc
> > > > > > to cbca977ea121.  I'm seeing some rather worrying size increases
> > > > > > however.  For example, on an aarch64 board such as leez-rk3399 =
we have:
> > > > > >      leez-rk3399    : all +2696 spl/u-boot-spl:all +1116 spl/u-=
boot-spl:text +1116 text +2696
> > > > > >         u-boot: add: 0/0, grow: 42/0 bytes: 2696/0 (2696)
> > > > > >           function                                   old     ne=
w   delta
> > > > > >           do_fdt                                    3992    430=
8    +316
> > > > > >           fdt_check_header                           276     49=
2    +216
> > > > > >           fdt_add_property_                          388     55=
6    +168
> > > > > >           fdt_ro_probe_                              128     25=
2    +124
> > > > > >           fdt_packblocks_                            176     29=
6    +120
> > > > > >           fdt_open_into                              392     51=
2    +120
> > > > > >           fdt_blocks_misordered_                      96     21=
6    +120
> > > > > >           fdt_get_mem_rsv                            108     22=
0    +112
> > > > > >           fdt_offset_ptr                             104     20=
8    +104
> > > > > >           fdt_get_string                             288     38=
8    +100
> > > > > >           fdt_splice_                                148     22=
8     +80
> > > > > >           fdt_valid                                  204     27=
6     +72
> > > > > >           fdt_getprop_by_offset                      184     25=
6     +72
> > > > > >           fdt_splice_mem_rsv_                         96     15=
2     +56
> > > > > >           fdt_num_mem_rsv                             60     11=
6     +56
> > > > > >           fdt_splice_struct_                          96     14=
4     +48
> > > > > >           fdt_shrink_to_minimum                      220     26=
8     +48
> > > > > >           fdt_rw_probe_                              108     15=
6     +48
> > > > > >           fdt_mem_rsv                                 60     10=
8     +48
> > > > > >           fdt_getprop_namelen                        100     14=
8     +48
> > > > > >           fdt_get_property_by_offset_                100     14=
8     +48
> > > > > >           fdt_get_name                               164     21=
2     +48
> > > > > >           efi_install_fdt                            964    101=
2     +48
> > > > > >           boot_get_fdt                               888     93=
6     +48
> > > > > >           fdt_move                                    80     11=
6     +36
> > > > > >           reserve_fdt                                 72      9=
6     +24
> > > > > >           reloc_fdt                                   76     10=
0     +24
> > > > > >           image_setup_libfdt                         284     30=
8     +24
> > > > > >           fit_image_load                            1608    163=
2     +24
> > > > > >           fit_image_get_data_and_size                172     19=
6     +24
> > > > > >           fit_get_end                                 16      4=
0     +24
> > > > > >           fdt_next_tag                               256     28=
0     +24
> > > > > >           fdt_header_size                             12      3=
6     +24
> > > > > >           fdt_get_property_namelen_                  212     23=
6     +24
> > > > > >           fdt_get_property_namelen                    44      6=
8     +24
> > > > > >           fdt_get_phandle                            120     14=
4     +24
> > > > > >           fdt_del_node                                96     12=
0     +24
> > > > > >           fdt_del_mem_rsv                            112     13=
6     +24
> > > > > >           fdt_add_subnode_namelen                    284     30=
8     +24
> > > > > >           fdt_add_mem_rsv                            124     14=
8     +24
> > > > > >           common_diskboot                            680     70=
4     +24
> > > > > >           fdt_next_subnode                            80      8=
8      +8
> > > > > >         spl-u-boot-spl: add: 1/-1, grow: 25/-2 bytes: 1176/-60 =
(1116)
> > > > > >           function                                   old     ne=
w   delta
> > > > > >           fdt_get_mem_rsv                             52     23=
6    +184
> > > > > >           fdt_add_property_                          340     48=
4    +144
> > > > > >           fdt_get_name                                68     15=
2     +84
> > > > > >           fdt_splice_                                148     22=
8     +80
> > > > > >           fdt_num_mem_rsv                             64     12=
8     +64
> > > > > >           fdt_splice_mem_rsv_                         96     15=
2     +56
> > > > > >           fdt_offset_ptr                              52     10=
4     +52
> > > > > >           fdt_splice_struct_                          96     14=
4     +48
> > > > > >           fdt_shrink_to_minimum                      220     26=
8     +48
> > > > > >           fdt_get_property_by_offset_                 36      8=
4     +48
> > > > > >           fdt_ro_probe_                                -      3=
6     +36
> > > > > >           fdt_subnode_offset_namelen                 200     23=
2     +32
> > > > > >           spl_load_simple_fit                        848     87=
2     +24
> > > > > >           spl_fit_append_fdt                         196     22=
0     +24
> > > > > >           fdt_getprop_by_offset                       80     10=
4     +24
> > > > > >           fdt_get_string                              64      8=
8     +24
> > > > > >           fdt_get_property_namelen_                  200     22=
4     +24
> > > > > >           fdt_get_phandle                            120     14=
4     +24
> > > > > >           fdt_del_mem_rsv                            104     12=
8     +24
> > > > > >           fdt_check_header                            28      5=
2     +24
> > > > > >           fdt_add_subnode_namelen                    260     28=
4     +24
> > > > > >           fdt_add_mem_rsv                            112     13=
6     +24
> > > > > >           fdt_next_tag                               192     21=
2     +20
> > > > > >           fdt_path_offset_namelen                    240     25=
6     +16
> > > > > >           fdt_supernode_atdepth_offset               160     17=
2     +12
> > > > > >           fdt_node_offset_by_phandle                 120     13=
2     +12
> > > > > >           fdt_mem_rsv                                 20       =
-     -20
> > > > > >           fdt_check_prop_offset_                      64      4=
4     -20
> > > > > >           fdt_check_node_offset_                      64      4=
4     -20
> > > > > >
> > > > > > And note that for the SPL case we're already setting ASSUME_MAS=
K to
> > > > > > 0xff so there's maximum savings already being done there.  Does=
 anyone
> > > > > > have ideas on where / how to further tweak code size?  Thanks!
> > > > >=20
> > > > > +David Gibson
> > > > >=20
> > > > > I suspect there are more checks that need to be made conditional.
> > > >=20
> > > > Seems likely.
> > >=20
> > > OK.  Does that mean you're going to take a look?
> >=20
> > No, sorry, my time for dtc is very limited.
>=20
> OK, fair point.
>=20
> > > > Though, as I've opined before, from what I understand the SPL is *s=
o*
> > > > restricted an environment, I'm not really convinced DTs are the rig=
ht
> > > > tool for the job there.
> > >=20
> > > SPL is space constrained, which is why we mask out all of the safety
> > > checks.  But we still generally have enough memory that this is fine.
> > > This specific board has 256KiB for SPL, for example.  But I'm not just
> > > concerned about 1KiB of growth when everything is masked off, I'm also
> > > concerned about 2KiB of growth over a changelog that doesn't read like
> > > it added a bunch of stuff that should cause everything to grow,
> > > either.
> >=20
> > Yeah, that's a good point.  It's certainly not obvious to me what
> > would have caused the growth.  I think we'll need a revision by
> > revision test to see where it was added.
>=20
> So, with a bit of playing around, I've used buildman to give us that,
> for the leez-rk3399 platform.  The full results are at
> https://gist.github.com/trini/e42cc848d38bfc77e0124d3ace86d95d and note
> that build #6, "scripts/dtc: Update to upstream version
> v1.4.6-22-g24b1f3f064d4" is the first interesting one (#5 was a resync
> entirely to dtc's 84e414b0b5bc rather than strictly what U-Boot has).

Right.. I was meaning stepping through the dtc upstream revisions, not
just the uboot revisions, so you get a fine grained idea of where the
increase is coming from.

> But what does all of this _mean_ ?  I kinda think I have an answer now.
> One of the things that sticks out is 6dcb8ba408ec adds a lot and
> 11738cf01f15 reduces it just a little.

Ah, that's a tricky one.  If we don't handle unaligned accesses we
instead get intermittent bug reports where it just crashes.

I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and it will just
break for either an unaligned dtb (unlikely) or if you attempt to load
an unaligned value from a property (more likely, but don't add the
flag if you're not sure you don't need it).

> With a re-revert again locally, there's just a few size
> growths now to look in to on the SPL side:
>      leez-rk3399    : all +8 spl/u-boot-spl:all +180 spl/u-boot-spl:text =
+180 text +8
>         u-boot: add: 0/0, grow: 3/-1 bytes: 28/-20 (8)
>           function                                   old     new   delta
>           fdt_move                                    80      92     +12
>           fdt_splice_                                148     156      +8
>           fdt_offset_ptr                             104     112      +8
>           fdt_get_string                             288     268     -20
>         spl-u-boot-spl: add: 1/0, grow: 9/-2 bytes: 220/-40 (180)
>           function                                   old     new   delta
>           fdt_get_name                                68     128     +60
>           fdt_get_mem_rsv                             52      96     +44
>           fdt_subnode_offset_namelen                 200     232     +32
>           fdt_next_tag                               192     212     +20
>           fdt_path_offset_namelen                    240     256     +16
>           fdt_supernode_atdepth_offset               160     172     +12
>           fdt_ro_probe_                                -      12     +12
>           fdt_node_offset_by_phandle                 120     132     +12
>           fdt_splice_                                148     156      +8
>           fdt_offset_ptr                              52      56      +4
>           fdt_check_prop_offset_                      64      44     -20
>           fdt_check_node_offset_                      64      44     -20
>=20
> Of those, I'm not 100% sure.  That might well end up being Simon's
> suggestion of a few places needing a check they don't have, I'm not
> sure.

Maybe.  Really need to know which dtc/libfdt revision makes the
changes to decipher that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+RA80ACgkQbDjKyiDZ
s5LF5RAAgWaoNY2IpuNAiOjGkm+Nz7asHupvztw90H19/vM92vgEvJNgWPF92Drk
Q/ygh3QsR1Wzg11UFiWd6GS25hEn4312ut+yM70SRHhaCn0lOVj4TSD752N2txOj
zlJmjYz4Ed+NQfYY1/urm8JtzvkzvtPEdyNndmiDOSHIdHcmtKx6jgam68nWrtsI
5r+8LUo9f9EGsEIJTe7UGDmQ7y8I0GC1jIYn2T4Q6sz+xKHNz4WYkqpMkGjKCUQC
ZM7cJULDV4CuhQVdku6Uv0lPi0aNyjmXvGY8KYlJmQTLAiHqBH6Zgk/c718F6UPh
HLrcomLytS7ZzgJX5ECCs5ZjHFJ3yJInRPMmzU/7tDo6WTySU5yu8Loq4ITzDq5G
00EeJVS38d2AMTmSgl/BrBz+7KVpTd7ZsQfWo03HGp3+RsvHwUeF3v71QfBnA68s
U0lPrq5azoWTix6TVq4HUHrxNEn0mh/TMMqYpfkfAOGtFaCI8bNSdjhXCHX5+9Vd
511gGZx4xYhas5vKq8VG28iVqTAQU01XG9MBqGkZ5ESxfuup3FiqgPHG58f5ENad
V46RH/ZvyaXlVw4IlATrlSAjou9ENUMcdG3Rkerlh84578vPkO9suO1VR6oUE3MS
hWLBhlufQ38lGbuH45LasLTBiCQeVowrdsFed1SJn1EgB5ldxZM=
=1+Dz
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
