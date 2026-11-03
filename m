Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715467;
	b=xpK7DJhiQCYrNNhbzDjogGbz3eVWCLlkaqwNEcG/CwX6SVmYDBX1bPwVUhNHJFXIi6SK
	 4iuT/a+D82/xGa+OLIi1SvA+rSjBsH3eVos+IF4T/rJiyJqkKWC+RmaWLzMwTymqZJBAB
	 ZcVTXFbGR5Yh8U7hiywBs96elGsfcdKgCGg4o5xqyLl0uU++fRYL5p2jmDu3H9bMMgfBi
	 XMnYaiI/ifi6/rOPkfzgOBQhv5jLsn7aqD0Ov6SgXwqg3gAFJuN80HxhwMBUYX5gVzPA2
	 s3XjSgsByApOd3pExmZjTvEtLQT4yiH3UyRT287DA3iadkbbp3x7Oid0CZHVlNF1wsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZloicH8bQ3+kv1Rz7C/AL/afDGFNKIRRHynpJ3laKSQ=;
	b=4U6LG8eLYF9o+snESNmp5MiyQdznof7xLqISvRl76eKXVp8MsAv5K2j/xaGtZYd94XKL
	 szsRn0WlaOSwTABT3rw1MGzwBa78aaCL43bkLd9rmM2xT/T7p19lurtDjau6cyMueHahD
	 fdfW5X6a0842F1tv0VrsIi+i1tJ/3+e0Dp23fo5HvsTEUrVtaFuOwfru/QeFCn/1ZBUfj
	 xpTPaZqH9+XNniaDS4eIPdkYzECm+5ShYQBipHTgIr+cRgdBrZMNBbC5QTuOCi/+W/JRp
	 imocZAnJUZtRg66EO6oKWUEnLlvgEVCZISDZ81PtaYwVDCMzvAXcbrpf5V9uuBHxPqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JxjQ9MD8;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BBC606A324
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 14:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BBC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JxjQ9MD8
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8439fe796ebso2894444a34.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Nov 2026 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793715466; x=1794320266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZloicH8bQ3+kv1Rz7C/AL/afDGFNKIRRHynpJ3laKSQ=;
        b=JxjQ9MD8LcMdXOZjlkzR69Eii5qtt51/qi1qlX9WfHYtfIbFmboiOflNoXC5tzUuRA
         CVxVfjkQmpOvy4zQGpk6CERcGVteepzbbpROo2n1JtA9o8UrmMa5wdPXkmwHxtSzgPcF
         jFHtrN/ddlM7TglbSao7rf/dYzeJPJs8eaFkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715466; x=1794320266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZloicH8bQ3+kv1Rz7C/AL/afDGFNKIRRHynpJ3laKSQ=;
        b=fJnV74vLPN0OfRvuRBcz5nZoY5glnhbDTV73znSmVlPcB+yFKvedi/VopARVN2CH8j
         z/Xw8TGowklV2O+usj8lGfXEHyoTj3du0bmqT/CLinw+dqeZdt1uOTvxKIWE5WQiPKjA
         GOXwSoxM/q92Gy9jwn3VTE3uJwY7VR6wSJxSGTL8J0eJsQD+pQKCO2s5xureCvm+47B1
         /n2fTOe7VZlAsXu2SsdNJgbmLuX1Gl9e0w4nrYN6HhJSecvWtVz3shYHUsmJaeCv2L6u
         nUjlsrJSmpXAAoQRxdUzWAv2HfEly1D4UVxSncxJfeb6OX+wYvnsQjmN0kal0XNSt3Jt
         TaNw==
X-Gm-Message-State: APuU4Z+0CmOxnUULLTbmUQUpgaPv+VpLmaQFa7sAjIO/b7kRjv+5+CF6
	9IOda8hUq+HWHo3yyUgIghGK6XCuO1RGJ9HRVGvKKThqaMsb0uwp9M2FlHGk7Rt4Z6+NjAeRCwz
	UW+crlw==
