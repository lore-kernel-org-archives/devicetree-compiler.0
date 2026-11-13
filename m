Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547403;
	b=Xo/2o6Phizu7yKxRs/HPJvZaLRpRK+VzTXCRiBJOfmbtgPoGIwqTRk2wDE2XV0YNyaZm
	 +RPA2gkpUOXE3SuuhNv7k9cok8ElW2zx+XbjOfDjC3csrZHM9vwq8XyPBZUwQzj4KS5KK
	 wHRBDvH4owsvka4h6W12Gico7dYZ9icVkTzlSrH6pQet8M8RShRe/A0JgGfvRL8YnXUs6
	 Mzug3mNsWNNqQGSpT9YRckMB5tP542VXFEaUg4wiA6qA5xplBMuW39Vumo5Sm5UiqiKYW
	 Hz4Om9U/mjSje7eFw+CV7egOksCoRce7aBKKVf01php+YFH6Om0VFcO5fakTOOphbAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
	b=awD4f+858cZ+vRxwe9u+mfolYsoK8iNTuKeqLv1oeQCtZLKp3min9Si0W5jOaIFnI8DZ
	 S8CADr3HS5uI9vZogUkLSBT7wRV+I2XkcTPRvygJqrhU7nrNkmAVdCwIYPtKRqJSphJ0w
	 s5xi5MvjZ/MyR/hR4S1OvpOsY3cHK6w2AEOX6BL5JvLtnfTaGUNbfxpueEHryWZ3SEekU
	 dEqNwJQOswS9z6b4w282hQhRRpvLdoLAmuX5w+eoz2Sx78DS/wCg5T5Fw1UyRbfrpAMg5
	 czKkeb5g14HMM3Jcxu7Aj6Pmth8LWEjcxCWd0oGg6fDurohDxm0iWVSjsrZ/j0SAeOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CXd075Dg;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36B606A321
	for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 05:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF36B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CXd075Dg
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d28f75d62so121160466b.0
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 21:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794547401; x=1795152201; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
        b=CXd075DgEJzDS5ycIeG1PCSIY900pdpjWs8x/dyFE0PCbKb4z9EErhVoXPJBWXv/s1
         25GHjgt3To4wZ6S1lDnMS5BBFHfJDdkKtsPa0+hvRdJozEgQ/jOjUjXPZdRll5t+ye2p
         TlczdbNazAMtjLuB531hB3EiRRHgQ9H8EmS6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547401; x=1795152201;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hu9Bl2aKV+qWTG9SKgrVwWdxUFqgIaURnoD0XjS0m3E=;
        b=J/pRWf+wgJYUl5dRCo9fbNe3PCNNPJQxpBaNBZoWTr1C6hBGeZrOMNVBOa7TQzUO2U
         72fDep1tzTIPJA6PKgWQcQPGB0Ww69rScUqfCytjBZS9mrgQ4nl/fr6Qi+4fauRERRFD
         5PAFhxbMkm05dtubiC/OylLODFs42ZvLeMglchVF8Jtu+e5ImtnHLoFiDku74PTWkcrg
         R8ZmvarUe29u54VdbS8QM2Kxh1g83Dh+CYnHoOLbLSLVlkVwMxeB54uHGz7t1vkkK4px
         yTXSZ7ZaPYCGUwES6V9coigSAf3xLa8Hi/u0CmFVQt4gAeGIfCLprSyom0+6VkHdeFHW
         K6jw==
X-Gm-Message-State: APuU4Z8FDwf/qKiauwumXzvQ7cU0ShawGPzeKAJNO9uHsbWVdpnVkuID
	OiZ0mG+RFKUElRGHhxQdOu1MdWo71X7db+/QKK7p5O0VtlN7wXfeALoKWDA+CkpUHF69ySV8+si
	U4g0DGEFe
X-Gm-Gg: AYBFou2xO6yG852zD6RzPTwnhJYb67qcpU0INYZeCadifj93iY5KmrXpwLRjbJtNHBM
	LB2LNesupVBec6N3so+cOU8F1W/7zaCdEbeIZ0VqRRTV0ItSlghVe6MJKovDr2qlzvNPhtWPsTJ
	ec2ZDZ3QZMxHP5v4ldz7IuRumiktU/f54I/sXoTfH1oohANmszy1Pj200zY6vLAqzqDyLBNSuv0
	zowO6D0SocCp1GMeZ/7HGcaMB2f1lZ9ClLUD8srnJ3Hfb2zOWAcomaYjNO3CO4q72kdYFxNQI0x
	e0KqDf0HfwlfWdFG8tOjnyq+YRvZtFJhrMm0MJj9Kg8zpTKCGcDf4H/iYCQMX46gIeAIwCfx26Y
	c0fw95qWg1aeM9MB77ELkgkX99oqV75/tnal2w2p0M3bOAOHVqXUFv7vG+YTku0N0tgW8AEDld5
	8aWWPO4k9J9cCN06H+hEzsBzwXwjC4UBZUo3EpTnkJUpf3w0NF8gnLWwqmeVcoMOZZu+ah40Ael
	EkUGe/0L6b1PQNndOWGHwmN4/rGEW54QcywdRN7USSjH1VMWQ28h1BkYUwSO+99BuLBisbJul4t
	K+il8ZyrrBDgrxpO7nhJ1ywRJqCqH7fNft9UBKlHuyWLMACd24wQitiDTjcJ/grVeJQtcsUoukh
	s1teXjzKZhPqo6A==
