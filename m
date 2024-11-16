Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA21C195390;
	Sat, 16 Nov 2024 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731751999; cv=none; b=h67R3iaaNpNPMwZI+mTUmgTuWk1yaSntfuzw/HJDXxxdkv5XmZ7S0ff/43X4rf9ABQmzKn5KHy3REyqLHpEgGL55lEbo0Iy/Ki8KEIggvh0RFt8p5LxbmuTnfVzCaAtti/fb6fVNoyPG2I0ADzH891wBgjHvVz/y5qXJFdXc8lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731751999; c=relaxed/simple;
	bh=/wtw877WIwTEzF18f53WJgRubDO4zJpiWhWOWIufpiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUNyzZ/8suEH5XFZ3OVTCVp0OXMRxPkSuYB69j/fPlNKrXWSvJiulehpoB0DzKMV+YptwaEzAndp044L1LjEKR3Y1qRj+k/9Tvs/70OTXUUStkcRpVvI02Ms1AbOC1Kc4qYnrwGK97SGjL5E4L4obG6oKZcuQH1xDqfAnT+6Jw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=jSZD+Ain; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="jSZD+Ain"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id A498D38A0CB7;
	Sat, 16 Nov 2024 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1731751987; bh=rI0sao3MYPwOv3g5dJ3KBPxYAGhdSNEPawgL4ulEMcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSZD+AinvbMT6GhkyKCr/coIOvl+VuyKZkZfpIz/JDnLADkaeVH4eRB9I20bJYpTj
	 2qn71EPpVM9OwnunRMHTdjerHx5jyHjTATEyKfXbeFFVTjxfHA0HFNeWkFKdZMMevD
	 setMJDKT5Nl6j/4+PnZuyDMggZrSAluuwUjbpwfhFFTqagWKWxzJSzwIdDBxo90ZK6
	 YU71P9hJ60L6i96QaxR6AqQ3BK3HVVO5ZmaH8ppadHmF5eej2K1ENuFZMlCzu8XVcw
	 Qwf9sGArHrSJ7Wc2bZgN9wqV5HDAKwCNi9gmFHSemgZuytDWQbS1S2hosVbua6wRHC
	 2tSEXwl5UbE04JfpKUY6CT1orZlQVr0223K+MTYrc6/Tv+28YOBQcAIXa3QAIRHZBl
	 WrHblJAj3hRHurS3PDhEBFm9H5zJzTH/oSfY9O2ro0ZOy7fGiEW7RJ9T1gGjb74rTP
	 CKEMv9tvThf/SL4Q3VutX2WlhU3Kbcj2FDr09H8S6ilrTNNQjpFfx2pkpRhvb1hpPo
	 KCaxwooD/iXxTjXqxOXW8xK/W5Bu50QarviRDM62P5MiuJcpL5LZcVtnBTnlbzJ+vE
	 e2evY6V+d+1FOwYzdTW9PIQE3rOFVNbylbaBBbhAwfHEK+WiOPwMXFqDyrFUv12DpU
	 Den5ulun7e/YvIxlz0xlxICk=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1GOaFxzHY5aq; Sat, 16 Nov 2024 10:13:05 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 16 Nov 2024 10:13:05 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: David Gibson <david@gibson.dropbear.id.au>,
	devicetree-compiler@vger.kernel.org
Cc: Bingwu Zhang <xtexchooser@duck.com>,
	devicetree@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: [PATCH 2/2] libfdt: Remove extra semi-colons outside functions
Date: Sat, 16 Nov 2024 18:12:28 +0800
Message-ID: <20241116101228.164707-6-xtex@envs.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241116101228.164707-4-xtex@envs.net>
References: <20241116101228.164707-4-xtex@envs.net>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=xtexchooser@duck.com; h=from:subject; bh=kdGlBjuBwBgHxYM4PZ6/YjLbzyVCRjUyfFZhV9i7Z40=; b=owGbwMvMwCW2U4Ij7wZL9ETG02pJDOkWBTysgi7nFglUq9W8nbZjpcH9j2zPpJnufnh+dVfkx C39+/IiO0pZGMS4GGTFFFmKDBu8WXXS+UWXlcvCzGFlAhnCwMUpABPhZGD4X7JXrWH/Uf4TBi+W +uaeVzw+x3nWjxzDX4nKzxSesGfWNTMyPG8r9X3fEFjVvSI+ePcj/UpuFYmIf3osdoaLD4ueiRF kAwA=
X-Developer-Key: i=xtexchooser@duck.com; a=openpgp; fpr=7231804B052C670F15A6771DB918086ED8045B91
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtexchooser@duck.com>

When compiling with -Werror -Wpedantic, both GCC and Clang fails, saying
that these semi-colons are redundant, so remove them.

Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>
---
 libfdt/fdt_overlay.c |  2 +-
 libfdt/libfdt.h      | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index f9be13865807..1b098e61c270 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -352,7 +352,7 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 						   name, name_len, poffset,
 						   &phandle_prop,
 						   sizeof(phandle_prop));
-};
+}
 
 /**
  * overlay_fixup_phandle - Set an overlay phandle to the base one
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 96782bc57b84..2e182ea3314d 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -263,16 +263,16 @@ int fdt_next_subnode(const void *fdt, int offset);
 		struct fdt_header *fdth = (struct fdt_header *)fdt; \
 		fdth->name = cpu_to_fdt32(val); \
 	}
-fdt_set_hdr_(magic);
-fdt_set_hdr_(totalsize);
-fdt_set_hdr_(off_dt_struct);
-fdt_set_hdr_(off_dt_strings);
-fdt_set_hdr_(off_mem_rsvmap);
-fdt_set_hdr_(version);
-fdt_set_hdr_(last_comp_version);
-fdt_set_hdr_(boot_cpuid_phys);
-fdt_set_hdr_(size_dt_strings);
-fdt_set_hdr_(size_dt_struct);
+fdt_set_hdr_(magic)
+fdt_set_hdr_(totalsize)
+fdt_set_hdr_(off_dt_struct)
+fdt_set_hdr_(off_dt_strings)
+fdt_set_hdr_(off_mem_rsvmap)
+fdt_set_hdr_(version)
+fdt_set_hdr_(last_comp_version)
+fdt_set_hdr_(boot_cpuid_phys)
+fdt_set_hdr_(size_dt_strings)
+fdt_set_hdr_(size_dt_struct)
 #undef fdt_set_hdr_
 
 /**
-- 
2.47.0

