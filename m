From: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 2/2] dtc: ensure that command line options arrays length match
Date: Sun,  3 Sep 2023 19:00:58 -0700
Message-ID: <20230904020058.1935334-2-charles.perry@savoirfairelinux.com>
References: <20230904020058.1935334-1-charles.perry@savoirfairelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E5EFC9C103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
        t=1693792875; bh=PC7dbirHCYSPdTQwMphhLrOemd0an4uwlS5OoP5zQIg=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=ZuCPvRDmyQ+PtyfCjy8Lk/oKorGyj5mgcEFZTOhSAGrL+a3FoJAGIw2XAjKJTWRkO
         E2OBFgxOov/M/NwTIEH+vGAWgk4BARI+xswqBExJoDXKuZuPLCs7bdJwS4ge5Bd31+
         6FyQcPRBQ6NGh9NpDcOyD3paL1ii/EnNCKYpAE/+RU0N+Vl9JMP0rVaakT2Fpu7CBz
         Fuw+V1udRzPOUFarAVtNAIUG3Boi/T8PoLc6MSbW+5KJHrT9RFmG2CkHtWN1+jSMHP
         PdUeIofw2AXsuC78xMZczgmr/ZQp6Q79wuDcCpriV5GbTApbZj1swJkGSpDh4DQZcA
         i+3B93/diBsAA==
In-Reply-To: <20230904020058.1935334-1-charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

usage_long_opts and usage_opts_help should always have the same length.
Since these are fixed length arrays, this can be checked at compile time
with _Static_assert (requires C11).

Signed-off-by: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
---
 dtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dtc.c b/dtc.c
index 775d527..2768fc6 100644
--- a/dtc.c
+++ b/dtc.c
@@ -112,6 +112,8 @@ static const char * const usage_opts_help[] =3D {
 	"\n\tPrint version and exit",
 	NULL,
 };
+_Static_assert(ARRAY_SIZE(usage_long_opts) =3D=3D ARRAY_SIZE(usage_opts_=
help),
+		"usage_long_opts and usage_opts_help length differ");
=20
 static const char *guess_type_by_name(const char *fname, const char *fal=
lback)
 {
--=20
2.34.1