X-Received: by 2002:a17:907:3f02:b0:c4c:eb17:3da with SMTP id a640c23a62f3a-c509636a83emr123873466b.22.1794547401081;
        Thu, 12 Nov 2026 21:23:21 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm51314466b.35.2026.11.12.21.23.19
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:23:19 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49134c8509fso541949f8f.1
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 21:23:19 -0800 (PST)
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-49c714a2a99mr2054397f8f.24.1794547398778; Thu, 12 Nov 2026
 21:23:18 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-15-dianders@chromium.org> <avUgDyB9p0_OSxal@gractus.seuss>
In-Reply-To: <avUgDyB9p0_OSxal@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 21:23:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XdPm0zQJe3rbeKMDnBia4qzuetxn4T2CMeh1+7tLOt+A@mail.gmail.com>
X-Gm-Features: AclHuK9aXeqWfCXMZOPBMpM60f8-snYNUMCFOIZWOgLzWEySRUCP9VJFMXuuRXk
Message-ID: <CAD=FV=XdPm0zQJe3rbeKMDnBia4qzuetxn4T2CMeh1+7tLOt+A@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] fdtfactor: Support compressed DTB inputs and outputs
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 11, 2026 at 6:10 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:21PM -0800, Douglas Anderson wrote:
> > Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> > file extension, transparently decompress them before factoring, and
> > compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
> ...
> Hmm.  Whenever I see a pretty complex chunk of code dedicated to
> auto-detecting and guessing the right thing to do, I worry about it
> doing something weird with an unexpected group of inputs.
>
> How much usability would you really lose, if you required that the
> compression method be explicitly supplied (I'd envisage a single
> option which controls both input and output sides)?

Very little in practice -- build pipelines factoring standalone `.dtb`
files already know which compression format they're using, and requiring
an explicit option catches mixed or unexpected inputs instead of
guessing.

In my draft v4 I've replaced the magic-byte/extension auto-detection and
`--base-compression` with a single `-C` / `--compression` option
(`none`, `lz4`, `lz4_legacy`, `lzma`, `xz`, `gzip`; default `none`)
controlling both input decompression and output compression for the base
DTB and `.dtbo` files (with `--output-base-dtb` defaulting to
`base.dtb.<ext>`). (In `-F` / `--fit` mode, each `/images/fdt-*` node
already explicitly declares its compression via its FIT `compression`
property.) That also lets us drop `detect_compression()`,
`split_dtb_filename()`, and the mixed-compression stats logic.


> > -* `-s`, `--stats`: Print size savings summary.
> > +* `-s`, `--stats`: Print uncompressed and compressed size savings.
>
> I don't think this hunk really adds anything useful.

Dropped in my draft v4.


> >      parser.add_argument(
> >          '-s', '--stats',
> >          action='store_true',
> > -        help='Print size statistics summary',
> > +        help='Print size statistics and compression summary',
>
> To, compression fits already in "size statistics".

Dropped in my draft v4.


> > +    # Compressed (.dtb.gz / .dtb.xz / .dtb.lzma / .dtb.lz4) modes
> > +    for comp_spec in "gz:gzip -9 -k -f:gzip -d -f" \
> > +     "xz:xz -k -f:xz -d -f" \
> > +     "lzma:xz --format=lzma -k -f:xz -d -f" \
> > +     "lz4:lz4 -12 -q -f -m:lz4 -d -q -f --rm" \
> > +     "lz4:lz4 -l -12 -q -f -m:lz4 -d -q -f --rm"; do
> > + ext="${comp_spec%%:*}"
>
> Because we use 4-character indent depth, we should consistently use
> spaces to indent in run_tests.sh, not mix tabs and spaces.  Mixing
> them here has the side effect of making these lines not look indented
> from the for statement in patch format.

Fixed across all patches touching `tests/run_tests.sh` in my draft v4.

-Doug
