Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793264785;
	b=gVB202nzjK2urqh3zYpN2mQ0FuDTzq4s3TbAsB7v9CyzD2BOZeZ+eottcsn1aelhQp8n
	 Clr6e3nGwOumh2m9aPTAQJgsyAXN1T4W04qk7gjMKCPx6N6wTk8YUVofQeUO6r7/hjzeG
	 PVGVHy19elZPnJ8K8K9DaxnWZHfCmDel41BGXXv/QZIyaRxX1N43JUNk4HmOcSiKBVAhY
	 2YlyvxzIj/QTJ/lGNWvoE7DujbHOnYrtxq9ki/jSa9Kc+5lD1WOCwlDfMmQ21fzt5czqX
	 f130erALJiFjuBWJywh8j6ygbkC0scR91+TT0/g1xkqOp0O/VpmKU2WpkceSQzSBpyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=HWfox3gCecUC2wnwqrdlI5tIjNvgwJJ1vyEv6ZY0V+4=;
	b=gUytzWSg9tKEdl4MLgj4fsC9B0xechkBLARoY8pzR34jvJzfOGpm3kZE88QP5UvdGVFq
	 xk+QG/g1euC1ei+7gq/8zRs14jy6rz3p7gXfpNLiOyHTgIKo3gaL43kylPxhy5bXgVcwb
	 qISFlWJIOD2ATqt2L63SxcarJY1iCc0PrMPNYkBdq9c5thsnVAuw5tAPJbeUzX4K2pMyn
	 i8La/pOTnAAYE5ZmtGS+guNAVYoJYzIqX0Wl98DeydjLT+QKyMtCPuf2UJ97vFZJrdZeW
	 67Rn36LD82HU9xlJJ9Y3rYrDAHMV2LQ0iX0+ZQ7DP0ckGJAPlyynoPH7vOmn1HSCHDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lGLXGRNY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73436606A31D
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73436606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lGLXGRNY
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b40fc523faso2279627a12.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793264784; cv=none;
        d=google.com; s=arc-20260327;
        b=iuTsAyyiocVnGX8i72cvdO7eqwN8V6wdOXQj+kbrCY80XzeurGbxXBOGk3kiEV9LEn
         Oev7ism8FRG4zR5+KwPss4wFHW61j0/mJNlRwn1bq0PxnM6UQbXAt3tM1JvHyus2yn+a
         TO/Z0t0PZjwtEHLTGbG+L3zp18dRzDp/ILtccFIl2lJMo7cnvNGBTErdwwrIsqGkRM5q
         vrJ44n1T+m0F9+GOcOccstjzL/giiEkcrL0mLlKT2khMxgs9ruaHBMU9p71zr9ZhsF8D
         /z/OFcbh3UR0zdqSeqmerBcvta23zfxaCUh4Fl1zMuzlv3YFMPdDkoRk9X5HtNLbrqo1
         VTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HWfox3gCecUC2wnwqrdlI5tIjNvgwJJ1vyEv6ZY0V+4=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=kqnGTzffkLNt94IjJ5yKgKnR85UOurFGBfwY5VDKhmgRcaMjUte5MfRU2cWR+bBErF
         Q17tz0Lz6QDjc14+46Ag2d2Hvgk9wvD9MTqI/MehzKAvQ7UlnsztpdEq0tUQ5H4dheSS
         38YoAMcKnkgAMEgeoXFbZuiHDFqsa0K9WFsYrBaZj6sOJ3GQDemqmxuguwcms/6Vbr63
         lbzRcqRtgNkVpS7g863QhTDsTv7CE/7D3fkEiB8bcCNEgyZOM4moMQRfBhfFRXM+e8Wf
         Z55jx3PnuI3+5kYjLUpRjYle37zyOBwkQuclXPLiPFaDi9aLX8c0kvQppp9oKDRcvwKg
         kRJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793264784; x=1793869584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWfox3gCecUC2wnwqrdlI5tIjNvgwJJ1vyEv6ZY0V+4=;
        b=lGLXGRNYPsQ3bArlfDyrx+ZRWycK0EfnTwBb7/7EKzbEtwraU7Ro4vIzH7Ef6+7wNL
         zJ+LM/xMJ/ICp9RJoIRnNGRzFF+1Ja+KFNvNNBPqHl0fmD/KSb9C2qrzvkZIUMMwyWDR
         3gWfAPFDcHpkt6E/WcOj1YS9an4aCXzrdJjKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264784; x=1793869584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HWfox3gCecUC2wnwqrdlI5tIjNvgwJJ1vyEv6ZY0V+4=;
        b=UVZZw3ON3K226sc7LG4NjM/IYS3psLLhGgejXoO/jjPZxeCFkkh5i3aajjVF/EMyQy
         /M3CXo7p2fyCLv28GYzgUuAYLJGwS8EoZI0T9cY2E5FixQDVENiR/HrYqRg0jRAmdka+
         QWsUyUyrGui7e3dq5x+lw5VOILaSvxUBTe3hr4wGsYlIMcRS4VK9WuhZbCEFq1XcSZNz
         csDlR5teBo/F4ac4QchOCrRKHbYs//9zjai6hwE1hycn3Z9iuOmGWQd4FnJhOd7hWIbo
         k+yRXNxdvTbqcaKPZdmOSTWaxbYYz9OOF0ss0v0B04NdNhEcNT8ISCueQAMUNRFzch/D
         A1Cw==
