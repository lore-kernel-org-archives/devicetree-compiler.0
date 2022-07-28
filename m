From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 2/4] Remove Jon Loeliger from maintainers list
Date: Thu, 28 Jul 2022 17:53:46 +1000
Message-ID: <20220728075348.174412-3-david@gibson.dropbear.id.au>
References: <20220728075348.174412-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658994830;
        bh=UjCoXbSqo1vz8yvODLI8A4Yskxy3zPezPQmnjOtiHoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P2GTYPRcS+zMvsz1SshrCIEzDEyrDDP/5nTqn8Eux7Z1dxce2FlpEc7BT38rrbYlv
         KyW9hsvl+7FVQVNXoO1VBZHMf576oojg7nA3qKrRKfFYBh3qq73UAlw5Y1iGZ6FNvp
         OBS53UnebCRYij21HLjtpod/NqU8QcI7obdPWUeQ=
In-Reply-To: <20220728075348.174412-1-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Jon hasn't been actively working on dtc maintenance for some years.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 README.md | 1 -
 1 file changed, 1 deletion(-)

diff --git a/README.md b/README.md
index 30212bc..36a3912 100644
--- a/README.md
+++ b/README.md
@@ -7,7 +7,6 @@ utility library for reading and manipulating the binary format.
 dtc and libfdt are maintained by:
 
 * [David Gibson `<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>`](mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org)
-* [Jon Loeliger `<loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>`](mailto:loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
 
 ## Python library
 
-- 
2.37.1

