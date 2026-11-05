Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793916724;
	b=udrVnhjz+dUf5eWfRghLgtugErYAnvyJMk+7roSALBd2qV8bGUvpe+9nfWqYr3CK5NtS
	 6pbY4VZEqMUJooswFFCbr0uOUAEM1aeQS2SRcLLSQDeE+aaTGlxd+SeJzqPL4hbnbVvQn
	 cx4+AqcWSjMd4vliwMoSeQhH6XFbAGUfCIvRAFhZfkh7PaI3FTEXKAWoIhvyZLCeOS+1k
	 Uh04Os5dQF3IQbHvpDe9uhV+sJ1tls5JJ5XOXRaLbpuR8q/8F+IuCMcNCddOorDx9c+Ox
	 HkO4c/Kr6475YwBn1GMNRozHAdEkv1PAMlMMFvD4feDRHrochhTQ/Qw9mxWQE7URgNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=u5/hF0HcCMRZKjVa+rgYdCAVQ4aq7+tQ8mI/8cwYUbo=;
	b=eOX/dE3B7Pe4f1BnzPSvEzJr8KyszvS6/wtL6wUze6XDEpASNlU+3tliVJlF2WWTjGVY
	 wUFMFI9K/03ncSHJ9v05pRALqS2f/cz8puHfnZ1ffmDsKUO6fARvNrKDPpF5hTXgSsYZH
	 QGgdxRoOujb9Jb0lRTXn82pkvi7696q6aUKqtEU3ageVoOeC2iXlAxQhiVAL0a+X65kbq
	 mfUgoeLQPmY9dNSorH2oa8U61VxPlEye8z+gNlqYYzSWQReZjGH5JFfPZ5kKrrKrHQR3k
	 SA87KlTPohj5Q+IyqxqGhXrWJTGJ9He5gqdBRPcCro6MouNicl3/yiWnDl8pDVt48DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PKDjCD+i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C592606A31B
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Nov 2026 22:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C592606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PKDjCD+i
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so2943063a12.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Nov 2026 14:12:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793916721; cv=none;
        d=google.com; s=arc-20260327;
        b=RhDwYmGD9TlEL16xRoi8iZzqZDQRFvjELKyx0Xo5zrC6rnZ0zLxty1RZF+Xa6ENCwK
         gEytmsA7wpjU1U/cvPYzbAXSehz5K/d77oCxPZ6gsMuOSeEGZmSb0+SBdTSWKbdRVesm
         0VaaQz5vYmM8+yN2FKbvWtk1DuSvsoMezgNBSyX7Fbcv/YSCIfOes8En7mEL16W7r5kq
         FzBMiLqB6i+BMpWdsmM6byW7IUqm6EwQNR0LIyBNSPxZVVuo2GT8CWYwt3A0oBib28za
         wUMgVlZNMSGY06gtSQK51Ar72PkJ/gQZbQf2DcAWd77AIY6mZK8EbmoPvH7K29eJdMYs
         +xNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=u5/hF0HcCMRZKjVa+rgYdCAVQ4aq7+tQ8mI/8cwYUbo=;
        fh=rvcpfGRtnXrMO3qA4SSq56Dmi4ZrF1I+Auo33drJx6Q=;
        b=XyJenERAY7jQbyufoRSvehGXVKr6BSkqOtiS07AVbEixGu1fM1KXZgUJqMBkOoeWbP
         SFmbW/n2GT46RfP8+bwPmPOHnC/vBMPqrXnXWFfWbwuv1sGMzk9gSgzsFeVd+Ha1WTcA
         z6TRmqjMBRtHGyIOYGeOY+8HT/xljSCN58qNg1wxM9tP7hreCpxLj0lxRbAi0gkK7L4T
         +sz15h+fGF93LtIFzNULzyvYnZxLbX+sMki8xtF1xtzZwbaryeoA3TLCLEQs+ES4nf3z
         KDRareE0dmGrzMi+IIpROmQEKtBxQJk9Osj10KB27+lkfLV5nnZq9F9KC5fSYVKSBpOC
         0gyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793916721; x=1794521521; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u5/hF0HcCMRZKjVa+rgYdCAVQ4aq7+tQ8mI/8cwYUbo=;
        b=PKDjCD+ivJWtkvTwpj+VGAo4RNU1ZjM58gtOZQEeX7ex5rX0HYSWcI1CTsO29jzTY8
         CAdagQWEjJaVDuAUaG+xpW0ykbK2dmZcvBZctJA22BKOR6+qvX8kYo++5sxGM/hpImjI
         ntAiVNmPQ1au0v168L0eQav74BH5rt/BhFeus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916721; x=1794521521;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u5/hF0HcCMRZKjVa+rgYdCAVQ4aq7+tQ8mI/8cwYUbo=;
        b=TxInJ0QlQkgH4eCRVbPzSbtiLg/S4/sQ6ZQLljdLaLq5ipdeOGxSLT2z3p45zwy6bO
         TEN2BubiTksuAY4n7m3wwq0IJAKUA7wj+2LoWj/E4K1/hj6GeoHf92BKUeUF6e5SbrPc
         2TkIOQWycnCjqLxTt9kKaUb9tMTCDXJTQONUKD+EsS9rLGeuzBJBOPR1yCXolx/QoSw4
         Q0qaqxMG5khcRZppM8QdvHeQXvLsr9/W+jOofMwKJm0VPdo6fdxaf3vjc04nfKsDeFaf
         Md/lMA3zPj5YGX7HYX9VGTUxO1tBDId8uaUrpmZ5nxW09QGNso9bU3xw/teJ57qJP+pL
         W8/Q==
