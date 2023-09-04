From: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2 2/2] dtc: ensure that command line options arrays length match
Date: Mon,  4 Sep 2023 07:31:04 -0700
Message-ID: <20230904143104.1941715-2-charles.perry@savoirfairelinux.com>
References: <20230904143104.1941715-1-charles.perry@savoirfairelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A6D1F9C28D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
        t=1693837884; bh=xF7j/bxWs3Ej5NevQptAJI6wrJCTFMsnzBU1SGQrfus=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=vbSlQgxlgFlXkzbCjODIsv9hft+dQ0Azl20HEfcy8EffBT+SS778lbAHgpfaspj0E
         C2lEf8rAwpUo84o3uuBQ2FPRV006pxeWJnDnXMdpNI266I5J4qnQ3q6/a9GW2m2DB3
         lCEOd/P3ER5DyuzenZ7wwI88Nj9XCC4N1yFAjrapucsPgi98mXWG1YcztMjGdL2rJV
         J6W9f0hirvpSvYDgQQ/IbqRq210DigZM9xf9X4N8ENlS/EpBj5jQTale1WkT5bDd7F
         P6fEqQ+MJaTRScePW3L39aAV//72OUaAWBuposOicRYLqGiQ+7E371PCFre58m5PWv
         0xVlgBU5YL9Eg==
In-Reply-To: <20230904143104.1941715-1-charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
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
index 0655c2e..1f38b97 100644
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

