Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29FC4519A4
	for <devicetree-compiler@vger.kernel.org>; Mon,  7 Sep 2026 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799620; cv=none; b=bUxGCxhBahd+LOmwEiFbVzSoJU07C1OP584AHRahvfobfWHZMAzS3ocC2hIoO4i4l9l8mCSRf5j5d01zvnAp8vW/nPl2BUAGZJZCtmK+iIeHa/56915uWDrPr089jPYOYkoUS3torfOHZKW8f+d62GR20aOMRx0fi/sfRmCIi/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799620; c=relaxed/simple;
	bh=laiY3MUZf2Fgq7uv3ytYdGEDmmk4kA6q/OME2RaWWkw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTMw8M0UxekeAC0scu5tmAwS++5+9BlQPN8bRPc9mB+gqyvNEdfHmYoa7V6NxWPpDkQve5k71cyAOrEoFLCSgA2zi8vy7MmS7BC0SUk+5qhbJKUWNRJNkWBH4b7fTnJvz0O8DnMvSs8i11UZnpZbMAmo/tiYCpFQUPkQFHgPLiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A+FnWWb1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A+FnWWb1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED17E4E41573;
	Mon,  7 Sep 2026 16:46:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B849D60383;
	Mon,  7 Sep 2026 16:46:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A2B811C7A34F;
	Mon,  7 Sep 2026 18:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788799614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fRu8vKfzjKGHTcF+bVdkoG7ov8tIq8OyWWakTQVTm5U=;
	b=A+FnWWb1q8yn3km02892/s215SFrDpGXUfKl55TlNXamoMwfUHEdX3IpkPJmSa7egArM1n
	0GSd3CLa+HIkRE8vksQuGGmwmvttf1gKjo3f3bqXKMBOcKt1xqs2hfZ5H/+Mgbj+6+sLJg
	M+8KGmyGmBzzA+W+wjGJdJBwyKSek8TV5pNBh6psNmuo0a/SF2+Xhv3KZZtkM/uNncx1kM
	0+b44PqB4z6RuRKiE20kWZh38dJUExSOYg/Wk7jhyb751Q+5kV+kuWubAn2ce4TfbgjZqB
	Da/4c/vaz8BbnEPfKX5qNNM/cldWHWAZpdsfKLpapejrCHzrsr4LaeB9iSx6CA==
Date: Mon, 7 Sep 2026 18:46:41 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 02/15] libfdt: Don't assume the root node is
 available at offset 0
Message-ID: <20260907184641.537cfa49@bootlin.com>
In-Reply-To: <apfKx_u3v3GBfzOz@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-3-herve.codina@bootlin.com>
 <apOhk-NQusFgV5Sx@gractus.seuss>
 <20260831140119.1f14b420@bootlin.com>
 <apaBuQ8kn2bOzYcI@gractus.seuss>
 <20260901141826.49b1a1b7@bootlin.com>
 <apfKx_u3v3GBfzOz@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Wed, 2 Sep 2026 17:06:03 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

...
> > 
> > Ok, I will update fdt_check_node_offset_() to have it updating its offset
> > parameter to the real offset of the root node when its value is 0.
> > 
> > Based on this update, will see where it goes. I mean, impacts on callers, if
> > it simplifies things or not, if the offset update needs also to be propagate
> > to caller's parameter or any other similar point that we can see during the
> > implementation.
> > 
> > Having something implemented and available in a patch will be the best to
> > compare changes and impacts related to fdt_check_node_offset_() update.
> > 
> > Here we have a version of handling offset 0 vs real root node without any
> > offset update done in fdt_check_node_offset_(). In the next iteration we will
> > have the version with update done in fdt_check_node_offset_().
> > 
> > I think the golden rules to follow on this point is "keep it as simple as
> > possible".  
> 
> Agreed.  Feel free to repost just the NOP before root patches on their
> own.  At this time, frequent small series is easier for me to tackle
> than occasional large series.
> 

I've moved forward on the fdt_check_node_offset_() update.

