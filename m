From: =?UTF-8?Q?Ignacy_Kuchci=C5=84ski?= <ignacykuchcinski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] srcpos: increase MAX_SRCFILE_DEPTH
Date: Wed, 13 Jan 2021 00:13:23 +0100
Message-ID: <CAJq_QG0BHBQYT4RnVi0QSxM_vFK2K-5k1eTpJnwZQtWbKnCBJA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=2llupcvrLdJ89pizXR6Z750hD9qLatq9MXeJcAgHpYk=;
        b=kVClRLH85zhOgkWv3ApwIXjM70qZ62XnZvAcTwxQhcTYkptkLlETaAQUivChbSrgO4
         N2gBuAMHmFzM6BUxSeHFcxhQDLQ2NsbdYwQ42nnsKOSAz0WSiGyOre7wfURp7aNPPo3m
         hO1j2p5xN45p9IezY7YKUlbIHaZGiGbCbEAuIy9IbsDoY8ZyUaAFRE9U+yGIumU89gFD
         xix7mkR8qeC6EFpPtLUp/nTjATnWUQi9e/i6JAap7AQZ5CUTXt2hfp5gOEltY1ENFG0Y
         ZN1ZBF7of66328BdcSEztU6WwaY53OD6O5J5DqjJyK4SI8FbCxe1VAP0B8jz3+JGOAWh
         0PJw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Some kernels require the MAX_SRCFILE_DEPTH to be bigger than 100, and
since it's just a sanity check to detect infinite recursion it shouldn't
hurt increasing it to 200.

Signed-off-by: Ignacy Kuchci=C5=84ski <ignacykuchcinski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 srcpos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/srcpos.c b/srcpos.c
index f5205fb..4fdb22a 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -20,7 +20,7 @@ struct search_path {
 static struct search_path *search_path_head, **search_path_tail;

 /* Detect infinite include recursion. */
-#define MAX_SRCFILE_DEPTH     (100)
+#define MAX_SRCFILE_DEPTH     (200)
 static int srcfile_depth; /* =3D 0 */

 static char *get_dirname(const char *path)
--=20
2.30.0
