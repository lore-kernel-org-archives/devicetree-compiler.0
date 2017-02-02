From: Frederik Lotter <frederik.lotter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DTB file appears to have corrupted node property according to fdtdump
 and kernel?
Date: Thu, 2 Feb 2017 19:53:11 +0200
Message-ID: <CAPBAm7QSB_-LrAwouztLYLaC0mWF2V4QQ_Yz98p6jVw07SfT6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=iWt/if6bdnjRgp7Y8RFtOiwlR/C3j5kXyJZqNCSghSI=;
        b=MIvI5Y598IBHwx3PRp5cubxLHPX8azahSEOH1IsnwZzZPZLrb9/CZjjrY7wXmBrIuz
         dzR3+h4STIAE1W1ZXmlZZo3YOM8SbN4Caup3yrvH/jKEGHad5mLGtXVHvw5UTsOUqaI5
         49uZB6UqlGjZzM/NnAlgxL1wKjlRkpSWp3cNcTfun4U3Q7oXOL3lE2PLjv1BLw8Pmd5h
         TbLDeCzqV27YkJ14emaOiyv/C1L32sBcA0wNAxoF5lY8oKZvf359iiuG52p9r7EJyb99
         ZB+GuiCypWNk5q0FlduaGAVyGx88Iv1SM63wLQ1EM/kR83SOhB7xJZvxdIePbG+jRz2H
         AIUg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I have a particular device tree node property which refuses to reach
the Linux kernel without corruption:

 interrupts = <0xc 0x1>;

From the extract below from the preprocessed file:

   i2c1: i2c@f0018000 {
    compatible = "atmel,at91sam9x5-i2c";
    reg = <0xf0018000 0x4000>;
    interrupts = <0x13 0x4 0x6>;
    dmas = <0x2 0x2 0x9 0x2 0x2 0xa>;
    dma-names = "tx", "rx";
    pinctrl-names = "default";
    pinctrl-0 = <0x12>;
    #address-cells = <0x1>;
    #size-cells = <0x0>;
    clocks = <0x13>;
    status = "okay";
    clock-frequency = <0x61a80>;
    atmel,recover-scl = <0x14 0x1b 0x0>;
    atmel,recover-sda = <0x14 0x1a 0x0>;

    lsm6ds3@6b {
     compatible = "st,lsm6ds3";
     reg = <0x6b>;
     pinctrl-names = "default";
     pinctrl-0 = <0x15>;
     interrupt-parent = <0x16>;
     interrupts = <0xc 0x1>;
     interrupt-names = "lsm6ds_int1";
     st,drdy-int-pin = <0x1>;
    };
   };

Version: DTC 1.4.0 (ubuntu package) for manual testing.

(1)  fdtdump mix6000.dtb | grep interrupts

Thsi returns the interrupt line as:

interrupts = <0x0000000c 0x000001d0>;

(2) In the linux kernel the of_platform_populate() reads the same property as:

0x0000000c 0x00000000 with lenth=8

(3) If I take the DTS file and manually compile the DTB with the dtc
compiler, and convert it back to the DTS the correct values are shown

(4) If I change the interrupt value:

interrupts = <0xc 0x0>;

and I do:

cat <file-old.dtb> | od -t x1 > file1.txt
cat <file-mod.dtb> | od -t x1 > file2.txt
kdiff3 file1.txt file2.txt

I actually see a single hex byte change from 0x1 to 0x0.

If it was not for the faulty fdtdump output (in conjuection with the
Linux kernel zero at the same place) I would have said its definately
a kernel issue.

Any ideas?
