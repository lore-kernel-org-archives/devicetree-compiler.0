From: Heinrich Schuchardt <heinrich.schuchardt-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 1/1] dtc: fix asm_emit_data()
Date: Tue, 22 Aug 2023 13:06:27 +0200
Message-ID: <20230822110627.141540-1-heinrich.schuchardt@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692702395;
        bh=t+Qzv00Pr1sQ9IAztdxga4cssYMQrDwNi/+whg3sl0o=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=sxDULmhxFVaidzftjSX5U4omo3amH55sp7s0BW6MJ1+WbhZ3yomTDVDpsWZ79J7Zf
         ob7zYY9PwYWRM1HZaC5XXwLAPT04iABvRt2NC6IAxdFYmoZ2eBt4D8d4suqwVDZVB8
         ucWuyUDVGRIfuu8I8I1ghi93cn/UA+CdGU6TInkDJs0qLIZ2U4LeiWpM/pA1AYe5MW
         QBLacVSzeoUm89kLOqNMmia3HkDBRcn5JyZFvKiLsITM32KC/zBR5ppEjk+PJGKorY
         Z38ARzt9rVHH18VW7l4ZGHqG87KLIQUEL008hKvW+Gpw/dI2qyjBHDRdsug4spN+xE
         /jCKHEFnLWBgQ==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <heinrich.schuchardt-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

((d.len - off) >= sizeof(uint32_t)) will possibly be true if off > d.len:

sizeof(uint32_t)) is an unsigned type. The C language will convert
(d.len - off) to an unsigned type before executing the comparison.

Correct the inequality.
Change the equality for byte output to match the one for uint32_t.

Fixes: 53359016caf6 ("dtc: Use stdint.h types throughout dtc")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 flattree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/flattree.c b/flattree.c
index 1bcd808..9f67104 100644
--- a/flattree.c
+++ b/flattree.c
@@ -156,12 +156,12 @@ static void asm_emit_data(void *e, struct data d)
 	for_each_marker_of_type(m, LABEL)
 		emit_offset_label(f, m->ref, m->offset);
 
-	while ((d.len - off) >= sizeof(uint32_t)) {
+	while (d.len + sizeof(uint32_t) >= off) {
 		asm_emit_cell(e, dtb_ld32(d.val + off));
 		off += sizeof(uint32_t);
 	}
 
-	while ((d.len - off) >= 1) {
+	while (d.len + 1 >= off) {
 		fprintf(f, "\t.byte\t0x%hhx\n", d.val[off]);
 		off += 1;
 	}
-- 
2.40.1

