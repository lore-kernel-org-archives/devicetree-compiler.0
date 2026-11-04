Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805252;
	b=BdTPoNHO/vi6jYVlpIPFaUp4wT7LV8JdNh4ElX4802P2fm99WrFkZ57IBT5FMV/Rw7V7
	 fdpkkLJQkkFD7l9XLjKPOSwWVQGH0bBRGBNjjwIIq7Bx7+eTyZqub36/Yl+d/5w0XJAeH
	 qhr7oPI2vuxLQ6tiLEcKvj3FvfH8lFzJGu5k+oeZzNz9Fv++2/xd67P8rycuiktdtz13v
	 g+xBBH/DB4eV/oEstU/Mlja3PztpKUSPt160cto+KQMIJ+ORws2ilhhEohnkFmohhaCp/
	 Oc80eNFp04X3iAIlqLejjfVKKxoNRdiZVfiRQe90gASwvhsNq/m4S9ORrT940yq0D0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
	b=HynipLOQv1Nv7H4NBWIwXOhw1VUrwcAOhJhxKM+1nexEMxM1la09jMgyjQ16Xtgj0I2y
	 njmhx0c2BTp++2nHwMKvm3cN607ZUsvYnWqzFmZ7odriuGhaC2lJp4xXAL+kCqOycW3/m
	 TxMo6vJZPsg0AeacETYLGnXMh+x/t3/6tyO0apxpiUTe60mggzUENeycqkP2MrIkrzmeK
	 W1+pY3FMpS9U08CPDqvmJWpFDmhSsx3+uKAiVDHkrJoGD1474vVQ6cLBSSJKqVVWjGEQC
	 eO+Klm7QKVQDRtXs03MMu7KqSgXZAqdlSElnr3VUw0Ymj/QOr+GDazx4/XVUixEn/yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY6uYD1v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65F606A326
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E65F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY6uYD1v
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so915555a12.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805251; cv=none;
        d=google.com; s=arc-20260327;
        b=sZjXy6duIZ2CaflE8ezL7IKY1ipAMaMFrjbxEAS4ttw82DjW+bUhDAMWj+X7GSwApT
         /gIjCPoiLzg47pDxKAZ+IWtVaDpeS2U4vqIpOI2MxU1D34AcT1HCvy0IlHJleO8jjaqB
         oGOWcL1xQ4/6mVsaIg79BnYNjDf5iNuUB1vmvV5oKZAMhTJeI62YEQYc3HjqhH/uKp3c
         3zhVLLPiS7MFNN7WoxuuOInVcejSpnPsZkMAF2r/I2NchfD8uEGNqswlQPT0QI0w28x+
         YyDgj2vZtmrSXucxiHY1EOguztF0d+A8c6M3jJINeOZ+mVeyyacTEtb4HRhhti57UVlN
         JIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        fh=4BA7Iq9H0VSWaCP4Je+uW1rc04Fmu9gG6jldUSQQ6Y0=;
        b=Rc+iP4IfqYSUEyEkaDfvwxkK9AMcpsFGyh+eKi2wrjsBrcsP366C7eGoY1QG6cbZAZ
         Kc61fzbeL6k0AF4Lzyhg5jtlcBqKqyiYdOblYNB6VhIB4bEifzLjFvgdSpl2chFb+0ke
         R+qrawyeOC67cLQzWCDpPN73U8f0nn0ZyAB7nNOUQ8zNn8L4EDL0vK5hDX65QlOvwTse
         5fqW2OVzYoCxnfntlORbgk5TIK4wLO21U+EW1tjz0yqEzOVd5+s9MdCOhLQPNiCWQZ/N
         M+2NnWRAzPpwobaoUseVDtJr7ezW5hz0BoPWWsX+kERiTMS8NSgKHpkQTVL9IyjLbRWl
         NxGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805251; x=1794410051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        b=HY6uYD1vf1uwS1oAykVnBMNefRlP9SRKy456fmWRVAduc0eIIowekPG6VSP+JdjZcB
         ofR2EZhvXZHo26kwsW2BTRqutYdKn0s2Mr6m6weOsEPyESVciF0qr21lRucAfrDmqg4V
         80AgomVczOt1SIo5GXdz3iKJqUbsqAwgFMKXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805251; x=1794410051;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        b=oNM7VtneUISHq+0Ti9aJvVHKzCVayTCnRyZdM1icB1X8NKUbh0ZS1NXwXjngEXMmJg
         71fQNb/UH3s6ZypSe2qpquHkm5KiHzao94ytrxcyrVpDqofDbybTe+2E8t17YKkbwJdK
         RqV4zMjX57JBLdeqTXX2uUCm3gqKKnBJIGwsGuK2YxhJbe7VIFMclnw4DxqxTLDpjMI1
         AoTflYXUrzimpDpf99r2ljSmlTSAvbfmTIL14B+SSwpiUoqUZAsvDC4YaBkBw3vuGqfj
         UTZv8wnEXB2nb55P9SWUduGEEwi5lUa1Kcanb1hpZCBSCaiNq1tBPfAlkfvIzon/C8ar
         2mMQ==
