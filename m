From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: Question about "unit address format error" of DTC
Date: Fri, 10 Nov 2017 00:09:51 +0900
Message-ID: <CAK7LNARoE6hhhH36ZugfqCNubUQzSLYGkMrx5TzTQe-gpu4CaQ@mail.gmail.com>
References: <CAK7LNARujG8J_z62bc+PQOz34rf-Bo=+M54kvtokZxnktn2Y+A@mail.gmail.com>
 <CAL_Jsq+eZkCQTEHLb62Le3e6eLxt=N7EWGk7dsPAfLF9-73soQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com vA9FAWCu010502
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1510240233;
        bh=HQoF2Mthrr+W2SKVjMePZyMIKgjOwa5l6rYXCi040RE=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=29W6V7Hk0LmVqJzoXTgASHm4VH0/0ENddag8NHxQAgde8IWwCaXyvU1423k6QiTsB
         vXypdMbWfAYAEdFMhkvUU4qaNDKmE2XztS5Cf3ZwfKu7wm6y7cPbxjGSyX4W99ps4W
         MxK5iwoyFV70DFSdLfCloLpMZWg6Gtv3xhMavJ+P1IxUHcutKKlVDv+UAFC/st6Pc6
         4fJd5b2SJFd9SCccQpi1/p8CV8MCbA09oPEtP2/7vfGJAL446VGBIs2tpOv0skL8Ci
         W9SxeJo7bkL9drDbPx+6ddhAwjVBbXpF4IDk048KDXLfT9Wvknz1QzuPgCwT/QYbPQ
         oFW4cShpEvr8g==
In-Reply-To: <CAL_Jsq+eZkCQTEHLb62Le3e6eLxt=N7EWGk7dsPAfLF9-73soQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Rob,

2017-11-09 23:15 GMT+09:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Thu, Nov 9, 2017 at 6:14 AM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>> Hi Rob, David,
>>
>>
>> I am just curious about a DTC warning.
>>
>>
>> For example,
>>
>> soc {
>>     compatible = "simple-bus";
>>     #address-cells = <1>;
>>     #size-cells = <1>;
>>     ranges;
>>
>>     foo@11111111 {
>>          compatible = "foo";
>>          reg = <0x54006800 0x40>;
>>     };
>> };
>>
>> This emits the following warning.
>>
>> Warning (simple_bus_reg): Node /soc/foo@11111111 simple-bus unit
>> address format error, expected "54006800"
>>
>>
>> But, if I replace "simple-bus" with "simple-mfd",
>> DTC is completely happy.
>
> We could probably add simple-mfd to the check. Though, if you have
> addresses, then you probably should use simple-bus. I'm not a bit fan
> of simple-mfd in general.
>
>> Why is this check limited to simple bus / PCI bus?
>
> Because bus types are free to define their own unit address format to
> some extent.
>
>> For other cases, is mismatching @<address>  allowed?
>
> No, but it is not checked. Most other cases such as I2C and SPI buses
> aren't checked because we have no generic way to key off of them. We
> need schema data with compatible strings of those bus controllers to
> do the checking.
>
> Any bus type needs to define its unit address format. Generally, it
> must match data fields in reg property and distinct fields are
> separated by commas.
>

Thanks.
I had a more specific example I wanted to ask,
but your last comment "distinct fields are separated by commas"
probably answered the question.


The following is an example of NVMEM data cells.
The generic binding is Documentation/devicetree/binding/nvmem/nvmem.txt


reg:    specifies the offset in byte within the storage device.

bits:   Is pair of bit location and number of bits, which specifies offset
        in bit and number of bits within the address range specified
by reg property.
        Offset takes values from 0-7.


So, it is possible to have multiple data cells
that share the same "reg".

@<reg-offset>,<bit-position>
was the idea in my mind, but I was not 100% sure.

         qfprom: qfprom@00700000 {
                ...

                /* Data cells */
                calib0: calib@10,2 {
                        reg = <0x10 0x4>;
                        bits = <2 2>;
                };

                calib1: calib@10,6 {
                        reg = <0x10 0x4>;
                        bits = <6 2>
                };

                calib2: calib@14,2 {
                        reg = <0x14 0x4>;
                        bits = <2 2>;
                };

                calib3: calib@14,6 {
                        reg = <0x14 0x4>;
                        bits = <6 2>
                };
                ...
        };


From your comment, probably, this is the right thing to do.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
