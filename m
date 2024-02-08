Received: from zoidberg.rfc1149.net (zoidberg.rfc1149.net [195.154.227.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929836B16
	for <devicetree-compiler@vger.kernel.org>; Thu,  8 Feb 2024 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.227.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707419891; cv=none; b=LRGXOlh3WNsIn9yJ7b7oAB7XFWfVK3x694+zklkm4HMJoi2XTqwIMUZTVdPRqcxFxhjSDD81lwf0/MB8V8w6gkUEs7aoBqJW9Eu1v5k8xQJdUy5PTGOTpKQjRVe92IdxlCX9cLpnYJZtO4BYdTSV7CsE7ZOXo8/r+dwUvi9ZeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707419891; c=relaxed/simple;
	bh=dW4UHVICBf9DdLZ/baFymeh4ngQd5Z5hlWQqmvnUUwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=czc2aRMf4wAGeUyfLbfCYLiTpMuCBnks3f4yHRRZzxFuCMkEQuhh5Jvfb+okDemTORqjnaFDNTiPUU+4ihs0hUJeFmccfBiONnhWdGheTvuoBeoJVi0lOKZXXumj7cxR2gTdKCxWzq7fVt6x1/w/8lRYXZsC1gPJbGpph7L+iYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rfc1149.net; spf=pass smtp.mailfrom=rfc1149.net; dkim=pass (2048-bit key) header.d=rfc1149.net header.i=@rfc1149.net header.b=m+su6zO7; arc=none smtp.client-ip=195.154.227.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rfc1149.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfc1149.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rfc1149.net header.i=@rfc1149.net header.b="m+su6zO7"
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 47F1D80024;
	Thu,  8 Feb 2024 20:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
	t=1707419645; bh=dW4UHVICBf9DdLZ/baFymeh4ngQd5Z5hlWQqmvnUUwk=;
	h=From:To:Cc:Subject:Date;
	b=m+su6zO7WjoOfxP1ovjZU/DIp73oRLiN6qWjTsfDrrGC0LtDC6AqKOm2z+H9cvpfz
	 eH1PyOyeowJ7wMtWk5+y85PPYMcwzG+bhKPIY+g0hYltGZUrLu+BrSnFPX1IlShXk4
	 X1q5QPo3cb95VTDqHvTnSGlBzsgZSla24TkWoCxAHzbKQkTNDbbl7C/gNRUEy9mSNG
	 6aJNwJcUvTLnCnOiAi0Qsr5uksgTZ5xU/a5UNcezqoFe9tAz5ToboYxDUl8J18OZXb
	 L0Cdbdce3tSkyhHIo+2PIqh2w/d2Tuq5xoDWMKYgnfcAXZYJ1tuBRvJjBcZG5ZMzbt
	 WxMFee5+Fql1Q==
From: Samuel Tardieu <sam@rfc1149.net>
To: devicetree-compiler@vger.kernel.org
Cc: Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH] Makefile: do not hardcode the `install` program path
Date: Thu,  8 Feb 2024 20:14:05 +0100
Message-ID: <20240208191405.1597654-1-sam@rfc1149.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On systems that do not use the FHS, such as NixOS, the `install` program is not
located in `/usr/bin/` as its location is dynamic.

`dtc` can be easily installed on such systems by using the `install` program
available in the `$PATH` with:

    make PREFIX=… INSTALL=install

However, this becomes more difficult when `dtc` is being compiled as part of a
larger toolchain, as the toolchain build scripts will not spontaneously pass
such an argument on the command line. This happens for example when `dtc` is
build as a part of the RTEMS build system.

By not hardcoding a predefined path for `install`, as is done for other
executables, `dtc` will allow the one in the `$PATH` to be used.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 10a56d4..f1f0ab3 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ SWIG = swig
 PKG_CONFIG ?= pkg-config
 PYTHON ?= python3
 
-INSTALL = /usr/bin/install
+INSTALL = install
 INSTALL_PROGRAM = $(INSTALL)
 INSTALL_LIB = $(INSTALL)
 INSTALL_DATA = $(INSTALL) -m 644
-- 
2.43.0

