Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793264695;
	b=ICitsQ8WvtKnuuN04MlaPaUDnplOQ/M4aVyBQLjNTz3YOuWAwu901I68CT7Ommt0Uw1P
	 d3kwqoX8u0i8RiF3EIP9hhmkcgG3MG1XyOA4t1IyYVaR8r/tvsKPvHuFI3oakgFOd0Neo
	 K5E6RE37lxM9tGOf4Uwd+WPPv6bbr9cXwLTslIG/Lj03Igw92so0+b7cbk7TNmt3te4WK
	 pjK34UyMppqRyfYI5VR2AeSJTc1FKuu0HwMnAOnLKWNkU4AteG8R5jx8GF0A/eX52nuM3
	 9V1REpvw6K4fQRIeTnx2ncKdiamKUffje6MS3DjZxsDQ8eqSTKcDTco0fkDl3Vmj+yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ZgvS+cH77H8YqVuWsyL1T9bl7xlQ9inVhsYoHL1ci/E=;
	b=NeFCUi1D1OX1X6QAyJlO/msWBwLsPdVfl0mpPnSN5b2GydcerWiB6RNEdMuBohIyitf2
	 GmKY+VuWuGBczu/jf/IfBMFO36MPF22z+xmiGjSrYBZFaHYJsxt2z1fxxweFeTFhOZlAu
	 19MvCbkDuPru2DAuQlN+p5ftUvVykAy8qkWlaoqLgKeKOnA6jFDXaTE2PUSPdBmdbo+4X
	 5AK3ypaBoYGp/kDdYWvR18L5msks7lof5KtMxPQ73rs4UoNSGligjRqvTHqxA6jjfDKD8
	 R90nKWGyhEMID0PU5kxZdSIrWfcMoXlA11mB2iKju5Tmmok+fmGK8yucEY9wcIpoIeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TWswOVal;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F5606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A2F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TWswOVal
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2613946a12.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793264693; cv=none;
        d=google.com; s=arc-20260327;
        b=PYdgZqbMC5pcO7DwaOnwXDMD0PwYGaLHjHuHLlLJmRpMJbf8EUui9GxLHDg52/nx49
         8T86uTosFl96QSn7UP01FSChvKV06s0dcPm0VoygDIC7nKJIt/2Hp/ax9vDB6vGngzAN
         A/er1vdUz7j8GrK/2Fjy5gzPQ7IzaBvj3XWKM0SkCvX7JU0ucXKqCS4FZrPtzWoFiUek
         Ud85a9jKn3P7n+g3PEBpYXGsqHb2j8fJQZV4Go9HoXwlu6+rCljozAOX5ZpHhpxoLx34
         rgbBpTny3fywG5zp9nDgRwSdO93w+s3B7tuRNAQYjsGYKVusTZEh5j8joHuoOx3of3jf
         a3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZgvS+cH77H8YqVuWsyL1T9bl7xlQ9inVhsYoHL1ci/E=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=OQeje3qO2tgtVwdphV8RpGj65JsO3iIy4A8mJ6PFE5fXLV88B2e2s2QP3MYFAnQPhB
         GNGtdbZrbVDc1DPcZYa+i54kgaVbH0kCRisQL0xnBGdgRPfJoDxLE/rWHz4YB7309/RU
         UVOqclRxc6ANY02uZkNxLgH85Fzhg8vjetiPkrm4WoBdFXhJXOXvyCtn5FE1Qjt4reRq
         eY+xU2sHdwHcmSZk4p+sXrr8rGGnLwfOCMZL1wK2yO3cvUzELchzFDSIIBmbM/uoEilo
         VypOYzgNglyNmVCworOmRXQ6+8Mj6tAmojaLwDhjMTUeCj53c0YAyZeG+lcHMliZAp6s
         nptA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793264693; x=1793869493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgvS+cH77H8YqVuWsyL1T9bl7xlQ9inVhsYoHL1ci/E=;
        b=TWswOVal2GTniuQQ27vPhWfM1+evv6vFMFrnGhh7mkqREjWD0gnfyVb4ShifUHSIBq
         1xCAmOwjVC/RDovIsTbNwxpDOP749FIKrNZbZon2Z57LQOXYHwtA1+/U4gizKkxb7O6X
         /0MLQ06NEBluFQVTO4q963FLYSaxjQp6U7lBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264693; x=1793869493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgvS+cH77H8YqVuWsyL1T9bl7xlQ9inVhsYoHL1ci/E=;
        b=ZTReZEZIKzX7ZeJjxQG87Bwe0h10V4rIibXStSIGYUXB77+WWsEAGJ7ts+zB9swduu
         jyItUo+4OCMCWOpjy0aCXWvkdqbrqz3/r8A15QsEN5yg/cyzKyuXMGZW51OJ9imAPHHl
         qKcpCW7UdiSC9eW26JB3qRrCiK6f6OPO2q0l+oB3NK1nqO9dOagDuHoXFd13NnDAQTQV
         iip/WFHBrRCHyL9SN8yxHp/jCCUBCX++h9jM0sgj+4sf+TrrX4RSygykl1mtadpJkBnk
         27Vl1HumTUflXaYRU3rufeZkq+dEha0mpHyABbgqRKHw273EVT8BZOdQi+XP4stGk2Wt
         YO/w==
