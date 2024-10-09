Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B92119
	for <devicetree-compiler@vger.kernel.org>; Wed,  9 Oct 2024 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728508731; cv=none; b=fw+puA0BL3m48MlFK5IPqdOXM5uqdpTFEQAY9bg6l06pv2OOjdyqYoS/GI3WzX408Ufj7uupB+gmIiWS5V3CDNBcWzt3gQIPx6+1M6+p23Eh9EANO0tQgRB1V8vylBLPXAFe9HUcvhi+DCfNluG2hC347WdbCQwlUatcaNo7T80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728508731; c=relaxed/simple;
	bh=T32HEJaJaMQ4xY39IRv7Gzu9xDDzZxWsCj1p1p50QIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+lCucW+KwyKM+vEc6VGoUNslaNqVfTOuTMpXIjxrp9UUARQS4252PU8Do8dwa5hkeaefKtd5iH2k6dx459bUHiUzcAG54/OFDfnM86u2+wrZf6oqSzRX76hWmsDDk1yilkChkI0E/ZzXra9eAl504qRvgm3dUWgSgAsoX3P/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XweKIb89; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XweKIb89"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e27f9d2354so269083a91.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 09 Oct 2024 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728508730; x=1729113530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T32HEJaJaMQ4xY39IRv7Gzu9xDDzZxWsCj1p1p50QIw=;
        b=XweKIb89cpuNgsiJZdBwqZLMRqyUGbiYRkcqk7+pq9CkN3X9J6YW+OAQaDr8UKYwp4
         zE7IpXVknsX2JaLCZxSsOpPjrPIz/8xklX3IWebYHrP0mb9gYpmtggxHOBilQL/IVl0X
         3eca6t9XEM6WiVZZ1jKv9Ih8W8/RUeoR4doAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728508730; x=1729113530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T32HEJaJaMQ4xY39IRv7Gzu9xDDzZxWsCj1p1p50QIw=;
        b=Lu2jZW35xAZDVTPVd8FDNpPpLoYZ1EuqnGorjIXD+jIWMU5IevsVDKfmhK5SS4XBs+
         E2pQnUDZom5i7HKvmscha0NYwPGdMuYear/1dIJf9g+lCYUhubG221LWaFQ4rpWgm1/m
         mjNSn1gs2BU3WIw3RbITifNlCSPs63rO7rXIfCCQEZWRycDsNoaI5gcS5bq0unVy99Q9
         vgMxMGT2LEvuQHYAOi05aJLDLmXDPRd9wA+zwKFCcu9c2DvTnG7wDjmxiXju9SPby+AP
         E3GoYcyczn9wRbOpvoH6QIQwuHlrmrClz/Jas2tX/QaE3xy6unJgcsyFWk1/3jVtiXYG
         3B6g==
X-Gm-Message-State: AOJu0YypM3wN4ydv2uLp8KNUiikvdz+QDpU7eeLDvtBLECj8gVVLnhnT
	IbzawZrLOfGdWCAuOftZpgzaW9r/sjs3T1GOUtHw3O36igIZ2W6XFYABjn0AnOv6lln8KtORdoA
	5tOzLvhIFbb37VIw7CaPZSU9rsTKChST5BiL7
X-Google-Smtp-Source: AGHT+IE/Lo7xQ1A5khdyYmNJgBXTF4Vw7BV8dmghBBsR5duKyrX5BGsNtCF9DERqRsV/IXcOqNXpquUjRpUpCUk3NqM=
X-Received: by 2002:a17:90a:a40c:b0:2d8:dd14:79ed with SMTP id
 98e67ed59e1d1-2e2c63aaa62mr1557415a91.31.1728508729666; Wed, 09 Oct 2024
 14:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008214134.171436-1-mmayer@broadcom.com> <20241008214134.171436-2-mmayer@broadcom.com>
 <CAFLszTg6dapEB3vwu9CicFs==NUCHgpGGbH91kJ-zKCWUcMo6g@mail.gmail.com>
 <CAGt4E5upXi4URn+JZworFJFPch=7iBot4E1b6WBCUZ3p8JBx7A@mail.gmail.com> <CAFLszTifpySKvBD6rSx9S++2d7qPiZeBWWyqEw3jq-Aeg=xkXQ@mail.gmail.com>
In-Reply-To: <CAFLszTifpySKvBD6rSx9S++2d7qPiZeBWWyqEw3jq-Aeg=xkXQ@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 9 Oct 2024 14:18:38 -0700
Message-ID: <CAGt4E5vYhxshw0MWDu0cad_LJ9tW5gVUaCrqUZvaXAJLeuo7rQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile: only use compiler flags when supported
To: Simon Glass <sjg@chromium.org>
Cc: DTC Mailing List <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Oct 2024 at 14:15, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Markus,
>
> On Wed, 9 Oct 2024 at 14:43, Markus Mayer <mmayer@broadcom.com> wrote:
> >
> > Hi Simon,
[...]
> > > This is fine, but you should be able to use the existing cc-option in U-Boot
> >
> > I seem to be missing something... how does U-Boot factor in here?
> >
> > My use case is to build a standalone version of dtc with clang for
> > x86. This dtc is meant to run on the build host. U-Boot sources are
> > not involved.
>
> Sorry, I saw this in the middle of a bunch of U-Boot reviews and
> didn't notice :-)

*LOL* Gotcha. I am not going crazy. That is a relief.

Regards,
-Markus
