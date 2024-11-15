Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98BB157E9F
	for <devicetree-compiler@vger.kernel.org>; Fri, 15 Nov 2024 04:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731643638; cv=none; b=ja1TsdDW1z9a8g8Iad5GUyzEdPSsiqyouPadVCEptV3dFEgYIroRO6Xg8lJGJfJvKcnVGR+ui7Fw949z3OV345EMAXvA/Kj3XreigaCpN9KKGEezGiPx/HVTYIFl57bf6rOLn/ojujG/r5HSAqoQz0LdvBRyFANoPFSPAUWBwH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731643638; c=relaxed/simple;
	bh=ZvXa3JHu77HRB4BvSOxVp2jXYfoxk/DKnexdkZMmtTE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rcvk6bwhr3nW/KJPU4KgF5G1/Qy1/p272qjZhnhfn2IvghgUgzJvlzrhsy+8Qi1qSzb/2Cz/WoZlizuk0J06OOqZxYqqLDTvi+ay7HDVsnH8jbXIfLQj2y/LkxaFzcBzwt49ubIxuh69hKOTPKYSmsoWxx5fkXArx5Qpi+7T/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pDrsJdyv; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pDrsJdyv"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AF471dO011149;
	Thu, 14 Nov 2024 22:07:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731643622;
	bh=XpOzrhQxaOdPR/AGwjIUXiXyDssAcdJ9DQo2Gya1BNY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pDrsJdyvBXdDqcaW4HUhLi9w/q6e9OwX+XTsSXEZjM9QDZuLKCWk8TuY436ntiu5S
	 Uznad7omt076e7eulWWnvXqD9wingtq2+oDyU8CXwbz56j67HaB89xl8RAnHQ/5u4a
	 LR4TND+h6BbOYxalG/FLCthYTtGz6StlF/U1LqLA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AF471dC122700;
	Thu, 14 Nov 2024 22:07:01 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Nov 2024 22:07:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Nov 2024 22:07:01 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AF470jt015738;
	Thu, 14 Nov 2024 22:07:01 -0600
Date: Fri, 15 Nov 2024 09:37:00 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ayush Singh <ayush@beagleboard.org>
CC: <lorforlinux@beagleboard.org>, <jkridner@beagleboard.org>,
        <robertcnelson@beagleboard.org>, <nenad.marinkovic@mikroe.com>,
        Andrew Davis
	<afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        <devicetree-compiler@vger.kernel.org>, Simon Glass
	<sjg@chromium.org>
Subject: Re: [PATCH v3 1/2] dtc: Add /append-property/
Message-ID: <20241115040700.b22tnjgukhbvpaon@lcpd911>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
 <20241111-append-v3-1-609c09401f3f@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241111-append-v3-1-609c09401f3f@beagleboard.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Nov 11, 2024 at 15:24:33 +0530, Ayush Singh wrote:
> Allow appending values to a property instead of overriding the previous
> values of property.
> 
> Currently, we have /delete-node/ and /delete-property/, but lack
> /append-property/. Hence we end up having to repeat all existing values
> when appending to a property (e.g. see [1] appending to clocks from
> [2]).
> 
> This functionality is also important for creating a device tree based
> implementation to support different types of addon-boards such as
> mikroBUS, Grove [3], etc.
> 
> The annotate feature works similar to how it works for nodes. Here is a
> small example:
> 
> base.dtsi
> ```
> /dts-v1/;
> 
> / {
> 	prop = "0";
> 	propa = <0>;
> };
> ```
> 
> app1.dtsi
> ```
> /dts-v1/;
> 
> /include/ "base.dtsi"
> 
> / {
> 	/append-property/ prop = "1";
> };
> ```
> 
> app2.dts
> ```
> /dts-v1/;
> 
> /include/ "app1.dtsi"
> 
> / {
> 	/append-property/ prop = "2";
> 	/append-property/ propa = <2>;
> };
> ```
> 
> Output:
> ```
> ❯ ../dtc -T -T -o temp.dts app2.dts
> ❯ cat temp.dts
> /dts-v1/;
> 
> / { /* base.dtsi:3:3-7:3, app1.dtsi:5:3-7:3, app2.dts:5:3-8:3 */
> 	prop = "0", "1", "2"; /* base.dtsi:4:2-4:13, app1.dtsi:6:2-6:31, app2.dts:6:2-6:31 */
> 	propa = <0x00>, <0x02>; /* base.dtsi:6:3-6:15, app2.dts:7:2-7:32 */
> }; /* base.dtsi:3:3-7:3, app1.dtsi:5:3-7:3, app2.dts:5:3-8:3 */
> ```
> 
> [3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
> [2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
> [1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  dtc-lexer.l  |  7 +++++++
>  dtc-parser.y |  6 ++++++
>  dtc.h        |  5 +++++
>  livetree.c   | 36 +++++++++++++++++++++++++++++-------
>  4 files changed, 47 insertions(+), 7 deletions(-)

In general, I agree with these changes. Would be really good to have
append-property.

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
