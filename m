Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4513093CB
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695531; cv=none; b=GxHqliHOHt4nGcz1qN1lhksSeyVpCBoqA0Pg46uzUIXizU5rg7cevcsoM9OujMoeqPSfVZ0FE6DD/KSifSET8rZbNMiZR8R1+P+u584pRDCXzcRsjSMEZ+t8wz+DhKe7stxeSjcuZz3ZykthkK96+yD/JRIq+uo5uCueA/oYs2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695531; c=relaxed/simple;
	bh=uY3ubiFDZ7a1KYr9DOfwhcu1IdnvLVKjkKxA9cbRG7M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m8UlLC1wzFFhA33dL/N47c0MnEzhxx1NwmU5UKzDHM68HJnqo/C1VHTYBBUTI8PDlaNJGXglxIwExCglBFTknX+6J2djs9K3teOn6jqZLJeyfCCsRbWON/Seoay/J2y9V/dqlucS61N4mK7dH+2/VXm83/OdKCIG0MB0wdJPt1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DL8YyS62; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DL8YyS62"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9d41c1964so4123619f8f.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755695527; x=1756300327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=seGyZL20lLYVE1s4+Mcljwj9odmfyVaC9gMYiC0WXZA=;
        b=DL8YyS62wOOuu0KJluAR+r0oAlWbvx8UC4Rkch3vgYrth+IG6iRVY0lijoGd4I4BGW
         aqDPM60ICD2iQT06ti5al/jvr4ZvamJ92sN41A0+UoT1eKa4LI7Tps+7VY3VKPgyu70j
         FwENEq/OgGqaD4tSDX1j+lmMsZ+d7uTpORDf1whmosWLwpggrGeFWlv48BxIeUb+4srF
         y7Hh0bONVL7ASmQj/QtpC8+ja/CLPNhwT670aZq+ZzY5iVdG/AiCHWg9UFXWxuVyyT7h
         tqzdCUictTOAICJZ0q0/UgoCxl0289ZZ0eYmx8mgKJQCcmc+5C7PNYzgK30bdIcFdjp3
         usRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695527; x=1756300327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seGyZL20lLYVE1s4+Mcljwj9odmfyVaC9gMYiC0WXZA=;
        b=jqT5kMk2b5tfV5ofjZwiQD8WB1hyL03bnnXtmnVqinxG4ZgLL6UErNWOSS3tL3JEEj
         ya5L8tiO6uQNm2T4hqFhMhPdlyujgeXjkBpOoCKLCozUnGmBc1Mu+tlvKhESGqRpSaCk
         4Jqn5bBlL2TwPvr2xLZ1ehVQSMAajcXsuJnTWVC2LAiTVpxZtEcURXgu5qhkrKIqXyKd
         figPIPbt2F51wuWgZntibnb3tEqZE1SgxRt0SxNPa0SnmWIh3AxBR9HUK464dAwzlwua
         sV2ruqXvbaKmqvuvyj+xaNAbirdWU+S9xTFOM7X5ho1foZG+lC0jTZs0uVwqy1h7ej9T
         c16g==
X-Gm-Message-State: AOJu0YyBb/toABL4giLsw4QbQz6rZIx4sUGjtvgrAqcSJud300wK2JxM
	aD73y/nq+L+rnoZFudqtJYOf3ipPDE+dT009RlhYYU6QuOHDONcaer2Lnvmh0maKfMPa0Vwj6wm
	fyhA+
X-Gm-Gg: ASbGncuORUcFN7tKxdxeQs3TkglEZSrurd+QIoUte2VLLCeM6UA4AQXXN9x0J6FBWqS
	1yYbhBcOcBgbFZn8O6g45mjIgqTf/AruNbVXM8/uKpQwQg35CIyxZSZ8JPLayGWo8pK5550zuj1
	8st8bhCar8hkGKCxfqcVkj3IkVh7v64p1lXk6VYnSUxYx2mEjmSmPdoiSnZTqc7y9s5UXnrw24Q
	YkHF0r9QhFKJHRzMXWp77gcHoEj4K3ylxXaV794FGoLCds1ktT7KRgoLlnb28+VUbSiURQ6SAW/
	nCyGrA2zzLE3cQ4BO07WioJtiLPFWSe89b8eBQ6+xb6DwW382j9G8LZcFXyQXkIIyVaYRXHcovD
	D1lxi59EIgwYf4pkMFyXIr1faHyUO34QnXnj+TyXafepu5hO3g1Xb6QqQt0ZaooAW
X-Google-Smtp-Source: AGHT+IGLT1tNfaUyGvpBf15/MDsCI1HvQ2PH5RTaq+HxT97PQ7SlVv2r6F+oG0nIQGqw0yF60+BQ5Q==
X-Received: by 2002:a05:6000:1449:b0:3b7:8362:fed8 with SMTP id ffacd0b85a97d-3c32bf5d582mr2053066f8f.2.1755695526774;
        Wed, 20 Aug 2025 06:12:06 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c40213295esm915474f8f.36.2025.08.20.06.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:12:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 0/6] Restore phandles from binary representations