The new fdt_check_node_offset_() looks like this:
--- 8< ---
int fdt_check_node_offset_(const void *fdt, int *offset)
{
	int nextoffset;

	if (!can_assume(VALID_INPUT)
	    && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
		return -FDT_ERR_BADOFFSET;

	if (*offset == 0) {
		*offset = fdt_root_offset(fdt);
		if (*offset < 0)
			return *offset;
	}

	if (fdt_next_tag(fdt, *offset, &nextoffset) != FDT_BEGIN_NODE)
		return -FDT_ERR_BADOFFSET;

	return nextoffset;
}
--- 8< ---

If the given offset is 0, fdt_check_node_offset_() considers we want to check
the root node and so update offset to the real root node offset.

Ok, I still need some fdt_root_offset() calls from some other parts but that's
not my main issue.

My main issue comes with orphan nodes in addons. fdt_check_node_offset_() is
called with offset pointing to an orphan node and this offset can be 0.

The offset 0 seen by fdt_check_node_offset_() can be the "fake" offset of a root
node and in that case fdt_check_node_offset_() should update offset to the real
root node offset but it can also be the offset of the orphan node we want to check
and in that case the offset should not be updated.

fdt_check_node_offset_() cannot determine whether or not the offset should be
updated.

With orphan nodes in the loop, fdt_check_node_offset_() becomes:
--- 8< ---
int fdt_check_node_offset_(const void *fdt, int *offset)
{
        int nextoffset;
        uint32_t tag;

        if (!can_assume(VALID_INPUT)
            && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
                return -FDT_ERR_BADOFFSET;

        if (*offset == 0) {
#pragma message "We have a problem!"
                /*
                 * An orphan node can be present at offset 0.
                 * In that case, looking for the root node may or may not be
                 * correct.
                 * Indeed is offset = 0 requested because we want the root
                 * node and sadly an orphan node is available at offset 0 or
                 * is it requested because we want to really check the orphan
                 * node available at offset 0. How to determine the correct
                 * case?
                 */
                tag = fdt_next_tag(fdt, *offset, &nextoffset);
                if (tag == FDT_BEGIN_NODE || tag == FDT_BEGIN_NODE_REF)
                        return nextoffset;

                *offset = fdt_root_offset(fdt);
                if (*offset < 0)
                        return *offset;
        }

        tag = fdt_next_tag(fdt, *offset, &nextoffset);
        if (tag != FDT_BEGIN_NODE && tag != FDT_BEGIN_NODE_REF)
                return -FDT_ERR_BADOFFSET;

        return nextoffset;
}
--- 8< ---

Of course, extra complexity could be added such as an additional parameter but
I don't think it would make sense.

The simplest way to handle the case is to not update the offset in
fdt_check_node_offset_() and let callers to pass the offset pointing to the
real node offset expected to be checked. This is my initial proposal.

Of course, I am still open to other ideas.

For information, without addons and orphan nodes, just to compare against my
original proposal, the full patch ("libfdt: Don't assume the root node is
available at offset 0") with the offset update done in fdt_check_node_offset_()
becomes:
--- 8< ---
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 56d4dcb2..d4d4b64b 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -228,16 +228,24 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	return tag;
 }
 
-int fdt_check_node_offset_(const void *fdt, int offset)
+int fdt_check_node_offset_(const void *fdt, int *offset)
 {
+	int nextoffset;
+
 	if (!can_assume(VALID_INPUT)
-	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
+	    && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
 		return -FDT_ERR_BADOFFSET;
 
-	if (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE)
+	if (*offset == 0) {
+		*offset = fdt_root_offset(fdt);
+		if (*offset < 0)
+			return *offset;
+	}
+
+	if (fdt_next_tag(fdt, *offset, &nextoffset) != FDT_BEGIN_NODE)
 		return -FDT_ERR_BADOFFSET;
 
-	return offset;
+	return nextoffset;
 }
 
 int fdt_check_prop_offset_(const void *fdt, int offset)
@@ -252,13 +260,38 @@ int fdt_check_prop_offset_(const void *fdt, int offset)
 	return offset;
 }
 
+int fdt_root_offset(const void *fdt)
+{
+	int nextoffset = 0;
+	int offset;
+	uint32_t tag;
+
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		switch (tag) {
+		case FDT_END_NODE:
+		case FDT_PROP:
+			return -FDT_ERR_BADSTRUCTURE;
+
+		case FDT_BEGIN_NODE:
+			return offset;
+
+		default:
+			break;
+		}
+	} while (tag != FDT_END);
+
+	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;
+}
+
 int fdt_next_node(const void *fdt, int offset, int *depth)
 {
 	int nextoffset = 0;
 	uint32_t tag;
 
 	if (offset >= 0)
-		if ((nextoffset = fdt_check_node_offset_(fdt, offset)) < 0)
+		if ((nextoffset = fdt_check_node_offset_(fdt, &offset)) < 0)
 			return nextoffset;
 
 	do {
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 11f2e2ee..ec8af835 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -281,7 +281,7 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 		while (*p == '/') {
 			p++;
 			if (p == end)
-				return offset;
+				goto terminate;
 		}
 		q = memchr(p, '/', end - p);
 		if (! q)
@@ -294,7 +294,13 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 		p = q;
 	}
 
-	return offset;
+terminate:
+        /*
+         * Avoid returning offset 0 or the real root offset.
+         * Be sure to return one and only one offset for the root node, its
+         * real offset.
+         */
+	return offset ? offset : fdt_root_offset(fdt);
 }
 
 int fdt_path_offset(const void *fdt, const char *path)
@@ -304,14 +310,17 @@ int fdt_path_offset(const void *fdt, const char *path)
 
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
-	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
+	const struct fdt_node_header *nh;
 	const char *nameptr;
 	int err;
 
-	if (!can_assume(VALID_DTB) && (((err = fdt_ro_probe_(fdt)) < 0)
-	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
-			goto fail;
+	if (!can_assume(VALID_DTB) && (err = fdt_ro_probe_(fdt)) < 0)
+		goto fail;
+
+	if ((err = fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
+		goto fail;
 
+	nh = fdt_offset_ptr_(fdt, nodeoffset);
 	nameptr = nh->name;
 
 	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
@@ -344,7 +353,7 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset)
 {
 	int offset;
 
-	if ((offset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
+	if ((offset = fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
 		return offset;
 
 	return nextprop_(fdt, offset);
@@ -574,6 +583,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 {
 	int pdepth = 0, p = 0;
 	int offset, depth, namelen;
+	int root_offset;
 	const char *name;
 
 	FDT_RO_PROBE(fdt);
@@ -581,7 +591,14 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	if (buflen < 2)
 		return -FDT_ERR_NOSPACE;
 
-	for (offset = 0, depth = 0;
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		return root_offset;
+
+	if (!nodeoffset)
+		nodeoffset = root_offset;
+
+	for (offset = root_offset, depth = 0;
 	     (offset >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		while (pdepth > depth) {
@@ -627,13 +644,21 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 {
 	int offset, depth;
 	int supernodeoffset = -FDT_ERR_INTERNAL;
+	int root_offset;
 
 	FDT_RO_PROBE(fdt);
 
 	if (supernodedepth < 0)
 		return -FDT_ERR_NOTFOUND;
 
-	for (offset = 0, depth = 0;
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		return root_offset;
+
+	if (!nodeoffset)
+		nodeoffset = root_offset;
+
+	for (offset = root_offset, depth = 0;
 	     (offset >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		if (depth == supernodedepth)
@@ -663,12 +688,15 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 int fdt_node_depth(const void *fdt, int nodeoffset)
 {
 	int nodedepth;
-	int err;
+	int offset;
+
+	offset = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
+	if (offset < 0)
+		return offset;
+
+	if (!can_assume(LIBFDT_FLAWLESS) && offset != fdt_root_offset(fdt))
+		return -FDT_ERR_INTERNAL;
 
-	err = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
-	if (err)
-		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
-			-FDT_ERR_INTERNAL;
 	return nodedepth;
 }
 
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 850aafe4..a1a07f01 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -226,7 +226,7 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 	int err;
 	int allocated;
 
-	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
+	if ((nextoffset = fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
 		return nextoffset;
 
 	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
@@ -377,6 +377,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 
 	FDT_RW_PROBE(fdt);
 
+	if (!parentoffset) {
+		parentoffset = fdt_root_offset(fdt);
+		if (parentoffset < 0)
+			return parentoffset;
+	}
+
 	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
 	if (offset >= 0)
 		return -FDT_ERR_EXISTS;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c69a18ed..7a1915a5 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -503,6 +503,19 @@ int fdt_num_mem_rsv(const void *fdt);
  */
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
 
+/**
+ * fdt_root_offset - Get the offset of the root node
+ * @fdt: pointer to the device tree blob
+ *
+ * The root node can be located after the offset 0. Indeed FDT_NOP tags can be
+ * present at offset 0. fdt_root_offset() takes care of those possible FDT_NOP
+ * tags.
+ *
+ * returns: offset of the root node or negative libfdt error value otherwise
+ */
+int fdt_root_offset(const void *fdt);
+
+
 /**
  * fdt_subnode_offset_namelen - find a subnode based on substring
  * @fdt: pointer to the device tree blob
@@ -1025,7 +1038,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
  * at a specific depth from the root (where the root itself has depth
  * 0, its immediate subnodes depth 1 and so forth).  So
  *	fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, NULL);
- * will always return 0, the offset of the root node.  If the node at
+ * will always return the offset of the root node.  If the node at
  * nodeoffset has depth D, then:
  *	fdt_supernode_atdepth_offset(fdt, nodeoffset, D, NULL);
  * will return nodeoffset itself.
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 0e103caf..d5072279 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -20,7 +20,7 @@ int32_t fdt_ro_probe_(const void *fdt);
 		}							\
 	}
 
-int fdt_check_node_offset_(const void *fdt, int offset);
+int fdt_check_node_offset_(const void *fdt, int *offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
diff --git a/libfdt/version.lds b/libfdt/version.lds
index cbfef546..d0b71669 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -7,6 +7,7 @@ LIBFDT_1.2 {
 		fdt_string;
 		fdt_num_mem_rsv;
 		fdt_get_mem_rsv;
+		fdt_root_offset;
 		fdt_subnode_offset_namelen;
 		fdt_subnode_offset;
 		fdt_path_offset_namelen;
--- 8< ---


I hope all of those details will help to move forward.

Best regards,
Hervé