X-Gm-Message-State: AFq9FYKvMJ4HDf22FqmxCt0Enw4l5TmzBtb+CEjsf65PFyIxPJesauQD
	OFFfn+CvbqQkS58rkYuSkSkeEVWl1kZBG72Q8K8VkdE4qp6doLhNyhiFQNf4+VLB83MlzpiPyL5
	NjvDBBOfac5CnQuzvkZVLB6UQciUlFeoHsN0VYsdO
X-Gm-Gg: AYBFou2yi7dIpTkTU0l/p4PPo0dekAyvoSrbcrP2EvEnEegwT1C3gvmJG/DKD7m4hVu
	BGhC//W6XLRiZ3dr0x161DUopbB3Da+R/1Z31M+mw6r84zTEulrI8OtBAJeRSqDVJV2frAcmewx
	YQeiPw8eAPNV1Q4XQl38vpaAWVAeH5X29JaLAhhcsJMFi2Rj0ds5bQTmjaI2GZXd696xkurC2RE
	4TKaSNea6dAl7w3FeAdmxffFhPIU+iHj3+dTLwe4LOHpWVraXzXrhglfHO5pUeTUeGHIO+f3OQR
	Q+eng+zMiceQk6lVRZb/GlqBl4YdULBkXlLh6G2HJ4F3vqZB9/6ta+XUmBLYzunk0gFlXr8ls6r
	zDgRQg09WXnyhxLxjBWxzfhTw2UKfg2cASZIZgh1MXNlBpDyKG1NOYc6ZibabdpT4cEg0htE=
X-Received: by 2002:a05:6402:528e:b0:6ac:b861:dab3 with SMTP id
 4fb4d7f45d1cf-6b4b17b1bdbmr1269291a12.39.1793264783722; Thu, 29 Oct 2026
 02:06:23 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028093620.3705074-1-sjg@chromium.org> <20261028093620.3705074-7-sjg@chromium.org>
 <20261028192518.534ab384@bootlin.com>
In-Reply-To: <20261028192518.534ab384@bootlin.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Oct 2026 09:06:11 +0000
X-Gm-Features: AclHuK8ylTnmKlH5i9SHz_7Tn8FtX1iPGuDED3sZkVtvxO02QpdhEbkNQpN6lQY
Message-ID: <CAFLszTgWsXVqF+VOMii7zguXbfjEYb3h_-uDt6RscXqdLfW9pw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] doc: dts-format: Describe later definitions and deletes
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Herve,

On Wed, 28 Oct 2026 at 18:25, Herve Codina <herve.codina@bootlin.com> wrote:
>
> On Wed, 28 Oct 2026 03:36:13 -0600
> Simon Glass <sjg@chromium.org> wrote:
>
> > dts-format.txt does not say that a node can be defined more than once,
> > nor describe /delete-property/ and /delete-node/, so the rules for
> > deletes in the earlier patches are not written down anywhere.
> >
> > Add a section on how later definitions are merged and how deletes
> > behave: within a definition, before a node or property is defined
> > again, and in an overlay.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Add new patch to document deletes
> >
> >  Documentation/dts-format.txt | 44 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
> > index 41741df..d594822 100644
> > --- a/Documentation/dts-format.txt
> > +++ b/Documentation/dts-format.txt
> > @@ -116,6 +116,50 @@ Version 1 DTS files have the overall layout:
> >  * C style (/* ... */) and C++ style (// ...) comments are supported.
> >
> >
> > +Later definitions and deletes
> > +-----------------------------
> > +
> > +A node may be defined more than once, for example in an included file
> > +and again in the file which includes it. A later definition refers to
> > +the node by '&' followed by its label or full path in braces, or
> > +repeats the path from the root. The definitions are merged in source
> > +order: a property which is defined again takes the new value, and new
> > +properties and child nodes are added.
> > +
> > +     e.g. / {
> > +             serial: serial@1000 {
> > +                     status = "disabled";
> > +                     clock-frequency = <100000000>;
> > +             };
> > +          };
> > +
> > +          &serial {
> > +             status = "okay";
> > +             /delete-property/ clock-frequency;
> > +          };
> > +
> > +Within a node definition, a property or child node can be removed with:
> > +     /delete-property/ property-name;
> > +     /delete-node/ node-name;
> > +and outside any node, a node can be removed with:
> > +     /delete-node/ &label;
> > +
> > +* A delete removes the property or node as defined so far, including
> > +  earlier in the same node definition, but not one defined after it.
> > +  Outside an overlay, a delete within a node definition with nothing to
> > +  remove is ignored.
> > +
> > +* A property or node which is deleted and then defined again comes
> > +  after the existing ones, like any new property or node. A node defined
> > +  again has only the properties and child nodes of its new definition.
> > +
> > +* In an overlay (a file with /plugin/), a delete can only remove
> > +  something defined earlier in the same fragment, i.e. the same
> > +  &label { ... } or &{/path} { ... }. An overlay cannot delete anything
> > +  from the tree it is applied to, so dtc reports an error for a delete
> > +  with nothing to remove in its fragment.
> > +
> > +
>
> Not so sure:
> --- 8< ---
> /plugin/
>
> &target1 {
>         node: node1 {
>                 ...
>         };
> };
>
> /delete-node/ &node;  <--- It is not defined in the *same* fragment
> --- 8< ---
>
> Agree that an overlay cannot delete something in the tree it is applied to.
> But /delete-node/ can be outside any fragments and delete something in a
> fragment.

Er yes, the wording is wrong: a delete can remove something from
another fragment of the same overlay (see my reply on patch 5). For v3
I'm just going to cover general rules and we can revisit this later
after the refactor.

Regards,
Simon
