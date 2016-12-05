From: Benjamin Bimmermann <benjamin.bimmermann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: coverage test failed
Date: Mon, 5 Dec 2016 22:32:18 +0100
Message-ID: <83389cab-dad7-5f73-c679-33be7bcee87f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------03ADD0E830C5257FCFBC1F88"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version;
        bh=9rrnjJ5YZ3+HfAQbO+PGTs5sGwwxIN+k1C0yNOggfrU=;
        b=eKhAkinWB8dFGM8fhNVSCZCqsp/3xLq8q+TzEzojvIhwlJpm6vZeVs07FV8w9JhG1O
         DIrWej+C7cc0WxVaV37edaViZaBl6X5LSNzbFuDsinLLRfJ+LjwaXWAb98VTg2xndN0y
         kRDY1mst4L+WLpb3M8/AT/ZCri/Y9i5Z+CAhEeNT4JylHl5iuv06NPkAwGlynB4sxw//
         8epckiy0hp3y+FzxlKtDuI5lqdEt48SWijVIfMZ8q/TKbR6QktdpYFrLx+j3yf6Ukhkc
         YTlpxviZBM4f7uvc/LFrCJ9niExyjVulw5TnD9QhpwMR6pvDGa28m1xVNLcKSaxKr14q
         7G7Q==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

This is a multi-part message in MIME format.
--------------03ADD0E830C5257FCFBC1F88
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Simon,

I have created a patch for the test_tree1.dts. If you run "coverage run 
pylibfdt_tests.py" with that patch you see the error:

ERROR: testGetProperty (__main__.PyLibfdtTests)
Check that we can read the details of a property
----------------------------------------------------------------------
Traceback (most recent call last):
   File "pylibfdt_tests.py", line 259, in testGetProperty
     self.fdt.get_property(root, 'wibble')
   File "../pylibfdt/libfdt.py", line 348, in get_property
     if self.string(pdata.nameoff) == name:
   File "../pylibfdt/libfdt.py", line 206, in string
     return fdt_string(self._fdt, fdt32_to_cpu(offset))
   File "../pylibfdt/libfdt.py", line 102, in fdt32_to_cpu
     return struct.unpack("=I", struct.pack(">I", val))[0]
error: integer out of range for 'I' format code

How I have found this issue:
I try to parse a big Xilinx-Device-Tree : 
http://www.wiki.xilinx.com/file/view/zcu102-arm-multi-arch.dts/582977135/zcu102-arm-multi-arch.dts
There at rp_gpio_pmu_intr: rp_gpio_pmu_intr@0 I have got the error two. 
I have tried to extract the problem and have included it in the 
test_tree1.dts.
The Device-Tree-Compiler says that with the patched test_tree1.dts is fine.

I have tried to fix the Problem, but I'm stuck. The problem is that the 
offset is negative.

If you like I can send a patch for a fdtdump python version.

Regards,
Benjamin Bimmmermann



 From 1530238b7070300899789e412bb38c7eec62b9c3 Mon Sep 17 00:00:00 2001
From: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>
Date: Mon, 5 Dec 2016 22:14:49 +0100
Subject: [PATCH] ADD | Add a part from the zcu102-arm-multi-arch.dts

---
  tests/test_tree1.dts | 6 ++++++
  1 file changed, 6 insertions(+)

diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
index 67ecfd0..2887951 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1.dts
@@ -8,6 +8,12 @@
      prop-int = <0xdeadbeef>;
      prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
      prop-str = "hello world";
+        #interrupt-cells = <0x1>;
+        remote-ports = <0x2 0x1>;
+        interrupt-controller;
+        num-gpios = <0x1>;
+        linux,phandle = <0x5b>;
+        phandle = <0x5b>;
      #address-cells = <1>;
      #size-cells = <0>;

-- 
2.5.0


--------------03ADD0E830C5257FCFBC1F88
Content-Type: text/x-patch;
 name="0001-ADD-Add-a-part-from-the-zcu102-arm-multi-arch.dts.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ADD-Add-a-part-from-the-zcu102-arm-multi-arch.dts.patch"

From 1530238b7070300899789e412bb38c7eec62b9c3 Mon Sep 17 00:00:00 2001
From: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>
Date: Mon, 5 Dec 2016 22:14:49 +0100
Subject: [PATCH] ADD | Add a part from the zcu102-arm-multi-arch.dts

---
 tests/test_tree1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
index 67ecfd0..2887951 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1.dts
@@ -8,6 +8,12 @@
 	prop-int = <0xdeadbeef>;
 	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
 	prop-str = "hello world";
+		#interrupt-cells = <0x1>;
+		remote-ports = <0x2 0x1>;
+		interrupt-controller;
+		num-gpios = <0x1>;
+		linux,phandle = <0x5b>;
+		phandle = <0x5b>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-- 
2.5.0


--------------03ADD0E830C5257FCFBC1F88--
