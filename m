From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] libfdt/tests: Add fdt_path_offset_namelen() test
Date: Tue, 07 Apr 2015 07:44:38 -0400
Message-ID: <5523C326.7010603@hurleysoftware.com>
References: <1428206756-27160-1-git-send-email-peter@hurleysoftware.com> <20150407044942.GC3476@voom.fritz.box> <5523BBA7.8090504@hurleysoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5523BBA7.8090504-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

On 04/07/2015 07:12 AM, Peter Hurley wrote:
> On 04/07/2015 12:49 AM, David Gibson wrote:
>> I did spot a case where the existing code is arguably incorrect: using
>> fdt_path_offset_namelen(fdt, "/somenode\0foo", 13) will return the
>> same as fdt_path_offset(fdt, "/somenode"), although I think ideally it
>> should always return -FDT_ERR_NOTFOUND, or some other error, since
>> node names can never include \0.
> 
> Ok, I'll fix that.

I think your memchr() is broken.

Patch below passes with the following output:
....
Checking offset of "/subnode@2/subsubnode@0/more" [first 24 characters] is 380...
Checking offset of "/subnode@2/subsubnode@0/more" [first 25 characters] is -1...
Checking offset of "/subnode@1" [first 14 characters] is -1...
PASS

Regards,
Peter Hurley

--- >% ---
diff --git a/tests/path_offset.c b/tests/path_offset.c
index bfebe9f..2788957 100644
--- a/tests/path_offset.c
+++ b/tests/path_offset.c
@@ -133,5 +133,7 @@ int main(int argc, char *argv[])
 	check_path_offset_namelen(fdt, "/subnode@2/subsubnode@0/more", 24, subsubnode2_offset2);
 	check_path_offset_namelen(fdt, "/subnode@2/subsubnode@0/more", 25, -FDT_ERR_NOTFOUND);
 
+	check_path_offset_namelen(fdt, "/subnode@1\0foo", 14, -FDT_ERR_NOTFOUND);
+
 	PASS();
 }


--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
