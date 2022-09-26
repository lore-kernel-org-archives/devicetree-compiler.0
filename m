From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: fdt_setprop comma-separated cells
Date: Mon, 26 Sep 2022 11:49:40 -0500
Message-ID: <CAL_JsqLpJ7NONH9O6WR2OR8Z14V7LNSGw+-L7yVKOQOkYoWh_w@mail.gmail.com>
References: <CA+Nonppng=cKrpwqz6YxiVLikvgZGeuYBfdEn3jH8fW49070Xw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664210992;
        bh=VlFFwkiC2D/RMvTlLUF886zzqVzqxeG+P1rXIzJqoeQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kZaOm4kY9duU+L+VxMp7ClddRpnzx3j5D8HuBrltiOLl0ux62lH8cjOqu7ehJBQDR
         V0EVXnN53623Lowa5lHkklJyE4cgRrMtdaL5eVmoFznr6xP7+6m6CG1zOn5Qz8KllA
         gHqCOqGR55ocaUJGPKt6mqrEEarasW5PzgioV4l861RNAm5bJnbau7ZpTH9eLpfRwQ
         rclTMPUQs5eE3DIRnXqjvgLZ98V9HTIqDMOlolVcUx8olHMK+5mRWvUgxrB4g2TnWH
         TSdEXTojiWYpxArA1VcDQI0kFwzxkiEhtJUaSyz5Yr/CNAJp20/mQXPdRMs4UeNYDt
         kcaZX8FZzrcRg==
In-Reply-To: <CA+Nonppng=cKrpwqz6YxiVLikvgZGeuYBfdEn3jH8fW49070Xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Radha Mohan Chintakuntla <radhamohan.cta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Sep 21, 2022 at 7:35 PM Radha Mohan Chintakuntla
<radhamohan.cta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi,
> Not sure if this right forum to discuss this issue.
> I have a requirement where I have to update the device tree property
> with comma-separated values. If I use fdt_setprop() and pass a
> 2-dimensional array then it is not creating the property with comma
> separation. Instead I get all the values in same cell separated by
> space.

'cell' in DT terms means a uint32 value, but I gather here you mean
values within '<>' brackets. The brackets are part of dts syntax and
are irrelevant for dtb. Values in a dtb are just a byte array. dtc
will do some guessing of types (e.g. divisible by 4 or ascii), but
that's it.

> Is there any other way this should be done?
> I have referred to some uboot code that used libfdt and does same way
> as me but even that has the same problem.
>
> Any suggestions please?

The only way to get from a dtb to some output format with decoded
types without guessing is by knowing the type of every possible
property. dtc doesn't have this information. Fortunately, with
dtschema[1] we do and it can decode dtb files assuming it has a schema
for every property. dts as an output format is not supported though.
Only dumping the internal python representation is supported ATM.
dtb2py does this.

Rob

[1] https://github.com/devicetree-org/dt-schema/
