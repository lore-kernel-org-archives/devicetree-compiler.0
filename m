Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97019C54C
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Sep 2024 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726139249; cv=none; b=cPinXMO/CbhceuvQC7ztcSZXfVFkh98j958KvjsYDosRH8IM6F7WQ9KuRxpDrwaWCOKHQVuyuCaAsMCe59+eU9GAjRribBArJJw6Yv33VjIGZC+NbDYc9Tne0eCxgIYMZAOIjJxM8E310JAlMlMoe4WGGtPno4tfcwNau5qRPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726139249; c=relaxed/simple;
	bh=/NLvdKW16qxLmoYeyUY+RqMWnoVU4YFUL7yXCmYmazY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBtnnYZDbp3Z820mkB7hvwR9om5EToNZYHxXWpbXy0spo+PlC5zubHJV3uu/Vt7D9sPyQetlmfMDhOfZLT19OlPSzZ6xikaXt5gKIIUygCrWbs5C4CZoWVx2AWCYgw4Kw6AnxxFi6aPlABSYP8Rg/RxG5qqmOo3sd5TNiNgfcF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWs4Xyrl; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWs4Xyrl"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d3c10af2efso6766447b3.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 12 Sep 2024 04:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726139246; x=1726744046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7BbaAXw0u74yeIuG8BnxOvL2naeFc48CqUz+wr3Ol/E=;
        b=kWs4Xyrl8OuPqq2G3MaInxEqchaP6bWTjTYT6BWYbCPteA6X2pFFiTrVbaCHmhQdQ8
         eq0b7lH34dBixkfDndspWl6ZviMAcqrJa1iR0gb4NtoI5n3GmEL5n4/q42K3ALJfOmaA
         +kELeo+eOSD17CdW9J5Yy5MNbzXvHuvI695397aWVaepkLutL2C3EIVMiJsoxRxO0dmB
         uElgqIBRaO8zJeWGZvfNUTbHM9UuRplH7p+o9KieqxXRgP55K33326wwYtJHXlR74jX8
         kcw6If6xQUQQYIIugPbjxOrKGA9YeD6ToT2t3NjE6W/AJQTXaMWyGPxJk65oklwJgiX0
         94TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139246; x=1726744046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BbaAXw0u74yeIuG8BnxOvL2naeFc48CqUz+wr3Ol/E=;
        b=g1Bj3QIDeT6hDvAJNvWLhsFEuXLvxX5bqpQj84X/QJRY8bbSm1YQe+Ds+YI4Hppwsy
         02yudgnM930IkNPcg59zBelmMKRjU8KCcPmno8qec6JmH1+QntZgByKNFwriVBIYxPh/
         Md76mF5CySc7M3Wi/yO+Wbic3kJ/cdO+LYKzthmYbxzi88AlkEeA+ns8fd/Al25Hp+pr
         csmLFfaEhTdrhydDwQb9JcPH6UI26ir00cItxa7O6JU5pAhWA2pjeSR95d4GWgdFZxLy
         //kWkk34a93vc8iAjZxH4U2yqtslS8OKZCds60FhxjQddQWbjC7WbBHRoKzF3tDXoyp9
         jMhA==
X-Forwarded-Encrypted: i=1; AJvYcCWMa2xodvIBvcdvepvxj3WN+4kmwTHYsi7I7LNcpY1IIkn0nSXVtWdlR0RDot//y6p6oqq8zHK7V7y3LltPwOcpVf+7@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0QRTO18cyHNkaRWR5L914P+N3jf6XV3cXXSOf9MTHhFjv+Xg
	3qPLR79AqfMUnBQs9ae5T6wJBeOQHicDsYbM7qJL5dPJg7SOimE6y7PnIv3bfl/Cu0/jN3b/gXI
	ulQAEY7AWLysNNn4nof32ds7BleQ=
X-Google-Smtp-Source: AGHT+IH0K64oKZlsqCHun1WiCPG5UK9JuHVjAJuxLNoF6xfe2ftx1SIILcPKNPmDLU7xQ5v/O3s0SOZH9B1iJEH1HOU=
X-Received: by 2002:a05:690c:3707:b0:6ae:ce24:3d5 with SMTP id
 00721157ae682-6dbb6b0d5a3mr19382587b3.17.1726139245752; Thu, 12 Sep 2024
 04:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
 <20240830-append-v2-2-ec1e03f110ad@beagleboard.org> <CAFLszTiTR4-WLoVP7NDAWtVHYsFeVNaT84k3MLUDMYYpF7CvSQ@mail.gmail.com>
 <07859c9d-36f7-446f-8ee1-f494b863f5b7@beagleboard.org>
In-Reply-To: <07859c9d-36f7-446f-8ee1-f494b863f5b7@beagleboard.org>
From: CVS <cvs268@gmail.com>
Date: Thu, 12 Sep 2024 16:36:49 +0530
Message-ID: <CAK-9PRC6O5-94FP3_8FoX7NXBXTEyNVLBUihwDjBRh3SzsGusA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests: Add test for append-property
To: Ayush Singh <ayush@beagleboard.org>
Cc: Simon Glass <sjg@chromium.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
	jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
	nenad.marinkovic@mikroe.com, Andrew Davis <afd@ti.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Robert Nelson <robertcnelson@gmail.com>, 
	devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hmmm... in the above examples, using --annotate on a single source file,
it is not immediately evident whether the existing annotation logic within dtc
handles "append-property" across multiple dts(i) files properly.

As you can see, the -T (annotate) and -T -T (detailed annotate)
options will add inline comments in the final unified device-tree with
the actual source file:line.
This is a critical feature in managing complex hierarchies of dtsi
files being included in a dts.

Until now (without the append-property keyword), IIUC, there can be
ONLY one source file/line responsible for a line in the final unified
device-tree. The latest line specifying a property overwrites all
other specifications of a property before it.

With the introduction of this append-property keyword, now more than
one file:line can be a source of a line in the final unified
device-tree. So, i wonder how the annotations will look like in the
scenario in which more than one source file:line is responsible for
the content of a single line in the final unified device-tree.

If by any chance there is insufficient annotation containing of all
the lines responsible for the final  "appended list", i worry it will
be a nightmare to identify the source of the resulting "appended list"
of values being assigned to a property.

regards
CVS
