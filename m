From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 1/6] libfdt: Tidy up pylibfdt build rule
Date: Thu, 25 Mar 2021 06:40:48 +1300
Message-ID: <20210324174053.4180445-2-sjg@chromium.org>
References: <20210324174053.4180445-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gl1iVz/xG6XeKo/Wv4x8adT/7pzMXcQaJZw7CPvwVYk=;
 b=h157qKWnooTyEpYyH8g9auGCPe7UbjLfgLnaHVcnBgIQkc8tHRHBSXUAV5LCJCGL/V
 NjjVz2H4c+EJJkWUyIM7Gnw6jmZYWoptbEwKG4glgbz770e7DmVOyyQwZKs37htsWDpD
 1SoMBSryf1hDvQ5/9BKTa5z6WhVCJglJO+8Lw=
In-Reply-To: <20210324174053.4180445-1-sjg@chromium.org>
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

Changes in v2:
- Adjust tag so this patch doesn't got to dtc list

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

