Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810526;
	b=QtYNRBc/ehM9QlmYtQVANyKYW5e0sSMLcjz+JKDcE752mEbnua1X1d/B2oTnqZMyX4Cs
	 WvPceZrTeWQjX8IQfDAHCnk9YYo2iLCX/joO50EUMQLo7lxN/FD84CLV7b40tKxHERFC7
	 s/G3fRuKOT1n0AJlN9o512z1txG9+IfqL+ROz5DZQc8WdOC2xek7FUi07tqUOz2g1cmk5
	 8z0CHcZvIWv+5PpqV3MDeMotrTe9+gzEQgx0LX9gg0EafoZ5qKenz7e3JOWaPH6dJ//B9
	 1qLjV3+OKZU+VWoIod8iSqVHPAznxljmTxNWyrMqfjWrknvy06HMbSf2Waxdb97iaIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hqPgXYXuYxDtWEDIMyL/UJV/+583F0iN8uMzTg5tj4=;
	b=jtLb4TioV2TNBYW8xZPCKAYsV6XHsL7Ze9FvuBJFkv08IAZqrEoS+LXL3pvAibBdZnLA
	 tQE4plW9DuYFr8YwO9+YHZUTvYdXBmzlwXcYpsXEjhcAqqch6l4ZFHc1aNCoYUnaRdgdW
	 YyU7x+8Xd2wiW810lzSWPSCXP0HtcIzc/uPLX8iYGyq0R3unudzgj+mE+xxixrQtFUJWT
	 5gmpUVFHiGxm9xxOFcRbHnUNnDyGKIgHYZgdS7oNwUnbGds4oC7X/krTgrdSvICcLv//v
	 H2ERs5AWIwdB34XWYoqH6pvD0la0CT/3BvtxumwpZfjQM1hv1ppczeNY0LZq7gGNPQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YDcPiWFR;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E21606A323
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 20:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E21606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YDcPiWFR
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-57e49de1d8bso2368599b6e.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795810525; x=1796415325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hqPgXYXuYxDtWEDIMyL/UJV/+583F0iN8uMzTg5tj4=;
        b=YDcPiWFR1I/oyprWehv3cVNEe3X2rMjW1FV01JZ6eaJd9KBCrcjLYaYZtlX2apohtH
         qu2GD+wh7ppeXHfKikOTQ7thbVZFOSOCA/IQ06fqvBkKtoC5+yy9/mTBbpwTYG+b13y3
         JnJ07QxuiUGiz01burX9SrBFe1mrx/eQwp9VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810525; x=1796415325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hqPgXYXuYxDtWEDIMyL/UJV/+583F0iN8uMzTg5tj4=;
        b=TUVGSBB03KB3YfxEe/X4SRowTAr65LbVWV0Cf+KK00Wt4kIPnVXfSMs5Zr0hsnSw0F
         axKog0vHkrjshlCqFK9dl7O1A5B1WPTJmm6XEim2fMLQcYpMnGd1wRAb5hX/7P4Vef9N
         7+AOsNFqn6vLbPk6aI0Cfein/nAZgmqcCyF3ZUi5Y6vGcs0/Oxv05oQsUqaE2kDbQeH1
         FLI084lLpeh/w5OnfnqnnNPFJ6J140Ab6u2wSSTCXFpOyWNche1EU+pfrZnOAmX0v6eK
         MvKmx419QivglKoZ70uqGkdB2xjA1wrDHqA+jgAY+UIBZNlWUBw1XrkTi7tpX/HYspdn
         Fjug==
X-Gm-Message-State: APuU4Z9r4Sn9IqTXHBLgtKGzIZRcRaRmznsf3hfHKAgJoYDDCVDySWJ6
	j9NnmHnYl/oJnoWdgm8CWr6gnPgh5apo7U5BaIC6gEqAlOKeNBj2G+TjiJOIqvGvEFRdN8QlAEs
	dtS6DKA==
X-Gm-Gg: AZFdTZdPxBDap4C32XT1u1u5c/6t6dx6KiWqn2ann4SKUQvfmjB49pAzlP9HqMbGu9q
	tNHHamkzaNyuW35UES2Fv1q/J9VjjCAxZzTTpk2tGI+pOmqX26HYEaS5UNXjmL9GeDBI9UhWkAB
	WGMkTQyjdCE2D7Q3jh0UunKfLm51TL4Rk94b2nDx/7gZ/A2HJGNGSQLTrM0T3Qie0vJPz3M+zDi
	QxF+rKGsAlMKya0I545XdTQreJgwgTi2cOqvacFhuZY6wlQuZSBJIkoiktrD9p6NFpirzUEHdu+
	5EWGHyv8v6yEhwwbeCwhMcRKY8opPjmjmXOKiYqNfJj8ZdaCNhOu6imxd+EFFmqYt05ocW5XnDj
	FIcChRayv+tEjHtN8b52Nxbe12D0Gkt/cXuyBHtCI/WOK+YJkIIIchaXq0lcIvpLfo186u8lXbt
	nfckRMYJwC/cMdujsNiOQeECAIHpnBLnV2Sb4s/Vz4qGCw2phtjqTg3Myd/zx6F/1V7vTOIt6GE
	ku6LPPBYJgq4IG0hvydhhy7nkjsrTeUWgx8ZNJbmFi2SZ5jOsgVH1qF40BXpzOWLZWHOFcf6BBM
	abyivcUq9rvS+MMtUnpVfcrEaI+UcbF3xyPH6VC4+AZvnScvhiTC2S8nCzqDEHT7OQUAODpTpn9
	gAtszE7iOIOVxjogO2Vsh
