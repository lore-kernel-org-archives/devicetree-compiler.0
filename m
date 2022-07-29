From: "=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?=" <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] manual.txt: Follow README.md and remove Jon
Date: Fri, 29 Jul 2022 14:10:19 +0100
Message-ID: <20220729131019.806164-1-ptosi@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:from:to:cc;
        bh=+KC3tqeBDpiHZn+fq4ZHm7jIkQ7vrLoeNI4DvaGNtpY=;
        b=RrzkQc0aV1at8mEfGyFDeO4XQttAqE69IWRWugyH+h9pmw3y9RtrcvF5PoBZj9gzja
         G8KDfEScUSEHXCEE09u40/oLm1VKNxLIFB6erbubyMofp2g82N7OJQZBNv67yxvsHHcU
         zSwQMDa5uNRYnEJ8vjPtbdkLfGF6Iuhu+w9ssv+3bpdEOUZCXs59FyrTwYLycs1QeM0N
         pvs9scU7L17v/KVIlg9L3TmhJtQPtdqWuQvTVxnppIjfBYUkg4HHZtGnUuaFVyfOwNCd
         AIMFV+hbpG4BLCBiysn17uUL7v3pzcsfcfzm9mvBDYowaHhE8KHZKBJXMbr76Qw/2UIL
         AD0A==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: =?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Following 0ee1d479b23a ("Remove Jon Loeliger from maintainers list"),
make the "Submitting Patches" section of the manual.txt consistent with
the README by requesting patches to only be sent to David.

Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 Documentation/manual.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index cf4b253..2087a4d 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -43,9 +43,8 @@ The gitweb interface for the upstream repository is:
=20
 1.1) Submitting Patches
=20
-Patches should be sent to the maintainers:
+Patches should be sent to the maintainer:
 	David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
-	Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 and CCed to <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>.
=20
 2) Description
--=20
2.37.1.455.g008518b4e5-goog

