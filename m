Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC304A3F23
	for <devicetree-compiler@vger.kernel.org>; Tue,  8 Sep 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862062; cv=pass; b=MCK7AvZfmRjuy1+ltCLIhyqtTdGgsJTm63Hmp7s+AN82/vi+9EwXmwXt5AkVcRt5iBlA9mT3uf4HktCk12dWAKGReBlz6a316wQr/anOsSVTM01BBRB4TJKQLqCbl6abqxMmUE2jKONAoP24BKA00vgR6jG/c+zZjCBYI3lWLZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862062; c=relaxed/simple;
	bh=SLvhsUzugRp+iAJqMPuUTXHw7duag8H/4DlvfCnroEE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ceM1ja0Menjc4VVtizXRiSby6TANG1Guh9e7Ueh+4qgOFq0pCsdxvgz9yOq7pHRIspIPTX5y9CWj4rNhEcW2rkjti2JDdPPcIBKqgzwupnaFdWyyOBiRU51A2kVZO/1imqhvhkwm+NCbpanUZ6dyo1ymCBJ1/VLh/3XL3iZ8fRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQJG/Gk8; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQJG/Gk8"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97e986f1996so1036600241.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 08 Sep 2026 03:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788862060; cv=none;
        d=google.com; s=arc-20260327;
        b=RqufxfkObODlcwtj8bchESRCawiz8ZRAbw8vuNEbz9Q7/Fljzlfy8t1fKx5RY/ANjm
         dQ/eLiCe/FH/I/TzxYYz94UD7voxq9o1bKVpBViBDRT7assH0FuIL1mj2ACcOF2SmMDu
         trzC6E0tqb6kf2VRwJaM1mmlzvSLrK2Tv9wD5LRb3iZhygX1jhqnudf74hQQ66Rd2qfI
         xHKNC++7emaGag+CDBhSfl6WsL2x/oEk8qwkKXGRGm9rbOhC8Pr1DGoxKeMjsFVUKQsx
         ZQbZT7EWGWjl0hSvtzpv7PH/qi2XYj3YY9/xUwWC/vOTUqsCuAAXBiPShQlqr+GGLhU0
         AAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=F0E55hvijxbt9Pdw41uqaywbeW7AbfFqUnroXDdC/8k=;
        fh=NCf82c+K6aTBapNEZoNZ+hRXTB/7HaQQVXK3T727Wh0=;
        b=JvBhMVhs0ahQEwiE9xdWyegmQ9Pb2YKIUD7g5iVuIYeX/uL5R57QsfGknyUEoVSqpZ
         KRM0gV+OVebS1rUK/WLuWgbeJVtU+BjpmXZYYvvYK3oSUJzaJ0DR3K5sdRV3KXamjXkM
         b5PYzVoozVgSV0SEkQq2SZASGguPpqBeKfQ8+86hV+KCcOl5QntmVT7iZKjCcYK9wxfy
         m+CTYAW4hOOs3wzjS269UgD9YO5n9JLWSC+v0lUZOPDG2EYUtT+4bMG2aWjn+hNYimkr
         6rmQT57gmfYhWUBKhAFjM/eGPmR6NJkCQBXGL4v4VDRKqVgO3++vubt9wYmGTPyF/azf
         Wujg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788862060; x=1789466860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0E55hvijxbt9Pdw41uqaywbeW7AbfFqUnroXDdC/8k=;
        b=hQJG/Gk8iuay3cpqGsN6X5dK8XqW1M/qrQN4RML1yBTbU2RZxu0hhwupLuZrcgL1D3
         R2WCoFrbq8PEV8AhiNmcU1ZD31wylNvYgITwSlIDrOETEsYjIl/v5KJkooNZaWyOy4bf
         CdvRKiYHa7ZiuFVeSxfHcnuYvjBkhkEnu6cnZIxEbVvlH/OliKFTgy6QO0T5TJx1S2B1
         W1um+n8xTxMbD9vHOrf3Au8P+71RDs5+e8hp5f27nFvr4fv6Os5/+jWE3GQ0UA1ceDww
         3lWv4S2B9mTjY/egJVq3/Uv3qDhDt2jm+9RWx9pgIxD/kXTgg5F0SBjNYaVFSS5p3mJ9
         QEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862060; x=1789466860;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0E55hvijxbt9Pdw41uqaywbeW7AbfFqUnroXDdC/8k=;
        b=gYFd39lq25eTajiVSjFs0c0Zald5hOBwkwHV490riHxp5F5O1Qyn5lKtfHE4nOuzlb
         m27LN/i5QM9Co6+Bz6hSx0PBEqJk21VxIbbKtO6rIhdXerUCKMWBPGxieKCC+bDDich+
         i59B8B6QYGBflllyoIkRuJCrBgfVpOAVFxvKHIExaaBMrScLpk9BugqdK9e7Dq7ohdYQ
         GKQaUGfAjef9pJh9WCA56s5LzGVMr/KRTgnl9E1cpKQmlAxyS7OHoZfuw6klfddV4hPC
         a81k/cxOjRlAqh9eXEO4HfczhqVLJ8UL+kttDgV3KN2uNl8dzSa7ERz/HejpGsbj8DaC
         dg+g==
