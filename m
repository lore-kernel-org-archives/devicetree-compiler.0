Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0467D34A773;
	Wed, 26 Aug 2026 09:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737842; cv=none; b=lSOsQDVxZ0UbOQvet8g1zPXX9D7jXLE8dmI+rsRiDrvIGzhSWhSuR95BZmPobNVcSoaHkT5dHqtxLbwUh4yc/1GrZLztlhoW5o+YSir1WMHyR3/E1seo72rc/1wZx/ZA9W+qKEIernWXru1JeyBNUb6wGJCFYh9lHZzODF+nVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737842; c=relaxed/simple;
	bh=a8yWwWwuaeV1ND4PZ/6EpeUN2fdNqL2jl0/3BSi4xx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRgL1X+URry/wyld88AcL6JjzRK9yEPsIAhSj3DzA9lpmKLRoA3DJl5OOs0nCqZ5iLhuVjb97K1Qlhp/dM1S4HAVSvp6e7LNWfXSO1Tg4vqJhGacFu/Jgb2CUzxl3YQDQxNMlYqzTFkBHMeIb+DW/UinvsW4fv9/tKIQ6EB/IhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hBQJSwKl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hBQJSwKl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 62A564E413BF;
	Wed, 26 Aug 2026 09:50:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 310C0604EC;
	Wed, 26 Aug 2026 09:50:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D652411C7AD52;
	Wed, 26 Aug 2026 11:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737834; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qZA52EnhjJI6y63U2fQLoVVzoZiNH25f6cUFrSM/XlA=;
	b=hBQJSwKlkILFw+PvE0Zw9cWK3PuvJz9fnhvPkJRw+aMpQuUUojePKQgzi+uQQRmQZ480Xv
	rjQieDilh9aI3g8a8om0MDo5abcaymTn5KEmpek/zQsA2DHxh/Rvl445TlWvNuCWIjbpnY
	3d72XVDgH335vx50Z/djxM9DXwrzIqvwHQU5VWVY60UcVoGHr7v65AwFNIbDW/JbfQ+BR/
	AYHjkjlX++OXPZcV+fuXhC3nh45u+b2Kv1Z8ZMV33OdPcd7S2USgfeoh0XtGdN0ZNf82e1
	6ZkBPMFTw2MOKbhX6puQwlUYTzrmQp3Y/Du556tZWtOZkjRyGpZSspNfmKmElg==
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
Subject: [RFC PATCH v2 01/74] dtc-parser.y: Avoid an empty proplist
Date: Wed, 26 Aug 2026 11:48:30 +0200
Message-ID: <20260826094950.1088288-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In the dts parser grammar, a nodedef is defined by
  '{' proplist subnodes '}' ';'
with both proplist and subnodes that can be empty lists.

Having multiple possible empty list can lead to Bison warnings such as
  warning: 4 shift/reduce conflicts [-Wconflicts-sr]
  warning: 1 reduce/reduce conflict [-Wconflicts-rr]

This will happen as soon as a new list (which also could be empty) is
added in the nodedef definition.

The simpler way to remove those warning and thus have a robust parsing
is to avoid multiple empty lists.

Update the proplist definition and nodedef definition to avoid those
multiple empty lists. Instead of allowing a proplist to be an empty
list, force the list to be a non empty one and update the nodedef to
handle explicitly the absence of the proplist to support the case where
no properties are available, i.e. the case of a node composed only of
sub-nodes.

This doesn't change the functional behavior.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 4d5eece5..e47f80d4 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -267,12 +267,16 @@ nodedef:
 		{
 			$$ = build_node($2, $3, &@$);
 		}
+	| '{' subnodes '}' ';'
+		{
+			$$ = build_node(NULL, $2, &@$);
+		}
 	;
 
 proplist:
-	  /* empty */
+	  propdef
 		{
-			$$ = NULL;
+			$$ = chain_property($1, NULL);
 		}
 	| proplist propdef
 		{
-- 
2.55.0

