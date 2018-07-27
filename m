From: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: [PATCH v1] dtc: Add set-ldshared.patch
Date: Fri, 27 Jul 2018 15:23:28 -0700
Message-ID: <f1e71e0d-6728-78d1-0431-c1e2846ab885@infradead.org>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <buildroot-bounces-9GAsQqxh4YTR7s880joybQ@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GYSO8qzvl8/8iH3WwKhzDyizG/EIkP8UbRXpuylCbss=; b=LTnRsGArPy0E77RpzxP1o1RwN
 6b8o9Gmm/xXEPcekRGqx+707CJKmF2BZ4D1nuUzFS9yUooULeEGPFLcH/JxIZf/NNcx9bKCfbBoS5
 dVKCnozSZ7wTQVoX3AaQsEFRE5mCej2wBr8ea+UbmT/cjIdSWrdjRzFHyoGKLbhSV2q4YWCN6aeGc
 QLSvgRXg6W1u4CNt/EbjIUSo7f5p/FotS+tFUeSOsJ+7PE/nkgacsQJIBkmaLzWkukUB8NuABDR4s
 gn7GTBBm/al3me2Uj1F6XT1IzHUk59spKEsuqRvA2fDD3ccIBtNoMZnWENEQ4LgaEpNN8ZFKaa7xi
 AFocOMoig==;
In-Reply-To: <20180727110728.300c06e2@windsurf>
Content-Language: en-US
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request-9GAsQqxh4YTR7s880joybQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot-9GAsQqxh4YTR7s880joybQ@public.gmane.org>
List-Help: <mailto:buildroot-request-9GAsQqxh4YTR7s880joybQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request-9GAsQqxh4YTR7s880joybQ@public.gmane.org?subject=subscribe>
Errors-To: buildroot-bounces-9GAsQqxh4YTR7s880joybQ@public.gmane.org
Sender: "buildroot" <buildroot-bounces-9GAsQqxh4YTR7s880joybQ@public.gmane.org>
To: Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: buildroot-9GAsQqxh4YTR7s880joybQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Fixes pylibfdt cross compile errors.

http://autobuild.buildroot.net/?reason=%dtc-1.4.7

Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
---

Hi Thomas,

This gets the dtc package to build with python support, but
it seems the real problem is that python distutils doesn't
set LDSHARED correctly, which should default to CC.

-Geoff

 package/dtc/set-ldshared.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/dtc/set-ldshared.patch

diff --git a/package/dtc/set-ldshared.patch b/package/dtc/set-ldshared.patch
new file mode 100644
index 0000000000..09220da359
--- /dev/null
+++ b/package/dtc/set-ldshared.patch
@@ -0,0 +1,13 @@
+diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
+index 9507d3d..c2ac8e9 100644
+--- a/pylibfdt/Makefile.pylibfdt
++++ b/pylibfdt/Makefile.pylibfdt
+@@ -8,7 +8,7 @@ PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
+ define run_setup
+ 	SOURCES="$(1)" CPPFLAGS="$(CPPFLAGS)" OBJDIR="$(PYLIBFDT_objdir)"
+ 	VERSION="$(dtc_version)"
+-	$(PYLIBFDT_objdir)/setup.py --quiet $(2)
++	LDSHARED="$(CC) -shared" $(PYLIBFDT_objdir)/setup.py --quiet $(2)
+ endef
+ 
+ $(PYMODULE): $(PYLIBFDT_srcs)
-- 
2.14.1
