Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994779;
	b=pfUW05YLtGDfqKhp8DsCzn6mdMbb8GpjzskyywinYYZB4Y6dG1n8NW6VeE7lKEeH8rPq
	 cZU20yry8QF+kaTDyNHJrx7sdcTeoCw6j9x4Zqa7003WsamtcquFfYrbpHeC0TmrA5D8m
	 PVa20RFwTl1u9B/DPHpPCzusIyTyhEUj513xhYCrpQ+fisqrgAgWvSMbGMh8SV5j+PexO
	 tzaRMPRkQuubYGRQpYxPbAGzWhuh3RCWTv6OkRbb5zAh6kEaO2HDBXMNOzBSeFikYLiTm
	 KCgtjBzFFWAK7GD9GUpybQ/9G9Mh1bAYUorigOJC+vPcDkTE48iVE9oamfCaGp/0/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=K3mGMOjTuDNuJsX9ak/R9lz/tpYuQiMBgK82gytHOWQ=;
	b=wL3XSqwWRXXo5Wr3Tuh1xlCFDWicIYQHwMyloKiQuSe0BBDBQgm+vmNlUBeWqxvvzE2w
	 dkmSxM43X1Fx25ppsg8fk/y77axjqF3YdoZ4S0esinzWZx13xBr8jiLsuq3HtxI/wcsqa
	 Cs1Od2nbYGVEwgnBJltAevmQXlQXmdksMCERXfLEU0hvPWr4nB/aGJOCNaMNN6TygJ43F
	 AJ8r/TZ8d7YrwGzkVspGQ7NbaE7aGsvLDO6NaSxpYF470s3bjFaSUGrCnvE/+dz0/PeP0
	 BVKcBxjnIIAZNgedVzLRVUEVmooRjUNgQ39AbnxGKjX2XJ3hE+2OfEPuMcJThfk0U/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NxnwXOfW;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6820606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6820606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NxnwXOfW
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4911df1e196so507709fac.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994778; x=1794599578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3mGMOjTuDNuJsX9ak/R9lz/tpYuQiMBgK82gytHOWQ=;
        b=NxnwXOfWcN9PiAEEK4iioBQuVXcOgTWb2Ea8IDtByrBTTd/T/Vmbbj7cdjgM/YQgUs
         S1rRHcBRi8acnIyBWOf89c5CDXSeyU1oNIqra7NnpPGEqdf4FuEDBYkN6mMVcBrYFcnk
         2M9aFkU/g+QuufgmwQlF1h9Ljq2zEaoUTButQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994778; x=1794599578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3mGMOjTuDNuJsX9ak/R9lz/tpYuQiMBgK82gytHOWQ=;
        b=GllqTVgUoGSxHIBvJw49+inQDpgFNRwD0HgFe7hU2iQGUjGTCN8Ejwiu+JuZ3wLtTu
         mLHdAmb4Vtrx5FuszPgdJ6eZaU5AXDVgvfl42vwGWRpbPC8W04qBtaYi3cxB0NmkUGN1
         ASwOnk5wvsaaQUCUYlqY5iYrh01koH60b7+AvoVL69BNlFxTNGaANPy5QFoLTugEBbMx
         WOjs2MHk/bLrfra6Bk8MOuk4n8Ba4xAXsCuzKqYMSREf+wj0HnVe+jJqUrh1cZ6TevGF
         B2Z5+4mknt4zfqvfU2qa1WDl8UgS6RL0qSTCDnm1KY+Vlosk8C6WBs8Ey9Wbt+4HG643
         JZSw==
X-Gm-Message-State: APuU4Z/XnCKgl3aM/7VncY9Fvm0jQZ8PaMuKkFxXdisDtUrGgkqpM+Ij
	mMckIEz4SaE+8iLAYbL8PLGw3fPXeLl2Nru8NdN1N44vGsVpVF3v1sUudjimme4M6hXwDZpHk54
	5s+dQmw==
X-Gm-Gg: AYBFou12fupNQNqw/lvEfbzYOCdMCvt56mzS0b3c19Cvj30bMiJH+aE1J3OQFp15b4J
	M9NMuiB6oKfCIArXFWf7E2bOiLcAD5ioiYFEPh0LaqrTfhglQqbfhDD+usWIzFT6UlRTbzlvF46
	+VQpSH3RwKtEn4XbDjqewOCUcZXLrUq7zmG1yO8i20MaZBbknoofqny/+MGEB3SwVLTJO4BKtN8
	imI3J09aWPaKoCbz/UaHEPsznOmTOUqD9elNnWmlwel3K4oEr+9Zs13vOi5qvXsvIpAyrxJD4W2
	5BYxWFCbHF9Jxpsspo8RdBR4uR4MvRGDTij0CTJ84ucnQXCoyK27fT2aX4dAaTEyGunXBaXtFYr
	8RBakQmlzMCnOZv2zk0HBxMfIoIrjjgDbfXV5F+e7GGSMZEWz50MHaF4tFrjyhiyPWth6Bem/tb
	8/q7rU19fIbcGnYrPLsZRDQz8vszxX2St76YVrMYsJDcx7WA82Cw+vGOJfMa2Ki1rXE5nzvSc7V
	02E4e3K0FIqfF2YMbdW0aRO3mss9oAZS8CLmxTs9cN28H7wE00ET1Fx81SSBibmucGAhXSKVOA/
	WLE5XDz4N47c5kH5bvVbmWiISbmxgeGrmFbCldHRoCtQsn+iCFA/eRXe8kljUCw8IPIdhHh4gBY
	yxBbqJeM1Fr0BWHOgEz4Yjw==
