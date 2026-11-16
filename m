Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862431;
	b=GpeTbItvc9YE7OGWksK10dGt4h0p0ml44bXtPNmtdMH7MgBMpZ61q4leVs0wn3hDxLDY
	 y3UoHQele1F+PVMgws0du1WnIpgXa63U/OvtgUVzF5SzDgIIcmZnwIepNqGkL0LpPeXJJ
	 MQaq95wTch2YhhKLydM+EsgcmQko+yZOgBpUKP5jXnk6gmgvrKRaai+gGj5a5CHBd9JZ5
	 48RMP8j9D3ZY8ZX/ujfhuDCJbHc1fBVG/62KCWYMJ7XMoXMme3KwAFNzBzci5p0NfaJKw
	 iu+yy4cA0lIiaHUV8XU6hyQTtKEU4cTOg1pACiWks+WagzBRaWVDctLKzhmmcNf9qFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
	b=gR7+dxoDdzrrj/IRB0E0OtTdoZs1cSpIVA77wsZg1rbOcKakJt5jh02NnoRFBTYQsjoe
	 aTp2smQ7BWUqRFaaEzG5KrODuIKNvGY7nVFrXuSJxVYPjVW2KRpUeFjIGoW7AgGV7h+2r
	 PeH4YXNOzxErIyS61JBoIlSlhVbUES9XNid5D7UN8aO3Ua0c5Dv9gy4fP/pyMkWunrwxV
	 94wtNjrxJAy+jyKuJWSXcMD6xm9dG/tFC0H6OKMb7jVpDwrx0J4+eKuJci40z+nVXz7NK
	 YutK1DbCzqrfcoADr+M16qz3kXHONwYIw1c5pJRfQqYce+uh2tboMR+c2UjKs6o01TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY2u0o0Z;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F0606A89C
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D79F0606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY2u0o0Z
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3704d30b84fso4672949eec.1
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862429; x=1795467229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
        b=HY2u0o0Z8H3Yq7PlPIizj7S0ypgGnAL7reX/xHU7bT9irZqhQd/73nLumJhnzk9U7q
         tlzHPtaXOoZHTfpvgZerKtGtvx37zqg4rFJrOio47uV3UNZ6lWx4wZ+sN/pKDXFQ0qer
         ECkQqCNQhFSJbw41UPznMmFjeSXSzO1duG6eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862429; x=1795467229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
        b=LerAxnHSfchkbKsepp1JEEPo9tQhnqOfYZ59yS43VPiH/cmabNnvWDEhK0qy7C9vFY
         FEYYihDHTNK/NwT4eN8+qAfxiDug4Ys7M10trMVspy9BVQeQzdRn/8ZTm1JRlkXn3sAW
         AoVoW4L2lh6zV7Adsc3npD5bYrgrLNJdeM7g0qyI4K2XVoLh0deRk4v1a68RDRKAfR1u
         o/tE1rWcKleVZchRdo+GqgaxWBwmXVLfrkw8B7N8FkszRJyd14G/7OGJ6Os+gpg71p0l
         NQ3YPmDY8+4N+26AcQE35VMpMbbvzv+aKO9yseok8snx2rhfkRXG3mPoCxdlOy8DZ763
         asXA==
X-Gm-Message-State: APuU4Z/mf7CIBBJ6CFG0Kv1KvHrrTiPmBai/IHlll1PP1L2lzjOChOgN
	NtNg74HZxm6g1Es76Anoi33julconscdxJ9+oU9HyVj1YbGShWOmJJtqhbVTDqUXfBiW50vmmSx
	RCiWekw==
X-Gm-Gg: AZFdTZdXxnZXd4Heke10njwFS1+WedvEahCyR9G1qZAntAzydr17JZL0WAsxO0SZ/NT
	a+bTNX8nefJCwNLAySiBwYdJQ9mu0Cg9p8KBQy+XAFxJzuJKBIXDiRwT1su3hfkqImYvr/rgQqD
	kA4mAjNlLhpGjVS02vz1KSa0xmVCo4d+PhbA09HFHKbBQzNnh/DadDMpDXYeJN8g7JUbOq83g8G
	9XEHF9DA9cWvZbyyErJBhxwNREZ6I5L9G7LsVBADtmVFdFGB3Q7mXO90IxlOfS6HjQ9aRwbNmOE
	tMb9p+R+20VqZwPpUeTsTnPn/LXMZVztrszLdN9UlOd0/Z9Sd0RpNcVGMMZW0UrfhdOSeIRK/rs
	cD/2jgXL2wDGbLww7k8Ea0nF8VGSetdtWJtmeqvEOgqvbS05Byi9ys1eWU7csKjb86TYzL7dwlp
	KEkkIbI7r9aE/pHbFnS6giNRZYhf4QBBzAvVmPtxDyH32o68/tUEeVrC+mMAiSmozVNY0k1bzCY
	1Dw63NNuXD7c3CGfWSZ8IwdSt14uaGjl/RdnqHhHuV5+u2pL2GGiECpebxw/h3LjaXnsqysrQEP
	QumfAfdqW/Pvm+/TbR4A29XbhgMkA41Ua4xHux/4drtC9nohhm+ngIt5tQQkyGEw9jcIj/O3xC2
	J4W5ANIhvLv2CTQ==
X-Received: by 2002:a05:7301:2a9c:b0:372:79a0:e8a3 with SMTP id 5a478bee46e88-37963374fdemr11690960eec.1.1794862428808;
        Mon, 16 Nov 2026 12:53:48 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:46 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 05/14] pylibfdt: Unpack Property.as_list() in a single struct.unpack() call
Date: Mon, 16 Nov 2026 12:53:02 -0800
Message-ID: <20261116205320.1621386-6-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`Property.as_list()` currently decodes multi-cell properties via
`list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, self)))`, which
constructs an iterator and `map` wrapper and invokes a Python `lambda`
for every cell.

Compute the element size via `struct.calcsize('>' + fmt)` and unpack all
elements in a single C `struct.unpack()` call instead.

On one stress test (decoding ~301k `/__local_fixups__` cell lists across
438 arm64 Qualcomm DTBs) this reduced `Property.as_list()` time by
~2.1x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up Property.as_list() with a single struct.unpack()
  call

 pylibfdt/libfdt.i | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index ff9210d123cb..e4a9357d278a 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -931,7 +931,8 @@ class Property(bytes):
         return self.as_cell('q')
 
     def as_list(self, fmt):
-        return list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, self)))
+        size = struct.calcsize('>' + fmt)
+        return list(struct.unpack(f'>{len(self) // size}{fmt}', self))
 
     def as_uint32_list(self):
         return self.as_list('L')
-- 
2.56.0.679.gc527c65306-goog

