Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5930CD92
	for <devicetree-compiler@vger.kernel.org>; Tue, 13 Jan 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332142; cv=none; b=XpR260a+dUe69HSIEcjbCzXMHzmAkpjyhAM6pful0ogyN3Cix+CS9UdTmWQMRgAWNjIHPSExJTq9b3RxJnxK0kWgPPeitc7jCcq8SEhdeCi5/Pj70tgjVE0ZElSVAa7qej7q18CxXq/qBlUFlg85Dt8cpBIaH2Saf7Cw5OUjOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332142; c=relaxed/simple;
	bh=KCqNiCnoFXG2qnUjPKHhREhKguCUf493xV+T7T1XAlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFx1WIak73ICdCwa8A7uV3r7wx4U3yuKAMfs2u6WhWK/Fm3WGv/R92XvMSzd+IiQq67q5Pz3KDZAKhiwOKZ+Cz6Oe9yVU4fTfwTcP+SN4qxXPeSD+eKuCZCkyQNXKz79Ve3XGMOeHB+0jGZHg2ZuclKttO8RxweFsgnPAOEgpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVbU0vbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVbU0vbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD28C2BCB2
	for <devicetree-compiler@vger.kernel.org>; Tue, 13 Jan 2026 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768332142;
	bh=KCqNiCnoFXG2qnUjPKHhREhKguCUf493xV+T7T1XAlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OVbU0vbHCLBJdTOzkIolq11JbEnmhgdTZGqWgQkTtez0DGtYxdl7zyuH0wOWtZURI
	 Q4ab240gmhSSIfQNsDc38qUxn30vgDIjQ+uxoPU+MEQtMT64x+i553o9HE1wFNqPG0
	 4thJdrkwnnLSxnZBpfFwEz/+g8+RnWVCynt5GhOwW5qq77Ii8SZuWRGeefkEzcoxKC
	 NolIfh45Za3PR6nmpu0pM37gBohmYpNGugefVNW8sAZd80ZQszl+v3IOuEltdm+v9v
	 XGUJI+t+el92wehpET/IJN5PNK1PbpqAcEL3U6/a3MCTHm4l457hXdGe/n+yrub4W0
	 CCHCvKYYRfZOw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b87113bd83bso469947966b.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 13 Jan 2026 11:22:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwmoBw9G6VT+VJrtrVGu2WM6L9UxQxYkb4zaqAOo/rcKw7jIzdZ4vbzhRLI6QpUBitehUIMgpZkX77deeUajg38F39@vger.kernel.org
X-Gm-Message-State: AOJu0YwdBeIMsBMgGYdX32yYFmY7W+eOCEuFG8JYbIxnz8Oudg27Ntls
	x3vWIEvlnUbef5WnM/p3uwWjb52Sk+GSCXTqedhvUprnYf/DW0N7OoJzQC1VBoIgxZV3/kiIhlI
	3ngBp8p2EaoHTsThWDFTdZu98u53BxQ==
X-Received: by 2002:a17:906:fd8b:b0:b87:2fcd:1955 with SMTP id
 a640c23a62f3a-b87613d6796mr15394666b.50.1768332140863; Tue, 13 Jan 2026
 11:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112142009.1006236-1-herve.codina@bootlin.com> <20260112142009.1006236-7-herve.codina@bootlin.com>
In-Reply-To: <20260112142009.1006236-7-herve.codina@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jan 2026 13:22:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>
X-Gm-Features: AZwV_QiB3iRBM8q9KM_-ENn_wA7vX-SS57cfKXRjAmuNOjocE2jTW3JoPADtbNc
Message-ID: <CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/77] Add support for FDT_REF_LOCAL dtb tag
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 8:20=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> FDT_REF_LOCAL dtb tag is a meta-data tag attached to a property.
>
> It indicates that the property defined before this tag (FDT_PROP) uses a
> phandle value and the node related to this phandle value is local (i.e.
> the node is present in the device-tree blob).
>
> It is followed by one value:
>  - offset (32bit):
>      Offset in the property data where the phandle is available.
>
> Example:
>   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
>   FDT_REF_LOCAL 0x00000004
>
>   This means that at the offset 4 of the property data, the value
>   (0x01020304) is a phandle and the related node is available in the
>   dtb.
>
>   This is what is encoded in the dtb when the related dts has a property
>   with the value set to <0xcafedeca &foo> with 'foo' a reference to an
>   existing node where the phandle value is 0x01020304.
>
> If several local phandles are used in the property data, several
> FDT_REF_LOCAL are present after the FDT_PROP tag. Each of them points
> with its offset value to the position of one phandle.
>
> For instance, if a first property with 8 bytes of data has a phandle
> value at offset 4 and a second property with 16 bytes of data has
> phandle values at offset 0 and 8, the following tags sequence is
> present:
>   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
>   FDT_REF_LOCAL 0x00000004
>   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
>   FDT_REF_LOCAL 0x00000000
>   FDT_REF_LOCAL 0x00000008

To follow up on my desire to both be easily extended and have more
type info, I have something like this in mind:

FDT_TYPE_INFO 0x10 FDT_REF_LOCAL 0x0 FDT_TYPE_U32 0x4 FDT_REF_LOCAL
0x8 FDT_TYPE_U32 0xc

Length is 16 because I would do u16 for the types and lengths. I'm not
sure what the max property length is. In theory 2^32, but I suspect
we'd run into other issues (e.g. libfdt offsets are 32-bit on 32-bit
systems). We could also do 8 bits for type and 24 bits for offset.
Offset could also be relative to the prior offset.

Rob
