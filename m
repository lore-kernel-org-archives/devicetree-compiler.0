From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 0/3 v4] annotations
Date: Fri,  2 Feb 2018 21:41:47 +0100
Message-ID: <1517604110-790-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

A fourth attempt at supporting file location annotations.

The changes are minor in response to David's comments.  In particular, it
does not seem possible to eliminate the linking of the new part of the
position list in srcpos_extend.  That part of the list has to be copied to
avoid loops and there is no way to know whether the elements are referenced
elsewhere.
