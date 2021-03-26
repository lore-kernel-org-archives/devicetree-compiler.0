From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 1/6] libfdt: Tidy up pylibfdt build rule
Date: Fri, 26 Mar 2021 17:02:03 +1300
Message-ID: <20210326040208.878820-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ame/69KO7hhBo7P+gacu0amzzcSRu8MfaIFKX1ALwaw=;
 b=cT49dAQdPd7LjMg1g75J7LHimcqHm41Is+oXFZZ//iQyJuaKP233UG+sXOSww2u1lr
 HkhiIK6YkNIDVN4Rz86bNGg1bbfMm/0mQxWN/V5DPy1eQhACGY04Plpee09Djnpo9tTg
 P2oovkudItbcqQNXAaqUrLKvW6eV/H2B/w+yQ=
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

At present the build rule for pylibfdt depends on _libfdt.so but modern
Python versions add a different suffix to the output file, resulting in
something like _libfdt.cpython-38-x86_64-linux-gnu.so

The result is that pylibfdt is rebuilt every time.

Rename the file the standard name so that the rule works correctly. Also
add libfdt.py to the dependencies, so that file is always created if
missing.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Make the rm silent
- Use a single build rule to avoid building two pylibfdts in parallel

Changes in v2:
- Adjust tag so this patch doesn't got to dtc list

 scripts/dtc/pylibfdt/Makefile | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/pylibfdt/Makefile b/scripts/dtc/pylibfdt/Makefile
index 80b6ad2ae71..4782dd45c6d 100644
--- a/scripts/dtc/pylibfdt/Makefile
+++ b/scripts/dtc/pylibfdt/Makefile
@@ -23,12 +23,18 @@ quiet_cmd_pymod = PYMOD   $@
 		SWIG_OPTS="-I$(LIBFDT_srcdir) -I$(LIBFDT_srcdir)/.." \
 		$(PYTHON3) $< --quiet build_ext --inplace
 
-$(obj)/_libfdt.so: $(src)/setup.py $(PYLIBFDT_srcs) FORCE
+rebuild: $(src)/setup.py $(PYLIBFDT_srcs)
 	@# Remove the library since otherwise Python doesn't seem to regenerate
 	@# the libfdt.py file if it is missing.
-	rm -f $(obj)/_libfdt*.so
+	@rm -f $(obj)/_libfdt*.so
 	$(call if_changed,pymod)
+	@# Rename the file to _libfdt.so so this Makefile doesn't run every time
+	@if [ ! -e $(obj)/_libfdt.so ]; then \
+		mv $(obj)/_libfdt*.so $(obj)/_libfdt.so; \
+	fi
 
-always += _libfdt.so
+$(obj)/_libfdt.so $(obj)/libfdt.py &: rebuild
+
+always += _libfdt.so libfdt.py
 
 clean-files += libfdt.i _libfdt.so libfdt.py libfdt_wrap.c
-- 
2.31.0.291.g576ba9dcdaf-goog

