Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692266;
	b=J3LtEX/ufrDnpNU/5z7DAXJiSctQOwZYMxeoTs9iaSQbexYvrZKx7/R9s2qdxKkBNo+N
	 d7QteXB72j9wWX5+3ZJMdBOKFYL6qvxS0WJTy/Ou9QISU+ZJj1jqJS1K1e6sKwabl5bC7
	 l1HrO8B0TAQ4hrG7iw3w4NMQ07vlt4t1WXWBmtpoMZb/LEoF4i6LQlchOTZv4zkPvQqWs
	 DtfWQ1M/4VVDKJS2AKVYdjHcMvy5E1TuzUk5HyeD7fsFXMA4R4P5Yw5cZn1ILEAVs/JUr
	 CMdJFIOyE6DVMXm6YqanfVROrYALHFeCAUUXhTAYJmtDDpuF2A5IDySPJmdTASfjT1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692266;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=YKh8JZY9n4q3mZwekPs26FckmtiwDjDBDzSGGzTJGWk=;
	b=40//50ZlfUjOHov9hwIQ2DsGNYreT4+XZQnlUvn3zsSaK/HIeGj4PFDeVaAwvUTvHMPM
	 a5a43XHWWy0TXuuZ/RUnZCymBmXqKXiFk9YeRaU4qVuTvURPMU6+/a3UVQYSKFHLlsOfc
	 Go8Z086AfVjl/FArtJVuhfdyuL4e1rZWHUVVtYXd+B2uKY7nLVayCszrhfxa32sp5N+rw
	 NeCT2YGpX3geZQamLUCajV8wWql14iWLuXzUkOOkXOMDWNRt4BZ1SKeXyM7mRmJdhvvAY
	 segpI6oZiXBUWlMgMz9ZYiHBWY6pKM17OYWud8iOhgJqataLS7tnSfnpdzY3p0oGczw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=R5GScSNq;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC98606A33A;
	Thu, 26 Nov 2026 11:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC98606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=R5GScSNq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 483BE4E41798;
	Thu, 26 Nov 2026 11:24:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E92560237;
	Thu, 26 Nov 2026 11:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52AC711E6B371;
	Thu, 26 Nov 2026 12:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692261; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YKh8JZY9n4q3mZwekPs26FckmtiwDjDBDzSGGzTJGWk=;
	b=R5GScSNqhFQY/k78/uja8bhPcvt9uNktm9xsh+zYGEVlSIj504SL5Rm2tvdrY0jgzEooG8
	+cI+piKlIfatd1j2ou5fs3Svmn8hxo5rhZgMfFuIIOzKr+Nfzxf0kobWxwkSXayXZUBX3w
	fhsw/g6tGLDHTyBgNdIbpckfktsePyHDJxKOFJ3K+YZJFw7rKlzbPfwx9JcCGUO/nxq4jq
	fzmfMxo6sXjPezmuetCTn3sth0Q9JeFyPDlNveLYDR8VCfNYZA8nc0kCs0kvAauRBZfdsK
	NR5F7yyo2v5c6+Zh/ZTStyV1ntriJCzGmW2dX4/6BEy/yjM2c3TXd5eVBPeDug==
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
Subject: [PATCH v4 14/22] tests: treegen: Generate dtbs with unknown tags
Date: Thu, 26 Nov 2026 12:22:31 +0100
Message-ID: <20261126112239.636284-15-herve.codina@bootlin.com>
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

Several dtbs involving unknown structured tags are generated. Among
those dtbs, expected dtbs when libfdt functions are used to modify a
dtb are generated.

DTB modifications when unknown tags are involved follow specific rules:

                       | existing prop | existing node (1) | Downgrade
                       | unknown tag   | unknown tag       | version (2)
 ----------------------+---------------+-------------------+-----------
 Modify a property     |    Remove     | Keep (3)          | Yes
 Add a property        |    NA         | Remove            | Yes
 Delete a property     |    Remove     | Remove            | Yes
 Add a sub-node        |    NA         | Remove            | Yes
 Delete a sub-node     |    NA         | Remove            | Yes
 ----------------------+---------------+-------------------+-----------

 (1) The existing node is the node where the property or sub-node
     involved are present. Not all nodes, not the parent node but the
     node directly impacted by the modification.

 (2) The version is always downgraded on any change (modification,
     addition, deletion of a property or a sub-node) even if no tags are
     removed.

 (3) Removing unknown tags in the node when a property is modified will
     change the property offset. Avoid this property offset change and
     so keep node related unknown tags in that case.

Generated dtbs are consistent with those rules.

Also, in order to cover several cases related to unknown tag presence,
several nodes are present in each dtb. Those nodes contain three
properties and three subnodes allowing several use cases to be tested;
modify/remove the first property available in a node, modify/remove a
property among other properties, modify/remove the last property of a
node. Available subnodes offer the same kind of combination.

The node structure is the following:
  {
	prop1 = "123456789";
	prop2 = "123456789";
	prop3 = "123456789";

	subnode1 {
		prop;
	};

	subnode2 {
		prop;
	};

	subnode3 {
		prop;
	};
  }

Six nodes are available with this structure but differ in unknown tags
and/or FDT_NOP presence.
 - node1: No unknown tags, no FDT_NOP tags
 - node2: Only unknown tags related to properties, no FDT_NOP tags
 - node3: Only unknown tags related to node, no FDT_NOP tags
 - node4: Both unknown tags related to properties and node, no FDT_NOP
          tags
 - node5: Same as node4 but with unknown tags related to node added in
          subnodes
 - node6: Same as node5 but with FDT_NOP tags added (mixed with unknown
          tags)

Three additional nodes are present: node7, node8 and node9. They have
the same unknown tags and FDT_NOP tags as node6 but:
 - node7 is a properties-only node (no subnodes are available in node7),
 - node8 is a subnodes-only node (no properties are available in node8),
 - node9 is an empty node.

This last node is used only on rw modification when a property or a
subnode is added (neither adding a property nor a subnode is supported
by write-in-place modifications).

Those additional nodes allow checking that there is no interference
between properties and subnodes when modifications are performed.

Expected dtbs are generated depending on the modification done for each
of the nine nodes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/Makefile.tests         |  235 ++++++-
 tests/meson.build            |  233 ++++++-
 tests/treegen.c              |    2 +
 tests/treegen_unknown_tags.c | 1142 ++++++++++++++++++++++++++++++++++
 4 files changed, 1609 insertions(+), 3 deletions(-)
 create mode 100644 tests/treegen_unknown_tags.c

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index cc35c66a..30452d05 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -44,7 +44,237 @@ TESTS = $(LIB_TESTS) $(DL_LIB_TESTS)
 TESTS_TREES_L = test_tree1.dtb bad_node_char.dtb bad_node_format.dtb \
 	bad_prop_char.dtb ovf_size_strings.dtb truncated_property.dtb \
 	truncated_string.dtb truncated_memrsv.dtb unterminated_memrsv.dtb \
