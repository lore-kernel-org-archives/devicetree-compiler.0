Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1010B39B48E
	for <devicetree-compiler@vger.kernel.org>; Thu, 15 Jan 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492476; cv=none; b=NjlMJhCGA7ZyAiET4Bpyu3I+sI4+FY6+V2YKmvqevGJrh8rF0GwYlcM/KtF2QENq1aOMWBSiwLZYTRtvNIBEoQqjZahvwDoSln2u6yu7YnfaaFXvoJZiDCUsmVhQcWj/1ZyQCUfyzXj2yNOSwH1bOoO01W6bSEtM4Jy170vHB+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492476; c=relaxed/simple;
	bh=dKCRi1EFVnoZ8wrCnpXxN/bjQgwl/QGrd9KTBQZB1lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CizfTpGsIMUfFKhSpeB5uRtXpgwKgxtKnjOJ5V7xLsd6vRKnO9n3+KQUT0jayP9WvrT0HeQm0uZHyEvTNlaAo0y3hIzkmuAlJPR1MTbCLKXYbbjdOv4+DdOPwBX9uJDAMwbB2oj8tW6tqVKys6xZJT5IqCsXUPCGQh0c7R/9aGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Juu3Teif; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Juu3Teif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12B5C116D0
	for <devicetree-compiler@vger.kernel.org>; Thu, 15 Jan 2026 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768492475;
	bh=dKCRi1EFVnoZ8wrCnpXxN/bjQgwl/QGrd9KTBQZB1lY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Juu3Teifq+ANYIh9VPm99WpcGgNe5Hj5r9Ac9OEgv1EmhWmcEiiFUGJEZ0CF45AYq
	 X0oPPMIqq1XCkzqrtbCm6OJ50+CBkgtn4HFtH6MfyGEavQRm12rcWV24R9svzG7jTn
	 atsCytX+rYJRC+M0FbzHRb6v/gsGyo6yyGzRplBEE9MkO8hg6Bw1J48F9UPguxAZtj
	 r2OfFq9UdSwwl5Ba9rB2sReFM4pMbQ/3HvEEsETlZQ9RDHwseAwCkpg5Ke+ucmoCn4
	 HicxOKX5Q7Knmuyn/2GEgU+rKOQltRurwKgUcSvdHMGwzL4c+Ce+eypK0Bp5De6YeG
	 jy4S887k1sx+g==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b87124c6295so168130866b.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 15 Jan 2026 07:54:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVR+syObK5aT2t/D4EGPVsAjiHfMw1+JldzkiuM5au2x4AwYIudKdNof57ZJ9Dff9iAn4vXNByOy/wGA0843uu53Rtv@vger.kernel.org
X-Gm-Message-State: AOJu0YyNmL6SpODnioNeXK3CWVHaheBfJuT+8mgOcn020qf8KBSLptKy
	whG3W9LItcz+1CW59TNP0TR5FGtRbG2CXdh7VC4m6rI2o2ucxwFgQcs4g1Pezeq6BYt3Y/LreaC
	kqkK0W9msnCR9jxwPbIlg6Ts6wdv53g==
X-Received: by 2002:a17:907:6d20:b0:b87:1ffc:bfbc with SMTP id
 a640c23a62f3a-b8792e082ccmr7114066b.12.1768492474319; Thu, 15 Jan 2026
 07:54:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-7-herve.codina@bootlin.com> <CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>
 <aWg2JJstA0F-h9hi@zatzit>
