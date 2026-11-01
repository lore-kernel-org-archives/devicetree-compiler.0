Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571232;
	b=GWD85VpcZw5Ymg3J1z0bxlE0PMQbdW1/ZNcmh6DpBzfC+KYaTD3vRzyOrzWP5cT/yIuR
	 qzxT+hos0Ce8hPArV1YI4q9SdTukG0D0ynyYH/c30TElNVbXl+owSi+glxoB+blTR8scQ
	 O+e25qTLkuSFqwFtAPjnUiC1eK65x+zoeLtPSTNQxdcdT3uqkuApWPNaKon2F5GQiMTla
	 2RVd+r3n+BWRDuKUGt962uu7SXqgOG8pics/DevEBRv2wBvftafMtdMGTukDsccWIoYUV
	 bT6iWemOUejkPQYMXBBztmGUxeAZsRr4MjAEnh0/mYG/aYXRU2nDVzG6TbLFsPUO8nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
	b=u4eD2IguvyG9j9XLqgNDpe1Oyp5fLheXkhXHzmq8C5g9qLztTcxELUM1kox0Q2/LBOh5
	 0apgo+URbsXE1ZMdktzPmIejj+8deIncfteiCJdqQo2eAgpquULCzGtHbv82GlgjRjmgV
	 NgpoO6+ZHD/z7FQVl1qBjf291yrHdWM+AY6rDuYyGEwihOBLjpNqc0Pgk05PUk9mlpI47
	 Dllndv4rI9fv1D6HBSY3Emjnhvc5CCNKgRLYjsy7eLskE7StkzQsltLbdScBjoTSfKqsp
	 EyLFfeqZg6OreiCTLJU+ujOugZUZzkM2EcGCMnbukvbgRm8uRUjujnPgsSPhPRDbl/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="HE9ecM/C";
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B6606A324
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5B6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HE9ecM/C
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1464339e87.3
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571230; x=1794176030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
        b=HE9ecM/ClWfkiC8dxwIgqci4cDYqayQ1/MJt20SxP3BqaFGDUngvKDvmYcZrh/mOTr
         o8FUpxzwxddrH08H9heYLQqT7NWX537BnGL4Dfpt9hLZN85JDsJZeoLwUFkZuuRSz8/Q
         SXTBuIDvdr8vpOQ9cnM5Uxrw+zZCs5HW8gpFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571230; x=1794176030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Me/9QJm4Q38T465J3XjzPEtQTmtBofSNTe5eAQE4wQ=;
        b=hiFkC7kDnI7T5gy/MEKf/EU0xCWhNzL7Nwx5gX1nZtS2ztZKZ44JKDZEfIHoD5acQM
         EAOXUOIW060d3DZEGX0qPYgW2/F0LFGyma7o190C068/aQ7lLlBSIeEEtkLYbAbciEj7
         gW5PVUmLEx+Jh7CywbNdWgY/L6+xCAthk9J7DoeJ0QLlG++NqTdBO/Pe9UuU9U85/1au
         OrWeAfobV0LKMNCzevuY3mi+HwninWKcaqNmVhxi4hIKhd5U1myiEERjwpgT6nUQlYWB
         2XZE+U7SCS7I2BvOqSRENzs0OU+0l4q+0HupzPcgDWPVRLuJM3deMBBzMRxbI+hdERV3
         HJEw==
X-Gm-Message-State: APuU4Z/CwC8fqS+XnMXrzJYAWE45yhTJvsCl/1GvyPwp5Wm4mTheN/oF
	hYUcsQ2iTXamMORzDzu/6YsXl0WwGaoI0+3e752GqNfsi8NttLRoauvG9PPHBjFjld5L1km4Lfs
	uwKjMbmP2
