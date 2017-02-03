From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DTB file appears to have corrupted node property according to
 fdtdump and kernel?
Date: Thu, 2 Feb 2017 18:28:14 -0800
Message-ID: <5893EABE.10009@gmail.com>
References: <CAPBAm7QSB_-LrAwouztLYLaC0mWF2V4QQ_Yz98p6jVw07SfT6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=hz7sbPAqMj3Qt4NeWOY8Y4cBxqq8XmSeGhIIlRLa/GE=;
        b=LRUmolDcWtfDsW4Zs3MhfsntbImcoHs4jeg2Oir4wf2oOkSFb2DDIWLobY8Av5uAwx
         fw47orF8VEsTQaysPB3WAmvi9q8NcIv8JjlCA0S+S5rx2ei8+kxoKB9XkbaqhUvapXWx
         02iwmziQ6E7C2xRMLyDBaJOpJOc2QiJahieaVgHy3XZTrXc1l0tOL7b/RrmL8BpeHad7
         awztKCEgx8QwTicrTYaJvQ5QUKEa+zDz9sJV2FDA96NRQ55FlBFE2ruljb5COP2ouiI7
         s87uXmxuLCnS+SYqUEcIm+sMriDq7T2QoXnbkN/3TnSHKOS8YdPD+XiUTm9rznR3Fxoj
         EWnQ==
In-Reply-To: <CAPBAm7QSB_-LrAwouztLYLaC0mWF2V4QQ_Yz98p6jVw07SfT6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frederik Lotter <frederik.lotter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 02/02/17 09:53, Frederik Lotter wrote:
> Hi,
> 
> I have a particular device tree node property which refuses to reach
> the Linux kernel without corruption:
> 
>  interrupts = <0xc 0x1>;
> 
>>From the extract below from the preprocessed file:
> 
>    i2c1: i2c@f0018000 {
>     compatible = "atmel,at91sam9x5-i2c";
>     reg = <0xf0018000 0x4000>;
>     interrupts = <0x13 0x4 0x6>;
>     dmas = <0x2 0x2 0x9 0x2 0x2 0xa>;
>     dma-names = "tx", "rx";
>     pinctrl-names = "default";
>     pinctrl-0 = <0x12>;
>     #address-cells = <0x1>;
>     #size-cells = <0x0>;
>     clocks = <0x13>;
>     status = "okay";
>     clock-frequency = <0x61a80>;
>     atmel,recover-scl = <0x14 0x1b 0x0>;
>     atmel,recover-sda = <0x14 0x1a 0x0>;
> 
>     lsm6ds3@6b {
>      compatible = "st,lsm6ds3";
>      reg = <0x6b>;
>      pinctrl-names = "default";
>      pinctrl-0 = <0x15>;
>      interrupt-parent = <0x16>;
>      interrupts = <0xc 0x1>;
>      interrupt-names = "lsm6ds_int1";
>      st,drdy-int-pin = <0x1>;
>     };
>    };
> 
> Version: DTC 1.4.0 (ubuntu package) for manual testing.
> 
> (1)  fdtdump mix6000.dtb | grep interrupts
> 
> Thsi returns the interrupt line as:
> 
> interrupts = <0x0000000c 0x000001d0>;
> 
> (2) In the linux kernel the of_platform_populate() reads the same property as:
> 
> 0x0000000c 0x00000000 with lenth=8
> 
> (3) If I take the DTS file and manually compile the DTB with the dtc
> compiler, and convert it back to the DTS the correct values are shown
> 
> (4) If I change the interrupt value:
> 
> interrupts = <0xc 0x0>;
> 
> and I do:
> 
> cat <file-old.dtb> | od -t x1 > file1.txt
> cat <file-mod.dtb> | od -t x1 > file2.txt
> kdiff3 file1.txt file2.txt
> 
> I actually see a single hex byte change from 0x1 to 0x0.
> 
> If it was not for the faulty fdtdump output (in conjuection with the
> Linux kernel zero at the same place) I would have said its definately
> a kernel issue.
> 
> Any ideas?

You can see what the dtb looked like when given to the kernel. Take
/sys/firmware/fdt and decompile that with dtc.

If it already looks bad at this point, does your bootloader have any
way to look at the dtb?

-Frank
