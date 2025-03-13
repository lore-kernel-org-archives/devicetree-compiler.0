Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2878C9C
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741892746; cv=none; b=MHJNgcYgntYdYM7OlAZFERi1mbp/PZx64sDFJ6rAZ4opmJ7oDYd89akqi3DNNsoT+s97eDLfnc7YfPyLN91aDXe8YQZfE/PYum1c0K1MSLXE4vuRwMWVAknJXrqN1rLtHrtJHVwkOsc6hg2ClBCHZM1mvTBwkfNazeTtZqtIwT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741892746; c=relaxed/simple;
	bh=IkSDiyNCT1W0/7TWmu2l6J8dO3giLvgjsLxxJBaW7EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FcyA/G0Kpp3T//eN3BLND4HU7GRHS+Bwmr27z6jkVlQL/Cvxke0V1V06g+ByTaDowl/5Ht/wFOFMqPwlYujTgASPTk9mzmQ5XUCLF8KdCB4SiFoPJUvliux6clJICfrQN8zPypQotaGzQUfrW42ynh641VU84hV7SmT0o/sOs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FR1VMzgn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FR1VMzgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741892743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b1bervsE7HHgFTdilDtimCk6KOn37+zzmuwawjRtHTQ=;
	b=FR1VMzgnQM8RzEPBrZViDTa9Kq64AFS8mObSsOhbdDcKVIOocG81/TWAO34X/CEqecGSul
	TjpMKRWgdXuTsO13R9ZtiW3G3DdRQid4z2mL2IwDYt4AyvzDRA1jz1HaWKsVm43RupgQhw
	4CcExvCs+OZs/nJ/mT2cXe3ibP10oQw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-3IZd9qAzPwqqIa91o7GJ4Q-1; Thu,
 13 Mar 2025 15:05:39 -0400
X-MC-Unique: 3IZd9qAzPwqqIa91o7GJ4Q-1
X-Mimecast-MFC-AGG-ID: 3IZd9qAzPwqqIa91o7GJ4Q_1741892738
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CF5719560B7
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:05:38 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.26])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C00C918001DE;
	Thu, 13 Mar 2025 19:05:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: devicetree-compiler@vger.kernel.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH] Remove duplicated words in documentation and comments
Date: Thu, 13 Mar 2025 20:05:27 +0100
Message-ID: <20250313190527.1556019-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Let's avoid repeating single words here!

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 CONTRIBUTING.md                      | 2 +-
 Documentation/dt-object-internal.txt | 2 +-
 libfdt/libfdt.h                      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 940dd1a..48c8efd 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -2,7 +2,7 @@
 
 There are two ways to submit changes for dtc or libfdt:
 
-* Post patches directly to the the
+* Post patches directly to the
   [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
   mailing list.
 * Submit pull requests via
diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object-internal.txt
index c7357e6..dbbbcea 100644
--- a/Documentation/dt-object-internal.txt
+++ b/Documentation/dt-object-internal.txt
@@ -6,7 +6,7 @@ the hardware capabilities. This is insufficient for platforms
 that need to dynamically insert Device Tree fragments into the
 live tree.
 
-This document explains the the Device Tree object format and
+This document explains the Device Tree object format and
 modifications made to the Device Tree compiler, which make it possible.
 
 1. Simplified Problem Definition
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index f2675b1..b5e7200 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1569,7 +1569,7 @@ static inline int fdt_property_cell(void *fdt, const char *name, uint32_t val)
  * @fdt: pointer to the device tree blob
  * @name: name of property to add
  * @len: length of property value in bytes
- * @valp: returns a pointer to where where the value should be placed
+ * @valp: returns a pointer to where the value should be placed
  *
  * returns:
  *	0, on success
-- 
2.48.1