X-Received: by 2002:a05:6870:aa96:b0:4a7:75e:fc7f with SMTP id 586e51a60fabf-4ad986ad88bmr2230326fac.7.1793994777736;
        Fri, 06 Nov 2026 11:52:57 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:52:57 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 00/18] dtc: Merge the fragments of a dts file after parsing
Date: Fri,  6 Nov 2026 12:51:27 -0700
Message-ID: <20261106195159.2623314-1-sjg@chromium.org>
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

(this series is now far too long but I said I will send it - will split
up for the next version)

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
action at a time, then have the parser return a list of fragments for
main() to merge. Finally, add a plugin's overlay fragments (fragment@N
nodes) from main() once the merge is complete, rather than during it.

The output only changes for &{label} { ... } in a plugin, where label is
in the plugin itself, which is now merged in the same way as
&label { ... }, and for a plugin with a / { ... } fragment after one
which refers to the base tree, where the fragment@N nodes now come last.
The only changes to the errors are the final message when a reference
cannot be resolved, that a syntax error later in the file now stops dtc
before any earlier reference errors are reported, that reference errors
now come after any other errors from the parser, and that a plugin can
no longer refer to a fragment@N node by its name, or to a node in one by
its path.

Most of the merge errors have no tests, so the series starts by adding a
test for each one, checking the message and its position in the source.
Every line of the new merge code is then covered by the tests. Before
the fragment@N nodes move to after the merge, it also adds tests for
referring to one by its name or path. At each commit, make check passes
and dtc gives the same output for every .dts and .dtso file in Linux
v7.3-12284-g3799eeb906c9, with the same messages apart from the changes
above.

This series only moves the merge. It still happens straight after the
input is read, before any checks, so none of the problems above are
fixed yet, and all fragments still come from source rather than a dtbo.

Following this, the plan is to apply deletes while merging, deciding
what a delete in a plugin should do, and then to run some checks on each
fragment.

Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/

Changes in v3:
- Change the subject, since the tests are not only for errors
- Add merge-overlay-order.dts to check deletes and order with fragments
- Check the final message when the parser finds an error
- Add new patch to add the overlay fragments from merge_fragments()
- Add new patch to check references to a generated overlay fragment
- Add new patch to add the overlay fragments after merging a plugin

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
- Update for merge_fragments() returning true on success
- Explain the aim of the series and what it does not do

Simon Glass (18):
  tests: Check how the fragments of a dts file are merged
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
  dtc: Add the overlay fragments from merge_fragments()
  tests: Check references to a generated overlay fragment
  dtc: Add the overlay fragments after merging a plugin

 dtc-parser.y                       | 109 ++-------
 dtc.c                              |   3 +
 dtc.h                              |  57 ++++-
 flattree.c                         |   2 +-
 fstree.c                           |   2 +-
 livetree.c                         | 364 ++++++++++++++++++++++++++++-
 srcpos.c                           |   3 +
 tests/merge-delete-missing.dts     |   9 +
 tests/merge-errors.dts             |  14 ++
 tests/merge-first-ref-relative.dts |  10 +
 tests/merge-first-ref.dts          |   9 +
 tests/merge-label-base.dts         |  10 +
 tests/merge-label-braces.dts       |  12 +
 tests/merge-label-order.dts        |  17 ++
 tests/merge-labelled-plugin.dts    |  12 +
 tests/merge-labelled-relative.dts  |  14 ++
 tests/merge-omit-missing.dts       |   9 +
 tests/merge-overlay-name.dts       |  14 ++
 tests/merge-overlay-order.dts      |  19 ++
 tests/merge-overlay-path.dts       |  13 ++
 tests/merge-parse-error.dts        |  17 ++
 tests/merge-path-ref-missing.dts   |  11 +
 tests/merge-path-relative.dts      |  12 +
 tests/merge-root-plugin.dts        |  12 +
 tests/run_tests.sh                 |  89 ++++++-
 treesource.c                       |   5 +-
 26 files changed, 750 insertions(+), 98 deletions(-)
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
 create mode 100644 tests/merge-overlay-name.dts
 create mode 100644 tests/merge-overlay-order.dts
 create mode 100644 tests/merge-overlay-path.dts
 create mode 100644 tests/merge-parse-error.dts
 create mode 100644 tests/merge-path-ref-missing.dts
 create mode 100644 tests/merge-path-relative.dts
 create mode 100644 tests/merge-root-plugin.dts

---
base-commit: 54e547173bf0f2a4cc35eba8b5738caf38b9230f
branch: dt-forest3

-- 
2.43.0

