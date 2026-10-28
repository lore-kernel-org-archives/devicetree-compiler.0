Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172903;
	b=yshRAe37sRU3yK9WuUZp2o/zLoKscOGOGWy54TF4UU47mR5nxmOgULIZYOPx4spvaFbk
	 2Lusv6+M6X0wYkeW/JCxTxZh+GD+P+6zdF33nJqchtxIm7ynYY20lQoXtczcqacni1Iz1
	 5gJv9sBuFvwfVRqdrnlWlsp32oX1ykScyLu3PFduDA5zNwYVu8xVhShr102c27lRxigrG
	 FoD9rHgYNBSraah6Zvo0DY+NlZAln/x4E4EzVmkH4iWk1R3VqE2iCm6i/QSe7W+Cq6k6+
	 nT7mePwCX/ue2rRuPqDWPcEDbswJTITCCjpIRHBmDB0V/hoMFJ3VXibJUTXwhpCosEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PDptzL5/Hb4BgmTM73lTC//59OHQ+lWFMl4x3MwQR/M=;
	b=oMPfXoG885T4KALVyD6JnbNpflTodtyJZHScnS5cbpa0jS6gzg+JBgEcumX8a+OejIG/
	 goj80Fv7ehfXq0WranRtphC85BMs1cX5gCV/zGN/O2DoE2pSecyhTKn+Hlzum4jJI6NQx
	 4fp2pWI+4++J28UMXvDaeqI+qcRJm2JFaipLIkfM8U/MnwWC9ID6Fnqcht02YGZozYjaV
	 NWZS+L+TeCTNDWK5ZdiEUFcXC2gWCv7QoC/vRVg8j9lhdHuOcXHlEequ705RJt4F/2MNj
	 KyxvRNuBRmsEH4pM2/d39dFz64nPksdyZ4iGPW2iGAu7jzq6mBEgViEZFKfg58mlZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XNGIcVDY;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09098606A324
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 07:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09098606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XNGIcVDY
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-846566246e8so596330a34.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793172902; x=1793777702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDptzL5/Hb4BgmTM73lTC//59OHQ+lWFMl4x3MwQR/M=;
        b=XNGIcVDYTd5tLSRX+LMHpxyv+ApTivQILqnQAixz7LrgWDN4JM36VUvJ5bC1i3uyEO
         hbKub6SVS5FVZl7Dp9V8sYxB8Ioww0HFt3IxeHQvPMhuNQMdt9A3Y76pZ28NEjy+bbzk
         RX+RXdIQRyGk7ZNHS0/NEfiGiBMTlTmKNT4Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172902; x=1793777702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDptzL5/Hb4BgmTM73lTC//59OHQ+lWFMl4x3MwQR/M=;
        b=qsBLtNwAuEMUzyP7pbByyaJjy890WOK7uf29HnOcBx6FbBWFAkIO9OhqNEzuMfbhkP
         arnjG4PeQVUvhh9NWvmvvs5vBrIRUyurwywcSE70GRM/cIJvh9zAxZzETNjraqX6hJ69
         5C1/0HpeGTNWERAR8aEuQK9ODmj0pCio5TsPzmc4/pIV+ujxoUUrHhXWGK5uGgtGwGuO
         ucLQuhTTGda6++A5bpI9AJAoGM1njwfZS+B2J6BLkui3l1V+6CE1jF3kdK+HL8kieoWc
         vJZYwxOmtWqZTHpT5u8H1Epz7YQLtOXtfg5VPbeaGHXXMWHf0+X1uA7yIQr29j2RrDbY
         FUPA==
X-Gm-Message-State: AFq9FYLbZNwKhTCw8FYuVj1Z/VaI2JuuLm6IC5P8rZ9Gn0Nj5/S0/2Aq
	kQzglbxhjrYrdlCHS1011SLuxh3MhrpUJepa4JjVX6ecXH/NHDQLlsIvft8LBFcl0bVNzDGlf8Y
	OeFHOnw==
X-Gm-Gg: AYBFou1bJA3AwqyXXb+FAiJ1l+J4jAOAPFe0u4vghZ8HnYICgyjTQXHtUKElmqany4G
	FoLrUrnaAnU44ldtxfSRQpZa6R6yRBckHK8GUzTpgNauKxAUv9pq3/gqV0Cl/wi4xDeELg151z8
	QeAmnrskBcz9z1tydxZ7mCVZ2/TNDhGFOgxB0MOxSnkAXrNnpchGaDse6GorkhbaPQHAg5KtPf3
	Ma5IdK3m4EdMUX6N2ebLFK4B+Fa6cJBCJytkOG2OqkyXI5BwaUZ/sv+TfXHj6ldsPEVE9YOovWO
	wwB03bhStnIH+Lkr5YuOpUrqdYC7+9u0pgZ8hvcOh8ey7kzUpu7PSJK5rzyysf2y7bI+NUF6KDJ
	NTLOhW03GRUqkRCrTUMk908xuzhqrisbp8GQgosy3wPP/D+Tlwth5nOWuLWJn95ZlnGTh2HAcaP
	HRuJhmrrkR12k77KAuKw7dqA5NQKycZntXKgyzolX+42x8OKDr5aszznI4XnWgiy9s1uWF0lxQe
	IiBafYmK40dBrMQc/r2bvHxjO4bb02Oc/5GLS0p+rphn0Brhz0ro4EvuJrTGXWSclJ3mDU1c7GW
	1iMbV0dImSZgbLQQv2Z8r6JxCKdBnUp/65Z4mWGFsROoM4iUVkATt5oIv+r9LA==
