From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 0/2] Some build fixes
Date: Mon,  3 Jan 2022 11:38:53 +0400
Message-ID: <20220103073855.1468799-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641195544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2g9uQo30iSDfgWV2Bgk8M983yCyLxep3gmK4TR445vA=;
        b=Xyl5rZw+epWyY8fa5GC//WAeWjvTODZJTrsfl12YJmCFWvKEAXW8DGVi/aChHfEYyzHyx/
        AhhjK799v7b/7j2Hgksnl0GMA8quySTc7qJTvCfqU0bSNjFp7pqVzHBEXoEqHCuWnbH7pY
        Hx8wl6RQVLAMzaoPb4KENFElcY91fv8=
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=0D

Hi,=0D
=0D
Here are some build fixes patches for DTC.=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  Revert "libfdt: Add static lib to meson build"=0D
  setup.py: fix out of tree build=0D
=0D
 libfdt/meson.build | 5 -----=0D
 setup.py           | 2 +-=0D
 2 files changed, 1 insertion(+), 6 deletions(-)=0D
=0D
-- =0D
2.34.1.8.g35151cf07204=0D
=0D

