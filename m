From: Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dtc: Remove -O dtbo support
Date: Thu, 11 Mar 2021 18:49:55 +0900
Message-ID: <20210311094956.924310-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12B9nwhl002542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615456199;
        bh=tU1rgHivXdH5s2lytr9GeUiujmryAQjfRJ9OayUhrSc=;
        h=From:To:Cc:Subject:Date:From;
        b=QEgETiogetu5b/1uJ6jbLb3NPuYWzsP8+fG2QdrNFbJlePIOosZYZUdXV5QPSLBRW
         6g/OBVJqgD5d7dF14So/Vqkt7FOymxeV/E7QOgSyVBVJYFtaaJ9o4ZpooYnfvkCeuE
         K3dqTaKkI+6jOww/nlXBwBbAprW8yGxWeaD+RQlawbcW8lxijS7PHvprYZxGFMEQCN
         MqScHUjWd0Ns1L6QiYWF+/X2Aq+cDmkQIe3y4CpSvlgzLMBbp0FpY9ESnHpMTHMpHE
         ajv5jUiDl9hdG+LJuLb7Z8HqtSasBucqRfSEkEbaJQrGhFJJbjxHcg62T+MKCqpICJ
         gy7ZmafJV07ng==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This partially reverts 163f0469bf2e ("dtc: Allow overlays to have
.dtbo extension").

I think accepting "dtbo" as --out-format is strange. This is not
shown by --help, at least.

*.dtb and *.dtbo should have the same format, "dtb".

Signed-off-by: Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

 dtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index 838c5df..3962d3f 100644
--- a/dtc.c
+++ b/dtc.c
@@ -359,8 +359,6 @@ int main(int argc, char *argv[])
 #endif
 	} else if (streq(outform, "dtb")) {
 		dt_to_blob(outf, dti, outversion);
-	} else if (streq(outform, "dtbo")) {
-		dt_to_blob(outf, dti, outversion);
 	} else if (streq(outform, "asm")) {
 		dt_to_asm(outf, dti, outversion);
 	} else if (streq(outform, "null")) {
-- 
2.27.0

