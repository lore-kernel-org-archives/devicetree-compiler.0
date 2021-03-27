From: Simon Glass <sjg@chromium.org>
Subject: [PATCH] dtc: Update the build rule for pylibfdt
Date: Sun, 28 Mar 2021 11:27:18 +1300
Message-ID: <20210327222718.1721931-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=welx2eKZdXVqRjOU+kjrHiFMxhQThiwQwstkFN7XjZo=;
 b=VrHH8kv6cVNiPvdQAVhVTzc2IQQbxJ/EIinLc84b5E4wgiyEApgRTKvVclF9hSaq6V
 JF5GR1VMEoQalsEQ13Kl+7RLgo9KeVVphhlPI/lJUAvvrUiLyU2/AaBm4KYQ5+qAL8aM
 N9UqQNcP36DYirQZFNPauzvEkrLJqYTStHpas=
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <https://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

Some versions of make complain about using a grouped target without a
recipe:

.../pylibfdt/Makefile:36: *** grouped targets must provide a recipe.  Stop.

Fix this by adding a dummy recipe.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 scripts/dtc/pylibfdt/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/dtc/pylibfdt/Makefile b/scripts/dtc/pylibfdt/Makefile
index 4782dd45c6d..493995e3038 100644
--- a/scripts/dtc/pylibfdt/Makefile
+++ b/scripts/dtc/pylibfdt/Makefile
@@ -34,6 +34,7 @@ rebuild: $(src)/setup.py $(PYLIBFDT_srcs)
 	fi
 
 $(obj)/_libfdt.so $(obj)/libfdt.py &: rebuild
+	@:
 
 always += _libfdt.so libfdt.py
 
-- 
2.31.0.291.g576ba9dcdaf-goog

