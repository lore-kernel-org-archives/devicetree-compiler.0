Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0641B125D6
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Sep 2024 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546925; cv=none; b=hN2/JDARVndfoaZewNSztzho5vTr3vC+1LyFOnwAILfZTbsJzGHkC797IIX3XCbTQeVjrVNy4UEwk2hdSQlC7dNK7LaPRUbqC/DQ8SeHxxZ7ScekIoT818Z97TCH4v9bHa25VCoA3REgcSYC3endCb/BIVFKKN1lmnPzV21o4FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546925; c=relaxed/simple;
	bh=JM0roTfLby0Mou70Hd5D1ZZoIJvD0on8AK8LWupmUiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fj7eB1H51IGKaC0BiU4YpI+O6lt1nVbYei1SEdCGwPkBgVw/WQe+GtSdMa1UCzZxR63Rw5VWvNCNbiT9n97OtMJXWGHzTrB6lmX6YPZp0U0fK9wdSkae9kivdrMDyAwl22c3ojtFty+fchE8O3xq2ElTX72GLHIwyOUlEM+I7bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EHaMXelC; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EHaMXelC"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 485EZ735049244;
	Thu, 5 Sep 2024 09:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725546907;
	bh=2463jBrj2QLqBgrujC8v3tw537K16MRVCVGTCihpCwo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EHaMXelCoW4QP6LjvUf0JQP92oOqUqtQ4f9ha6wjW5KcCb8YVQtCW0aEZ8/wp7YA1
	 4PYY3BTYkJwXWS6oHuV6WumrGH/MZj9EcOPLAbFENarn3Nbh5mv9tzC1zvWKKP9YWi
	 N7jdpvGlBDReY8yt3pBZ61QmGHHHc1Tm0iGZHj0g=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 485EZ7he107558;
	Thu, 5 Sep 2024 09:35:07 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Sep 2024 09:35:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Sep 2024 09:35:07 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 485EZ6Uo106122;
	Thu, 5 Sep 2024 09:35:06 -0500
Message-ID: <44bfc9b3-8282-4cc7-8d9a-7292cac663ef@ti.com>
Date: Thu, 5 Sep 2024 09:35:06 -0500
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for phandle in symbols
To: Ayush Singh <ayush@beagleboard.org>, <d-gole@ti.com>,
        <lorforlinux@beagleboard.org>, <jkridner@beagleboard.org>,
        <robertcnelson@beagleboard.org>, <nenad.marinkovic@mikroe.com>,
        Geert
 Uytterhoeven <geert@linux-m68k.org>,
        Robert Nelson <robertcnelson@gmail.com>
CC: <devicetree-compiler@vger.kernel.org>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 9/2/24 7:17 AM, Ayush Singh wrote:
> Add ability to resolve symbols pointing to phandles instead of strings.
> 
> Combining this with existing fixups infrastructure allows creating
> symbols in overlays that refer to undefined phandles. This is planned to
> be used for addon board chaining [1].
> 
> Patch 2 containing tests demonstrates how this looks in practice.
> 
> Open Items:
> 
> 1. Phandle vs String identification:
>     I am not sure how to distinguish between symbols that are paths and
>     phandles. Currently I am checking the proplen and if the first byte
>     is '/'. However, this can cause problems if the number of phandles in
>     dt exceed 0x2f000000 or 788,529,152.
> 

Ha, that is clever, never thought about the count ending up in the
ascii space :)

Does the blob format being big-endian affect this? Would mean the
slightly more realistic phandle count of 47 would run into this..

Probably not an issue, the below length check would save us.

>     Alternatively, if we can be sure that there will be no node whose
>     path is of length = 4, i.e. a node name of 2 characters ('\' and NULL
>     already take up 2 characters), we can avoid the '/' check.
> 

I also ran into the issue of the fdt not having type info. My solution
was the same as yours, quick and simple len==4 check.

We can disassemble fdt back into source, I thought about how that
works without type info, scanning the code it seems dtc also just
guesses the same way we do here (see guess_value_type()).

Might have been better if all properties in __symbols__ were simply
phandles from the start. Having full paths string for every symbol
adds most of the bloat when enabling symbols (adds ~10% to each fdt
file on average in kernel last time I ran an audit), phandle-only
would solve that.

Andrew

> [1]: https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> 
> ---
> Ayush Singh (2):
>        libfdt: overlay: Allow resolving phandle symbols
>        tests: Add test for symbol resolution
> 
>   libfdt/fdt_overlay.c                   | 16 ++++++++++------
>   tests/overlay_overlay_symbols1.dts     | 12 ++++++++++++
>   tests/overlay_overlay_symbols2.dts     |  9 +++++++++
>   tests/overlay_overlay_symbols_user.dts | 26 ++++++++++++++++++++++++++
>   tests/run_tests.sh                     | 19 +++++++++++++++++++
>   5 files changed, 76 insertions(+), 6 deletions(-)
> ---
> base-commit: 99031e3a4a6e479466ae795790b44727434ca27d
> change-id: 20240829-symbol-phandle-9d1e0489c32a
> 
> Best regards,
