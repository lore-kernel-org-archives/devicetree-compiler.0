Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862414;
	b=InPw7EZZT4uWy3pn/JUcpGXMk1bb+j1ZkSd89HYYPveUELsooiCdMQoCeAwUMOD8Fw2M
	 4wrooUbLdNhrG1miCM+RcQy0L6hHDA4t32xZLbB1cvca8aMO8/P+taOAIItsfXWrl9Q+S
	 3L13poWgFuMjixcobn3nNC3QRV4TV4ih8eZw9rLjqau8+8G0mk0G0zLEW/aavIxws7Kkj
	 qbPsRUcPqd1k2edNzKPI+D3ssO9MRJ+m4fj96qzRfUzwSsS2VKZh25p7wSiscgwCpzX8x
	 UXkY8qntXZQYCeyih85IoeAcskcABKLPCLR9OEmR/Ef8CoX5zupxrTQbg5BJvIXycBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
	b=hqAxw6cS3NGDCumiv2JWhZDZuLNlQP7qJs5r8c3mgqXgSc5tYur2t9hTenl5EaoSLAQy
	 KHu/XfTqKPHamjPodMo7lVOVOiWZDHb2R2MnJMcY2sk+r2YwzfFwhAFAxqULbjbnMSTWV
	 5X2tlELRKeudjWvD4d+x/I6OLPA3v7ytoIs/BhlQ3HKxptKa+NDTq8CUSfsyqs4WGtvYl
	 Qne4tkBraY1aGLAXC7E5ZOkbqTeN0j9tZ53s0r4N39Sin7yKKvtok6flAIH0pdpkd8eow
	 0opxaiFxz3w+iIfz3PWwlrnMr3LJ4jxY8oeF8ZuRWeACW+L8NlRY2OEYG77eQRshb3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nCuNFi+1;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014B6606A33D
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 014B6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nCuNFi+1
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-380b40319bdso1160061eec.1
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862413; x=1795467213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
        b=nCuNFi+1jkX3+7y0KieRNcc1ZPYxF5feR9EqTRBbKdFSf8aj4dllCa+xbU8+oB3JTf
         2DCX8D3cIDue6bSHWzfTY8YBOFRrKRjGlISMg5jDVyfQ79vajKoth8mF0cMgjBI0mT21
         XsQv64ST+rxLF4dSXI7XOo7kqWQ0/UecgvABs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862413; x=1795467213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
        b=KJrMh4BKrrHzn/lqCOBF/0NFDKNz10WiNLrOU7PEE00yuPuHwIQtUpbCUwaR3ArhJ9
         Z/5ti+vO1x0yWLkZkHu48N8+RWjQGzg2MCVl9xq0/7Sv7t3pQFS0pM2Vr8oa5xQ4v2/x
         nKjEmX2GVPgUbhwLsGp0uJUVQUt5flTA6f2gt1GXGy/kQmocA2Sf1y6sonSua5A9hYzI
         bRcPsPOjNmarSnlBCw9uPSFdBS6E1Gepx29AXYB4j99Rq+2QUD6HYCHyAkWARATOmBYr
         /8By8zMPQ1HtlIBRtaN61nsZYB+PN8QtKOKjxMmuA/cjNnimqXJrCFNrUPLvHhSRq1Fx
         pvNQ==
X-Gm-Message-State: APuU4Z+j4RE9PE1C8p3qIMb8DnK96XAeHHw28NXsHGjPpH7jxvw08Q2l
	whj6y90MzqlIgg2TEEAUTAnQAr6xX6LImG2DVJsPXGVcMDH2ZBILhE4qWXxj9IdmZRp/3nz5peC
	ky2/HwQ==
X-Gm-Gg: AYBFou2+jvCIrWWaDehHW8O7uGwDFrrCLgGiczHNemat9/DdGUGWbF1ttdNiACF3G4X
	5q2/6puERm8jrhURyqjB+sNUtJi7wDCgOIuvWq3KyCE0sW60w0TZcxQDI5pyngniWtiMjbiggnd
	WZKlgAU26L5y3nmx0uQIqiiYsd6PhqYN3uoIIKkeP83KBLDefV8FEZ5wyWfe2MuPi0uYrY5Hm50
	m38PUOw+qT2yBeWazIP7gRg3VIwuQ3Fna9LktUYOKp/1I1NtY2XKj+PGfTBcDen7br42baouGNB
	OAXz88IGYwZUmKP+lmU5Zi4hYM84X2wm3QTQrLTUwgjKVzQ6Wu+08jNiBgMRVsEhCv/tL15SnJj
	hflxJRSlQPNRwUSaa4+ihxWun8zrBAZIQKKOtEN9UE361re0LzCrZxON2ebQcsv3kEHyxkSepnP
	3LzaISNY8QXxIg08cj1MT7d8kEZBPPNWnoDVBMyGAZn06G8eTJ891rxqM3fyhpzRYXipg5bGzZX
	22mfq3L6a5vvTBPtymmovPcJ6hTDoMtd7sSB0Wtji2LnDcZZRKXCWA6jU5A4aOsuVGkq5Yzppj+
	ZZiC0TyFyKtWLf7cTigDOl6w89RDCvRoOV1Q2ZCMAVtW22C8rgLyiSkXgW2YBavj2O3a8KFbHqo
	PUxss/qA2O05gyX/G/eLAShv4kqlvILYGPpk=
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr16186461eec.25.1794862413017;
        Mon, 16 Nov 2026 12:53:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:31 -0800 (PST)
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
Subject: [PATCH v4 01/14] README: Add overview blurbs for dtc and ancillary tools
Date: Mon, 16 Nov 2026 12:52:58 -0800
Message-ID: <20261116205320.1621386-2-dianders@chromium.org>
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

