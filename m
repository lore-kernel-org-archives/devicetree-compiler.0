Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67531AF0D6
	for <devicetree-compiler@vger.kernel.org>; Tue, 29 Apr 2025 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890975; cv=none; b=suLH7SQChdZ5BZ/elFM1Yc7aHuSVXP+9/hldWahw4nFHIQzpvYXH/21W7maxcAbhZV7Dfm2cbmgpDHP/jzBJhB/+hqPRYLH0tQ4CeHT8pVDZHl7zU8YWBU0mR6BN0XB/Hiv1U8P03dla812cDOdqLl5534P2j1OoW7Ks9gPQTy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890975; c=relaxed/simple;
	bh=IU/FtiPJieXEz8dCgx2DiHp09Kv0J3N/iNy2OVyJbi0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBMwxgrMyQbb21T+pTr084sCaBPVEmr77XE8shu5NKxfNBlmbqN9MKSkZf5f1d0D+uss7ND3r4lQx3WwoV8q4dVQhHFI4r51zB/0dvSHMSd+2wQqgCISKAAY9oCMZACthHjr1o4yS4sNyzhqACb0bMMUAAzK1+G/hbHiSzhs++c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ2Wb7+G; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ2Wb7+G"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47677b77725so70579951cf.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 28 Apr 2025 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745890972; x=1746495772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olOjd0yc0XW8vbqj2M+zutFnWg9AyQGYu92VRMKQyJo=;
        b=ZZ2Wb7+GQI1ldhQsZpTJpIqqyStLKpc89BO30NlyAvyWl/2jK7mOliitaTVni06RHj
         CPLZidCZCNOPEBnLHJt8Qr1UtO9045qVnbcsdCwjmHNNocaioyvbJ5N0ndkr3LEB3Ks4
         JDLa4tIhjw/M0kF+totSrOPXynQX7OAzk06BFhlpZiZuWqPuZrGDyr72UsRjU0C5dxXK
         VfXvxdX8waunpySmYlsGiM8ftMqs5J2Im5WeLTeRUygS9oFrNP1iZYKPv7dUh4czuHRg
         cXOHNT/iNCUE3AbneyozF87xtW92y293rcXIjniw6dq1nI5soJQsCVcI1/NmCLys70BW
         xkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745890972; x=1746495772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olOjd0yc0XW8vbqj2M+zutFnWg9AyQGYu92VRMKQyJo=;
        b=cAAly9XuJK3rPcRE41vRsK2pF2O/jpS3wtAcgwMoAreSO+H59LKwM4s5aHKyrJo9BH
         CLBhcfK9FRpL0zkAq3Zw+UWTUZrOCTWYW0vp8cRu+gA/ovqlOvpfCvP6b96oybgltFpm
         2FuA0ixjte2Lhk4JJ91GBGPTfvIFoIovqjTkEB2FRMt/+n0dXl9LCmOe4DYulRXEYtWz
         hPhaS30S6y9Ix8PFq89oIW9rya2rYkUDIiPj6h/0HRztbLop8wlETBm3fa9gU7CJuuvn
         T1lvqHPTqFVGTpoqpZRfpv2YU/50rPNB3ztoIiAHTUbsajFdAz4cosbtNV/4MXMGEXfj
         wTcg==
X-Gm-Message-State: AOJu0YzOgnSe5Z/Nff1ECNOCVhfcTlIzzOneq9E2LwznO8j+UjwScKOh
	uE18VG60zBdQUG0QfX6JmXajSJ48ts7OhtvmrFJwK84LcY5VMgWNK5zEQnzb
X-Gm-Gg: ASbGncuipiqIt24orCjs3BwZAxXV6nvESevXcvw0yJraVRIq2mxiz+q26eBjtB+ClNs
	n3SMTzY977kTnpy7JrBDCSgSrWFufyG2S2qto/+3esRRDbnvrX42jptvnyjSg+IqrBHr5JIqzna
	O4WwbSrQHSUMaOel6k/J00E0kYp0D+TGI4+FGuHkWS9TWCa3PFAJRZwtPCn5+gFB55a2khyLVVH
	OC5Z3Hd0keMUhbNpqHHxhQpisZqaReOkPL7neQSW6N+j2gQHHxOmoemOboHvgBVoOLXfPHYImMy
	5Pj8LCl4OV5aLrFNB6IH6UR13BIMk9ZIJTmFOQ==
X-Google-Smtp-Source: AGHT+IGvUNYyBpwwOmoXxOG7IH4cLM8LfV3QFycbM1fUUMCvkVDCkfKNNj+9Y1pbYv0BXx9BfAlFqQ==
X-Received: by 2002:ad4:5761:0:b0:6f4:c8dd:2608 with SMTP id 6a1803df08f44-6f4f0598983mr28340716d6.21.1745890972257;
        Mon, 28 Apr 2025 18:42:52 -0700 (PDT)
