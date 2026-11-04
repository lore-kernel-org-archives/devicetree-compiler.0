Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827101;
	b=SJNbpe88GO1qPFWV/+AaxzuzFswiuFv1mTdyKAjEyW4dJLjsqRQ1PQ4Y8Wc8x5Hi8SFe
	 2NuKs35hrW4czmig8QyHEW4/xVlP8QkYdP9Y/w8MaGp7CQfqhG30R8dI4fSv6NSa/We9S
	 izR/r5+iEGM4X0hDEX8Fm9XMZlenbvDuUgsJuMVRI6kRpf3/AMkoDl04KpeVYiWq3SGuR
	 zVAzyoTJ+xX2rrR/l6Ppi5HYhNxmx4o02ChiCMVx88ejYqyoy9VEF5/Pr6WUOoza8RMpQ
	 GKzVHskU6Nik29woHa4ZUoxozbTUlC3b8FKCIFcvaC3zYoyl6vnZV/+sZLua73862ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=urSyRB4EtEguA6piGsRaWZjIr4cOviBXlRN9hxKFkxg=;
	b=gY+AQrnbhZFIchXsW7q8DRWvb8tLbmP+6SiUoeXMT/XEriOQ2gwd0gkkTv9mEdLhs61T
	 O13no5kCYFgmoJGuuFkx+xoRCiAzdysTCCC+t0uSjEqs40E4GP35gpIdEOY8pqm837g/Q
	 DthUnpWxwuOr4IeK4NwzCKzuWsUQ07NhNXQfDSAZlwS1wHhA2Jn1yqpqj+akyrs9w997m
	 eRmwDuU8vJ98qT7ch99idJKl7ztnm8NfEwpZ+X77zjQh1Wr3FtIoTOE02+OghC4IN9PPz
	 AjR31olWVLLhUSqJRN8m324LwjrihfJaqfynB9U9bnqxohLrtu5Dibm9hjWROfXUjbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MSr6L5jz;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56587606A872
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56587606A872
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MSr6L5jz
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a822463a22so780759fac.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827099; x=1794431899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=urSyRB4EtEguA6piGsRaWZjIr4cOviBXlRN9hxKFkxg=;
        b=MSr6L5jz6MUkg3GwyOvx+VEcG+R+xou2ytX9bqltUAWOYp37Ax7r49RGC1dCyAG381
         +1gcpbFEk6BpGzV1ggmKaLNX+PN01P5picRX5T0krYEueC4PUwwjxU+WmaTWWtVKzQ6+
         KRaO5MuoVyL89DUXw9QEBORuPOpugXJhudCdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827099; x=1794431899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urSyRB4EtEguA6piGsRaWZjIr4cOviBXlRN9hxKFkxg=;
        b=LvBRyEITR7bXfyR0CWxTrBhrO7XPHZnsZbO3hv6/mMjFwHbH6XZJK94yY/cOUbR30m
         tFDMWenzfeuwQZGRs5QKLMeGXEbBHm5gU8+dINhCWJ02PExJt0bIKLPmI3UFo0pzHEWn
         +C14gSum+aIwEjdvyjfQJKFKkCryG8SFmSbYSN7Bnu61sql6zKv9iVZlD/rf9BOv0iPG
         4YtoxLeQIzII+sBDkf3tD/Ua113zORdPiuUhh5Vrvsho9u7sS+WxSll2s0l32pRmBePd
         V96a/FIB8sCEPy9Ux6EIh7wzsDL1rE1sZvkq2ISRyu/sgZ8Xo0+IqnZggabO5Xff3u/h
         g81w==
X-Gm-Message-State: APuU4Z9kz4oH0hLBOGY4fa62i2TWgwUN/3zoAA3GCkFB0G9825AoGqXI
	Pr4Z7zNJCyeldqan98V7d9NO7lm6hiDNqMsLRvMYIX7tAnphQCfCX8itW6VO0pzSIZ4oJl3ZY/f
	Nszzi0w==
