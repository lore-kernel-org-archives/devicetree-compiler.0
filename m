Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC53B6348;
	Wed, 26 Aug 2026 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733167; cv=none; b=dGgikUcbng8uGtfDrtPiHdBZtqK3Gezqad9cNs/6FZiFidpk8F4eIwKNIVpSJJJXdvWs0uav94Mz1jSxRJHC7dvLV/9jwtSC6jWNKraeQw5TVFuAH8JUoSrJ4H0325BqCp7BxpAx0zdWYqt54/jwiJ9JZQhjcd+RRaq+28B08Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733167; c=relaxed/simple;
	bh=nqqpXaFq+Xv9lq7FzU3oUbvr1L5YIu+wbJC9mghIqW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ospAwGA+6/ZEXUmWX9o8lLZMpRZL98QxcREKk9ZTgOd1LByWyJV8sdfhhIW3Mmuli6Y62ZBOd1YSfIeZJ4NI3SqfRn+xjRATSmXjMyU5TDfS9q2V9UyxLl3Vwk9Jo+iV0GHCZxc3nE79kEVDuORW2eMOEJJNwcw8qeXdy/0/YPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jn7RZI/j; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jn7RZI/j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B3A444E413BF;
	Wed, 26 Aug 2026 08:32:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 871E4604EC;
	Wed, 26 Aug 2026 08:32:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E31E311C7AC5A;
	Wed, 26 Aug 2026 10:32:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733162; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SqdDH62okKjLJ49j/IFlkhZUgbK4ajA4xDkkDNp6AJU=;
	b=Jn7RZI/j6B7SXS+77gx3H8Pwt7iuJvYGdLM7dEUMgdkJnHA0I/9qPX6Ks02Py2vgizRP2O
	uy/2GXrYf+XptbUHdQkUZdF2nanndHjMrB/b7bj2xfGr8p/QIVwT7UXFO6UmSx1sd3mgAq
	mOiaxKi04ejUQtb2LWFSLjtrSvZhWFuRlU/ndKrwrVC98or3DHsIWeSUZ6xKyDVoekARDo
	V5FHZQpfTOllaDsVeAQB/riTbOa3JuWQNU0F3RW+0fxgKzj9KGRTJbanV/iYuccn+uBwzV
	gfnoy3+FpQBoOJiOEV2j85vNg8gclPsWk2+a1aPJ4IEKk2xHbhNYt9Xr1Y7GQw==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: [PATCH v3 03/15] tests: Don't assume the root node is available at offset 0
Date: Wed, 26 Aug 2026 10:31:34 +0200
Message-ID: <20260826083146.304291-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Several tests uses offset 0 as the offset of the root node. Either to
check the offset returned by tested functions or to directly manipulate
the root node retrieved using fdt_offset_ptr(fdt, 0, ...).

The root node is not always at offset 0. Indeed, a FDT_NOP tag can be
present at offset 0. fdt_root_offset() returns the offset of the root
node taking care of possible FDT_NOP tag.

Use fdt_root_offset() to get the offset of the root node and use this
value whenever the offset of the root node is expected.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/node_offset_by_compatible.c |  4 +++-
 tests/node_offset_by_prop_value.c | 11 +++++++----
 tests/path_offset.c               | 13 +++++++++----
 tests/root_node.c                 |  6 +++++-
 4 files changed, 24 insertions(+), 10 deletions(-)

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
index ad8db833..d4f6553b 100644
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
+		FAIL("fdt_root_offset()) failed: %s", fdt_strerror(root_offset));
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
index 37e6f059..30903f2b 100644
--- a/tests/root_node.c
+++ b/tests/root_node.c
@@ -19,12 +19,16 @@ int main(int argc, char *argv[])
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
 
-- 
2.55.0

