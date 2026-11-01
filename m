Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570696;
	b=FYra5Z4/j3p0q9hBZbo1W0lFSX4iF8KCfRQ5FwcxCHOd2sYdvNSAikv8n9pr+s8BTAa6
	 KWyP3t1mcXAYDTPo/Hs3E5E0ANpe9mlDTWvIAAx5S6mZAqvVZw6LjLVun2bsO1k4aSST9
	 CBWN+H6S+pz73tqOSu9SvtZSQ+JTbQnE3qi8BCHkTmeBUS0UYeBMmn2gexncbyN9eNevu
	 Dg8BSn5FTH/OmU8q5Ztftm0R0qNambxuPGIeL/RGamQCRIA1w2toqBi8HiZNXgqJm6vnb
	 l7yGqp00CWiokOeD7c3NGlFjMyi5u8+lypHulD0INpt0C2ADx3Zy8BWMWnU5Q2d2SdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
	b=neMUbw/u1P9LGxvGv5Dl4qaVbx067e8MG+hg8BsudcO8UOw60xoqSnhX9AFi4uiLLHvC
	 dVHMV6i1Gvahspoj1h/THm0TmdLA7s7QifCi9JN3Zoi7C7SU6Jq0dPYwvJwQwV3L9lbEm
	 qmPOiP9MyInJvtCEp6f24JOk1a55vx7hAQ793JImIh9EHuDwceALDrgithZVWzIaAQgBR
	 xs7Dp1CLdHkNhZb/TxmIvBFlQrIalONVybVIerJNG6217+6/60HGgENeZEqRUaqh0VKuF
	 ITka3dq9zNt94qie0bmnlAtyLTjhjf9OxFGnojYNoOuEMg5kSphO6M3i7kZCJ+h28OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yd3huhSl;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4B606A324
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF4B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yd3huhSl
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso353184466b.2
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570694; x=1794175494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
        b=Yd3huhSlSrbDKLcIy7yrALQ9CIa07BTK5t0USLjcsXeiris5wjP4WzWFOL3o6Fr/UB
         ADcf5s1CRO2zpFn2R4LQpkOa9yZEPURcyc0bfRlPdsbdcEHWbAUpOoFUcHIJTu/icUTE
         +8vTUomaGxZIlaAkKvVckE6Di2U/UVXIzHDKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570694; x=1794175494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
        b=f2Mlp/DZpEC22tUBoz6e7ljFw6mm1kfZjiAblRvDXIeauQdWoafK+8HlfGW+zEiDmD
         S+zcrHXJ0tsjEkspTHdutFynY0stq3zdagIPkp4m0DVxOc8iAP2vwfCdaod/BJGw0Mll
         Yxz3WbUCJ2UT69XrxGej5hHRGvBkRCYeGJgIZIi5xM0ZxjI2yElkit5xbiVsnZg33lsq
         8+NUF4q9g+qSOA23mfFKOJFisriwm9mc2CezZ9vX1YJW3KXylZ3rx3UeHTjYdGCTBGZR
         Eh5GKmlmgxs752fe8GUKU4dnlyRfYF/QsypV7VB/wdp/wleTXqJPZtN+JhbUJJJUYv3b
         IXJw==
X-Gm-Message-State: AFq9FYLT59TRPEpt3EqMa1dIyzWuLC41QLdGUn2EdzphgEd8N0uJhhXK
	vOuIQBadS1ieO/BMXd/4UROoX3i/kBFvoSuN8r7A53d24LUE9wTeaJeo47Os9rLpfWI7wNcBSsh
	HTIFs6yuA
X-Gm-Gg: AYBFou1XPeDlcUXVs3jArwde6Hl159x5G6OaCAlIwuOljnl5bRzlkx7DzmCo1yTs+o/
	AV5wslSnpFRwuubO/mpY10JZ/9KgJijEk/gEIhROyrdRY3oOugo2wB4kOwRN0K5/rAfrcDn9BVD
	hGG6KLVHquCcj7zkHZVT3OZv34kYBGtO/owrWxchR8zrP7WLvk4TnuTV4faYObWuwDscbkN1ZZw
	t007ODNHukTkigRY1UfSm8WpRP9R7QoB1poHSzkgfww0cYXdeH8Oiitzd3pXmcfMOKUGgYPEqlA
	0cIEBP8N34HcWJuvSKsH+zdBOQ+c6hNWbIC0+kQjvFaGCaMvRno4z8KZuRYm4mnAkEnxG1H6/U5
	6DkldPQsc1IiSWCNExZtgw53o+HeZYpx+l0faVNDH3/5G3Xbv1vH7CJ8p2mDbxMb2GxjyY2WcxN
	UnBiY2chLbnPyzD473zEqG2WstihxIKa/LYdNsqcYZf9L0D0hiRVMVG5aB0L+oWdkJNOQR2AB/r
	bRgSE6+JIbwb1USAfiG1TUJ8Tw5akGb4QpUryelQ9k6W2Y+C5EvQt2Wf/Muukt41aSC89TtGCCr
	YnhEEJ6NLN/ojYdh9YagbgeXiPqOwTojec3VX87HeCnLOCYqKWmQEauxB/7slQdgo2ozvlmcsj1
	nlR/HUeC+U1Dp