X-Gm-Gg: AYBFou3cV88zWBquTYY2slX4CHyCLdg56bxlxgMJ9gf2krrQWKefioxgS8O7qZzJ0ux
	2pFYN0djDKjDACT1CBa4oCW97vajJyNhvpb+s3l2Nu/gsnrS1E02u0WWxavVITAVAufgyKM0WIn
	6WPfrASYtNsICiPSCdO3Yu+lCMp4ux4A28zvFt4JiLvSyDFXsnAvBMoV0mQEEAUq0FGcv1ZA93G
	SEpUMmQdH8Zn1A4G5eyHNtQzYT2HaW3nF/7c0F3ZRULJnpOGPhguFh2qbLUtqBR+P//nLALOpQI
	FTWXJMaX1l3DZz3LeRbGGfp5wdGsjLteGs5y1Qfqu7jMYoetd4W83dqClv9q8czjb/hXWU6NyxJ
	fBDg/c5dTm2LW1DbivicrcuIRB2H/S+5sSiUdcn9foZiSCz/2lpab/AzUUCjO8/H7dseLgvb8im
	mCWCqLyMJzqS1tYsq2mfY7BEhYAnCetsEsU5AHmVwB28MQQhhWc4+Erq7lLB/lGBjJDn0Zl+z4p
	jYZfY0ZIvrMlqLBFdvSfx7Vo60A3C2I09eOaTVyNaVzq/UkvLbMUZ0nhw6b7msW+K8CKBCbcFPl
	xxB3JNQ9Inva6/sSQCtplQ1zviG0UaV75GIAUFM6MOesuO9W+2rFnzJNVVVG+QPtUZ/vGOmX0HJ
	bdWGokv4hzwOY3SDc5M5fpA==
X-Received: by 2002:a05:6871:580e:b0:475:e2e9:4f4a with SMTP id 586e51a60fabf-4a9076b7508mr12458144fac.24.1793827099133;
        Wed, 04 Nov 2026 13:18:19 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:18 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 00/15] dtc: Merge the fragments of a dts file after parsing
Date: Wed,  4 Nov 2026 14:17:39 -0700
Message-ID: <20261104211807.972610-1-sjg@chromium.org>
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

The parser merges each top-level fragment of a dts file into the tree as
soon as it is parsed, so nothing can look at a fragment on its own. Here
a fragment is a top-level part of the source, such as / { ... }; or
&label { ... };, not an overlay's fragment@N node.

This causes several problems:

- A repeated node or property name gives a check failure in the first
  fragment, but silently overwrites when it is in a later fragment
- Deletes cannot be dealt with consistently
- Checks which need the whole tree give false positives for a plugin,
  yet checks which do not need it cannot run before the merge

The ultimate aim is to run most checks on each fragment before it is
merged, and only those which need the whole tree afterwards. For this to
work, we need the merge to come after dt_from_source() and
build_dt_info() have returned.

As a first step towards keeping the fragments apart until after parsing,
move the merge logic out of the grammar actions into livetree.c, one
action at a time, then have the parser return a list of fragments and
merge them from main(). The output only changes for &{label} { ... } in
a plugin, where label is in the plugin itself, which is now merged in
the same way as &label { ... }. The only changes to the errors are the
final message when a reference cannot be resolved, that a syntax error
later in the file now stops dtc before any earlier reference errors are
reported, and that reference errors now come after any other errors from
the parser.

Most of the merge errors have no tests, so the series starts by adding a
test for each one, checking the message and its position in the source.
Every line of the new merge code is then covered by the tests. At each
commit, make check passes and dtc gives the same output for all 4246
.dts and .dtso files in Linux v7.3-12284-g3799eeb906c9, with the same
messages apart from the changes above.

This series only moves the merge. It still happens straight after the
input is read, before any checks, so none of the problems above are
fixed yet, and all fragments still come from source rather than a dtbo.

Following this, the plan is to apply deletes while merging, deciding
what a delete in a plugin should do, and then to run some checks on each
fragment.

Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/

