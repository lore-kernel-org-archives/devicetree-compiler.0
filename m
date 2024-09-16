Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80315C144;
	Mon, 16 Sep 2024 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726515937; cv=none; b=WfqXFqwcYPgJPwk2vwT6np7aXDheMtOS9qHNQL3LtArD8bJ5r/w4457DbaTQw0kJp6zgoRH17DPB07V+6MPhZeH7hDt5ovqy/qOQQWRBGo1H6X+DlGIiD3mArktOuWaPaz5Tryu2UU/pYz5FpMjo3R9pac65Gpt6cOLxYEsQgYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726515937; c=relaxed/simple;
	bh=J0XsRy68QvDeWzEyDV8EQHQnA+0bxrlaPj+0A+MHuAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kn1LFLCs+QRhKij3DMib8UCEWbR/3Q/sQwQVMb9Hq1lLk5Uzaz4EskxpbV9KUa5V9go5rQw+ExWmqrUj25TNQLaAP2PfeT7GLQnlVn1TzF0YaHDZHaFsnfyJM+cYEGzpFcEbTZRbGgO766qYkY4Z//09naTFS0/Xhd28tSz5G2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw9YEnNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw9YEnNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531A0C4CEC5;
	Mon, 16 Sep 2024 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726515937;
	bh=J0XsRy68QvDeWzEyDV8EQHQnA+0bxrlaPj+0A+MHuAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iw9YEnNqE52SgxbTpVoSC0XlT/fMUF/6gVJRaicYZ1WdGjkB59Aw9F9I4jZIg5iNC
	 wcVp/33jxJ+CvDs8e3hgCxaAZzYe4yOuJiOTYmJZCrephn8tw/ly5VNeloML6s3AUG
	 wQaZlUgLUILtPhyJVJN1S8aF+nBS0QCWYWiKK31YmuOtVCZpEq+TOKHR0tAdTqTWZg
	 kk2n8q4enIjXJFkdharEgx7c4eaU1iKE4kyDG8JljsHSb3SVrr3jUwv/7m/AXanKDD
	 2JVZRk57qMnuAxxLSstDtKTZ54cDNuEZ48xbAnUBzczIow2qPjoWoGrkiAcmTxc52m
	 rVaLVu87+9r9g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365928acd0so5355832e87.2;
        Mon, 16 Sep 2024 12:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpCOOuGUDec3x7K0g3B7qXasyhjv4ty4pjz0diL0ozQD9Rdgm8c9zPBiFglyCnxrT3h68xvc2SRVCI@vger.kernel.org
X-Gm-Message-State: AOJu0YwxSZ8Ird4Qnq0s5ILgLWCFsET+QYmqTJkIs+Z24QD6+J5qVN+4
	bmz/E5B4bC+SdaW947wHce7B1yxYw8/TCwuuc4d4xftpVaiK04mUm/xFYBwS4LT5YLLmWY9BwB4
	grqEHqb8b/r+XcDYUCBncDGucrw==
X-Google-Smtp-Source: AGHT+IEh1/r4sit65qV9B5brnVE7Ysa8+6yi5reozcHR9TIJuH/F6qiIt1WM3FZsaqur6u6ZJpu+81989/8dVzTUPXE=
X-Received: by 2002:a05:6512:68b:b0:52e:fa6b:e54a with SMTP id
 2adb3069b0e04-53678fbfb2amr8379085e87.30.1726515935672; Mon, 16 Sep 2024
 12:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZsBvsq5pVv9xEPmp@zatzit>
In-Reply-To: <ZsBvsq5pVv9xEPmp@zatzit>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Sep 2024 14:45:23 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+P6j70L=Sr=a5cBrGEMswZN0fYdaeOeDxGFG-VJgWNbg@mail.gmail.com>
Message-ID: <CAL_Jsq+P6j70L=Sr=a5cBrGEMswZN0fYdaeOeDxGFG-VJgWNbg@mail.gmail.com>
Subject: Re: Device Tree Compiler v1.7.1
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 4:39=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> Rob Herring pointed out it's been a year and a half since the last dtc
> release.  There haven't actually been any headline changes since then,
> but there has been a steady stream of small updates.  So, I've rolled
> up a new release.
>
> As usual, the git tree can be had from:
>         git://git.kernel.org/pub/scm/utils/dtc/dtc.git
> and tarballs can be had from:
>         https://mirrors.edge.kernel.org/pub/software/utils/dtc/

The tarballs are there, but it doesn't look like you pushed the tag to git =
repo.

Rob
