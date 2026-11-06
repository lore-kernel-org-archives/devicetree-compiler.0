Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994831;
	b=SwCYc8jDNvxmyoUUqRTkIrLQFuzEu2AAkBdjsXHWFR0pZFa2HnKI5K2U+qej/e0p74iv
	 ayxpFGA/dZ7kysBmpvALykWR/FzcUyH9oNECGaMdls76O3or+IZycGjDMJrx0PZSRilmd
	 ObRK7fwlkcfTksN3lP5T5oCH7fU/fbDbk/wTGhF1R+GjZ1wW3Z879XCxeVPGTySGnATqI
	 unk5FVAsq5LvLjdh1dHlxqv1AqMw869ijiPJTDE5s8iSSipRlaapl4UK4IB+sMutyXvUi
	 Ebd1ZlMlUkRvS2Ngof3ad2RfuftoS+Xoc4fUV2xdOupVGzDnpusUyU1U4GKtUODHYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aT2JiwZkHJzqPSsGvTD3cW9JBzb5WN3lEL18X5FEBHk=;
	b=XfaJFkgxxcMZ1zMI5zgK7lCMqbGMYpbe60F965EB2hDCpTlTYogOdBwnk4l21000q/uB
	 AdZYm7reAD+oRW6k5STx9Vy57KHDBJb/vIjkjVeoH/qkGF4dfSBxBremjzngdAvodokQO
	 7ZqK6D10T2A9wOB9AsN9tV2uqJG2djmmFYqcrKEcGh4Gez9EcX6zVRhrum++9qXUT5b0Q
	 CPveARATLW2RSS0Ij1vNNcQxnn33TKGy5vpXZZlsYrhsvVh4FHI+71M2IA5H/4ba5Igs5
	 a5nHY4KAliS4y6Zr55rgwdGK0gT7f9Az3kOk25TOLOD93iWA3xffV2zaOMACcWj83IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i9SmlA5I;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18B2606A32D
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18B2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i9SmlA5I
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6deb848ddd7so701545eaf.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994830; x=1794599630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aT2JiwZkHJzqPSsGvTD3cW9JBzb5WN3lEL18X5FEBHk=;
        b=i9SmlA5IS34A2vwXkdtundM4W67r79469HdRD624+opchU0PUpyqlSIbOzcY7ACNc3
         TjlT/N4qYzLgsWmBBI98BtbWIL+wSaM9XPGa4FKWQWqMMaDJw4F2v+p7ryRzC9QppyYb
         JodE7x7NCwEvQKUgtBEQNYW4zCHF7H0BD51vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994830; x=1794599630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aT2JiwZkHJzqPSsGvTD3cW9JBzb5WN3lEL18X5FEBHk=;
        b=DUAaB6n2zcGUpo+vz7/Z2iDwXzNIbPswNxF3SQyf6veTJjf0es+YIXNlpgNBaQ/q+/
         hkl/r1hmU8I6qfSXQ0IGANfFhBmmzMiRniV7aL8T5CHLPcZ14HTq9KUdvg+dM/P6VYSP
         ELwuuNRXMRObjZGcraVDDLWMvjONR1AvZj/3ANaDuEgi2LcBJGMmpV/5Nm8XFYtfnlkZ
         jz9VwbwAMEMfL2KqK/kKzbWfVFoGJgkP5H1YXwmpOzZgE2x5mudrgq/gOT5n+Z7/X5Bt
         qVlds4DuARnZHW3FcYUd+t60TK6oX8YHc1z3t/v7k+uyWVJzkj7frWCvzbwJl9hr2T5w
         b5oQ==
X-Gm-Message-State: APuU4Z9GXHKZm2wnu4GCjk8dWWpJiePVN6fX8olmu6DBQhYFNdIjPULh
	XAcJI7xnJTf9OdU9xOHcw27vyqUEBb58ZgCZUUUreUVRybRScS4CCMJFZB4HjFM6gunZzWoLtPa
	bOB8gSw==
