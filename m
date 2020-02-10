From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] libfdt: place new nodes & properties after the parent's
 ones
Date: Mon, 10 Feb 2020 12:40:19 +0100
Message-ID: <bc380fd8-71bb-897e-f060-b51386dec9be@samsung.com>
References: <CGME20200204125854eucas1p19ace564a5f45b9231e0fba8af07009cd@eucas1p1.samsung.com>
        <20200204125844.19955-1-m.szyprowski@samsung.com>
        <20200205054508.GG60221@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200210114021euoutp014ea9cbef9a4d077073981cf198daa931~yB6RUL-ky2659526595euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1581334821;
        bh=sql+OYh6KxpF7toLwqx0dwiowWTueC4WVmqzlhdVi+U=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=fHKUzuicfrYZ3RmGAgz3aEmXYocedn+t2ZT6o+kK0LZtWiRU0+3sxUzCxtG6J+BeT
         QO3B/rtXYQUaRXwjtItjrm9OyqRtCt0hXFkg/TJDskzbCILQxppd+Ol6R6bdlTORwr
         jZSO43whwRTIC2b+sNL4Rk692V3W6JoUw2zQliCk=
In-Reply-To: <20200205054508.GG60221-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Hi David,

On 05.02.2020 06:45, David Gibson wrote:
> On Tue, Feb 04, 2020 at 01:58:44PM +0100, Marek Szyprowski wrote:
>> While applying dt-overlays using libfdt code, the order of the applied
>> properties and sub-nodes is reversed. This should not be a problem in
>> ideal world (mainline), but this matters for some vendor specific/custom
>> dtb files. This can be easily fixed by the little change to libfdt code:
>> any new properties and sub-nodes should be added after the parent's node
>> properties and subnodes.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> I'm not convinced this is a good idea.
>
> First, anything that relies on the order of properties or subnodes in
> a dtb is deeply, fundamentally broken.  That can't even really be a
> problem with a dtb file itself, only with the code processing it.

I agree about the properties, but generally the order of nodes usually 
implies the order of creation of some devices or objects. This sometimes 
has some side-effects.

For comparison, the other lib used for fdt manipulation (libufdt) 
applies overlays in a such way, that the order of properties and nodes 
is not reversed.

> I'm also concerned this could have a negative performance impact,
> since it has to skip over a bunch of existing things before adding the
> new one.  On the other hand, that may be offset by the fact that it
> will reduce the amount of stuff that needs to be memmove()ed later on.

This code is already slow (especially in the way the uboot's use it for 
'fdt apply' command), but in practice I've didn't observe negative 
impact on the performance of applying large overlays at all.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

