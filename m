From: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 1/2] dtc: fix missing string in usage_opts_help
Date: Sun,  3 Sep 2023 19:00:57 -0700
Message-ID: <20230904020058.1935334-1-charles.perry@savoirfairelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com C150A9C287D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
        t=1693792873; bh=tyY91S2oYWYsUBRedTDQp/1+j983fyUMRgtdSEeE8eI=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=gTQj77EiMkd0sGuARtasSrDN0GXsksR1ZgbG/F8OchKL7cqibrxaoVDj32dIszi5r
         vahgGZHtaEvIULjKqhVZMKR+6ufwxXH1jSUy2Ola1SP1RY1X500NSfprGxMdXbqjfV
         EJQNHdoMVW5TZAt0ednOcUagNNpgVgs/9pSUofF1jG5VuX2FZgAHqDUjLpfuL19Sur
         F9JRfAUHPEA7dgr0EC1bbJP60yEdO62cGjsbW/Q8jSAXnm/U7WoM4m3TxuCRr/1g+Z
         ZHn+N8cQYBri1j4OeES3OuKa//kqZt627WOgTkupojq4GIHhKpyNsc6NwLgeDDRoNQ
         84U+Jy4ud1ojA==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

This fixes the output of the `dtc --help` command as the last few
entries were offset by one.

Signed-off-by: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
---
 dtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dtc.c b/dtc.c
index d2e4e2b..775d527 100644
--- a/dtc.c
+++ b/dtc.c
@@ -107,6 +107,7 @@ static const char * const usage_opts_help[] =3D {
 	"\n\tEnable generation of symbols",
 	"\n\tEnable auto-alias of labels",
 	"\n\tAnnotate output .dts with input source file and line (-T -T for mo=
re details)",
+	"\n\tPossibly generates a __local_fixups__ and a __fixups__ node at the=
 root node",
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
 	NULL,
--=20
2.34.1

