From: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Thu, 20 Aug 2020 13:32:17 +0200
Message-ID: <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
 <20200820102734.GR271315@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Fo1RxnyPESl9muosgOYDIKhW6hvgBRjonXH9mcF0Ozw=;
        b=18tHf0Md/BVXcGfKF0tsCHbCSBkVB6U4GXWmLwmnXFqNjMAR3thcjag/eKtLqPqR1g
         O8HaTlTmxSyJFcw1HLN4E8kZBQv6buprJAgChaqae5Qqwqx4ykniEDaXO/Os1eZlyVRK
         ferFwpNns4oFHUaIBbHJXl+irl1W3z1/nv3TBPed4CVGWuXkEO9P94PJOoTP+jOnf81K
         L8sacFJKZan9HryHiUqANuo9fhC1SAahp6M1ocDWaciqWt6caeJz2VpUa666jSXn+Ym6
         NJrOM38GzCxE1WkXvY2YiY9MTRhjmQdGjyp5SgemvCay6yqHgWlQyssjer9w1bGiwH6v
         +GtQ==
In-Reply-To: <20200820102734.GR271315-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

Thank you for your reply.

On 20.08.2020=A012:27, David Gibson wrote:
> On Fri, Aug 14, 2020 at 08:13:22PM +0200, Adrian Fiergolski wrote:
>> Hi,
>>
>> I am using yocto to build my custom distribution targetting arm64 on
>> Ubuntu 18.04.4.
>>
>> I have an issue compiling dts which was preprocessed with gcc version
>> 7.5.0 (I haven't tried other version) and '-g3' flag. The error message:
> Huh.  It's surprising to me that -g options affect the preprocessor
> behavior at all.
>
>>     ./scripts/dtc/dtc -O dtb -o
>>     arch/arm64/boot/dts/xilinx/zynqmp-falcon.dtb -b 0
>>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zy=
nqmp/kernel-source/arch/arm64/boot/dts/xilinx/
>>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zy=
nqmp/kernel-source/scripts/dtc/include-prefixes
>>     -Wno-unit_address_vs_reg -Wno-unit_address_format
>>     -Wno-avoid_unnecessary_addr_size -Wno-alias_paths
>>     -Wno-graph_child_address -Wno-simple_bus_reg
>>     -Wno-unique_unit_address -Wno-pci_device_reg=A0 -d
>>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.d.dtc.tmp
>>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.dts.tmp
>>
>>     Error: <built-in>:1.1-2 syntax error
>>     FATAL ERROR: Unable to parse input tree
>>
>> The part of a preprocessed dts causing issue:
>>
>>     # 1
>>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zyn=
qmp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>>     # 1
>>     "/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-pok=
y-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/linux-falcon_zynqmp-standar=
d-build//"
>>     # 1 "<built-in>"
>>     #define __STDC__ 1
> If it's preprocessed already, why does it still have #defines?
>
> This is the cause of the problem - the dtc lexer can hande the lines
> in the preprocessor output with file/linue number information, but it
> doesn't expect there to be remaining preprocessor directives.

Yes, it's preprocessed already by gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0.

Are you able to reproduce the issue (any dts including dtsi should give
similar results)?

Regards,

Adrian

