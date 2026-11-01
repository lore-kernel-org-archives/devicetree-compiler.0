Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571045;
	b=po2tnxA4SPw71PgVVBTgBKpYxJa0m7Js8UpIJBOJViGgL0PpSyxeUhOQdt7E3dwqq9nP
	 JSVjLsS59d1e8blezSGD9sJFIcSRFtsoFSW8dUOvqHxq/tkOtYJhabrhEeJOVOa00zYfo
	 fo9N69Bn/qiB2rEnvJ74gHhb4351jHfK5r6j8zLETwMj0Q6ZG1PxBQQdpRopKjfuJQGz9
	 ySbQLOgmsN+6N9h+KjtFwwSzwRrS+Xb680jZeVdgXIZ/KZB2B8nJ6viWqWBdf3cXMELlL
	 mgjSixZYiVansgTRhzrr/AN068MlA9ldDcoPz1hTbBrlGbQTSt8NNp9HkVgeodpqfqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9K0wtmHYex3tFk4OFUkhwCzGKrgTqNTBSe+bLpdnXcU=;
	b=16y1qzyvCvDkHRcKLFyZg/CorkeAuL67uXh7P2l0Wh8S8AGTIMp950P5eqKyYtMwbI2v
	 NSBFe5z5vbJAi7dN1JPHjhHkK20PSutoaCNnvrx00P3RXPlsaUaZIjhJAeUqujGh1AgId
	 9sr/3VRsNoCCH5NizatTJpeoQ/qLXz2jqtDchKdj4zJH0j4w9ND61EDU8iGBmL8bHxIPK
	 wOO0mNc+Bf7IwKqhs/Z2zQzGhgGiX7qJ9tmnjbQVjRAm3bmokbG/LI7Iv2BcbRShQpuDN
	 OPi02gbtZn8UE/mHl91P1cH0dR/4WxYHWCc9WSDFJ93WaU9K/EJ2bIKzbE6ik7Kh5+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RYjKtlLl;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D24606A32C
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D24606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RYjKtlLl
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so3043653a12.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571043; x=1794175843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9K0wtmHYex3tFk4OFUkhwCzGKrgTqNTBSe+bLpdnXcU=;
        b=RYjKtlLlRLrBnR3VBLbcT0OrsA/0m3Do8qf9AvnVZXZcRetfa3apcKp3JFEHtXjuzR
         uMzinIdU/4EO7clRrjkro/RWpAMXCAHe8xIsDw98aWY62IYU4PDL+U/uPtmv32meMlSL
         qPkyGywkR/vUZvtJoAUIr0rBFJo67bKTt60fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571043; x=1794175843;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9K0wtmHYex3tFk4OFUkhwCzGKrgTqNTBSe+bLpdnXcU=;
        b=IRK8PYKEPCnxOuhRC/mIrTH65zpEPnPj2EmZrr1YT52XWD/Akx9OAGO+ZxeqCYEP9q
         yb3/g7OT3shlUYNxQFQU47uThJbhsPbt4HRbSQbALkMcovsJ+Kk233haBu2MU5VsSWI8
         qp2nzQUacD/WUR3g+49lqIF6gMCgxexP7rulHc1HyWf6ZCfzb3cP3Sqhi9pTM3zH5f7T
         HBrxxuZgiZ/j2+A6Ho7yrVQgnAgVcWp6Wtro4E1jhTlp75zcvERWPz8dYrspB0tJ/t3T
         xP5XJGsSfQ/wlywa9Ip8WLNqRT+4cXmFNxtQ32WxEspK5MyvLw20lZtRoEIrkL7WZxKy
         c0Dw==
X-Gm-Message-State: APuU4Z8lqgH+PmVTUeS6LNxxAbLlWtgeSw9tjZIIDPFAk+CaghQPgq5q
	oJnCvZcc9QEIqKaq/9fR7BiNwnLesUPIhlblXfJgaMoMVHZaHKZS9zi0Ajjxk0VYzyPSmRRo2HS
	hsVIJv6vb
X-Gm-Gg: AYBFou18Rw4E5USoiTt0ixIZJ/WR1toY16deq6MPmgH23lSnocUHPQ9QceDRcTamIQZ
	OyzL/21Vr5Y8vTZuKyR41e8Pw42wwpJPu8Rx23Sa732EcFPKOfCUSlCCFPJZ35pMCiU1dY0qcxy
	DZnEp+9bo+fwCRrGbnU/wCd/TR+KCpu/PhBVsd9md5m63H2El0I2/FtozjZVL6QT3oHWXXJnPuK
	yt6bIhU8zZmrpEg7rxe6N+qx3D7qBaWCz/oSt+p8EQm6A9q9/Knclb2nQk3/ILOUuYYJ6Ppofq1
	tWgsTo23eHsNv4MA/FZYJ5RqUY3qOaMfoOkW2vivGbEsaNqFvBZUvwPKo8IUKtwUijn6kdA3HmD
	jI4Owq0y2ef8HqoFn+3R74WvtjpaQW3c10u3fPhwblRdbIQrqHRWgWmy3RwJe4QjYZ2DNaGx/9I
	zuj4XiUYIoQWyzAXfGi7ibyjoX1eMvdHHkOYmWc4/V33J9B0HhVKo1WGFPEvKsi1Kmn1M9EPDyw
	bpwQzxBO70CA/HLGdXU+fvvcOs8pFsCyxrrMDuGr6FS82MmTsvCo2uXlF9uvbob2fX6HZKZPWVN
	OMmJP/0wDW9asPJoKTfThuk+r5S+qZeipS5BIYRbsfPolzS8P76FNKqOsZIqMBkxBByLCwZmNp1
	yNPWVMrDoS+RC
