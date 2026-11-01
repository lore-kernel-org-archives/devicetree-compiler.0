Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570642;
	b=Q7hjyJicL0biCAR/IMMqgl62c/3pLWhHhkItaA5pg4yN52zVcg8+Mt+bJBbAjHUBX+zN
	 Cs1pOILRqQWeYsM0gAVNj4419SqahP1vN5WjfneUVnLIUHfarGgBC+VXZr0Tu6xiCz3HW
	 8KKaRbnfIeZRliHMda04HYHbG756APlAl/i639UypcJUnqvpcP9fHI61VV4akwSUhLbV6
	 /cs4C/RrccFVzngtWn6bba2gtVYNUQAC7Z5ZQ8J5IN4Sm0Bftvvc/AzGNPZqmwrdukYzr
	 4W2WD74AkXtcqG08DsGlYWEFdxOYrEYuV788xOMAoWaCZhOxrlcptnvQ1UMe9bUHlzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
	b=ky458KfKqyYj/9t+w09eWZFHn9PCUhT+QOoG6DWsNo7KSYhwABBMsJR+gl1LE0O100VF
	 z3aOIYLSWZqAUbazv933CdBzkyYp5XsN6R0eTzF8OstF3/9MWP/vpPQ0YbeCJIB8nystO
	 9q31T0S9JNmazW7SriINHXHcdMX+jvqjzqN1jSa1+eyuLq+g3yttLreBVOKYTIw1oAEet
	 Ws6Z/cRm4HRLv5sC4XBdjCBVE0b8yoBYboH+XNXOYxcYgU0fOlCtU9jRT5foxj3Z7NQgE
	 Pn03xJrSBpd79qZLK9plNDMOAFmNb0mN2el0WKLfDdxWPRQBk53+4NpS4Jsodej3K7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GaSgdJxT;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0CD606A32C
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0CD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GaSgdJxT
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1670479eec.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570636; x=1794175436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
        b=GaSgdJxTLy10oRGBUy+bumWaJoY0ilqCBp5x8IueoDNSq0ZP+pChyin7C02xb0+Twa
         KmyrEo/I4aSqqvlt6YkQFJr1mai/KzWfssltGOnIv3kHOkAFb3llhCmGIhtwGcT0krYc
         PhcgB/5PZbP8eZ3RAY2g7KLcs8+I7AWbphZTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570636; x=1794175436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
        b=gj2LKEVNsQlt6XM5Hg5ZDz54YMsNdQD1VrMCtzrcLgMnyaq0HSLZZeSYkLFWVUBVQ7
         5uz7sDQAk6v8RmeoRIiNGzM84WB358ncQscW3kddGJsAwbXgJGJe3it86eLzfMwOsKqX
         LJ4rYYT6+dln3VSFULDEBjemZ9SiVrI8woGfZ52tTf3NZDsfUIeIHVLi0e8dkD3saZkL
         ROY6RyiL2iDFG15EKo9LYOCXGyaeAYntB9nPiDQ5K/G5EZiBX7RNzpDAFgIqcyxsq5Yt
         q8iCXMC+PpfXdA4jd4MWjYgEmWFWDm60XjnyhHVscV1pQiLXBBsHdDOJSuo+0/v49Nzz
         5XIA==
X-Gm-Message-State: AFq9FYIFxSfagc2qP6XRTCZMhNrxN38VGDNF6fQq1WqBTEmRiMYvoHjf
	6T0sLFGISIBYd/ddC6RP3sH2Kvf/BP6bWvT+iGEGeU1uLk2N1N+ZWjzEST0WmMnhbLxU2I21ABv
	C0PEn7hgy
X-Gm-Gg: AYBFou2HDNs48RBa46VaoQKLw7Kf0cm7nJqITxGYSjK51NqjLiAVTx6pUYoylBFODzU
	K7wycwMhnyvBsGz4VSaJ6WTU1hNNjdq0uIyHAX8BjyU4i4zZ+1U9hjfOJRdRzcVe7co6ZlfwnhX
	4UMpNUiS4TTy2/RWKS9N7kqbhrAYRjGOnvbTBTP60CrdQMBKDKSDENeooZ4YAn+s3b+FoenuV8g
	hycK/SVWG63Tpw6eRjIGZiNjzYJQaTBrTIYPb08Tkv1Lamx2491glrTluHj9K/DQugUFfPAkUx9
	lbsypsLCn2Ah/q2XBmq9wA9rFfeZZ5oathiTwBlcyg2e0S7awCYwD9WTIkFHF5wiExJ5nJTvf+S
	VI3V+njcZt4si5EqWK+otWeRFn2gOFO4WNBqK9bV3ltLpS4MD5aVQ/XnbwvdqsAyhuNffwkzD3Z
	dCEE5uEcHYQKnmQjIFFo8sbg+7n0+YPhNqZtDzZ9n4rgxfbWKFSUWZqcc1TBNp0rhK0bByeWFms
	9+qFZreGY863K6Z+fwIBkseH/KrubBGRxdnZJjCsBCTGnJhWsxEoG0tQQ5qC16fD6ffc49lWLVT
	RpinJuwFqmFer0Y5MFCUppl4t1bEaavtQ/kZhhLLYPZ+Gf9CH+66jCT5h1kh0T//E2SfwPbI4Y2
	QBdqoeit8XswMZQ==
X-Received: by 2002:a05:7022:208a:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b042725256mr5453515c88.17.1793570636332;
        Sun, 01 Nov 2026 14:03:56 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:54 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 10/15] libfdt: overlay: Make fdto const in overlay_apply_node()
Date: Sun,  1 Nov 2026 14:01:17 -0800
Message-ID: <20261101220224.1436242-11-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

`overlay_apply_node()` only reads from the overlay blob `@fdto` while
merging properties and subnodes into `@fdt`. Mark `@fdto` as
`const void *` so callers holding a `const void *fdto` pointer (such as
the upcoming `/__local_fixups__` update logic) can call
`overlay_apply_node()` without casting away `const`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split constifying fdto in overlay_apply_node() out of "libfdt:
  overlay: Update base /__local_fixups__ on apply" into a standalone
  patch (David Gibson)

 libfdt/fdt_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 36f2377cf7d8..4b3e17bd087e 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -821,7 +821,7 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
  *      Negative error code on failure
  */
 static int overlay_apply_node(void *fdt, int target,
-			      void *fdto, int node)
+			      const void *fdto, int node)
 {
 	int property;
 	int subnode;
-- 
2.56.0.317.g454f8302e1-goog

