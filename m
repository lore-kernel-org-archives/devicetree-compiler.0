Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB1DDAB
	for <devicetree-compiler@vger.kernel.org>; Sat, 12 Apr 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452326; cv=none; b=jEtK1GSUVXc7A1Dczs+jzA2BpaqFtA761zL4eTyMMBfOSCQsBgIbYrxmHY+CuC17cAdZeaNKaRpokYdxwvxD57F2Y56C+qpJ2SALUK5kX3NK3TzYZyPHv2gtbjNK17KpYXPm45J9sqnZDtUl6hcJxyJjC/zeuk2U8JQRL64Q0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452326; c=relaxed/simple;
	bh=H//nA27DtbAvBjW7WZh9Wnx+INvNGU7mh//Kcu6rZeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q5q84XBg2iawabDnfjy3zqzkn54ITtrtgSd9DoqV9Th3bmSqbOw9BE7Mj0Zkz1pfrg8/1W2VE1HPlGEkReIYxyekFjHT9f5pT2q2yFCEXonPIxNHszWTsisc3J5ibiFs6ZDT/Sq25S7063QZ+zdH9CJ9mMUfnJ2kkt5yrXWaISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IWAuDiGz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IWAuDiGz"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DDD7B25D34;
	Sat, 12 Apr 2025 12:05:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1-rBa82NIBi; Sat, 12 Apr 2025 12:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744452319; bh=H//nA27DtbAvBjW7WZh9Wnx+INvNGU7mh//Kcu6rZeo=;
	h=From:To:Cc:Subject:Date;
	b=IWAuDiGz9LSD3txHKPMIQldN/mFlG62GHgSHG9FlL+lFJVl23eH+GGLauZOB1Af0o
	 AwPCRJBnmKSGfseR+6io/eu6PsXVLcyn/Oht7o22NdCmy18+UwYnPoZB0FGbrrLQlZ
	 oWYUGoop/nDJxmRezs/9yhY7SUx5Xds+j27SVneI/sVi9/dsa4hmdqs2fClCJpEpPu
	 czldDtWN0ls0+fKgSPJl7UNoWDE8eld2+fmEcNemF3nsvPygoBfwCSwBERYiJih1eg
	 iTNGYTW7i9eo7UEzH4F2bC7Tksny8c/CBuRQ5vUE3FREkfVGuzefQdNEvcRB3B/Xx0
	 nAYzj3ztc+lkw==
From: Yao Zi <ziyao@disroot.org>
To: devicetree-compiler@vger.kernel.org
Cc: Yao Zi <ziyao@disroot.org>
Subject: [RESEND PATCH] flattree: Optimize stringtable_insert()
Date: Sat, 12 Apr 2025 10:03:52 +0000
Message-ID: <20250412100351.9009-2-ziyao@disroot.org>
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

This patch optimizes the function in two ways,

- Replace brute-force deduplication with libc-provided memmem(), which
  is guaranteed to be in linear complexity on both glibc on musl libc.
  This brings roughly 24.6% reduction in execution time.

- An open-addressing hashtable is maintained to track strings already
  inserted. As property names are likely to be duplicated, this could
  filter out many existing strings, avoiding traversing the string
  block. This reduces another 1.2% of execution time.

On an i7-7200U Linux system with musl-libc, building the "dtbs" target
in Linux 6.11's arm64 port takes 19.8s less in average, achieving 25.8%
speed up.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---

This patch was originally created as GitHub PR[1] and closed by myself
later as I found more opportunities to optimize (mostly about
get_property_by_*). Failing to do so with some trial, I decide to send
it as is now.

[1]: https://github.com/dgibson/dtc/pull/164

 flattree.c | 143 +++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 129 insertions(+), 14 deletions(-)

diff --git a/flattree.c b/flattree.c
index 30e6de2..afca1f2 100644
--- a/flattree.c
+++ b/flattree.c
@@ -218,23 +218,134 @@ static struct emitter asm_emitter = {
 	.property = asm_emit_property,
 };
 
-static int stringtable_insert(struct data *d, const char *str)
+struct stringtable {
+	unsigned int len, cap;
+	struct data data;
+	int *slots;
+};
+
+/*
+ * Must be 2^n to ensure stringtable.cap - 1 correctly masks hash into the
+ * index of slots
+ */
+#define stringtable_initcap		256
+
+static unsigned int stringtable_hash(const char *str, size_t len)
+{
+	unsigned int hash = (unsigned int)len;
+
+	for (; len > 0; len--)
+		hash ^= (hash << 5) + (hash >> 2) + str[len - 1];
+
+	return hash;
+}
+
+static void stringtable_init(struct stringtable *strtab)
 {
 	unsigned int i;
 
-	/* FIXME: do this more efficiently? */
+	*strtab = (struct stringtable) {
+			.len	= 0,
+			.cap	= stringtable_initcap,
+			.data	= empty_data,
+			.slots	= xmalloc(sizeof(int) * stringtable_initcap),
+		  };
 
-	for (i = 0; i < d->len; i++) {
-		if (streq(str, d->val + i))
-			return i;
-	}
+	for (i = 0; i < strtab->cap; i++)
+		strtab->slots[i] = -1;
+}
+
+/*
+ * Return the internal data and let the caller owns it.
+ */
+static struct data stringtable_data(struct stringtable *strtab)
+{
+	free(strtab->slots);
+	strtab->slots = NULL;
+
+	return strtab->data;
+}
+
+static void stringtable_free(struct stringtable *strtab)
+{
+	free(strtab->slots);
+	strtab->slots = NULL;
+
+	data_free(strtab->data);
+}
+
+static unsigned int stringtable_findslot(int *slots, unsigned int cap,
+					 unsigned int hash)
+{
+	unsigned int i, mask;
+
+	mask = cap - 1;
+
+	for (i = hash & mask; slots[i] != -1; i = (i + 1) & mask) ;
 
-	*d = data_append_data(*d, str, strlen(str)+1);
 	return i;
 }
 
