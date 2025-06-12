Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B538B
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Jun 2025 05:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749706717; cv=none; b=VtsVU+2gDhUBbrHWoz0TKWyF5+vguT3WMBxUPu+k49XQS1gne69Ds6vGJ9L+ZPAFbGMlsunQcZW+4Z3EmruOrk0u9fascxEJd5/eIgGAWKySB9MGnNoypJth4+q/n+oC4Goicbnrb6HX5EZMSgvcbb+qPlvF9r2odjSzxU5nq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749706717; c=relaxed/simple;
	bh=bxqckx+Rpgu71q9nSYLDG9FOpW7zTdgYdbiJNiG9eoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmznWR7uBATBKe079OVLNQGUHtkt+HWBj+rYUbl+22rPwd0wXbjclM06ka/wm1LJOvRNgZ3exVP9dgAkNi+lfID/nM/4v5tvjq1HwuckDB3Ewo3CevPXR1yv14CyNPI1jAngTqenvuEyr5RqGpZt4Lx1RfucaSyxddRrfGlhcic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DEDXQf8K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DEDXQf8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749706714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PA5tPFXm29TkXFcEjRxDdNt+VBDOWM1ZZDkLOI69emI=;
	b=DEDXQf8K9ZMWuN7SCL+tmSnfMO0ONRCi7gu35cB164DeOdLoN6ozIbcCmr9NFcLE2GNLGn
	KHDyNz3NCrw26KpsifRmKcbCBCpm5i2X3z1GsaKB62JxpoY6S3KW+EKRiMuxXDJNvWUEy2
	P33F1rGePjam1Q7oZqW473i8kuLyv5g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-FdpakPTyPKGWBqtPN2kLuA-1; Thu, 12 Jun 2025 01:38:33 -0400
X-MC-Unique: FdpakPTyPKGWBqtPN2kLuA-1
X-Mimecast-MFC-AGG-ID: FdpakPTyPKGWBqtPN2kLuA_1749706712
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so231730f8f.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 11 Jun 2025 22:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749706711; x=1750311511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PA5tPFXm29TkXFcEjRxDdNt+VBDOWM1ZZDkLOI69emI=;
        b=ZKr6W6VpwU2aEk8XGycG82MkV7lCKLDhmmnNNMQsZpQlPq29QPExs4ciIRAivqwze8
         IP1T0Eggugy/TUjJ/ZZR/toY/l5QH6xI/ty8KtLDnx5kfqXgGrRHK0sPqmwXMF514Izq
         0OyhZ9XQSht4wRBZnp+xpsJwyIzFX7PjjY/KSA3aIypAwAAjFra/16HD7Wvyg+OBCmDx
         qnDecfvJkCi5YdCWI0qNWzbLV8p9BJG4dTYCT5+L3UMjN9JYZYv0dekvG/jGIO8sk0b5
         WOpkslrhCufuN7yMCVjby4dYyycRHYP1trH/585R2msC8ZmVIZ6bAlIM/ZCosIDS3Nsj
         C41Q==
X-Gm-Message-State: AOJu0Yy18RAiJgLpeBm2rBzinRmQXnAFw1nElMfg+csl27D/4IyQftWo
	e0ZYFlDmFpeg6UtO+636dHtB8baeaW8hJDjmjCUlJ3wCkPpovtMxlvy5tsZsvKRFaVwsE+ZRyea
	xYPVJlevKilZ0XxFnljdkZIo6LURI1YUOz1ArJOepcNqpUTdJOU27iniUS6+qsxEvsV10SYCJ8m
	6Ad7pH0u5Qnjs9TzVvEI+FCK23GcBkxwjFQfbIda0CZy81NZFwKCvMEdLK1P4=
X-Gm-Gg: ASbGncv2RoFtRSc4PHt36Mb1DiwO935XcLbGsGPEHhJ0SIsqNcXkXDws0IZ5a6YyUeV
	FRLyyXWAaIzRtItTp0Lcx5j0VkwjX9WHPPMpz8k2hvRN2sWFBTsyfiVaP12111JAOzB2VG9+vL4
	te7yK1MjR9NisvTKnq/H8uBsyPei943N6EmfZ+v01RzfPZJ0REmVmhA1TXzIX31r4OdrgpP3gCq
	IrmwrVsoqAgCWtYMwWM8ApGfiHQKRHY6Ny4/M7i6YevzjiVJKa2/IXfYsdWAKqAAoCW/5XpmKsp
	a7EW63gkn0bUuSoGUNpSDo4M
X-Received: by 2002:a05:6000:250f:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3a5613491f5mr1303307f8f.35.1749706711476;
        Wed, 11 Jun 2025 22:38:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHISux5Lk73FdzWl7P2hAuIn27u62L9j161LbzZF7bTdHYxyk6ds++vX45Icx9+4qeiIF+8Rw==
X-Received: by 2002:a05:6000:250f:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3a5613491f5mr1303291f8f.35.1749706711069;
        Wed, 11 Jun 2025 22:38:31 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b4ba52sm888312f8f.67.2025.06.11.22.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 22:38:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: devicetree-compiler@vger.kernel.org
Cc: david@gibson.dropbear.id.au
Subject: [PATCH] meson: use override_find_program/override_dependency
Date: Thu, 12 Jun 2025 07:38:29 +0200
Message-ID: <20250612053829.1037412-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow projects that use dtc as a subproject to find the tools and
library via find_program() and dependency().  This way, for those
projects there is no different between system dtc and subproject dtc.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 libfdt/meson.build | 1 +
 meson.build        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/libfdt/meson.build b/libfdt/meson.build
index 9c6ef54..68d4c1d 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -40,6 +40,7 @@ libfdt_dep = declare_dependency(
   include_directories: libfdt_inc,
   link_with: libfdt,
 )
+meson.override_dependency('libfdt', libfdt_dep)
 
 if not wheel_only
   install_headers(
diff --git a/meson.build b/meson.build
index ed4a39d..66b44e8 100644
--- a/meson.build
+++ b/meson.build
@@ -118,6 +118,10 @@ if get_option('tools') and not wheel_only
   )
 endif
 
+foreach e: dtc_tools
+  meson.override_find_program(e.name(), e)
+endforeach
+
 if pylibfdt_enabled
   subdir('pylibfdt')
 endif
-- 
2.49.0

