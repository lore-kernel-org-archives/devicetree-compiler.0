Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692205;
	b=d6dMqc5lNmoAK4EY8Bvxn927dJHhYIeXSS0sM56fXfh22Vu+Z/FVoxPt8vPlTR/N3JEi
	 OgNVGIlL1Njrxq+wdrkkMRXCncIzREQj5t8ADEw+XfLIqOBUZuMnaJNizaWweNObBD1sp
	 zy5XdhOffU1X+XMLOGxv1gtl/96RyGB+z32/RC569mg2XQv6JQKDJPueeNP7v5xQVwzlC
	 iSyIAKgyf5/vSXG/iB1jgSCS7ZdqW25VgafOuL2Nsj5RpsMBKAExJm85X9F5ldjm3owa8
	 9k/+DXURzuCZ/Wzn9lT8XjIGuktALFFCh4XGhmjuslquvNWPXmM/tyTMeL+R1+IumkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692205;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=rdnU/cJrXgRDHjsQA0OdxtjatwK73gCJQhkPIi05jjY=;
	b=3JT8gh1BUwo6pmbMpXEAK8sARoE/W3cH2Lw8fPxlTSV0Cy+6yA2ASE16hZqCNzgn+Gya
	 MgTtkd6Ff65MuauasDR6NHjr9W4/ZY9hYhbNXFkoMniLXDRl5szbogOxdcpcRInBVne+T
	 yiC9L2bhQXujY4KoDUNH7Fi8LH4W1mi2k6Kwldmro7VecTkHDpQgcJE+IuOOSQUeaIqoa
	 Zzaw2JdAPlYYc9yeuwIB81Ji6bKRQx+TFB+xK+yfRLvQIhZZrpT6Jr1QP9rhn6xXUIW3M
	 NVA44b38pRL0HShA/V2pGdOnOf0WSjw+32AVk6fLAz8YziL6WW1m70+oJVjzqhW+iVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VnhujKMu;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDA606A6B7;
	Thu, 26 Nov 2026 11:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CDA606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VnhujKMu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9CC5C2B9C9;
	Thu, 26 Nov 2026 11:23:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 833D360237;
	Thu, 26 Nov 2026 11:23:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD1D511E6B324;
	Thu, 26 Nov 2026 12:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692201; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rdnU/cJrXgRDHjsQA0OdxtjatwK73gCJQhkPIi05jjY=;
	b=VnhujKMu0Dpf8kDJwKiIoTuFo8z0xKmkFLWTPmIv+GhE7/67XVPOpychiB3dRpFQOCTt0i
	boiTDLp487NCOWo+UGNBtSMdHEzKSvQvyA61Zgf/wF5r5Lmd2uvgyO+ZOZgDjkpZ2Flnf9
	ojouOH1XMxkuYPJYvepzA0VoB9GXWt+MLplHjx0u8pZeisFc8bxAA20rcOzPTkvl/0Tt47
	VDFnfN5Apku9kbQmBmAQ2M7GAuXjVa6zvAXCRjuKLaAKca3TA3KC/qhacbNd80piMfddFT
	XxA9eqzlpf77vgXwCRFg3/F+iBt9i5FglIEia+alJcj7jivNP3U1HoMUNBrN+A==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v4 03/22] tests: Don't assume the root node is available at offset 0
Date: Thu, 26 Nov 2026 12:22:20 +0100
Message-ID: <20261126112239.636284-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Several tests use offset 0 as the offset of the root node. Either to
check the offset returned by tested functions or to directly manipulate
the root node retrieved using fdt_offset_ptr(fdt, 0, ...).

The root node is not always at offset 0. Indeed, an FDT_NOP tag can be
present at offset 0. fdt_root_offset() returns the offset of the root
node taking care of possible FDT_NOP tags.

Use fdt_root_offset() to get the offset of the root node and use this
value whenever the offset of the root node is expected.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/node_offset_by_compatible.c |  4 +++-
 tests/node_offset_by_prop_value.c | 11 +++++++----
 tests/path_offset.c               | 13 +++++++++----
 tests/root_node.c                 |  9 +++++----
 4 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/tests/node_offset_by_compatible.c b/tests/node_offset_by_compatible.c
index a9e67835..1278a562 100644
--- a/tests/node_offset_by_compatible.c
+++ b/tests/node_offset_by_compatible.c
@@ -39,12 +39,14 @@ static void check_search(void *fdt, const char *compat, ...)
 int main(int argc, char *argv[])
 {
 	void *fdt;
+	int root_offset;
 	int subnode1_offset, subnode2_offset;
 	int subsubnode1_offset, subsubnode2_offset;
 
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
 
+	root_offset = fdt_root_offset(fdt);
 	subnode1_offset = fdt_path_offset(fdt, "/subnode@1");
 	subnode2_offset = fdt_path_offset(fdt, "/subnode@2");
 	subsubnode1_offset = fdt_path_offset(fdt, "/subnode@1/subsubnode");
@@ -54,7 +56,7 @@ int main(int argc, char *argv[])
 	    || (subsubnode1_offset < 0) || (subsubnode2_offset < 0))
 		FAIL("Can't find required nodes");
 
-	check_search(fdt, "test_tree1", 0, -FDT_ERR_NOTFOUND);
+	check_search(fdt, "test_tree1", root_offset, -FDT_ERR_NOTFOUND);
 	check_search(fdt, "subnode1", subnode1_offset, -FDT_ERR_NOTFOUND);
 	check_search(fdt, "subsubnode1", subsubnode1_offset, -FDT_ERR_NOTFOUND);
 	check_search(fdt, "subsubnode2", subsubnode2_offset, -FDT_ERR_NOTFOUND);
