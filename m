Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224666;
	b=ofqsZVu0/JC23pa6ml4xx0MtgFwawHGrdIVWgpq94/20skEfzWsT9YyagYWtZtYZnZMT
	 mPGsNAQHvpPtWDcIfC+mhuSigxY02isBgshahQImg+o5iOcFYC0eKKvw8u4AkwlvIC5uJ
	 S3eKbdM6sDoyI/IkoErisvrG3uj6j/QRoWeyzYlxKSz/nKg8uRtbSty16xlMd0EeiAzKd
	 N1dcDJlkpQlTh/Xcdg2IY9kMPxASgZU4DUzSsadJjNne9Kup4hRekrOC76DRizgwSFyN3
	 iA9xtDfqiFQab2DaR6k4VPKnAFV9XD8tCg7E/cKqJPM0Y0g3r5yThtwKoCVJsGfOPUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2WmtnwaieuPN7Cvx4ZYce/pTXpEVARAGmgkm0lLYi3Q=;
	b=CQ2OMSnWCiStGag/Tp7krcFU3lXS4+kOI+jiw7JQrYFGGD2Y/wEYvq9hFfRWp+YlOk25
	 9kd9+/1oxptA6BGqtFqbp8kg71mlg/9TiY6R2myYRFdGWlsAJ69rCBqEPS781ETheomlu
	 gYxcOvHKiF2Uv0lBYg8zIG7O89HP6FhM5ZgDyxqIAgyooSUF35TEP3vEYt+ihTT+fLyk4
	 iWbVBF4IWXUUXyeoYetBjBbA4ZGTmWw3MgoEzkJQanzsqfKPO2V0uBD47dIGDzsZx/WOb
	 Dmi7ViKRa1vIs9q2PGb2RACPc63GFtIx+H4kK/ivUyutE48V71obYtJy6lrjI7nsqPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRdAL+mx;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE727606A31A
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE727606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRdAL+mx
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso233007266b.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224663; x=1793829463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2WmtnwaieuPN7Cvx4ZYce/pTXpEVARAGmgkm0lLYi3Q=;
        b=cRdAL+mx1Jfl3sTBAqk75DAHoCAEE8/jG9HtEaf1wbWyrT5QKyTVv9opQitTT0V454
         PJXnYmSZjqAr3AIlI+WNUvWtGhwD1by9n+UcaaeSE5dMHk1fJwUzE658LOMSLdB9gg7G
         mBSaKBio0R5wtgH9wB1wNjiYgwUlGt12EXaEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224663; x=1793829463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WmtnwaieuPN7Cvx4ZYce/pTXpEVARAGmgkm0lLYi3Q=;
        b=WJAeX+zhM9Nx9QET5/ykf0b2/lGkuD8lyNkVRrm7lWWKV6NNj/nNeRZ8MsfrbIY6Yq
         XdrDwrzUjr0UwmJk1iC4XM154ZAmNPUqdgyZnYzomk8z7rLn3/nL3swADpz5o2FIz8F3
         YPW1e+mlxE1PRQMEN0DV0oKotRjSErZosGuwpKzqqvaPZ91a/lz/ABGsVVAZmzBzjaCq
         0Bt1jdORhbVjj80vlyuGa9Vxqu6E2whkz86BIzNTFJpREvcDevcN7yc55QQAdGi7j43R
         M9yFjoKvQQpSj0Ql+tYUNr5wtL9QZNvKb2KYwDJqivC3mPFU1invQFocwU76NJWgbkv5
         ubGw==
X-Gm-Message-State: AFq9FYKNoABSBQW2HmZv9Exx1EAvrOkSDXdjecCW2+aXtfHZw+UzBVLq
	xvzJAgQp3BnZkwrG8Vmk2w3BjA/myifZ/aSNoVV7+rH3aSl4Lg+wXixnqv2IomY6FVngME4WOj8
	bPSEoSieX
X-Gm-Gg: AYBFou3VcoWKTDvtj1V40fXJ/ou9XAnkjip4KsjZUB/XGiSKo1v8DFewiwT6O12Ta70
	5Y8Prd6yVUX0xpU8jr6CnzFDAph/zlPnHEingO77biG3H7v+LoQEL9d3REUeRu6NiiNe4ow8Qcx
	5HvyT4AwlOmcASs9B01c+qsAEROTedsrO5LCpYURDDQ8UhvRUxV+9dwB6ViWIjJAcoMNNCNqLpi
	jdt18yFViBLZulXFWdx6rd0Yl14VCDQIPO8IP+jsBBlz75AFaB4YP4ct7+5lQ4uIqok/CAzx25T
	/LKfnzsAZ+e9IgBXKoP3CatZwCY1FNiIAlI2CuJTXQQacQxcdi4Ipmn47zZDw8I/jVmtaMxmEbt
	6aKlBOn07gCpU0AB67g0L6e0LFui5DEJUR/LkYfvmCP7GgEKO05V8Njhtkc35IM5XqQKM4N4zj+
	nrbaGCE/lq/LGg5k3QWOVOf3KaDhJpQOGrg7SkmOmTxuwqWTH6TceB392jW693C5r148EIVguHP
	5Z8oNnr/PkocXDKn6lA0DE59Uii67cptiYEHvmfWJfzo/6Ymd10YjtjxCgQ7ZAFG4wm4PeNGBnQ
	QbQBLXo5qhxkKu+hl6reasJCspL2uDj03aEpa9aW47Rn0iov52lA5x4nCLqFBa6Zg/pTdw==
X-Received: by 2002:a17:906:6205:b0:c24:87e5:6491 with SMTP id a640c23a62f3a-c49bddadce7mr340737066b.2.1793224662680;
        Wed, 28 Oct 2026 14:57:42 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm654214466b.8.2026.10.28.14.57.40
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:42 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so13207885e9.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:40 -0700 (PDT)
X-Received: by 2002:a05:600c:a48:b0:4a6:42cc:bf66 with SMTP id
 5b1f17b1804b1-4a9661ab4e9mr81616685e9.11.1793224658840; Wed, 28 Oct 2026
 14:57:38 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <at7cBFtlAQOFJ8jG@gractus.seuss>
In-Reply-To: <at7cBFtlAQOFJ8jG@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
X-Gm-Features: AclHuK9Pl08bobIgWrCnD-lZ7zJOpVyQjx7wjXJpG-nIwezqTT6uwYgInPyFKHE
Message-ID: <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Sun, Oct 25, 2026 at 9:51=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> This patch is very large, which makes it fairly hard to review - a
> danger with AI generated code.  However, from the premise there's not
> an obvious (to me) logical way of splitting it up.

Yeah, it is a bit unwieldy. I didn't see any amazing ways to break it up,
but I can definitely try harder. Let's see how it looks after addressing
all of your feedback.


> I'll see what
> appears as I go through the implementation.

Thanks so much for your detailed review! I really appreciate it!


> > +Options:
> > +
> > +* `-b`, `--base-dtb`: Output path for the common base `.dtb` (placed i=
n
> > +  `--outdir` if specified without a directory component).
> > +* `-o`, `--outdir`: Output directory for generated `.dtbo` files (and =
for
> > +  `--base-dtb` when given without a directory component).
>
> Maybe it's just me, but I find it slightly confusing that both -b and
> -o are controlling the output names.  I'd be inclined to drop -b and
> always send the generated based dtb to <outdir>/base.dtb, at least for
> this first patch introducing the tool.  After all, you can always mv
> it afterwards.

Yeah, I debated this a bit originally, and I agree it's a bit confusing.
How about this: I'll keep the option, but force it to be just a filename,
not a full path. At least to me that makes it less confusing. Hopefully
that's OK?


