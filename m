Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180189;
	b=BiR9KJV3NhiO+d8jb2dInDdly1vl7P4cc8H0h9hczqTwSgN+Jv/nqAjUBzc23RiIj9AC
	 VUI5Plgpbk9coGhp5CgZklq74f7buTYdCylkyBFdUmzA4fHnBx491NlN//eaILfkPK63U
	 kr4Ca7v202b3kuMrg+DbaxilpcbuFXMSUGxG/h1GDSVAM2pqAoHcopF7p1hLsLUUNpy00
	 9tQrKNj68I8BkzRDyUldphdBWo6/ZnzoAGadqmJE9iFqSdrz6rDowFqs6CdbG3QZp9PuW
	 e5QzVMSBgGSAE96aWWTftXVXlTW+YxWN8PsTmi2OYIqAQ8YlFlRD64RQLeYf0p7Argg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uHRulwWRsYonOa8U/8uyzPuOTrlTrAvvDw/L9AoNquQ=;
	b=QAzwULlPOqFbVVa2sCI9mjrcgavh3u1NZOvUd02UZv6BRJySiWfT9a87sXaAmZxxALIi
	 7jfsfn/5XdsQAUFgX1UxJgbFBG33oj/vPK3ycxPf28aZ+/I2CdHJykyOCQyl0+Ne/rKdP
	 XpZwUlV3F3vYS8Jws16VZm7+3/TuSi/5T6+EHDIxRd5whxzuLryS7pAhjDIxEo/ExbO8L
	 jZhPg8atHjQM3EUq1T7Y/blDiBaOTbPF5xBOUO4Q5VkQu0TC9IxLeIRnMEfd0GGeS0wcg
	 Lph24X0OUYxD8nsrkh2Cwex9U8aGAXLPvst28waXX6kpvuTZhONtvmSVpT0CgHTe6TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UlS6xQTZ;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212E606A31C
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4212E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UlS6xQTZ
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-833e671ee9fso764416a34.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793180188; x=1793784988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHRulwWRsYonOa8U/8uyzPuOTrlTrAvvDw/L9AoNquQ=;
        b=UlS6xQTZm5j5ebNWwlUAQ4JhYLbRM8tOhZ5nqWiVF7ShPI1pwI/+qofZ1YhGaP3PTP
         xSzNy1Gg1kLnr16AscMs8M53S4xumXdwkz6cmqEp+C5X2ur7HLViZes8muXOOJBqB5LC
         NngAs9eKx2rGSWtWwWCywmWg/6Y+ovcQumuCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180188; x=1793784988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHRulwWRsYonOa8U/8uyzPuOTrlTrAvvDw/L9AoNquQ=;
        b=erQxFR85sAyJdzWXNzRE+XfhQhvb/5XIPSvU+Kx+5r+WBrBcF+oKGKlSqfrrmUMzbz
         0X0Ez5hUzWEGSuGWDNLSg5dTqkAlH8U+fHvgdjY5nOzRG9DTz4MTPz+Jrv10CUwOA7Hi
         sopSvww1RuzXtzxBznt1LACwF2kZSR8x29wmp/yqigVQQyfpoxMNKnjPxeIpCZdPFJKM
         jIGvA80QcCpA0i7i37QJ8s6yxpTA4txTNkQpxOjB5H1HVXReK/9EYVwwMHo/wOa2NLqZ
         QEJVAUAvO9X4tJ/sTVosLRClJff4YUgab84cqAEWd9EKfriNbdpxQvuXCxX25qsBQA0q
         2lqA==
X-Gm-Message-State: AFq9FYLNFr5gfKMOEa3yTZiHxBz5GS24YklmTD6mYCnU9iutGN2v7+ww
	uzTczEka0ofB2kDW8iQq7wqyxFlEncFobCOUn1dTCVj8Cbhx9IyrJrwE4ocjkaI8Q1JnAVR+7uj
	m4/l55Q==
X-Gm-Gg: AYBFou2DHfSSImTOuwYGGiFYvr+e09zAVSJkLdFnM6iE/ru1rpWLKiQCqN2fssX7ajE
	a8fkq2FhRbDpN0Wslx08unHRQGenKLlve6pScw+qOgLBoVKpEIp9LJjEkypopQtNLkjFcyFNKZX
	+5VNmdOmVzEBUuXD1WVYInUhto4ly3XMi09SUC7H1HktNZ7gfEMbRJn8a+F8tBN9c/8MJ+q3EJB
	NMWz4YaTG3XcrBrwK6FcdoD5pX2v4Xem1W6uM2RkONKqDVFn/eveqA+HZNP8nT8XAb/In9YProB
	BNByyxFcVppBc19gsJlG17faNHrERgHCgFqdXl9TKXys2V6Z91ECJgbqY0DTKoXm6sN76fTdsSj
	GgQvvpP5OM2AC9xohJgOAkNwvOIUn20SwJ6x30J5coZjaoo9X4zXS/gSzjxiDjhByyU+8gpEnIL
	flmttcg/jQE8LwuDPyQyRKmXIU6pHkm3RyL0qOjhTCM3jILVK3bA4ZG4IqHRFqy3BX9n05VMBTq
	qjx06YTRq1Boe8mYeROhLtHMYAQlnOwUCVy8QkTwFShRHbT4XW1XmaBbSDTAOLv3+gqOL+0DlKQ
	Gi9LeS6Ce4dxu1mFPe4TqPetgfGHe/gvs2yg2faY52boQW/Udt6RBk6KgX4Y4g==
