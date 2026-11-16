Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794873187;
	b=5VL4+Yc+OD+DBoYU4nuu3a4N/7nn2OIchqoNlApJpEFNuSZoORZPFFBpNZpT9xD27xYy
	 aHuWkrhkJo/AOi4vorEMJSKA1blGwYpjLSU40rySX1keBDa+6EUjpaEY8OmwdXUNardeI
	 HmtsxRWoeEivwMRqSbOAnugdap7/OFpdeEci8KvLWy2nsuKCko7C/gFIy758RCesB5lxk
	 FeEppaqrkxmSyiYBKwJmkwp3bs0RXClWYq1ABuPV+S1XiDnVTBQA7ArinGntnFEZ1ZWzB
	 gzHWCSmpeYtQdr2UxdFHRkTkbOjDUuWa+pnBfPY+Zo9MZunUcKlSxC3H3KcKB5/Y18Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mpGBSELEfT8HXprb7fjpUp48UziQL5OMC8E41XZzw1s=;
	b=scwVoVKMinJdB9J8kf/t6GK9oaL6b/Jh7aLwlUI0jF2/0AldxUjrzHu4HjOd6FKARd1q
	 Z25GlHPqBSDM3UCRfjUl8VEZoqpMdzxgNmyjBntVs0Rsn+RZZiypXIwxdrA3I9zl4AzbS
	 8y3zv55l3LHr+SG14BSqguYJn4XH2pfCLb6IaA0fBB8Ru+iOHOcveuvTXH0vcs3gKdd4w
	 T1N0yb79l7uAturYSDQy8Xk+GOwVwFyXphiZI/5vgObVdCe8Mr8PX7IzJOPD4f3kmbmLt
	 HnxkqpoTHdHlK8Qrhz+tPMKLb5Q3LL6bh6oGYMf6U/IWUY3RMim38C02YeP6R85PqbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ui4j4gXT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92F6606A31C
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B92F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ui4j4gXT
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50cc7540b7so292407166b.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794873185; cv=none;
        d=google.com; s=arc-20260327;
        b=GXZMypHTeYfKffRQFuEKjt+fx0ksPpFkwdhmZio+gQ4UlO9t6JIrpr6kttuo4/cx6k
         HQNAG/ElMQo/+OrVqS1yLGqUmFHBY9ZBTGPr/xmCadeb5ujWqr+HMk1FhBQJkACOuW7Z
         bQUMHk7tPSyZ7cWKtGTJu4EdJr4X9QNK9sTwVEdGNH0MgltFZAd18AI7mPxJDhGGdvtw
         0k3DJcKoHBqxXk8sZRkiXzVpyveUjZ/FN7Lh8RP9Pvn6CiJnScWDYC2exqhLoHu4VFNt
         pC+t2HN8gyIlnNf718lWSbJPZKb8PSA2WRxw4Ug+X7PE12HR9sVhzxioTQPkB/fhJzOn
         Ro+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpGBSELEfT8HXprb7fjpUp48UziQL5OMC8E41XZzw1s=;
        fh=K0kP5HHRgf6oMmB367/VvZYxYFTtLSFvXWdNv4LV7ow=;
        b=DCGw9hKZlxDA4sjtAnP3a6P9gjc5EzR/ndbXjM4zfQuAByGsb0FOpoiqrj3uywp4lF
         xy3Xr3K0xAXrL/PQZKGtYNRNzsOC2gGj3wFRS5c2EIXjE6Hw0WnEwu5o18ermBlsInJo
         L6hj9PRwxE3ipmOjwV666QTD3RWlUxgg5G/byWx4eY50tSsMwxT75E0s8GW2BUF6i+7S
         i33c8aNu6uFhW+Or51ZhKWDD84K4NFHcCTL8DQaE2of9mh/UZ28F1PvGf63GupluL6/U
         eLTh/qTdpkaoQ1FZlLbhpJ00ZLIs1jugeBI84XvGVUi8NiVFDW9wkX1Sd/5fNWC8R1Gr
         TeJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873185; x=1795477985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpGBSELEfT8HXprb7fjpUp48UziQL5OMC8E41XZzw1s=;
        b=Ui4j4gXTQhpp10KeAJnio+1ya7treCOgpDRnKjgGvgOftT/zQ1wwLy4xDw1S8Y6Gqt
         i66RvpglhEdqGbt4ipY6NpYgEIVwEKcqiejANoGuPukvz5YSPJz+Uf3b9zV0LNG3MSKh
         O+685HAgXSWiF5zBBzy9ZO1bcQCCpXjfsq8AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873185; x=1795477985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpGBSELEfT8HXprb7fjpUp48UziQL5OMC8E41XZzw1s=;
        b=h6TptJTU1V/TaPbH/0E64RMlAsRKO4jvJU+1Btr+gvl6Ltc/fduYQR6kS2lwpAE9tQ
         vg4ogi44zyVZBIviZwPt3d8V4lW8SqD30CGaTG7XkheioJk+8FClYJf0UCSYN/QKTz8J
         ndx5jmK+bfOAJ2A1drJR70PoBSwwn4TpRejo25OQHiOLUTn3UsCM3ca8GV7VqqRKfwHJ
         d7Hl6Kyve56D3C85rg2Dyrg2zIoxcqQh5n/n9G14/cK+L5GlKPAWzKbpyjnNMlX6V8us
         tPLHhgsS84c/avPDjZdxo5CJop5SkVaJK5AgUG+4dWPbZVpFW+OToO9W+5byHeglb4Jn
         R+fg==
