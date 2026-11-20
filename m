Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188173;
	b=U7USMw61yxMkIGD9FOzFspve21sBLlNw8VGmXTg+yjWBrkihxNy/BJG5WOtuaVOJPqYU
	 AycDjqOaM8SZ5PFOSb0mhyCKdyc7VF5OrpVWZHVGwqHvjTZfyw7jACGSKAATVtxsPKw8X
	 IdxzESfno8z4rrvn07Vv+NsFuTGfUl8UQHeFEgGEwmoK3/lvfczthYEAbouwKoEL9RZyA
	 /eEIMy73TdOpTF0QIPVRUwegLIG5//TFp8QR68wi6fiFR76VabWLHGe7HvRd/QqYo6F1K
	 joZ+1Luc1ITfmJ6K5Qpt9v3Hy6nRV9ckFvF8Pw7vRx79gJ2UoDg2+T8hZ2rCoYG8grQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
	b=SDeuAr5wZhNbGlptiz1m14VFP1e0ykc+B3AQS2if09UdrSu5Jj65ADTAA7pSMm36tvtP
	 lb9yboDn1ASvYnw6ECBmgTdR+LlapOc748O9N7NiIpluaC9Ssxsg99aawoA3cioBg97m5
	 W3tfcpAgKgW2UZ1KyAVvRVvgitytkgMuZ/7VjaChuxhHY2G4uryBmnVt5Bf4N6zkpjcHV
	 AvE7v0ow5737EgxkLcfKO3fMJ0SWE/xZrocCCgQtCsFfvGgbaghcXHJ26aP01v0F9xYUd
	 FW1DSiFtguy5vmgmgL1BvKABCRfQ4Fa0H60pMV9Ueb0CjN7p7IX2+JVDKKRwVRyMchQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lNo+4Pcf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65963606A32A
	for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 15:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65963606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lNo+4Pcf
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f05bc71e01so108925ad.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 07:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188173; cv=none;
        d=google.com; s=arc-20260327;
        b=eY4DRwslFF09A3z386xQOulGCcrxw36CQjJH6VqzqyDUnKTFgFgAhQHm3qyeNC0tHu
         714pwaGCHdwXqyfb5sxtfuarzFndFWW0RdKs76TvO7m0nJgR171vZK0t3Zgs0U8vSx1E
         endXE3pX2PyeBYFq2yRdah4CYsCYplbElVVWRWBzOYOyt2+L4SL+w51741FT1Wk5YuEp
         WXNExV25+OrMK/coEkcm8vnbkeASsojH9CbzIyoeSws7R8dFPdNP4OsRCSgDh4YXjcDD
         tz07MEf6r4wDbI5bVXBzNVRNWo6pmpza7yvCbzQqO3OKNr2tmZm/MEa2TsCSWd8D4Ur6
         +rcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        fh=hgCycmTRN5MUyllYI/DZysF06+e1YJv60AR+HqulbV0=;
        b=pRSN5Hl4fAahLk65pMuGbfLnVSiuuGkpjpr2P8J05OBz3Q6b9nFq6xyJCjEzJsOHUf
         KI4CyrYqrhIYdM5EJaCQQ101qoDZm56v6guRmld2cHiDAc2ZG0hzrFC6uujK+2WtFshN
         aC7TkM+Si0sh9mIYy1KpiTwN0gZeYiTBhk+/wDUADCEiECUBciv/8wvF6UduouNw3bMU
         GmLOMNtTol5FvBTTv825eglT5UCb0EBEFbE1Hnk5OcOAY1rRyZVo3f/BrYHAzY3QmaGR
         ALGnWzaTHxO9IaHHIQ9rty1Xf+xd/8NRCJ1tge+HCpFS5RZs409AqvBUCKwPavU9I4GW
         Jp3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188173; x=1795792973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        b=lNo+4Pcf4UnV19UT58axrldYv7dhQBVZ3fequvH7Acwo9EtIsYnPqL09oXGkoyspql
         H7j62Fw4IT6uxOfSxpIsZECkoYj7VnFVnINCDXqv02qKW6gQHJCc5i1khm00LwnWvKSd
         QWMMyGCsu+ClVjZsmJ+OuYrToza0terwS/aio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188173; x=1795792973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        b=CPdRR3ZG6KC7JlPmEgmncOCMqkH/1dw4blEXPvvNAsuV3UjDdvHhCy7WUJJBgSn1Hw
         wShe0IKJ1VxL0SpwymTs/YPvzn3Vqy/PpVc2++S4/rJzL0SsY1nFtlldcbl9Dc/5Lnwh
         FD6IA9xS+joLv1PsDmz3ZvTs0NkW7Pjn+lLfggdWuQnstk48/YOKkMFKJbW+kJJE5zvz
         Q405VXvWY19e7Htos0ZBDeZ2qC6AR2r8LSxIB4tuD5XwbNUgZd8GdkJV2urWh+LhbkQE
         kvsty9JgBSxK/n4afXWU3ub6NpIvArkvQQtk89WYw7coeeWe2LELRmwsFB5+bo4K7Lz+
         Dogw==
