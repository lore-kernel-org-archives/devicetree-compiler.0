Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810510;
	b=d/wnHKo0ofo+yA3qmOCgDl2r4NQ2zyPgtdjkXwKCKhx59is/eB3dlWBIcgT+4Avmpcgj
	 FUa/V8LrV6nsDhkeCU31pvDHasPIyWUNeTtDrqzVFcgc46qVFhTNLcbO2xcNdlXr2PKTN
	 QaTDdUr7Awx0/dE8SKoso5J+JXXI5npMpqGgtOOCNjvlHPWoS+FpzPEoJysTDRuopXYhA
	 YP6lFn9frE3IR+i5vXm3OwEbJYfhulwEozJWUcuAcXJuROJb/KDMMWdAjPmqLeX+1k+Jk
	 qIY2FOgL+rR3LrEXs56koXsQ4CeMOIpnFyfdZKi3W/sQW8vUVRaIMTHOTEHhMRq/eQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aXedRD2hLbBBwowCr8wizb5Rgoo5LCLpZ1BjTFJDNgo=;
	b=umvU8BklIp4ZkfmnnUcVeWYnl7HABuYWOoANJ0VDnQV2dR7YuN1dNtPjRbUT77CxaDy6
	 sFd8bMHQcnvFTUa3d/kMUkSwOyvwmAMH2jxXicqFMfAx/0eXruSwOic9/9SCZFPEqOqnR
	 h/xz7U+VuaLltyQm/PXo6bLwy62E0dnMnAsVykUM+x3f4PvASA+0F0zmMi6YkN+J/pJ35
	 CzWG0sumnXVbnG+3Foqx0OOoRCs2ire5VDU9rTJJ6dvb/UuIUgfINTli68EVc9tlwaF79
	 csWKnMcuVRknx5E6/BTTcuXVt1ALBCNXAq4/WR/PE8G/UqqlSN2Cm18Dk1QrXU4XG4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MmHdp6i8;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A7606A329
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 20:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MmHdp6i8
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-86298f9267fso4386751a34.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795810509; x=1796415309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aXedRD2hLbBBwowCr8wizb5Rgoo5LCLpZ1BjTFJDNgo=;
        b=MmHdp6i8DTOztmcrdYGeZTjKpQIeHHKI0rniN55ETCwdAh1X8tU1gN1gACxjDWC1ax
         amX6q3/dRQcWI/C48PshmaX//YIKmVWUJ7oagGYPej5he6dNk5obztUX3i8jnvQJrGwl
         2MVS+ej2Qp3zG+EWDyHdHrdl2TVnPXNM22amo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810509; x=1796415309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXedRD2hLbBBwowCr8wizb5Rgoo5LCLpZ1BjTFJDNgo=;
        b=XpXiCgd+YSCPwZFMsTI1X4QzB1JAXMYUt4efnB9nZmWbcpxLhOUcq/ntnOu/R2+G6i
         MWs0EexglcipJT78Iky8iIemd35n0056mFk+cQb7486PyPeX4duyVtdmv7yu/MAxzN0J
         dwCV41QlM0VnB68kWlUq6r2N+RraGUm80a/asLsAH3RIorGxFNhJWqQYJEbFW8vzQvL5
         NqrbZPZelkCKmOf64R5SgJyLPUoju+MfkWAQywSDJkxvYBmGPCBXPsf+rO9V89YJ8gKG
         JmI8I54VCAN4lRqG8W5GopsYhZj2lfYAWoeaTwcIExj3SYvYfj9EgyH5IPVR+pi7+Q1j
         efzw==
X-Gm-Message-State: APuU4Z8yAor2xNzDJ4YunztnrS9yKauB2IAxJQFGmH9wIX/ouf8nUQ83
	c3yBHxtPyO8zZkcz0zT1NT1tS6cOEEqWS94T7EXJM5/hOtWFPHAfT4HkqzH67/GBMzk+uKev5LM
	/GggAWg==
X-Gm-Gg: AZFdTZfYpZbwpaHmZsmrp0iWi2kJR7M0+XEGqJ2BY8FEoJeDOxqDKbkRo3AmcQyetDc
	VpPflr239GtPj0ch4dQAfFGGk749LqJ3eV1gl8ARoonEUGtQUdoHu//+imtEPKS7Rq6Ibj1xTyi
	c8GZG/OfmF1P9GGVJIQrWovT9blZAAst5i40gnVoWq6rORUF21K7IOUTAoY0j99RiaFjNpue0Sg
	lBCDaebjWguJnyS5NUwLPFuQDCs0/RjzBaDPHpgzpwvq/EZndwak/DTPu9mt9JjbtOBv7u+J7a/
	Q5fen/AjFwyfNxkxDQjwNdHR8q/+aT92uM0zfge/3+q3orShbE19fDQtSHfdKxN+UY+xNnJ80te
	Z1R4PJI1tc3/ZWrZguyy4kyB5xDWJGVC+BdjDWvEMDwHEqjHp24EI8hFzxvuKS7nJtp8AY0r7UU
	2WeTizL5n6JuZquBNmpPCpYfqG+azsT4UTKTYxvgcoaYYCrspTQ9+RNqfNI363f0xbRd3VnSqis
	m4aaULd/upNaRrQe4M6t7qeviB2ZJ9/zEx3/O10r92nejQBqutLknadEWdV4wT8XviZBaFQzGkx
	qRidqbqXVphG7GAq7nr5Tj84DJKLxSugSqqBcQjxGPqRrKZYA0xPhyqastT88JR1GTw75thWUbC
	dHFL8Ed9NOPLMF3BAZwKp