X-Received: by 2002:a05:6402:4505:b0:6b4:8d16:f026 with SMTP id 4fb4d7f45d1cf-6b4d3391cd5mr5583366a12.1.1793571043064;
        Sun, 01 Nov 2026 14:10:43 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcaecsm2483338a12.17.2026.11.01.14.10.42
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:10:42 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19953495e9.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:10:42 -0800 (PST)
X-Received: by 2002:a05:6000:2313:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-48e6e30ba6fmr19894457f8f.24.1793570726049; Sun, 01 Nov 2026
 14:05:26 -0800 (PST)
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
 <20261028215600.1713475-7-dianders@chromium.org> <CAFLszThT8vt_C+UCbDXO=Yxx=zK04g+6efRb+Ji5MLyj53UCvA@mail.gmail.com>
In-Reply-To: <CAFLszThT8vt_C+UCbDXO=Yxx=zK04g+6efRb+Ji5MLyj53UCvA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XfViXvWVKvpe6vOz6fzMXiD41RzA3ZWC8EbO5exn2ufQ@mail.gmail.com>
X-Gm-Features: AclHuK-LSNoloh3coeDpSRk0j_N6fw2KWjrShe5MdUIGe_-PL_vPdD6U_o-QLmU
Message-ID: <CAD=FV=XfViXvWVKvpe6vOz6fzMXiD41RzA3ZWC8EbO5exn2ufQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > When `fdt_overlay_apply()` merges an overlay into a base device tree, i=
t
> > updates `/__symbols__` in the base tree if present, but previously left
> > the base tree's `/__local_fixups__` node untouched.
>
> Please can you put the motivation first and use the present tense
> ('fdt_overlay_apply() updates /__symbols__ but leaves
> /__local_fixups__ untouched...')? It would also help to say why anyone
> needs an accurate /__local_fixups__ in the merged tree. Patch 8 gives
> the reason (an OS that wants to know which cells hold phandles, and
> the merged tree matching what 'dtc -L' produces), and that belongs
> here, since this patch changes behaviour for every libfdt user.

Done. Rewrote the commit message in the present tense with the motivation
up front.


> > +             next_lf =3D fdt_subnode_offset_namelen(fdt, node, name, n=
amelen);
> > +             if (next_lf =3D=3D -FDT_ERR_NOTFOUND && create) {
> > +                     char namebuf[256];
> > +                     int old_struct_size =3D fdt_size_dt_struct(fdt);
> > +
> > +                     if ((size_t)namelen >=3D sizeof(namebuf))
> > +                             return -FDT_ERR_INTERNAL;
> > +                     memcpy(namebuf, name, namelen);
> > +                     next_lf =3D fdt_add_subnode_namelen(fdt, node, na=
mebuf,
> > +                                                       namelen);
> > +                     if (next_lf < 0)
> > +                             return next_lf;
> > +                     if (next_lf <=3D ancestor) {
> > +                             int delta =3D fdt_size_dt_struct(fdt) -
> > +                                         old_struct_size;
> > +                             target +=3D delta;
> > +                             ancestor +=3D delta;
> > +                     }
>
> I can see why the copy is needed, since the name is in the same blob
> and fdt_add_subnode_namelen() may move it. But libfdt has no limit on
> node-name length, so a valid tree with a long name makes
> fdt_overlay_apply() fail with -FDT_ERR_INTERNAL, which is meant for
> libfdt bugs. It also puts 256 bytes on the stack in code that runs in
> bootloaders. Please can you either avoid the copy (e.g. by re-reading
> the name after the splice, adjusted by the delta) or at least return a
> proper error code and document the limit?

Done! Removed `namebuf[256]` completely and instead re-read `name` from
`ancestor` (adjusted by `delta`) after `fdt_add_subnode_namelen()` when
`next_lf <=3D ancestor`.


> > +static int overlay_add_local_fixup_offset(void *fdt, int lf_node,
> > +                                       const char *name, int name_len,
> > +                                       uint32_t poffset)
> > +{
> ...
> > +     } else {
> > +             if (old_len % sizeof(uint32_t))
> > +                     return -FDT_ERR_BADSTRUCTURE;
>
> -FDT_ERR_BADSTRUCTURE means the structure block is corrupt. Elsewhere
> in this file (e.g. overlay_symbol_update()) a badly sized property
> value gives -FDT_ERR_BADVALUE, and if the property came from the
> overlay's /__local_fixups__, -FDT_ERR_BADOVERLAY fits better.

Done. Changed this to return `-FDT_ERR_BADVALUE`.


> > +static int overlay_validate_local_fixups(const void *fdto, int ov_lf_r=
oot)
> > +{
> > +     int lf_frag;
> > +
> > +     fdt_for_each_subnode(lf_frag, fdto, ov_lf_root) {
> > +             const char *frag_name;
> > +             int frag_name_len, lf_overlay, fragment;
> > +
> > +             frag_name =3D fdt_get_name(fdto, lf_frag, &frag_name_len)=
;
> > +             if (!frag_name)
> > +                     return frag_name_len;
> > +
> > +             lf_overlay =3D fdt_subnode_offset(fdto, lf_frag, "__overl=
ay__");
> > +             if (lf_overlay =3D=3D -FDT_ERR_NOTFOUND)
> > +                     continue;
> > +             if (lf_overlay < 0)
> > +                     return lf_overlay;
> > +
> > +             fragment =3D fdt_subnode_offset_namelen(fdto, 0, frag_nam=
e,
> > +                                                   frag_name_len);
> > +             if (fragment < 0)
> > +                     return -FDT_ERR_BADOVERLAY;
> > +
> > +             if (fdt_subnode_offset(fdto, fragment, "__overlay__") < 0=
)
> > +                     return -FDT_ERR_BADOVERLAY;
> > +     }
> > +
> > +     return 0;
> > +}
>
> Just to check, is this needed? overlay_update_local_references()
> already walks the overlay's /__local_fixups__ against the overlay tree
> from the root, returning -FDT_ERR_BADOVERLAY if a node is missing. So
> by this point each /__local_fixups__/<frag>/__overlay__ is known to
> have a matching /<frag>/__overlay__ in fdto. If I have that right,
> this function and its call can go, which also helps with the size
> issue below.

You're right, `overlay_update_local_references()` has already walked and
validated `/__local_fixups__` against `fdto` before
`overlay_local_fixups_update()`
is called. I've dropped `overlay_validate_local_fixups()` (and also inlined
the single-caller `overlay_fragment_local_fixups_src()` and
`overlay_merge_fixup_into_local_fixups()` helpers).


> > @@ -1771,6 +1771,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
> >         ret =3D overlay_symbol_update(fdt, fdto);
> >         if (ret)
> >                 goto err;
> >
> > +       ret =3D overlay_local_fixups_update(fdt, fdto);
> > +       if (ret)
> > +               goto err;
> > +
>
> One thing I'd like to check before this goes in.. this changes what an
> exported function does. A base with /__local_fixups__ now needs more
> free space (so it can hit -FDT_ERR_NOSPACE where it did not before),
> and unrelated empty nodes under /__local_fixups__ get pruned. Please
> can you update the fdt_overlay_apply() comment in libfdt.h to describe
> the new behaviour?
>
> Code size is also worth a look. With -Os, the fdt_overlay.c text grows
> from 3040 to 4904 bytes on Thumb-2 and from 4770 to 7983 on x86_64,
> about 60%. That code goes into things like U-Boot SPL, mostly for
> boards whose base has no /__local_fixups__ at all. Could this be made
> optional for size-sensitive users, or at least slimmed down? What do
> you think?

I've updated the `fdt_overlay_apply()` doc comment in `libfdt/libfdt.h`,
slimmed down the implementation as noted above, and gated `/__local_fixups_=
_`
handling in `fdt_overlay_apply()` behind a 3-state compile-time
`FDT_OVERLAY_LOCAL_FIXUPS` option in `libfdt/libfdt_internal.h`:

- `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
  untouched. I made this the `#ifndef` fallback in `libfdt_internal.h` so
  that embedded projects (like U-Boot SPL) that compile `libfdt/*.c`
  directly get zero code-size increase and zero behavior change unless they
  opt in.
- `1` (`FDT_OVERLAY_LOCAL_FIXUPS_STRIP`): Delete `/__local_fixups__` from
  the base DTB if present (~50 bytes of code), avoiding leaving a stale or
  incomplete `/__local_fixups__` node in the merged DTB.
- `2` (`FDT_OVERLAY_LOCAL_FIXUPS_UPDATE`): Fully update `/__local_fixups__`
  in the base DTB. This is enabled by default in `dtc`'s Meson
  (`-Doverlay-local-fixups=3D2`) and Make (`OVERLAY_LOCAL_FIXUPS=3D2`) buil=
ds
  for desktop tools and tests.

Let me know if that works well for you or if you'd prefer a different
default!


-Doug
