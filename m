Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551592;
	b=v502fLATR5467lL9Af/sMjRikRv0qkuSpDLrcKoil95r2hZ95V9KDTupq2nwzO6482Ex
	 jRzY0KyaSARia7RxYrA7QYvqMfmSr9lFAIHGmtVjkInwcUMdtzKh3N/UPvWTFjMmRfub3
	 /2j2tenZlNBgQ19zoVNYKa2W0GUC9COLCLW0QYfLCkVOBkLfq73o2ANzdDa0OlDZgWScm
	 B75XDuoCr1Q31vF+wImBsvmwbfjYtKrq5KTm5DoDDX8InGIOn+DWHMjwIqC8b4P9Cd+yd
	 jACw/H/pbP4vG4DC8kpm5HBaHej99BFkKue0mxrZQS/gsyzcaOCK7VSsnbz8i8QQTJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=evOfeusdeFI1ua44BZYCZlVH2cSJreGLyw5L2RgvpAk=;
	b=uYYxu/XpSZPqz4ny6cfkEKM1V3b8YAIpLQBXkMBKDSXN+1rM7GPVsXmF9W9arNUB/VI2
	 jVswfp8m1iAp3AsudY/EFtC8RkdJGKUibEWZ/PVzpXcdvPdeTIiJGnvIUW3EDFwL571tp
	 URugDqBwtcoIvzTQOPYnBUQjCwdfrJe2z0X0ybWLbMsa1lUC2KLmJ68imIHiM0EbaLDeo
	 DBSHh3jw70YyAA3QP9qSYQS1DBhc7SdkXZLP4d5sEUssUaDP1yrCrkiLu5fTurN1xSjzt
	 fHmQ5mfgg8PhoDor9eh+B8rjydrAbSDatbMiJNd8I7CgJYfgdtq47REj5BXULi0KJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OMvjaDVC;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF818606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF818606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OMvjaDVC
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4877837890fso1453012fac.2
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551590; x=1794156390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=evOfeusdeFI1ua44BZYCZlVH2cSJreGLyw5L2RgvpAk=;
        b=OMvjaDVCm3d9W/+TEwWIHvMnTpDhTwzU/oOmOHV/k0RiFkO1ncJuL9kfWi4Pg7KnK2
         IWA0tTIqfOxIMHffb0WKjeTZAQfX1yzFX164ECQ0QTuzkrycg3AnWXewhcp6rGLEOIcx
         Y44tWNdge9nwQyXVUjZ0diS+TqKXp4Oq0lus4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551590; x=1794156390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evOfeusdeFI1ua44BZYCZlVH2cSJreGLyw5L2RgvpAk=;
        b=mPt1yWhCzx2iUgA22hee0tfJSJJzCQmusvAuSey+hp3zt8FyafeAAMhAG0E21zuQZN
         l/0+97sLExGPGgFlt13w3nEx7g4M3t13VtHE4u4gnFI5P7S0kGgxBAiOittvsCjHBUBd
         wVVRn72oaHMjXSPSycYNQ/lL9QKuNGXqoIt8YartI0NB3w56ysHlgRgKS7sozS07yAsJ
         9pgupWsKx8seipemUHCxz97+44FjItVkUD2tz+yXpFOp6bufHmljttQHH9Z497Mtf8nz
         qujnPZbhHzO5fM+nzUk/hfws8ZGkf3RuxxIXYTPd+lXZJhj/H4pkJAHxbABZYDaBGKn0
         q0Pw==
X-Gm-Message-State: AFq9FYKpgGn87/hqsMek4w7XSEGxOAPeZqS6bigcd8cfOk13SVcakoed
	1IVAHuZfxi/5Yx5buUBOhRiQZgA1dSOyeOxr34/UNyEHmaM1th7VZ/ZS2Y37gZNTIWlrDA2aeLB
	4uTUs1USo
