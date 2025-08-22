Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D0313545
	for <devicetree-compiler@vger.kernel.org>; Fri, 22 Aug 2025 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882654; cv=none; b=P/ML9WOROfde0kwQbhiO90ek72gIWBjczPNQxPcQtzgUfzGYPUOFfLrctIjM7STehoUiFQnZdlv0HvsDCdfBXbFY8kNzYNwsd4BVf0ptEUiOiz4vyDLMMH5wmiYLf7pxvVOmpL7JjIpeNYAogVwiNhDAI+xHOofnM1NHp5G6xbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882654; c=relaxed/simple;
	bh=Z6cNejhH/TQYtsEtfX+UzcoccYEVxjXB/C974ZR40eY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=le2W3BpLqeKmSXkvKg9ooWf5gK4qVVc5SBYun0BtY7Beku4LrLqAqtX5nefyVndJ26WHGJPzXoZTKwuXzWK5sBqohqsnHzOw6x/4MU5//H6e1jYtXShAmOCaSVN5GUb3E/XWB2/burRTgiPy0WlW125o7V5UQON8nOjWk7psblc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uOaUAJXN; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uOaUAJXN"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MHAec8295954;
	Fri, 22 Aug 2025 12:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755882640;
	bh=XiYP7/kr0fzRSEykft6TnKNvG0tjsjpkymTXB3Ek4oo=;
	h=From:To:CC:Subject:Date;
	b=uOaUAJXN41kxJQKEjNrNhTRP2OjGJ7UiGoIX4csoduSCY7sinfyWTlVUEsC1ZOy68
	 RmRByWj0SWSOeQkxI7lukSP303P4ceLjYYOmnbJS76qgIiaI/gXC+0SDfm3193u4Em
	 r5zDd3P2M3AbyrcyC7RWUGnYipbSv0lNmrB6JJ1A=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MHAeej3427352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 12:10:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 12:10:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 12:10:39 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MHAdVV3865768;
	Fri, 22 Aug 2025 12:10:39 -0500
From: Andrew Davis <afd@ti.com>
To: David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>
CC: <devicetree-compiler@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] checks: Do not check overlays for alias paths
Date: Fri, 22 Aug 2025 12:10:38 -0500
Message-ID: <20250822171038.190122-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The path given as an alias inside an overlay can be a path to a node
in the base DT. The path check searches only the overlay as that is
the only tree available leading to false check failures.

Skip this check when checking an overlay.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 checks.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 2072e1e..5d09216 100644
--- a/checks.c
+++ b/checks.c
@@ -718,11 +718,14 @@ static void check_alias_paths(struct check *c, struct dt_info *dti,
 			continue;
 		}
 
-		if (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val)) {
+		/* This check does not work for overlays with external paths */
+		if (!(dti->dtsflags & DTSF_PLUGIN) &&
+		    (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))) {
 			FAIL_PROP(c, dti, node, prop, "aliases property is not a valid node (%s)",
 				  prop->val.val);
 			continue;
 		}
+
 		if (strspn(prop->name, LOWERCASE DIGITS "-") != strlen(prop->name))
 			FAIL(c, dti, node, "aliases property name must include only lowercase and '-'");
 	}
-- 
2.39.2