-	two_roots.dtb named_root.dtb root_offset_12.dtb bad_proplen.dtb
+	two_roots.dtb named_root.dtb root_offset_12.dtb bad_proplen.dtb \
+	unknown_tags_can_skip.dtb \
+	unknown_tags_removed.dtb \
+	unknown_tags_rw_node1_prop1_modified_ab.dtb \
+	unknown_tags_rw_node1_prop1_modified_abcdefgh.dtb \
+	unknown_tags_rw_node1_prop1_modified_abcdefghi.dtb \
+	unknown_tags_rw_node1_prop1_modified_abcdefghij.dtb \
+	unknown_tags_rw_node1_prop1_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node1_prop2_modified_ab.dtb \
+	unknown_tags_rw_node1_prop2_modified_abcdefgh.dtb \
+	unknown_tags_rw_node1_prop2_modified_abcdefghi.dtb \
+	unknown_tags_rw_node1_prop2_modified_abcdefghij.dtb \
+	unknown_tags_rw_node1_prop2_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node1_prop3_modified_ab.dtb \
+	unknown_tags_rw_node1_prop3_modified_abcdefgh.dtb \
+	unknown_tags_rw_node1_prop3_modified_abcdefghi.dtb \
+	unknown_tags_rw_node1_prop3_modified_abcdefghij.dtb \
+	unknown_tags_rw_node1_prop3_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node1_prop1_removed.dtb \
+	unknown_tags_rw_node1_prop2_removed.dtb \
+	unknown_tags_rw_node1_prop3_removed.dtb \
+	unknown_tags_rw_node1_subnode1_removed.dtb \
+	unknown_tags_rw_node1_subnode2_removed.dtb \
+	unknown_tags_rw_node1_subnode3_removed.dtb \
+	unknown_tags_rw_node1_propnew_added.dtb \
+	unknown_tags_rw_node1_subnodenew_added.dtb \
+	unknown_tags_rw_node2_prop1_modified_ab.dtb \
+	unknown_tags_rw_node2_prop1_modified_abcdefgh.dtb \
+	unknown_tags_rw_node2_prop1_modified_abcdefghi.dtb \
+	unknown_tags_rw_node2_prop1_modified_abcdefghij.dtb \
+	unknown_tags_rw_node2_prop1_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node2_prop2_modified_ab.dtb \
+	unknown_tags_rw_node2_prop2_modified_abcdefgh.dtb \
+	unknown_tags_rw_node2_prop2_modified_abcdefghi.dtb \
+	unknown_tags_rw_node2_prop2_modified_abcdefghij.dtb \
+	unknown_tags_rw_node2_prop2_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node2_prop3_modified_ab.dtb \
+	unknown_tags_rw_node2_prop3_modified_abcdefgh.dtb \
+	unknown_tags_rw_node2_prop3_modified_abcdefghi.dtb \
+	unknown_tags_rw_node2_prop3_modified_abcdefghij.dtb \
+	unknown_tags_rw_node2_prop3_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node2_prop1_removed.dtb \
+	unknown_tags_rw_node2_prop2_removed.dtb \
+	unknown_tags_rw_node2_prop3_removed.dtb \
+	unknown_tags_rw_node2_subnode1_removed.dtb \
+	unknown_tags_rw_node2_subnode2_removed.dtb \
+	unknown_tags_rw_node2_subnode3_removed.dtb \
+	unknown_tags_rw_node2_propnew_added.dtb \
+	unknown_tags_rw_node2_subnodenew_added.dtb \
+	unknown_tags_rw_node3_prop1_modified_ab.dtb \
+	unknown_tags_rw_node3_prop1_modified_abcdefgh.dtb \
+	unknown_tags_rw_node3_prop1_modified_abcdefghi.dtb \
+	unknown_tags_rw_node3_prop1_modified_abcdefghij.dtb \
+	unknown_tags_rw_node3_prop1_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node3_prop2_modified_ab.dtb \
+	unknown_tags_rw_node3_prop2_modified_abcdefgh.dtb \
+	unknown_tags_rw_node3_prop2_modified_abcdefghi.dtb \
+	unknown_tags_rw_node3_prop2_modified_abcdefghij.dtb \
+	unknown_tags_rw_node3_prop2_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node3_prop3_modified_ab.dtb \
+	unknown_tags_rw_node3_prop3_modified_abcdefgh.dtb \
+	unknown_tags_rw_node3_prop3_modified_abcdefghi.dtb \
+	unknown_tags_rw_node3_prop3_modified_abcdefghij.dtb \
+	unknown_tags_rw_node3_prop3_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node3_prop1_removed.dtb \
+	unknown_tags_rw_node3_prop2_removed.dtb \
+	unknown_tags_rw_node3_prop3_removed.dtb \
+	unknown_tags_rw_node3_subnode1_removed.dtb \
+	unknown_tags_rw_node3_subnode2_removed.dtb \
+	unknown_tags_rw_node3_subnode3_removed.dtb \
+	unknown_tags_rw_node3_propnew_added.dtb \
+	unknown_tags_rw_node3_subnodenew_added.dtb \
+	unknown_tags_rw_node4_prop1_modified_ab.dtb \
+	unknown_tags_rw_node4_prop1_modified_abcdefgh.dtb \
+	unknown_tags_rw_node4_prop1_modified_abcdefghi.dtb \
+	unknown_tags_rw_node4_prop1_modified_abcdefghij.dtb \
+	unknown_tags_rw_node4_prop1_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node4_prop2_modified_ab.dtb \
+	unknown_tags_rw_node4_prop2_modified_abcdefgh.dtb \
+	unknown_tags_rw_node4_prop2_modified_abcdefghi.dtb \
+	unknown_tags_rw_node4_prop2_modified_abcdefghij.dtb \
+	unknown_tags_rw_node4_prop2_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node4_prop3_modified_ab.dtb \
+	unknown_tags_rw_node4_prop3_modified_abcdefgh.dtb \
+	unknown_tags_rw_node4_prop3_modified_abcdefghi.dtb \
+	unknown_tags_rw_node4_prop3_modified_abcdefghij.dtb \
+	unknown_tags_rw_node4_prop3_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node4_prop1_removed.dtb \
+	unknown_tags_rw_node4_prop2_removed.dtb \
+	unknown_tags_rw_node4_prop3_removed.dtb \
+	unknown_tags_rw_node4_subnode1_removed.dtb \
+	unknown_tags_rw_node4_subnode2_removed.dtb \
+	unknown_tags_rw_node4_subnode3_removed.dtb \
+	unknown_tags_rw_node4_propnew_added.dtb \
+	unknown_tags_rw_node4_subnodenew_added.dtb \
+	unknown_tags_rw_node5_prop1_modified_ab.dtb \
+	unknown_tags_rw_node5_prop1_modified_abcdefgh.dtb \
+	unknown_tags_rw_node5_prop1_modified_abcdefghi.dtb \
+	unknown_tags_rw_node5_prop1_modified_abcdefghij.dtb \
+	unknown_tags_rw_node5_prop1_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node5_prop2_modified_ab.dtb \
+	unknown_tags_rw_node5_prop2_modified_abcdefgh.dtb \
+	unknown_tags_rw_node5_prop2_modified_abcdefghi.dtb \
+	unknown_tags_rw_node5_prop2_modified_abcdefghij.dtb \
+	unknown_tags_rw_node5_prop2_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node5_prop3_modified_ab.dtb \
+	unknown_tags_rw_node5_prop3_modified_abcdefgh.dtb \
+	unknown_tags_rw_node5_prop3_modified_abcdefghi.dtb \
+	unknown_tags_rw_node5_prop3_modified_abcdefghij.dtb \
+	unknown_tags_rw_node5_prop3_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node5_prop1_removed.dtb \
+	unknown_tags_rw_node5_prop2_removed.dtb \
+	unknown_tags_rw_node5_prop3_removed.dtb \
+	unknown_tags_rw_node5_subnode1_removed.dtb \
+	unknown_tags_rw_node5_subnode2_removed.dtb \
+	unknown_tags_rw_node5_subnode3_removed.dtb \
+	unknown_tags_rw_node5_propnew_added.dtb \
+	unknown_tags_rw_node5_subnodenew_added.dtb \
+	unknown_tags_rw_node6_prop1_modified_ab.dtb \
+	unknown_tags_rw_node6_prop1_modified_abcdefgh.dtb \
+	unknown_tags_rw_node6_prop1_modified_abcdefghi.dtb \
+	unknown_tags_rw_node6_prop1_modified_abcdefghij.dtb \
+	unknown_tags_rw_node6_prop1_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node6_prop2_modified_ab.dtb \
+	unknown_tags_rw_node6_prop2_modified_abcdefgh.dtb \
+	unknown_tags_rw_node6_prop2_modified_abcdefghi.dtb \
+	unknown_tags_rw_node6_prop2_modified_abcdefghij.dtb \
+	unknown_tags_rw_node6_prop2_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node6_prop3_modified_ab.dtb \
+	unknown_tags_rw_node6_prop3_modified_abcdefgh.dtb \
+	unknown_tags_rw_node6_prop3_modified_abcdefghi.dtb \
+	unknown_tags_rw_node6_prop3_modified_abcdefghij.dtb \
+	unknown_tags_rw_node6_prop3_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node6_prop1_removed.dtb \
+	unknown_tags_rw_node6_prop2_removed.dtb \
+	unknown_tags_rw_node6_prop3_removed.dtb \
+	unknown_tags_rw_node6_subnode1_removed.dtb \
+	unknown_tags_rw_node6_subnode2_removed.dtb \
+	unknown_tags_rw_node6_subnode3_removed.dtb \
+	unknown_tags_rw_node6_propnew_added.dtb \
+	unknown_tags_rw_node6_subnodenew_added.dtb \
+	unknown_tags_rw_node7_prop1_modified_ab.dtb \
+	unknown_tags_rw_node7_prop1_modified_abcdefgh.dtb \
+	unknown_tags_rw_node7_prop1_modified_abcdefghi.dtb \
+	unknown_tags_rw_node7_prop1_modified_abcdefghij.dtb \
+	unknown_tags_rw_node7_prop1_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node7_prop2_modified_ab.dtb \
+	unknown_tags_rw_node7_prop2_modified_abcdefgh.dtb \
+	unknown_tags_rw_node7_prop2_modified_abcdefghi.dtb \
+	unknown_tags_rw_node7_prop2_modified_abcdefghij.dtb \
+	unknown_tags_rw_node7_prop2_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node7_prop3_modified_ab.dtb \
+	unknown_tags_rw_node7_prop3_modified_abcdefgh.dtb \
+	unknown_tags_rw_node7_prop3_modified_abcdefghi.dtb \
+	unknown_tags_rw_node7_prop3_modified_abcdefghij.dtb \
+	unknown_tags_rw_node7_prop3_modified_abcdefghijklmnop.dtb \
+	unknown_tags_rw_node7_prop1_removed.dtb \
+	unknown_tags_rw_node7_prop2_removed.dtb \
+	unknown_tags_rw_node7_prop3_removed.dtb \
+	unknown_tags_rw_node7_propnew_added.dtb \
+	unknown_tags_rw_node7_subnodenew_added.dtb \
+	unknown_tags_rw_node8_subnode1_removed.dtb \
+	unknown_tags_rw_node8_subnode2_removed.dtb \
+	unknown_tags_rw_node8_subnode3_removed.dtb \
+	unknown_tags_rw_node8_propnew_added.dtb \
+	unknown_tags_rw_node8_subnodenew_added.dtb \
+	unknown_tags_rw_node9_propnew_added.dtb \
+	unknown_tags_rw_node9_subnodenew_added.dtb \
+	unknown_tags_wip_node1_prop1_modified_abcdefghi.dtb \
+	unknown_tags_wip_node1_prop2_modified_abcdefghi.dtb \
+	unknown_tags_wip_node1_prop3_modified_abcdefghi.dtb \
+	unknown_tags_wip_node1_prop1_removed.dtb \
+	unknown_tags_wip_node1_prop2_removed.dtb \
+	unknown_tags_wip_node1_prop3_removed.dtb \
+	unknown_tags_wip_node1_subnode1_removed.dtb \
+	unknown_tags_wip_node1_subnode2_removed.dtb \
+	unknown_tags_wip_node1_subnode3_removed.dtb \
+	unknown_tags_wip_node2_prop1_modified_abcdefghi.dtb \
+	unknown_tags_wip_node2_prop2_modified_abcdefghi.dtb \
+	unknown_tags_wip_node2_prop3_modified_abcdefghi.dtb \
+	unknown_tags_wip_node2_prop1_removed.dtb \
+	unknown_tags_wip_node2_prop2_removed.dtb \
+	unknown_tags_wip_node2_prop3_removed.dtb \
+	unknown_tags_wip_node2_subnode1_removed.dtb \
+	unknown_tags_wip_node2_subnode2_removed.dtb \
+	unknown_tags_wip_node2_subnode3_removed.dtb \
+	unknown_tags_wip_node3_prop1_modified_abcdefghi.dtb \
+	unknown_tags_wip_node3_prop2_modified_abcdefghi.dtb \
+	unknown_tags_wip_node3_prop3_modified_abcdefghi.dtb \
+	unknown_tags_wip_node3_prop1_removed.dtb \
+	unknown_tags_wip_node3_prop2_removed.dtb \
+	unknown_tags_wip_node3_prop3_removed.dtb \
+	unknown_tags_wip_node3_subnode1_removed.dtb \
+	unknown_tags_wip_node3_subnode2_removed.dtb \
+	unknown_tags_wip_node3_subnode3_removed.dtb \
+	unknown_tags_wip_node4_prop1_modified_abcdefghi.dtb \
+	unknown_tags_wip_node4_prop2_modified_abcdefghi.dtb \
+	unknown_tags_wip_node4_prop3_modified_abcdefghi.dtb \
+	unknown_tags_wip_node4_prop1_removed.dtb \
+	unknown_tags_wip_node4_prop2_removed.dtb \
+	unknown_tags_wip_node4_prop3_removed.dtb \
+	unknown_tags_wip_node4_subnode1_removed.dtb \
+	unknown_tags_wip_node4_subnode2_removed.dtb \
+	unknown_tags_wip_node4_subnode3_removed.dtb \
+	unknown_tags_wip_node5_prop1_modified_abcdefghi.dtb \
+	unknown_tags_wip_node5_prop2_modified_abcdefghi.dtb \
+	unknown_tags_wip_node5_prop3_modified_abcdefghi.dtb \
+	unknown_tags_wip_node5_prop1_removed.dtb \
+	unknown_tags_wip_node5_prop2_removed.dtb \
+	unknown_tags_wip_node5_prop3_removed.dtb \
+	unknown_tags_wip_node5_subnode1_removed.dtb \
+	unknown_tags_wip_node5_subnode2_removed.dtb \
+	unknown_tags_wip_node5_subnode3_removed.dtb \
+	unknown_tags_wip_node6_prop1_modified_abcdefghi.dtb \
+	unknown_tags_wip_node6_prop2_modified_abcdefghi.dtb \
+	unknown_tags_wip_node6_prop3_modified_abcdefghi.dtb \
+	unknown_tags_wip_node6_prop1_removed.dtb \
+	unknown_tags_wip_node6_prop2_removed.dtb \
+	unknown_tags_wip_node6_prop3_removed.dtb \
+	unknown_tags_wip_node6_subnode1_removed.dtb \
+	unknown_tags_wip_node6_subnode2_removed.dtb \
+	unknown_tags_wip_node6_subnode3_removed.dtb \
+	unknown_tags_wip_node7_prop1_modified_abcdefghi.dtb \
+	unknown_tags_wip_node7_prop2_modified_abcdefghi.dtb \
+	unknown_tags_wip_node7_prop3_modified_abcdefghi.dtb \
+	unknown_tags_wip_node7_prop1_removed.dtb \
+	unknown_tags_wip_node7_prop2_removed.dtb \
+	unknown_tags_wip_node7_prop3_removed.dtb \
+	unknown_tags_wip_node8_subnode1_removed.dtb \
+	unknown_tags_wip_node8_subnode2_removed.dtb \
+	unknown_tags_wip_node8_subnode3_removed.dtb
 TESTS_TREES = $(TESTS_TREES_L:%=$(TESTS_PREFIX)%)
 
 TESTS_TARGETS = $(TESTS) $(TESTS_TREES)
