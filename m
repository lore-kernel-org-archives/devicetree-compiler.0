From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dtc: Show the usage text if no parameter is passed
Date: Wed, 18 Oct 2017 21:28:27 -0200
Message-ID: <1508369307-22307-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BpWMCnSJXCEHRJGje5sI+PgRCpzlw4BUaUm0tQV2So4=;
        b=fqoVi0YtN1Dlzus1V0PDVRjzsGl/M0d/riDP4J4wNPz6g9oro3DO/YP2pzuYLP/PP5
         Ba4AWx6+JrwJfdL3AhkiZpXLbAdsycj6bMghSWo9FLgnH00Avqv7jilh9DMtHI/Qy/P5
         ENhOezsBpJzo3uIi5VHnzIZUJkl4pcyldzJAZ2XpSRYknQHDT0BdXL3d6NN/BQtT4C2x
         s479rQVoofTC5R3NxVxfhu350PoyhZ0xLS1UICnGp2qzU+FyuBbPNoMkL+qN+ZKTR5E5
         06Pcv6YO2b4Xe7iMBTqO8CpdzEBK3bA6ru3xL+DhPVWwV7DuO4VArdIR2tSIkf2qlfTS
         Gk0g==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

When dtc is called without any argument the application hangs forever.

Instead of hanging, print the usage and exit.

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 dtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dtc.c b/dtc.c
index 5ed873c..6308a63 100644
--- a/dtc.c
+++ b/dtc.c
@@ -269,6 +269,8 @@ int main(int argc, char *argv[])
 		}
 	}
 
+	if (argc == 1)
+		usage(NULL);
 	if (argc > (optind+1))
 		usage("missing files");
 	else if (argc < (optind+1))
-- 
2.7.4