X-Gm-Message-State: APuU4Z/Y48jWYXL+qs/5pGYVzpGg/12p1WrT6DyF44d0okwgoBPKOCXX
	mM8USb8KpSRoZoN47FxVBoEkiF8agjn9Er7FPHXln/6I44GRQw9aBW0/usMejscAuDOAi4xhmI7
	d4lkkSO+wXsYIqm78ys/x6yG+Z0wLpme11JeVYufk
X-Gm-Gg: AYBFou0j4TMV+zeRywuBsJPd31+shNLKICRs2OkN2pR98XNLkf6/70mgkGTIDgstrL/
	KSOUt7GdareWscucVxruHqbkMy6x8OC5/AIFBZFN4yLuFGgsljhy41HN6uLV4chuhtHq+i3aOtI
	e+5rah3lgqMFtwdM/DkcctGagMjA0LNcesDN6BG8g/vWtJx6RGBRvAB6ey3cpE6abRYaNww2G2I
	406/O3efM0WLAUw9wK6EGy4VAsMbwyZe8De0Q1ucj1yrbVm4qfaoh0yYAKU3BygpEWKWUbPPP3l
	5maU6/7rWIGHH3+EE53VBhLV72I0MrGU8yzViIT/nnaiLW1kBi8ALnhdu80V/wQ4OMx1OkrQCv4
	+2F+RnDxGvvYa6OnaWlOyrjx7U4lupsJnY483TnAC16Irbx4hlNzMKyD7nFprYH/bx3lTxArTzY
	tPNNYZQ8EM8cU5+p6t
X-Received: by 2002:a05:6402:5d5:b0:6b4:5a0c:a7ff with SMTP id
 4fb4d7f45d1cf-6b5978025abmr388235a12.9.1793916721518; Thu, 05 Nov 2026
 14:12:01 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 14:11:59 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Nov 2026 15:50:42 -0600
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261105180439.955822-1-ayan.kumar.halder@amd.com>
References: <20261105180439.955822-1-ayan.kumar.halder@amd.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 5 Nov 2026 14:11:59 -0800
X-Gm-Features: AclHuK_2ana2RUBE3ct-LunWfA3ggDXl0zX6C_PJ6iAqak-xl_9aRvj8lkm95x0
Message-ID: <CAFLszTiTxLtKm9=46v0xuXErJ8acdqKEZoL-y_ppKA_9o2SMBg@mail.gmail.com>
Subject: Re: [PATCH v3] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
To: ayan.kumar.halder@amd.com
Cc: devicetree-compiler@vger.kernel.org, 
	David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Simon Glass <sjg@chromium.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-05T18:04:39, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
> libfdt: Fix fdt_get_path() reading before the start of the buffer
>
> Asking fdt_get_path() for an offset past the root node's FDT_END_NODE
> tag makes it read before the start of the caller's buffer. Such an
> offset is not a node offset, so fdt_get_path() should return
> -FDT_ERR_BADOFFSET.
>
> fdt_get_path() trims a component off the buffer for each level the walk
> comes back up, comparing the components it has against the depth from
> fdt_next_node(). On leaving the root node, fdt_next_node() takes the
> depth negative and returns the offset just past that tag rather than an
> error, as commit ce4d9c0f ("libfdt: Rework fdt_next_node()") intended so
> that fdt_node_end_offset_() can find where a node ends. The loop only
> tests the offset, so it runs once more and tries to trim a component
> that is not there, scanning back past the start of the buffer.
>
> Stop the walk once the depth goes negative, as
> fdt_subnode_offset_namelen() and fdt_node_end_offset_() already do, and
> reject the offset up front with fdt_check_node_offset_() where input is
> not assumed valid. Add a bad-offset case to tests/get_path.c; run it
> under valgrind (tests/run_tests.sh -m) to catch the read.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
>  libfdt/fdt_ro.c  |  8 ++++++--
>  tests/get_path.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
