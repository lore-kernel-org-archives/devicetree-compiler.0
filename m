From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 1/6] dtc: Tidy up pylibfdt build rule
Date: Wed, 24 Mar 2021 20:07:09 +1300
Message-ID: <20210324070714.4027879-2-sjg@chromium.org>
References: <20210324070714.4027879-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJzzuwuYkVtgwIiNh+aQInCIvnRpoFksqt9CVVr89kg=;
 b=BbrApmSUeDTHZVJQUDPX+PWsZcNTaotby7Qrbi6r+lLJN69AlM+aSLG+D/LmQkv9Nm
 FjBgUD+AFdXwgjTAv3VZuYY+/a4Axp/XeR36xMi0vUOft8cjeugIq/7v/8mKl1hB71Tb
 U7RtJmi+mIxG/Bjzsx1tOS9x9lbOmkmEcb3hQ=
In-Reply-To: <20210324070714.4027879-1-sjg@chromium.org>
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
Cc: Tom Rini <trini@konsulko.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

At present the build rule for pylibfdt depends on _libfdt.so but modern
Python versions add a different suffix to the output file, resulting in
something like _libfdt.cpython-38-x86_64-linux-gnu.so

The result is that pylibfdt is rebuilt every time.

Rename the file the standard name so that the rule works correctly. Also
add libfdt.py to the dependencies, so that file is always created if
missing.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 scripts/dtc/pylibfdt/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/pylibfdt/Makefile b/scripts/dtc/pylibfdt/Makefile
index 80b6ad2ae71..112198df9de 100644
--- a/scripts/dtc/pylibfdt/Makefile
+++ b/scripts/dtc/pylibfdt/Makefile
@@ -23,12 +23,16 @@ quiet_cmd_pymod = PYMOD   $@
 		SWIG_OPTS="-I$(LIBFDT_srcdir) -I$(LIBFDT_srcdir)/.." \
 		$(PYTHON3) $< --quiet build_ext --inplace
 
-$(obj)/_libfdt.so: $(src)/setup.py $(PYLIBFDT_srcs) FORCE
+$(obj)/_libfdt.so $(obj)/libfdt.py &: $(src)/setup.py $(PYLIBFDT_srcs)
 	@# Remove the library since otherwise Python doesn't seem to regenerate
 	@# the libfdt.py file if it is missing.
 	rm -f $(obj)/_libfdt*.so
 	$(call if_changed,pymod)
+	@# Rename the file to _libfdt.so so this Makefile doesn't run every time
+	@if [ ! -e $(obj)/_libfdt.so ]; then \
+		mv -v $(obj)/_libfdt*.so $(obj)/_libfdt.so; \
+	fi
 
-always += _libfdt.so
+always += _libfdt.so libfdt.py
 
 clean-files += libfdt.i _libfdt.so libfdt.py libfdt_wrap.c
-- 
2.31.0.291.g576ba9dcdaf-goog

