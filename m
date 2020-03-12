From: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix undefined behaviour in fdt_splice_()
Date: Thu, 12 Mar 2020 09:19:06 +0100
Message-ID: <4eaa4349-edbf-eb53-637d-b62a20befddd@suse.com>
References: <f2d09e81-7cb8-c5cc-9699-1ac05b0626ff@suse.com>
 <20200311045914.GY660117@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200311045914.GY660117-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

David,

On 11.03.2020 05:59, David Gibson wrote:
> On Thu, Mar 05, 2020 at 03:04:45PM +0100, Jan Beulich wrote:
>> libfdt: fix undefined behaviour in fdt_splice_()
>>
>> Along the lines of commit d0b3ab0a0f46 ("libfdt: Fix undefined behaviour
>> in fdt_offset_ptr()"), fdt_splice_() similarly may not use pointer
>> arithmetic to do overflow checks. (The left side of the checks added by
>> d4c7c25c9ed1 ["libfdt: check for potential overrun in _fdt_splice()"]
>> doesn't really lend itself to similar replacement though.)
>>
>> Signed-off-by: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>
> 
> Applied, thanks.

would you mind pointing me at the tree that you applied this to?
From looking around I got the impression that

https://git.kernel.org/pub/scm/utils/dtc/dtc.git

would be the master tree, but I can't see any commit there newer
than from 8 days ago. The reason I'm asking is because I found
the issue originally in the Xen tree, which had imported libfdt
from the DTC project, and in order to submit the (backported)
fix there I'd like to be able to name the master tree's commit
hash.

Thanks, Jan
