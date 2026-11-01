Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551065;
	b=qR4lITNnbfNxkFi2YQtq06q8J+eWuNsQwbmTti0vOxkuYgfpENahdNNqvCIqytwWpN57
	 wgOFJPGu2MXH9GpUig8nZqfGbD4lgp1VDjHDmLc+w07V23m+f29wvY7cX5CAeoIbgvMbb
	 BBlKGQEEpPWFz0hudb8JRr148uhBBXK5N3GN0b29YAbwAbdFK44mfurO9QjIDAthASdGQ
	 j1f/1Br+uD6Pj0bRLJICvhLlCMXtZU/P65XXXafCImE4EtZkXgLIC7kgBHl+0sVynf/hk
	 AmRjiDnphNOJqvmMR5jLo2TNKdzB50PzfLDLGHhw7HUMzPw7EbW37Wxxo8QqKY603cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=O8gS12axufrTYytFJr4tTdm52qmSjkmqiAqqzOE2Rvo=;
	b=E4flJdY1QRhdOWXdNPyyUQ2rpnIagRJNJbaCIIREj1uowN111iQV56zMJm/pm7wp0eln
	 0rWmaLl8ed2oWFKHt5yBxgQbOJOTPAzpOLDjDCGUi87LPQQm00vIpI4bfWbjqQmORS9Qj
	 ZkharElWD6kEDNhodXHQc7ucw+eBTcfHGlAtvKGixxpk2xNoshOd2W5MYzv9EtaQkQe1e
	 B7GldjCp/ZtDT0OHTN98mBuXfWPpKuj7FaBnQYz+y3S02CI118IwQuZwBzEieS2a6I1wU
	 VCStp/kxJ8JaBNnS+GVPzEHMgWjzQYB55qMTD1LYhnXKI+3nHZ5MLrRfvK/LUT/5IWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tr5fl5Hf;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420D606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D420D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tr5fl5Hf
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8241a56cd70so1644974a34.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551064; x=1794155864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8gS12axufrTYytFJr4tTdm52qmSjkmqiAqqzOE2Rvo=;
        b=Tr5fl5HfW+xKGP1CkY98EWCPGSEOwt3u5WYzgT4Ah9tdqQMYvgVatjZ7ogyD883C2A
         uvs9yY+8o/heyLi9BZH06x9eY0r0hG2g6YRTpbkcT5pwnCxpYaJtetROPNrpKgpiTFC+
         F07tzkQ8svvo2Hc5Syj+ZWxJs4VY+K+9kIVWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551064; x=1794155864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8gS12axufrTYytFJr4tTdm52qmSjkmqiAqqzOE2Rvo=;
        b=NWhzZHWxWFnniE193L8dMbaLWnHErUmKECRVseK8hTgsYRlk25S6q1CK6BRtbtP3iA
         hh/hFRjI7l+Sqr2cAqDwGWI+YYSc7//+EhMuBygOR67yiIwSjn7qw7zxnIbYxqqXWGdL
         UtQ7Wka9sKYMDws+SPc+qugjneHPjBaK+JXEYFnIsAB9Xbhwmvn4qyNSfFNtee9Vm3hF
         L81p3VoGeGZKxQ+SeQif3p9tXbJkR3DB0ZtE2shCJtQJoLlL5V4B9IetwECUfAzmioJz
         2u6IZQxNk93OcWmqdP8JDb0Tqi1GMrvOrZ49zGzQSPhLBzDBaEd2cBkr6arUZ3y39ZkA
         9WVw==
X-Gm-Message-State: AFq9FYJ4Hq0y+3MyIXKLgzqMi6JlxiqJvjOdoMzS1zacOCMM48+tiTiU
	B4Zg2BIWQIpJbjX5pXtIcxASo9mKZLDAJkc+HS2BkA4syUeil7wqBHFZV/ekST7S4z/yhMFSNZO
	Ckcl4Yu12
X-Gm-Gg: AYBFou3L36xSEVqtGyTF6n9y2gkxXgoFAk0HNoy1lD43GZk6lnBPlZwYw3ktFeElBOB
	FqN9IJqsssDiglZUVCRHYVsSEX1XwVZ5g76TL6EFDqZQn6/ycydJ+nczhWmmq2shj0dL7QZohJJ
	hWgJbGokjg/eEN30wZ9Fyc8Qo2DAmKn3v21oWqn/vmQjmwRUoxw2BIFMKVz+EMKS4Yigj1ma1nT
	KQAAO/DBz31NZV3uES4zAUARaH1TwxH63AJWzce405t2qUHH+m9bPHCaTgwFbLR9rM/leSejVBT
	tRSSHcBm558JBi8FlyGd6RtUzPWLhLPwDbMBuGg6PuD4hYkQU5+APpiMioyI1+kR3mTcIt/Dlim
	T7speHvwhfpARGDlbjaQC5ucjwIjv20OtI/L8OEGtwWKxIh7YXYcshfPabp8A8u5Lweyfg/EEDQ
	8ooOB1S9jYNyP5upOX/vfmbJkD71LzWg94+mG1MOx1Eeric6lrMxQB8XCsGNQ2axMx73WMqDlPv
	mkXvlHcQBdkzUJjfHgwB9OO6hJwU2KF7hDBMSewlahVHHbkzMheYFuuZt/D53W+IRrBl2jyEoub
	uwUZ/5uoE4/0IcaNsnjQAfrz2gDY2a7mYR4IDk1dSqPJ518ptwDxDKvBlgTun639Oh9R/dg4ZLM
	8o9wVMbzR/o6fQIH9pChpUA==
