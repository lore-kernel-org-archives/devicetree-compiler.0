From: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2 1/2] dtc: fix missing string in usage_opts_help
Date: Mon,  4 Sep 2023 07:31:03 -0700
Message-ID: <20230904143104.1941715-1-charles.perry@savoirfairelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com EA50F9C28D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
        t=1693837883; bh=J/O6uY6AnxXzxcKdLCy3tW4k/NBM7kRuA5Ni0chFY20=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=qHm8okqTm1/Cqj2aWwzBBLnnNo2kZAU3EOe+gR9pA8ZAPXzSHQ2TrFAP5d6FEh/k3
         gMWiMbPxOslNhgzblxK4fcPVxyL+BecPuGe1vJJQZKNLqMHZtx1Q+SsyGEABV3LYPF
         0hINqqJdFLCcq7ZHdz9OuGbFxpB10++QpcGaLGONTmVLQCytFNMf9hx5CaaZTRvl/X
         bxsF4soAcUhKVXYjEALrhg5YdZtTM//2W0pRXeJBwhZtBvtlkF3XGymIyd+QZXXQiY
         kl8/JLe+rr6GSO343RygkxfbzEfUrAI1F0f0jWev3bCcRNiO6kbEDXkd2gQn7wHQnR
         MHZinITIqpqyw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

This fixes the output of the `dtc --help` command as the last few
entries were offset by one.

Signed-off-by: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
---
Put the string at the right place in usage_opts_help

 dtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dtc.c b/dtc.c
index d2e4e2b..0655c2e 100644
--- a/dtc.c
+++ b/dtc.c
@@ -105,6 +105,7 @@ static const char * const usage_opts_help[] =3D {
 	"\n\tEnable/disable warnings (prefix with \"no-\")",
 	"\n\tEnable/disable errors (prefix with \"no-\")",
 	"\n\tEnable generation of symbols",
+	"\n\tPossibly generates a __local_fixups__ and a __fixups__ node at the=
 root node",
 	"\n\tEnable auto-alias of labels",
 	"\n\tAnnotate output .dts with input source file and line (-T -T for mo=
re details)",
 	"\n\tPrint this help and exit",
--=20
2.34.1

