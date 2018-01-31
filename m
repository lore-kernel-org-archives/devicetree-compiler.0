From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] checks: failure message improvements
Date: Wed, 31 Jan 2018 08:57:02 -0600
Message-ID: <20180131145705.21335-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This series standardizes how node paths and property names are printed 
in failure messages and switches to using source file and line numbers 
for failure messages.

The first 2 patches can apply to master. The 3rd is dependent on Julia's 
source annotation series.

Rob

Rob Herring (3):
  checks: centralize printing of node path in check_msg
  checks: centralize printing of property names in failure messages
  checks: Use source position information for check failures

 checks.c | 276 +++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 136 insertions(+), 140 deletions(-)

-- 
2.14.1
