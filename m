Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB36825A33F
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227636; cv=none; b=KZf7BkMqsXwhMfdstsDfVvG5B7FMWo35wj/V52Uuy4lIlxqFKckEvSXLQVELxlodNacCcygGAlazLH15gFb9oeLtmT87MHvcUaMZnCHwr3F0Xblv8LjoDkLbX2wJs6P9/XMl1LQozKmLhZiBXgguau+WPBk25dWfK+RKE+em/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227636; c=relaxed/simple;
	bh=N6vNZnVvxa0cyZoAR2VRThiEj4wnSiGOR31YXUtZkNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeNenfsEuWiXL5ENHAfiszs7d3Q0hhRJtvdSJiY869mJL1TsHnUkPsqMLqACxLTYsdvmJlkQacliSWtdm7rABM8enVXnVviPbqzQzv8p7IH7rO1YGofR6mTpuENRb1OqhMo/kdemNk1VVPyES0/MWeKD6rdhRCC/WrMuD9gnv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v1d0eOjB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v1d0eOjB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 90A6AC2086D;
	Mon, 12 Jan 2026 14:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D12116075E;
	Mon, 12 Jan 2026 14:20:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E046B103C9261;
	Mon, 12 Jan 2026 15:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227628; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BvVIGAhOsl/qKFvH3/fIDoLGZ6jnPOuqu4xf6eHm0K4=;
	b=v1d0eOjBcuWoUxR4Q/hqZzMDFcyIWKdognsVpsxaaS2aVgYVZKsnkfXECT7LUuumtOd9c/
	QTLxCXEew7zt+QsArVDpZ1QRD3NvTM1gFOyBcCtjG3dur3bX6PmMEjyxgNv5RBFkhjgUTh
	7mhipVEny6MIuq/10pDaN96g8yomS+FHVsCDu7Xx7Asi62MKPf1Dg8fuLEb5uKR0Np8j/Y
	zQjgSn6/jx2VMDlAiRHOkrlw8pljydN6JGnfNsj0zabEreO3KH/b+bFSsk8xZ9yjZy0Lpg
	Upj97a2KhYcM2xnbR6Dy1LIHn+/njAduMAS3PoEpXzo8TJ4NwXeQCxnkqnU9bw==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
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
Subject: [RFC PATCH 04/77] dtc: Allow to use data_append_markers() out of data.c
Date: Mon, 12 Jan 2026 15:18:54 +0100
Message-ID: <20260112142009.1006236-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

With meta-data available in dtb, markers can be set as soon as a dtb is
parsed. This will be done in flattree.c using data_append_markers().

Prepare this usage allowing this function to be used out of data.c

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 data.c | 2 +-
 dtc.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/data.c b/data.c
index 5b25aa0..11b2169 100644
--- a/data.c
+++ b/data.c
@@ -127,7 +127,7 @@ struct data data_insert_at_marker(struct data d, struct marker *m,
 	return d;
 }
 
-static struct data data_append_markers(struct data d, struct marker *m)
+struct data data_append_markers(struct data d, struct marker *m)
 {
 	struct marker **mp = &d.markers;
 
diff --git a/dtc.h b/dtc.h
index 186caad..3bbd97e 100644
--- a/dtc.h
+++ b/dtc.h
@@ -187,6 +187,7 @@ struct data data_insert_data(struct data d, struct marker *m, struct data old);
 struct marker *alloc_marker(unsigned int offset, enum markertype type,
 			    char *ref);
 struct data data_add_marker(struct data d, enum markertype type, char *ref);
+struct data data_append_markers(struct data d, struct marker *m);
 
 bool data_is_one_string(struct data d);
 
-- 
2.52.0