X-Received: by 2002:a17:906:ee81:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c4ca7a4f360mr668706466b.25.1793570694221;
        Sun, 01 Nov 2026 14:04:54 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm318740366b.33.2026.11.01.14.04.52
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:52 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14362885e9.2
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:52 -0800 (PST)
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id
 5b1f17b1804b1-4ac175669d8mr216663905e9.14.1793570692011; Sun, 01 Nov 2026
 14:04:52 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-4-dianders@chromium.org> <auQjnZ6rd4wqoORz@gractus.seuss>
In-Reply-To: <auQjnZ6rd4wqoORz@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VnZH+bBom69RSVT8kfuP-XO_6mVArUQ=ORJagN3m9QTw@mail.gmail.com>
X-Gm-Features: AclHuK_fDlaJvBpebQfnxbn9UYLGLnZlO-sk2Sumr6YeHeQumNhOKE78u883L_8
Message-ID: <CAD=FV=VnZH+bBom69RSVT8kfuP-XO_6mVArUQ=ORJagN3m9QTw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:53PM -0700, Douglas Anderson wrote:
> > Add a `NodeTree` class to `pylibfdt` to provide an in-memory live tree
> > representation of a devicetree node and its subtree.
> >
> > While `FdtRo` / `Fdt` / `FdtSw` operate on flat binary blobs by node an=
d
> > property offsets, tools that inspect, compare, or transform whole devic=
e
> > trees are much simpler when manipulating a Python tree of nodes and
> > properties.
> >
> > `NodeTree` provides:
> > - `NodeTree.unflatten(fdt, offset=3D0)` and `tree.flatten(...)` to conv=
ert
> >   between `FdtRo` blobs and `NodeTree` hierarchies.
> > - `get_node(path)`, `create_path(path)`, and `walk(path=3D'')` for path
> >   navigation and pre-order traversal.
> > - Typed property getters and setters (`get_str()`, `set_str()`,
> >   `get_stringlist()`, `set_stringlist()`, `get_u32()`, `set_u32()`,
> >   `get_u32_list()`, `set_u32_list()`).
> >
> > Also fix `Property.as_str()` and `Property.as_stringlist()` when called
> > on an empty `b''` property so `as_str()` raises `ValueError` instead of
> > `IndexError` and `as_stringlist()` returns `[]`.
>
> Thanks for splitting this out as suggested.  However, on
> consideration, I don't think it really belongs in pylibfdt: the "f" in
> there refers to "flattened" and this is, explicitly, a non-flattened
> data structure.  I have sometimes thought about adding a library for
> handling non-flattened trees, although I wasn't thinking something
> Python specific.  I think for now let's move this to its own Python
> file / module.

Done. I've moved it out of `pylibfdt/libfdt.i` into its own `devicetree.py`
module.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index 09fa5fb9ef3c..874a03a3c749 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> > @@ -929,14 +929,16 @@ class Property(bytearray):
> >
> >      def as_str(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > -        if self[-1] !=3D 0:
> > +        if not self or self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          if 0 in self[:-1]:
> >              raise ValueError('Property contains embedded nul character=
s')
> >          return self[:-1].decode('utf-8')
> >
> >      def as_stringlist(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > +        if not self:
> > +            return []
> >          if self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          parts =3D self[:-1].split(b'\x00')
>
> The two hunks above are good fixes, but unrelated to the bulk of the
> patch.

Split out into a separate patch ("pylibfdt: Handle empty properties in
as_str() and as_stringlist()") with direct unit tests for `Property`.


> > @@ -1214,6 +1216,261 @@ class NodeAdder():
> >          self._fdt.end_node()
> >
> >
> > +class NodeTree:
>
> Maybe class DeviceTree?  The "node" doesn't really add any useful
> information.

Done. Renamed to `DeviceTree` (in `devicetree.py`).


> > +    @classmethod
> > +    def unflatten(cls, fdt, offset=3D0):
> > +        """Unflatten an FdtRo subtree starting at `offset` into a Node=
Tree.
> > +
> > +        Args:
> > +            fdt: An `FdtRo` (or `Fdt`) instance.
> > +            offset: Starting node offset (default 0 for the root node)=
.
> > +
> > +        Returns:
> > +            A `NodeTree` representing the node at `offset` and its des=
cendants.
> > +        """
> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            node.props[prop.name] =3D bytes(prop)
>
> Since we already rely on class Property from libfdt.i, it seems like
> it would be a little more natural to have the dictionary values be
> class Property instances.  Yes, that technically has some redundant
> storage of the property names, but we're not particularly concerned
> about optimisation for this Python library.  Plus, Python's
> assign-by-reference should mean it's generally just a duplicated
> pointer, not a whole duplicated string.

Done. `node.props` now maps property names to `libfdt.Property` instances,
which also simplifies `get_str()`, `get_stringlist()`, `get_u32()`, and
`get_u32_list()`.


> > +        fdt =3D sw.as_fdt()
> > +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> > +        fdt.pack()
> > +        return bytes(fdt.as_bytearray())
>
> For better symmetry with unflatten(), I'd suggest returning the Fdt

Done. `flatten()` now returns the packed `libfdt.Fdt` instance.


-Doug
