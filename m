Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873504;
	b=nPuhlXua7bKxxXd4bhMinBJ5nvFkuEiBm/z9/Z+hM2RmU58mtJgdb8t52zEXaW9/Yh67
	 POg0kTtk6JKX+fWdBzIwnYdM+rRezQLM31wfogXK0p7kxBNdRUAgqCFnKM6Sfy/CKobDw
	 jZfdVHSGBgFHEiUcQMh9GcriPuyHPJAUrC0WD6DvJXhgbQeRfJVZ2dQD+HbobFQv4Fq2G
	 C7LqePCY9rghZf+Mw2WDtIQU3ZkFf1QWOU2eyGx5tYtEkBeSijP0rhbxutBm4TfjEHZpp
	 fzg9cjiBJlDHMsQ6e115WFsWOQub59a2VT/GLhAT7bRLBY/89gMFup6GYyQCuT+xDQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=33e6UPKYdwANQn0yiUPkYlgFn6N5UHaPOmSHmKPJRbE=;
	b=TWLFaG7B5yaaFygBWF4RLm3MFUYnCQbVIOeP/9w8A8pnHykUDVDwA4mFORzEqQ8LZMyE
	 CjnZADW/UM1YszxmvO23DVT2YgjYH0MNgkAbI1TdrM+6H3bAJhhUgkqP567kdLJ+KuNy+
	 x2h3yd6WMt3y+/gdjdeOVGy8w5PSHCbSYqeLdEjUtVrTFBHVhWpT2LG5IzcVmqOMPMgQR
	 9NghHAXKq7vxCwL0+KHuHScDbTBaOlpIxYszBMbRFd1P5tTJoaXU7ZUJ1nwh94H+URbTO
	 17TZT5K7GGP9vkjYgAZuIXwg88B5GW1GHsKn12R5H1FbGagLslXg8ruABlL3LS9an3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mcIwEC2y;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693D606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C693D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mcIwEC2y
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-847ac7ccd85so3142197a34.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873503; x=1795478303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33e6UPKYdwANQn0yiUPkYlgFn6N5UHaPOmSHmKPJRbE=;
        b=mcIwEC2yvG0XFDUAtWEE4Hj1kaj5KDGfMmkoDyQeJ4UcAihuKv9F9eeFgXM6fsRB+1
         1Tw48aum803dypvcG0XeS8ztTdgJp02Ufu1wZ4ldioAH1T5f2G+y7iZzGAbJk22/DeZf
         UoH2pCS+5cFCNzPJ4x4YErvTwUydZHh62X5QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873503; x=1795478303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33e6UPKYdwANQn0yiUPkYlgFn6N5UHaPOmSHmKPJRbE=;
        b=W5d52BVqPKxASL4On2YANi7qHzL1KmL52Aa0Iy7WwyZgRNt8la0Vhy1lfI7xJ5TYrr
         D//PJ4yiLFUv8KzdK1wPbuNeGzdwOh9JfhFP/j9Buo45D+nnN0tuct/OtZJYpnHf8Szc
         cfOgjIqjQzRBS3IQa1BIXpgVjGHshEp7JrQonLQpgo7gmStkUwOyasrjppoDkz157ltr
         k3+qYdAk1QZdAbljBUtTOIQg3A/gHWOwHOc8N6GQMLu5afFJWqRMSYRSqxgXHqsUAYWW
         dGKNH5DrRNXeu5HMW6ohd9gTdIkkTviFI2mbCLBYyuPqsnx05ahdg8lcefY2vgOu7jFg
         z0ww==
X-Gm-Message-State: APuU4Z/GOXONp0byh5F6dlZWiOXsYbw6akuvi8ECVAgbmpVd38HPc5St
	ql7DdQnWE+kWUi4ovGNot3rQ7HJa2x0AYcFpfp9eIW9mfI9uE/y5TNv9vOsXpi2hK5f8s+caZZ/
	WMa0J2A==
X-Gm-Gg: AYBFou2KBo15XSMmkVrKZKc9I9TzUe3xUI8K+UoDXj8Vn/U3YdxG4JOtklyt/XaBGuS
	fKAvYHgjidlZhN0XYKnuq2O+BnlH7VKIkFIojFg8yKmKr4Wl/0jCtULdDl1XaxnRe10lGWq/beL
	v+CmU7V1U9C1pe6YoNmNcDMRBweRRYjiIPN3aHBO1rKZkAZr0pSLqlVqjDwi56fvPQWTpYJuztG
	WgMMneezMl+fPn/iR46cWc5Z3VHYkwabzxmuZtsT8xIBw0ADfGsWpPyoEAzq/cVniN8XgfJPKEP
	8emu/zBAdbTPs4Tha+0LQ8+NiffLoNFahpxpqnEUnIOXeRrqI9iACAM4Az/QCyO4HNNAOh62LM6
	JyPPyjMXZZEs0Uc17Jig8M6KtU6UwESWNM7jxmYsw9uQBzvR+ilpHRIddZMAN+qzaaIwBYiKhOe
	Tef8tSqpMuyqIplHhZalHKD9xEskQsLJ6uug/aP9+Sxj3xhXBMYnZ2bmdUt21SlqY+iBEnAgpf7
	KIysspfrsjL92iC8IzyHsY0D0S1SjW2+I009Z8Y2BPG7CwCm7BY1dSrULsUvqM/dX/DtRWWMMw3
	EzW3DJpsSNh1Y1+b0UHlAk2qFYVy/OD5IiAXP14INleOmffZM72KobACG4SlQheRyN1EdQQIimW
	ls67IJCZjxm4mif4c8DVEQA==
