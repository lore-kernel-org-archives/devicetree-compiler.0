Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793814659;
	b=fKkTDoz9w9DBo/c1q1Lnuv0RVAMg/KOb/rOU2t1UI1fqdc99hpYxlfGOobF3Ys3Kx05o
	 /qd1NBnSBlv9nu2q7m/sbR/B0Ml/pnWwa/c2+TV9TqtyznPd5/+KTvzEhMDPursHNDzTe
	 XMS0R5dVAgRn1F7cXe5LiXvtsksZuZvnBd/iFG+m3rD301CFTYbqBljKzkVArNZzRpjK5
	 ElaP/bBiE9641kxeL/vv8oXWK6snkT9gqEPxps1+p45CgzGx8NNrZ1pH80MNKxK01MYsg
	 UROam0y7gJqAz/pa7xGeof8E6+vJht8Y1zZl5ZzyQT6C0B39QYDdLjETUEMOTih8jxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FYz8NcuWP4ODKFmU0CHlUehTkTPbFgQ8vnhmnRHo54c=;
	b=LG1VEVsM7IcSA90ZqA7DxYHGIZxmoDPqM64gIHEikAxIqa7MuzocY8q+anbOzgkUlrFa
	 oSM6Xhzat1QgcEiNZTme5ThfxxbHVoGVIWgnqd5obgVyokr9tXtyRBEdKlt5PYBfepDRo
	 UMZoFLHysKu6yZpisNGnbulGWwU26fBhn6NMa7m7BZT/rf0CkUImM28o1CmbkP3zDrhbu
	 SBOD48cOPgr2ibRxdbhzUfnDuLT6m1LhuvAj7zjgrSZgjzHrPaWBDT5Y+CmqlaCg2/rgm
	 vJVoJoL4wIM6th53wtmBvXpbxGCoGOdBP7Y8vhHYBUwg2HWcIPMVnrUnqmaim0IDEVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ULrC73YL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FEA606D32F
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 17:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FEA606D32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ULrC73YL
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b5766b2986so207925a12.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 09:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793814657; cv=none;
        d=google.com; s=arc-20260327;
        b=Pnk6Qzo/2XKs9ESSbITAAD5P+pLrMJgJIaZZWbGNZ+AHHLhwysaLpW5Y3aQL34kHVS
         FcJ+xc9idOix0hPwAt6VriS7sAVUoDE4KGNECCpBJBaPxD23skKupDCcebWMpGz4IES9
         OaYcBAiO84uNBOqJ9cLRP+hRxGSRzVUPZ7RC+BigYJRSIVfD+42bVcbgmUuIp7u0yUq+
         8PkHrPe1pwnSuAHpy7/iOUW9btfc1mw5+vTA7alncVS5ZCaNIRSeZDuK7t6oj7yBwrnn
         EcaNR5Sn5keWiovkXfCx27fpKblHHvOb4u4eg1YQOmjk2QgzIDlbBqDUiJlc9aD2WMtF
         3isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FYz8NcuWP4ODKFmU0CHlUehTkTPbFgQ8vnhmnRHo54c=;
        fh=OG22VNiSM0EqjWrCjDSn3m1hGt9xrgSJosUMrZftzeQ=;
        b=gxcOSjfiBChBuoz1wkJ0zex9+DfDYOKWpnuohNxEZDteRlYfs1xfm5eUvxDDGiPcjL
         tHP8EMWU9PznGA7xerM8M48lS0uGtKeTNQluhGJoEoMBu7HLoVU2iJZek+it+eHuN4XD
         Mx7PSyxHKiHkHRysiF8J0LHy8IBYSB1/goLfF9IzwKZlqDf9uj66L+I4Ya4zVzLEGWGA
         7yx///CJtEbxwMH87ZQlZEuD/JijjUewhYg1voDKAbWUqG5dyRD4cD14ewZHn9nbtMtV
         FfGWYBcV7/k1/MlBrIReEvnEBKmfNxiVUFv2yn/R1v9CUHsDfoa0CEHNkgclIyjO4Qge
         02pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793814657; x=1794419457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FYz8NcuWP4ODKFmU0CHlUehTkTPbFgQ8vnhmnRHo54c=;
        b=ULrC73YLmDXcKbx9iICTbgmakdqhhFP/IABwr9dLnGdzSaeJfZdsNcOjgVmkjTwbZx
         bvPnL6yvr1Ovke7xPz4B3xk5kYbZ3P9V8ual5fZOK8nm4RD/2AWhE06lBD/f0UU057TA
         UEQJ7kqimstksjWcltQCfMWOQ2rFghiwg2mVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814657; x=1794419457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYz8NcuWP4ODKFmU0CHlUehTkTPbFgQ8vnhmnRHo54c=;
        b=CwBff37rie4S0hFFy5RVeiBMPutq8qfOlF5chE7yNcH+AL7CLjno4i7aWunRLYOJ/u
         YPbFRFlCHNRfxzmu7TOxFh+9z8eyad9UmuzDfRM8/wN/QIwE7EMPJbsNeEvJMjg4gZF6
         wKB0RyOPHBVl9+4aKFczh5e5rT+TW3tl6DSWVQVBosGJ7t5blLKgs7mHq2eBchVMOILo
         NzUeEmNyaa++emCCygBxCVnZ778pZDgLgFI4uqvjsnyq3iTSG2Wwj//nTcL6SQrM9UO6
         4Y41Ng+TfTbOKRFllTPMNcY/0KETUU+lEagpVryvN2WDfgzyzmfDyLAxS/bMnJh4orhi
         c1EQ==
