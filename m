Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718496;
	b=QMYClq8v4pEOuDtufKRdoFAneGT2cbaHjLw38lLHKVBx8WNXDgNF6VejGR9vXZwf5OiS
	 0G8qHd27ljy5xgkqjz8c0em5k20ZE2IWd2rqmsKSiJ6QrmiAUFjPaqgkLlYbD/sh1Vq5C
	 CWxGdYjQPm4hyGzVcpdKj+cMwpl3sGjWvjLCIysEgiK7dTXZVRuiS25EeQN0TNxaltZn6
	 eRepDD+MZyknAyOh1AP+2yGTpMwXV7g4KABfCrG2eQ7iwadmW3OzKmowPfKQbMuTpnDp2
	 4MYc+0vEclk1QCBlUbDt1U2zhTWmgjwH4YPa0XCur2JaV2owgNn//KzAVXrKVGJPOuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8/7VOZW0bGrkL2u1LuG687Hr2rdoTHYwD7a8SAiqe4E=;
	b=aQQHAXJPJpLtwrfJqBfTMpV35fYZrz8zpYlt5N+zhzmkqGuhwniQgIhSuL81BF3J6DFf
	 QMSiMPuJfMUnEp9GmOak/IvDaXrJvGSDDPuiek6Ih3jnKV+QsioYw2nfVPPYppML+NAID
	 VOYYTyyO+SE0SkxLxLLR3quHXhet8HBQNp1zP9r4PoXMgePPxDa6tK2Z0EW+BM8TF8Qc1
	 NP3jPpxZOiHI1Fro+LQ8MfPqfyHdzOpv3eQ3zSIgngSD82GykjV/TvyZHGRp8xdKF/OjI
	 JFc4XF5JM9LqNycU78R+WjDx2AmaFIYaSirtYR95545EwrzUjQZbCt3IXco3oat9doA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bz39a60W;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D36606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bz39a60W
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8629ef8613aso2797466a34.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718495; x=1796323295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/7VOZW0bGrkL2u1LuG687Hr2rdoTHYwD7a8SAiqe4E=;
        b=Bz39a60WvF6IAxs2SWt4edRgZH56eZg+Tmu5oSnT6W0ghAkMwNmpMrSzgsiFnGMDRa
         9lyVZ913H+kR11GRhpIk6dM0ts4q0Oad5Yihrl5UOp9KOfa1M6gFgYnqEbWCC1iz9OiJ
         r5kCdefGd4N1FtGV5lXn7rTuTIhRhy98fzT7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718495; x=1796323295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/7VOZW0bGrkL2u1LuG687Hr2rdoTHYwD7a8SAiqe4E=;
        b=ZnZ2gnZ8tfIfSHXRpU4sMR7n/aQ7C8fTfaEStwpyYZw8Mw2Lg5vKc6evRfhtS7hlpH
         nxY9fd0mivvKeN8H6pHvk8kxjxyuwPQ11bk0fRPymnpDvt8iT7lewwPqRi43SxaxiTeS
         t34D9xRxXLjWboFjTnVeFQYAPgtn3p55d4uKulcC3IiDMM3RvbAHyl4b3W2GqDsQpgSu
         R5hI/ccfwqxE3eVdTw7IkqnmYqka+bzFqnaO1TYysOyVgiSpI7azSVIfrimXpCXd9o8V
         21HzIT1o55cjlIfFni3Eyx6DtLUB8mi2T2wGBhyZKrmyTgQb4BFfmFYvR6b86Tiww6U3
         YrzQ==
X-Gm-Message-State: APuU4Z8V79Nt28VZgwkFs/uSlhWio0KZBub1w4xQycn9K2eyCauhQVkQ
	tBzrVLtVg4KTNSMJLL51TtkAkk1KzbeiGcXt7+isP5x2IDvFVUipxaBKTlP2JyXdnCfLZhynK1r
	TxAM1WA==
X-Gm-Gg: AZFdTZfqFbBR/ZwJ6scItMQStNrdAQc/gRRH/24K2jmRJwDdZZ76JgiNMIVXIa1uwuR
	j5EKXeD6KM1vJJmDT78wRtzRl1zE5ubbQ45tZJG5Q1oBLY7IXPtUDjHqmHtyaILqm2e3zKDEdPz
	2vBo9rW9WjdaEbCMvJp/maYgb6XnFb0nJglY0tfbGuzw8GShJaZgV1O/liTcEJr1v/FBgui1cVy
	3fykBFBoOd0I9U7+MU2T+306SUfQKPfBOAKX0kQjMUfPhHLpXzf/jcn9WOi8BjADjqb8PUUuVYl
	5nJ6JBGYNjY9LG79ilE59MM3jLfBmQQIfdLs6/y+6tueR5epYtfKzff62zwJuG3Ekhq2s4IawL0
	I4n2FcooGKRAHTlRXPz6MzAMceBxAgn/rfQJmaI9QW4Tt+nNdD5BQXACDzZdF3L2Rz5bZR0F85a
	yRBuqYky52ToMh4oaoOD6x+QWNoq+Vtj2bfa85VpOzz+ND9fMgDUlBh6v0/0yL8AT9G2CyPg5rD
	g15MTVc6e/KC3v7HUTKQ1o1R3zQbxKwEQBXW2Hc+4+rPySNyleBCKnQTM7PxMPHXk9RvKOSRba2
	5I3cSMBBx5+DgFFlCtiVUTnZ50Tkk5f7snxv0invyeeUQnB3F4+suMU/LRmI+PGOywIPWfAE3LN
	epDIN+uuuNb6skPcIeoPRmg==
