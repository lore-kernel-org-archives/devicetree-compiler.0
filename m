Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794421470;
	b=Q2Chnhv417RiG8HcIlsk2TCmXiQPCNc8Sqm84pSMTxnorXYerJmOf6RoP6P4Ds/qEQPZ
	 NtYu3P6GtOffCyY8ysNxjcBQflsv8+iiyof06GntCNyyu+MxiXjdSitAPmSsh/DfWxl51
	 QRrZ9kFyOAEelvnyZrs4AJ6kJZbHk1PDTmOBVHFl7APExlwkpbCCQqD5X4cwbTFtbZyuR
	 IX+3f307o7OPoq8jJ7Kss+1HCJj6WKITOJv5BF6qShpxsyekYEs+/fPlX4kChGX4+jLBQ
	 q9pNGAlljGeEBY76Wmb1DqA/wvKyEV8jqbO2+IJpND0t8shwqwnDcpLM9wtO+jFxOXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Cn+poakr2FvMpZErAA237Zd7KxBsIQ3tAPa/ssxggdE=;
	b=axOPuUwjk1bBZD4sGYt1dsQbBH5QQ0YZlxvwPt9SfSnr6/l3AZHTvtn8dUCNcDEOdLsY
	 3sDHEUzlc2iMHixW+hQzgJ/FM4Uhe5KCA9u8vAvHiMIGykDXmdEcKE7am3KD7tbidfwZN
	 KUExSajSI0VkdWnfQHYI3EYuUQT174BWyYMufJWowJ3/G+RL2tSeJNuZKlPV80abzc48k
	 KKfSoGUNuRW+HwJ1BOrEocnSTJw1Dmc255FGqIG9dzC7jvVlFYiNrk6qo4+24tqoSBfpT
	 0HJK2g/GUYVjRHogCw4s0LEHoEKY8QPgDfBB48H4A7BELOPqNS8fx9mgmWXcLk0IlwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I1hu4GHr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E80606A334
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 18:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E80606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I1hu4GHr
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so156209a12.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 10:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794421468; cv=none;
        d=google.com; s=arc-20260327;
        b=dr6sAGiTFJhguqpR2yaqPnkkNzAFNUvEMt59JoFLtB65hDUDSxNwf+gQDHiQJwC1qr
         q5SwMzU38ZUVV6V5Ocp8137GJvBrDLPa3fxU8YRiyqdqw1ucXBiDpUaJSPQyPh2j8oU1
         Apkp13wwurF5f5mb+8F6AdzW7PDBMs8afQsi36xsERmWHyTjGqsYl+mV6YBXIx/XWVDR
         YCM8m0RBEzIOxaVGHDWEH0n0bfnYa91K4AESGHTu7+I6H5LdAIJLqAaVTN9z0WLO71B6
         YzXhFYNd0Hey7U8qf2Exrbd/LXcYPFLlfXMmj/YUeGhQXwt9fZXAPvm8xIm5p1oF4nd2
         VHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cn+poakr2FvMpZErAA237Zd7KxBsIQ3tAPa/ssxggdE=;
        fh=flLZzG06STybKEHim6W45Pq9CJddTTgEWg2Sj0dkL/s=;
        b=Gl11raHpHYRY8NIdHDaCkAy5PC5sIPUFGo4uZBPMhmryoMXob0YXYMeiXufWDkL4RJ
         Mz0yKQrUIieCEPRwHfX8udZVGG2/4M2yAcCDB1eUvoaxlsnm6OL7dg1QDPewsEs1ZDnF
         up04kRCz0f1hUAuoAltMfq5lOwezXdkc2C59D5VFmCTMGa45WEunhlpqWs4OHKagcjSG
         5KJG53BcL9TKDuNxcKcClv54U6IAl5pAB0zg82r+X7/5+ANGBhL63qV1vKY0l+8CiGDw
         DqQJtcyPGUWZEVe2sA7gedWST6UBtuNRSCbbN8eelsoQ+PRF484osO8JTVWgGWq0Lst8
         B8Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794421468; x=1795026268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cn+poakr2FvMpZErAA237Zd7KxBsIQ3tAPa/ssxggdE=;
        b=I1hu4GHrrvnfP+KlGJeUKzov6jkFhNwti8aJbEpU/VeGlE5pZfueokh3V5VB9yCgBF
         rYcsTx9aM8N5BYIkh04hpPcNqzYNygug69IWfRssaL/wTZAIYix4m0bp05p7idFrgflQ
         adz5XvFqOFAtqyGey3rXRGxmQ5YzSkEi00dKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421468; x=1795026268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cn+poakr2FvMpZErAA237Zd7KxBsIQ3tAPa/ssxggdE=;
        b=wum9rDvJWaL2Yky9WB9jZaSKJ7l2qeJewnjVdw+AZZTLELwOGb+L2cPEvxsvMI0yZ7
         fFQmjvbTFwkgRgPhYjjrrep6zK4rlRwF6RzjVyfJXoYuNbEpSK3jWBAauSY1p0WugW0q
         oi/81W8frSFzQq3eHok1675g20Sf0JujuAoMKEIF/Iu/qjYVrHE5euiUQ1Rgq2hxSCa6
         UVn507MnFVpNoZE/7O0jBGLYIimDW5mXb82Y3Pl3QMDgqMS5iuA2rHNaNRr0cgsA2GtM
         OXrkxdIiIxjRQKmfxmMm68HbykshcPU2XJgIm0EJZRm6UrXEmWql00PxKPyt3Z1gcUsJ
         GEiw==