X-Gm-Gg: AYBFou0gnNRf8WukUkp09cCFV92PN8r/X/qera0dzsdkL+PpupV74sj+8aULwqwW7OV
	wp9GDlseq2IAQuR69vKtr+xBESKPTPZHXKzcDZpFUhjSyBQVHR67jyoXiG5P10WJOWbLTvrEFqQ
	55afh93YAKq98Cvos4Oilkrwbbon0RriPYy53Myu4xVhTkkzFndJbP4UQfLBqAEPWKmkO8TwwJB
	mnMepwM9kX69I1EkktoqKBFKXJgu5XkKZ4E6WUwtbLsV+BvLkuhDbHQdxLDON2IDL1UL+MeFoMh
	+ACp89SnHDDN6ZVASXJcRq+Bv1A6YZ6liUSUvulOIoO9KleLI09Shp+UUesUzIpf/hXWv0bkp1o
	/OaxCGA8YycM8l2vgKY0oTvgxzCGPIxRqd8hDodmRZoRGwfDcwHas68uLg+Lr0+fsOVlLlXRdIe
	PnvgU5f5YOnn1eEhnvuKlowKpCvsHsTfuQTFus+VCWjYb97NHIEqOSDKRif5Oo7D7etgSXUQVJa
	0LmtnPd+iei3JV68SaIkeqlCBIMUP42NcVKHWmpzRz5DQakottIdxX+oGsJzzwfR3C7aK8iOJ9K
	XTU1jzvKaafj1C31gbwDBqBIiZ47oNdgqXVRDT+201OasLijheopt20YfUBUXYxeNrApikIdslG
	Y6gvYI+KZMcKSyivLt3gC
X-Received: by 2002:a05:6820:1787:b0:6c4:5fed:753d with SMTP id 006d021491bc7-716e78ee1ddmr2232137eaf.45.1793994829667;
        Fri, 06 Nov 2026 11:53:49 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:48 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 17/18] tests: Check references to a generated overlay fragment
Date: Fri,  6 Nov 2026 12:51:44 -0700
Message-ID: <20261106195159.2623314-18-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106195159.2623314-1-sjg@chromium.org>
References: <20261106195159.2623314-1-sjg@chromium.org>
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

In a plugin, a fragment can refer to an overlay fragment (a fragment@N
node) which dtc generates for an earlier fragment, either by giving its
name in a / { ... } fragment or by giving a path through it to
/delete-node/. No test covers either of these.

Add a test for each, checking that the / { ... } fragment adds to the
generated fragment@N node and that the path finds the node in it.
Neither is really desirable, since dtc generates these names and a
plugin should not rely on them, but the tests show what changes when the
fragment@N nodes are added after the merge.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Add new patch to check references to a generated overlay fragment

 tests/merge-overlay-name.dts | 14 ++++++++++++++
 tests/merge-overlay-path.dts | 13 +++++++++++++
 tests/run_tests.sh           | 10 ++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 tests/merge-overlay-name.dts
 create mode 100644 tests/merge-overlay-path.dts

diff --git a/tests/merge-overlay-name.dts b/tests/merge-overlay-name.dts
new file mode 100644
index 0000000..be08268
--- /dev/null
+++ b/tests/merge-overlay-name.dts
@@ -0,0 +1,14 @@
+/dts-v1/;
+/plugin/;
+
+&basenode {
+	node {
+	};
+};
+
+/* Refers to the overlay fragment above by the name which dtc gives it */
+/ {
+	fragment@0 {
+		prop = <1>;
+	};
+};
diff --git a/tests/merge-overlay-path.dts b/tests/merge-overlay-path.dts
new file mode 100644
index 0000000..2f4c5fc
--- /dev/null
+++ b/tests/merge-overlay-path.dts
@@ -0,0 +1,13 @@
+/dts-v1/;
+/plugin/;
+
+&basenode {
+	node1 {
+	};
+
+	node2 {
+	};
+};
+
+/* Refers to a node in the overlay fragment above by its path */
+/delete-node/ &{/fragment@0/__overlay__/node1};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 8391717..92e4d2c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -847,6 +847,16 @@ dtc_tests () {
     run_fdtget_test "fragment@0\nnode\n__fixups__" merge-overlay-order.test.dtb -l /
     run_fdtget_test "bar" merge-overlay-order.test.dtb -l /fragment@0/__overlay__
 
+    # In a plugin, a / { ... } fragment can add to an overlay fragment by
+    # giving the name which dtc generates for it, and a node in an overlay
+    # fragment can be deleted by its path
+    run_dtc_test -I dts -O dtb -o merge-overlay-name.test.dtb \
+	"$SRCDIR/merge-overlay-name.dts"
+    run_fdtget_test 1 merge-overlay-name.test.dtb /fragment@0 prop
+    run_dtc_test -I dts -O dtb -o merge-overlay-path.test.dtb \
+	"$SRCDIR/merge-overlay-path.dts"
+    run_fdtget_test "node2" merge-overlay-path.test.dtb -l /fragment@0/__overlay__
+
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
     check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
-- 
2.43.0