X-Gm-Message-State: APuU4Z9lf4HDq9xcMR+E00qoq3oQwZYHstIIuLt67uucXfCg+lnhbGj2
	AIQxnyqD5ixj07RXEReO9BgLqdK/OyE0unqdaqgLLuaiLWmZx+gdP+IM5Eom986nJbcj8w/0Rmh
	7hZjBMPByfqQkK+7T6ILIdV23yVPNgbmNBfuOUJiO
X-Gm-Gg: AZFdTZcky8/W9wBvSqGja1gc4a4TFPu/SkIjLqwvVzoyTjmuIfBgosdWvQ8UpUqjWXe
	xUbtx6PegyCBZcNUHnXr50oHA9yzC1Um2mIUj3zOf47ViKQujo29rtIB5Prd1HGwzy8iicahHdz
	sN3C0ksSiiZif9JqN7143wfNsuGXkJ5sITnYls4dGt2l9kmAg/qrgaLnAf5f+Ehm3mwZHoIusaR
	Hju9TaJkTmG/7aDUaVT5Z3dbs8QVjHiLsu0lsJcGVIxp3G41gDJN3+d1gFs3aGlD+I68KHcLS8L
	3jmx7047afoJSASdA6ELP/mv7DUno/9NHRhjNMbpiNzTDszeEh3Wta0caQaKKA1+MvzgPy+J0p5
	SveYguoVwF4Fkjm81DXwnn8LvF8dXTorFCqQIL2MyvqwBsj33s3PF8GrQoDtlpAtwYsnbvpmU6r
	5Y5A3QY91yfAhiPQVF
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id
 98e67ed59e1d1-3b41c9476d3mr3456886a91.37.1795188172371; Fri, 20 Nov 2026
 07:22:52 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-7-dianders@chromium.org>
In-Reply-To: <20261116205320.1621386-7-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 08:22:32 -0700
X-Gm-Features: AclHuK8mmsjs7pN6k3bzNXtd8WoPzoco1JjhltxmsQvDAjAEl007qn__5cOalqU
Message-ID: <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Speed up FdtRo.properties() with a C helper
>
> Iterating over a node's properties via `FdtRo.properties()` currently
> crosses the Python/SWIG boundary `1 + 2 * num_props` times per node
> (`first_property_offset()`, `get_property_by_offset()`, and
> `next_property_offset()`, along with their Python `check_err()` and
> `check_err_null()` wrappers). When walking every property across large
> device trees from Python, those per-property SWIG round-trips dominate
> runtime.
>
> Add a C helper `fdt_node_properties_stub()` in `pylibfdt/libfdt.i`
> backing `FdtRo.properties()` so all `Property` objects for a node are
> collected in a single C call per node, interning property name strings
> via `PyUnicode_InternFromString()`. Also add an invalid-offset exception
> check to `testPropertiesIterator` in `tests/pylibfdt_tests.py`.
>
> On one stress test (walking all ~573k nodes and ~2.06M properties across
> 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> ~1.8x.
>
> [...]
>
>  pylibfdt/libfdt.i       | 64 +++++++++++++++++++++++++++++++++++++++++++++----
>  tests/pylibfdt_tests.py |  3 +++
>  2 files changed, 63 insertions(+), 4 deletions(-)

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
> +        name_obj = PyUnicode_InternFromString(pname);
> +        if (!name_obj) {
> +            Py_DECREF(list);
> +            return NULL;
> +        }

Just to check, how much of the 1.8x comes from interning? My
understanding is that interned strings are immortal in Python 3.12 (I
am not sure about later versions), so every distinct property name
seen in any blob stays allocated for the life of the process. If the
gain is small, PyUnicode_FromString() would be safer.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -477,10 +532,9 @@ class FdtRo(object):
> -        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
> -        while poff >= 0:
> -            yield self.get_property_by_offset(poff)
> -            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
> +        return iter(check_err(
> +            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
> +        ))

This changes the behaviour a little, since properties() is no longer a
generator. The FdtException is now raised by the call itself rather
than on the first next(), and an error part-way through a node (e.g. a
truncated blob) now produces no properties at all, where before the
caller saw the earlier ones first.

I think that is OK, but please can you mention it in the commit
message and update the docstring, which still says 'Yields'.

> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> @@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
> +        with self.assertRaises(FdtException) as e:
> +            list(self.fdt.properties(-1))
> +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)

There is already an identical check a little further up in this file
(just before testGetName()) and, since it wraps the call in list(), it
passes with both the old and new code.

It would be worth replacing it with a test for the new error path,
i.e. a failure after the first property, such as a blob truncated in
the middle of a node's properties.

Regards,
Simon
