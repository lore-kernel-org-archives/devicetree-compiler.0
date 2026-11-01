Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571164;
	b=XEwuyXaVMdvs+G0nQG2VUFlSZrN+bRcay5mkCzVlE7lHFrphUFa5CbOz3gyMR0z+/aK9
	 U6uFKFiiSMj2mSo3WP4Is+R7y83zwx4fJpPIZKDi4mFPL/cz7vq+6oaFEjIps+LcfMP3j
	 ygaWMLCO7ERS0srEGLEM7UgmyUDNLuCjPv82O9L1qoxGGuPWRFgsj0X6UxLXopCIZusPf
	 4FlIZIfVLhW7bBie1U84GNteC161my/NvLgdkEeglsqYngbm6kCFwYPZEZiMusRYMutjP
	 lNxMBeKOpMwX74u5GVkk+vBXCKiEm9stOy4eYAPieiKgrxu7AV5FoCwvGpoYuYicOpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=c5dfra6mnkj3XXcKxeo1MNyxkDUwNUZ/PcTct9GIh04=;
	b=PAr4Cy9/vQYWMGgH9pmSIqgp7jbXSVWWzVZ8gCbOJxF05AfVD8YNWqOI4+JtXXLppSGH
	 SYrxxXvzWoVzSAt4lJhGxFLryfEPcCFrh/doaAKpGoto7KT6hy0ucNdcAZsXyRCqiP+e9
	 1o3/NOkcLshPS3jNVEV7KLse42xrsKz7jzfg6zVglp93KZ+ygs5OjkETcwe+TQ4F66bcq
	 92J9b1DuxSmOIv/3ItZ8Q+cFI4aGmHS11Fvs+mRr/U18c7nYrd+k2+K75LEpWnVytUwFO
	 lnDCTZQcCYMTJKH+CLZYhZDrKus1qIQr6lAqyEgyNiEFshHhxCqYO/45bihlwphLsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OPoR9tV5;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C206606A327
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C206606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OPoR9tV5
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2692118e87.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571162; x=1794175962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5dfra6mnkj3XXcKxeo1MNyxkDUwNUZ/PcTct9GIh04=;
        b=OPoR9tV5n5IARyL1CovGpfKo3fc5h/wzsz3ZwZ+GyPcvOpBn6tMCoNFtBnq7WpwghW
         21pJUSB7uR+OqW4Hn7hvjDFCa/bCN1n2hMS0xkZ4UJtHLE0OsFxlxCDKfAKBnOMZsnV7
         HZWAhPKjVefR9Ln0OAjoNT4hmSO0646eS01/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571162; x=1794175962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5dfra6mnkj3XXcKxeo1MNyxkDUwNUZ/PcTct9GIh04=;
        b=tdybCr3vT9grcp5zh49zH80X62BDHGQ8qQZy0sOhl5Y2InK0lIDBYWA5pw2M4nV3Lc
         /dGvrKWtPh5teRWbPzsFgxkkag7r29eB0KdPNn4sosrQ50iPZFrSzTtctG+fImV/SXin
         AJH701CTl0S0xE7YOUpwS92PWASq4oQosId2T4oWtLJTVib8UXCw6KOoV+g/9zN62qZY
         HH6oRVT+JB3jrmQcBq28edgTNFFTo65qASfLpqDP8jzNwIbwESSZVKZVlF31v16OnlRA
         lPz8MOeKaaLtQLQC24hVizKB3OslattLMGLcblSP6ojLecX/oHI4oTGNi+9zB5htkUMu
         jlig==
X-Gm-Message-State: APuU4Z/cw1jHMIz5mVki0Q7dPnvGbwh3wnYRmjsJSH3fi2eWfxohebBO
	J+VFL4BXhMIM5mxBBNJlFuf1fcF11YKU8CPIwkaFxCW/lVCfTkzCxg5vnepqsX55txZrMur/IFO
	/oiA0Zsv/
