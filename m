Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10263B7778;
	Thu, 12 Mar 2026 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302051; cv=none; b=Q3uihavQLZoih6WFqYB9oWBf89l3osac+bz0XbRPQs3/JtfGSiMZNyCWUDZzLBhv2a2U713ith1lDWgzrBvcadO7XxNBIFQArwVymNvCNMLS449A5sGafrT9crS9JRaQkiqnplxu14cHGkwRAUvo8+OspKPQ/CBtNOIWIbWZHkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302051; c=relaxed/simple;
	bh=Govdyk71M+I6axKdjmoCcJlG6TEPshPTfRfVWbmisTc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRVCX+Ixk5SnamvvR583FonRLbwOefxsixciaE7GZcEBnz8OnTP7I4J3txK3mUQId/Kp2mBui8Uzpb66z+Ih+JfrH89NILWD9gED79d8BKVYHN51/A4lnpUO1NZ3kX7TKeOni8tUEwf1wDNTe45VUEiVY6owyXsa3aYuqHaWjpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RYW2UpiM; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RYW2UpiM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BEB86C4159A;
	Thu, 12 Mar 2026 07:54:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C0225FDEB;
	Thu, 12 Mar 2026 07:54:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF0CC103685B6;
	Thu, 12 Mar 2026 08:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773302046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D5yY0c9wx3ZqgsxR2ENFj3jj2EUIEYpXbXhAsxTRZH8=;
	b=RYW2UpiMJfv0RfUtsX3Rn93eXp5nUxDQSCAD0zYOkzgZnxDadmituXR+m6NMkzfAr50ipq
	ASB1jA0VYqAzmyDLZOstE/X92+Mjue8FlG0+F8mDivHqSgLDeWFaDYRv+vNQ3w7AhDXkS0
	0apA/HYHMcW83CSvgL3P2ZElvLE9+tVmjlPGcWzgcO3r1v1uW1hvrxiy8MqT7wzKNOPgFH
	0C1zZvUoOhB4Z3NyMvxHU1ZlYnVm8qp32O5Yu/6t4vfywQCRaeIoKWWQJX2cKk1hK2/2A2
	8T9Gjos5qtFGrPZh4TDh18i60M0E2dTC1YZ9EUZtiEKNMWaoT8mtsqBExqNmwg==
Date: Thu, 12 Mar 2026 08:54:00 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 00/15] Add support for structured tags and v18 dtb
 version
Message-ID: <20260312085400.3a11df8b@bootlin.com>
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Tue, 10 Feb 2026 18:33:28 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Recently, I sent a RFC series related to support for metadata and addon
> device-trees [1].
> 
> During the discussion the concept of structured tags and "unknown" tags
> emerged as well as the need to have them handled as a prerequisite of
> support for metadata and addon.
> 
> The conclusion was the need for a new dtb version (v18) with support
> for:
>   - Structured tags and based on them, "unknown" tags.
>     Those structured tags allow to have an standardized definition of
>     tags with the capability of skipping a tag and its related data
>     when a "unknown" tag is incountered by a given version of libfdt,
>     dtc and tools. Those "unknown" tags are tags defined in future
>     versions. Even if they exact meaning is unknown for an 'old'
>     version, they structure is understood and the 'old' version can skip
>     them without any errors if allowed.
> 
>   - Flags in the dtb header (dt_flags).
>     The goal of this field is to have a placeholder to specify the
>     type of dtb we are dealing with. For instance, addons dtb will set a
>     flag in this placeholder
> 
>   - A last compatible version for writing purpose.
>     The goal of the new dtb header field (last_comp_version_w) is to
>     disable globally any modification. It works similarly to
>     last_comp_version but for modification. It can be used to avoid any
>     modification that could be done by an 'old' version and could lead
>     to inconsistencies between the modification itself and some
>     "unknown" tags.
> 
> This RFC series implements those features and leads to the v18 dtb
> version.

I sent this series a month ago.

I know some patches have been applied but what's the plan for the remaining
ones?

Is there anything I can do to help move things forward?

Let me know if you want some rebase and/or modification and so a new version
of the series or if you need anything else that can help in moving forward.

Best regards,
Hervé