X-Gm-Gg: AYBFou2OfkUNngZed1QazyxWsCGynwcsGb5FlQCM+SvAKgQ6XB55A9gml4Pb4yw6JGK
	5KWvA3qzxNbvYfqgTKUO/13ghIXxOPVU77GFAEo9fb2DFYyV3uof5bBwxfFVncLc3aJ2Dginqjq
	ldDy21GYuZvZ2ryHGHC2Y50mGiOt/G++GgHuboNUE+vejyv7RbCYP9B0h6cVrCWd/EKz9n0+U+q
	yZKDrp9xZa4zhilm7fIRm1Go8sC6PNGMnlFlQ2ID1kvvFsP/+jS8eSp0X3QJcCNT9xWrlK+aoKW
	UWr7A6IhRYcvtlNizgv3RtchWExAopggXq9fLvaXyUagEtrkki7UzwYlHT5vmMo7bjS0iwWaZUs
	sHpPlqizKYrD9dqv+/oR9454jOFPlpD6X1BltYG6Eazt+8g8ORZB4zdcQyHiGn64FXTG5svesn5
	gr2zD+6ptJY36ODJbW+cZVay8dnd4C6LtiR8eR1JAS0BUutktXb3C509pDq12BtiK27qFriMTdZ
	mYWZn0Wsk/Dka7b06MdmNoNJ+JE3kX491cw0uzxMi+vTSVBBtHNey3tj5bJFEhI2n0koeJbyLrf
	It9po5Iv9AcDukWxOtlrfP7eqIMbXQvkMZpYgIXWXR8ZQmqGmEhACNZ9SYNLIQKEFbmjsFI1pEJ
	PE0RRCUcBQpxjvBSIPZ0DIA==
X-Received: by 2002:a05:6830:2313:b0:7fa:5c49:523e with SMTP id 46e09a7af769-85d365eec3dmr8847716a34.23.1793715465982;
        Tue, 03 Nov 2026 06:17:45 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3501abc9sm11906297a34.0.2026.11.03.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:17:35 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5] doc: dts-format: Describe fragments and deletes
Date: Tue,  3 Nov 2026 07:17:19 -0700
Message-ID: <20261103141722.2313183-1-sjg@chromium.org>
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

dts-format.txt shows a dts file as a single root node. It does not say
that the file is made up of fragments, nor how they are combined, nor
describe /delete-property/, /delete-node/ and /omit-if-no-ref/, so
anyone wanting to use these has to learn from examples or the parser.

Add a section on the fragments, how they are merged and how to delete a
property or node, and refer to it from 'File layout'. Leave the details
of overlays to dt-object-internal.txt since their rules differ. Add my
name to the list at the end of the file.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---
We can add more info once the code restructure is complete, particularly
around how overlay uses fragments. See the beginnings of this at:

https://lore.kernel.org/all/20261101163721.2458982-1-sjg@chromium.org/

Changes in v5:
- Rewrite in terms of the fragments of a dts file
- Leave overlays to dt-object-internal.txt
- Add my name at the end of the file

Changes in v4:
- Send this patch on its own

Changes in v3:
- Describe only the general rules, leaving out the edge cases

Changes in v2:
- Add new patch to document deletes

 Documentation/dts-format.txt | 55 +++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index 41741df..c2eb0c9 100644
--- a/Documentation/dts-format.txt
+++ b/Documentation/dts-format.txt
@@ -101,6 +101,8 @@ Version 1 DTS files have the overall layout:
 		[child nodes]
 	};
 
+	[further fragments]
+
 * The "/dts-v1/;" must be present to identify the file as a version 1
   DTS (dts files without this tag will be treated by dtc as being in
   the obsolete "version 0", which uses a different format for integers
@@ -111,12 +113,63 @@ Version 1 DTS files have the overall layout:
 	e.g. /memreserve/ <address> <length>;
   Where <address> and <length> are 64-bit C-style integers.
 
-* The / { ... }; section defines the root node of the device tree.
+* The / { ... }; section defines the root node of the device tree.  It
+  is a fragment, and further fragments may follow it, as described
+  below.
 
 * C style (/* ... */) and C++ style (// ...) comments are supported.
 
 
+Fragments
+---------
+
+After the memory reservations, a DTS file is a series of fragments,
+each of which acts on one target node:
+
+	/ { ... };			define the root node
+	[label:] &target { ... };	define more of a node
+	/delete-node/ &target;		remove a node
+	/omit-if-no-ref/ &target;	remove a node if nothing refers to it
+
+where &target is '&' followed by a node's label or its full path in
+braces, and a label before it adds that label to the node.
+
+The fragments are combined into one tree in source order, including any
+from included files. The first fragment must define the root node, and
+each later one acts on the tree built so far, so its target must be
+defined by an earlier fragment.
+
+A fragment with a node definition is merged into its target: a property
+which is defined again takes the new value, a child node which is
+defined again is merged in the same way, and any other properties and
+child nodes are added.
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
+
+These remove a property or child node defined by an earlier fragment,
+not one defined in the same fragment. As with child nodes, /delete-node/
+must come after any properties.
+
+A file with /plugin/; after the /dts-v1/; line is an overlay, where
+these rules differ. See dt-object-internal.txt for details.
+
+
 
 	-- David Gibson <david@gibson.dropbear.id.au>
 	-- Yoder Stuart <stuart.yoder@freescale.com>
 	-- Anton Staaf <robotboy@chromium.org>
+	-- Simon Glass <sjg@chromium.org>
---
base-commit: 19f15dae64059b1a1e05a540a57930086c46a8c0
branch: delete-markers5

-- 
2.43.0

