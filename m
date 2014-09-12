From: Jay Bhukhanwala <jaybhukhanwala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Iterator break-free ?
Date: Thu, 11 Sep 2014 22:21:11 -0700
Message-ID: <CAB8QsTBF5V8JJeEkkUXN30fnUoDxVWR_ufGkXaEHRGeZCc6ozw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=67uSNIXN52+NS61UhSXejuRz9NpxUbsVJ5GROzP6uXM=;
        b=R1lrST7gtT11awu8dCmZnGXXILYLXWxdx/Y0hf56JaOcMAbraTMnZUX1I7IRmMJ0eY
         8gpDn+64uqxyqfNfBv/x+Vxqq9/nVuaC/9+wT0eBKmoFsxwvT3riNS1fFahDyS+kQkl/
         WaivYVNSba7RLbj/5EklWh5r0erVlnR2Bf1/95By/TYfW9Q7e+nGEOAbnbMYPbYWIDxC
         oMLfCvQehXR9ZhPsYw93cIo2KvEU5CEGuhST3GtALHsJJARd4NyoYnyAwFJDjZOkiEvb
         DzgANv/Q1FQumckzRRtAjzmARv62ggQG5BlsvH3R9VZtqKyiS45CCGDDziuSrzJLN609
         yFpA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

When traversing the entire tree using fdt_next_node, will the iterator
break if I change the blob structure, due to, say, addition/deletion
of a node/property or changing a property ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