Date: Wed, 20 Aug 2025 15:11:26 +0200
Message-ID: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3265; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uY3ubiFDZ7a1KYr9DOfwhcu1IdnvLVKjkKxA9cbRG7M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBopcl9+crta4PNsXHkn93UNDJjYlSIyok7QaQ7h YTzlvDF03aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKXJfQAKCRCPgPtYfRL+ TkwmCACC06uUGe3g/d1+UhMyKSebxLMtMA0baSy4q+XlnXFoXygbBWqqVsSjPBCTO3DAOX/IPbW 2nEg6CRXYD6/U5xLhponuP9QZUHq9S8EcYxpcBHt6p/C40dudYwnFDbH8TX5K56/ydKAjdjiyKZ jOKbTxa+x4X6wJT3QFJ7KEaTIlOoFHVWvM+7seg2NBFNjBFFobbBXfhDlMHW6yrTLnM5RYlS0dN DQ5wCmeHzT6kWr4uvi5ruV9yYnUvvSo5qyBY4fHYKCO8hChFZpXxWZqCvwYewg5IKhafX4+Bx5o KfLy+Me8yavUWwWRAf7ueqTCmm7HOZw7kiCaXFFhsqbASB+7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this is a followup to https://github.com/dgibson/dtc/pull/151, but I
switched to submission by mail because the workflow is (at least
subjectively for me) better suited for such a big and long living patch
set. Parts of the patches discussed on github were already applied.

Sample output to show the benefit:

	$ cat a.dts
	/dts-v1/;

	/ {
		node1 {
			node2 = <&node2>;
		};

		node2: node2 {
			property = "somevalue";
		};
	};

	$ cat b.dts
	/dts-v1/;

	/ {
		node0: node0 {
			self = <&node0>;
		};

		node1 {
			node2 = <&node2>;
		};

		node2: node2 {
			property = "somevalue";
		};
	};


So b.dts just added a node0 over a.dts, node1 and node2 didn't change at
all.

	$ dtc -L -@ a.dts > a.dtb
	$ dtc -L -@ b.dts > b.dtb

Now using dtc without this patch set I get:

	$ dtdiff a.dtb b.dtb
	--- /dev/fd/63	2025-08-20 14:55:37.253413183 +0200
	+++ /dev/fd/62	2025-08-20 14:55:37.253413183 +0200
	@@ -4,21 +4,31 @@
	 
		__local_fixups__ {
	 
	+		node0 {
	+			self = <0x00>;
	+		};
	+
			node1 {
				node2 = <0x00>;
			};
		};
	 
		__symbols__ {
	+		node0 = "/node0";
			node2 = "/node2";
		};
	 
	+	node0 {
	+		phandle = <0x01>;
	+		self = <0x01>;
	+	};
	+
		node1 {
	-		node2 = <0x01>;
	+		node2 = <0x02>;
		};
	 
		node2 {
	-		phandle = <0x01>;
	+		phandle = <0x02>;
			property = "somevalue";
		};
	 };

With this series applied the output becomes:

	$ dtdiff a.dtb b.dtb
	--- /dev/fd/63	2025-08-20 14:56:02.585884273 +0200
	+++ /dev/fd/62	2025-08-20 14:56:02.589884347 +0200
	@@ -5,21 +5,31 @@
	 
		__local_fixups__ {
	 
	+		node0 {
	+			self = <0x00>;
	+		};
	+
			node1 {
				node2 = <0x00>;
			};
		};
	 
		__symbols__ {
	+		node0 = "/node0";
			node2 = "/node2";
		};
	 
	+	node0: node0 {
	+		phandle = <0x01>;
	+		self = <&node0>;
	+	};
	+
		node1 {
			node2 = <&node2>;
		};
	 
		node2: node2 {
	-		phandle = <0x01>;
	+		phandle = <0x02>;
			property = "somevalue";
		};
	 };

The relevant difference here is that the renumbering of phandles that
affects /node2 doesn't result in noise in /node1, so it's easily visible
that /node1/node2 still points to the same node that just got a new
phandle value.

In this minimal example the signal to noise ratio is bad, with bigger
device trees the improvement is much more relevant. (Think 50 nodes that
are not affected by renumbering and the noise being concentrated to
__local_fixups__, __fixups__ and the changes of the actual phandle
properties but not their usage.)

Best regards
Uwe

Uwe Kleine-König (6):
  Emit /plugin/ when compiling to .dts with DTSF_PLUGIN set
  Set DTSF_PLUGIN if needed when compiling from dtb
  Improve type guessing when compiling to dts format
  Restore labels from __symbols__ node
  Restore phandle references from __local_fixups__ node
  Restore phandle references from __fixups__ node

 dtc.c        |   5 ++
 dtc.h        |   6 ++
 flattree.c   |   6 +-
 livetree.c   | 174 +++++++++++++++++++++++++++++++++++++++++++++++++++
 treesource.c | 114 ++++++++++++++++++++++++---------
 5 files changed, 273 insertions(+), 32 deletions(-)


base-commit: e1284ee5dc20f94097bc6424ede9c3e433dba77d
-- 
2.50.1

