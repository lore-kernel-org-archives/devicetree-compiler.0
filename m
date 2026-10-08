Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8673DD50B
	for <devicetree-compiler@vger.kernel.org>; Thu,  8 Oct 2026 12:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461762; cv=pass; b=sfb7yS+bc4cSl8psTTukmLm6XSBDo0cWbJ7Q2bd5X703AS/c16gS8UI0BerXUvUS/4+1fGjlb6AsF6jTGi402uQiDaYrap+/iDOuODMM9OD7T1FMp3mBsU4H8Iim9mfVRBSG4jI3NdKQoSi21FNfLA/KgLTJ7gr/7yRw0B7CPnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461762; c=relaxed/simple;
	bh=lRYuR2vhnh42uoikxf+XXQ8fkohiTbhmuKQzmc+0MQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUNWioxLY6DZLNVQIlMrcijSRufqIVRIxTHkHYmkyn3UoqIWPMFufPNq1fQsTTxMV2tCK58nGqKXucj5KwYGef7rrM4u1UicpbxxZlqZPvXSNz6cC1SRf3DM2AysLtALYsR1bBvfcaZevUzjq9pQvMzrKY+CBMzMKhwGb+i1XSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V8Kv5MIu; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V8Kv5MIu"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso5405831a12.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 08 Oct 2026 05:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791461759; cv=none;
        d=google.com; s=arc-20260327;
        b=jUZzbtQPV7S8XTvV4L00H4QVHRPWNKWJWvt9K8G9nFWS7z4y+WixmHVklejZkhd+vy
         Syw2cyAyAI6RALjg3rcVMGgBIvlUsh++s04p0ifOjq5PHrNG2FdYdrXiKj8irbWoHb9s
         MuRq1xFJa5pqaSZzefDruHAfe34+zriSX0t0WdmNSD44sDEkLY45/yEoyaWeQCXlPIES
         OUyBqZ1A/JqJAE0j87PLWE+VxOcs3loH2xKL3xSUhFYS5X200FRzMdoAWsZCLRpq9nX1
         a+yeYuFuou6H0AfJHrrp2cXHy0u9GWGE/goW/LO7hAkOM0FQFGwaBSFT3AFL8D+klEEx
         adIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FllsDz/3Ao8wZkWD4alZj/YGedrZnqZV0Setz/bc1B8=;
        fh=Vuxu9ZDXZgZfy28QgvIfhAdTbmK2Ytt4QDEBHfMr038=;
        b=ZQNqwoQVK4jr3yNJSpVnuPXU81iQV6Db+73s8EiHBM7UTFSUoO0spcQb4Vv1duGjD8
         xQmPk7sDG1s+zk/uHm+1vRhFMq+HKhoQNaQH/RWmzfvZYTqXbmd8Gq6Jc+X0BFpWrFGU
         2TFeIeAtMM/pJp2wlPmYsj+KhFs+nlQMxJyEYt72LsLWLit8t+pbI2NVMB3RK4bRX0ij
         +3DOyGyZkC/gh8DPDUwq8SbXl8swVD7UxdtbvyboUMxrZja82FV1WPBXnFC2NGZ8RB4l
         xoXeoO/Nl3o81rNwSivAclYh++dAdO4afZe9CObuHIAc1kN2M+Qvkt2U72/EYjHJvZdF
         2/rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791461759; x=1792066559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FllsDz/3Ao8wZkWD4alZj/YGedrZnqZV0Setz/bc1B8=;
        b=V8Kv5MIuMNT+dwaoXUkAgbroq+bfV0RCSa7QnKrPrJeceSFxTjU+J/xlrDWK7C6adf
         /lnP79H+HuMsNoe8/n/G449Cx2e53WExZNz1dd5wpqFxsFzi3O38KdxckrxASh+CKher
         sD5lLotJpf3UKuYzvkAR2v/2Eh7XQpBFTDGU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791461759; x=1792066559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FllsDz/3Ao8wZkWD4alZj/YGedrZnqZV0Setz/bc1B8=;
        b=a0TJ3hoAKJ01eAMgeJ2omZCWfrdNGs2VYwGbFs/RxlwKzeLpGXJgAHdG9YEhYvChrE
         NhrqHYCqEDhX05Tqk58TpkglXVit1EgU70i76rniMq6kjUZqkziwYR4yum+rnoSEZi3d
         OrC/Lv0CzQHmXD1/mCud8aTL5ey2Z7DQoKFd5EQ9FKdyjhwTp0nQbzqsBbVx7x0sJeYn
         mKIrE/Q0wqX4uJjVQXUSkNU2Qu+2yzZyCEvl2qZxWXwdUbyor8VvAVZRsdvpiy4nrxvr
         Or+lYBnwfau1h0NWaHdlqAWpGtTdzvBro5FHoRnHz+HVLlgi1jXF1XifyfeHROEAnagW
         2G6Q==