X-Forwarded-Encrypted: i=1; AL+hErH/4dP1Fm7RwQtUqBDmx/7RVHFi5LcViZGLb+7NveZrwdngUTzjJL7Afm0ezc4BYdslagIO3r87iS9m6fGJGM/nZ7Z7@vger.kernel.org
X-Gm-Message-State: APuU4Z8taw6l40OzwiBx8XzRO4PLSusnhX7fXZOAV1zIStPD3QcUFC8w
	TObSA1E8ivkQSIxEeil5X9qQF8D3Bc4SkJtMcIgVyT0P+urSL1uckS+ZspUkvMQpssYCoSyH/Tk
	+c6Vgy7BA/AIW7lPjC2CM9V5ylcWpTlCz/dhPSqFe
X-Gm-Gg: AYBFou1aB+3nwntafNASepBe06a3MDcSLUrDxVppFulmPE7e1LKqB7RNd5l8tU97YEh
	vpQq+H10ehpgdoO4vF75E0/+3giOceTrDeI3vl+5s+zdGU7x/N10V/UGg1TYVnXXvdyOQNqgzux
	bGbv65BHkT7ffYgndT3NHKHuvLJqanfSlPiuj+OHshnS6qIMKmIBiJNQp4QveWCm0LLmCuXxMWr
	Jgeotkokk87UrImLw9BAP1tR4YJeGFMGzA2SruUUG+KYw3rvHoLD1dgYRnBCO8h4aCrW0c5rcAm
	+Fow76HaWeQGMy45lEaja5h7O0RXCLQWDALMOD9HeUA+Ja3fAjJSjWXj8ugJNe2w6/uL/jrttJr
	mNnnf6Xw5zhttQze2GzZdwGDuWSmqpq6UqSAYKt27mfsz5qyFIObp7tO60rtPqoOkQHNXoc8=
X-Received: by 2002:a17:907:3d05:b0:c4d:2888:f373 with SMTP id
 a640c23a62f3a-c50963b2f6emr1160179066b.41.1794873185026; Mon, 16 Nov 2026
 15:53:05 -0800 (PST)
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
 <avPXjuf-q_bukDZc@gractus.seuss> <CAFLszThK3dnGdb42Qh6J3A9s96FWgx6kdTk-NkRd5GqPKr_8mw@mail.gmail.com>
 <avUV_ejp78LB5Kpn@gractus.seuss>
In-Reply-To: <avUV_ejp78LB5Kpn@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 16 Nov 2026 16:52:53 -0700
X-Gm-Features: AclHuK88M-9UOXHOuYhH0TUCOQAnb0A98LEIvTPjMf8qaoYMiBLt0EYBU-YzGf8
Message-ID: <CAFLszTge4AqJoyttoJcf1aW59c7L=+o2GWJRpjpf6sFsvcB-+A@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Add fdt_add_subnode_tail()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Vishal Chourasia <vishalc@linux.ibm.com>, devicetree-compiler@vger.kernel.org, 
	sourabhjain@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 11 Nov 2026 at 18:41, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> On Wed, Nov 11, 2026 at 06:24:15PM +0000, Simon Glass wrote:
