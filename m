From: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [U-Boot,v4,01/13] cmd: fdt: Narrow the check for fdt addr
Date: Wed, 17 Aug 2016 11:31:18 +0900
Message-ID: <3d40964a-47ce-c9cf-302a-c5f960245928@samsung.com>
References: <20160705082646.25044-2-maxime.ripard@free-electrons.com>
 <cf8fe411-8503-78d3-1603-05f1bacd0eb1@samsung.com>
 <CGME20160816015450epcas1p1fc8924fd02ed0e17ad0d68685e28d327@epcas1p1.samsung.com>
 <20160816015518.GT5342@bill-the-cat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160816015518.GT5342@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On 08/16/2016 10:55 AM, Tom Rini wrote:
> On Tue, Aug 16, 2016 at 10:52:04AM +0900, Jaehoon Chung wrote:
>> Hi,
>>
>> On 07/05/2016 05:26 PM, Maxime Ripard wrote:
>>> The current code only checks if the fdt subcommand is fdt addr by checking
>>> whether it starts with 'a'.
>>>
>>> Since this is a pretty widely used letter, narrow down that check a bit.
>>>
>>> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>
>> I don't know what these patchset were delegated to me..I think it's not my scope.
>> Simon is FDT maintainer..Could you check these patch-set?
> 
> Ah whoops, that would be me.  I assigned Pantelis some FDT stuff in
> patchwork too, but I bulk changed it all over to you, sorry!

Thanks! :)  Then I will delegate to you, is it ok?

Best Regards,
Jaehoon Chung

> 