X-Forwarded-Encrypted: i=1; AKwUvBypEtGjy2c2ClUn3feRjRorjcRqMJGGfDzJMbec6gzqrRcgYlSfBTl9fDz4zKazisp6elkirCKnbniao17CdltpW1PC@vger.kernel.org
X-Gm-Message-State: APuU4Z+e6Y4w7kplYDg3QFQZX0xJ08udiPb/5BSAjFekl0fcubUAGLo3
	AeEVDOYa7mthlEMJpR2utpL5ViqNcJjmSKHbwzg8e+3yR2hO4oM5FAYNjhjA5PlEu1Eii6MK+HS
	87Qz3O4OW6VjFHWSLN9QZhao+pEFVeL99Lto1+QRApQEJX1CEVh5MHklv
X-Gm-Gg: AYBFou2ABNUAhlySCwGkKaH3KxWMOJ/lHVnv3HOLj4a+91XI1scecqxhweVM6rQ0df9
	ngmhUFkuxj/47rRVvMzmA3nmv3o/whVty+D91d4UBtdh0CXccZy9Xau+urm8LXf8ayhFQtEerQt
	AK8WM7imThDAlZyz626eAHEAMURrILah7trwRNG+DSHLL7qK9RwkezQscpBMLgxpvYs+vp2aToN
	OqZHQcEUSs3mXYZDjbNHJSHENzJBklpcPsPAfxbNRLfv8gK0AiJsz3a1P0J4YVVyyOV8BldplXd
	3k8g2arCboZWxpeYTqtK+KOS7PHRbBDZjvGBDRi9gSoOPvm8EVLaqBqtQoRAKR6MB0qzALN87a3
	KKWrAJONe6WtNcV/RTYJ/gJPrt1r+yj7n3P0CkrYCxIFxztSVTDEPbpsAnPbONTfxrmMPhYE7yC
	lanQTBWBMxSn5sznUspcBhgLrOh7WAWzIIU7StFP/NkEqBKtDP
X-Received: by 2002:a05:6402:14c4:b0:6b3:b3f9:c418 with SMTP id
 4fb4d7f45d1cf-6b4d428effdmr10492425a12.12.1793814657369; Wed, 04 Nov 2026
 09:50:57 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103161425.1258558-1-vishalc@linux.ibm.com> <aurG-frOaM-X-Ay8@gractus.seuss>
In-Reply-To: <aurG-frOaM-X-Ay8@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 17:50:45 +0000
X-Gm-Features: AclHuK-XWEledv-HCw_3RBVtiuTfk8xZwqSI94-FshjwqMncPDxI9BfqMIBZ7eQ
Message-ID: <CAFLszTjTvXBSThF0VjC7Lq8gP+XfoGk_D_Z2GTW9Fmxggn3CEg@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Add fdt_add_subnode_tail()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Vishal Chourasia <vishalc@linux.ibm.com>, devicetree-compiler@vger.kernel.org, 
	sourabhjain@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 3 Nov 2026 at 22:55, David Gibson <david@gibson.dropbear.id.au> wro=
te:
>
> On Tue, Nov 03, 2026 at 09:44:25PM +0530, Vishal Chourasia wrote:
> > fdt_add_subnode() always inserts the new node as the first child of its
> > parent, after the parent's properties. Code that builds a list of nodes
> > by adding them one at a time therefore ends up with the nodes in revers=
e
> > order. That matters when the order is significant, e.g. when a blob is
> > rebuilt from a live tree.
> >
> > Add fdt_add_subnode_tail() and fdt_add_subnode_namelen_tail(), which
> > insert the new node right before the closing tag of the parent, so that
> > nodes added in sequence keep that sequence. Like fdt_add_subnode(), the=
y
> > use fdt_splice_struct_() and so leave the blob unmodified if there is
> > not enough room.
> >
> > Also add an Fdt.add_subnode_tail() method to pylibfdt.
> >
> > Add tests for both: a C testcase covering ordering, parents with and
> > without existing children, the root node, duplicate names and running
> > out of space, and a short pylibfdt test of the wrapper.
> >
> > Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>
> I'd need a stronger and more specific rationale to consider applying
> this.  In general node order should not matter to consumers of the
> device tree, which is why we make no attempt to preserve it the
> fdt_rw.c interface,

Yes 'when a blob is rebuilt from a live tree' needs more detail. What
is the use case that drove this?

The spec doesn=E2=80=99t say that sibling order is significant, but it does=
n=E2=80=99t
say that it isn=E2=80=99t either. It only requires properties to come befor=
e
subnodes.

From my side, one use for this new function could be with Binman[1]
which builds firmware images. The nodes describe the ordering of
binaries within the image - example at [2].

Binman knows the current libfdt behaviour and is careful about
ordering when it is generating nodes / processing templates.

Specifically, the code at [3] (a Python interface on pylibfdt which I
am looking forward to replacing with Doug's one) has to add nodes in
reverse order and then rotate its own node list to match what libfdt
produced. Inserting a node anywhere but first means deleting all its
siblings and recreating them ([4]), and template expansion in binman
([5], called from [6]) has to walk its sources backwards.

An fdt_add_subnode_tail() would let this code add nodes in the natural
order, without the reversals or the delete-and-re-add step.

Regards,
Simon

[1] https://github.com/deinde-dev/binman
[2] https://binman.readthedocs.io/en/latest/binman.html#a-first-image
[3] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6cb90b=
3e067ee61/dtoc/fdt.py#L684-L696
[4] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6cb90b=
3e067ee61/dtoc/fdt.py#L577-L597
[5] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6cb90b=
3e067ee61/dtoc/fdt.py#L735-L786
[6] https://github.com/deinde-dev/binman/blob/7a9cfb456ddeaba09f0cefc3dfd6c=
801978c6509/binman/control.py#L498-L523