X-Forwarded-Encrypted: i=1; AL+hErE1qE0VEG8Q6Lo3EuGrRHJQ3j+SqVTbI6y6cM9AdvO6php6kyHn1JFjMomOIm453LPOajTlFPobgq3+roGbp+M5wIG0@vger.kernel.org
X-Gm-Message-State: APuU4Z8sWtZoud3Ux6MpZjdBoGzouw7FyIu+VY6uhd0qzf0PRzKHxJ91
	BH2rGxVh2QJzFvvMELPtlXHHjVwVojBsfvIqwxVH8Hh/IyfuDZE9FIAY0dl3nbUH8OGfBU3bj2M
	xZD5Hb5K6LVAaQU1RDlmib3S84avuKPW7V/TTN5z6
X-Gm-Gg: AYBFou2NoVyHeq7WNTMjiaQqIHM9wFnV0JhzVqSNucrzBawzhl552hIjhmRtCO48BlO
	gLCls8KcNZv1yQLBMq3jciV2hbnqFQd1BFW2A60bS28Ld72l3Uw1EnszquIKNsd4sI6R4/tL9IA
	mqwgjMEuxQJ32V3Ml07TZstahKfONZ4TXAYPHc+ZbZgenlaqegzPEJHsLPfZNN1Zv0Xmw3SK5SN
	PEDty0EjDj9HaeRj/Qhr73Fq8OWAipN8KUCRfAA1H6ifG55mDrpP2eYI092XhbTCMdfbaADVlIA
	yB6ty1tMARsPbLByzB3z0ak3cz9vfphOV53LjoUphOqLvMkml3ZPp/H2Ni3goXrrV99Zt2fa/Ow
	1OvMYcNkL3CtQE4EBrl3mQj1i/4WbS6vsHoiR4vfqRIaKGxu17L5aVX3u1727fIkYFVXaw7U1H7
	gOKeBkTVKyEggZZpWocQiPyOMSpUE=
X-Received: by 2002:a17:907:d13:b0:c42:6632:a369 with SMTP id
 a640c23a62f3a-c507bc15e35mr21102566b.21.1794421468011; Wed, 11 Nov 2026
 10:24:28 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103161425.1258558-1-vishalc@linux.ibm.com>
 <aurG-frOaM-X-Ay8@gractus.seuss> <CAFLszTjTvXBSThF0VjC7Lq8gP+XfoGk_D_Z2GTW9Fmxggn3CEg@mail.gmail.com>
 <avPXjuf-q_bukDZc@gractus.seuss>
In-Reply-To: <avPXjuf-q_bukDZc@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2026 18:24:15 +0000
X-Gm-Features: AclHuK8ue5XoKWPCU1NNCLJrMGk8t6VoKGaWGO6r8BEzaXwW30m_8p6Vri2-GoU
Message-ID: <CAFLszThK3dnGdb42Qh6J3A9s96FWgx6kdTk-NkRd5GqPKr_8mw@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Add fdt_add_subnode_tail()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Vishal Chourasia <vishalc@linux.ibm.com>, devicetree-compiler@vger.kernel.org, 
	sourabhjain@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 10 Nov 2026 at 19:50, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> On Wed, Nov 04, 2026 at 05:50:45PM +0000, Simon Glass wrote:
