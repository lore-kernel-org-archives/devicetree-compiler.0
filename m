From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: [PATCH 0/4] Add new helpers to pylibfdt
Date: Sat, 25 Dec 2021 14:25:54 +0100
Message-ID: <20211225132558.167123-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1640438779; bh=tqnW8FeGWQlr+Fe53xGSlXoIhGxlQe6/7blTuNrezWI=;
        h=From:To:Cc:Subject:Date;
        b=yF8CBK1oD+Hd3f0/MFcOBeclOxjRH1808FnJQtxuLL3TwwITS+sFwqQSyy5+Z69Fa
         NnF+8fS2PxKa+UTrLwdD3CZW23UZ+zJG2woFy45JhmvYDIFfMzXoUwYOH+Gysk1b8x
         E+EGwVc65b/JtN+KR6jIVkpXG7m2VwvhBMe+MCfc=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Allow decoding properties as stringlist and {u,}int{32,64} arrays,
wrap fdt_get_path from the C library and add a useful helper
getprop_or_none that returns None instead of throwing an exception when
a property isn't found.

Luca Weiss (4):
  pylibfdt: add Property.as_stringlist()
  pylibfdt: add Property.as_*int*_array()
  pylibfdt: add FdtRo.get_path()
  pylibfdt: add FdtRo.getprop_or_none()

 pylibfdt/libfdt.i       | 53 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 33 +++++++++++++++++++++++++
 tests/test_props.dts    |  4 ++++
 3 files changed, 90 insertions(+)

-- 
2.34.1

