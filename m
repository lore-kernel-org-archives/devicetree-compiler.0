From: Maxim Zhukov <mussitantesmortem@gmail.com>
Subject: [PATCH V2 2/2] scripts: dtc: fix memory leak after realloc
Date: Tue, 12 Apr 2016 23:55:00 +0300
Message-ID: <1460494500-26922-3-git-send-email-mussitantesmortem@gmail.com>
References: <1460494500-26922-1-git-send-email-mussitantesmortem@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=n1TAKx5qHVPHLh6yUKGZRfEZZZ1OGKhXOEtwVZitX8A=;
        b=Oz0id43ooD0uHD4VQ/G5+HxZH8Y7aVND4Mxfa8+fyWmt8FaxBv0cNM6HAlKopXCu1q
         i34R7Qjx+kUHlThQqeJNEfvD+m/iziYcEtPuLl7xjCf9zE159k7pLmLR0mqCD4KtfRgm
         Wip0YN497afhiELKkZGvVlR7K40VQXy8zeatP5vnLmBLzhMo9EgZLaipKIf/OcHI/Aer
         tHBXUHG3b7DNFn26jhrWYJJ/y1UrzcqgDaZMpXWzl7E0hHjTa/pWSWgrM2ow6pzniaW3
         CuRR+T4vuI4w2wRHPjUBVg47WnDE8yeJUW6rBcapysDHQKT7oMsNKzdMyW4GU8abLgpc
         /JrQ==
In-Reply-To: <1460494500-26922-1-git-send-email-mussitantesmortem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Maxim Zhukov <mussitantesmortem@gmail.com>, devicetree-compiler@vger.kernel.org

This commit fixed memory leak after errors realloc.

Signed-off-by: Maxim Zhukov <mussitantesmortem@gmail.com>
---
 scripts/dtc/fdtput.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/fdtput.c b/scripts/dtc/fdtput.c
index f2197f5..1042319 100644
--- a/scripts/dtc/fdtput.c
+++ b/scripts/dtc/fdtput.c
@@ -75,8 +75,9 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 	char *ptr;		/* pointer to current value position */
 	int len;		/* length of this cell/string/byte */
 	int ival;
-	int upto;	/* the number of bytes we have written to buf */
+	int upto;		/* the number of bytes we have written to buf */
 	char fmt[3];
+	void *save_ptr = NULL;	/* save pointer to realloc */
 
 	upto = 0;
 
@@ -96,12 +97,15 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 		/* enlarge our value buffer by a suitable margin if needed */
 		if (upto + len > value_size) {
 			value_size = (upto + len) + 500;
-			value = realloc(value, value_size);
-			if (!value) {
+			void *save_ptr = realloc(value, value_size);
+
+			if (!save_ptr) {
+				free(value);
 				fprintf(stderr, "Out of mmory: cannot alloc "
 					"%d bytes\n", value_size);
 				return -1;
 			}
+			value = save_ptr;
 		}
 
 		ptr = value + upto;
-- 
2.7.1.1.g3617aa0