> > Hi,
> >
> > On Tue, 3 Nov 2026 at 22:55, David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> > >
> > > On Tue, Nov 03, 2026 at 09:44:25PM +0530, Vishal Chourasia wrote:
> > > > fdt_add_subnode() always inserts the new node as the first child of=
 its
> > > > parent, after the parent's properties. Code that builds a list of n=
odes
> > > > by adding them one at a time therefore ends up with the nodes in re=
verse
> > > > order. That matters when the order is significant, e.g. when a blob=
 is
> > > > rebuilt from a live tree.
> > > >
> > > > Add fdt_add_subnode_tail() and fdt_add_subnode_namelen_tail(), whic=
h
> > > > insert the new node right before the closing tag of the parent, so =
that
> > > > nodes added in sequence keep that sequence. Like fdt_add_subnode(),=
 they
> > > > use fdt_splice_struct_() and so leave the blob unmodified if there =
is
> > > > not enough room.
> > > >
> > > > Also add an Fdt.add_subnode_tail() method to pylibfdt.
> > > >
> > > > Add tests for both: a C testcase covering ordering, parents with an=
d
> > > > without existing children, the root node, duplicate names and runni=
ng
> > > > out of space, and a short pylibfdt test of the wrapper.
> > > >
> > > > Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> > >
> > > I'd need a stronger and more specific rationale to consider applying
> > > this.  In general node order should not matter to consumers of the
> > > device tree, which is why we make no attempt to preserve it the
> > > fdt_rw.c interface,
> >
> > Yes 'when a blob is rebuilt from a live tree' needs more detail. What
> > is the use case that drove this?
> >
> > The spec doesn=E2=80=99t say that sibling order is significant, but it =
doesn=E2=80=99t
> > say that it isn=E2=80=99t either. It only requires properties to come b=
efore
> > subnodes.
>
> I guess not, because the modern(ish) spec is specifically describing
> the flattened format, which necessarily has some sort of order.
> Non-significance of the order might be implied by compatibility of the
> device tree contents with IEEE 1275.  In IEEE 1275 the tree is not
> flattened (access is via Forth firmware methods), and I don't think it
> precludes an implementation which uses a hash table to store
> properties and subnodes.

Right. We are only really talking about libfdt here, i.e. what it
happens to implement. I believe this is a case to be made for keeping
the current behaviour. But in any case perhaps we should document
libfdt's intended node-ordering semantics, separate from its actual
behaviour. For example we could say that when adding a node, libfdt
may put it in any order, not necessarily at the start or end.

I actually like the way it works now, but perhaps I've just got used to it.

>
> > rom my side, one use for this new function could be with Binman[1]
> > which builds firmware images. The nodes describe the ordering of
> > binaries within the image - example at [2].
>
> I would strongly advise you not to design something which relies on
> property or node order within the fdt format.

Another option would be to add a sequence numbers as a property to
each node. Depending on where this goes I can update Binman.

>
> > Binman knows the current libfdt behaviour and is careful about
> > ordering when it is generating nodes / processing templates.
> >
> > Specifically, the code at [3] (a Python interface on pylibfdt which I
> > am looking forward to replacing with Doug's one) has to add nodes in
> > reverse order and then rotate its own node list to match what libfdt
> > produced. Inserting a node anywhere but first means deleting all its
> > siblings and recreating them ([4]), and template expansion in binman
> > ([5], called from [6]) has to walk its sources backwards.
> >
> > An fdt_add_subnode_tail() would let this code add nodes in the natural
> > order, without the reversals or the delete-and-re-add step.

Regards,
Simon

> >
> > [1] https://github.com/deinde-dev/binman
> > [2] https://binman.readthedocs.io/en/latest/binman.html#a-first-image
> > [3] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6c=
b90b3e067ee61/dtoc/fdt.py#L684-L696
> > [4] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6c=
b90b3e067ee61/dtoc/fdt.py#L577-L597
> > [5] https://github.com/deinde-dev/dtoc/blob/1e8b69d7e95970f7c226d1a4d6c=
b90b3e067ee61/dtoc/fdt.py#L735-L786
> > [6] https://github.com/deinde-dev/binman/blob/7a9cfb456ddeaba09f0cefc3d=
fd6c801978c6509/binman/control.py#L498-L523
> >