X-Received: by 2002:a05:6830:4c0b:b0:861:5c3d:4a97 with SMTP id 46e09a7af769-86315769115mr22176673a34.19.1795718495367;
        Thu, 26 Nov 2026 10:41:35 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:34 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 00/10] dtc: Move the merging of source layers out of the grammar
Date: Thu, 26 Nov 2026 11:40:59 -0700
Message-ID: <20261126184126.1472738-1-sjg@chromium.org>
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

Note: As of v4, this series only moves the merge code. The merge still
happens during parsing, so none of the problems below are fixed yet.
Once this one is sorted out, a new series will be started.

The parser merges each source layer of a dts file into the tree as soon
as it is parsed, so nothing can look at a source layer on its own. Here
a source layer is a top-level part of a dts file, such as
&label { ... }; or /delete-node/ &label;, not an overlay's fragment@N
node.

This causes several problems:

- A repeated node or property name gives a check failure in the first
  source layer, but silently overwrites when it is in a later one
- Deletes cannot be dealt with consistently
- Checks which need the whole tree give false positives for a plugin,
  yet checks which do not need it cannot run before the merge

The ultimate aim is to run most checks on each source layer before it is
merged, and only those which need the whole tree afterwards. For this to
work, we need the merge to come after dt_from_source() and
build_dt_info() have returned.

As a first step, move the merge logic out of the grammar actions into
livetree.c, one action at a time, passing each source layer in a new
struct source_layer. The next series will have the parser return a list
of source layers for main() to merge, then add a plugin's overlay
fragments (fragment@N nodes) after the merge, rather than during it.

The output only changes for &{label} { ... } in a plugin, where label is
in the plugin itself, which is now merged in the same way as
&label { ... }. The only change to the errors is that, in a plugin, a
label-relative reference in a source layer which adds a label is
reported at the reference rather than the label.

The series starts with two small follow-ups to the merge tests, which
are now applied. At each commit, make check passes and dtc gives the
same output and messages for every .dts and .dtso file in Linux
v7.3-12284-g3799eeb906c9.

Changes in v5:
- Add new patch to check a label on a node which is not in a plugin
- Add new patch to comment on &{/} in a plugin
- Drop the merge tests and is_ref_relative() patches, which are applied
- Say that a label on a node outside the plugin is an error
- Use the term 'source layer' rather than 'fragment'

Changes in v4:
- Add the &{label} tests here, rather than in the first patch
- Drop build_fragment_root(), append_fragment() and the next pointer
- Drop label_srcpos, since the position of the reference is enough
- Drop the srcpos patch, which is applied
- Explain why a fragment which adds a label does not go in an overlay
- Free the fragment after merging it
- Leave the merge after parsing and the fragment@N changes for later
- Look up the reference once, at the top of merge_ref()
- Report the label-relative error at the reference, not the label
- Shorten the comment on struct fragment
- Use 0 rather than '\0' in memset()

Changes in v2:
- Add a constructor for each kind of fragment, taking all its fields
- Add new patch for &{label} in a plugin
- Add the list to struct dt_info later, when it is first used
- Build the fragment in one step, with build_fragment_ref()
- Change the subject from 'Add a list' to 'Add a struct'
- Check the fragment type with assert()
- Combine merge_labelled_ref() into merge_ref()
- Combine merge_path_ref() into merge_ref()
- Combine the rules for label and path references, using dt_ref
- Drop path_ref in favour of checking the ref for a leading '/'
- Explain the aim of the series and what it does not do
- Rename merge_label_ref() to merge_ref()
- Replace FRAGMENT_ROOT and FRAGMENT_REF with FRAGMENT_NODE
- Return true on success from merge_delete_node()
- Return true on success from merge_first_ref()
- Return true on success from merge_omit_if_no_ref()
- Return true on success from merge_ref()
- Use a NULL ref for the root node
- Use dt_ref instead of fragment_ref

Simon Glass (10):
  tests: Note that &{/} in a plugin is existing behaviour
  tests: Check a label on a node which is not in a plugin
  dtc: Add a struct for the source layers of a dts file
  dtc: Move the /delete-node/ handling out of the grammar
  dtc: Move the /omit-if-no-ref/ handling out of the grammar
  dtc: Move label-reference handling out of the grammar
  dtc: Merge &{label} in a plugin as with &label
  dtc: Move path-reference handling out of the grammar
  dtc: Move labelled-reference handling out of the grammar
  dtc: Move first-reference handling out of the grammar

 dtc-parser.y                     |  92 ++++++-----------
 dtc.h                            |  39 ++++++-
 livetree.c                       | 171 ++++++++++++++++++++++++++++++-
 tests/merge-label-braces.dts     |  12 +++
 tests/merge-label-order.dts      |  17 +++
 tests/merge-labelled-missing.dts |  14 +++
 tests/merge-root-plugin.dts      |   6 +-
 tests/run_tests.sh               |  18 +++-
 8 files changed, 302 insertions(+), 67 deletions(-)
 create mode 100644 tests/merge-label-braces.dts
 create mode 100644 tests/merge-label-order.dts
 create mode 100644 tests/merge-labelled-missing.dts

---
base-commit: b1816ff6721121d490a0d1d0a1e3743561e9232b
branch: dt-forest5

-- 
2.43.0

