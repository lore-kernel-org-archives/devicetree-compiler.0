Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE27179954
	for <devicetree-compiler@vger.kernel.org>; Tue,  8 Oct 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728423711; cv=none; b=uLw74D83/o+X4sncCnhSlUj0LhJO0CpYzmJ2nVI+Ljo04sp2aKL2tNL5rEEmMIfX62MgagoLbqoyrHRWW/O933rv8pBQjwbMa4C2XacqQ07h7Lb0/kn2xuK3iL6vW4MZ3/LS1j9ECz3PScotDkjcRVRNAajVF4fyPunb7hzAUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728423711; c=relaxed/simple;
	bh=2rh31LuqGGKedulae/KIfbBcIDWripLaknSP+4XRCTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrtN1WAV8+9DceLXGe6P3Fxf/ao7vCVQdbtQYEYpKHvAhAi1EElKXv7qvkdmVIy8Kguz8nH3o4crq0yMWFnwQ+To+lXdowhOeUTx1ArwZAjpb60K+plV1Bm5gIJegDBGNzTlrT9fv4sFqz13p5QyJLme5NDcVW2H+yWJvkYUopU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QazFNlv5; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QazFNlv5"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-45830ff5b70so48235821cf.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 08 Oct 2024 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728423708; x=1729028508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zifR0rsCTSr7nNhSxp0Mf+7yrzx2PL6ZE6BVQQPfJwg=;
        b=QazFNlv5aYnoBAg1VOe61zjjSXnRlZBBWYd3Nu4DLNGxtrydpR5VSf+MxCpohr9EUc
         cXx+qWQCvS2htj3n/vxujYNXjh5XDFg+4T1smaZWWDNdbZ+NZf96mXNk/m6t+Hue0Ttd
         mkEI+8yVDxA8DY7XcS70rEeuxU4ewEQV9x4HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728423708; x=1729028508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zifR0rsCTSr7nNhSxp0Mf+7yrzx2PL6ZE6BVQQPfJwg=;
        b=frV5R2XruH8N65B73Peb3SNRReoBFSlb0HnqHH2LOhvUpBg3+7PEJi69sRu/u1uHWy
         gel7TbVVEpYd0ukrPtfsRMYmrD9ivquM7pL0PNef36R2wsWRZABlilCYjT3f4eshcw7R
         VIeiF10pNuJCOzqf00HNzdsBewZDiBJYZyfctEkLeZYR43UWxca6FxN0WrJAe33eWdwn
         WrKyyDB+8+gebPQx40Ij/qhZic07K1Ni2UTODDdcCciSLsCz2QRhBHWubVgsgSOpFOHo
         Wvf2ES28ETy5WWaBqX69bK7BBEuwVjy7OR6gIIlI/xM/uT6ed5Dwas5PZzO1+AVFpLNE
         /MoQ==
X-Gm-Message-State: AOJu0Ywh6wnmezotph83cHzaPMa8XDkBFJYwOsvxlf38iW/47nSQa+T4
	uALotdBYiP17UfnyAgsyLRCq8/2Kn4if5/hlWPPvKNbtDZ+almZqVysqvReAeISKKgBa2Jp9x94
	+ig==
X-Google-Smtp-Source: AGHT+IHLNArFWcUhcDcDH/ibe/P5zUG7dj9pWmnYx3l25HbDMjsHpBoqLMoGslfh4NyDerGc1WpF/Q==
X-Received: by 2002:a05:6214:4a93:b0:6cb:c6bc:a7b6 with SMTP id 6a1803df08f44-6cbc954c854mr9260546d6.39.1728423707902;
        Tue, 08 Oct 2024 14:41:47 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbb413a2f9sm23242816d6.104.2024.10.08.14.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 14:41:47 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
	id EC153D82; Tue,  8 Oct 2024 14:41:44 -0700 (PDT)
From: Markus Mayer <mmayer@broadcom.com>
To: DTC Mailing List <devicetree-compiler@vger.kernel.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/1] DTC v1.7.1 Build Error
Date: Tue,  8 Oct 2024 14:41:31 -0700
Message-ID: <20241008214134.171436-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Our automated build environment flagged a new build error introduced by
DTC 1.7.1. Specifically, a compiler option (warning) that was added is
only supported by gcc but not by clang. This results in the build
failing immediately if clang is being used.

clang-18 -I libfdt -I . -DFDT_ASSUME_MASK=0 -DNO_VALGRIND -g -Os -fPIC
  -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-compare
  -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
  -Wsuggest-attribute=format -Wwrite-strings  -DNO_YAML -o srcpos.o -c
  srcpos.c
error: unknown warning option '-Wsuggest-attribute=format'; did you mean
  '-Wproperty-attribute-mismatch'? [-Werror,-Wunknown-warning-option]
make: *** [Makefile:359: srcpos.o] Error 1

The commit in question is [1]

e3cde0613bfd Add -Wsuggest-attribute=format warning, correct warnings thus generated

This commit was not part of v1.7.0 and is part of v1.7.1. The problem
is, clang doesn't like this option, and with -Werror enabled, the build
fails. Meanwhile, clang is perfectly capable of building dtc once the
offending option has been removed.

I am submitting a potential solution to this problem that relies on some
Makefile code taken from the Linux kernel to detect if the compiler
supports a certain option or not. Admittedly, the added code is a bit
wordy, but it should work very well going forward if another such
situation occurs. It is also very concise and easy to read when it is
being used.

Lastly, here is some debug output to show how the value of $(WARNINGS)
is affected by the compiler.

# using gcc
$ make
Makefile:49: *** The warnings are: -Wall -Wpointer-arith -Wcast-qual
  -Wnested-externs -Wsign-compare -Wstrict-prototypes -Wmissing-prototypes
  -Wredundant-decls -Wshadow -Wwrite-strings -Wsuggest-attribute=format.
Stop.

# using clang
$ CC=clang-18 make
Makefile:49: *** The warnings are: -Wall -Wpointer-arith -Wcast-qual
  -Wnested-externs -Wsign-compare -Wstrict-prototypes -Wmissing-prototypes
  -Wredundant-decls -Wshadow -Wwrite-strings .
Stop.

As intended, "-Wsuggest-attribute=format" disappears if clang is being
used, and with this, clang can successfully complete the build.

Please let me know what you think.

Thanks,
-Markus

[1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=e3cde0613bfd

Markus Mayer (1):
  Makefile: only use compiler flags when supported

 Makefile | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

-- 
2.46.0