X-Gm-Gg: AYBFou37/CJiaJQyTmu4JGEY4IYXDg449y7F37KU8+ulHeXEvzdVHt3/LHvkL6wpZaE
	6EekAu7e5agozRbraPAenGhLykDt1aEOjhHynx9/Fj/pCaUq0IKe1/OhVNLdfq06UCHiVxYqx2h
	UwUx7+8rX37hL37ohJSUgbCutOIctBNPJ+Ufx/MnYQzoe+TnyQfzJerDcLvwaXDixyeF7o7Ks7P
	MrQ5YRWT4yvXq2ZSmZMWx11HsaaRvZAtWq5SE8yeYFbzGot9NVgF/ytNjt6rskCkgpwrVTJpVMA
	evPd/hjoUgIxe10zX37YJZMyCKyyU+ZST5QddgMI/xnGqKz6RYbPOqv3EJQSN3S2T9Ta+kSI2Ci
	OL5dmilWiBFTVcYDkA9XHWphL7dzvF0q2j0/4MA/qGJFdGughM3HJvjRDk39IV386dn6+4oPizf
	bEqHWfCc+oaMaN9aOENvkxGwzNNQdQTzorrYLO1OX6vgeWkvIbeRWghz0FY3urT8OTR6D19O0cz
	sM4PXDU2HFc5z+M2924OO0w9DfkhykO42ezsSQcuplFGaNlcMywVtbDnYxSRj+Ayjqdf5sI2jkw
	YGm+YGwnCRzfZ3gNdzVWURdNzsooX+yjPbupwzXHJfEhXX9HzDVzNiXtfPVhJRd0rsKd+V7Me45
	ZyKDTWJ2FO/tAxtDszEVj+g==
X-Received: by 2002:a05:6871:e805:b0:4a7:b14a:39e5 with SMTP id 586e51a60fabf-4a907705a7cmr4653755fac.29.1793551590403;
        Sun, 01 Nov 2026 08:46:30 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921a80881sm5073540fac.17.2026.11.01.08.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:46:28 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4] doc: dts-format: Describe later definitions and deletes
Date: Sun,  1 Nov 2026 09:46:11 -0700
Message-ID: <20261101164616.2467286-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
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

dts-format.txt does not say that a node can be defined more than once,
nor describe /delete-property/ and /delete-node/, so anyone wanting to
use them has to learn from examples or the parser.

Add a section on how later definitions are merged, how to delete a
property or node, and that an overlay cannot delete anything from the
tree it is applied to.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
The other patches from v3 are dropped: David is applying the /dts-v1/
fix himself, and he would rather extend dtc-fatal.sh than remove it, so
the test changes need a different approach.

Changes in v4:
- Send this patch on its own

Changes in v3:
- Describe only the general rules, leaving out the edge cases

Changes in v2:
- Add new patch to document deletes

 Documentation/dts-format.txt | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index 41741df..da0783b 100644
--- a/Documentation/dts-format.txt
+++ b/Documentation/dts-format.txt
@@ -87,6 +87,41 @@ elements, as NUL-terminated strings, as bytestrings or a combination of these.
 	e.g. prop = [ab cd ef byte4: 00 ff fe];
 	e.g. str = start: "string value" end: ;
 
+Later definitions and deletes
+-----------------------------
+
+A node may be defined more than once, for example in an included file
+and again in the file which includes it. A later definition refers to
+the node by '&' followed by its label or full path in braces, or
+repeats the path from the root. The definitions are merged in source
+order: a property which is defined again takes the new value, and new
+properties and child nodes are added.
+
+	e.g. / {
+		serial: serial@1000 {
+			status = "disabled";
+			clock-frequency = <100000000>;
+		};
+	     };
+
+	     &serial {
+		status = "okay";
+		/delete-property/ clock-frequency;
+	     };
+
+Within a node definition, a property or child node can be removed with:
+	/delete-property/ property-name;
+	/delete-node/ node-name;
+and outside any node, a node can be removed with:
+	/delete-node/ &label;
+
+A delete in a later definition removes the property or node from the
+earlier ones. Like child nodes, /delete-node/ must come after any
+properties in a node definition.
+
+An overlay (a file with /plugin/) cannot delete anything from the tree
+it is applied to, since the overlay format has no way to express this.
+
 
 File layout
 -----------
---
base-commit: c22868416b8db8354ce5db29d3494dda688a2ae3
branch: delete-markers4

-- 
2.43.0

