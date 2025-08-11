Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA73519C560
	for <devicetree-compiler@vger.kernel.org>; Mon, 11 Aug 2025 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917458; cv=none; b=tEoQY0ysxL1IuY7FVdLBhbFSKhgXn29cwVDqxzU0CMK5BEVNkP5TGtxOIy3xTF/00m+P8qtXW5oIMz9AotNKdNjxr5gBAYgdmivbzwsYPfmoEuKiqtgrtqX0J8/6ZPU8qV2LC5t5SOtBrvpZadtUjjnS0KkkgFntwpmpo+b9rNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917458; c=relaxed/simple;
	bh=FtDZZrXQ220Ms3Va6QfnN5sUY8y8nSgYOI2pWoGdW5Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SQHtunN3/d7TYP9WjhaefEnrNcMs0D2O9WSCe4Nn2Skq7c/4EskhKhvrQs2CqJodSnJDn5t366Ftma0Ym3Ssqv8pYL0FwO506hFPqWlrIQgW8n/mwRK8rtCKtIt7T5UmveWFprwr6Bc3mf2CFL3giqKVOBwi06q31fD14Cn6g1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzGlxf8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzGlxf8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAF1C4CEF7;
	Mon, 11 Aug 2025 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754917457;
	bh=FtDZZrXQ220Ms3Va6QfnN5sUY8y8nSgYOI2pWoGdW5Q=;
	h=From:To:Subject:Date:From;
	b=mzGlxf8fY9Z4pBtIN3XiXyVHD1KcSE8z9n2ArvXfuuXEuaGSXupaOqkBnuhkZjBCP
	 HVO7Jrk22geEiCkZ7CnI+pFJwhk1UFDZjyEMiJpswC0z+ivMkyw7A5s0En1ZJuHTbN
	 etvKT1BZzqDJ5gvEXpqbf88S9TfuYbf4KwVYCDoA/1jcvs+Ewxe88EozBRUGnc6R2u
	 0F9nRrk731JdqKB7jJZmlHHeoKRtBBDwU8rN3qKsk03jkzB0KZYvtQOWv72IbH7GFx
	 GVv1TO4zwzyhP1OhGG2CzVBfhoRkOfX9OFR8l+/BANYm4cluzQh5gtrBK21p+UcUEw
	 CAv/R8jLO/gTg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Gibson <david@gibson.dropbear.id.au>,
	devicetree-compiler@vger.kernel.org,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH] libfdt: Drop including string.h from libfdt_internal.h
Date: Mon, 11 Aug 2025 08:04:16 -0500
Message-ID: <20250811130416.2653959-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0f69cedc08fc ("libfdt_internal: fdt_find_string_len_()") added a
string.h include to libfdt_internal.h which introduces a libc dependency
which cannot be overridden. Environments without libc (e.g. Linux
kernel) use a custom libfdt_env.h. string.h is already indirectly
included in libfdt_env.h, so it can be dropped from libfdt_internal.h.

Fixes: 0f69cedc08fc ("libfdt_internal: fdt_find_string_len_()")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 libfdt/libfdt_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 773bba87bc6e..b60b5456f596 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -6,7 +6,6 @@
  * Copyright (C) 2006 David Gibson, IBM Corporation.
  */
 #include <fdt.h>
-#include <string.h>
 
 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
-- 
2.47.2