X-Received: by 2002:a05:6830:2b0e:b0:85f:c55:b0e8 with SMTP id 46e09a7af769-862898287b3mr10970355a34.5.1794873502634;
        Mon, 16 Nov 2026 15:58:22 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:21 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 00/10] dtc: Move the merging of fragments out of the grammar
Date: Mon, 16 Nov 2026 16:57:54 -0700
Message-ID: <20261116235813.935070-1-sjg@chromium.org>
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

Note: This v4 series now only moves the merge code. The merge still
happens during parsing, so none of the problems below are fixed yet.
Once this one is sorted out, a new series will be started.

The parser merges each top-level fragment of a dts file into the tree as
soon as it is parsed, so nothing can look at a fragment on its own. Here
a fragment is a top-level part of the source, such as &label { ... }; or
/delete-node/ &label;, not an overlay's fragment@N node.

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

As a first step, move the merge logic out of the grammar actions into
livetree.c, one action at a time, passing each fragment in a new struct
fragment. The next series will have the parser return a list of
fragments for main() to merge, then add a plugin's overlay fragments
(fragment@N nodes) after the merge, rather than during it.

The output only changes for &{label} { ... } in a plugin, where label is
in the plugin itself, which is now merged in the same way as
&label { ... }. The only change to the errors is that, in a plugin, a
label-relative reference in a fragment which adds a label is reported at
the reference rather than the label.

Most of the merge errors have no tests, so the series starts by adding a
test for each one, checking the message and its position in the source.
At each commit, make check passes and dtc gives the same output and
messages for every .dts and .dtso file in Linux
v7.3-12284-g3799eeb906c9.

Changes in v4:
- Add the &{label} tests here, rather than in the first patch
- Drop build_fragment_root(), append_fragment() and the next pointer
- Drop label_srcpos, since the position of the reference is enough
- Drop merge-parse-error.dts and merge-overlay-order.dts
- Drop the checks that later fragments are merged after an error
- Drop the srcpos patch, which is applied
- Explain why a fragment which adds a label does not go in an overlay
- Free the fragment after merging it
- Leave the merge after parsing and the fragment@N changes for later
- Look up the reference once, at the top of merge_ref()
- Move the &{label} tests to the patch which changes its behaviour
- Report the label-relative error at the reference, not the label
- Shorten the comment on struct fragment
- Use 0 rather than '\0' in memset()
- Use a label outside the plugin in the label-relative tests

Changes in v3:
- Add merge-overlay-order.dts to check deletes and order with fragments
- Change the subject, since the tests are not only for errors

Changes in v2:
- Add a constructor for each kind of fragment, taking all its fields
- Add merge-label-base.dts to check a label which is not in the plugin
- Add merge-label-braces.dts to check &{label} in a plugin
- Add merge-label-order.dts to check the order of &{label} and &label
- Add merge-root-plugin.dts to check / { ... } against &{/} { ... }
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
- Reword four comments in the test files
- Use a NULL ref for the root node
- Use dt_ref instead of fragment_ref

Simon Glass (10):
  tests: Check how the fragments of a dts file are merged
  dtc: Add a struct for the top-level fragments of a dts file
  dtc: Move the /delete-node/ handling out of the grammar
  dtc: Move the /omit-if-no-ref/ handling out of the grammar
  dtc: Move is_ref_relative() to livetree.c
  dtc: Move label-reference handling out of the grammar
  dtc: Merge &{label} in a plugin as with &label
  dtc: Move path-reference handling out of the grammar
  dtc: Move labelled-reference handling out of the grammar
  dtc: Move first-reference handling out of the grammar

 dtc-parser.y                       |  96 +++++-----------
 dtc.h                              |  37 +++++++
 livetree.c                         | 170 +++++++++++++++++++++++++++++
 tests/merge-delete-missing.dts     |   9 ++
 tests/merge-errors.dts             |  14 +++
 tests/merge-first-ref-relative.dts |   7 ++
 tests/merge-first-ref.dts          |   6 +
 tests/merge-label-base.dts         |  10 ++
 tests/merge-label-braces.dts       |  12 ++
 tests/merge-label-order.dts        |  17 +++
 tests/merge-labelled-plugin.dts    |  12 ++
 tests/merge-labelled-relative.dts  |  10 ++
 tests/merge-omit-missing.dts       |   9 ++
 tests/merge-path-ref-missing.dts   |  11 ++
 tests/merge-path-relative.dts      |  10 ++
 tests/merge-root-plugin.dts        |  12 ++
 tests/run_tests.sh                 |  59 ++++++++++
 17 files changed, 433 insertions(+), 68 deletions(-)
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
 create mode 100644 tests/merge-path-ref-missing.dts
 create mode 100644 tests/merge-path-relative.dts
 create mode 100644 tests/merge-root-plugin.dts

---
base-commit: 774adc25940050fb06f241b1a2a98e7421e6ed7b
branch: dt-forest4

-- 
2.43.0

