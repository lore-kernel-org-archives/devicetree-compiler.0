From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: DTC: unaligned memory offset in FIT image
Date: Thu, 20 Jul 2017 09:55:22 -0500
Message-ID: <CAL_JsqKwjrcpV6pnRfEM+vPwq9bPVhF_vdc=rcDVT7idsK_Q2Q@mail.gmail.com>
References: <VI1PR06MB1599BC212592810ABBE36E2D82A70@VI1PR06MB1599.eurprd06.prod.outlook.com>
 <20170720133443.GB3140@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170720133443.GB3140-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "DHANAPAL, GNANACHANDRAN (G.)" <gnanachandran.dhanapal-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, "Babu, Viswanathan (V.)" <vbabu3-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "Ravindran, Madhusudhanan (M.)" <mravindr-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "Gujulan Elango, Hari Prasath (H.)" <hgujulan-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "CN, Aananth (A.A.)" <aananth.cn-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "gnanachandran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnanachandran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Thu, Jul 20, 2017 at 8:34 AM, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jul 20, 2017 at 08:28:28AM +0000, DHANAPAL, GNANACHANDRAN (G.) wrote:
>> Resending this mail  presuming previous mail was lost
>
> I'm not sure why you're presuming that.  I got it fine, just hadn't
> had a chance to reply yet.
>
>> Hi There,
>>
>> In our  R-car H3 based customized automotive product, we are using  U-boot ( bootloader), FIT image (Linux kernel + DTB) and root file system provided by Renesas provide BSP 2.16.0.  FIT image has compressed Linux kernel and uncompressed DTB. While loading the FIT image, system reboot happens with following boot log.
>>
>> reading fitImage_monarch
>> 6627756 bytes read in 299 ms (21.1 MiB/s) ## Loading kernel from FIT Image at 4c000000 ...
>>    Using 'conf@1' configuration
>>    Trying 'kernel@1' kernel subimage
>>      Description:  Linux kernel
>>      Type:         Kernel Image
>>      Compression:  gzip compressed
>>      Data Start:   0x4c000114
>>      Data Size:    6557502 Bytes = 6.3 MiB
>>      Architecture: AArch64
>>      OS:           Linux
>>      Load Address: 0x48080000
>>      Entry Point:  0x48080000
>>      Hash algo:    sha1
>>      Hash value:   2638b7ad761ed7c70d9053908f274e5617e7ae75
>>    Verifying Hash Integrity ... sha1+ OK ## Loading fdt from FIT Image at 4c000000 ...
>>    Using 'conf@1' configuration
>>    Trying 'fdt@1' fdt subimage
>>      Description:  Flattened Device Tree blob
>>      Type:         Flat Device Tree
>>      Compression:  uncompressed
>>      Data Start:   0x4c64114c
>>      Data Size:    68887 Bytes = 67.3 KiB
>>      Architecture: AArch64
>>      Hash algo:    sha1
>>      Hash value:   c29c2b38626b8af9cfd5c1b513a179fc6dcd1db2
>>    Verifying Hash Integrity ... sha1+ OK
>>    Booting using the fdt blob at 0x4c64114c
>>    Uncompressing Kernel Image ... OK
>> "Synchronous Abort" handler, esr 0x96000021
>> ELR:     50029550
>> LR:      5001117c
>> x0 : 0000000000000000 x1 : 000000004c64117c
>> x2 : 0000000000000011 x3 : 0000000000000009
>> x4 : 0000000000000000 x5 : 0000000050038eed
>> x6 : 0000000000000002 x7 : 000000005005aa98
>> x8 : 0000000000000000 x9 : 00000000ffffffff
>> x10: 0000000048e2ba00 x11: 0000000000000001
>> x12: 0000000000000060 x13: 00000000000001ff
>> x14: 000000000000003f x15: 000000007fe61670
>> x16: 000000007fe61e70 x17: 0000000100000000
>> x18: 000000007fe5ae20 x19: 0000000000000000
>> x20: 000000004c64114c x21: 000000005003e3db
>> x22: 000000005005a898 x23: 000000005005a9d8
>> x24: 0000000000000000 x25: 000000005004e5f0
>> x26: 000000004c000114 x27: 00000000500018b0
>> x28: 0000000048080000 x29: 000000007fe5a580
>>
>> Resetting CPU ...
>>
>>
>> >From log, we observed that Data start address for both kernel (0x4C000114) and DTB (0x4c64114c) are not 64bit aligned.
>> DTC that generates the FIT image doesn't align FIT description text (shown below) hence offset of kernel and DTC are moved to Non 64 bit align address
>>
>>         description = "U-Boot fitImage for Poky (Yocto Project Reference Distro)/4.9.0+gitAUTOINC+13e7680774/smartcore2";
>>         #address-cells = <1>;
>>
>> String len of description is 97 bytes.  By changing this description length to multiple of 8, FIT image works properly.
>> Please find the attached .its file used for FIT image creation
>>
>> In DTC source code, function flatten_tree in file flattree.c, 8 bytes alignment is skipped for DTC version 17.
>>
>> if ((vi->flags & FTF_VARALIGN) && (prop->val.len >= 8))
>>                         emit->align(etarget, 8);
>
>> May I know reason why FTF_VARALIGN is skipped for version 17 or Is  there other way  this can be handle in latest DTC.
>
> Because that's how v16 and later are defined.  Attempting to use
> FTF_VARALIGN on current versions would mean dtb clients wouldn't parse
> it correctly.  The variable alignment generally wasn't worth the
> hassle.  Properties are bytestrings and their internal encodings don't
> generally include alignment gaps.  So, even if the start of the
> property is aligned, there's no guarantee that values within the
> property are aligned.
>
> It might be useful in the case of FIT (I hadn't realised until now
> that FITs were basically just dtbs with an embedded other dtb).  And I
> guess it would be possible to align the relevent property through the
> use of FDT_NOP tags, though how to decide when to do that is a pretty
> vague question.  Even then, of course, there's no guarantee that
> values within the inner dtb will be aligned.
>
> As a general rule it's best to write code working with dtbs so that's
> it's safe with any alignment.  I realise that can be pretty awkward
> for ARM, though.

Modern ARM (v6+) supports unaligned accesses just fine. IIRC, u-boot
does not and there was some debate about it, but that was a few years
ago.

Rob
