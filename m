Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AD756E069
	for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088587; cv=none; b=bi1yERO7+7LhCcT8jq/RN7BAwfxv6vs3Lln0gIn7IwMuK7UKgun6eAgx54+f5LfamIstORs2JWWUSJUaEWDzEaHZ7RVZ52zpSOivn07I8m8DgN++0FcIvJyrFha0iv8JRTr4vF8fCslFK6NMeVGoUEsJ2k4K0U8cBWxboekIBNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088587; c=relaxed/simple;
	bh=141w4atlYroacLxgjGyINyQC13zsX0zf7Nm5/ty9B/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCOcDYBb5apWzEaLf2lZhav5u9sis+6+J1KAinI+b+Zh8TGZxsPdC4OAkwDieT5n46GICBiE1hqgZVCiorOzkUPL+6lH3XzzLaEk/7qFL826pTj7+E4mVby+nc5hcrMVInG7TlKd1qKBcnhmPusoazGpsl5ELpFoNhCQPxacZ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BNanEG8K; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BNanEG8K"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-17bc533fda3so2600237c88.1
        for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792088584; x=1792693384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DG4aA9TEdH04EQSq+KQevC5W4t18y00GnPull2P8sMI=;
        b=BNanEG8KIjUIiGEUJJpgAK2k2a5L58o1DTXmAgYCdV7+MuNTpiMbYyGX1B6H1pIVMs
         W4QP4t2guX5bFp2PKC+eszz+0nPXE/DIIqdZkWmbxfwlUOdp22id3TMeucsz8+ASHDpc
         vUen6CPlJ96MeL0j5uOCiWFt3ztwLgQOXCnOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088584; x=1792693384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DG4aA9TEdH04EQSq+KQevC5W4t18y00GnPull2P8sMI=;
        b=iekmD+uBXWN6T1w7O1R5ANBiQJjZEVtbRpNN38h0QJAU/5h1C1cbYLJvUcLpAL5UU/
         xWWWLDNkJgKVnFMezdNZlPU6zPXJd9vQLssY5/I8JzMzWojZDiMwIJsxegeS6tzObyWX
         XZLG30drKngDFcx3mph6xjyILiVROxOo0JhQSASH3B8h7BnnpgQhFq63VYHWGW/6yq2F
         nL0EJyJKWNVHi1jAI+6aASMC/aQ/QB20LBm10NJrTefqn/szz0eoKh/b9AUTPc9EzSR6
         3amRuVdTTJ/28FXqg163H2T6GbB9Jo0YPd4QqI1FSlZPIgHn+RiMowgXIlWnV/ClNmIz
         xHsg==
X-Gm-Message-State: AFq9FYJOy8wUcY55i8YHDkCxkv5chprmPL82Dvl2gm4KIMiX5VlkAnKk
	L4vq7gpyntNEcjTtEitY7ZtToKUmj9DN6+E6aMD/+ywgXSKO59jl67UkyBk5Wn034YCCXpRJX/z
	SO9s=
X-Gm-Gg: AYBFou0cYObdnhNx3GG6ijllFL/YaeC41vxI+wxfytigliOhhhzSCU1O4VrHeKcPxr7
	oPNp0VWCERZx72BQdHoP9onlD5ly3J/J0BCYe1BS9124+27ofluUqLNPuzMX9RPDto8FJNY8JWz
	EGafVjyLhQOoUloxizM0GQrVn22c08WckbzpbY3BA3Difmo5hOpCwkwyNaq5O85OcY5NjCd0CWy
	ZtOEDNnmYNalWWk/+5+CFbPclcRRjcQ60F0q71pr9SIQTV/PTf2jvs7ZR/53kdG31N85Ft8ID6r
	+gKUuPZmxV4vWh18vu4TIPr0ubSo8JrRiCRTtX37ZbkPDAsyipaYQ8piMSAWqv6FT6yFJUn2scl
	nWwzHAgrdft5NtgAfKZ6IgZ/nE43RcOeV9q5yeOUdhKzUL5KQLjo4QbjtKiXw/zR5yuImfDcI7t
	/ZuKCfBBiPKLLMl5yLvnf1lNXZdz4t5cUnthJUrkN+jG8ZjUSWUTh9Xnpp4dchsYrKvI1k9w3W5
	YHRG9HSO1hSvo9cNLwcuZAmrOs5bAwiDSyp+xz1ACr42I0ukFj6QSiwVApB
X-Received: by 2002:a05:7022:b0c8:b0:147:a685:912d with SMTP id a92af1059eb24-16a60811e7amr22989727c88.29.1792088584004;
        Thu, 15 Oct 2026 11:23:04 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:9ea0:3a29:323e:5f11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm727204c88.20.2026.10.15.11.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:23:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/4] tests: Fix Python test environment setup in meson.build
Date: Thu, 15 Oct 2026 11:21:34 -0700
Message-ID: <20261015182221.2931742-2-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ecb21febfdd3 ("meson: port python bindings to build natively via
meson and meson-python") moved the generated `libfdt.py` and `_libfdt`
extension module into `<build_root>/pylibfdt`, leaving
`<source_root>/pylibfdt` with only the source files.

`tests/meson.build` was still setting `PYTHONPATH` to
`meson.project_source_root() / 'pylibfdt'`, which only went unnoticed
because `tests/pylibfdt_tests.py` manually inserts `../pylibfdt` into
`sys.path`. It also checked `if not py.found()` instead of
`if not pylibfdt_enabled` when setting `NO_PYTHON`.

Update `tests/meson.build` to check `pylibfdt_enabled` and set
`PYTHONPATH` to `meson.project_build_root() / 'pylibfdt'` so Python
tools invoked by `run_tests.sh` can import `libfdt` directly.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 tests/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index c6ac2d7f8ec4..c25500606059 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -114,12 +114,12 @@ endforeach
 run_tests = find_program('run_tests.sh')
 
 env = []
-if not py.found()
+if not pylibfdt_enabled
   env += 'NO_PYTHON=1'
 else
   env += [
     'PYTHON=' + py.full_path(),
-    'PYTHONPATH=' + meson.project_source_root() / 'pylibfdt',
+    'PYTHONPATH=' + meson.project_build_root() / 'pylibfdt',
     'NO_PYTHON=0',
   ]
 endif
-- 
2.56.0.176.g3575e65682-goog