@@ -72,7 +302,8 @@ $(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_dep)
 	$(LINK.c) -o $@ $^ $(LIBDL)
 
 TREEGEN_OBJS =  $(TESTS_PREFIX)treegen.o \
-		$(TESTS_PREFIX)treegen_base.o
+		$(TESTS_PREFIX)treegen_base.o \
+		$(TESTS_PREFIX)treegen_unknown_tags.o
 
 $(TESTS_PREFIX)treegen: $(TREEGEN_OBJS)
 	$(LINK.c) -o $@ $^
diff --git a/tests/meson.build b/tests/meson.build
index 1c530b71..89c6a75a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,6 +1,7 @@
 treegen = executable('treegen',
                      files('treegen.c',
-                           'treegen_base.c'
+                           'treegen_base.c',
+                           'treegen_unknown_tags.c'
                      ),
                      build_by_default: false,
                      dependencies: [util_dep])
@@ -22,6 +23,236 @@ treegen_dtb = custom_target(
     'named_root.dtb',
     'root_offset_12.dtb',
     'bad_proplen.dtb',
+    'unknown_tags_can_skip.dtb',
+    'unknown_tags_removed.dtb',
+    'unknown_tags_rw_node1_prop1_modified_ab.dtb',
+    'unknown_tags_rw_node1_prop1_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node1_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node1_prop1_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node1_prop1_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node1_prop2_modified_ab.dtb',
+    'unknown_tags_rw_node1_prop2_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node1_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node1_prop2_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node1_prop2_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node1_prop3_modified_ab.dtb',
+    'unknown_tags_rw_node1_prop3_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node1_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node1_prop3_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node1_prop3_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node1_prop1_removed.dtb',
+    'unknown_tags_rw_node1_prop2_removed.dtb',
+    'unknown_tags_rw_node1_prop3_removed.dtb',
+    'unknown_tags_rw_node1_subnode1_removed.dtb',
+    'unknown_tags_rw_node1_subnode2_removed.dtb',
+    'unknown_tags_rw_node1_subnode3_removed.dtb',
+    'unknown_tags_rw_node1_propnew_added.dtb',
+    'unknown_tags_rw_node1_subnodenew_added.dtb',
+    'unknown_tags_rw_node2_prop1_modified_ab.dtb',
+    'unknown_tags_rw_node2_prop1_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node2_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node2_prop1_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node2_prop1_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node2_prop2_modified_ab.dtb',
+    'unknown_tags_rw_node2_prop2_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node2_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node2_prop2_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node2_prop2_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node2_prop3_modified_ab.dtb',
+    'unknown_tags_rw_node2_prop3_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node2_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node2_prop3_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node2_prop3_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node2_prop1_removed.dtb',
+    'unknown_tags_rw_node2_prop2_removed.dtb',
+    'unknown_tags_rw_node2_prop3_removed.dtb',
+    'unknown_tags_rw_node2_subnode1_removed.dtb',
+    'unknown_tags_rw_node2_subnode2_removed.dtb',
+    'unknown_tags_rw_node2_subnode3_removed.dtb',
+    'unknown_tags_rw_node2_propnew_added.dtb',
+    'unknown_tags_rw_node2_subnodenew_added.dtb',
+    'unknown_tags_rw_node3_prop1_modified_ab.dtb',
+    'unknown_tags_rw_node3_prop1_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node3_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node3_prop1_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node3_prop1_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node3_prop2_modified_ab.dtb',
+    'unknown_tags_rw_node3_prop2_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node3_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node3_prop2_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node3_prop2_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node3_prop3_modified_ab.dtb',
+    'unknown_tags_rw_node3_prop3_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node3_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node3_prop3_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node3_prop3_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node3_prop1_removed.dtb',
+    'unknown_tags_rw_node3_prop2_removed.dtb',
+    'unknown_tags_rw_node3_prop3_removed.dtb',
+    'unknown_tags_rw_node3_subnode1_removed.dtb',
+    'unknown_tags_rw_node3_subnode2_removed.dtb',
+    'unknown_tags_rw_node3_subnode3_removed.dtb',
+    'unknown_tags_rw_node3_propnew_added.dtb',
+    'unknown_tags_rw_node3_subnodenew_added.dtb',
+    'unknown_tags_rw_node4_prop1_modified_ab.dtb',
+    'unknown_tags_rw_node4_prop1_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node4_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node4_prop1_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node4_prop1_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node4_prop2_modified_ab.dtb',
+    'unknown_tags_rw_node4_prop2_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node4_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node4_prop2_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node4_prop2_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node4_prop3_modified_ab.dtb',
+    'unknown_tags_rw_node4_prop3_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node4_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node4_prop3_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node4_prop3_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node4_prop1_removed.dtb',
+    'unknown_tags_rw_node4_prop2_removed.dtb',
+    'unknown_tags_rw_node4_prop3_removed.dtb',
+    'unknown_tags_rw_node4_subnode1_removed.dtb',
+    'unknown_tags_rw_node4_subnode2_removed.dtb',
+    'unknown_tags_rw_node4_subnode3_removed.dtb',
+    'unknown_tags_rw_node4_propnew_added.dtb',
+    'unknown_tags_rw_node4_subnodenew_added.dtb',
+    'unknown_tags_rw_node5_prop1_modified_ab.dtb',
+    'unknown_tags_rw_node5_prop1_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node5_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node5_prop1_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node5_prop1_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node5_prop2_modified_ab.dtb',
+    'unknown_tags_rw_node5_prop2_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node5_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node5_prop2_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node5_prop2_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node5_prop3_modified_ab.dtb',
+    'unknown_tags_rw_node5_prop3_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node5_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node5_prop3_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node5_prop3_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node5_prop1_removed.dtb',
+    'unknown_tags_rw_node5_prop2_removed.dtb',
+    'unknown_tags_rw_node5_prop3_removed.dtb',
+    'unknown_tags_rw_node5_subnode1_removed.dtb',
+    'unknown_tags_rw_node5_subnode2_removed.dtb',
+    'unknown_tags_rw_node5_subnode3_removed.dtb',
+    'unknown_tags_rw_node5_propnew_added.dtb',
+    'unknown_tags_rw_node5_subnodenew_added.dtb',
+    'unknown_tags_rw_node6_prop1_modified_ab.dtb',
+    'unknown_tags_rw_node6_prop1_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node6_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node6_prop1_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node6_prop1_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node6_prop2_modified_ab.dtb',
+    'unknown_tags_rw_node6_prop2_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node6_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node6_prop2_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node6_prop2_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node6_prop3_modified_ab.dtb',
+    'unknown_tags_rw_node6_prop3_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node6_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node6_prop3_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node6_prop3_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node6_prop1_removed.dtb',
+    'unknown_tags_rw_node6_prop2_removed.dtb',
+    'unknown_tags_rw_node6_prop3_removed.dtb',
+    'unknown_tags_rw_node6_subnode1_removed.dtb',
+    'unknown_tags_rw_node6_subnode2_removed.dtb',
+    'unknown_tags_rw_node6_subnode3_removed.dtb',
+    'unknown_tags_rw_node6_propnew_added.dtb',
+    'unknown_tags_rw_node6_subnodenew_added.dtb',
+    'unknown_tags_rw_node7_prop1_modified_ab.dtb',
+    'unknown_tags_rw_node7_prop1_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node7_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node7_prop1_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node7_prop1_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node7_prop2_modified_ab.dtb',
+    'unknown_tags_rw_node7_prop2_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node7_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node7_prop2_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node7_prop2_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node7_prop3_modified_ab.dtb',
+    'unknown_tags_rw_node7_prop3_modified_abcdefgh.dtb',
+    'unknown_tags_rw_node7_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_rw_node7_prop3_modified_abcdefghij.dtb',
+    'unknown_tags_rw_node7_prop3_modified_abcdefghijklmnop.dtb',
+    'unknown_tags_rw_node7_prop1_removed.dtb',
+    'unknown_tags_rw_node7_prop2_removed.dtb',
+    'unknown_tags_rw_node7_prop3_removed.dtb',
+    'unknown_tags_rw_node7_propnew_added.dtb',
+    'unknown_tags_rw_node7_subnodenew_added.dtb',
+    'unknown_tags_rw_node8_subnode1_removed.dtb',
+    'unknown_tags_rw_node8_subnode2_removed.dtb',
+    'unknown_tags_rw_node8_subnode3_removed.dtb',
+    'unknown_tags_rw_node8_propnew_added.dtb',
+    'unknown_tags_rw_node8_subnodenew_added.dtb',
+    'unknown_tags_rw_node9_propnew_added.dtb',
+    'unknown_tags_rw_node9_subnodenew_added.dtb',
+    'unknown_tags_wip_node1_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node1_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node1_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node1_prop1_removed.dtb',
+    'unknown_tags_wip_node1_prop2_removed.dtb',
+    'unknown_tags_wip_node1_prop3_removed.dtb',
+    'unknown_tags_wip_node1_subnode1_removed.dtb',
+    'unknown_tags_wip_node1_subnode2_removed.dtb',
+    'unknown_tags_wip_node1_subnode3_removed.dtb',
+    'unknown_tags_wip_node2_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node2_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node2_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node2_prop1_removed.dtb',
+    'unknown_tags_wip_node2_prop2_removed.dtb',
+    'unknown_tags_wip_node2_prop3_removed.dtb',
+    'unknown_tags_wip_node2_subnode1_removed.dtb',
+    'unknown_tags_wip_node2_subnode2_removed.dtb',
+    'unknown_tags_wip_node2_subnode3_removed.dtb',
+    'unknown_tags_wip_node3_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node3_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node3_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node3_prop1_removed.dtb',
+    'unknown_tags_wip_node3_prop2_removed.dtb',
+    'unknown_tags_wip_node3_prop3_removed.dtb',
+    'unknown_tags_wip_node3_subnode1_removed.dtb',
+    'unknown_tags_wip_node3_subnode2_removed.dtb',
+    'unknown_tags_wip_node3_subnode3_removed.dtb',
+    'unknown_tags_wip_node4_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node4_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node4_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node4_prop1_removed.dtb',
+    'unknown_tags_wip_node4_prop2_removed.dtb',
+    'unknown_tags_wip_node4_prop3_removed.dtb',
+    'unknown_tags_wip_node4_subnode1_removed.dtb',
+    'unknown_tags_wip_node4_subnode2_removed.dtb',
+    'unknown_tags_wip_node4_subnode3_removed.dtb',
+    'unknown_tags_wip_node5_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node5_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node5_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node5_prop1_removed.dtb',
+    'unknown_tags_wip_node5_prop2_removed.dtb',
+    'unknown_tags_wip_node5_prop3_removed.dtb',
+    'unknown_tags_wip_node5_subnode1_removed.dtb',
+    'unknown_tags_wip_node5_subnode2_removed.dtb',
+    'unknown_tags_wip_node5_subnode3_removed.dtb',
+    'unknown_tags_wip_node6_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node6_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node6_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node6_prop1_removed.dtb',
+    'unknown_tags_wip_node6_prop2_removed.dtb',
+    'unknown_tags_wip_node6_prop3_removed.dtb',
+    'unknown_tags_wip_node6_subnode1_removed.dtb',
+    'unknown_tags_wip_node6_subnode2_removed.dtb',
+    'unknown_tags_wip_node6_subnode3_removed.dtb',
+    'unknown_tags_wip_node7_prop1_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node7_prop2_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node7_prop3_modified_abcdefghi.dtb',
+    'unknown_tags_wip_node7_prop1_removed.dtb',
+    'unknown_tags_wip_node7_prop2_removed.dtb',
+    'unknown_tags_wip_node7_prop3_removed.dtb',
+    'unknown_tags_wip_node8_subnode1_removed.dtb',
+    'unknown_tags_wip_node8_subnode2_removed.dtb',
+    'unknown_tags_wip_node8_subnode3_removed.dtb',
   ]
 )
 
