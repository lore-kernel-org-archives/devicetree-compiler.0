Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AB2DFA4F
	for <devicetree-compiler@vger.kernel.org>; Thu, 17 Apr 2025 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880439; cv=none; b=Rpj67KnenyQgcKbqUQwFKaS9nDDLTFrCi7szA+u+i1Ak3akYremLP5JjTvHbHG91ZSfiE1OU8L1MqXtrouYkiuPvmDH+DURejE2D5VL1QAN7vqMxmLORNVvQT8TFiNK2MJ1lHYPpXEHc7G3V97qmrgaToisVLeiyS7v4ZLDLAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880439; c=relaxed/simple;
	bh=/6eoJwzSA2KV1wFEOcTD/b2OlK2fpmkdOwAohP/bjfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KxLKjSWoM7B6T9k1uHuFjGPJ6tHqKNgAcjywCL5wJQEqO4de/JRAi+SuX+u69F+EUVEjhJs8edZEvnHKwMWUHIE4dN9UjhRv9QbQ+lGdCq74PjMuOfs3xC0etbGMnY+/PGOKFBoZhU91GLh89UuD98bY5QWEiWVAbHyWMjKmyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=K/NOBcug; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="K/NOBcug"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 84C9A25BC8;
	Thu, 17 Apr 2025 11:00:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehVQt_7J1Jrq; Thu, 17 Apr 2025 11:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744880427; bh=/6eoJwzSA2KV1wFEOcTD/b2OlK2fpmkdOwAohP/bjfo=;
	h=From:To:Cc:Subject:Date;
	b=K/NOBcugjqeCkR+bT+CqsOqidj1/RAacOuIEgNXwLfoBGZUfs2CJOtkNZTxkDHJNl
	 c8bVasfXvY/usRHYtwDwUVjLdnfS5StozIlNcx53Jtpdao3d+CfiYqXKmPfVAwniOf
	 iFjLOtdRKH1H1JHcW3FTp9mxGzRy63zlN7JDQK6F5Wf/kWUII1YbFLqDCyh2WKhwSR
	 1HUv0DeWTxJQiS0nwVBGPa7oVbqsw06pS0JQf2ZaVpLIe6lhvSYayk3EUeK+aW04SP
	 +mx5PFXQZ2WPvgnFlBwIYkN0ePdTpAThPrAWIBTd4vYBKdPo39J7xdsbZ/W8na02PF
	 lygnOdQ3qzLVA==
From: Yao Zi <ziyao@disroot.org>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2] flattree: Optimize stringtable_insert() with memmem()
Date: Thu, 17 Apr 2025 08:59:00 +0000
Message-ID: <20250417085900.1134-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to perf result, stringtable_insert() is one of the five hotest
functions, which is obvious since it depends on a brute-force,
quadratic-complexity method to deduplicate the string block and is
called at creation of every property.

This patch replaces the brute-force deduplication with libc-provided
memmem(), which is guaranteed to be in linear complexity on both glibc
and musl libc.

On an i7-7200U Linux system with musl-libc, building the "dtbs" target
in Linux 6.11's arm64 port takes 19.1s less in average, achieving 25.1%
speed up.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---

Changed from v1
- Drop the hashtable for simplicity and update the commit message
- Add a comment to explain restrictions on deduplication
- Link to v1: https://lore.kernel.org/devicetree-compiler/20250412100351.9009-2-ziyao@disroot.org/

 flattree.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/flattree.c b/flattree.c
index 30e6de2044b2..d7328690e008 100644
--- a/flattree.c
+++ b/flattree.c
@@ -220,17 +220,24 @@ static struct emitter asm_emitter = {
 
 static int stringtable_insert(struct data *d, const char *str)
 {
-	unsigned int i;
+	const char *dup;
+	size_t size;
 
-	/* FIXME: do this more efficiently? */
+	/*
+	 * Reuse (subsequence of) existing string if possible. E.g.
+	 * "enable-method" could be reused when inserting "method".
+	 *
+	 * The terminating '\0' must be taken into account, or "foo\0" may be
+	 * wrongly recognized as subsequence of "foobar\0".
+	 */
+	size = strlen(str) + 1;
+	dup = memmem(d->val, d->len, str, size);
+	if (dup)
+		return dup - d->val;
 
-	for (i = 0; i < d->len; i++) {
-		if (streq(str, d->val + i))
-			return i;
-	}
+	*d = data_append_data(*d, str, size);
 
-	*d = data_append_data(*d, str, strlen(str)+1);
-	return i;
+	return d->len - size;
 }
 
 static void flatten_tree(struct node *tree, struct emitter *emit,
-- 
2.49.0