X-Received: by 2002:a05:6830:4c0d:b0:815:e061:e72e with SMTP id 46e09a7af769-85ac0bed560mr1774855a34.23.1793180188132;
        Wed, 28 Oct 2026 02:36:28 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b205fe36bsm1099953a34.24.2026.10.28.02.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:36:26 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 0/6] dtc: Fix deletes within a section and before a redefinition
Date: Wed, 28 Oct 2026 03:36:07 -0600
Message-ID: <20261028093620.3705074-1-sjg@chromium.org>
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

A /delete-property/ or /delete-node/ in the first section of a dts, or
in a node which a later section adds, is ignored and leaves its
placeholder in the tree, where it can show up as a bogus duplicate. A
node which is deleted and then defined again also returns to its old
place, with its old subnodes in their old order.

The first patch applies each delete within its own section and keeps
the placeholders out of the tree. The second removes deleted entries
from the tree, so that a node defined again comes after the existing
ones. The third clarifies some comments. The fourth lets dtc-fatal.sh
check the error message, which the fifth uses to test an error for a
delete in an overlay fragment which has nothing to delete there, since
an overlay cannot delete from the base tree. The sixth documents how
deletes behave.

Note that the second and fifth patches change existing behaviour. The
second changes the output of existing dts files which delete and then
redefine a node or property. The fifth breaks the build of two overlays
in Linux, whose deletes have never taken effect. Each patch explains
why this seems the better behaviour.

Changes in v2:
- Add new patch to clarify the comments
- Add new patch to check the error message in dtc-fatal.sh
- Add new patch to report an error for a delete in an overlay fragment
- Add new patch to document deletes

Simon Glass (6):
  dtc: Apply deletes in the section which has them
  dtc: Remove a deleted node or property from the tree
  dtc: Clarify when delete placeholders are dropped
  tests: Allow dtc-fatal.sh to check the error message
  dtc: Report an error for a delete in an overlay fragment
  doc: dts-format: Describe later definitions and deletes

 Documentation/dts-format.txt                  |  44 +++++
 dtc-parser.y                                  |  28 ++-
 dtc.h                                         |   4 +
 livetree.c                                    | 159 ++++++++++++++++--
 tests/delete_in_section.dts                   | 125 ++++++++++++++
 tests/delete_in_section_badref.dts            |  11 ++
 tests/delete_in_section_labels.dts            |  28 +++
 tests/delete_in_section_labels_ref.dts        |   9 +
 tests/delete_in_section_overlay.dts           |  22 +++
 tests/delete_in_section_overlay_ref.dts       |   9 +
 tests/delete_in_section_overlay_unused.dts    |   8 +
 ...delete_in_section_overlay_unused_label.dts |  14 ++
 .../delete_in_section_overlay_unused_path.dts |  13 ++
 tests/delete_in_section_ref.dts               |  44 +++++
 tests/delete_readd_order.dts                  |  57 +++++++
 tests/delete_readd_order_ref.dts              |  28 +++
 tests/dtc-fatal.sh                            |  18 +-
 tests/run_tests.sh                            |  39 ++++-
 18 files changed, 642 insertions(+), 18 deletions(-)
 create mode 100644 tests/delete_in_section.dts
 create mode 100644 tests/delete_in_section_badref.dts
 create mode 100644 tests/delete_in_section_labels.dts
 create mode 100644 tests/delete_in_section_labels_ref.dts
 create mode 100644 tests/delete_in_section_overlay.dts
 create mode 100644 tests/delete_in_section_overlay_ref.dts
 create mode 100644 tests/delete_in_section_overlay_unused.dts
 create mode 100644 tests/delete_in_section_overlay_unused_label.dts
 create mode 100644 tests/delete_in_section_overlay_unused_path.dts
 create mode 100644 tests/delete_in_section_ref.dts
 create mode 100644 tests/delete_readd_order.dts
 create mode 100644 tests/delete_readd_order_ref.dts

---
base-commit: 1d50f3f8fa8bf9429eebb0769dafa5df37381ae1
branch: delete-markers2

-- 
2.43.0

