From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: columns
Date: Sat, 6 Jan 2018 17:43:20 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801061739130.2579@hadrien>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

I have been working with Frank Rowand on a v7 of file and line number
annotations in the -O dts output of the device tree compiler.

I wanted to make an --annotate-full option that would print the full
filename, and starting and ending line and column numbers.

The following commit:

commit 728c5e87c655c17c2fbc1d5386b12ff328e0fc76
Author: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Date:   Tue Dec 8 14:24:42 2009 +1100

extends the position mechanism with columns, but considers a tab to be 8
column.  Would it be ok to drop this feature?  I have the impression that
counting 1 column for a tab would be more useful for actually finding the
referenced code.

thanks,
julia