+static void stringtable_grow(struct stringtable *strtab)
+{
+	unsigned int newcap = strtab->cap * 2;
+	int *newslots = xmalloc(newcap * sizeof(int));
+	unsigned int i;
+
+	for (i = 0; i < newcap; i++)
+		newslots[i] = -1;
+
+	for (i = 0; i < strtab->cap; i++) {
+		int off = strtab->slots[i];
+		const char *str = strtab->data.val + off;
+		unsigned int hash = stringtable_hash(str, strlen(str));
+		int newslot = stringtable_findslot(newslots, newcap, hash);
+
+		newslots[newslot] = off;
+	}
+
+	strtab->cap	= newcap;
+	strtab->slots	= newslots;
+}
+
+static int stringtable_insert(struct stringtable *strtab, const char *str)
+{
+	unsigned int hash, i, mask;
+	int *slots, *slot;
+	const char *dup;
+	size_t len;
+
+	if (strtab->cap < strtab->len * 2)
+		stringtable_grow(strtab);
+
+	len	= strlen(str);
+	mask	= strtab->cap - 1;
+	hash	= stringtable_hash(str, len);
+	slots	= strtab->slots;
+
+	for (i = hash & mask; *(slot = &slots[i]) != -1; i = (i + 1) & mask) {
+		const char *oldstr = strtab->data.val + *slot;
+
+		if (streq(str, oldstr))
+			return *slot;
+	}
+
+	/* Try to match a subsequence */
+	dup = memmem(strtab->data.val, strtab->data.len, str, len + 1);
+	if (dup) {
+		*slot = dup - strtab->data.val;
+	} else {
+		*slot = strtab->data.len;
+		strtab->data = data_append_data(strtab->data, str, len + 1);
+	}
+
+	strtab->len++;
+
+	return *slot;
+}
+
 static void flatten_tree(struct node *tree, struct emitter *emit,
-			 void *etarget, struct data *strbuf,
+			 void *etarget, struct stringtable *strbuf,
 			 struct version_info *vi)
 {
 	struct property *prop;
@@ -350,10 +461,12 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	struct data blob       = empty_data;
 	struct data reservebuf = empty_data;
 	struct data dtbuf      = empty_data;
-	struct data strbuf     = empty_data;
+	struct stringtable strbuf;
 	struct fdt_header fdt;
 	int padlen = 0;
 
+	stringtable_init(&strbuf);
+
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
 			vi = &version_table[i];
@@ -367,7 +480,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	reservebuf = flatten_reserve_list(dti->reservelist, vi);
 
 	/* Make header */
-	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
+	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.data.len,
 			dti->boot_cpuid_phys);
 
 	/*
@@ -407,7 +520,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	blob = data_merge(blob, reservebuf);
 	blob = data_append_zeroes(blob, sizeof(struct fdt_reserve_entry));
 	blob = data_merge(blob, dtbuf);
-	blob = data_merge(blob, strbuf);
+	blob = data_merge(blob, stringtable_data(&strbuf));
 
 	/*
 	 * If the user asked for more space than is used, pad out the blob.
@@ -448,10 +561,12 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 {
 	struct version_info *vi = NULL;
 	unsigned int i;
-	struct data strbuf = empty_data;
+	struct stringtable strbuf;
 	struct reserve_info *re;
 	const char *symprefix = "dt";
 
+	stringtable_init(&strbuf);
+
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
 			vi = &version_table[i];
@@ -541,7 +656,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	emit_label(f, symprefix, "struct_end");
 
 	emit_label(f, symprefix, "strings_start");
-	dump_stringtable_asm(f, strbuf);
+	dump_stringtable_asm(f, strbuf.data);
 	emit_label(f, symprefix, "strings_end");
 
 	emit_label(f, symprefix, "blob_end");
@@ -560,7 +675,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 		asm_emit_align(f, alignsize);
 	emit_label(f, symprefix, "blob_abs_end");
 
-	data_free(strbuf);
+	stringtable_free(&strbuf);
 }
 
 struct inbuf {
-- 
2.49.0

