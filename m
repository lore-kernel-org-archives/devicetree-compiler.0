From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 00/26] spl: Support loading a FIT image
 containing U-Boot
Date: Fri, 19 Feb 2016 13:55:50 -0700
Message-ID: <CAPnjgZ3bpoOcR5qTtMD-695pGrTb9B5ygaOQDRAWgBzz+WdGug@mail.gmail.com>
References: <1453999186-18747-1-git-send-email-sjg@chromium.org> <CAAfyv34var5T==6z35BQnzWa7O1J=0OHHAp3QMaMkfUei7PAYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=ljOVccN3SsRWopPNS2FwVlbUrl5g8tgJVoaY1bVHzwE=;
        b=VG4iLv4lktdWEFRc31VUemrINrNV7q6vPLnpcLPOeeBA++3vL+58M4vTOoigQow9nI
         bpGWz9o3XImLSJ6Ay5DKzgQFH9lqkTw55U7Zu3OHaOvbGpc7s78AKplPwvZvYf3CMpH7
         5J0eumKaSEIrBpqbxmXU8EM3t42QFMWWtP33wPMQccP/8sztBbFN5IgP0pBV+ycMQYyl
         YtLlsx1eCtz/5zBpuP9fbO1vwt7JzSq17/stz9ttJUth+MgtdJduDqipvES2tUT7+lxi
         iwDaLI3b5Yk4vWR7l42iTKJYFD6wzunT0w7DhWuR/uzSTJgFXPMaBHLLBVWeO/6OZRpv
         31sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=ljOVccN3SsRWopPNS2FwVlbUrl5g8tgJVoaY1bVHzwE=;
        b=SPM6mauCocMpeB4ZsfY6gpz2IOaJMMscyj+lRjKe2EfVbMOaxM58RR4dKgAvlMVA43
         vO15er9dmRFEpOhG2D2BiNe5WaLh8UuicpBBeM+9Xr3BDT7Khtjf6Im1eOkhaJp7Qh44
         fLFMFOeAhD8yVrVhzeyxwWr6Y+a4GuD3F617w=
In-Reply-To: <CAAfyv34var5T==6z35BQnzWa7O1J=0OHHAp3QMaMkfUei7PAYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+uboot-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

On 17 February 2016 at 04:00, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Simon,
>
>
> On Thu, Jan 28, 2016 at 5:39 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> We need a way to support more than one board per binary in U-Boot with
>> device tree. Various methods have been discussed. The one that seems to make
>> the most sense is to adjust SPL so that it can load a FIT which contains
>> U-Boot and several device tree binaries. This is how things with with Linux:
>> load a FIT and select the correct device tree to pass to Linux.
> Some time ago I rise question [0] to load FIT kernel directly in SPL
> using falcon mode.
> I did look at your patches and I have a feeling that with small
> adaptions it should be possible?
> Am I right or it's impossible? (Trying to use it on am33xx boards). Many thanks.

Yes it should be possible. You will probably need to modify the device
tree before booting Linux.

In this case however I am not really using the full existing FIT code.
It would be easier to use it and it is possible to build full FIT
support in SPL. I did it for a project a few years ago but did not
upstream it. It does add a bit to the size though.

Regards,
Simon

>>
>> This series:
>>
>> - Adjusts the build system to optionally build a u-boot.img in FIT format
>> that includes the U-Boot binary and >1 device tree files
>> - Adjusts SPL to support loading this
>> - Adds a way for SPL to determine which device tree to select (by calling a
>> board-specific function)
>> - Adjusts SPL to pass this selected device tree to U-Boot when it starts
>>
>> It would be painful to require an .its file for each board just to support
>> this feature. In any case various people have commented that it would be
>> nice not to have to write this file in general. Therefore, this series
>> enhances mkimage to automatically generate a FIT without a .its file. So far
>> it understands how to add a main image and a number of device tree files. It
>> does not support hashing or verified boot as yet.
>>
>> One problem with the FIT format as it stands is that all the data is inline.
>> This means that the entire file must be read in order to figure out what
>> device-tree files are available. It is then possible to copy the images into
>> place.
>>
>> This is not really suitable for SPL since copying can be slow, and reading
>> unnecessary data would make the FIT format less efficient than the legacy
>> format.
>>
>> Therefore this series adds a new feature to FIT which allows the images to
>> be stored immediately after the FIT itself ends. This makes the FIT very
>> small. It can be read quickly and in its entirety. Then the images can be
>> loaded one by one as needed. This allows SPL to support FITs containing lots
>> of images very efficiently.
>>
>> To achieve this, mkimage is enhanced to convert between the 'normal' and
>> 'external' version of a FIT file. The latter is only used for the SPL loader.
>> The main difference is that viewing an 'external' FIT will not show the
>> contents of each image.
>>
>> This series also includes a few other tidy-ups, such as moving mkimage's
>> tricky argument-processing code to use getopt().
>>
>> NOTE: There are a few problems remaining with the Kconfig conversion. I'm
>> still fiddling with this but thought it best to send this series out for
>> comment in the meantime.
>>
>> This series is available at u-boot-fdt/spl-working.
>>
>
> [0] - http://lists.denx.de/pipermail/u-boot/2015-February/203938.html
>>
>>
>> _______________________________________________
>> U-Boot mailing list
>> U-Boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
>> http://lists.denx.de/mailman/listinfo/u-boot
>
>
> BR,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