Changes in v2:
- Reword four comments in the test files
- Add merge-root-plugin.dts to check / { ... } against &{/} { ... }
- Add merge-label-base.dts to check a label which is not in the plugin
- Add merge-label-braces.dts to check &{label} in a plugin
- Add merge-label-order.dts to check the order of &{label} and &label
- Add new patch for srcpos_string()
- Replace FRAGMENT_ROOT and FRAGMENT_REF with FRAGMENT_NODE
- Use a NULL ref for the root node
- Drop path_ref in favour of checking the ref for a leading '/'
- Add a constructor for each kind of fragment, taking all its fields
- Add the list to struct dt_info later, when it is first used
- Change the subject from 'Add a list' to 'Add a struct'
- Use dt_ref instead of fragment_ref
- Return true on success from merge_delete_node()
- Check the fragment type with assert()
- Use dt_ref instead of fragment_ref
- Return true on success from merge_omit_if_no_ref()
- Check the fragment type with assert()
- Rename merge_label_ref() to merge_ref()
- Build the fragment in one step, with build_fragment_ref()
- Return true on success from merge_ref()
- Check the fragment type with assert()
- Add new patch for &{label} in a plugin
- Combine merge_path_ref() into merge_ref()
- Combine the rules for label and path references, using dt_ref
- Combine merge_labelled_ref() into merge_ref()
- Use dt_ref instead of fragment_ref
- Use dt_ref instead of fragment_ref
- Return true on success from merge_first_ref()
- Use the new constructors and return true on success
- Use dt_ref instead of fragment_ref
- Combine the label and path rules earlier, in the path-reference patch
- Return true from check_relative_ref() if the reference is OK
- Pass the list to build_dt_info(), adding it to struct dt_info here
- Return true on success from merge_fragments()
- Explain the aim of the series and what it does not do
- Update for merge_fragments() returning true on success

Simon Glass (15):
  tests: Check each error when merging a dts file
  srcpos: Allow srcpos_string() to accept NULL
  dtc: Add a struct for the top-level fragments of a dts file
  dtc: Move the /delete-node/ handling out of the grammar
  dtc: Move the /omit-if-no-ref/ handling out of the grammar
  dtc: Move is_ref_relative() to livetree.c
  dtc: Move label-reference handling out of the grammar
  dtc: Merge &{label} in a plugin as with &label
  dtc: Move path-reference handling out of the grammar
  dtc: Move labelled-reference handling out of the grammar
  dtc: Move first-reference handling out of the grammar
  dtc: Add merge_fragment() to merge any fragment
  dtc: Add helpers for the errors when merging a fragment
  dtc: Merge the fragments of a dts file after parsing
  dtc: Merge the fragments of a dts file in main()

 dtc-parser.y                       | 109 ++---------
 dtc.c                              |   2 +
 dtc.h                              |  55 +++++-
 flattree.c                         |   2 +-
 fstree.c                           |   2 +-
 livetree.c                         | 294 ++++++++++++++++++++++++++++-
 srcpos.c                           |   3 +
 tests/merge-delete-missing.dts     |   9 +
 tests/merge-errors.dts             |  14 ++
 tests/merge-first-ref-relative.dts |  10 +
 tests/merge-first-ref.dts          |   9 +
 tests/merge-label-base.dts         |  10 +
 tests/merge-label-braces.dts       |  12 ++
 tests/merge-label-order.dts        |  17 ++
 tests/merge-labelled-plugin.dts    |  12 ++
 tests/merge-labelled-relative.dts  |  14 ++
 tests/merge-omit-missing.dts       |   9 +
 tests/merge-parse-error.dts        |  17 ++
 tests/merge-path-ref-missing.dts   |  11 ++
 tests/merge-path-relative.dts      |  12 ++
 tests/merge-root-plugin.dts        |  12 ++
 tests/run_tests.sh                 |  70 ++++++-
 treesource.c                       |   5 +-
 23 files changed, 613 insertions(+), 97 deletions(-)
 create mode 100644 tests/merge-delete-missing.dts
 create mode 100644 tests/merge-errors.dts
 create mode 100644 tests/merge-first-ref-relative.dts
 create mode 100644 tests/merge-first-ref.dts
 create mode 100644 tests/merge-label-base.dts
 create mode 100644 tests/merge-label-braces.dts
 create mode 100644 tests/merge-label-order.dts
 create mode 100644 tests/merge-labelled-plugin.dts
 create mode 100644 tests/merge-labelled-relative.dts
 create mode 100644 tests/merge-omit-missing.dts
 create mode 100644 tests/merge-parse-error.dts
 create mode 100644 tests/merge-path-ref-missing.dts
 create mode 100644 tests/merge-path-relative.dts
 create mode 100644 tests/merge-root-plugin.dts

---
base-commit: 54e547173bf0f2a4cc35eba8b5738caf38b9230f
branch: dt-forest2

-- 
2.43.0