X-Gm-Message-State: AFuF++nDnLwC9Jhw6hRp6yX13zQL8OyhipBT2UdF0e0tj4hNkZoY5VDb
	kj/lxCqWlu4l9K4bReTipIKZax+WOaVF0NA9gEmWyqDaiC+vx39WQz4tMnzAXsbOUjMOP1D/isk
	/TDDT5GC7XGcW12BXBDMngczLf6HXX9x+oWPw
X-Gm-Gg: AYBFou1hErwHC+82ZIuJz18EP/TB4Ty6tc7p28EWrDaF6+TH5BoHnd7g9ovWLXDrDfh
	FloEUg0Pz3mBJdaEueqUM+/TTzmHL0fCmwbWuvVSXgTpRubCSSlAnjfz5+U8aBAk29ogVJpejW1
	00R7NugJMbSXVnpzAi9znDtkwnHiYL00EwgL4564CmFv5Pb6F6YCBlhrXw0WDKsE2GwPhSN85jt
	TGQxhJLMlpdg5uVxGgsEhcnxmsH66nUN9I95I//GBppzZ74Yj3LK1y38FRWv35enQZ8vSzEnIZu
	LDDi+DNSCCRlcVwBCl0SWWnHWL5eekPpo8nIxFJQ9yeXzLSMqNh++0J43Y/G/HS16xAzqAxyj0U
	=
X-Received: by 2002:a05:6102:5091:b0:786:7a59:a313 with SMTP id
 ada2fe7eead31-78a4aa368femr8085938137.13.1788862060150; Tue, 08 Sep 2026
 03:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= <hector.oron@gmail.com>
Date: Tue, 8 Sep 2026 12:07:27 +0200
X-Gm-Features: AcwNN1XwJryfNcWNvq0poWn8tqj4FEFfgHCLGT4Hg108RrnIbP1aaS93mR8lLoA
Message-ID: <CAODfWeHQcjGn0CtweT4Q9Em6WC9cTmvfxhuQCgae4gdu5W9hSA@mail.gmail.com>
Subject: [PATCH] libfdt: pass sources as keyword argument to library()
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Meson expects the source list for library() to be passed either as
positional arguments after the target name or via the 'sources:'
keyword. Using the implicit positional form can lead to malformed
linker commands on some toolchains, with spurious arguments such as
'libfdt' and '.' being treated as input files.

Explicitly pass the source list via 'sources: sources' and declare
the ABI version with 'soversion: '1'' to match the installed
libfdt.so.1 soname.

This fixes build failures where the linker reported:
  cannot find libfdt: file format not recognized
  cannot find .: file format not recognized

Signed-off-by: H=C3=A9ctor Or=C3=B3n Mart=C3=ADnez <hector.oron@gmail.com>

---
 libfdt/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libfdt/meson.build b/libfdt/meson.build
index 68d4c1d..6c41f9f 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -27,8 +27,10 @@ endif

 link_args +=3D version_script
 libfdt =3D library(
-  'fdt', sources,
+  'fdt',
+  sources: sources,
   version: meson.project_version(),
+  soversion: '1',
   link_args: link_args,
   link_depends: 'version.lds',
   install: get_option('default_library') !=3D 'static' or not wheel_only,
--=20
2.55.0