X-Forwarded-Encrypted: i=1; AKwUvBym852Qs6HTT6C3ROvMvJ95YofTG/C61bNuTbYO/zkmk3nmeG7ntRqt5VZVVIPGwbdD34oofmMtl4WyzmsXeEsS9wjb@vger.kernel.org
X-Gm-Message-State: AFq9FYLDb7aVk4yES/ky8C5nbsaoJvlsU1xIMFIjDEbSdMNDpqmS3/Cc
	7BGMRoIsgnpjGiFpW/Xgy9kd3dFpbEEcv+to6Ro7plAeQwukNTBCMf0Vlc32ZJ5XIaPALBVCXuI
	JU+CY6Z5VwdUmzJgsm5SqXcRQJS6tJxC9P0snJCiP
X-Gm-Gg: AYBFou1Cr3PGmK8yXgcDXqkXV/td/Q5nLVV/R/VQJvmtntxbOCoevy4XwotB6+q5g3b
	qI0LYjxwS42EWXAvHQGZSIgtsY5q0SFwRiVChfzAwjq1Ozz4xEIvdfN3ZoKw7toVllTZi0iBlJz
	PWxOwNfivRsQWkyAaTY5i3ftNrVxQgAL0DRNlIWrCt/zdYYQzxV0Kj/8IMAd1JDM7ZYL91/eAk2
	rcaAd0ThIRKoU114kh/gDiN3UcJcc2Qgvq9AZf2qJueOU1wzijlEOXeIuTw+m/HnqWjBbrvweln
	rGOe2dbe6qSLzRKR+MMi+Gttvzb5rAGM27ewGadPvWXmJFvqWC6cemNj
X-Received: by 2002:a05:6402:46c4:b0:6ac:ae52:8b75 with SMTP id
 4fb4d7f45d1cf-6aff47cc7d1mr4248561a12.44.1791461759302; Thu, 08 Oct 2026
 05:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001121036.2910243-1-ayan.kumar.halder@amd.com> <asRkJHpQ_gbAgC1t@gractus.seuss>
In-Reply-To: <asRkJHpQ_gbAgC1t@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 8 Oct 2026 13:15:44 +0100
X-Gm-Features: AclHuK9hbkcll-uCdC2vILvi44sGf_M6eTGgp0vof3jY201u_f1eZZRwa1Qn2sw
Message-ID: <CAFLszTgkLjcNNYB+0sUAnpWK5n3tP5ZPUQB3-oF9Z8jB3YRi5w@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 6 Oct 2026 at 04:01, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Thu, Oct 01, 2026 at 01:10:36PM +0100, Ayan Kumar Halder wrote:
> > fdt_get_path() walks the tree from the root, appending each node's name
> > to the caller's buffer as it goes down and removing the last component
> > again as it comes back up.  It keeps the number of components currently
> > in the buffer in pdepth, and removes components while pdepth is greater
> > than the depth reported by fdt_next_node().
> >
> > fdt_next_node() reports that it has left the tree by taking the depth
> > negative, but the offset it returns at that point is the offset of the
> > end tag, which is not negative.  The loop only tests the offset, so for a
> > nodeoffset at or past the end tag it runs one more time with a negative
> > depth.  pdepth still counts the components in the buffer, so the removal
> > loop is asked to remove more components than are there: it takes the
> > index down to zero and carries on scanning backwards for a '/' that is
> > not in the buffer.
> >
> > Stop the walk when the depth shows it has left the tree.  Offsets that
> > far along are rejected by the error paths below in any case, so this
> > does not change what callers see.
> >
> > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> I think this is a bug in fdt_next_node() rather than in
> fdt_get_path().  It should not be returning offsets that are not valid
> node offsets (excepting negative error codes, of course).

The bug is only with an invalid nodeoffset past the root's FDT_END_NODE

I don't think fdt_next_node() should change - fdt_node_end_offset_()
relies on it returning the offset after the FDT_END_NODE when depth
goes negative, and fdt_nop_node() and fdt_del_node() use that. For the
last child of a node, that offset is the parent's FDT_END_NODE, so it
is not a node offset.

One option would be to reject nodeoffset up front with fdt_check_node_offset_()

For the commit message, as you mention, use 'FDT_END_NODE' rather than
'end tag' and make it clear this needs a bad nodeoffset - also try to
explain the problem in the first paragraph.

Also please add a bad-offset case to tests/get_path.c

Regards,
Simon

>
> > ---
> >  libfdt/fdt_ro.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index 11f2e2e..32689c7 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -582,7 +582,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
> >               return -FDT_ERR_NOSPACE;
> >
> >       for (offset = 0, depth = 0;
> > -          (offset >= 0) && (offset <= nodeoffset);
> > +          (offset >= 0) && (depth >= 0) && (offset <= nodeoffset);
> >            offset = fdt_next_node(fdt, offset, &depth)) {
> >               while (pdepth > depth) {
> >                       do {
> > --
> > 2.25.1
> >
> >

[..]

Regards,
SImon