X-Received: by 2002:a05:6808:1986:b0:572:72d4:9ac9 with SMTP id 5614622812f47-57a09e0d7c4mr30972463b6e.27.1795810509018;
        Fri, 27 Nov 2026 12:15:09 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm18881561b6e.16.2026.11.27.12.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:07 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 0/6] dtc: Move the merging of source layers out of the grammar
Date: Fri, 27 Nov 2026 13:14:43 -0700
Message-ID: <20261127201457.1837712-1-sjg@chromium.org>
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

Note: v6 drops the eight patches which are now applied. It adds support
for a label on a reference to the base tree in a plugin, as suggested in
the v5 review, along with a libfdt fix for the symbol this gives.

Note: As of v4, this series mostly moves the merge code. The merge still
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

The output of these moves does not change. The only change to the
errors is that some are now reported at the reference: in a plugin, a
label-relative reference in a source layer which adds a label, and any
error in the first source layer.

Moving the labelled-reference merge shows up a gap: in a plugin, a label
on a reference to a node in the base tree gives an error, or a syntax
error in the first source layer. An overlay can add such a label by
putting it on an __overlay__ node, so make dtc do this, and fix the
symbol which libfdt makes for it when applying the overlay.

At each commit, make check passes and dtc gives the same output and
messages for every .dts and .dtso file in Linux
v7.3-12284-g3799eeb906c9.

Changes in v6:
- Add new patch to allow a label on a reference to the base tree
- Add new patch to allow a label on the first source layer
- Add new patch to drop the trailing / from a symbol for __overlay__
- Add new patch to report first-layer errors at the reference
- Add patches to allow a label on a reference to the base tree
- Drop the 8 patches which are applied
- Drop the claim that dtc cannot label an overlay fragment

Changes in v5:
- Drop the merge tests and is_ref_relative() patches, which are applied
- Say that a label on a node outside the plugin is an error
- Use the term 'source layer' rather than 'fragment'

Changes in v4:
- Drop the srcpos patch, which is applied
- Explain why a fragment which adds a label does not go in an overlay
- Free the fragment after merging it
- Leave the merge after parsing and the fragment@N changes for later
- Report the label-relative error at the reference, not the label

Changes in v2:
- Combine merge_labelled_ref() into merge_ref()
- Explain the aim of the series and what it does not do
- Return true on success from merge_first_ref()
- Use dt_ref instead of fragment_ref

Simon Glass (6):
  dtc: Move labelled-reference handling out of the grammar
  dtc: Move first-reference handling out of the grammar
  dtc: Report first-layer errors at the reference
  libfdt: Drop the trailing / from a symbol for __overlay__
  dtc: Allow a label on a reference to the base tree
  dtc: Allow a label on the first source layer

 dtc-parser.y                           | 65 +++++++++++---------------
 dtc.h                                  |  5 +-
 libfdt/fdt_overlay.c                   | 12 +++--
 livetree.c                             | 52 ++++++++++++++++-----
 tests/merge-first-labelled-missing.dts |  6 +++
 tests/merge-first-labelled.dts         | 10 ++++
 tests/merge-labelled-base-tree.dts     |  9 ++++
 tests/merge-labelled-base.dts          | 19 ++++++++
 tests/merge-labelled-missing.dts       | 14 ------
 tests/run_tests.sh                     | 60 +++++++++++++++++++++---
 tests/stacked_overlay_symbols.dts      | 19 ++++++++
 11 files changed, 193 insertions(+), 78 deletions(-)
 create mode 100644 tests/merge-first-labelled-missing.dts
 create mode 100644 tests/merge-first-labelled.dts
 create mode 100644 tests/merge-labelled-base-tree.dts
 create mode 100644 tests/merge-labelled-base.dts
 delete mode 100644 tests/merge-labelled-missing.dts
 create mode 100644 tests/stacked_overlay_symbols.dts

---
base-commit: d6c37926ff8e4d15c1aaaf2b6f1147e78cedc7c3
branch: dt-forest6

-- 
2.43.0