In-Reply-To: <aWg2JJstA0F-h9hi@zatzit>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Jan 2026 09:54:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLx-NWM=gFdQfQ1Nw10ii2n5gX93WgH+zTcbHRt=Ze_vA@mail.gmail.com>
X-Gm-Features: AZwV_QhbB9OdA6W3gPyZNM8SQiknAanmIyFSp2NdkrcPTLl8bGT4QVG8rHMzo7Q
Message-ID: <CAL_JsqLx-NWM=gFdQfQ1Nw10ii2n5gX93WgH+zTcbHRt=Ze_vA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/77] Add support for FDT_REF_LOCAL dtb tag
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Herve Codina <herve.codina@bootlin.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 6:51=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Jan 13, 2026 at 01:22:08PM -0600, Rob Herring wrote:
> > On Mon, Jan 12, 2026 at 8:20=E2=80=AFAM Herve Codina <herve.codina@boot=
lin.com> wrote:
> > >
> > > FDT_REF_LOCAL dtb tag is a meta-data tag attached to a property.
> > >
> > > It indicates that the property defined before this tag (FDT_PROP) use=
s a
> > > phandle value and the node related to this phandle value is local (i.=
e.
> > > the node is present in the device-tree blob).
> > >
> > > It is followed by one value:
> > >  - offset (32bit):
> > >      Offset in the property data where the phandle is available.
> > >
> > > Example:
> > >   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x0=
4
> > >   FDT_REF_LOCAL 0x00000004
> > >
> > >   This means that at the offset 4 of the property data, the value
> > >   (0x01020304) is a phandle and the related node is available in the
> > >   dtb.
> > >
> > >   This is what is encoded in the dtb when the related dts has a prope=
rty
> > >   with the value set to <0xcafedeca &foo> with 'foo' a reference to a=
n
> > >   existing node where the phandle value is 0x01020304.
> > >
> > > If several local phandles are used in the property data, several
> > > FDT_REF_LOCAL are present after the FDT_PROP tag. Each of them points
> > > with its offset value to the position of one phandle.
> > >
> > > For instance, if a first property with 8 bytes of data has a phandle
> > > value at offset 4 and a second property with 16 bytes of data has
> > > phandle values at offset 0 and 8, the following tags sequence is
> > > present:
> > >   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
> > >   FDT_REF_LOCAL 0x00000004
> > >   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
> > >   FDT_REF_LOCAL 0x00000000
> > >   FDT_REF_LOCAL 0x00000008
> >
> > To follow up on my desire to both be easily extended and have more
> > type info, I have something like this in mind:
> >
> > FDT_TYPE_INFO 0x10 FDT_REF_LOCAL 0x0 FDT_TYPE_U32 0x4 FDT_REF_LOCAL
> > 0x8 FDT_TYPE_U32 0xc
>
> I think general type info should be out of scope for this:
>  * This series is already enormous and complicated without that

It is enormous, but I don't think the intention was to finalize and
merge it all at once. I certainly don't intend to review it all now.
The final result looks sane to me and with that we have a good idea
what information needs to go in the DTB. I think the first step is to
define the new metadata tags and what DTB format changes are needed.

>  * phandles aren't just another type, they have structural relevance
>    which makes them a special case

Fair enough.

What's similar is we need to define FOO is at offset X just like the
markers within dtc. We can add other types later, I'm just asking that
the design here for new tags and phandles accounts for that.

> Plus, I'm actually pretty dubious about adding type information to
> dtbs in the first place.  It gives the impression that dt property
> values are self-describing, but they're not.  If you want a
> self-describing format, I think you'd be better off dropping the
> OF-related past entirely, and using json or one of the various other
> modern self-describing structure data formats.

json has no concept of integer sizes (and numbers are floats). The
typical work-around for that is encode everything as a string and then
we're pretty much back to everything's a byte array. Pretty sure we've
been thru this already. So I don't know what format we'd use. I've not
come across one. Perhaps just DTS as that does have the type
information. :) In any case, I'm not interested in a revolution, just
evolution. I want a format that transparently works with only an
updated libfdt. Anything else is simply going to go nowhere (as
evident by the last 15 years of new DTB format discussions).

I know you aren't a fan of relying on .dts information for type
information, but that's not the only source anymore. We now have an
entire database of every last property and its type. That could be
what's used to populate type information. Again, we don't have to
define how we do it now, just allow for it (and any other metadata we
have yet to think about) in the DTB format changes.

Rob
