From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 0/3 v3] annotations
Date: Tue, 23 Jan 2018 23:21:28 +0100
Message-ID: <1516746091-28522-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

A third attempt at supporting file location annotations.

v3: The main change is to focus the positions on nodedefs (patch 2/3).  Now
the only building functions that take positions as arguments are
build_node, build_node_delete and build_property.  srcpos_combine is no
longer needed.  srcpos_combine has also been simplified.

The only change to patch 3/3 is to eliminate the switch case fall through
from 'F' to 'T'.  There is no change to patch 1/3.
