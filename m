From: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Subject: [PATCH 0/2] Nul string list v2
Date: Mon, 16 Jun 2014 11:35:50 -0500
Message-ID: <1402936552-10249-1-git-send-email-jack@codezen.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

- Tweaked patch description to make failing case clearer
- Added test

I decided to only test the mangled output since realloc was just a more serious
and obvious symptom of the same problem. I also verified that the pre-patch dtc
does in fact fail the test.

Let me know if there's anything else that needs to be done.

- Jack

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