`README.md` currently jumps directly from building `dtc` and `pylibfdt`
to mailing list information without mentioning `dtc` itself or the
ancillary utilities built and installed alongside it.

Add brief overview sections with basic usage examples for `dtc`,
`dtdiff`, `fdtget`, `fdtput`, `fdtdump`, `convert-dtsv0`, and
`fdtoverlay` (along with a pointer to `Documentation/manual.txt` for
full command-line details).

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch adding README.md blurbs for dtc and ancillary tools (David
  Gibson)

 README.md | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/README.md b/README.md
index fcfc2e55d804..9d38c7e79fc6 100644
--- a/README.md
+++ b/README.md
@@ -112,6 +112,95 @@ $ meson setup -Dpython=disabled build
 More work remains to support all of libfdt, including access to numeric
 values.
 
+## dtc
+
+`dtc` compiles device tree source (`.dts`) into flattened device tree
+blobs (`.dtb`), decompiles `.dtb` blobs or `/proc/device-tree`-style
+filesystem trees (`fs`) back to `.dts`, emits YAML (`.yaml`, when built
+with `libyaml`) or assembly (`.S`), and runs semantic checks on the
+tree:
+
+```
+$ dtc -I dts -O dtb -o board.dtb board.dts
+$ dtc -I dtb -O dts -o board.dts board.dtb
+```
+
+See `Documentation/manual.txt` for full command-line reference
+documentation for `dtc` and the C utility tools below.
+
+## dtdiff
+
+`dtdiff` normalizes and sorts two device trees via `dtc -s -O dts` and
+prints a unified diff between them. Each input may be a `.dts` source
+file, a `.dtb` / `.dtbo` blob, or a `/proc/device-tree`-style directory:
+
+```
+$ dtdiff before.dtb after.dtb
+$ dtdiff board.dts /proc/device-tree
+```
+
+## fdtget
+
+`fdtget` reads property values (`<node> <property>` pairs), lists
+property names (`-p`, `--properties`), or lists subnode names (`-l`,
+`--list`) from a `.dtb` blob. Use `-t`, `--type` (e.g. `-ts` for
+strings, `-ti` / `-tu` / `-tx` for signed, unsigned, or hex integers, or
+`-tr` for raw bytes) to control formatting, and `-d`, `--default` to
+provide a fallback when a node or property is missing:
+
+```
+$ fdtget board.dtb / model /cpus/cpu@0 reg
+$ fdtget -tx board.dtb /soc/serial@1000 reg
+$ fdtget -l board.dtb /soc
+```
+
+## fdtput
+
+`fdtput` modifies a `.dtb` blob in place: writing property values,
+creating nodes (`-c`, `--create`), deleting nodes and their subnodes
+(`-r`, `--remove`), or deleting properties (`-d`, `--delete`). Pass
+`-t`, `--type` (e.g. `-ts` for strings or `-tx` for hex integers;
+default is decimal integers) to control value encoding, and `-p`,
+`--auto-path` to create any missing nodes along the target path:
+
+```
+$ fdtput -p -ts board.dtb /soc/i2c@3000 compatible vendor,i2c
+$ fdtput -tx board.dtb /soc/serial@1000 reg 1000 100
+$ fdtput -d board.dtb /soc/i2c@3000 compatible
+```
+
+## fdtdump
+
+`fdtdump` is a low-level debugging tool that dumps the FDT header,
+`/memreserve/` entries, and raw structure-block contents of a `.dtb`
+blob (`-d`, `--debug` prints tag offsets; `-s`, `--scan` scans a larger
+file for an embedded FDT). For general decompilation of a `.dtb` to
+`.dts`, use `dtc -I dtb -O dts` instead:
+
+```
+$ fdtdump -d board.dtb
+```
+
+## convert-dtsv0
+
+`convert-dtsv0` converts obsolete version 0 `.dts` source files to
+`/dts-v1/;` syntax, writing each output to `<filename>v1`:
+
+```
+$ convert-dtsv0 old-board.dts
+```
+
+## fdtoverlay
+
+`fdtoverlay` applies one or more compiled `.dtbo` overlays (`-v`,
+`--verbose` for progress) onto a base `.dtb` blob (`-i`, `--input`,
+compiled with `dtc -@` when overlays reference symbols) and writes the
+merged blob to `-o`, `--output`:
+
+```
+$ fdtoverlay -i base.dtb -o merged.dtb overlay1.dtbo overlay2.dtbo
+```
+
 ## Mailing lists
 
 * The [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
-- 
2.56.0.679.gc527c65306-goog