X-Gm-Message-State: APuU4Z9UDBamAd8rF1ANH6z6iX8kFx10P6mFTkWEB+RmZx4rUs0Hhyh8
	2M4ueIf/2l1g8xfwtYLBcQ8a1koGKKe4VRtln4dzH0x1HPTXMuPz/d7qLcUZf24bdmC6zeocE0g
	7XmuyhTukgDobdMsS2xfz4UItzGCcXh7673SN7caG
X-Gm-Gg: AYBFou0aIBmMcnVJ5F9i4UksN2w/6dHH5lB2BMj7/6XllNqPft1w0nvIJ7m1Uuon6Iv
	Pa1Qm/+NwPxH7EcPtLYpVG55hvbqmb9M9kPNigrlEBSXWSCOuxqnua9NoxmUUiRkzlkUGjF8k0c
	1oAIBsSXEkw+8aDcxDyZzi55LX9YBGTzx3rhLMlasiURfIs89knwSpIm22PizLRbFGX9Urzw+Xn
	3udDV2StclBC+7O1Cm3P+FF6XBAgU4Y8hPqP2336yTSd8gJTmbVtasG+dYHssMln03GkA9Hsarc
	5F3077PpAQXD2uJEtJZkMo7X4iUhKA+k7kEYpTXj18JeSL40IhQWjhagizvgF+Vgv24Q7zNIVGy
	xB+Nl0q3TnkLNR/uFzKRfqABtYKRdqTtAfJ5rt0W/K5cEkZOWrXsbDCp99tXHvCSOGVfT5b0=
X-Received: by 2002:a05:6402:1ecf:b0:6b4:be8c:325b with SMTP id
 4fb4d7f45d1cf-6b4d3285c72mr12781754a12.0.1793805250703; Wed, 04 Nov 2026
 07:14:10 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:09 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 08:58:47 -0600
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-8-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:09 -0800
X-Gm-Features: AclHuK8zRxeH5csXFpoD2u-FiyL3vbkKclLgEtNnscyWzGd1u0WrvcYL68ykwns
Message-ID: <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> devicetree: Add DeviceTree live tree representation
>
> Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> representation of a devicetree node and its subtree:

Please can you start with the motivation, i.e. why a live tree is
needed and what will use it? The list below mostly repeats the
docstrings.

>
> - `DeviceTree.unflatten(fdt, offset=0)` builds a `DeviceTree` hierarchy
>   from an `FdtRo` instance, storing `libfdt.Property` instances in
>   `self.props` and raising `ValueError` if duplicate property or sibling
>   subnode names are encountered.
> - `DeviceTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
>   `DeviceTree` back into a packed `libfdt.Fdt` object via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation.
>
> Add unit tests in `tests/pylibfdt_tests.py` covering `DeviceTree`
> unflatten/flatten round-tripping, duplicate name rejection, and helper
> methods.
> [...]
>
>  devicetree.py           | 276 ++++++++++++++++++++++++++++++++++++++++++++++++
>  meson.build             |   1 +
>  tests/meson.build       |   2 +-
>  tests/pylibfdt_tests.py |  77 ++++++++++++++
>  4 files changed, 355 insertions(+), 1 deletion(-)

> diff --git a/meson.build b/meson.build
> @@ -125,6 +125,7 @@ endforeach
> +  py.install_sources('devicetree.py')

I'd forgotten about this but PyPI has Zephyr's python-devicetree
[1][2], which installs a top-level 'devicetree' package.

I'm not sure what to suggest. Would libfdt_devicetree be too awful?

[1] https://github.com/zephyrproject-rtos/python-devicetree
[2] https://pypi.org/project/devicetree/

> diff --git a/devicetree.py b/devicetree.py
> @@ -0,0 +1,276 @@
> +        for suboff in fdt.subnodes(offset):
> +            subname = fdt.get_name(suboff)

We should try to stop on a corrupt tree - so I think this needs error-checking.

Regards,
Simon