X-Gm-Gg: AYBFou35guxsStF7ZyuutH1D67cBg5BubOuo0oH2wZ02w4AW+ZgDpC+TNAhyBH6BR5c
	5Nbu1lZhAZvOjnS9ApMTxVRJpwnSPT+0nrhitrxX/6F4sYgMOaI5zxbnBJcvQ6BRctneAcGT3F9
	XsZ1ODa0wMAwHnRZkizHurhW1GTbJ8XBXhPh3n347SnFqDQROVva5hKWshLlXb9qWhr5MEwWCC8
	UyskfNpMhVeC85VQ6i9rpdMDVOx1LO1tAZ+s9SmVB03thVpKDr053ztF9KGRzwo/PcjtQkTApxk
	IbvdbWFNG8kQLuE67UbFh4We9kQKPs3oKtPLtIetxVerBLU6Clqz3ZC0akYaZDMwSA/DtF2LkFk
	Lj7tSF/ScBVZo5oAkeCVEbVv5ZYRXPK/Pd/1sjtwLyj3UsdJg2UamiKeCt1k3CMge1kMotIBgYs
	je+yl5XKs1AlbvgIvwMqr1h47KcJs6iEkECRglA9ZhiIH1euFm5NIqnguFpmaWv1lqi3EgsRznb
	Doz4G7JSD2CTVSUgEKVjfF087x0ZLMpYmKwRgyfhtX7o24kbI4b+UB2OSMEsLUI4aBGt9Uqw1ng
	Nz/Yn0D4bwkMuha3y3aKpdJuhvR6a53+wO9TWgMgjINl0Ixsb0hb25R0lWf9HAKj8UiBLw8lXvF
	wb+wKrliCYaWv
X-Received: by 2002:ac2:4c4e:0:b0:5bf:bd7e:197a with SMTP id 2adb3069b0e04-5bfd956225fmr2984458e87.16.1793571229752;
        Sun, 01 Nov 2026 14:13:49 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0babd6esm1269929e87.43.2026.11.01.14.13.49
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:13:49 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so1683315e87.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:13:49 -0800 (PST)
X-Received: by 2002:a05:6000:46da:b0:48e:73dd:855a with SMTP id
 ffacd0b85a97d-48e73dd874bmr11427269f8f.51.1793570749483; Sun, 01 Nov 2026
 14:05:49 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-11-dianders@chromium.org> <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
In-Reply-To: <CAFLszTgXZ8fcHuMbMAorsDaebj43gU47bS48pO8dKtnL0JF+Fw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XG-YHW2__uxUdJr4vC3e_mW=P==F0JUvkeepXqmKMSNQ@mail.gmail.com>
X-Gm-Features: AclHuK_naoI8TgiOEvg2nlmaOCNYlC5UGiEf6u-6ngKNFsppEgRdoP0YA4HjfTs
Message-ID: <CAD=FV=XG-YHW2__uxUdJr4vC3e_mW=P==F0JUvkeepXqmKMSNQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] fdtfactor: Add compiled FIT image factoring support
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:23=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> On Wed, 28 Oct 2026 at 15:56, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` to `fdtfactor` s=
o
> > it can directly factor `/images/fdt-*` blobs inside a compiled U-Boot /
> > ChromeOS Flattened Image Tree (FIT) image.
> ...
> > Assisted-by: Gemini:gemini-3-pro [edid_decode] [gerrit_and_build_artifa=
cts] [gsheets_gdocs_cli]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Moved FIT image factoring into its own patch.
> > - Replaced external `fdtget`/`fdtput` subprocess calls with `NodeTree`.
> > - Added FIT `hash*` recalculation (`crc32`, `sha1`, `sha256`, etc.) and
> >   rejected signed FIT images (`signature*` subnodes) and external-data
> >   FIT images (`data-offset` / `data-position`).
> > - Preserved per-group compression (`lz4`, `lzma`, `xz`, `gzip`) on
> >   factored FIT `fdt-base-*` and `fdt-*` nodes.
> >
> >  README.md                 |  19 +++
> >  fdtfactor                 | 408 +++++++++++++++++++++++++++++++++++++-
> >  tests/fdtfactor_lz4.its   |  83 ++++++++
> >  tests/fdtfactor_other1.dts|  21 ++
> >  tests/fdtfactor_other2.dts|  21 ++
> >  tests/fdtfactor_test.its  |  83 ++++++++
> >  tests/run_tests.sh        | 156 +++++++++++++++
> >  7 files changed, 789 insertions(+), 2 deletions(-)
> >  create mode 100644 tests/fdtfactor_lz4.its
> >  create mode 100644 tests/fdtfactor_other1.dts
> >  create mode 100644 tests/fdtfactor_other2.dts
> >  create mode 100644 tests/fdtfactor_test.its
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> BTW, 'FIT image' actually means an image in a FIT, so I think you
> should try to call the whole thing a 'FIT' instead.

Done. Updated the commit message, `README.md`, `fdtfactor`, and tests to
refer to the container as a "FIT" rather than a "FIT image".


-Doug
