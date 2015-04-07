From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] libfdt/tests: Add fdt_path_offset_namelen() test
Date: Tue, 07 Apr 2015 07:12:39 -0400
Message-ID: <5523BBA7.8090504@hurleysoftware.com>
References: <1428206756-27160-1-git-send-email-peter@hurleysoftware.com> <20150407044942.GC3476@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150407044942.GC3476-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

On 04/07/2015 12:49 AM, David Gibson wrote:
> On Sun, Apr 05, 2015 at 12:05:56AM -0400, Peter Hurley wrote:
>> Add unit test for fdt_path_offset_namelen(). Verify partial path-
>> descending retrieves the same node offset as fdt_subnode_offset().
>> Verify parsing correctness with multiple path separators, both
>> mid-path and trailing.
> 
> Thanks for writing this.  However, looking at it, I find the way it's
> doing the path splitting a bit impenetrable, and overly tied to the
> expected usecase of fdt_path_offset_namelen() rather than just its
> defined semantics.

Yeah; those are remnants of the unsubmitted v1, which retrieved the
paths from the fdt itself, as I wrote in the other thread.

> Instead of merging this, I've merged your original
> fdt_path_offset_namelen() patch, plus several patches which extend the
> existing path_offset testcase to exercise fdt_path_offset_namelen()
> and cover some other edge cases.

Ok, those look fine.

> I did spot a case where the existing code is arguably incorrect: using
> fdt_path_offset_namelen(fdt, "/somenode\0foo", 13) will return the
> same as fdt_path_offset(fdt, "/somenode"), although I think ideally it
> should always return -FDT_ERR_NOTFOUND, or some other error, since
> node names can never include \0.

Ok, I'll fix that.

> That's not an important enough problem to delay the patch though.  So,
> fdt_path_offset_namelen() is merged and pushed up to the usual git
> tree on kernel.org.

Thanks.

Regards,
Peter Hurley

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