diff --git a/tests/treegen.c b/tests/treegen.c
index 20b2de33..f6836fde 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -249,10 +249,12 @@ size_t emit_prop_strings_(struct buf *b, int nameoff, ...)
 
 /* Available harnesses */
 extern struct treeharness treeharness_base;
+extern struct treeharness treeharness_unknown_tags;
 
 /* Tree harnesses */
 static const struct treeharness *tab_treeharness[] = {
 	&treeharness_base,
+	&treeharness_unknown_tags,
 };
 
 int main(int argc, char *argv[])
diff --git a/tests/treegen_unknown_tags.c b/tests/treegen_unknown_tags.c
new file mode 100644
index 00000000..5128d89e
--- /dev/null
+++ b/tests/treegen_unknown_tags.c
@@ -0,0 +1,1142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * treegen_unknown_tags - generate unknown tags dtbs
+ *
+ */
+#include "treegen.h"
+#include <assert.h>
+#include <string.h>
+#include "libfdt_env.h"
+#include "fdt.h"
+#include "util.h"
+
+
+#define OPT_NO_UNKNOWN_TAGS			(0U << 0)
+#define OPT_ALLOW_UNKNOWN_TAGS			(1U << 0)
+#define OPT_IS_UNKNOWN_TAGS_ALLOWED(opts_)	((opts_) & OPT_ALLOW_UNKNOWN_TAGS)
+
+#define OPT_UNKNOWN_TAGS_AT_NODE		  (1U << 1)
+#define OPT_UNKNOWN_TAGS_AT_PROPS		  (1U << 2)
+#define OPT_UNKNOWN_TAGS_AT_SUBNODES		  (1U << 3)
+#define OPT_UNKNOWN_TAGS_AFTER_SUBNODES		  (1U << 4)
+#define OPT_UNKNOWN_TAGS_AND_NOPS		  (1U << 5)
+#define OPT_IS_UNKNOWN_TAGS_AT_NODE(opts_)	  ((opts_) & OPT_UNKNOWN_TAGS_AT_NODE)
+#define OPT_IS_UNKNOWN_TAGS_AT_PROPS(opts_)	  ((opts_) & OPT_UNKNOWN_TAGS_AT_PROPS)
+#define OPT_IS_UNKNOWN_TAGS_AT_SUBNODES(opts_)	  ((opts_) & OPT_UNKNOWN_TAGS_AT_SUBNODES)
+#define OPT_IS_UNKNOWN_TAGS_AFTER_SUBNODES(opts_) ((opts_) & OPT_UNKNOWN_TAGS_AFTER_SUBNODES)
+#define OPT_IS_UNKNOWN_TAGS_AND_NOPS(opts_)	  ((opts_) & OPT_UNKNOWN_TAGS_AND_NOPS)
+
+#define OPT_OP_TYPE_MASK	(3U << 6)
+#define OPT_OP_NOMODIF		(0U << 6)
+#define OPT_OP_MODIFY		(1U << 6)
+#define OPT_OP_ADD		(2U << 6)
+#define OPT_OP_REMOVE		(3U << 6)
+#define OPT_GET_OP(opts_)	((opts_) & OPT_OP_TYPE_MASK)
+
+#define OPT_OP_MODIFY_PARAM_MASK	(7U << 8)
+#define OPT_OP_MODIFY_PARAM_NA		(0U << 8)
+#define OPT_OP_MODIFY_PARAM_LEN1	(1U << 8)
+#define OPT_OP_MODIFY_PARAM_LEN2	(2U << 8)
+#define OPT_OP_MODIFY_PARAM_LEN3	(3U << 8)
+#define OPT_OP_MODIFY_PARAM_LEN4	(4U << 8)
+#define OPT_OP_MODIFY_PARAM_LEN5	(5U << 8)
+#define OPT_GET_MODIFY_PARAM(opts_)	((opts_) & OPT_OP_MODIFY_PARAM_MASK)
+
+/*
+ * Use different lengths to modify a value. Compared to the original value
+ * chosen with 2 bytes padding
+ *
+ * Modified size are:
+ * - LEN1: Really smaller (more than a FDT_TAGSIZE to play with alignment)
+ * - LEN2: 1 byte smaller to just remove 1 byte padding
+ * - LEN3: Same as the original value
+ * - LEN4: 1 byte bigger to just add 1 byte padding
+ * - LEN5: Really bigger (more than a FDT_TAGSIZE to play with alignment)
+ *
+ * Showing the string, '.' for the 0 termination char, p for padding, NEXT
+ * for the next tag and NOP- for FDT_NOP, splitting by block of 32bit, here
+ * are details with value chosen:
+ *
+ * For rw (splice)
+ *   ORIGIN 1234 5678 9.pp NEXT
+ *   LEN1   ab.p NEXT
+ *   LEN2   abcd efgh .ppp NEXT
+ *   LEN3   abcd efgh i.pp NEXT    <--- Same size as ORIGIN
+ *   LEN4   abcd efgh ij.p NEXT
+ *   LEN5   abcd efgh ijkl mnop .ppp NEXT
+ *
+ * For write-in-place (nop)
+ *   ORIGIN 1234 5678 9.pp NEXT
+ *   LEN1   ab.p NOP- NOP- NEXT
+ *   LEN2   abcd efgh .ppp NEXT
+ *   LEN3   abcd efgh i.pp NEXT    <--- Same size as ORIGIN
+ *   LEN4   NA, cannot enlarge a property with write-in-place
+ *   LEN5   NA, cannot enlarge a property with write-in-place
+ */
+#define PROP_ORIGIN_VALUE         "123456789"  /* 10 bytes + 2 bytes pads */
+
+/*
+ * The values must appear in the resulting tree name which is built by macro
+ * concatenation (##)
+ */
+#define SUFFIX_LEN1  ab                /* Str:  3 bytes + 1 byte pad */
+#define SUFFIX_LEN2  abcdefgh          /* Str:  9 bytes + 3 bytes pads */
+#define SUFFIX_LEN3  abcdefghi         /* Str: 10 bytes + 2 bytes pads */
+#define SUFFIX_LEN4  abcdefghij        /* Str: 11 bytes + 1 bytes pads */
+#define SUFFIX_LEN5  abcdefghijklmnop  /* Str: 17 bytes + 3 bytes pads */
+
+#define PROP_LEN1_VALUE  stringify(SUFFIX_LEN1)
+#define PROP_LEN2_VALUE  stringify(SUFFIX_LEN2)
+#define PROP_LEN3_VALUE  stringify(SUFFIX_LEN3)
+#define PROP_LEN4_VALUE  stringify(SUFFIX_LEN4)
+#define PROP_LEN5_VALUE  stringify(SUFFIX_LEN5)
+
+#define OPT_MODE_SPLICE	(0U << 11)
+#define OPT_MODE_NOPIFY	(1U << 11)
+#define OPT_IS_NOPIFY_OP(opts_)	((opts_) & OPT_MODE_NOPIFY)
+
+#define OPT_SUBITEM_MASK	(15U << 12)
+#define OPT_SUBITEM_NA		(0U << 12)
+#define OPT_SUBITEM_PROP1	(1U << 12)
+#define OPT_SUBITEM_PROP2	(2U << 12)
+#define OPT_SUBITEM_PROP3	(3U << 12)
+#define OPT_SUBITEM_PROPNEW	(4U << 12) /* For OPT_OP_ADD */
+#define OPT_SUBITEM_SUBNODE1	(5U << 12)
+#define OPT_SUBITEM_SUBNODE2	(6U << 12)
+#define OPT_SUBITEM_SUBNODE3	(7U << 12)
+#define OPT_SUBITEM_SUBNODENEW	(8U << 12) /* For OPT_OP_ADD */
+#define OPT_GET_SUBITEM(opts_)	((opts_) & OPT_SUBITEM_MASK)
+
+#define OPT_ITEM_MASK		(15U << 16)
+#define OPT_ITEM_NA		(0U << 16)
+#define OPT_ITEM_NODE1		(1U << 16)
+#define OPT_ITEM_NODE2		(2U << 16)
+#define OPT_ITEM_NODE3		(3U << 16)
+#define OPT_ITEM_NODE4		(4U << 16)
+#define OPT_ITEM_NODE5		(5U << 16)
+#define OPT_ITEM_NODE6		(6U << 16)
+#define OPT_ITEM_NODE7		(7U << 16)
+#define OPT_ITEM_NODE8		(8U << 16)
+#define OPT_ITEM_NODE9		(9U << 16)
+#define OPT_GET_ITEM(opts_)	((opts_) & OPT_ITEM_MASK)
+
+struct subnode_props {
+	size_t p_prop;
+};
+
+struct node_props {
+	size_t p_prop1;
+	size_t p_prop2;
+	size_t p_prop3;
+	size_t p_propnew;
+	struct subnode_props subnode1_props;
+	struct subnode_props subnode2_props;
+	struct subnode_props subnode3_props;
+};
+
+static size_t build_unknown_tags_fill_property(struct buf *b, uint32_t options)
+{
+	size_t orig_proplen, new_proplen;
+	size_t block_size;
+	size_t p_prop;
+	const char *propstr;
+	size_t i;
+
+	/* Handle the property itself */
+	switch (OPT_GET_OP(options)) {
+	case OPT_OP_NOMODIF:
+		/* The original value has to be set */
+		p_prop = emit_prop_str(b, 0, PROP_ORIGIN_VALUE);
+		break;
+
+	case OPT_OP_MODIFY:
+		switch (OPT_GET_MODIFY_PARAM(options)) {
+		case OPT_OP_MODIFY_PARAM_LEN1:
+			propstr = PROP_LEN1_VALUE;
+			break;
+		case OPT_OP_MODIFY_PARAM_LEN2:
+			propstr = PROP_LEN2_VALUE;
+			break;
+		case OPT_OP_MODIFY_PARAM_LEN3:
+			propstr = PROP_LEN3_VALUE;
+			break;
+		case OPT_OP_MODIFY_PARAM_LEN4:
+			propstr = PROP_LEN4_VALUE;
+			break;
+		case OPT_OP_MODIFY_PARAM_LEN5:
+			propstr = PROP_LEN5_VALUE;
+			break;
+		default:
+			/* Should not happen */
+			propstr = PROP_ORIGIN_VALUE;
+			break;
+		}
+		/* The property will be modified and checked by the test */
+		p_prop = emit_prop_str(b, 0, propstr);
+
+		if (OPT_IS_NOPIFY_OP(options)) {
+			orig_proplen = strlen(PROP_ORIGIN_VALUE) + 1;
+			orig_proplen = (orig_proplen + FDT_TAGSIZE - 1) & ~(FDT_TAGSIZE - 1);
+
+			new_proplen = strlen(propstr) + 1;
+			new_proplen = (orig_proplen + FDT_TAGSIZE - 1) & ~(FDT_TAGSIZE - 1);
+
+			if (new_proplen < orig_proplen) {
+				block_size = orig_proplen - new_proplen;
+
+				assert(block_size % sizeof(fdt32_t) == 0);
+
+				for (i = 0; i < block_size; i += sizeof(fdt32_t))
+					emit_u32(b, FDT_NOP);
+			}
+		}
+		break;
+
+	case OPT_OP_ADD:
+		/* The property will be added and checked by the test */
+		p_prop = emit_prop_str(b, 0, "added");
+		break;
+
+	case OPT_OP_REMOVE:
+		p_prop = 0;
+		if (OPT_IS_NOPIFY_OP(options)) {
+			/* We have to remove :
+			 *   - FDT_PROP tag (1 x fdt32_t)
+			 *   - 'len' field  (1 x fdt32_t)
+			 *   - 'nameoff' field (1 x fdt32_t)
+			 *   - data (N x 8bit) -> strlen("original-value") + 1
+			 *   - padding to be aligned on FDT_TAGSIZE
+			 *
+			 * This block has to be replaced by FDT_NOPs
+			 */
+			block_size = 3 * sizeof(fdt32_t) +
+				     strlen(PROP_ORIGIN_VALUE) + 1;
+			block_size = (block_size + FDT_TAGSIZE - 1) & ~(FDT_TAGSIZE - 1);
+
+			assert(block_size % sizeof(fdt32_t) == 0);
+
+			for (i = 0; i < block_size; i += sizeof(fdt32_t))
+				emit_u32(b, FDT_NOP);
+		}
+		break;
+	default:
+		/* Unknown operation */
+		return 0;
+	}
+
+	if (!OPT_IS_UNKNOWN_TAGS_ALLOWED(options) ||
+	    !OPT_IS_UNKNOWN_TAGS_AT_PROPS(options)) {
+		/* No unknown tags related to the property. We've done. */
+		return p_prop;
+	}
+
+	/* Handle unknown tags related to this property */
+	switch (OPT_GET_OP(options)) {
+	case OPT_OP_NOMODIF:
+		/* Add unknown tags (and potential extra NOPs) */
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+
+		emit_u32(b, FDT_TEST_NONE);
+
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+
+		emit_u32(b, FDT_TEST_VARLEN);
+		emit_u32(b, 3);
+		emit_bytes(b, (const uint8_t []){0x20,0x20,0x20}, 3);
+		emit_align(b, FDT_TAGSIZE);
+
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+
+		emit_u32(b, FDT_TEST_1FDT32);
+		emit_u32(b, 0x21);
+
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+		break;
+
+	case OPT_OP_MODIFY:
+	case OPT_OP_REMOVE:
+		/*
+		 * The property will be modified or removed by the test
+		 * -> Remove unknown tags
+		 *
+		 * Added FDT_NOP are kept (those are "known" tags)
+		 */
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+
+		if (OPT_IS_NOPIFY_OP(options)) {
+			/* We have to remove:
+			 * - FDT_TEST_NONE (1 x fdt32_t)
+			 */
+			emit_u32(b, FDT_NOP);
+		}
+
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+
+		if (OPT_IS_NOPIFY_OP(options)) {
+			/* We have to remove:
+			 * - FDT_TEST_VARLEN (1 x fdt32_t)
+			 *   - len (1 x fdt32_t)
+			 *   - 3 bytes
+			 *   - padding byte to be aligned on FDT_TAGSIZE
+			 */
+			block_size = 2 * sizeof(fdt32_t) + 3;
+			block_size = (block_size + FDT_TAGSIZE - 1) & ~(FDT_TAGSIZE - 1);
+
+			assert(block_size % sizeof(fdt32_t) == 0);
+
+			for (i = 0; i < block_size; i += sizeof(fdt32_t))
+				emit_u32(b, FDT_NOP);
+		}
+
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+
+		if (OPT_IS_NOPIFY_OP(options)) {
+			/* We have to remove:
+			 * - FDT_TEST_1FDT32 (1 x fdt32_t)
+			 *   - 1 x fdt32_t
+			 */
+			emit_u32(b, FDT_NOP);
+			emit_u32(b, FDT_NOP);
+		}
+
+		if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+			emit_u32(b, FDT_NOP);
+
+		break;
+
+	case OPT_OP_ADD:
+		/* The property will be added and checked by the test */
+		break;
+
+	default:
+		/* Unknown operation */
+		break;
+	}
+
+	return p_prop;
+}
+
+static void build_unknown_tags_fill_subnode(struct buf *b, const char *nodename,
+					    struct subnode_props *subnode_props,
+					    uint32_t options)
+{
+	size_t block_size;
+	size_t i;
+
+	subnode_props->p_prop = 0;
+
+	/* Handle the subnode itself */
+	switch (OPT_GET_OP(options)) {
+	case OPT_OP_NOMODIF:
+		/* The original value has to be set */
+		emit_begin_node(b, nodename);
+			if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options) &&
+			    OPT_IS_UNKNOWN_TAGS_AT_SUBNODES(options)) {
+				emit_u32(b, FDT_TEST_1FDT32);
+				emit_u32(b, 0x30);
+			}
+			subnode_props->p_prop = emit_prop_nil(b, 0);
+		emit_end_node(b);
+
+		/*
+		 * We don't know the exact related item for this tag located
+		 * right after a FDT_END_NODE.
+		 * Indeed the relationship definition is:
+		 *  - Out of any node -> Global. Not in this case
+		 *  - Right after FDT_PROP -> Property. Not this case
+		 *  - Right after FDT_BEGIN_NODE -> Node. Not this case
+		 *
+		 * Anyway, when the node is removed, this tag should be removed
+		 * as well. Indeed, if it is kept, it could be added to previous
+		 * node or previous property. Added to a previous property is
+		 * wrong. It changes the semantic from "we don't know what is
+		 * the related object" to "the related object is the property".
+		 */
+		if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options) &&
+		    OPT_IS_UNKNOWN_TAGS_AFTER_SUBNODES(options)) {
+			emit_u32(b, FDT_TEST_2FDT32);
+			emit_u32(b, 0x40);
+			emit_u32(b, 0x40);
+		}
+		break;
+
+	case OPT_OP_ADD:
+		/* The node will be added and checked by the test */
+		emit_begin_node(b, nodename);
+		emit_end_node(b);
+		break;
+
+	case OPT_OP_REMOVE:
+		if (OPT_IS_NOPIFY_OP(options)) {
+			/* We have to remove :
+			 *   - FDT_BEGIN_NODE tag (1 x fdt32_t)
+			 *     - 'nodename' (N x 8bit) -> strlen(nodename) + 1
+			 *     - padding to be aligned on FDT_TAGSIZE
+			 *   - If unknown tags were added
+			 *       - FDT_TEST_1FDT32 (1 x fdt32_t)
+			 *         - 1 x fdt32_t
+			 *   - FDT_PROP tag (1 x fdt32_t)
+			 *     - 'len' field  (1 x fdt32_t)
+			 *     - 'nameoff' field (1 x fdt32_t)
+			 *     - data (N x 8bit) -> 0 as we use a boolean property
+			 *     - padding to be aligned on FDT_TAGSIZE (already aligned)
+			 *   - FDT_END_NODE tag (1 x fdt32_t)
+			 *   - If unknown tags were added
+			 *     - FDT_TEST_2FDT32 (1 x fdt32_t)
+			 *       - 2 x fdt32_t
+			 *
+			 * This block has to be replaced by FDT_NOPs
+			 */
+			block_size = sizeof(fdt32_t) +
+				     strlen(nodename) + 1;
+			block_size = (block_size + FDT_TAGSIZE - 1) & ~(FDT_TAGSIZE - 1);
+			if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options) &&
+			    OPT_IS_UNKNOWN_TAGS_AT_SUBNODES(options)) {
+				block_size += 2 * sizeof(fdt32_t);
+			}
+			block_size += 4 * sizeof(fdt32_t);
+			if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options) &&
+			    OPT_IS_UNKNOWN_TAGS_AFTER_SUBNODES(options)) {
+				block_size += 3 * sizeof(fdt32_t);
+			}
+
+			assert(block_size % sizeof(fdt32_t) == 0);
+
+			for (i = 0; i < block_size; i += sizeof(fdt32_t))
+				emit_u32(b, FDT_NOP);
+		}
+		break;
+
+	default:
+		/* Unknown operation */
+		break;
+	}
+}
+
+static void build_unknown_tags_fill_node(struct buf *b, bool is_props, bool is_subnodes,
+					 struct node_props *node_props, uint32_t options)
+{
+	struct subnode_props dummy_subnode_props;
+	uint32_t subitem_options;
+	bool is_unknown_tags;
+
+	if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options) &&
+	    OPT_IS_UNKNOWN_TAGS_AT_NODE(options)) {
+		/*
+		 * Unknown tags related to nodes are allowed
+		 * Suppose that we should remove them by default
+		 */
+		is_unknown_tags = false;
+
+		switch (OPT_GET_OP(options)) {
+		case OPT_OP_NOMODIF:
+			/* Original value. Add unknown tags */
+			is_unknown_tags = true;
+			break;
+
+		case OPT_OP_MODIFY:
+			if (!is_props)
+				break; /* No properties on this node */
+
+			switch (OPT_GET_SUBITEM(options)) {
+			case OPT_SUBITEM_PROP1:
+			case OPT_SUBITEM_PROP2:
+			case OPT_SUBITEM_PROP3:
+				/*
+				 * Node related tags are kept on property
+				 * modification
+				 */
+				is_unknown_tags = true;
+				break;
+			default:
+				break;
+			}
+			break;
+		default:
+			break;
+		}
+
+		if (is_unknown_tags) {
+			/* Add unknown tags (and potential extra NOPs) */
+			if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+				emit_u32(b, FDT_NOP);
+
+			emit_u32(b, FDT_TEST_2FDT32);
+			emit_u32(b, 0x10);
+			emit_u32(b, 0x10);
+
+			if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+				emit_u32(b, FDT_NOP);
+
+			emit_u32(b, FDT_TEST_1FDT32);
+			emit_u32(b, 0x11);
+
+			if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+				emit_u32(b, FDT_NOP);
+		} else {
+			/*
+			 * Remove unknown tags
+			 * Added FDT_NOP are kept (those are "known" tags)
+			 */
+			if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+				emit_u32(b, FDT_NOP);
+
+			if (OPT_IS_NOPIFY_OP(options)) {
+				/* We have to remove :
+				 *   - FDT_TEST_2FDT32 (1 x fdt32_t)
+				 *       - 2 x fdt32_t
+				 *
+				 * This block has to be replaced by FDT_NOPs
+				 */
+				emit_u32(b, FDT_NOP);
+				emit_u32(b, FDT_NOP);
+				emit_u32(b, FDT_NOP);
+			}
+
+			if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+				emit_u32(b, FDT_NOP);
+
+			if (OPT_IS_NOPIFY_OP(options)) {
+				/*
+				 *   - FDT_TEST_1FDT32 (1 x fdt32_t)
+				 *       - 1 x fdt32_t
+				 *
+				 * This block has to be replaced by FDT_NOPs
+				 */
+				emit_u32(b, FDT_NOP);
+				emit_u32(b, FDT_NOP);
+			}
+
+			if (OPT_IS_UNKNOWN_TAGS_AND_NOPS(options))
+				emit_u32(b, FDT_NOP);
+		}
+	}
+
+	/*
+	 * Properties added by tests (libfdt) are added before existing
+	 * properties
+	 */
+	node_props->p_propnew = 0;
+	if ((OPT_GET_OP(options) == OPT_OP_ADD) &&
+	    (OPT_GET_SUBITEM(options) == OPT_SUBITEM_PROPNEW)) {
+		node_props->p_propnew = build_unknown_tags_fill_property(b, options);
+	}
+
+	node_props->p_prop1 = 0;
+	node_props->p_prop2 = 0;
+	node_props->p_prop3 = 0;
+	if (is_props) {
+		/* Add the prop1 property */
+		subitem_options = options;
+		if (OPT_GET_SUBITEM(options) != OPT_SUBITEM_PROP1) {
+			subitem_options &= ~(OPT_OP_TYPE_MASK | OPT_SUBITEM_MASK);
+			subitem_options |= OPT_OP_NOMODIF | OPT_SUBITEM_PROP1;
+		}
+		node_props->p_prop1 = build_unknown_tags_fill_property(b, subitem_options);
+
+		/* Add the prop2 property */
+		subitem_options = options;
+		if (OPT_GET_SUBITEM(options) != OPT_SUBITEM_PROP2) {
+			subitem_options &= ~(OPT_OP_TYPE_MASK | OPT_SUBITEM_MASK);
+			subitem_options |= OPT_OP_NOMODIF | OPT_SUBITEM_PROP2;
+		}
+		node_props->p_prop2 = build_unknown_tags_fill_property(b, subitem_options);
+
+		/* Add the prop3 property */
+		subitem_options = options;
+		if (OPT_GET_SUBITEM(options) != OPT_SUBITEM_PROP3) {
+			subitem_options &= ~(OPT_OP_TYPE_MASK | OPT_SUBITEM_MASK);
+			subitem_options |= OPT_OP_NOMODIF | OPT_SUBITEM_PROP3;
+		}
+		node_props->p_prop3 = build_unknown_tags_fill_property(b, subitem_options);
+	}
+
+	/*
+	 * Nodes added by tests (libfdt) are added between existing properties
+	 * and the first existing node
+	 */
+	if ((OPT_GET_OP(options) == OPT_OP_ADD) &&
+	    (OPT_GET_SUBITEM(options) == OPT_SUBITEM_SUBNODENEW)) {
+		build_unknown_tags_fill_subnode(b, "subnodenew",
+						&dummy_subnode_props,
+						options);
+	}
+
+	memset(&node_props->subnode1_props, 0, sizeof(node_props->subnode1_props));
+	memset(&node_props->subnode2_props, 0, sizeof(node_props->subnode2_props));
+	memset(&node_props->subnode3_props, 0, sizeof(node_props->subnode3_props));
+	if (is_subnodes) {
+		/* Add the subnode1 node */
+		subitem_options = options;
+		if (OPT_GET_SUBITEM(options) != OPT_SUBITEM_SUBNODE1) {
+			subitem_options &= ~(OPT_OP_TYPE_MASK | OPT_SUBITEM_MASK);
+			subitem_options |= OPT_OP_NOMODIF | OPT_SUBITEM_SUBNODE1;
+		}
+		build_unknown_tags_fill_subnode(b, "subnode1",
+						&node_props->subnode1_props,
+						subitem_options);
+
+		/* Add the subnode2 node */
+		subitem_options = options;
+		if (OPT_GET_SUBITEM(options) != OPT_SUBITEM_SUBNODE2) {
+			subitem_options &= ~(OPT_OP_TYPE_MASK | OPT_SUBITEM_MASK);
+			subitem_options |= OPT_OP_NOMODIF | OPT_SUBITEM_SUBNODE2;
+		}
+		build_unknown_tags_fill_subnode(b, "subnode2",
+						&node_props->subnode2_props,
+						subitem_options);
+
+		/* Add the subnode3 node */
+		subitem_options = options;
+		if (OPT_GET_SUBITEM(options) != OPT_SUBITEM_SUBNODE3) {
+			subitem_options &= ~(OPT_OP_TYPE_MASK | OPT_SUBITEM_MASK);
+			subitem_options |= OPT_OP_NOMODIF | OPT_SUBITEM_SUBNODE3;
+		}
+		build_unknown_tags_fill_subnode(b, "subnode3",
+						&node_props->subnode3_props,
+						subitem_options);
+	}
+}
+
+static void build_unknown_tags_create_node(struct buf *b, uint32_t options,
+					   uint32_t item_option,
+					   const char *node_name,
+					   struct node_props *node_props,
+					   bool is_props, bool is_subnodes)
+{
+	uint32_t node_options = options;
+
+	emit_begin_node(b, node_name);
+		if (OPT_GET_ITEM(options) != item_option) {
+			node_options &= ~(OPT_OP_TYPE_MASK | OPT_ITEM_MASK | OPT_SUBITEM_MASK);
+			node_options |= OPT_OP_NOMODIF | item_option | OPT_SUBITEM_NA;
+		}
+		build_unknown_tags_fill_node(b, is_props, is_subnodes,
+					     node_props, node_options);
+	emit_end_node(b);
+}
+
+static struct buf build_unknown_tags_tree(uint32_t options)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p_info;
+	struct node_props node1_props;
+	struct node_props node2_props;
+	struct node_props node3_props;
+	struct node_props node4_props;
+	struct node_props node5_props;
+	struct node_props node6_props;
+	struct node_props node7_props;
+	struct node_props node8_props;
+	struct node_props node9_props;
+
+	if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options) &&
+	    OPT_GET_OP(options) == OPT_OP_NOMODIF)
+		hdr = emit_fdt_header_vers(&b, 0xffffffff, 0x10);
+	else
+		hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options)) {
+			emit_u32(&b, FDT_TEST_1FDT32);
+			emit_u32(&b, 0x01);
+		}
+
+		emit_begin_node(&b, "");
+			if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options))
+				emit_u32(&b, FDT_TEST_NONE);
+
+			p_info = emit_prop_str(&b, 0, "!! Unknown tags are present here and there !!");
+
+			if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options)) {
+				emit_u32(&b, FDT_TEST_1FDT32);
+				emit_u32(&b, 0x02);
+
+				emit_u32(&b, FDT_TEST_2FDT32);
+				emit_u32(&b, 0x03);
+				emit_u32(&b, 0x03);
+
+				emit_u32(&b, FDT_TEST_VARLEN);
+				emit_u32(&b, 3);
+				emit_bytes(&b, (const uint8_t []){0x04,0x04,0x04}, 3);
+				emit_align(&b, FDT_TAGSIZE);
+			}
+
+			build_unknown_tags_create_node(&b, options,
+						       OPT_ITEM_NODE1,
+						       "node1", &node1_props,
+						       true, true);
+
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_PROPS,
+						       OPT_ITEM_NODE2,
+						       "node2", &node2_props,
+						       true, true);
+
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_NODE,
+						       OPT_ITEM_NODE3,
+						       "node3", &node3_props,
+						       true, true);
+
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_PROPS |
+						       OPT_UNKNOWN_TAGS_AT_NODE,
+						       OPT_ITEM_NODE4,
+						       "node4", &node4_props,
+						       true, true);
+
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_PROPS |
+						       OPT_UNKNOWN_TAGS_AT_NODE |
+						       OPT_UNKNOWN_TAGS_AT_SUBNODES |
+						       OPT_UNKNOWN_TAGS_AFTER_SUBNODES,
+						       OPT_ITEM_NODE5,
+						       "node5", &node5_props,
+						       true, true);
+
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_PROPS |
+						       OPT_UNKNOWN_TAGS_AT_NODE |
+						       OPT_UNKNOWN_TAGS_AT_SUBNODES |
+						       OPT_UNKNOWN_TAGS_AFTER_SUBNODES |
+						       OPT_UNKNOWN_TAGS_AND_NOPS,
+						       OPT_ITEM_NODE6,
+						       "node6", &node6_props,
+						       true, true);
+
+			/* Properties only node */
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_PROPS |
+						       OPT_UNKNOWN_TAGS_AT_NODE |
+						       OPT_UNKNOWN_TAGS_AND_NOPS,
+						       OPT_ITEM_NODE7,
+						       "node7", &node7_props,
+						       true, false);
+
+			/* Subnodes only node */
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_NODE |
+						       OPT_UNKNOWN_TAGS_AT_SUBNODES |
+						       OPT_UNKNOWN_TAGS_AFTER_SUBNODES |
+						       OPT_UNKNOWN_TAGS_AND_NOPS,
+						       OPT_ITEM_NODE8,
+						       "node8", &node8_props,
+						       false, true);
+
+			/* Empty node */
+			build_unknown_tags_create_node(&b, options |
+						       OPT_UNKNOWN_TAGS_AT_NODE |
+						       OPT_UNKNOWN_TAGS_AND_NOPS,
+						       OPT_ITEM_NODE9,
+						       "node9", &node9_props,
+						       false, false);
+
+			if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options)) {
+				emit_u32(&b, FDT_TEST_VARLEN);
+				emit_u32(&b, 4);
+				emit_bytes(&b, (const uint8_t []){0x05,0x05,0x05,0x05}, 4);
+				emit_align(&b, FDT_TAGSIZE);
+			}
+		emit_end_node(&b);
+
+		if (OPT_IS_UNKNOWN_TAGS_ALLOWED(options)) {
+			emit_u32(&b, FDT_TEST_1FDT32);
+			emit_u32(&b, 0x06);
+
+			emit_u32(&b, FDT_TEST_VARLEN);
+			emit_u32(&b, 2);
+			emit_bytes(&b, (const uint8_t []){0x07,0x07}, 2);
+			emit_align(&b, FDT_TAGSIZE);
+		}
+
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		struct node_props *tab_node_props[] = {
+			&node1_props,
+			&node2_props,
+			&node3_props,
+			&node4_props,
+			&node5_props,
+			&node6_props,
+			&node7_props,
+			&node8_props,
+			&node9_props,
+		};
+		struct subnode_props *tab_subnode_props[] = {
+			&node1_props.subnode1_props,
+			&node1_props.subnode2_props,
+			&node1_props.subnode3_props,
+			&node2_props.subnode1_props,
+			&node2_props.subnode2_props,
+			&node2_props.subnode3_props,
+			&node3_props.subnode1_props,
+			&node3_props.subnode2_props,
+			&node3_props.subnode3_props,
+			&node4_props.subnode1_props,
+			&node4_props.subnode2_props,
+			&node4_props.subnode3_props,
+			&node5_props.subnode1_props,
+			&node5_props.subnode2_props,
+			&node5_props.subnode3_props,
+			&node6_props.subnode1_props,
+			&node6_props.subnode2_props,
+			&node6_props.subnode3_props,
+			&node7_props.subnode1_props,
+			&node7_props.subnode2_props,
+			&node7_props.subnode3_props,
+			&node8_props.subnode1_props,
+			&node8_props.subnode2_props,
+			&node8_props.subnode3_props,
+			&node9_props.subnode1_props,
+			&node9_props.subnode2_props,
+			&node9_props.subnode3_props,
+		};
+		size_t strs = start_block(&b);
+		size_t s;
+		unsigned int i;
+
+		s = emit_string(&b, "info");
+		fill_prop_name(&b, strs, p_info, s);
+
+		s = emit_string(&b, "prop1");
+		for (i = 0; i < ARRAY_SIZE(tab_node_props); i++) {
+			if (tab_node_props[i]->p_prop1)
+				fill_prop_name(&b, strs, tab_node_props[i]->p_prop1, s);
+		}
+		s = emit_string(&b, "prop2");
+		for (i = 0; i < ARRAY_SIZE(tab_node_props); i++) {
+			if (tab_node_props[i]->p_prop2)
+				fill_prop_name(&b, strs, tab_node_props[i]->p_prop2, s);
+		}
+
+		s = emit_string(&b, "prop3");
+		for (i = 0; i < ARRAY_SIZE(tab_node_props); i++) {
+			if (tab_node_props[i]->p_prop3)
+				fill_prop_name(&b, strs, tab_node_props[i]->p_prop3, s);
+		}
+
+		s = emit_string(&b, "propnew");
+		for (i = 0; i < ARRAY_SIZE(tab_node_props); i++) {
+			if (tab_node_props[i]->p_propnew)
+				fill_prop_name(&b, strs, tab_node_props[i]->p_propnew, s);
+		}
+
+		s = emit_string(&b, "prop");
+		for (i = 0; i < ARRAY_SIZE(tab_subnode_props); i++) {
+			if (tab_subnode_props[i]->p_prop)
+				fill_prop_name(&b, strs, tab_subnode_props[i]->p_prop, s);
+		}
+
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+/* Macros to create a generator and the related treegen table entry */
+#define MAKE_UNKNOWN_TAGS(suffix, options) \
+static struct buf make_unknown_tags_##suffix(void) \
+{ \
+	return build_unknown_tags_tree(options); \
+}
+
+#define TREE_UNKNOWN_TAGS(suffix) \
+	{ \
+		.generator = make_unknown_tags_##suffix, \
+		.filename = "unknown_tags_"#suffix".dtb", \
+	}
+
+/*
+ * Macros to create a generator of expected modification and related treegen
+ * table entry.
+ */
+#define MAKE_UNKNOWN_TAGS_EXPECTED(mode, item, subitem, variant, options) \
+	MAKE_UNKNOWN_TAGS(mode##_##item##_##subitem##_##variant, (options) | OPT_ALLOW_UNKNOWN_TAGS)
+#define TREE_UNKNOWN_TAGS_EXPECTED(mode, item, subitem, variant) \
+	TREE_UNKNOWN_TAGS(mode##_##item##_##subitem##_##variant)
+
+/*
+ * Macros to create generators of expected rw modification and related treegen
+ * table entries.
+ */
+#define MAKE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, variant, options) \
+	MAKE_UNKNOWN_TAGS_EXPECTED(rw, item, subitem, variant, (options) | OPT_MODE_SPLICE)
+#define TREE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, variant) \
+	TREE_UNKNOWN_TAGS_EXPECTED(rw, item, subitem, variant)
+
+#define MAKE_UNKNOWN_TAGS_RW_MODIFIED_EXPECTED(item, subitem, options) \
+	MAKE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, modified, \
+				      (options) | OPT_OP_MODIFY | OPT_OP_MODIFY_PARAM_NA)
+#define TREE_UNKNOWN_TAGS_RW_MODIFIED_EXPECTED(item, subitem) \
+	TREE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, modified)
+
+#define MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, subitem, param, options) \
+	MAKE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, concat(modified_, SUFFIX_##param), \
+				      (options) | OPT_OP_MODIFY | OPT_OP_MODIFY_PARAM_##param)
+#define TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, subitem, param) \
+	TREE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, concat(modified_, SUFFIX_##param))
+
+#define MAKE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subitem, options) \
+	MAKE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, removed, (options) | OPT_OP_REMOVE)
+#define TREE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subitem) \
+	TREE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, removed)
+
+#define MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subitem, options) \
+	MAKE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, added, (options) | OPT_OP_ADD)
+#define TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subitem) \
+	TREE_UNKNOWN_TAGS_RW_EXPECTED(item, subitem, added)
+
+#define MAKE_UNKNOWN_TAGS_RW_NODE_PROPS_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN1, (options) | OPT_SUBITEM_PROP1) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN2, (options) | OPT_SUBITEM_PROP1) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN3, (options) | OPT_SUBITEM_PROP1) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN4, (options) | OPT_SUBITEM_PROP1) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN5, (options) | OPT_SUBITEM_PROP1) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN1, (options) | OPT_SUBITEM_PROP2) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN2, (options) | OPT_SUBITEM_PROP2) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN3, (options) | OPT_SUBITEM_PROP2) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN4, (options) | OPT_SUBITEM_PROP2) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN5, (options) | OPT_SUBITEM_PROP2) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN1, (options) | OPT_SUBITEM_PROP3) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN2, (options) | OPT_SUBITEM_PROP3) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN3, (options) | OPT_SUBITEM_PROP3) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN4, (options) | OPT_SUBITEM_PROP3) \
+	MAKE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN5, (options) | OPT_SUBITEM_PROP3) \
+	MAKE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, prop1, (options) | OPT_SUBITEM_PROP1) \
+	MAKE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, prop2, (options) | OPT_SUBITEM_PROP2) \
+	MAKE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, prop3, (options) | OPT_SUBITEM_PROP3)
+#define TREE_UNKNOWN_TAGS_RW_NODE_PROPS_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN1), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN2), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN3), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN4), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop1, LEN5), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN1), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN2), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN3), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN4), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop2, LEN5), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN1), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN2), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN3), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN4), \
+	TREE_UNKNOWN_TAGS_RW_MODIFIED_PARAM_EXPECTED(item, prop3, LEN5), \
+	TREE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, prop1), \
+	TREE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, prop2), \
+	TREE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, prop3)
+
+#define MAKE_UNKNOWN_TAGS_RW_NODE_SUBNODES_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subnode1, (options) | OPT_SUBITEM_SUBNODE1) \
+	MAKE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subnode2, (options) | OPT_SUBITEM_SUBNODE2) \
+	MAKE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subnode3, (options) | OPT_SUBITEM_SUBNODE3)
+#define TREE_UNKNOWN_TAGS_RW_NODE_SUBNODES_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subnode1), \
+	TREE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subnode2), \
+	TREE_UNKNOWN_TAGS_RW_REMOVED_EXPECTED(item, subnode3)
+
+#define MAKE_UNKNOWN_TAGS_RW_NODE_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_NODE_PROPS_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_NODE_SUBNODES_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew, (options) | OPT_SUBITEM_PROPNEW) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew, (options) | OPT_SUBITEM_SUBNODENEW)
+#define TREE_UNKNOWN_TAGS_RW_NODE_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_RW_NODE_PROPS_EXPECTED(item), \
+	TREE_UNKNOWN_TAGS_RW_NODE_SUBNODES_EXPECTED(item), \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew), \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew)
+
+#define MAKE_UNKNOWN_TAGS_RW_NODE_PROPS_ONLY_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_NODE_PROPS_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew, (options) | OPT_SUBITEM_PROPNEW) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew, (options) | OPT_SUBITEM_SUBNODENEW)
+#define TREE_UNKNOWN_TAGS_RW_NODE_PROPS_ONLY_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_RW_NODE_PROPS_EXPECTED(item), \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew), \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew)
+
+#define MAKE_UNKNOWN_TAGS_RW_NODE_SUBNODES_ONLY_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_NODE_SUBNODES_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew, (options) | OPT_SUBITEM_PROPNEW) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew, (options) | OPT_SUBITEM_SUBNODENEW)
+#define TREE_UNKNOWN_TAGS_RW_NODE_SUBNODES_ONLY_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_RW_NODE_SUBNODES_EXPECTED(item), \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew), \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew)
+
+#define MAKE_UNKNOWN_TAGS_RW_NODE_EMPTY_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew, (options) | OPT_SUBITEM_PROPNEW) \
+	MAKE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew, (options) | OPT_SUBITEM_SUBNODENEW)
+#define TREE_UNKNOWN_TAGS_RW_NODE_EMPTY_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, propnew), \
+	TREE_UNKNOWN_TAGS_RW_ADDED_EXPECTED(item, subnodenew)
+
+/*
+ * Macros to create generators of expected wip (write-in-place) modification
+ * and related treegen table entries.
+ */
+#define MAKE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, variant, options) \
+	MAKE_UNKNOWN_TAGS_EXPECTED(wip, item, subitem, variant, (options) | OPT_MODE_NOPIFY)
+#define TREE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, variant) \
+	TREE_UNKNOWN_TAGS_EXPECTED(wip, item, subitem, variant)
+
+#define MAKE_UNKNOWN_TAGS_WIP_MODIFIED_EXPECTED(item, subitem, options) \
+	MAKE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, modified, \
+				       (options) | OPT_OP_MODIFY | OPT_OP_MODIFY_PARAM_NA)
+#define TREE_UNKNOWN_TAGS_WIP_MODIFIED_EXPECTED(item, subitem) \
+	TREE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, modified)
+
+#define MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, subitem, param, options) \
+	MAKE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, concat(modified_, SUFFIX_##param), \
+				       (options) | OPT_OP_MODIFY | OPT_OP_MODIFY_PARAM_##param)
+#define TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, subitem, param) \
+	TREE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, concat(modified_, SUFFIX_##param))
+
+#define MAKE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subitem, options) \
+	MAKE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, removed, (options) | OPT_OP_REMOVE)
+#define TREE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subitem) \
+	TREE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, removed)
+
+#define MAKE_UNKNOWN_TAGS_WIP_ADDED_EXPECTED(item, subitem, options) \
+	MAKE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, added, (options) | OPT_OP_ADD)
+#define TREE_UNKNOWN_TAGS_WIP_ADDED_EXPECTED(item, subitem) \
+	TREE_UNKNOWN_TAGS_WIP_EXPECTED(item, subitem, added)
+
+#define MAKE_UNKNOWN_TAGS_WIP_NODE_PROPS_EXPECTED(item, options) \
+	/* \
+	 * LEN1 and LEN2 reduce original data. This is not supported by \
+	 * write-in-place functions. \
+	 * \
+	 * Do not generate unneeded files \
+	 */ \
+	/*MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop1, LEN1, (options) | OPT_SUBITEM_PROP1)*/ \
+	/*MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop1, LEN2, (options) | OPT_SUBITEM_PROP1)*/ \
+	MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop1, LEN3, (options) | OPT_SUBITEM_PROP1) \
+	/*MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop2, LEN1, (options) | OPT_SUBITEM_PROP2)*/ \
+	/*MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop2, LEN2, (options) | OPT_SUBITEM_PROP2)*/ \
+	MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop2, LEN3, (options) | OPT_SUBITEM_PROP2) \
+	/*MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop3, LEN1, (options) | OPT_SUBITEM_PROP3)*/ \
+	/*MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop3, LEN2, (options) | OPT_SUBITEM_PROP3)*/ \
+	MAKE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop3, LEN3, (options) | OPT_SUBITEM_PROP3) \
+	MAKE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, prop1, (options) | OPT_SUBITEM_PROP1) \
+	MAKE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, prop2, (options) | OPT_SUBITEM_PROP2) \
+	MAKE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, prop3, (options) | OPT_SUBITEM_PROP3)
+#define TREE_UNKNOWN_TAGS_WIP_NODE_PROPS_EXPECTED(item) \
+	/*TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop1, LEN1),*/ \
+	/*TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop1, LEN2),*/ \
+	TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop1, LEN3), \
+	/*TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop2, LEN1),*/ \
+	/*TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop2, LEN2),*/ \
+	TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop2, LEN3), \
+	/*TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop3, LEN1),*/ \
+	/*TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop3, LEN2),*/ \
+	TREE_UNKNOWN_TAGS_WIP_MODIFIED_PARAM_EXPECTED(item, prop3, LEN3), \
+	TREE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, prop1), \
+	TREE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, prop2), \
+	TREE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, prop3)
+
+#define MAKE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subnode1, (options) | OPT_SUBITEM_SUBNODE1) \
+	MAKE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subnode2, (options) | OPT_SUBITEM_SUBNODE2) \
+	MAKE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subnode3, (options) | OPT_SUBITEM_SUBNODE3)
+#define TREE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subnode1), \
+	TREE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subnode2), \
+	TREE_UNKNOWN_TAGS_WIP_REMOVED_EXPECTED(item, subnode3)
+
+#define MAKE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_WIP_NODE_PROPS_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_EXPECTED(item, options)
+#define TREE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_WIP_NODE_PROPS_EXPECTED(item), \
+	TREE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_EXPECTED(item)
+
+#define MAKE_UNKNOWN_TAGS_WIP_NODE_PROPS_ONLY_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_WIP_NODE_PROPS_EXPECTED(item, options)
+#define TREE_UNKNOWN_TAGS_WIP_NODE_PROPS_ONLY_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_WIP_NODE_PROPS_EXPECTED(item)
+
+#define MAKE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_ONLY_EXPECTED(item, options) \
+	MAKE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_EXPECTED(item, options)
+#define TREE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_ONLY_EXPECTED(item) \
+	TREE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_EXPECTED(item)
+
+/*
+ * Tree with "unknown" tags that can be skipped and tree with those
+ * "unknown" tags removed
+ */
+MAKE_UNKNOWN_TAGS(can_skip, OPT_ALLOW_UNKNOWN_TAGS | OPT_OP_NOMODIF)
+MAKE_UNKNOWN_TAGS(removed, OPT_NO_UNKNOWN_TAGS | OPT_OP_NOMODIF)
+
+/*
+ * Trees with "unknown" tags expected by rw tests (fdtput)
+ * Removals (unknown tags, properties and/or node) are done by fully removing
+ * the item. I.e. libfdt splice equivalent.
+ */
+MAKE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node1, OPT_ITEM_NODE1)
+MAKE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node2, OPT_ITEM_NODE2)
+MAKE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node3, OPT_ITEM_NODE3)
+MAKE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node4, OPT_ITEM_NODE4)
+MAKE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node5, OPT_ITEM_NODE5)
+MAKE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node6, OPT_ITEM_NODE6)
+MAKE_UNKNOWN_TAGS_RW_NODE_PROPS_ONLY_EXPECTED(node7, OPT_ITEM_NODE7)
+MAKE_UNKNOWN_TAGS_RW_NODE_SUBNODES_ONLY_EXPECTED(node8, OPT_ITEM_NODE8)
+MAKE_UNKNOWN_TAGS_RW_NODE_EMPTY_EXPECTED(node9, OPT_ITEM_NODE9)
+
+/*
+ * Trees with "unknown" tags expected by wip tests (write-in-place)
+ * Removals (unknown tags, properties and/or node) are done by replacing the
+ * item with FDT_NOP.
+ */
+MAKE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node1, OPT_ITEM_NODE1)
+MAKE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node2, OPT_ITEM_NODE2)
+MAKE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node3, OPT_ITEM_NODE3)
+MAKE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node4, OPT_ITEM_NODE4)
+MAKE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node5, OPT_ITEM_NODE5)
+MAKE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node6, OPT_ITEM_NODE6)
+MAKE_UNKNOWN_TAGS_WIP_NODE_PROPS_ONLY_EXPECTED(node7, OPT_ITEM_NODE7)
+MAKE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_ONLY_EXPECTED(node8, OPT_ITEM_NODE8)
+
+/* Tree generators */
+static const struct treegen treegens[] = {
+	TREE_UNKNOWN_TAGS(can_skip),
+	TREE_UNKNOWN_TAGS(removed),
+	TREE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node1),
+	TREE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node2),
+	TREE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node3),
+	TREE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node4),
+	TREE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node5),
+	TREE_UNKNOWN_TAGS_RW_NODE_EXPECTED(node6),
+	TREE_UNKNOWN_TAGS_RW_NODE_PROPS_ONLY_EXPECTED(node7),
+	TREE_UNKNOWN_TAGS_RW_NODE_SUBNODES_ONLY_EXPECTED(node8),
+	TREE_UNKNOWN_TAGS_RW_NODE_EMPTY_EXPECTED(node9),
+	TREE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node1),
+	TREE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node2),
+	TREE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node3),
+	TREE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node4),
+	TREE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node5),
+	TREE_UNKNOWN_TAGS_WIP_NODE_EXPECTED(node6),
+	TREE_UNKNOWN_TAGS_WIP_NODE_PROPS_ONLY_EXPECTED(node7),
+	TREE_UNKNOWN_TAGS_WIP_NODE_SUBNODES_ONLY_EXPECTED(node8),
+};
+
+/* Harness */
+struct treeharness treeharness_unknown_tags = TREEHARNESS("unknown-tags", treegens);
-- 
2.56.1