X-Gm-Message-State: AFq9FYI/A4i/iLfVJF3fC+2QuvB0FmlcVLQz/wwOt36HWIVwVlgvXkgS
	uH/jRTJ3EfO4I4Ern2900TWXmpLATlGouUviA1WjXURejSIE0lF7+yq/d+4frShLb0+AzH192lg
	LiGycEq/6wUXEujj2CIbEJYObhoXddpEKb4eNTBVy
X-Gm-Gg: AYBFou2vgDICuAkgdAzuBS2dzaonOfD2Hz/1QKsaV8v9ny1xPZARHdwKVDMfFTx0vfb
	dJlt0ot6H8mQa1xKj59zeuufer0dM+cc8CdEtVVFtxetL//awnGhn2rgbODSLZb7KOuh9v8Qzx+
	fAzMWGCXrq/iM83VDPUuKO193YcmmBxMjDhofxPQ9LjOBo5kfYOiY/0CJiEVnjRE3KJrkpvbBqU
	MzsxGUPFIhz2FW1R08nECQDTK+sOjhY53+uie6jimk3/SnMDL8QSTi0sh/dNil9NxQFwAwYSQ26
	7Gss5N+qK4MgO3d09WcINgve/iBjmzuiFUG81zUICeu4rFeX4fqRnkE4WDTMyUc4Dd+e4gkyxkx
	6l+qZMHzrXyCxSV7B1UKxkBRu/iDQs8lA6gvgfRQSvCUGHNVTT4CXxrnfXafJf8xbXRdyDS5p
X-Received: by 2002:aa7:d48d:0:b0:6b2:4dc:8348 with SMTP id
 4fb4d7f45d1cf-6b49cbceb09mr2506955a12.15.1793264693450; Thu, 29 Oct 2026
 02:04:53 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028093620.3705074-1-sjg@chromium.org> <20261028093620.3705074-6-sjg@chromium.org>
 <20261028191709.0a304dd8@bootlin.com>
In-Reply-To: <20261028191709.0a304dd8@bootlin.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Oct 2026 09:04:41 +0000
X-Gm-Features: AclHuK_emheI4EL4XByJ4vt0AibOjKDyBQWVHyhZO4Ww-7gayOFfURPoYXUJClE
Message-ID: <CAFLszTjMdK1PfBAcQ0Lz-oxLCxxVntKBsaNPXZ31A2_9sNHGPg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dtc: Report an error for a delete in an overlay fragment
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Herve,

On Wed, 28 Oct 2026 at 18:17, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Hi Simon,
>
> On Wed, 28 Oct 2026 03:36:12 -0600
> Simon Glass <sjg@chromium.org> wrote:
>
> > An overlay cannot encode a /delete-property/ or /delete-node/, since
> > applying an overlay only adds or updates nodes and properties. So a
> > delete in an overlay fragment has no effect on the base tree, yet dtc
> > drops it without complaint, which suggests that it works. A delete which
> > removes something earlier in the same fragment is fine, since the
> > fragment is compiled without it.
> >
> > Report an error for a /delete-property/ or /delete-node/ in a fragment
> > which does not delete anything within the fragment, naming it. Record in
> > apply_deletes() which placeholders delete something, and add
> > find_unapplied_delete() to look for one which does not. Do this for each
> > of the three ways in which a plugin creates a fragment.
> >
> > Drop the deletes with nothing to delete from the overlay test, and add
> > tests which check for the error, one for each way of creating a
> > fragment.
> >
> > Note: This breaks the build of two overlays in Linux v7.3-rc7, whose
> > deletes have never taken effect:
> >
> >    imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> >    imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
> >
> > Linux needs to remove these deletes. Where the result matters, the base
> > dts must change instead, e.g. by moving the property or node to the
> > boards which need it, so that the overlay only adds to the tree.
> >
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
>
> /delete-node/ &label;
>
> We can probably delete a node defined in the overlay but in an other
> fragment.
>
> Is than handled ?

Yes - I tried this with a plugin containing:

&target1 {
   node: node1 {
      prop = <1>;
   };
   keep {
   };
};

/delete-node/ &node;

With both master and my series, node1 is removed from fragment@0 and
there is no error. A top-level /delete-node/ &label is not inside a
fragment, so the new check does not see it. The same goes for &node {
/delete-property/ prop; } since dtc merges that into the overlay's own
node1 rather than making a new fragment.

As mentioned before I'm dropping all of this for v3, but the case
needs to keep working when the overlay error comes back, so let's keep
it in mind.

Regards,
Simon