X-Gm-Gg: AYBFou13UIXdp5yDsvoJOBojNjDDtpcyFwmvAq4kJWWVCYrh/HsoJZjLQGXleu1vv55
	58LGLxPW+JXmcVljG6nGIOPrpiaWbYfJjSwPxSrhpBcauJOofWY8le8DAEmGRHo3shw7TbsCr9j
	vtFuUl5ahqLcAoHUOq2GFERqi6Mlq8oNj8bud8geXJOLGLi24ZowdXGrPv15vNqlmkZB/EcCR/Z
	DHvDu4IVlmIMc0ZsUyXCrh+ZWR7veyKyyOO4ZdLKe9K52LcyKCMXQWIskyo4+RgaqHkCf/m55VZ
	ajLOucz3Xdqm20GioNaDK3hud7RQNv4t2qeox79i9k8UWoM/CgueJ+RTk9fRPYJ86c6/voyQbd8
	C70eVqGBz5bGOq5v9PJKmerAHLCqNfTGHFk6hjes5qLyJB0NWMOxkpFs/T4/dpraxKvz34FSMoJ
	Voq/jhLzcr6EbnHwYi5rq5/O8Qeo7VJ1y4gHDjPRxZoQSXB5lpZega2z8wmvcq1Sks1sZyfg4/g
	F4y614dmOyFdfcQZk23Rxkh0gw5gbpv3n7WAm8DUo4+WtzO34zLmGHkyyF3+UftolYArM3slQ72
	IQAZi2aTAVnFJsn35vowDJePhi2VpUVMsdoIx4Zia0M/PyCYywZIkFCvMVpiluY0UrA=
X-Received: by 2002:a05:6512:3044:b0:5bf:b22d:bf30 with SMTP id 2adb3069b0e04-5bfd9562320mr2519802e87.11.1793571162175;
        Sun, 01 Nov 2026 14:12:42 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04ee20dsm1300845e87.3.2026.11.01.14.12.42
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:12:42 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2692108e87.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:12:42 -0800 (PST)
X-Received: by 2002:a05:6000:2c0f:b0:48b:68:594a with SMTP id
 ffacd0b85a97d-48e6e2e7798mr18180529f8f.12.1793570721533; Sun, 01 Nov 2026
 14:05:21 -0800 (PST)
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
 <20261028215600.1713475-7-dianders@chromium.org> <auR-OXOpim7dVTpH@gractus.seuss>
In-Reply-To: <auR-OXOpim7dVTpH@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WLMKquyc_j+gwF5Oz028=yddiq83o2tSCBWcJgTDs8xw@mail.gmail.com>
X-Gm-Features: AclHuK9b_8waCxraHHPdtbLhS5x_dJgluJUdAHgQfu4VL-m5sl2trg3HRikQmXo
Message-ID: <CAD=FV=WLMKquyc_j+gwF5Oz028=yddiq83o2tSCBWcJgTDs8xw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
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

On Fri, Oct 30, 2026 at 3:24=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:56PM -0700, Douglas Anderson wrote:
> > When `fdt_overlay_apply()` merges an overlay into a base device tree, i=
t
> > updates `/__symbols__` in the base tree if present, but previously left
> > the base tree's `/__local_fixups__` node untouched.
> >
> > Add `overlay_local_fixups_update()` so that when the base tree contains
> > a `/__local_fixups__` node, `fdt_overlay_apply()` updates it to reflect
> > the applied overlay:
> > - For each fragment in application order, any local fixup properties in
> >   the base tree's `/__local_fixups__` that correspond to properties
> >   overwritten by that fragment are cleared first.
> > - Local phandle references from that fragment's subtree under the
> >   overlay's `/__local_fixups__/<fragment>/__overlay__` are merged into
> >   the corresponding target path under the base tree's
> >   `/__local_fixups__`.
> > - External phandle references for that fragment from the overlay's
> >   `/__fixups__` (which are now resolved to local phandles in the merged
> >   base tree) are added in sorted order to the base tree's
> >   `/__local_fixups__`.
> > - Any subnodes under the base tree's `/__local_fixups__` that become
> >   empty after clearing overwritten properties are pruned.
> >
> > If the base tree does not have a `/__local_fixups__` node, nothing is
> > added.
>
> So, this turned out to be substantially more involved than I realised.
> I wonder if it might be better to make --strip-locals the default, and
> only add support for preserving the local fixups as a later extension.

In v3 I went ahead and addressed all of your and Simon's review comments on
this patch (which also trimmed ~80 lines of C from `fdt_overlay.c`).

To address Simon's point about code size in constrained environments like
U-Boot SPL, I also gated `/__local_fixups__` handling in
`fdt_overlay_apply()` behind a 3-state compile-time
`FDT_OVERLAY_LOCAL_FIXUPS` option in `libfdt/libfdt_internal.h`:

- `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
  untouched. I made this the `#ifndef` fallback in `libfdt_internal.h` so
  that embedded projects that vendor `libfdt` directly get zero code-size
  increase and zero behavior change unless they opt in.
- `1` (`FDT_OVERLAY_LOCAL_FIXUPS_STRIP`): Delete `/__local_fixups__` from
  the base DTB if present (~50 bytes of code), so a stale/half-working
  `/__local_fixups__` node isn't left behind in the merged tree.