> > Hi David,
> >
> > On Tue, 10 Nov 2026 at 19:50, David Gibson <david@gibson.dropbear.id.au=
> wrote:
> > >
> > > On Wed, Nov 04, 2026 at 05:50:45PM +0000, Simon Glass wrote:
> > > > Hi,
> > > >
> > > > On Tue, 3 Nov 2026 at 22:55, David Gibson <david@gibson.dropbear.id=
.au> wrote:
> > > > >
> > > > > On Tue, Nov 03, 2026 at 09:44:25PM +0530, Vishal Chourasia wrote:
> > > > > > fdt_add_subnode() always inserts the new node as the first chil=
d of its
> > > > > > parent, after the parent's properties. Code that builds a list =
of nodes
> > > > > > by adding them one at a time therefore ends up with the nodes i=
n reverse
> > > > > > order. That matters when the order is significant, e.g. when a =
blob is
> > > > > > rebuilt from a live tree.
> > > > > >
> > > > > > Add fdt_add_subnode_tail() and fdt_add_subnode_namelen_tail(), =
which
> > > > > > insert the new node right before the closing tag of the parent,=
 so that
> > > > > > nodes added in sequence keep that sequence. Like fdt_add_subnod=
e(), they
> > > > > > use fdt_splice_struct_() and so leave the blob unmodified if th=
ere is
> > > > > > not enough room.
> > > > > >
> > > > > > Also add an Fdt.add_subnode_tail() method to pylibfdt.
> > > > > >
> > > > > > Add tests for both: a C testcase covering ordering, parents wit=
h and
> > > > > > without existing children, the root node, duplicate names and r=
unning
> > > > > > out of space, and a short pylibfdt test of the wrapper.
> > > > > >
> > > > > > Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> > > > >
> > > > > I'd need a stronger and more specific rationale to consider apply=
ing
> > > > > this.  In general node order should not matter to consumers of th=
e
> > > > > device tree, which is why we make no attempt to preserve it the
> > > > > fdt_rw.c interface,
> > > >
> > > > Yes 'when a blob is rebuilt from a live tree' needs more detail. Wh=
at
> > > > is the use case that drove this?
> > > >
> > > > The spec doesn=E2=80=99t say that sibling order is significant, but=
 it doesn=E2=80=99t
> > > > say that it isn=E2=80=99t either. It only requires properties to co=
me before
> > > > subnodes.
> > >
> > > I guess not, because the modern(ish) spec is specifically describing
> > > the flattened format, which necessarily has some sort of order.
> > > Non-significance of the order might be implied by compatibility of th=
e
> > > device tree contents with IEEE 1275.  In IEEE 1275 the tree is not
> > > flattened (access is via Forth firmware methods), and I don't think i=
t
> > > precludes an implementation which uses a hash table to store
> > > properties and subnodes.
> >
> > Right. We are only really talking about libfdt here, i.e. what it
> > happens to implement. I believe this is a case to be made for keeping
> > the current behaviour. But in any case perhaps we should document
> > libfdt's intended node-ordering semantics, separate from its actual
> > behaviour. For example we could say that when adding a node, libfdt
> > may put it in any order, not necessarily at the start or end.
>
> Right, certainly the intention was that add_subnode() makes no
> guarantee about how it orders the new node.  Nothing that explicitly
> might be worthwhile.
>
> > I actually like the way it works now, but perhaps I've just got used to=
 it.
> >
> > > > rom my side, one use for this new function could be with Binman[1]
> > > > which builds firmware images. The nodes describe the ordering of
> > > > binaries within the image - example at [2].
> > >
> > > I would strongly advise you not to design something which relies on
> > > property or node order within the fdt format.
> >
> > Another option would be to add a sequence numbers as a property to
> > each node. Depending on where this goes I can update Binman.
>
> The other option you could consider is having an explicit (ordered)
> list of the things to consider as a different property somewhere.  Or,
> having /aliases entries which give the numbers, along the lines of
>         'hd0'   =3D> "/pci@XYZZY/scsi@PQRS/lun@3/..."
>         'hd1'   =3D> "/pci@PLUGH/usb@ABCD/mass-storage@4,3/..."
>
> Fwiw, sometime in the distant past that was suggested as a method that
> the device tree could use to advertise a stable device naming/order to
> Linux.  Not sure if that was ever implemented, though.

In the case of Binman, the nodes are binaries to be placed in the
image, so it is hierarchical and we don't really have anything like a
global alias list. ANyway, I'm going to park this for now...but worthy
of a discussion down the track.

Regards,
Simon
