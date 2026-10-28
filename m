Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172894;
	b=RN8uCeINsggpThHQmIpmfhLVCnyXX0gDXXQoKbdjrxDICv/4HylSNrOs5wtUL54CYXRx
	 2vA4GIUHeL28F1ph35y8aqrMvdLpa4ncpqGMHoYta6nqaIFJ5jrzQXhK6a6rX/ixFiXsy
	 MMC2F7rThaDvTmoysbo0FxBRcT+nYy07u1TSyB0Sqr+gi46uZ86fWwIfb4F6kMODih4Ox
	 RC5b2BtMhHETkWYwp4oYPEuqWQ8JTT16LOSQ5itK+0tXNF1dQlf5v8N7F9/XpTC/RVzNb
	 xbNSxo81ioSyp2Euj/cliXZ/uY7DrxAQMOblnwdPklIxT6cGEa3hdCwZ9MGXj8MhO2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CFme45j/lA7/P7QFdVGnhet+AuzWLjnVGSHSYrMlBIg=;
	b=5a5uYSUxp6/NptRxdtz+Ob2hAqiyghA0vjpTfIOQIrFKr/gfAcxk5C4mFzwBdrwb/a4p
	 w3ZHhKrGJBO3NW8djsvA6vsnJ3ChLcacWMkdskBp81Wzu/3tUuaMxnbFlKXkmK+E6TTRt
	 UfwrITiJQGuqoHDDMBtA8R4G7MZNQpvorVjP4/hJ7dybIBw1AEOhY6kbgkvWWg6jVklyn
	 wzo2bgfH3emOqD6p9qdqky8AeQiXDmh4MzSdPdAjs1j0GVZRqeLmqfRuNg+h2ABZHX2tE
	 mY3W3tM0bUMThmv9LWgt/aQ3mEIrWiz43OJMDJT72kBxDq98a67K17Rb86ofJBOD9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OloFWWdt;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630C606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 07:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6630C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OloFWWdt
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8479f46ecd8so321657a34.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793172893; x=1793777693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFme45j/lA7/P7QFdVGnhet+AuzWLjnVGSHSYrMlBIg=;
        b=OloFWWdtUFy06yxcR4sMGgyPzus/ZtpICf86exrRhWRud1peVveulx+C7YgxIc/gyl
         8GAMHx62hzolgv1pLS9p3cmV6N6sYH36raWE6jnhHCMbQb0vGURvr5A5qD7c5cS4V8zI
         V5KZx6WeBl5yO7R+9rakDdvnW1X4EAU/cPqP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172893; x=1793777693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFme45j/lA7/P7QFdVGnhet+AuzWLjnVGSHSYrMlBIg=;
        b=HBgxlL1HWFhAGTr8lveEWGfrDuNWbJsOhKeN3bM4HKdCs8/rT12XB7g31+RPbkpvgX
         YfMkrrTiJWWqJjN8A5423+m0Gwk2vKvqmo9r37RZB+SU7Pi3eGHbF14cMb+x09LFD21g
         sZpGt1pqbxekV4A4wkKlWQg3s+J2olL/9ZszxmCOIQe+7/5AGU4gjB6DUFoUXoVl5cMY
         xP0u86wdZtnT8pLWpByEaBy+zcTnMW+d1mkPd+60gcnEpMLWT1qHXc35fDV98ZGKF3gx
         YkLqkvRipDvqxezTXCn+gEKwir5zh+Oi62MSyXmgaMx2pXfp5+FE304N4TzFo+eSekJh
         uTYA==
X-Gm-Message-State: AFq9FYKK+ZFyg1CzP+dCXo5uUgOxONPoIoNQktzMBisaQ+07Ty20MpjM
	ijfvkwUsPcOxOwFhhK6XeRpHUPcrSCee6fLgOeAInNHrZ92RsfOVFmt3ODBGIoisiT+Aar+abkZ
	WVaCI3Q==
X-Gm-Gg: AYBFou08F1KRIej23Y8QYC3JG9qbV2GEN6+IMRwu397OvKnXM9wEiFVA7spyO28NoD1
	klrDheADHQNi+qtEmaw6a7P0u5NEQveR3GYnKfopbcA0BuW8imcGo9BkyqSDMcD5BkRD/A6mtuq
	bsaoJApunN6aD0KQs6KPhi18Xk0R7Is6VzSOl4pQcsTYt+a0eJin3pEzP0BR7bmu62F/s70vvYi
	DlDlT94fi3FHguaV+kEBA1iKptS1jqKPwNX5OXYzwj749bRJBnZKFkDXotrds5hJzwgUWoIIIV4
	Cmtizz+qnANyRQQqa3rNK4VcD5435rUXdg9OJ6MzQnxjCJNPIiokPRStwgSytZjxoDP0kegFiXE
	C1PL2uhbNPSlFWX2iYC1AgNEIPrbZLlvXSbDYwuMzgpzQp+Z6Vn6dGb8rT/zfspw/qDBV0+0lvI
	5pdR3gLsHQMxHxDoW0WV9zQBccXLHxFTjW0Zs383NZiS7L6ZGl2omUvHwMCRtO6FFWtDWLdVuJ4
	TdXY0OX0w5mtLZJ2gSjwKmyuB6WG68G+yO9jOstfO+gEabsGcrOH1T6q0gaYh/XybGIZF3RccJp
	LR6H2ZspWBxMVHg4KrzdS2+IcOc8+AyEPB8o4/+NkqegmlW1h43VEIU3/qFxLQ==
X-Received: by 2002:a05:6830:2705:b0:843:ed9d:1535 with SMTP id 46e09a7af769-85aba425cfdmr1552056a34.19.1793172893355;
        Wed, 28 Oct 2026 00:34:53 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b20219dc4sm928838a34.22.2026.10.28.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:34:52 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 0/4] fdtput: Make it clearer how to create nodes
Date: Wed, 28 Oct 2026 01:34:16 -0600
Message-ID: <20261028073440.3327687-1-sjg@chromium.org>
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

fdtput can create nodes with -c, and -p creates any missing nodes along
the way, but this is easy to miss. A user has asked for a way to add
nodes, not realising that one exists.

The first patch makes -p reject a path without a leading '/', rather
than creating it from the root, as fdtput already does without -p. The
second allows such a path to start with an alias, creating nodes below
the node which the alias points to. The third suggests -p when a node
is missing, naming the parent which is missing. The fourth names the
property, as well as the node, when it cannot be deleted.

Link: https://github.com/dgibson/dtc/issues/49

Changes in v2:
- Add new patch to reject a path without a leading '/'
- Rework on top of the new patch which requires a leading '/'
- Drop the Fixes tag, since the new patch fixes the bug
- Check that the error suggests -p, using a new helper
- Drop David's Reviewed-by, since the tests have changed
- Report the node as well as the property
- Check the error message in the test
- Drop 2 patches previously applied

Simon Glass (4):
  fdtput: Require a leading '/' with -p
  fdtput: Follow an alias when creating nodes with -p
  fdtput: Suggest -p when a node is missing
  fdtput: Name the property when it cannot be deleted

 fdtput.c           | 41 ++++++++++++++++++++++++++++++-----
 tests/run_tests.sh | 54 ++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 88 insertions(+), 7 deletions(-)

---
base-commit: 1d50f3f8fa8bf9429eebb0769dafa5df37381ae1
branch: fdtput-nodes2

-- 
2.43.0