- `2` (`FDT_OVERLAY_LOCAL_FIXUPS_UPDATE`): Fully update `/__local_fixups__`
  in the base DTB. This is enabled by default in `dtc`'s Meson
  (`-Doverlay-local-fixups=3D2`) and Make (`OVERLAY_LOCAL_FIXUPS=3D2`) buil=
ds
  for desktop tools and tests.

Even when `fdtfactor -S` is used, we actually do need `fdtoverlay` to
update `/__local_fixups__` for two reasons:

1. **Kernel composite DTBs (`foo-dtbs :=3D base.dtb bar.dtbo`)**: In the
   Linux kernel build (`scripts/Makefile.dtbs`), many upstream boards are
   built as composite DTBs using `cmd_fdtoverlay` (`fdtoverlay -i base.dtb
   -o foo.dtb bar.dtbo`) *before* `fdtfactor` runs on them. As Simon
   pointed out on the kernel series [1], if `fdtoverlay` left
   `/__local_fixups__` untouched (`IGNORE`), `foo.dtb` would still have
   `base.dtb`'s `/__local_fixups__` node (missing all phandle references
   from `bar.dtbo` and retaining stale offsets for any overwritten
   properties), causing `fdtfactor` to silently miss or corrupt phandle
   references when factoring `foo.dtb`. And if `fdtoverlay` stripped
   `/__local_fixups__`, `foo.dtb` wouldn't have `/__local_fixups__` at all
   and `fdtfactor` wouldn't be able to factor any composite DTB.
2. **`fdtfactor` self-tests**: Since `fdtfactor` inputs are compiled with
   `dtc -@ -L`, having `fdtoverlay` update `/__local_fixups__` lets the
   test suite directly verify with `dtbs_equal_unordered` that recombining
   `base.dtb` + `board.dtbo` produces an exact match for the original input
   `.dtb` (including all phandle fixup metadata).

Let me know if you're happy with this approach (or if you'd prefer a
different `FDT_OVERLAY_LOCAL_FIXUPS` default)!

[1] https://lore.kernel.org/all/CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=3DQFv=
4DyXNpWY6w@mail.gmail.com/


> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index a19eb1bc4bd8..bf1b9044ff2a 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -804,7 +804,7 @@ static int overlay_prevent_phandle_overwrite(void *=
fdt, void *fdto)
> >   *      Negative error code on failure
> >   */
> >  static int overlay_apply_node(void *fdt, int target,
> > -                           void *fdto, int node)
> > +                           const void *fdto, int node)
> >  {
> >       int property;
> >       int subnode;
>
> This change is unrelated to the rest of the patch.

Split into its own standalone preparatory patch ("libfdt: overlay: Make
fdto const in overlay_apply_node()").


> > +static int overlay_create_path(void *fdt, int parent, const char *path=
,
> > +                            int path_len)
> > +{
> > +     const char *sep;
> > +     int node =3D parent;
> > +
> > +     while (path_len > 0 && *path =3D=3D '/') {
> > +             path++;
> > +             path_len--;
> > +     }
>
> In Python, I'm pretty happy to have the code to optionally allow extra
> slashes to make the functions more widely useful.  In C - especially
> since this is code that may be run in limited environments - I'd
> prefer to pin down exactly what the expected format is and require
> that.  So, I'd suggest this function only take a relative path, and
> make sure that's the case from the callers.
>
> > +     while (path_len > 0) {
> > +             int comp_len;
> > +             int next;
> > +
> > +             sep =3D memchr(path, '/', path_len);
> > +             comp_len =3D sep ? (sep - path) : path_len;
> > +
> > +             if (comp_len > 0) {
>
> Similarly, in C I'd treat comp_len =3D=3D 0 as an error condition, rather
> than trying to handle it.
>
> > +                     next =3D fdt_subnode_offset_namelen(fdt, node, pa=
th,
> > +                                                       comp_len);
> > +                     if (next =3D=3D -FDT_ERR_NOTFOUND)
> > +                             next =3D fdt_add_subnode_namelen(fdt, nod=
e, path,
> > +                                                            comp_len);
> > +                     if (next < 0)
> > +                             return next;
> > +                     node =3D next;
> > +             }
> > +
> > +             path +=3D comp_len;
> > +             path_len -=3D comp_len;
> > +             while (path_len > 0 && *path =3D=3D '/') {
>
> Same thoughts here.

Done. `overlay_create_path()` now requires a strict relative path and
returns `-FDT_ERR_BADOVERLAY` if `comp_len =3D=3D 0` (leading `/`, repeated
`//`) or if `@path` has a trailing `/`.


-Doug