diff --git a/tests/node_offset_by_prop_value.c b/tests/node_offset_by_prop_value.c
index 48ab1d93..329409b9 100644
--- a/tests/node_offset_by_prop_value.c
+++ b/tests/node_offset_by_prop_value.c
@@ -64,12 +64,14 @@ static void check_search_str(void *fdt, const char *propname,
 int main(int argc, char *argv[])
 {
 	void *fdt;
+	int root_offset;
 	int subnode1_offset, subnode2_offset;
 	int subsubnode1_offset, subsubnode2_offset;
 
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
 
+	root_offset = fdt_root_offset(fdt);
 	subnode1_offset = fdt_path_offset(fdt, "/subnode@1");
 	subnode2_offset = fdt_path_offset(fdt, "/subnode@2");
 	subsubnode1_offset = fdt_path_offset(fdt, "/subnode@1/subsubnode");
@@ -79,19 +81,20 @@ int main(int argc, char *argv[])
 	    || (subsubnode1_offset < 0) || (subsubnode2_offset < 0))
 		FAIL("Can't find required nodes");
 
-	check_search_cell(fdt, "prop-int", TEST_VALUE_1, 0, subnode1_offset,
-			  subsubnode1_offset, -FDT_ERR_NOTFOUND);
+	check_search_cell(fdt, "prop-int", TEST_VALUE_1, root_offset,
+			  subnode1_offset, subsubnode1_offset, -FDT_ERR_NOTFOUND);
 
 	check_search_cell(fdt, "prop-int", TEST_VALUE_2, subnode2_offset,
 			  subsubnode2_offset, -FDT_ERR_NOTFOUND);
 
-	check_search_str(fdt, "prop-str", TEST_STRING_1, 0, -FDT_ERR_NOTFOUND);
+	check_search_str(fdt, "prop-str", TEST_STRING_1, root_offset,
+			  -FDT_ERR_NOTFOUND);
 
 	check_search_str(fdt, "prop-str", "no such string", -FDT_ERR_NOTFOUND);
 
 	check_search_cell(fdt, "prop-int", TEST_VALUE_1+1, -FDT_ERR_NOTFOUND);
 
-	check_search(fdt, "no-such-prop", NULL, 0, -FDT_ERR_NOTFOUND);
+	check_search(fdt, "no-such-prop", NULL, root_offset, -FDT_ERR_NOTFOUND);
 
 	PASS();
 }
diff --git a/tests/path_offset.c b/tests/path_offset.c
index ad8db833..62574842 100644
--- a/tests/path_offset.c
+++ b/tests/path_offset.c
@@ -84,11 +84,16 @@ int main(int argc, char *argv[])
 	void *fdt;
 	int subnode1_offset, subnode2_offset;
 	int subsubnode1_offset, subsubnode2_offset, subsubnode2_offset2;
+	int root_offset;
 
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
 
-	check_path_offset(fdt, "/", 0);
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		FAIL("fdt_root_offset() failed: %s", fdt_strerror(root_offset));
+
+	check_path_offset(fdt, "/", root_offset);
 
 	subnode1_offset = check_subnode(fdt, 0, "subnode@1");
 	subnode2_offset = check_subnode(fdt, 0, "subnode@2");
@@ -106,8 +111,8 @@ int main(int argc, char *argv[])
 
 	/* Test paths with extraneous separators */
 	check_path_offset(fdt, "", -FDT_ERR_BADPATH);
-	check_path_offset(fdt, "//", 0);
-	check_path_offset(fdt, "///", 0);
+	check_path_offset(fdt, "//", root_offset);
+	check_path_offset(fdt, "///", root_offset);
 	check_path_offset(fdt, "//subnode@1", subnode1_offset);
 	check_path_offset(fdt, "/subnode@1/", subnode1_offset);
 	check_path_offset(fdt, "//subnode@1///", subnode1_offset);
@@ -116,7 +121,7 @@ int main(int argc, char *argv[])
 	/* Test fdt_path_offset_namelen() */
 	check_path_offset_namelen(fdt, "/subnode@1", -1, -FDT_ERR_BADPATH);
 	check_path_offset_namelen(fdt, "/subnode@1", 0, -FDT_ERR_BADPATH);
-	check_path_offset_namelen(fdt, "/subnode@1", 1, 0);
+	check_path_offset_namelen(fdt, "/subnode@1", 1, root_offset);
 	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 10, subnode1_offset);
 	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 11, subnode1_offset);
 	check_path_offset_namelen(fdt, "/subnode@2TRAILINGGARBAGE", 10, subnode2_offset);
diff --git a/tests/root_node.c b/tests/root_node.c
index 37e6f059..7c2033af 100644
--- a/tests/root_node.c
+++ b/tests/root_node.c
@@ -19,18 +19,19 @@ int main(int argc, char *argv[])
 {
 	void *fdt;
 	const struct fdt_node_header *nh;
+	int root_offset;
 
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
 
-	nh = fdt_offset_ptr(fdt, 0, sizeof(*nh));
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		FAIL("fdt_root_offset() returns %d", root_offset);
 
+	nh = fdt_offset_ptr(fdt, root_offset, sizeof(*nh));
 	if (! nh)
 		FAIL("NULL retrieving root node");
 
-	if (fdt32_to_cpu(nh->tag) != FDT_BEGIN_NODE)
-		FAIL("Wrong tag on root node");
-
 	if (strlen(nh->name) != 0)
 		FAIL("Wrong name for root node, \"%s\" instead of empty",
 		     nh->name);
-- 
2.56.1