> > +* `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the gene=
rated
> > +  `base.dtb` and final reconstructed device trees. When `-L` is passed=
 to
> > +  `dtc` solely so `fdtfactor` can locate phandle cells at build time, =
the
> > +  original DTB's `/__local_fixups__` subtree is not needed at runtime =
by
> > +  either the overlay loader (`fdt_overlay_apply()`) or the OS kernel;
> > +  passing `-S` strips it to reduce the size of both `base.dtb` and the
> > +  `.dtbo` overlays. Omit `-S` if downstream tooling or verification
> > +  expects applying a board's `.dtbo` to `base.dtb` to reproduce the
> > +  original `.dtb`'s `/__local_fixups__` subtree verbatim.
>
> Useful option, could be split to another patch to make this one less
> huge.

Done.


> > +* `--verify`: Verify that applying each generated `.dtbo` to `base.dtb=
`
> > +  with `libfdt` recreates the original `.dtb`.
>
> Seems like something more for the test suite than built into the tool.

Removed and made sure the test suite covers.


> > +* `-v`, `--verbose`: Print size savings summary.
>
> Something like --stats might be better for this.  -v tends to be more
> for debugging / logging output.

Done.


> > +### TODO
> > +
> > +* **Explore omitting `/__fixups__` and `/__symbols__` from overlays by
> > +  hardcoding base DT phandles**: Normally a standalone `.dtbo` stores
> > +  references to base tree nodes as `0xffffffff` with string entries in
> > +  `/__fixups__` that the overlay loader resolves at runtime against
> > +  `base.dtb`'s `/__symbols__`. Because `fdtfactor` generates `base.dtb=
`
> > +  and all `.dtbo` overlays together, it already knows the exact numeri=
c
> > +  phandle values assigned to every node in `base.dtb`. Neither `libfdt=
` nor
> > +  coreboot modifies property cells that are not listed in `/__fixups__=
` or
> > +  `/__local_fixups__`. Writing the base phandle integers directly into
> > +  overlay properties would allow omitting `/__fixups__` from the `.dtb=
o`
> > +  files (and omitting `/__symbols__` when runtime symbol lookup is not
> > +  needed), further reducing overlay size and speeding up boot-time ove=
rlay
> > +  application.
>
> I really don't like that idea.  You'd essentially be creating not
> really valid dtbo files that will work by accident against one
> specific base file.

Dropped from the TODO.


> > +* **Multi-level overlays**: Support hierarchical overlay layers (for
> > +  example, SoC base -> board family intermediate overlay -> SKU leaf
> > +  overlay) when multiple boards share large sub-trees not present acro=
ss
> > +  all boards.
>
> That sounds like a useful extension for the future.  An interim step
> would be to extend to instead of taking a bunch of dtbs as input, take
> a single (already generated) base dtb and a bunch of dtbos.  You'd
> leave the given base alone, but find further common things between the
> dtbs, in the context of that base.  The idea is you'd run fdtfactor
> once on the raw dtbs, then run it again on a subset of the dtbos
> emitted from the first pass to find further commonalities in that
> subset.

Improved the TODO to incorporate this.


> > +def split_dtb_filename(path):
> > +    """Split a DTB path into its directory and filename stem.
> > +
> > +    Example:
> > +        '/dir/board.dtb' -> ('/dir', 'board')
> > +
> > +    Args:
> > +        path: File path to a .dtb or .dtbo file.
> > +
> > +    Returns:
> > +        Tuple of (directory, stem) where `stem` has any trailing `.dtb=
` or
> > +        `.dtbo` suffix removed.
> > +    """
> > +    directory, filename =3D os.path.split(path)
> > +    stem, sep, ext =3D filename.rpartition('.')
> > +    if not stem or not sep or ext not in ('dtb', 'dtbo'):
> > +        stem =3D filename
> > +    return directory, stem
>
> Hm, I'll have to see how this is actually used, but I'm generally a
> bit leery (on non-Windows systems) of using the extension as anything
> but a hint / default.

Removed from this patch. It comes back when compression / FIT image
support is added but the code never relies on the extension being correct.


> > +class NodeTree:
> > +    """In-memory tree of nodes and properties for sequential FDT creat=
ion."""
>
> A "live" tree representation is the right data structure for this job.
> On the other hand it's a pretty hefty piece of infrastructure to just
> inline in this tool.
>
> I'd suggest adding this as a preliminary patch, with a more trivial
> test case (say round trip from dtb to dtb via the in-memory
> representation).  Then introduce the actual fdtfactor logic to use it.

I hope it's OK, but I ended up deciding to move NodeTree into
pylibfdt/libfdt.i. I can move it back here if you want, but it felt
like others could want to use this too. If you want it in a separate
file or back in fdtfactor, let me know.


> > +    def __init__(self):
> > +        self.props =3D {}
> > +        self.children =3D {}
> > +
> > +    def get_node(self, path):
> > +        """Return the descendant NodeTree at `path`, creating missing =
nodes.
>
> I gess it's what you need here, but "creating missing nodes" seems
> risky for what looks at first glance like a read interface.

I split out get_node() and create_path(), where create_path() creates the
missing parts of the path and then also returns the final node. Hopefully
that works for you.


> > +        Looks up a child or deeper descendant `NodeTree` by following =
the
> > +        slash-separated node names in `path` starting from `self` (lea=
ding and
> > +        trailing `'/'` characters are ignored, so `'/soc/i2c@4000'` an=
d
> > +        `'soc/i2c@4000'` behave identically). If any node along `path`=
 does not
> > +        exist yet in `self.children`, a new empty `NodeTree` is create=
d for it
> > +        automatically (similar to `mkdir -p`). Passing `''` or `'/'` r=
eturns
> > +        `self`.
> > +
> > +        Example:
> > +            root =3D NodeTree()
> > +            # The following automatically creates root.children['soc']=
 and
> > +            # root.children['soc'].children['i2c@4000'], and returns t=
he
> > +            # 'i2c@4000' NodeTree.
> > +            i2c =3D root.get_node('/soc/i2c@4000')
> > +            i2c.props['status'] =3D b'okay\\x00'
>
> Should probably be b'status' - property names aren't Unicode.

That doesn't seem to match how the existing pylibfdt works. My agent
says "Existing pylibfdt requires str for node names, paths, and property
names, and bytes/bytearray for property values."

I confirmed this myself by running this (my example uses the properties()
method added by my next version of the patch series for testing, but
that doesn't actually affect the result):

  fdtro =3D libfdt.FdtRo(open("sc7180-trogdor-lazor-r9.dtb", "rb").read())
  [prop.name for prop in fdtro.properties(0)]

I got back:
  ['interrupt-parent', '#address-cells', ... ]

Specifically, I didn't get back [b'interrupt-parent', ...]. That being
said, while the existing bindings make the property names strings, the
values seem to be bytes:

  [prop for prop in fdtro.properties(0)][3]
  Property(b'Google Lazor (rev9)\x00')

So I think we're OK. My assumption is that the python bindings were
written this way because:

1. It would be a pain to use b'' strings everywhere.
2. Property names ought to be safe to convert back and forth to python
   strings.

Please yell if I'm misunderstanding.


> > +        Args:
> > +            path: Slash-separated node path starting from `self` (lead=
ing `'/'`
> > +                is optional and ignored, e.g. `'/soc/i2c@4000'` or
> > +                `'soc/i2c@4000'`).
> > +
> > +        Returns:
> > +            The `NodeTree` instance at `path`.
> > +        """
> > +        if path =3D=3D '/' or not path:
> > +            return self
>
> Again, path should be treated as a bytestring not a string - node
> names are not Unicode.  At least, internally that should be the case.
> Accepting a string and converting it to a bytestring would be fine.

Again, I don't think this matches the existing python bindings.
  first_off =3D [suboff for suboff in fdtro.subnodes(0)][0]
  fdtro.get_path(first_off)

That gives me back: '/aliases', not b'/aliases'.

NOTE: the above uses the subnodes() method added by my next version of
the patch series for testing, but that doesn't actually affect the result.


> > +        curr =3D self
> > +        for part in path.strip('/').split('/'):
>
> Hmm.  The strip() here means it will ignore not just one, but any
> number of leading or trailing '/'.  However, internal repeated '/'
> will result in subnodes named '', which is not desirable.
>
> Simpler and more consistent might be to drop the initial special case
> handling of '/' and '' as full paths and instead go with:
>
>         for part in path.split('/'):
>             if not part:
>                 continue
>             . . .

Done


> > +            if part not in curr.children:
> > +                curr.children[part] =3D NodeTree()
> > +            curr =3D curr.children[part]
> > +        return curr
> > +
> > +    def _write_to_sw(self, sw, name=3D''):
>
> Traditionally the process of converting an in-memory device tree
> representation to a dtb is referred to as "flattening".  So I'd
> suggest maybe _flatten_subtree() for this.  As an internal function,
> I'd also drop the default name=3D'' - it's rarely useful and incorrect
> if called on anything except the root node.

Done.


> > +        """Recursively write this NodeTree and its children into an Fd=
tSw.
> > +
> > +        Args:
> > +            sw: A `libfdt.FdtSw` sequential-write instance.
> > +            name: Node name for this subtree (empty string for the roo=
t node).
> > +        """
> > +        sw.begin_node(name)
> > +        for prop_name, val in self.props.items():
> > +            sw.property(prop_name, bytes(val))
> > +        for child_name, child_node in self.children.items():
> > +            child_node._write_to_sw(sw, child_name)
> > +        sw.end_node()
> > +
> > +    def to_fdt_blob(self, mem_rsv=3D(), boot_cpuid_phys=3D0, size_hint=
=3D65536):
>
> flatten()

Done.


> > +        """Serialize this root NodeTree into a packed FDT byte string.
> > +
> > +        Args:
> > +            mem_rsv: Iterable of (address, size) tuples for the FDT me=
mory
> > +                reservation block.
> > +            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
> > +            size_hint: Initial buffer size hint in bytes for `libfdt.F=
dtSw`.
> > +
> > +        Returns:
> > +            Serialized FDT blob as `bytes`.
> > +        """
> > +        sw =3D libfdt.FdtSw(size_hint)
> > +        for addr, size in mem_rsv:
> > +            sw.add_reservemap_entry(addr, size)
> > +        sw.finish_reservemap()
> > +        self._write_to_sw(sw, '')
> > +        # Unlike other FdtSw methods, as_fdt() does not call check_spa=
ce()
> > +        # when fdt_finish() appends the 4-byte FDT_END token. If fewer=
 than
> > +        # 4 bytes remain in the buffer, resize once and retry.
>
> That seems like a bug in FdtSw.as_fdt().  We should fix that, rather
> than working around it here.

Done.


> > +def _open_fdt_ro(raw_bytes, filename):
> > +    """Validate and wrap an uncompressed FDT blob in `libfdt.FdtRo`.
> > +
> > +    Args:
> > +        raw_bytes: Uncompressed FDT binary contents as `bytes`.
> > +        filename: Display name or file path for error reporting.
>
> This is a weird interface.  Why not take just the filename, and read
> the bytes from it in here?

Function is gone in the new version.


> > +class ParsedDtb:
> > +    """Parsed representation of an input .dtb blob."""
> > +
> > +    def __init__(self, filename, raw_bytes):
>
> Again, why take filename and bytes separately?

It makes more sense when you get to the later patch that adds FIT image
support (where DTBs are extracted from memory rather than a file).
Actually, let me move raw_bytes to that patch to keep this patch smaller
and then it will all hopefully make more sense.


> > +        """Parse an uncompressed FDT blob into nodes, symbols, and fix=
ups.
> > +
> > +        Args:
> > +            filename: Display name or file path for error reporting.
> > +            raw_bytes: Uncompressed FDT binary contents as `bytes`.
> > +        """
> > +        self.filename =3D filename
> > +        self.raw_bytes =3D raw_bytes
> > +        fdt =3D _open_fdt_ro(raw_bytes, filename)
>
> This is the only caller of _open_fdt_ro(), which itself is not very
> long.  Any reason not to just open code it here?

Done.


> > +        if _is_dtbo_overlay(fdt):
> > +            raise ValueError(
> > +                f'{filename}: Input is already a DTB overlay (.dtbo)'
> > +            )
> > +
> > +        # Extract FDT header metadata (boot_cpuid_phys and /memreserve=
/ table)
> > +        # stored outside the DT node/property tree; see _validate_dtb_=
headers()
> > +        # for why these require special handling.
> > +        self.boot_cpuid_phys =3D fdt.boot_cpuid_phys()
> > +        self.mem_rsv =3D [
> > +            tuple(fdt.get_mem_rsv(i)) for i in range(fdt.num_mem_rsv()=
)
> > +        ]
>
> I wonder if "get all mem reserves" would be a useful method to add to Fdt=
Ro.

Done. get_mem_rsv_list() added to FdtRo.


> > +        self.has_symbols =3D False
> > +        self.symbols =3D {}
> > +        self.has_local_fixups =3D False
> > +        self.local_fixups =3D {}
>
> What's the reason for the separate has_* fields, rather than encoding
> that as an empty self.symbols or self.local_fixups?

Removed.


> > +        self.nodes =3D {}
> > +        self.phandles =3D {}
> > +        self.has_phandle_prop =3D {}
> > +        self.has_linux_phandle_prop =3D {}
> > +        self.phandle_to_path =3D {}
> > +        self.sym_props =3D {}
> > +
> > +        self._parse_tree(fdt)
> > +
> > +    @classmethod
> > +    def from_file(cls, path):
>
> Why a class method rather than doing this in __init__()?

This is basically just the pythonic way of providing an alternate
constructor, right? In v1, the main __init__ was used for the
"--verify" option, which is now gone. So yeah, we can make
constructing from a path be the only constructor and move to
__init__.


> > +    def _parse_tree(self, fdt):
> > +        """Walk the FDT and extract nodes, properties, symbols, and fi=
xups.
> > +
> > +        Args:
> > +            fdt: A `libfdt.FdtRo` instance wrapping the input blob.
> > +        """
> > +        self._walk_regular(fdt, 0, '/')
> > +
> > +        sym_off =3D fdt.subnode_offset(0, '__symbols__',
> > +                                     quiet=3Dlibfdt.QUIET_NOTFOUND)
>
> You already unflattened the tree, but deliberately excluded
> __symbols__.  Both clearer and more efficient to *not* exclude it from
> the unflattening, then read the symbols from the unflattened version,
> rather than re-parsing.

Done. NodeTree.unflatten() now unflattens the entire FDT (including
/__symbols__ and /__local_fixups__), and ParsedDtb pops __symbols__ and
__local_fixups__ from self.root.children and processes them directly from
the unflattened NodeTree nodes.


> > +        if sym_off >=3D 0:
> > +            self.has_symbols =3D True
> > +            poff =3D fdt.first_property_offset(sym_off,
> > +                                             quiet=3Dlibfdt.QUIET_NOTF=
OUND)
> > +            while poff >=3D 0:
> > +                prop =3D fdt.get_property_by_offset(poff)
> > +                if prop.name not in ('phandle', 'linux,phandle'):
>
> Huh, __symbols__ typically won't have a phandle, but yeah, we can't
> exclude the possibility.  Another ugliness in the overlay format.

Sounds good. Keeping this.


> > +                    target_path =3D prop.as_str() if prop else ''
>
> As everywhere, I think it would be safer to treat paths and node names
> as bytestrings.

Not doing this. See above.


> > +                    if target_path not in self.nodes:
> > +                        raise ValueError(
> > +                            f'{self.filename}: symbol {prop.name!r} re=
ferences '
> > +                            f'missing node {target_path!r}'
> > +                        )
> > +                    self.symbols[prop.name] =3D target_path
> > +                poff =3D fdt.next_property_offset(poff,
> > +                                                quiet=3Dlibfdt.QUIET_N=
OTFOUND)
> > +
> > +        lf_off =3D fdt.subnode_offset(0, '__local_fixups__',
> > +                                    quiet=3Dlibfdt.QUIET_NOTFOUND)
> > +        if lf_off >=3D 0:
> > +            self.has_local_fixups =3D True
> > +            self._walk_local_fixups(fdt, lf_off, '/')
> > +
> > +    def _walk_regular(self, fdt, nodeoffset, path):
> > +        """Recursively collect regular nodes and their properties.
>
> I'd suggest "unflatten" as the name by analogy with similar code in
> dtc and the kernel.

This became unflatten() in NodeTree, which is small/simple. Other work
in ParsedDtb happens in separate passes.


> > +        Args:
> > +            fdt: A `libfdt.FdtRo` instance.
> > +            nodeoffset: Offset of the current node in `fdt`.
> > +            path: Full device tree path of the current node (e.g. '/so=
c').
> > +        """
> > +        props =3D {}
> > +        ph_val =3D None
> > +        has_ph =3D False
> > +        has_linux_ph =3D False
> > +
> > +        poff =3D fdt.first_property_offset(nodeoffset,
> > +                                         quiet=3Dlibfdt.QUIET_NOTFOUND=
)
> > +        while poff >=3D 0:
> > +            prop =3D fdt.get_property_by_offset(poff)
> > +            raw =3D bytes(prop)
> > +            if prop.name in ('phandle', 'linux,phandle'):
>
> It would be slightly less efficient, but I think recording the
> phandles as a second pass rather than while you're parsing the
> structure might be clearer.

Done.


> > +                if len(raw) !=3D 4:
>
> You can use len() directly on prop, as a subclass of bytearray.

Done (via NodeTree.get_u32()).


> > +                    raise ValueError(
> > +                        f'{self.filename}: {path}: {prop.name} length =
'
> > +                        f'{len(raw)} !=3D 4'
> > +                    )
> > +                val =3D struct.unpack('>I', raw)[0]
>
> You can use Property.as_uint32() rather than opencoding a
> struct.unpack.

Done (via NodeTree.get_u32()).


> > +                if ph_val is not None and ph_val !=3D val:
> > +                    raise ValueError(
> > +                        f'{self.filename}: {path}: mismatched phandle =
'
> > +                        f'({ph_val:#x} vs {val:#x})'
> > +                    )
> > +                ph_val =3D val
> > +                if prop.name =3D=3D 'phandle':
> > +                    has_ph =3D True
> > +                else:
> > +                    has_linux_ph =3D True
> > +            else:
> > +                props[prop.name] =3D raw
> > +            poff =3D fdt.next_property_offset(poff, quiet=3Dlibfdt.QUI=
ET_NOTFOUND)
> > +
> > +        self.nodes[path] =3D props
>
> Wait... what?  You're not storing this as the NodeTree structure you
> established above?  That's weird.
>
> > +        self.phandles[path] =3D ph_val
> > +        self.has_phandle_prop[path] =3D has_ph
> > +        self.has_linux_phandle_prop[path] =3D has_linux_ph
>
> Why parallel maps for all these, rather than a single Node object?
> Or NodeTree, since you have that already.

Above two comments are handled and stuff is stored in NodeTree.


> > +        if ph_val is not None:
> > +            if ph_val in (0, 0xffffffff):
> > +                raise ValueError(
> > +                    f'{self.filename}: invalid phandle {ph_val:#x} on =
{path}'
> > +                )
> > +            if ph_val in self.phandle_to_path:
> > +                raise ValueError(
> > +                    f'{self.filename}: duplicate phandle {ph_val:#x} o=
n '
> > +                    f'{self.phandle_to_path[ph_val]} and {path}'
> > +                )
> > +            self.phandle_to_path[ph_val] =3D path
> > +
> > +        soff =3D fdt.first_subnode(nodeoffset, quiet=3Dlibfdt.QUIET_NO=
TFOUND)
> > +        while soff >=3D 0:
>
> Hm, node and property iterators would probably be a good addition to
> FdtRo (should be fairly easy using generators).

Done in an earlier patch in the series.


> > +            name =3D fdt.get_name(soff)
> > +            if path =3D=3D '/' and name in ('__symbols__', '__local_fi=
xups__'):
> > +                soff =3D fdt.next_subnode(soff, quiet=3Dlibfdt.QUIET_N=
OTFOUND)
> > +                continue
>
> I'd *definitely* suggest that parsing symbols and fixups be handled in
> a later pass rather than linline during parsing.

_parse_symbols() is now a separate pass.


> > +            child_path =3D '/' + name if path =3D=3D '/' else f'{path}=
/{name}'
> > +            self._walk_regular(fdt, soff, child_path)
> > +            soff =3D fdt.next_subnode(soff, quiet=3Dlibfdt.QUIET_NOTFO=
UND)
> > +
> > +    def _walk_local_fixups(self, fdt, nodeoffset, rel_path):
> > +        """Recursively collect phandle byte offsets from `/__local_fix=
ups__`.
> > +
> > +        Args:
> > +            fdt: A `libfdt.FdtRo` instance.
> > +            nodeoffset: Offset of the current node inside `/__local_fi=
xups__`.
> > +            rel_path: Corresponding target node path in the device tre=
e.
>
> 'rel_path' is a bad name, since this is an absolute path in the tree.

Updated.


> > +        Raises:
> > +            ValueError: If a fixup property length is not a multiple o=
f 4.
> > +        """
> > +        poff =3D fdt.first_property_offset(nodeoffset,
> > +                                         quiet=3Dlibfdt.QUIET_NOTFOUND=
)
>
> Again, this would be qeasier if you used the unflattened __local_fixups__=
.

Done.


> > +        while poff >=3D 0:
> > +            prop =3D fdt.get_property_by_offset(poff)
> > +            raw =3D bytes(prop)
> > +            if len(raw) % 4 !=3D 0:
>
> Again, you can use len() directly on prop.

Done (via NodeTree.get_u32_list()).


> > +                raise ValueError(
> > +                    f'{self.filename}: malformed __local_fixups__ prop=
erty '
> > +                    f'{rel_path}:{prop.name} (length {len(raw)})'
> > +                )
> > +            count =3D len(raw) // 4
> > +            offsets =3D struct.unpack(f'>{count}I', raw)
>
> and as_uint32_list().

Done (via NodeTree.get_u32_list()).


> > +    def build_symbolic_props(self):
> > +        """Build normalized property values for comparison across DTBs=
.
> > +
> > +        Populates `self.sym_props[path][prop_name]` with a tuple:
> > +            `(masked_bytes, ((offset, target_node_path), ...))`
> > +        where phandle cells listed in `self.local_fixups` are zeroed i=
n
> > +        `masked_bytes` and recorded symbolically by their target node =
path.
> > +
> > +        Raises:
> > +            ValueError: If a fixup references a missing property, its =
offset is
> > +                out of range, or it references an unknown phandle valu=
e.
> > +        """
> > +        for path, prop_name in self.local_fixups:
> > +            if path not in self.nodes or prop_name not in self.nodes[p=
ath]:
> > +                raise ValueError(
> > +                    f'{self.filename}: local fixup references missing =
property '
> > +                    f'{path}:{prop_name}'
> > +                )
>
> Probably makes more sense for this check to happen while parsing
> local_fixups than afterwards here.

Done.


> > +        for path, props in self.nodes.items():
> > +            node_sym_props =3D {}
> > +            for prop_name, raw in props.items():
> > +                offsets =3D self.local_fixups.get((path, prop_name), (=
))
>
> Walking the whole tree, then looking up if it is in local_fixups seems
> the wrong way around.  Better to walk local_fixups and go to the right
> place in the tree to process it.

Done.


> > +                if not offsets:
> > +                    node_sym_props[prop_name] =3D (raw, ())
> > +                    continue
> > +                masked =3D bytearray(raw)
> > +                targets =3D []
> > +                for off in offsets:
> > +                    if off + 4 > len(raw):
> > +                        raise ValueError(
> > +                            f'{self.filename}: fixup offset {off} out =
of range '
> > +                            f'on {path}:{prop_name} (len {len(raw)})'
> > +                        )
> > +                    ph =3D struct.unpack_from('>I', raw, off)[0]
> > +                    target_path =3D self.phandle_to_path.get(ph)
> > +                    if target_path is None:
> > +                        raise ValueError(
> > +                            f'{self.filename}: unknown phandle {ph:#x}=
 at '
> > +                            f'{path}:{prop_name}+{off}'
> > +                        )
> > +                    masked[off:off + 4] =3D b'\x00\x00\x00\x00'
> > +                    targets.append((off, target_path))
> > +                node_sym_props[prop_name] =3D (bytes(masked), tuple(ta=
rgets))
> > +            self.sym_props[path] =3D node_sym_props
>
> I don't love the name 'sym_props' here, since this is recording fixups
> in the property, not symbols.  Also why store the masked property
> value here in a tuple, rather than updating self.node[path][prop_name]
> with the masked value?

Done. _apply_local_fixups() now zeros the phandle cells directly in
target_node.props[prop_name] and stores the fixups in
target_node.fixups[prop_name].


> > +
> > +
> > +def select_best_candidate(candidates, byte_len_fn):
> > +    """Choose the value that maximizes space savings across overlays.
> > +
> > +    Only candidates shared by at least two input DTBs (count > 1) are =
eligible
> > +    for inclusion in the base DTB; if every candidate value is unique =
to a
> > +    single DTB, placing one in the base DTB would yield zero net size =
savings
> > +    (adding one copy to the base DTB to save one overlay copy).
>
> Beware a wrinkle here.  dtbos have no way of deleting a property from
> the base tree.  So if *any* of the input trees is missing the
> property, it cannot go into the base tree, even if it's present and
> identical in all the others.

Right. _build_base_tree() only calls select_best_candidate() on
common_prop_names (properties that exist in all input DTBs for that node).


> > +    Args:
> > +        candidates: Iterable of candidate values (in input DTB order).
> > +        byte_len_fn: Function returning the byte cost of a candidate v=
alue in
> > +            an overlay.
>
> AFAICT select_best_candidate() is always passed the same byte_len_fn,
> so I'm not sure that it's a useful abstraction not to just it's
> behaviour in here.

Done. Inlined the byte cost calculation directly into
select_best_candidate().


> > +    Returns:
> > +        The chosen candidate value, or None if no value appears more t=
han once.
> > +    """
> > +    counts =3D Counter(candidates)
> > +    best_val =3D None
> > +    best_key =3D None
> > +    for val, count in counts.items():
> > +        if count <=3D 1:
> > +            continue
> > +        length =3D byte_len_fn(val)
> > +        # Maximize total bytes saved across overlays:
> > +        # (count - 1) * (length + 12)
>
> Where is the + 12 coming from?

Added an explanation in the docstring: each FDT property in the structure
block carries a 12-byte header (4-byte FDT_PROP tag + 4-byte length +
4-byte nameoff) in addition to its value bytes.


> > +def _find_common_nodes_and_phandles(dtbs):
> > +    """Identify common node paths and assign sequential base DTB phand=
les.
> > +
> > +    Any common node that carries a phandle in any input DTB is assigne=
d a
> > +    phandle in the base DTB so overlays never attempt to add a `phandl=
e`
> > +    property to an already-existing base DTB node (which Linux and
> > +    coreboot/depthcharge disallow).
> > +
> > +    Args:
> > +        dtbs: Sequence of `ParsedDtb` objects.
> > +
> > +    Returns:
> > +        Tuple of `(base_dtb_nodes, common_node_set, base_dtb_phandles)=
` where:
> > +        * `base_dtb_nodes`: Ordered list of node paths common to all `=
dtbs`.
>
> Does the order matter?  If not, I'd just say 'list'.
>
> > +        * `common_node_set`: Set of node paths in `base_dtb_nodes`.
>
>
> Isn't this the same information as base_dtb_nodes?
>
> > +        * `base_dtb_phandles`: Dict mapping node path to assigned inte=
ger
> > +          phandle in the base DTB.
>
> And isn't this redundant with the above.  Could we instead return a
> single dictionary: All common nodes get an entry, with 'None' as the
> value if it doesn't need the phandle, or an actual value if it does
> need a phandle.

Done. _find_common_nodes_and_phandles() now directly builds and returns
the common base_root NodeTree with each node's phandle attribute set to
its assigned base DTB phandle (or None if it doesn't need one),
eliminating the separate dicts/sets altogether.


> > +def _find_common_symbols(dtbs, common_node_set, base_dtb_phandles):
> > +    """Find symbols common to all input DTBs that point to the same ba=
se node.
> > +
> > +    Only symbols that exist in all DTBs and resolve to the same common=
 base
> > +    DTB node path are placed in the base DTB's `/__symbols__`, ensurin=
g
> > +    overlays only add new symbols and never need to overwrite existing=
 ones
> > +    (which coreboot/depthcharge merges with `upd=3D0`).
> > +
> > +    Args:
> > +        dtbs: Sequence of `ParsedDtb` objects.
> > +        common_node_set: Set of node paths present in all input DTBs.
> > +        base_dtb_phandles: Dict mapping base DTB node paths to their a=
ssigned
> > +            integer phandles.
> > +    Returns:
> > +        Tuple of `(base_dtb_symbols, path_to_base_dtb_symbol)` where:
> > +        * `base_dtb_symbols`: Dict mapping symbol label to target node=
 path.
> > +        * `path_to_base_dtb_symbol`: Dict mapping target node path to =
its
> > +          primary symbol label in `base_dtb_symbols`.
> > +    """
> > +    base_dtb_symbols =3D {}
> > +    path_to_base_dtb_symbol =3D {}
> > +
> > +    common_sym_names =3D set(dtbs[0].symbols.keys())
> > +    for d in dtbs[1:]:
> > +        common_sym_names &=3D set(d.symbols.keys())
> > +    for label in dtbs[0].symbols.keys():
> > +        if label not in common_sym_names:
> > +            continue
>
> for label in common_sym_names:
>
> would suffice and be clearer, no?

Done.


> > +        target_paths =3D {d.symbols[label] for d in dtbs}
> > +        if len(target_paths) =3D=3D 1:
>
> To avoid excessive indentation, I'd prefer if len(target_paths) !=3D 1: c=
ontinue

Done.


> > +            chosen_path =3D dtbs[0].symbols[label]
> > +            if chosen_path in common_node_set:
>
> Ditto.

Done.


> > +def _select_base_dtb_properties(dtbs, base_dtb_nodes, base_dtb_phandle=
s,
> > +                                preserve_local_fixups):
> > +    """Select the common property values to place on each node in the =
base DTB.
> > +
> > +    Args:
> > +        dtbs: Sequence of `ParsedDtb` objects with `sym_props` populat=
ed.
> > +        base_dtb_nodes: Ordered list of node paths in the base DTB.
> > +        base_dtb_phandles: Dict mapping base DTB node paths to their a=
ssigned
> > +            integer phandles.
> > +        preserve_local_fixups: Whether `/__local_fixups__` from the in=
put DTBs
> > +            must be preserved in the merged output.
> > +
> > +    Returns:
> > +        Tuple of `(base_dtb_props, base_dtb_fixup_offsets)` where:
> > +        * `base_dtb_props`: Dict mapping `path -> {prop_name: sym_val}=
` for
> > +          properties placed in the base DTB.
> > +        * `base_dtb_fixup_offsets`: Dict mapping `(path, prop_name)` t=
o a tuple
> > +          of byte offsets for the base DTB's `/__local_fixups__`.
> > +    """
> > +    base_dtb_props =3D {}
> > +    base_dtb_fixup_offsets =3D {}
> > +
> > +    for path in base_dtb_nodes:
> > +        common_prop_names =3D set(dtbs[0].nodes[path].keys())
> > +        for d in dtbs[1:]:
> > +            common_prop_names &=3D set(d.nodes[path].keys())
> > +
> > +        node_base_props =3D {}
> > +        for prop_name in dtbs[0].nodes[path].keys():
> > +            if prop_name not in common_prop_names:
> > +                continue
>
> Again for prop_name in common_prop_names: should do the job, no?

Done.


> > +
> > +            all_have_prop_fixups =3D all(
> > +                bool(d.sym_props[path][prop_name][1]) for d in dtbs
> > +            )
>
> I'm not sure why you care that all the copies of the property have
> fixups.  AFAICT all you care about is that the set of fixups is
> identical for all of them, empty or not.

Sigh, this is where me not understanding 100% of the details of overlays
bites me. Some background. I remember there being some talk a little while
ago of (perhaps) shipping device trees compiled with '-L'. That would
allow the OS to know for sure which properties represented phandles and
that could help the OS figure out device dependencies. I wanted to make
sure that running fdtfactor wouldn't break this and the OS would still
have all the information it needed even after breaking things up into
overlays and re-applying.

In order to test this, I wanted to make sure we tested re-combining the
base devicetrees and overlays and we could confirm that everything was
there. In order to make all that work, my agent added a bunch of extra
'/fragment@0/__overlay__/__local_fixups__'. ...but it turns out that was
a workaround for the fact that fdt_overlay_apply() didn't preserve
__local_fixups__ in the base. :(

I'll give a shot at adding a patch to fix that and hopefully things will
be a lot cleaner.


> > +            eligible =3D []
> > +            for d in dtbs:
> > +                sym_val =3D d.sym_props[path][prop_name]
> > +                _, targets =3D sym_val
>
> These two lines could be one with no loss of clarity.

Code is pretty different now.


> > +                if targets:
> > +                    # Overlays cannot delete a property from /__local_=
fixups__,
> > +                    # so a phandle-bearing value can only go into base=
.dtb when
> > +                    # every board also has phandle fixups on this prop=
erty.
>
> True, but more generally 1) you can't make *any* property common if it
> doesn't exist in all the inputs and 2) the fixups must be identical
> for all inputs, empty or otherwise.

With the fdt_overlay_apply() fix in place, all of this special-casing
for preserve_local_fixups is gone.


> > +                    if preserve_local_fixups and not all_have_prop_fix=
ups:
> > +                        continue
> > +                    if not all(
> > +                        t_path in base_dtb_phandles for _, t_path in t=
argets
> > +                    ):
> > +                        continue
> > +                eligible.append(sym_val)
> > +
> > +            fixup_entry_cost =3D len(path) + len(prop_name) + 28
>
> These needs an explanation of how you arrived at that formula.

Done. Documented the byte cost breakdown in select_best_candidate()'s
docstring.


> > +def _build_base_dtb(dtbs, base_dtb_nodes, base_dtb_props, base_dtb_pha=
ndles,
> > +                    base_dtb_symbols, base_dtb_fixup_offsets):
> > +    """Construct and serialize the common base DTB blob.
> > +
> > +    Args:
> > +        dtbs: Sequence of `ParsedDtb` objects.
> > +        base_dtb_nodes: Ordered list of node paths in the base DTB.
> > +        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}`.
> > +        base_dtb_phandles: Dict mapping base DTB node paths to their a=
ssigned
> > +            integer phandles.
> > +        base_dtb_symbols: Dict mapping symbol label to target node pat=
h for the
> > +            base DTB's `/__symbols__`.
> > +        base_dtb_fixup_offsets: Dict mapping `(path, prop_name)` to ph=
andle
> > +            byte offsets for the base DTB's `/__local_fixups__`.
> > +
> > +    Returns:
> > +        Serialized base DTB blob as `bytes`.
> > +    """
> > +    base_dtb_root =3D NodeTree()
>
> Using the NodeTree() representation only as an interim step to
> flattening seems odd to me.  Either use NodeTree (or something like
> it) throughout, or go directly from the internal cluster-of-maps
> representation into a flattened tree.

Done. NodeTree is now used throughout.


> > +    for path in base_dtb_nodes:
> > +        node =3D base_dtb_root.get_node(path)
> > +        for prop_name, (masked_bytes, targets) in base_dtb_props[path]=
.items():
> > +            if not targets:
> > +                node.props[prop_name] =3D masked_bytes
> > +            else:
> > +                val =3D bytearray(masked_bytes)
> > +                for off, t_path in targets:
> > +                    struct.pack_into('>I', val, off, base_dtb_phandles=
[t_path])
> > +                node.props[prop_name] =3D bytes(val)
> > +
> > +        if path in base_dtb_phandles:
> > +            ph_bytes =3D struct.pack('>I', base_dtb_phandles[path])
> > +            if any(d.has_phandle_prop[path] for d in dtbs):
> > +                node.props['phandle'] =3D ph_bytes
> > +            if any(d.has_linux_phandle_prop[path] for d in dtbs):
> > +                node.props['linux,phandle'] =3D ph_bytes
>
> I'd suggest always just using 'phandle' since that's the modern form.

Done.


> > +
> > +    if base_dtb_symbols:
> > +        sym_node =3D base_dtb_root.get_node('/__symbols__')
> > +        for label, target_path in base_dtb_symbols.items():
> > +            sym_node.props[label] =3D target_path.encode('utf-8') + b'=
\x00'
>
> Paths are not UTF-8, they're bytestrings to begin with.

No. See elsewhere.


> > +def _encode_dtbo_property(path, prop_name, sym_val, base_dtb_phandles,
> > +                          path_to_base_dtb_symbol, local_phandles, ext=
_fixups,
> > +                          ov_local_fixups):
> > +    """Encode a property value for `/fragment@0/__overlay__` and recor=
d fixups.
> > +
> > +    Args:
> > +        path: Target node path in the device tree (e.g. '/soc/i2c@4000=
').
> > +        prop_name: Property name.
> > +        sym_val: Normalized `(masked_bytes, targets)` tuple for the pr=
operty.
> > +        base_dtb_phandles: Dict mapping base DTB node paths to their p=
handles.
> > +        path_to_base_dtb_symbol: Dict mapping base DTB node paths to s=
ymbol
> > +            names in the base DTB's `/__symbols__`.
> > +        local_phandles: Dict mapping board-only node paths to overlay-=
local
> > +            phandles.
> > +        ext_fixups: Dict of `label -> [fixup_str, ...]` updated in-pla=
ce for
> > +            references to base DTB symbols.
> > +        ov_local_fixups: Dict of `(path, prop_name) -> [offset, ...]` =
updated
> > +            in-place for references to overlay-local phandles.
> > +
> > +    Returns:
> > +        Encoded property value as `bytes`.
> > +    """
> > +    masked_bytes, targets =3D sym_val
> > +    if not targets:
> > +        return masked_bytes
> > +
> > +    val =3D bytearray(masked_bytes)
> > +    for off, t_path in targets:
> > +        if t_path in base_dtb_phandles:
> > +            sym_label =3D path_to_base_dtb_symbol.get(t_path)
> > +            if sym_label is not None:
> > +                struct.pack_into('>I', val, off, 0xffffffff)
> > +                ov_path =3D (
> > +                    '/fragment@0/__overlay__'
> > +                    if path =3D=3D '/'
> > +                    else f'/fragment@0/__overlay__{path}'
> > +                )
>
> Putting everything in /fragment@0 is kind of nasty.  It would be
> preferable to search for useful places to put fragments across the
> input dtbs.  But, I'm fine if that is a later improvement, rather than
> the original version.

I added a TODO item for this. I'm a bit curious, though. In general
these overlays aren't _really_ expected to be human readable. It's
just about using overlays to make things small. As I understand it,
we won't really get any space savings by being smarter here. My
agent thinks that in a few very targeted cases we could get a
tiny space savings, but otherwise putting everything in '/fragment@0'
is actually a better solution, even if it would be ugly for someone
directly reading the overlay.


> > +                entry =3D f'{ov_path}:{prop_name}:{off}'
> > +                ext_fixups.setdefault(sym_label, []).append(entry)
> > +            else:
> > +                # Target is a common base DTB node without a symbol sh=
ared by
> > +                # all input DTBs (e.g. an anonymous &{/path} reference=
 or a
> > +                # board-specific label); use its assigned base DTB pha=
ndle.
> > +                struct.pack_into('>I', val, off, base_dtb_phandles[t_p=
ath])
>
> This creates what's arguably an invalid overlay - it assumes the value
> of a phandle in the base tree.  I'd prefer to see this case rejected
> outright.

FWIW, I'm a bit out of my league in overlay understanding here. I'm going
to be lame and paste in my AI's answer here. Sorry. :( If this makes no
sense, I'll go educate myself:

Agreed. In v2 I've removed that fallback so fdtfactor never emits an overla=
y
property with a hardcoded base-tree phandle. Instead, if a non-root node ha=
s
a phandle in some input DTB but lacks a common symbol in /__symbols__ acros=
s
all input DTBs (which actually happens in the downstream Pixel 10 trees whe=
re
two boards define /module_power_seq@2 with different label names),
_find_common_nodes_and_phandles() keeps that node out of base.dtb so each
board's .dtbo creates it with a normal overlay-local phandle and
/__local_fixups__. If the root node / itself ever had a phandle without a
common symbol and was referenced by an overlay property, fdtfactor rejects
it outright with an error.


> > +def _populate_dtbo_overlay_nodes(ov_root, dtb, common_node_set, base_d=
tb_props,
> > +                                 base_dtb_phandles, path_to_base_dtb_s=
ymbol,
> > +                                 local_phandles):
> > +    """Populate `/fragment@0/__overlay__` with board-specific nodes an=
d props.
> > +
> > +    Args:
> > +        ov_root: The `NodeTree` for `/fragment@0/__overlay__`.
> > +        dtb: The board's `ParsedDtb`.
> > +        common_node_set: Set of node paths present in the base DTB.
> > +        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}` in=
 the
> > +            base DTB.
> > +        base_dtb_phandles: Dict mapping base DTB node paths to their p=
handles.
> > +        path_to_base_dtb_symbol: Dict mapping base DTB node paths to s=
ymbol
> > +            names in the base DTB's `/__symbols__`.
> > +        local_phandles: Dict mapping board-only node paths to overlay-=
local
> > +            phandles.
> > +
> > +    Returns:
> > +        Tuple of `(ext_fixups, ov_local_fixups)` collected across all =
overlay
> > +        properties.
> > +    """
> > +    ext_fixups =3D {}
> > +    ov_local_fixups =3D {}
> > +
> > +    for path, props in dtb.nodes.items():
> > +        in_base_dtb =3D path in common_node_set
> > +        base_node_props =3D base_dtb_props.get(path, {})
> > +
> > +        diff_props =3D [
> > +            (prop_name, dtb.sym_props[path][prop_name])
> > +            for prop_name in props.keys()
> > +            if (not in_base_dtb or
> > +                base_node_props.get(prop_name) !=3D
> > +                dtb.sym_props[path][prop_name])
> > +        ]
> > +
> > +        if not in_base_dtb or diff_props:
>
> diff_props is necessarily empty if not in_base_dtb, so the first term
> is redundant.

Actually, a board-only node (not in_base_dtb) might have no properties of
its own (e.g. an empty container node or one that only has subnodes), in
which case diff_props is empty but we still need to create the node in the
overlay.


> > +            ov_node =3D ov_root.get_node(path)
> > +            for prop_name, sym_val in diff_props:
> > +                ov_node.props[prop_name] =3D _encode_dtbo_property(
> > +                    path, prop_name, sym_val, base_dtb_phandles,
> > +                    path_to_base_dtb_symbol, local_phandles, ext_fixup=
s,
> > +                    ov_local_fixups,
> > +                )
> > +
> > +            if path in local_phandles:
> > +                ph_bytes =3D struct.pack('>I', local_phandles[path])
> > +                if dtb.has_phandle_prop[path]:
> > +                    ov_node.props['phandle'] =3D ph_bytes
> > +                if dtb.has_linux_phandle_prop[path]:
> > +                    ov_node.props['linux,phandle'] =3D ph_bytes
>
> Again, I'd suggest just standardising on the modern 'phandle'.

Done.


> > +    return ext_fixups, ov_local_fixups
> > +
> > +
> > +def _populate_dtbo_metadata(dtbo_root, ov_root, dtb, base_dtb_symbols,
> > +                            base_dtb_fixup_offsets, ext_fixups,
> > +                            ov_local_fixups, preserve_local_fixups):
> > +    """Populate `/__symbols__`, `/__fixups__`, and `/__local_fixups__`=
 on DTBO.
> > +
> > +    Args:
> > +        dtbo_root: Root `NodeTree` of the `.dtbo` overlay.
> > +        ov_root: The `NodeTree` for `/fragment@0/__overlay__`.
> > +        dtb: The board's `ParsedDtb`.
> > +        base_dtb_symbols: Dict of symbols already present in the base =
DTB.
> > +        base_dtb_fixup_offsets: Dict of `/__local_fixups__` offsets al=
ready
> > +            present in the base DTB.
> > +        ext_fixups: Dict of `label -> [fixup_str, ...]` referencing ba=
se DTB
> > +            symbols.
> > +        ov_local_fixups: Dict of `(path, prop_name) -> [offset, ...]`
> > +            referencing overlay-local phandles.
> > +        preserve_local_fixups: Whether to emit differing input
> > +            `/__local_fixups__` entries into
> > +            `/fragment@0/__overlay__/__local_fixups__`.
>
> That's not right.  The overlay should only have a global
> /__local_fixups__, there shouldn't be __local_fixups__ for individual
> fragments.

See above where I talk about fdt_overlay_apply() behavior. Gone for v2.


> > +    """
> > +    # If preserving input /__local_fixups__ in the merged tree, place =
any
> > +    # differing fixup offset lists under
> > +    # /fragment@0/__overlay__/__local_fixups__
> > +    if preserve_local_fixups:
> > +        for (path, prop_name), offs in dtb.local_fixups.items():
> > +            if base_dtb_fixup_offsets.get((path, prop_name)) !=3D offs=
:
> > +                merged_lf_root =3D ov_root.get_node('/__local_fixups__=
')
> > +                merged_lf_node =3D merged_lf_root.get_node(path)
> > +                merged_lf_node.props[prop_name] =3D struct.pack(
> > +                    f'>{len(offs)}I', *offs
> > +                )
> > +
> > +    # Emit overlay root /__symbols__ for new or modified symbols
> > +    diff_syms =3D [
> > +        (label, t_path)
> > +        for label, t_path in dtb.symbols.items()
> > +        if base_dtb_symbols.get(label) !=3D t_path
> > +    ]
> > +    if diff_syms:
> > +        sym_node =3D dtbo_root.get_node('/__symbols__')
> > +        for label, t_path in diff_syms:
> > +            # Ensure target node exists in __overlay__ so dtc -I dtb -=
O dts
> > +            # on the standalone .dtbo does not warn about a missing no=
de.
> > +            ov_root.get_node(t_path)
> > +            ov_target =3D (
> > +                '/fragment@0/__overlay__'
> > +                if t_path =3D=3D '/'
> > +                else f'/fragment@0/__overlay__{t_path}'
>
> These path =3D=3D '/' special cases appear in a bunch of places.  I think
> you could avoid them all with some tweaks to your conventions about
> paths (e.g. always keep them as relative paths to the root, allowing
> '').

Done. Normalized paths now use '' for the root node and '/...' for
subnodes, eliminating the path =3D=3D '/' special cases.


> > +            )
> > +            sym_node.props[label] =3D ov_target.encode('utf-8') + b'\x=
00'
>
> Neither property names nor property values were every Unicode.

See above regarding pylibfdt's string conventions (this now uses
NodeTree.set_str()).


> > +def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> > +                         strip_local_fixups):
> > +    """Apply `dtbo_blob` to `base_dtb_blob` and verify it matches `ori=
g_dtb`.
> > +
> > +    Args:
> > +        orig_dtb: The original `ParsedDtb` instance for the board.
> > +        base_dtb_blob: Uncompressed base DTB binary as `bytes`.
> > +        dtbo_blob: Uncompressed board `.dtbo` overlay binary as `bytes=
`.
> > +        strip_local_fixups: Whether `/__local_fixups__` was stripped.
> > +
> > +    Raises:
> > +        RuntimeError: If `fdt_overlay_apply()` fails or any node, prop=
erty,
> > +            phandle, symbol, or header field in the merged DTB differs=
 from
> > +            `orig_dtb`.
> > +    """
> > +    merged_fdt =3D libfdt.Fdt(base_dtb_blob)
> > +    merged_fdt.resize(len(base_dtb_blob) + len(dtbo_blob) * 2 + 65536)
> > +    fdto =3D bytearray(dtbo_blob)
> > +    err =3D libfdt.fdt_overlay_apply(merged_fdt._fdt, fdto)
>
> We should probably make a method wrapper for that in libfdt.Fdt.

verify_recreated_dtb() is gone now (replaced by fdtoverlay +
dtbs_equal_unordered in tests/run_tests.sh), so fdtfactor no longer calls
fdt_overlay_apply() from Python.


> > +    if err !=3D 0:
> > +        raise RuntimeError(
> > +            f'{orig_dtb.filename}: fdt_overlay_apply failed with error=
 {err} '
> > +            f'({libfdt.strerror(err)})'
> > +        )
> > +    merged_fdt.pack()
> > +    recreated =3D ParsedDtb(
> > +        f'{orig_dtb.filename} (recreated)', bytes(merged_fdt.as_bytear=
ray())
> > +    )
> > +    if strip_local_fixups:
> > +        if recreated.has_local_fixups:
> > +            raise RuntimeError(
> > +                f'{orig_dtb.filename}: /__local_fixups__ present despi=
te '
> > +                f'--strip-local-fixups'
> > +            )
> > +        recreated.local_fixups =3D orig_dtb.local_fixups
> > +    else:
> > +        if orig_dtb.local_fixups !=3D recreated.local_fixups:
> > +            raise RuntimeError(
> > +                f'{orig_dtb.filename}: /__local_fixups__ mismatch'
> > +            )
> > +
> > +    recreated.build_symbolic_props()
> > +
> > +    if set(orig_dtb.nodes.keys()) !=3D set(recreated.nodes.keys()):
> > +        missing =3D set(orig_dtb.nodes.keys()) - set(recreated.nodes.k=
eys())
> > +        extra =3D set(recreated.nodes.keys()) - set(orig_dtb.nodes.key=
s())
> > +        raise RuntimeError(
> > +            f'{orig_dtb.filename}: node mismatch (missing=3D{missing},=
 '
> > +            f'extra=3D{extra})'
> > +        )
> > +
> > +    for path in orig_dtb.nodes.keys():
> > +        if orig_dtb.sym_props[path] !=3D recreated.sym_props[path]:
> > +            for p in (set(orig_dtb.sym_props[path]) |
> > +                      set(recreated.sym_props[path])):
> > +                if (orig_dtb.sym_props[path].get(p) !=3D
> > +                        recreated.sym_props[path].get(p)):
> > +                    raise RuntimeError(
> > +                        f'{orig_dtb.filename}: property mismatch at {p=
ath}:{p}'
> > +                    )
> > +        # Common base nodes may gain a phandle if another board refere=
nced them.
> > +        if (orig_dtb.has_phandle_prop[path] and
> > +                not recreated.has_phandle_prop[path]):
> > +            raise RuntimeError(
> > +                f'{orig_dtb.filename}: missing phandle at {path}'
> > +            )
> > +        if (orig_dtb.has_linux_phandle_prop[path] and
> > +                not recreated.has_linux_phandle_prop[path]):
> > +            raise RuntimeError(
> > +                f'{orig_dtb.filename}: missing linux,phandle at {path}=
'
> > +            )
> > +
> > +    if orig_dtb.symbols !=3D recreated.symbols:
> > +        raise RuntimeError(f'{orig_dtb.filename}: /__symbols__ mismatc=
h')
> > +    if orig_dtb.boot_cpuid_phys !=3D recreated.boot_cpuid_phys:
> > +        raise RuntimeError(
> > +            f'{orig_dtb.filename}: boot_cpuid_phys mismatch '
> > +            f'({orig_dtb.boot_cpuid_phys} !=3D {recreated.boot_cpuid_p=
hys})'
> > +        )
> > +    if orig_dtb.mem_rsv !=3D recreated.mem_rsv:
> > +        raise RuntimeError(
> > +            f'{orig_dtb.filename}: /memreserve/ mismatch '
> > +            f'({orig_dtb.mem_rsv} !=3D {recreated.mem_rsv})'
> > +        )
>
> Open coding the tree comparison when we already have
> dtbs_equal_unordered is not ideal.

Removed verify_recreated_dtb() and switched the test suite to use
dtbs_equal_unordered.


> > diff --git a/tests/fdtfactor_board1.dts b/tests/fdtfactor_board1.dts
> > new file mode 100644
> > index 000000000000..cab6b3a4a3cd
> > --- /dev/null
> > +++ b/tests/fdtfactor_board1.dts
> > @@ -0,0 +1,69 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/dts-v1/;
>
> fdt testcases generally try to be minimal.  So, I'd suggest using a
> contrived tree along the lines of test_tree1.dts, rather than a
> realistic board tree like this one.  It does need an example of all
> the cases that should be fixed up, of course.

Done. Replaced the test .dts files with minimal contrived trees modeled on
test_tree1.dts.


> > @@ -239,6 +239,21 @@ run_fdtoverlay_test() {
> >      base_run_test sh "$SRCDIR/fdtoverlay-runtest.sh" "$expect" "$@"
> >  }
> >
> > +# Compare an original .dtb and a recreated .dtb by decompiling and sor=
ting both
> > +# with dtc -I dtb -O dts -qq -f -s (like dtdiff) and normalizing the n=
umeric
> > +# phandle properties assigned to target nodes. Because both blobs cont=
ain
> > +# /__symbols__ and /__local_fixups__, dtc restores all node labels and=
 converts
> > +# all phandle references in properties back into symbolic <&label> ref=
erences.
> > +check_dtb_recreated () {
> > +    orig=3D"$1"
> > +    recreated=3D"$2"
> > +    $DTC -I dtb -O dts -qq -f -s -o "$orig.raw.test.dts" "$orig" || re=
turn 1
> > +    $DTC -I dtb -O dts -qq -f -s -o "$recreated.raw.test.dts" "$recrea=
ted" || return 1
> > +    sed 's/phandle =3D <0x[0-9a-f]*>;/phandle =3D <0xffffffff>;/' "$or=
ig.raw.test.dts" > "$orig.cmp.test.dts" || return 1
> > +    sed 's/phandle =3D <0x[0-9a-f]*>;/phandle =3D <0xffffffff>;/' "$re=
created.raw.test.dts" > "$recreated.cmp.test.dts" || return 1
> > +    diff -u "$orig.cmp.test.dts" "$recreated.cmp.test.dts"
>
> I dislike tests comparing dts in general, since it's a highly
> non-unique representation.  I much prefer to use the
> dtbs_equal_ordered and dtbs_equal_unordered helpers.

Done. Removed check_dtb_recreated() and switched the tests to use
dtbs_equal_unordered.


> > +}
> > +
> >  BAD_FIXUP_TREES=3D"bad_index \
> >               empty \
> >               empty_index \
> > @@ -1089,6 +1104,50 @@ fdtoverlay_tests() {
> >
> >      shorten_echo "check phandle to noda d wasn't overwritten:        "
> >      run_wrap_test test "$bd" =3D "$pd"
>
> I think it would be preferable to create a new group of tests for
> fdtdactor, rather than lumping them in with fdtoverlay.

Done.
