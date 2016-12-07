From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: coverage test failed
Date: Tue, 6 Dec 2016 22:47:39 -0500
Message-ID: <CAPnjgZ3m7sQNBJcmuj5uvyXTAZoMDrkGZimrGYUEj_ymYXLAuw@mail.gmail.com>
References: <83389cab-dad7-5f73-c679-33be7bcee87f@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=dlTh6Idv1AHP1aUm07qm6W/HPj1E6A/kb7+x22SR500=;
        b=lTLXmOx2Pwu+EKdkwCNdZC3zxvoiK5WDxkATNEVbmKhqTO2ntFHTa2sqDn5ons5LHO
         9WpLfSF26MwzTIFKvh1dlSGsN3tflQa1fz3JFKqGDxMTELlBfukjgvBB4N37xY4NJYXJ
         AzadXSf3YI8FFfTSGNUaIO/cB4uj+Drhpci5c6OR38Bg4eoxHOy8+6A79yNLGlEjGP33
         gKjAPN2aYiwi4qx5VJxGmizYxh1np4cTJc38PrSBqBnjw35YOjdU2tbjRZ6S0xfGZUOp
         RkUmfnydVejM5tcnSREw4S3TomQIwa4sfb/Cg1aRbugfhh72MlXn7pEkztkzTzfwFTl2
         X1Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=dlTh6Idv1AHP1aUm07qm6W/HPj1E6A/kb7+x22SR500=;
        b=XLGrZDWh2UEdD0WvVILTOICPfR0orLl4qoegiK0DHLVctnkJ1n4gRZwGM1zqnxYOZx
         wOaudWoSI1GfC/k7qiQ/vHCSSZlDicIdt0TlLCPQ1UCpbfjlfypnns/uCcfS34zMArJY
         w4X2wBLkSIDk/zVMkyEbh/pe7W6DMEYYwY2WQ=
In-Reply-To: <83389cab-dad7-5f73-c679-33be7bcee87f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Bimmermann <benjamin.bimmermann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Benjamin,

On 5 December 2016 at 16:32, Benjamin Bimmermann
<benjamin.bimmermann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Simon,
>
> I have created a patch for the test_tree1.dts. If you run "coverage run
> pylibfdt_tests.py" with that patch you see the error:
>
> ERROR: testGetProperty (__main__.PyLibfdtTests)
> Check that we can read the details of a property
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "pylibfdt_tests.py", line 259, in testGetProperty
>     self.fdt.get_property(root, 'wibble')
>   File "../pylibfdt/libfdt.py", line 348, in get_property
>     if self.string(pdata.nameoff) == name:
>   File "../pylibfdt/libfdt.py", line 206, in string
>     return fdt_string(self._fdt, fdt32_to_cpu(offset))
>   File "../pylibfdt/libfdt.py", line 102, in fdt32_to_cpu
>     return struct.unpack("=I", struct.pack(">I", val))[0]
> error: integer out of range for 'I' format code
>
> How I have found this issue:
> I try to parse a big Xilinx-Device-Tree :
> http://www.wiki.xilinx.com/file/view/zcu102-arm-multi-arch.dts/582977135/zcu102-arm-multi-arch.dts
> There at rp_gpio_pmu_intr: rp_gpio_pmu_intr@0 I have got the error two. I
> have tried to extract the problem and have included it in the
> test_tree1.dts.
> The Device-Tree-Compiler says that with the patched test_tree1.dts is fine.
>
> I have tried to fix the Problem, but I'm stuck. The problem is that the
> offset is negative.

The string() function does a byteswap. I wonder if that is causing
problems? It should be done by the caller, as David pointed out in the
next version.

>
> If you like I can send a patch for a fdtdump python version.
>

Sounds good!

- Simon