Received: from acleverhostname.lan ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a7419asm67034126d6.89.2025.04.28.18.42.51
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 18:42:51 -0700 (PDT)
From: Eli Schwartz <eschwartz93@gmail.com>
X-Google-Original-From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v2 0/2] port python bindings to native Meson
Date: Mon, 28 Apr 2025 21:41:41 -0400
Message-ID: <20250429014241.90681-1-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eli Schwartz (2):
  Makefile: deprecate in favor of Meson
  meson: port python bindings to build natively via meson and
    meson-python

 MANIFEST.in                | 12 -----
 Makefile                   | 55 +++------------------
 libfdt/meson.build         | 32 +++++++------
 meson.build                |  3 +-
 meson_options.txt          |  2 +
 pylibfdt/Makefile.pylibfdt | 30 ------------
 pylibfdt/meson.build       | 28 +++++++----
 pyproject.toml             | 33 +++++++++++++
 setup.py                   | 97 --------------------------------------
 9 files changed, 79 insertions(+), 213 deletions(-)
 delete mode 100644 MANIFEST.in
 delete mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pyproject.toml
 delete mode 100755 setup.py

Range-diff against v1:
-:  ------- > 1:  142d7e4 Makefile: deprecate in favor of Meson
1:  f23b5eb ! 2:  5d0590f meson: port python bindings to build natively via meson and meson-python
    @@ Commit message
         meson-python would otherwise include them in the wheel itself, in case
         they are needed, but this is essentially a bit useless so don't bother.
     
    +    The old setuptools-based build is now redundant and goes away.
    +
      ## MANIFEST.in (deleted) ##
     @@
     -# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
    @@ MANIFEST.in (deleted)
     -include libfdt/libfdt_env.h
     -include VERSION.txt
     
    - ## libfdt/meson.build ##
    -@@ libfdt/meson.build: else
    - endif
    + ## Makefile ##
    +@@ Makefile: BISON = bison
    + LEX = flex
    + SWIG = swig
    + PKG_CONFIG ?= pkg-config
    +-PYTHON ?= python3
    + 
    + INSTALL = install
    + INSTALL_PROGRAM = $(INSTALL)
    +@@ Makefile: INCLUDEDIR = $(PREFIX)/include
    + HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
    + 	    sed -e 's/\(cygwin\|msys\).*/\1/')
    + 
    +-NO_PYTHON ?= 0
    +-
    + NO_VALGRIND := $(shell $(PKG_CONFIG) --exists valgrind; echo $$?)
    + ifeq ($(NO_VALGRIND),1)
    + 	CPPFLAGS += -DNO_VALGRIND
    +@@ Makefile: SCRIPTS = dtdiff
    + 
    + all: $(BIN) libfdt
    + 
    +-# We need both Python and swig to build/install pylibfdt.
    +-# This builds the given make ${target} if those deps are found.
    +-check_python_deps = \
    +-	if $(PKG_CONFIG) --cflags $(PYTHON) >/dev/null 2>&1; then \
    +-		if which swig >/dev/null 2>&1; then \
    +-			can_build=yes; \
    +-		fi; \
    +-	fi; \
    +-	if [ "$${can_build}" = "yes" ]; then \
    +-		$(MAKE) $${target}; \
    +-	else \
    +-		echo "\#\# Skipping pylibfdt (install python dev and swig to build)"; \
    +-	fi ;
    +-
    +-.PHONY: maybe_pylibfdt
    +-maybe_pylibfdt: FORCE
    +-	target=pylibfdt; $(check_python_deps)
    +-
    +-ifeq ($(NO_PYTHON),0)
    +-all: maybe_pylibfdt
    +-endif
    +-
    +-
    + ifneq ($(DEPTARGETS),)
    + ifneq ($(MAKECMDGOALS),libfdt)
    + -include $(DTC_OBJS:%.o=%.d)
    +@@ Makefile: install-includes:
    + 
    + install: install-bin install-lib install-includes
    + 
    +-.PHONY: maybe_install_pylibfdt
    +-maybe_install_pylibfdt: FORCE
    +-	target=install_pylibfdt; $(check_python_deps)
    +-
    +-ifeq ($(NO_PYTHON),0)
    +-install: maybe_install_pylibfdt
    +-endif
    +-
    + $(VERSION_FILE): Makefile FORCE
    + 	$(call filechk,version)
    + 
    +@@ Makefile: dist:
    + 		gzip -9 > ../dtc-$(dtc_version).tar.gz
    + 
      
    - link_args += version_script
    --libfdt = both_libraries(
    -+libfdt = library(
    -   'fdt', sources,
    +-#
    +-# Rules for pylibfdt
    +-#
    +-PYLIBFDT_dir = pylibfdt
    +-
    +-include $(PYLIBFDT_dir)/Makefile.pylibfdt
    +-
    +-.PHONY: pylibfdt
    +-pylibfdt: $(PYLIBFDT_dir)/_libfdt.so
    +-
    + #
    + # Release signing and uploading
    + # This is for maintainer convenience, don't try this at home.
    +@@ Makefile: TESTS_BIN += fdtput
    + TESTS_BIN += fdtget
    + TESTS_BIN += fdtdump
    + TESTS_BIN += fdtoverlay
    +-ifeq ($(NO_PYTHON),0)
    +-TESTS_PYLIBFDT += maybe_pylibfdt
    +-endif
    + 
    + ifneq ($(MAKECMDGOALS),libfdt)
    + include tests/Makefile.tests
    +@@ Makefile: endif
    + STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
    + 	*.tab.[ch] *.lex.c *.output
    + 
    +-clean: libfdt_clean pylibfdt_clean tests_clean
    ++clean: libfdt_clean tests_clean
    + 	@$(VECHO) CLEAN
    + 	rm -f $(STD_CLEANFILES)
    + 	rm -f $(VERSION_FILE)
    +
    + ## libfdt/meson.build ##
    +@@ libfdt/meson.build: libfdt = library(
        version: meson.project_version(),
        link_args: link_args,
        link_depends: 'version.lds',
    @@ libfdt/meson.build: else
     +  install: get_option('default_library') != 'static' or not wheel_only,
      )
      
    - if static_build
    --  link_with = libfdt.get_static_lib()
    -+  link_with = libfdt
    - else
    --  link_with = libfdt.get_shared_lib()
    -+  link_with = libfdt
    - endif
    - 
      libfdt_inc = include_directories('.')
     @@ libfdt/meson.build: libfdt_dep = declare_dependency(
    -   link_with: link_with,
    +   link_with: libfdt,
      )
      
     -install_headers(
    @@ meson.build: util_dep = declare_dependency(
      
     
      ## meson_options.txt ##
    -@@ meson_options.txt: option('static-build', type: 'boolean', value: false,
    -        description: 'Build static binaries')
    +@@ meson_options.txt: option('python', type: 'feature', value: 'auto',
    +        description: 'Build pylibfdt Python library')
      option('tests', type: 'boolean', value: true,
             description: 'Build tests')
     +option('wheel-only', type: 'boolean', value: false,
     +       description: 'building from meson-python')
     
    + ## pylibfdt/Makefile.pylibfdt (deleted) ##
    +@@
    +-# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
    +-# Makefile.pylibfdt
    +-#
    +-
    +-PYLIBFDT_srcs = $(PYLIBFDT_dir)/libfdt.i
    +-PYMODULE = $(PYLIBFDT_dir)/_libfdt.so
    +-PYLIBFDT_CLEANFILES_L = libfdt_wrap.c libfdt.py *.pyc *.so
    +-PYLIBFDT_CLEANFILES = $(PYLIBFDT_CLEANFILES_L:%=$(PYLIBFDT_dir)/%)
    +-PYLIBFDT_CLEANDIRS_L = __pycache__ libfdt.egg-info
    +-PYLIBFDT_CLEANDIRS = build $(PYLIBFDT_CLEANDIRS_L:%=$(PYLIBFDT_dir)/%)
    +-
    +-SETUP = ./setup.py
    +-
    +-ifndef V
    +-SETUPFLAGS += --quiet
    +-endif
    +-
    +-$(PYMODULE): WARNINGS =  # suppress warnings from generated code
    +-$(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP)
    +-	@$(VECHO) PYMOD $@
    +-	CFLAGS="$(CFLAGS) -Wno-error" $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext
    +-
    +-install_pylibfdt: $(PYMODULE)
    +-	@$(VECHO) INSTALL-PYLIB
    +-	$(PYTHON) $(SETUP) $(SETUPFLAGS) install --prefix=$(PREFIX)
    +-
    +-pylibfdt_clean:
    +-	@$(VECHO) CLEAN "(pylibfdt)"
    +-	rm -f $(PYLIBFDT_CLEANFILES)
    +-	rm -rf $(PYLIBFDT_CLEANDIRS)
    +
      ## pylibfdt/meson.build ##
     @@
     -setup_py = find_program('../setup.py')
    @@ pyproject.toml (new)
     +[project.urls]
     +'homepage' = 'https://git.kernel.org/pub/scm/utils/dtc/dtc.git'
     +
    ++# These arguments are applied only when building a redistributable binary wheel
    ++# for uploading to PyPI. We don't want to install libraries (or headers /
    ++# pkgconfig files / executables) that clash with system C installs, so we
    ++# disable everything other than the python bindings themselves, and build the
    ++# python C-API extension using static linkage to avoid juggling "libdir" /
    ++# LD_LIBRARY_PATH / RPATH around. When building both the C library and the
    ++# python bindings for a distro, `meson setup` will still default to shared
    ++# libraries.
     +[tool.meson-python.args]
    -+'setup' = ['-Ddefault_library=static', '-Dwheel-only=true']
    ++setup = ['-Ddefault_library=static', '-Dwheel-only=true']
     
      ## setup.py (deleted) ##
     @@
-- 
2.49.0

