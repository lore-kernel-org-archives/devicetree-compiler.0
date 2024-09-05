Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF22A44376
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Sep 2024 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547070; cv=none; b=R8v9b6RjKT9kDsUm2AMFDrikxS4Lm0pbKIK5x8k7HfLTkwv9TtnaXhtGJbrQzosgiHPU25BpYc+hOogEAQ/Q3Gay1DJc/ilAEOhiOQRIMgUd8Z0Lqbi3xfjvfVxT3zSnInfJ64wdDbkbafkRuCgt1itlC3ZOT3Tbq6CwLKGuW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547070; c=relaxed/simple;
	bh=npmI16iK3FOhn7a4KCbYiEvjyNqOFVGlWsVZu69MceQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N31hfmjI9lhfWWHjZ4V78VzmvtiNbCmk1rXIPJlOhoh4ne0NspeQeAqP1LTN96Q+VwRZsIN3uPYfzph6LYqGuM8AYGNrrenHdD1hJeL9feAooufA4bRlx8BMrglkz05w3MQNtP2kqI0+xUBBRAg9rs+ZxAECRXWqIVU+gto96V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KpnVOggR; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KpnVOggR"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 485EbVlT062246;
	Thu, 5 Sep 2024 09:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725547051;
	bh=YQCqbUMGBdh+tT++Q2FJ4NUyoNGmWOL5MZaVpAjYMk0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KpnVOggRhu83d1jq3ISFIP3PPASP1qmST2PpbOZm7wA+8ssJJb+naluigK/3B05Tl
	 1phbti8oBATwDIVwpJsPOwgxXJH/FtN7XyDpV89hsD4P/Bv6qIO4TcfBzpfvDyfgjt
	 2TMYFDhKS18SUoCo5grV37dHtRpgKmuWt1dyKJg4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 485EbVh0106270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Sep 2024 09:37:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Sep 2024 09:37:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Sep 2024 09:37:31 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 485EbU1r108462;
	Thu, 5 Sep 2024 09:37:30 -0500
Message-ID: <7789ac01-4505-4cc5-91be-2b19848836a8@ti.com>
Date: Thu, 5 Sep 2024 09:37:30 -0500
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests: Add test for symbol resolution
To: Ayush Singh <ayush@beagleboard.org>, <d-gole@ti.com>,
        <lorforlinux@beagleboard.org>, <jkridner@beagleboard.org>,
        <robertcnelson@beagleboard.org>, <nenad.marinkovic@mikroe.com>,
        Geert
 Uytterhoeven <geert@linux-m68k.org>,
        Robert Nelson <robertcnelson@gmail.com>
CC: <devicetree-compiler@vger.kernel.org>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-2-683efb2a944b@beagleboard.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240902-symbol-phandle-v1-2-683efb2a944b@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 9/2/24 7:17 AM, Ayush Singh wrote:
> A simple test for both phandle symbols and string symbols. Also tests
> chaining symbol overlays.
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>   tests/overlay_overlay_symbols1.dts     | 12 ++++++++++++
>   tests/overlay_overlay_symbols2.dts     |  9 +++++++++
>   tests/overlay_overlay_symbols_user.dts | 26 ++++++++++++++++++++++++++
>   tests/run_tests.sh                     | 19 +++++++++++++++++++
>   4 files changed, 66 insertions(+)
> 
> diff --git a/tests/overlay_overlay_symbols1.dts b/tests/overlay_overlay_symbols1.dts
> new file mode 100644
> index 0000000..bd74242
> --- /dev/null
> +++ b/tests/overlay_overlay_symbols1.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	__symbols__ {
> +    TEST_STR = "/test-node";

Looks like you are mixing tabs and spaces. Probably need to fix your
editor to treat .dts files like .c and use tabs for indent.

Andrew

> +    TEST_PHANDLE = <&test>;
> +
> +    SUBTEST_STR = "/test-node/sub-test-node";
> +    SUBTEST_PHANDLE = <&subtest>;
> +	};
> +};
> diff --git a/tests/overlay_overlay_symbols2.dts b/tests/overlay_overlay_symbols2.dts
> new file mode 100644
> index 0000000..b8da96b
> --- /dev/null
> +++ b/tests/overlay_overlay_symbols2.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	__symbols__ {
> +		TEST_CHAIN = <&TEST_PHANDLE>;
> +		SUBTEST_CHAIN = <&SUBTEST_PHANDLE>;
> +	};
> +};
> diff --git a/tests/overlay_overlay_symbols_user.dts b/tests/overlay_overlay_symbols_user.dts
> new file mode 100644
> index 0000000..4da2136
> --- /dev/null
> +++ b/tests/overlay_overlay_symbols_user.dts
> @@ -0,0 +1,26 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&TEST_STR {
> +  str-prop = "test-node";
> +};
> +
> +&TEST_PHANDLE {
> +  phandle-prop = "test-node";
> +};
> +
> +&TEST_CHAIN {
> +  chain-prop = "test-node";
> +};
> +
> +&SUBTEST_STR {
> +  str-prop = "subtest-node";
> +};
> +
> +&SUBTEST_PHANDLE {
> +  phandle-prop = "subtest-node";
> +};
> +
> +&SUBTEST_CHAIN {
> +  chain-prop = "subtest-node";
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 937b128..56f8d0d 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1018,6 +1018,25 @@ fdtoverlay_tests() {
>       # test that the new property is installed
>       run_fdtoverlay_test foobar "/test-node" "test-str-property" "-ts" ${basedtb} ${targetdtb} ${overlaydtb}
>   
> +    symbol1_overlay="$SRCDIR/overlay_overlay_symbols1.dts"
> +    symbol1_overlaydtbo=overlay_overlay_symbols1.fdtoverlay.test.dtb
> +    symbol2_overlay="$SRCDIR/overlay_overlay_symbols2.dts"
> +    symbol2_overlaydtbo=overlay_overlay_symbols2.fdtoverlay.test.dtb
> +    symbol_user_overlay="$SRCDIR/overlay_overlay_symbols_user.dts"
> +    symbol_user_overlaydtbo=overlay_overlay_symbols_user.fdtoverlay.test.dtb
> +
> +    # test overlay symbol resolution
> +    run_dtc_test -@ -I dts -O dtb -o $symbol1_overlaydtbo $symbol1_overlay
> +    run_dtc_test -@ -I dts -O dtb -o $symbol2_overlaydtbo $symbol2_overlay
> +    run_dtc_test -@ -I dts -O dtb -o $symbol_user_overlaydtbo $symbol_user_overlay
> +
> +    run_fdtoverlay_test test-node "/test-node" "str-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
> +    run_fdtoverlay_test test-node "/test-node" "phandle-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
> +    run_fdtoverlay_test test-node "/test-node" "chain-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
> +    run_fdtoverlay_test subtest-node "/test-node/sub-test-node" "str-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
> +    run_fdtoverlay_test subtest-node "/test-node/sub-test-node" "phandle-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
> +    run_fdtoverlay_test subtest-node "/test-node/sub-test-node" "chain-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
> +
>       stacked_base="$SRCDIR/stacked_overlay_base.dts"
>       stacked_basedtb=stacked_overlay_base.fdtoverlay.test.dtb
>       stacked_bar="$SRCDIR/stacked_overlay_bar.dts"
> 
