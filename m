Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266305;
	b=5AEYnua8UQ79lX1E6/Ox1uNAjixELtYxetFzSkzE2lEATnf4dQXNPxQ0O+txRg3pmYrw
	 6LQ2TXLjEPn+7CL1CQYJq2pn3myVkfiuGsslCXC/SdOzMBTOpX5OkD4/EaIPayceTf4pN
	 YUGQHLn8Dzjzn76XKAMscVMEphJQNXsJia9l9nYPWUlxCBSc2oXgdIEQShSUqwi1AAWIp
	 AdA5h0fimqSaLEGGp6xhNtH+gyv8Yq/wDL/25oMRqb8549+S2jwcbJJKI8AfjngpFZS0/
	 ILWWaFjli/ZtPFsGiOTnTbWYIAFkmMshSuSK5N1lGrZfjsT/j7C9i642703r8hwNA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=udxHXPoPG2LQ8sHij0+Q1xysdcpICBr8l3HUHnNx4Bs=;
	b=s7OOyw7tAeXdHa4afa5AP/Wep8wRiLmH3RQZFcheIO8jjwPZC6vWt+yBUCSeEzN8+F5f
	 PlsHPND4DHGoDFfPko95lhJX9cfZ3JMXnPiw4pGj9pmA6SlYnF2QsLqOQRF8EpPBaNg2a
	 lwYvUnJRZdNtzaGQo+oobpOJajzG9ZK3UoNJ5+2ti3F/PfwepdKx8oHgxP1DAAYJNrVHX
	 FOTkP97njWT+vNscM98yAr3jGfPyxyWYxrUXxwexZalWLJ3sFYXo2cJnt/81Qr4IDQpy4
	 tGAht/PrHXqKnOTH3x3nT/8z6cr2lYyP/kc4GcGZv7LeBqwU24S6jUI9CH9AbejBK/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CxcxQQ9d;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DE2606A320
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80DE2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CxcxQQ9d
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4d7034a99a9so1127468b6e.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793266303; x=1793871103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udxHXPoPG2LQ8sHij0+Q1xysdcpICBr8l3HUHnNx4Bs=;
        b=CxcxQQ9drqGg+4oIB3y5/KmqUn82sXj79JyRjDU6kBUxJACW5t56mgXexuZvYBw5Y1
         1qcsj7AM9PiLYIOkXISV6owCE9lTqXGVIoRZ+RInRvIAxxb202e82EHjWNXq7bMezcL9
         zxZAHAAcd3Rd9tewGSG6zqmRjX33HQuJjPxag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266303; x=1793871103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=udxHXPoPG2LQ8sHij0+Q1xysdcpICBr8l3HUHnNx4Bs=;
        b=UOremf6uOXG4M9lVq/w95wNyVX/wl+7foOAyXK/nyKIW4YyqbvFIsJGkA9LL8S0fQF
         wJf5z3TvXTjWcTmzhOO3SlsneYzCHvQbJ4c7TMYFDho8+jMRRTKnR7C3xcPcu3aDinHh
         QoXdgKoEt1ciKmtZY1Vt6P+6TfHn5ovX0UxpIbpquSnHXcIaeMIlGynpT1tn1XBUHA3h
         vxGZEFBfR0OJWb0C4gM6VCcO4zIF8WCY0jS1OpcxAk9SnXy+wOtHkz2ITHQMNWMtOdhG
         OSQ2gwqaD4mG+astfQEv1RNcc94W4xKCsffexSqjFpDgYYf8iKKjo+Mlk6JjvXtmrPah
         AzsQ==
X-Gm-Message-State: AFq9FYIgRe3Tz6WMKmNq7l1WwViGsqmmjfda7UaAkJhX91OVlOH+XxDA
	RyYvvAHHrMR3mN3nWpDMwbRQwlhHX4njmibOYY+Dd6Es2f1VJXzSmam23NORF7H3VaTpMlcoUq4
	+tKtlWQ==
X-Gm-Gg: AYBFou1mCaIwwaQER98dHqKmyLFZXOovNiHVUjMeINrtzSOeJsj3AzebKy+MGQNU8vJ
	ezapV42h1e98xpRJjmrHFZ5uO0inqXc+yZzevuDd1HXOZkaz0hTjfsHuf/SbaBz/MAwm1n6lvu9
	rZaqOt7umBa+StSr+bLuccfpNIVjzc75FGylEHLjmpMKPhXK6rjr0JLy9oZuWyBTEL0Nn1oHftM
	93ATslyO8ywPmDZyrrYxkSIEEVLzIfk1lT5iyHuvCDjY2ciW39EHUaCSrcfJb+MN0+ulAL0yJBk
	MLrOJtz5EXGYpuZ9bKvI3z/lfP6DNcPptuqFkV+Jd0J7l0XOqx69RuNBASL3931Y6XXeeq4mYCd
	gtZF9h0kis4uW6FNdGHRRsMIPMulrvqShKvZJ520XCV/jtyWJABtwFtzIwde0H4Uyi7JAeRsfE3
	hgekhrSudTCt/vnoIOry65UjE9f+ZlRsB/gYmBi8cWU/Ify3bAGOJv1UJ6zJT8yokUE6YelafFy
	lpa9IsqABREvzI0KAQsnfCoehghhHzSduUP0gwPgo0K5WMETuIxoyOBCjQTXdNjYrBSiftHvn1U
	scAw92QHsJXFoNWoAqVzIiP4Uayg6/TXsmlXbS1Vsu4HMQsXkDTTzcXbuWhn55fG3GORDSycbyM
	opJtredouTk7BlZqvTuJ7PQ==
X-Received: by 2002:a05:6808:4fe6:b0:4d6:90d3:e18b with SMTP id 5614622812f47-56383e93e14mr4543143b6e.52.1793266303470;
        Thu, 29 Oct 2026 02:31:43 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a50281sm3715213b6e.7.2026.10.29.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:31:41 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 3/4] doc: dts-format: Describe later definitions and deletes
Date: Thu, 29 Oct 2026 03:30:56 -0600
Message-ID: <20261029093115.3647778-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029093115.3647778-1-sjg@chromium.org>
References: <20261029093115.3647778-1-sjg@chromium.org>
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
---

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
-- 
2.43.0