X-Received: by 2002:a05:6830:6412:b0:817:c566:93a9 with SMTP id 46e09a7af769-85942995e90mr3114030a34.22.1793172901932;
        Wed, 28 Oct 2026 00:35:01 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b20219dc4sm928838a34.22.2026.10.28.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:35:01 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 3/4] fdtput: Suggest -p when a node is missing
Date: Wed, 28 Oct 2026 01:34:19 -0600
Message-ID: <20261028073440.3327687-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028073440.3327687-1-sjg@chromium.org>
References: <20261028073440.3327687-1-sjg@chromium.org>
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

When the node being written to does not exist, fdtput just prints
FDT_ERR_NOTFOUND - nothing points to -p, which creates missing nodes, so
it is easy to conclude that fdtput cannot add nodes at all.

When creating a node with -c, the error also names the full path, even
though it is the parent which is missing.

Add a hint to use -p when a node is missing, both when writing a
property and when creating a node. Report the parent path when it is
the parent which is missing.

Add tests that writing a property or creating a node fails when a parent
node is missing and -p is not given, and that the error suggests -p.
Add a run_wrap_error_msg_test() helper for this, which checks the
output as well as the return code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Check that the error suggests -p, using a new helper
- Drop David's Reviewed-by, since the tests have changed

 fdtput.c           | 20 ++++++++++++++++++--
 tests/run_tests.sh | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index 3c6cc98..b8d5081 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -47,6 +47,22 @@ static void report_error(const char *name, int namelen, int err)
 		fdt_strerror(err));
 }
 
+/**
+ * Report an error looking up a node which must exist before writing to it.
+ *
+ * If the node is missing, suggest -p, since it creates missing nodes.
+ *
+ * @param name		Node name to report error on
+ * @param namelen	Length of node name, or -1 to use entire string
+ * @param err		Error number to report (-FDT_ERR_...)
+ */
+static void report_node_error(const char *name, int namelen, int err)
+{
+	report_error(name, namelen, err);
+	if (err == -FDT_ERR_NOTFOUND)
+		fprintf(stderr, "Use -p to create missing nodes\n");
+}
+
 /**
  * Encode a series of arguments in a property value.
  *
@@ -182,7 +198,7 @@ static int store_key_value(char **blob, const char *node_name,
 
 	node = fdt_path_offset(*blob, node_name);
 	if (node < 0) {
-		report_error(node_name, -1, node);
+		report_node_error(node_name, -1, node);
 		return -1;
 	}
 
@@ -284,7 +300,7 @@ static int create_node(char **blob, const char *node_name)
 		node = fdt_path_offset(*blob, path);
 		free(path);
 		if (node < 0) {
-			report_error(node_name, -1, node);
+			report_node_error(node_name, p - node_name, node);
 			return -1;
 		}
 	}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index b3d3f3a..cf978ee 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -181,6 +181,37 @@ run_wrap_error_test () {
     base_run_test wrap_error "$@"
 }
 
+# Run a command, checking that it fails and that its output has $1 in it
+wrap_error_msg () {
+    (
+	msg="$1"
+	shift
+	log=tmp.log.$$
+	trap "rm -f $log" 0
+	verbose_run_log "$log" "$@"
+	ret="$?"
+	FAIL_IF_SIGNAL $ret
+	if [ "$ret" -eq 0 ]; then
+	    FAIL "Expected non-zero return code"
+	fi
+	if ! grep -qF -- "$msg" "$log"; then
+	    FAIL "Expected message '$msg'"
+	fi
+	PASS
+    )
+}
+
+# Check that a command fails and prints a message
+# $1: message to look for in the output
+# $2...: command to run
+run_wrap_error_msg_test () {
+    msg="$1"
+    shift
+    shorten_echo "$@"
+    printf " {!= 0, \"%s\"}:	" "$msg"
+    base_run_test wrap_error_msg "$msg" "$@"
+}
+
 # $1: dtb file
 # $2: align base
 check_align () {
@@ -962,6 +993,12 @@ fdtput_tests () {
     run_wrap_error_test $DTPUT $dtb -c /chosen
     run_wrap_error_test $DTPUT $dtb -c /chosen/son
 
+    # Writing below a missing node fails without -p, suggesting -p
+    run_wrap_error_msg_test "Use -p to create missing nodes" \
+	$DTPUT $dtb -c /blackadder/the-second
+    run_wrap_error_msg_test "Use -p to create missing nodes" \
+	$DTPUT $dtb /blackadder/the-second cost -ts high
+
     # Automatic node creation
     run_wrap_test $DTPUT $dtb -cp /blackadder/the-second/turnip \
 	/blackadder/the-second/potato
-- 
2.43.0