X-Received: by 2002:a05:6830:680b:b0:845:156f:58a5 with SMTP id 46e09a7af769-85d364a83f7mr5472922a34.10.1793551063764;
        Sun, 01 Nov 2026 08:37:43 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:37:43 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 00/13] dtc: Merge the fragments of a dts file after parsing
Date: Sun,  1 Nov 2026 09:36:54 -0700
Message-ID: <20261101163721.2458982-1-sjg@chromium.org>
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
soon as it is parsed. This means that deletes cannot be dealt with
consistently, nor checks run on each fragment before it is merged. Here
a fragment is a top-level part of the source, such as / { ... }; or
&label { ... };, not an overlay's fragment@N node.

As a first step towards keeping the fragments apart until after parsing,
move the merge logic out of the grammar actions into livetree.c, one
action at a time, then have the parser return a list of fragments and
merge them from main(). The output is unchanged. The only changes to the
errors are the final message when a reference cannot be resolved, that a
syntax error later in the file now stops dtc before any earlier
reference errors are reported, and that reference errors now come after
any other errors from the parser.

Most of the merge errors have no tests, so the series starts by adding a
test for each one, checking the message and its position in the source.
Every line of the new merge code is then covered by the tests. At each
commit, make check passes and dtc gives the same output and messages as
before for all 4162 .dts and .dtso files in Linux
v7.3-12284-g3799eeb906c9

Following this, the plan is to apply deletes while merging, deciding
what a delete in a plugin should do, and then to run some checks on each
fragment.

Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/


Simon Glass (13):
  tests: Check each error when merging a dts file
  dtc: Add a list for the top-level fragments of a dts file
  dtc: Move the /delete-node/ handling out of the grammar
  dtc: Move the /omit-if-no-ref/ handling out of the grammar
  dtc: Move is_ref_relative() to livetree.c
  dtc: Move label-reference handling out of the grammar
  dtc: Move path-reference handling out of the grammar
  dtc: Move labelled-reference handling out of the grammar
  dtc: Move first-reference handling out of the grammar
  dtc: Add merge_fragment() to merge any fragment
  dtc: Add helpers for the errors when merging a fragment
  dtc: Merge the fragments of a dts file after parsing
  dtc: Merge the fragments of a dts file in main()

 dtc-parser.y                       | 130 ++++---------
 dtc.c                              |   2 +
 dtc.h                              |  48 +++++
 livetree.c                         | 302 ++++++++++++++++++++++++++++-
 tests/merge-delete-missing.dts     |   9 +
 tests/merge-errors.dts             |  14 ++
 tests/merge-first-ref-relative.dts |  10 +
 tests/merge-first-ref.dts          |   9 +
 tests/merge-labelled-plugin.dts    |  12 ++
 tests/merge-labelled-relative.dts  |  14 ++
 tests/merge-omit-missing.dts       |   9 +
 tests/merge-parse-error.dts        |  17 ++
 tests/merge-path-ref-missing.dts   |  11 ++
 tests/merge-path-relative.dts      |  12 ++
 tests/run_tests.sh                 |  44 ++++-
 treesource.c                       |   5 +-
 16 files changed, 551 insertions(+), 97 deletions(-)
 create mode 100644 tests/merge-delete-missing.dts
 create mode 100644 tests/merge-errors.dts
 create mode 100644 tests/merge-first-ref-relative.dts
 create mode 100644 tests/merge-first-ref.dts
 create mode 100644 tests/merge-labelled-plugin.dts
 create mode 100644 tests/merge-labelled-relative.dts
 create mode 100644 tests/merge-omit-missing.dts
 create mode 100644 tests/merge-parse-error.dts
 create mode 100644 tests/merge-path-ref-missing.dts
 create mode 100644 tests/merge-path-relative.dts

---
base-commit: c22868416b8db8354ce5db29d3494dda688a2ae3
branch: dt-forest

-- 
2.43.0

