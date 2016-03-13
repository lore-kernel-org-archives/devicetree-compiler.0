From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] fdt: Try to read #address-cells/size-cells from parent
Date: Sat, 12 Mar 2016 18:54:29 -0700
Message-ID: <CAPnjgZ2ZWhdcQgdefoH9rzvHDLBo58i6-pnJnn2NEzpPMbMRrQ@mail.gmail.com>
References: <5b7c7b1b2f6a81b2f97f1496558b9d03a59d0288.1455105881.git.michal.simek@xilinx.com>
 <56C1A148.70905@xilinx.com> <CAPnjgZ3kv2gdzmktbqBApnxnH_pm3ZmXcZCgd2dpE8VhxbZ-hg@mail.gmail.com>
 <56C349E8.9030808@xilinx.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=zp27tNwy++RHs2+5RPoCXwPgeyhDsWGQQKIRpMLJHYI=;
        b=je+VxwVPJVnVz+Zlk31z/dPioQ7eVSJkl7Pa5ZR6NhBQF24nZ/UnFqoIovlbRUBKe3
         yBrrNRT0oQrgtHbAnjnY6TrHy/FzLn5RFTiIlLDwbC/e3pIo72gvozkrvcH6ec5rxhHX
         0ABNWxiSPyneuE5wLhKlA0Q8Cs6lWspqV5rug9rR8H46xXyABc55BdOvgqCiINL8fF9g
         oOafDFn9yH8oKduzRv45GyBxRo5AOPqJcYxv7A5oKEc6njvbFoBUTDJtEsGPIDB/5mCn
         Q+oPli/37Xf2A/2K+gzqAy/8qrFpXDG2EJSD1vVzyzipUYGrBBWS+8w91P/issYCZ92b
         Yd5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=zp27tNwy++RHs2+5RPoCXwPgeyhDsWGQQKIRpMLJHYI=;
        b=ibB2fH3UCSdIfVGzAcKD6FROfhpiEacZKMGa7DsUR54JfYeFBQCTqtZgIPC1buxvQr
         mB7aSEE+daUakv8Ocn2ZHh0K8iahHKlRCtqMk/sRLqpcH04FCYWb0bsjAtU0DHytTvDy
         JcYlVRPcsGWn5+S6ReOrT5eA0vXzn49Mb8uSQ=
In-Reply-To: <56C349E8.9030808-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Michal,

On 16 February 2016 at 09:10, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Simon,
>
> On 16.2.2016 17:00, Simon Glass wrote:
>> Hi Michal,
>>
>> On 15 February 2016 at 02:58, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>>> Hi Simon,
>>>
>>> On 10.2.2016 13:04, Michal Simek wrote:
>>>> Read #address-cells and #size-cells from parent if they are not present in
>>>> current node.
>>>>
>>>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>
>>>> I have code which read information about memory for zynqmp but memory
>>>> node most of the time doesn't contain #address/size-cells which are
>>>> present in parent node.
>>>> That's why let's try to read it from parent.
>>>>
>>>> Also I think that we shouldn't return 2 if property is not found because
>>>> it has side effect on 32bit systems with #address/size-cells = <1>;
>>>>
>>>> ---
>>>>  lib/libfdt/fdt_addresses.c | 18 ++++++++++++++----
>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/lib/libfdt/fdt_addresses.c b/lib/libfdt/fdt_addresses.c
>>>> index 76054d98e5fd..b164d0988079 100644
>>>> --- a/lib/libfdt/fdt_addresses.c
>>>> +++ b/lib/libfdt/fdt_addresses.c
>>>> @@ -19,10 +19,15 @@ int fdt_address_cells(const void *fdt, int nodeoffset)
>>>>       const fdt32_t *ac;
>>>>       int val;
>>>>       int len;
>>>> +     int parent;
>>>>
>>>>       ac = fdt_getprop(fdt, nodeoffset, "#address-cells", &len);
>>>> -     if (!ac)
>>>> -             return 2;
>>>> +     if (!ac) {
>>>> +             parent = fdt_parent_offset(fdt, nodeoffset);
>>>> +             ac = fdt_getprop(fdt, parent, "#address-cells", &len);
>>>> +             if (!ac)
>>>> +                     return 2;
>>>> +     }
>>>>
>>>>       if (len != sizeof(*ac))
>>>>               return -FDT_ERR_BADNCELLS;
>>>> @@ -39,10 +44,15 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
>>>>       const fdt32_t *sc;
>>>>       int val;
>>>>       int len;
>>>> +     int parent;
>>>>
>>>>       sc = fdt_getprop(fdt, nodeoffset, "#size-cells", &len);
>>>> -     if (!sc)
>>>> -             return 2;
>>>> +     if (!sc) {
>>>> +             parent = fdt_parent_offset(fdt, nodeoffset);
>>>> +             sc = fdt_getprop(fdt, parent, "#size-cells", &len);
>>>> +             if (!sc)
>>>> +                     return 2;
>>>> +     }
>>>>
>>>>       if (len != sizeof(*sc))
>>>>               return -FDT_ERR_BADNCELLS;
>>>>
>>>
>>> Simon: Any comment?
>>
>> It seems risky to change the behaviour here. Also fdt_parent_offset() is slow.
>>
>> Can you point me to the binding / example DT that you are trying to parse?
>
> Look at dram_init(), etc.
> https://github.com/Xilinx/u-boot-xlnx/blob/master/board/xilinx/zynqmp/zynqmp.c
>
> fdt_get_reg() is calling fdt_size_cells()
>
>
> And this is DTS fragment.
>         #address-cells = <2>;
>         #size-cells = <1>;
>
>         memory {
>                 device_type = "memory";
>                 reg = <0x0 0x0 0x80000000>, <0x8 0x00000000 0x80000000>;
>         };
>
> Code is in memory node I need to work with and asking for size-cells.
> Current code returns 2 instead of error and the rest of code just works
> with size = 2 which is incorrect for this setup.
>
> I have already changed size-cells = 2 in our repo because I need to
> support for more than 4GB memory anyway but this should point to the
> problem in that generic functions.

I think this should go in a higher-level function. I very much doubt
that this patch would be accepted upstream.

Can you find the caller and make it call this function again (for the
parent) when no nothing is found on the first call? Hopefully this
caller will have access to the parent node and will not need to call
fdt_parent_offset().

>
> Thanks,
> Michal
>

Regards,
Simon