X-Received: by 2002:a05:6808:4f6a:b0:572:75e6:1d0e with SMTP id 5614622812f47-57a06d1a870mr28963071b6e.5.1795810525289;
        Fri, 27 Nov 2026 12:15:25 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm18881561b6e.16.2026.11.27.12.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:23 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 4/6] libfdt: Drop the trailing / from a symbol for __overlay__
Date: Fri, 27 Nov 2026 13:14:47 -0700
Message-ID: <20261127201457.1837712-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127201457.1837712-1-sjg@chromium.org>
References: <20261127201457.1837712-1-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an overlay has a label on an __overlay__ node, its symbol is
/fragment@N/__overlay__ and overlay_symbol_update() turns this into the
path of the target with a / on the end, such as /foonode/ for the
stacked_overlay_addlabel.dts test. The symbol should be the path of the
target itself, /foonode in this case.

Only add the / and the relative path if there is a relative path, or the
target is the root node.

Check the symbol in the stacked_overlay_addlabel.dts test. Add
stacked_overlay_symbols.dts to check the symbols for a root target, with
and without a relative path, and for a phandle target.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v6:
- Add new patch to drop the trailing / from a symbol for __overlay__

 libfdt/fdt_overlay.c              | 12 ++++++++----
 tests/run_tests.sh                | 12 ++++++++++++
 tests/stacked_overlay_symbols.dts | 19 +++++++++++++++++++
 3 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 tests/stacked_overlay_symbols.dts

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index b7da3dd..dbec307 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -1119,7 +1119,8 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		}
 
 		ret = fdt_setprop_placeholder(fdt, root_sym, name,
-				len + (len > 1) + rel_path_len + 1, &p);
+				len + (len > 1 && rel_path_len) +
+				rel_path_len + 1, &p);
 		if (ret < 0)
 			return ret;
 
@@ -1143,9 +1144,12 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		} else
 			len--;
 
-		buf[len] = '/';
-		memcpy(buf + len + 1, rel_path, rel_path_len);
-		buf[len + 1 + rel_path_len] = '\0';
+		/* add the relative path, unless the symbol is the target */
+		if (!len || rel_path_len) {
+			buf[len] = '/';
+			memcpy(buf + len + 1, rel_path, rel_path_len);
+			buf[len + 1 + rel_path_len] = '\0';
+		}
 	}
 
 	return 0;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f1f8168..54f2efb 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1186,6 +1186,18 @@ fdtoverlay_tests() {
     run_dtc_test -@ -I dts -O dtb -o $stacked_addlabeldtb $stacked_addlabel
 
     run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb} ${stacked_bardtb} ${stacked_bazdtb}
+    run_fdtoverlay_test "/foonode" "/__symbols__" "foo" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb}
+
+    # test the symbols for a root target and a phandle target
+    stacked_symbols="$SRCDIR/stacked_overlay_symbols.dts"
+    stacked_symbolsdtb=stacked_overlay_symbols.test.dtb
+    stacked_symbols_targetdtb=stacked_overlay_target_symbols.fdtoverlay.test.dtb
+
+    run_dtc_test -@ -I dts -O dtb -o $stacked_symbolsdtb $stacked_symbols
+
+    run_fdtoverlay_test "/" "/__symbols__" "root" "-ts" ${stacked_basedtb} ${stacked_symbols_targetdtb} ${stacked_symbolsdtb}
+    run_fdtoverlay_test "/rootnode" "/__symbols__" "rootsub" "-ts" ${stacked_basedtb} ${stacked_symbols_targetdtb} ${stacked_symbolsdtb}
+    run_fdtoverlay_test "/foonode" "/__symbols__" "phfoo" "-ts" ${stacked_basedtb} ${stacked_symbols_targetdtb} ${stacked_symbolsdtb}
 
     # verify that phandles are not overwritten
     run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
diff --git a/tests/stacked_overlay_symbols.dts b/tests/stacked_overlay_symbols.dts
new file mode 100644
index 0000000..4c9ff22
--- /dev/null
+++ b/tests/stacked_overlay_symbols.dts
@@ -0,0 +1,19 @@
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/";
+		root: __overlay__ {
+			rootsub: rootnode {
+				rootnode-property;
+			};
+		};
+	};
+
+	fragment@1 {
+		target = <&foo>;
+		phfoo: __overlay__ {
+			overlay-property;
+		};
+	};
+};
-- 
2.43.0

