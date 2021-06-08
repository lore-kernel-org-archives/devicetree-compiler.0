From: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Tue, 8 Jun 2021 12:47:45 +0200
Message-ID: <3f28c86d-064d-ec68-e8de-f1dcd38c08ca@fastree3d.com>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
 <20200820102734.GR271315@yekko.fritz.box>
 <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com> <YL7vh7JkjymjKsQD@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rUiuYKaBQL7yRaFaB3VEHHRO/8M1ggZHd1w4ltGVimY=;
        b=m5mr9SXKNCdAolJPF7gMZYtq4Irr+HfqzjdhA5hY7Q3Lxfsp61qjo9NeMpOgTQqwvF
         0z3Ydh86zJ9i5Xhj0udJZeq5TvTXiLpQ253vnZZX5ojakDOlpk6orLqrBWou4670N7p9
         yGKsUDjfWDfrBmu2cEhep+gv2OC7oHDU1XiEJPsQ/xHU8gIhCL4HbO3Hf/gdMHGL8GHf
         KuughrSDI1+3ng7/Hvn0lbEkgCUgiOPCZDwZiP4VJ66d13vghiwpESWT1fzosG66QSYO
         eDSHd/kTiAK42xKtHfhni8JhJECfZ5YyLAPqZcDqVofyaJ7u7mGkZk3KoHtaA6k9RkeR
         rlsA==
In-Reply-To: <YL7vh7JkjymjKsQD@yekko>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

Thanks for your message.

I found a workaround for this issue and as I raised the problem almost a
year ago, I would need time to reproduce it, which unfortunately I can't
afford these days. Thus I can't support you in debugging this anymore.

Regards,

Adrian

On 08.06.2021=A006:18, David Gibson wrote:
> On Thu, Aug 20, 2020 at 01:32:17PM +0200, Adrian Fiergolski wrote:
>> Hi David,
>>
>> Thank you for your reply.
>>
>> On 20.08.2020=A012:27, David Gibson wrote:
>>> On Fri, Aug 14, 2020 at 08:13:22PM +0200, Adrian Fiergolski wrote:
>>>> Hi,
>>>>
>>>> I am using yocto to build my custom distribution targetting arm64 on
>>>> Ubuntu 18.04.4.
>>>>
>>>> I have an issue compiling dts which was preprocessed with gcc version
>>>> 7.5.0 (I haven't tried other version) and '-g3' flag. The error messag=
e:
>>> Huh.  It's surprising to me that -g options affect the preprocessor
>>> behavior at all.
>>>
>>>>     ./scripts/dtc/dtc -O dtb -o
>>>>     arch/arm64/boot/dts/xilinx/zynqmp-falcon.dtb -b 0
>>>>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-=
zynqmp/kernel-source/arch/arm64/boot/dts/xilinx/
>>>>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-=
zynqmp/kernel-source/scripts/dtc/include-prefixes
>>>>     -Wno-unit_address_vs_reg -Wno-unit_address_format
>>>>     -Wno-avoid_unnecessary_addr_size -Wno-alias_paths
>>>>     -Wno-graph_child_address -Wno-simple_bus_reg
>>>>     -Wno-unique_unit_address -Wno-pci_device_reg=A0 -d
>>>>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.d.dtc.tmp
>>>>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.dts.tmp
>>>>
>>>>     Error: <built-in>:1.1-2 syntax error
>>>>     FATAL ERROR: Unable to parse input tree
>>>>
>>>> The part of a preprocessed dts causing issue:
>>>>
>>>>     # 1
>>>>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-z=
ynqmp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>>>>     # 1
>>>>     "/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-p=
oky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/linux-falcon_zynqmp-stand=
ard-build//"
>>>>     # 1 "<built-in>"
>>>>     #define __STDC__ 1
>>> If it's preprocessed already, why does it still have #defines?
>>>
>>> This is the cause of the problem - the dtc lexer can hande the lines
>>> in the preprocessor output with file/linue number information, but it
>>> doesn't expect there to be remaining preprocessor directives.
>> Yes, it's preprocessed already by gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.=
0.
>>
>> Are you able to reproduce the issue (any dts including dtsi should give
>> similar results)?
> No, I haven't been able to reproduce this problem.  I did hit a
> different problem in the area, where cpp was generating line number
> information in a format the dtc lexer didn't expect.  I've just pushed
> a fix for that.
>
> But leaving in #defines in preprocessed code really looks like a
> problem with how the preprocessor is invoked, not with dtc.  If I'm
> going to debug this without more messing around than I have time for,
> please give me *specific* dts/dtsi files to attempt this, and
> *exactly* how the preprocessor is being invoked.
>
