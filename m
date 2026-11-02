Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793596309;
	b=oMSEqqvWyJvA4R+CkdYoFl+jUbYIYM4BgcDl+oZdGSI02NqaFqHFtxJWP2TByNnOlNJc
	 QYHdrB6o9uI1YwLEHlUPjS6y5zVqnuScfG5QpwbfnpGKldhPhQWdNN7PIjxBR/BQaLVoZ
	 JEj4hkq2i5BeSLrzrH7qt1u5PPtC+gpzT/U/RWeBC4ypbm3YyOiO10+L+jRuBov7qJRLT
	 h3k90+rA73+xCfidkwdq8mSL84VnVFvgAyEE0WHoi9FJ2QVb8jqHqkBxThCeKbs9dwvtv
	 M3lz8zTRO8fEhrzDnFyHzPgDJD9WtuGBQqjqswgIrx3+mNWUgbb4Hpk+wlvf7P/HSrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596309;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=viwpEca7wJ9qzgawnffjQX4LAK42jrtmu3SV2jw4xK8=;
	b=joJE3I9t6F+Vgde4mXjyQzJPhZsvswzyr2l8awB2sb/hNlJF15/dr1id9lDW/oP/V3rx
	 HpJj6JI3xkt47MxNP4u7p5z79wJNVJ644nmRzbPmDlYQG2lfjOYxbQzAUQnZlFatVp0Ye
	 4c6vQmrJvYbHkVAUyO4RNE9JfaFgukJSIKj3czxb0XTbrdH1AMf3WisPhh2X7HnrwbQGY
	 AfFUaZTvdgT+RX5ynD0tk5HPWUlqDr79TVmMKjSOOqG0TCmT6UBtZ4OLe36o5z9GaG1uk
	 aLIdSiKT92GHXgcxrpdQAIxIsJWmYxkOd0WjQPkOpkh+LHZkPQr4+bcqe32QFxUfQOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E85606A326;
	Mon,  2 Nov 2026 05:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793596296;
	bh=viwpEca7wJ9qzgawnffjQX4LAK42jrtmu3SV2jw4xK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpzPDrs9qSp9ZUNMs72mjbHr/x9BQcZIv02tAgRVvUC5MWxaYjN43jnaaYxlYlxAM
	 biyxEWLAbn2MwpXiC6pV3RddmpckKtbDaIrfWCcN4DR1dqqBiSGnQ6haMOrfXKB23j
	 NN1Je965XQ/x/9qFhQG7kAx3ZZrPe/uOoaT4CzosWMNHOinh6DglYVR1LjHXVCH5bI
	 IS6RwmWWQG+4C8PWJ78kuHp+mkGR5/wNnrXDkr+0CRgvmUlspK4RVKJhHJYeh8KNQx
	 z4q8j52S2+fVBhljc77X2m4xHlzOU0N9R3Uc18H0j9/s3poEoxR3SaxX65IcoLmdJJ
	 tnOsZChfo6Dug==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ0DS2Zjmz4wCh; Mon, 02 Nov 2026 16:11:36 +1100 (AEDT)
Date: Mon, 2 Nov 2026 16:11:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
Message-ID: <augbYtWXhj5YfFOZ@gractus.seuss>
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-7-dianders@chromium.org>
 <auR-OXOpim7dVTpH@gractus.seuss>
 <CAD=FV=WLMKquyc_j+gwF5Oz028=yddiq83o2tSCBWcJgTDs8xw@mail.gmail.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZDUkX/BKqX2zEUMG"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WLMKquyc_j+gwF5Oz028=yddiq83o2tSCBWcJgTDs8xw@mail.gmail.com>

--ZDUkX/BKqX2zEUMG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:05:09PM -0800, Doug Anderson wrote:
> Hi David,
>=20
> On Fri, Oct 30, 2026 at 3:24=E2=80=AFAM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Wed, Oct 28, 2026 at 02:55:56PM -0700, Douglas Anderson wrote:
> > > When `fdt_overlay_apply()` merges an overlay into a base device tree,=
 it
> > > updates `/__symbols__` in the base tree if present, but previously le=
ft
> > > the base tree's `/__local_fixups__` node untouched.
> > >
> > > Add `overlay_local_fixups_update()` so that when the base tree contai=
ns
> > > a `/__local_fixups__` node, `fdt_overlay_apply()` updates it to refle=
ct
> > > the applied overlay:
> > > - For each fragment in application order, any local fixup properties =
in
> > >   the base tree's `/__local_fixups__` that correspond to properties
> > >   overwritten by that fragment are cleared first.
> > > - Local phandle references from that fragment's subtree under the
> > >   overlay's `/__local_fixups__/<fragment>/__overlay__` are merged into
> > >   the corresponding target path under the base tree's
> > >   `/__local_fixups__`.
> > > - External phandle references for that fragment from the overlay's
> > >   `/__fixups__` (which are now resolved to local phandles in the merg=
ed
> > >   base tree) are added in sorted order to the base tree's
> > >   `/__local_fixups__`.
> > > - Any subnodes under the base tree's `/__local_fixups__` that become
> > >   empty after clearing overwritten properties are pruned.
> > >
> > > If the base tree does not have a `/__local_fixups__` node, nothing is
> > > added.
> >
> > So, this turned out to be substantially more involved than I realised.
> > I wonder if it might be better to make --strip-locals the default, and
> > only add support for preserving the local fixups as a later extension.
>=20
> In v3 I went ahead and addressed all of your and Simon's review comments =
on
> this patch (which also trimmed ~80 lines of C from `fdt_overlay.c`).

Oh good :).

> To address Simon's point about code size in constrained environments like
> U-Boot SPL, I also gated `/__local_fixups__` handling in
> `fdt_overlay_apply()` behind a 3-state compile-time
> `FDT_OVERLAY_LOCAL_FIXUPS` option in `libfdt/libfdt_internal.h`:
>=20
> - `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
>   untouched. I made this the `#ifndef` fallback in `libfdt_internal.h` so
>   that embedded projects that vendor `libfdt` directly get zero code-size
>   increase and zero behavior change unless they opt in.
> - `1` (`FDT_OVERLAY_LOCAL_FIXUPS_STRIP`): Delete `/__local_fixups__` from
>   the base DTB if present (~50 bytes of code), so a stale/half-working
>   `/__local_fixups__` node isn't left behind in the merged tree.
> - `2` (`FDT_OVERLAY_LOCAL_FIXUPS_UPDATE`): Fully update `/__local_fixups_=
_`
>   in the base DTB. This is enabled by default in `dtc`'s Meson
>   (`-Doverlay-local-fixups=3D2`) and Make (`OVERLAY_LOCAL_FIXUPS=3D2`) bu=
ilds
>   for desktop tools and tests.
>=20
> Even when `fdtfactor -S` is used, we actually do need `fdtoverlay` to
> update `/__local_fixups__` for two reasons:
>=20
> 1. **Kernel composite DTBs (`foo-dtbs :=3D base.dtb bar.dtbo`)**: In the
>    Linux kernel build (`scripts/Makefile.dtbs`), many upstream boards are
>    built as composite DTBs using `cmd_fdtoverlay` (`fdtoverlay -i base.dtb
>    -o foo.dtb bar.dtbo`) *before* `fdtfactor` runs on them. As Simon
>    pointed out on the kernel series [1], if `fdtoverlay` left
>    `/__local_fixups__` untouched (`IGNORE`), `foo.dtb` would still have
>    `base.dtb`'s `/__local_fixups__` node (missing all phandle references
>    from `bar.dtbo` and retaining stale offsets for any overwritten
>    properties), causing `fdtfactor` to silently miss or corrupt phandle
>    references when factoring `foo.dtb`. And if `fdtoverlay` stripped
>    `/__local_fixups__`, `foo.dtb` wouldn't have `/__local_fixups__` at all
>    and `fdtfactor` wouldn't be able to factor any composite DTB.

Ah, right.

> 2. **`fdtfactor` self-tests**: Since `fdtfactor` inputs are compiled with
>    `dtc -@ -L`, having `fdtoverlay` update `/__local_fixups__` lets the
>    test suite directly verify with `dtbs_equal_unordered` that recombining
>    `base.dtb` + `board.dtbo` produces an exact match for the original inp=
ut
>    `.dtb` (including all phandle fixup metadata).
>=20
> Let me know if you're happy with this approach (or if you'd prefer a
> different `FDT_OVERLAY_LOCAL_FIXUPS` default)!

I'll bear this in mind when I look at v3 and see what I think.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ZDUkX/BKqX2zEUMG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroG3QACgkQzQJF27ox
2GfcVBAAlAx8A72SK9Taiid0lOE2BM3qn7A7WYaUWluSVuaqbjwlloG9YQJ2HsaW
CR1hIYgDCEbXr/INzNDNkkcGYvMlLKE92fpvG+LvWOeFMgm/klZUEIjbMIaZSXoK
4zlCYpyYP6UDAF3yf2BqM7txWaJG2GLp6uf3L5lsxSla/3A8N6OmkWDnxQIx8B0t
UZQrc2V/HgdXctm8SR9Vux2zBwBAE/yQaYZ82817M92ac9gaJxoHfGxbXVqKXADC
Vbcf8/OUNXv5e4WYEVCD5oWiZX3Buw6m+xqPqcyfT9YhfvouFpFkRsC0u9lJLSC1
Ud64LQ0aKY1PSpilHEqgAoc3aA+wOVuL9kKdKOSKI8OcBNQVQbhO7zcnnqJfX66v
iBy5qPwCvFvw94HisODc2h0xsXNj2U7oPF7C8Yzc/QB8k32oXePPOqxfXSTjTEyz
goQviPU9GuwBfxGzrQpkSxePNVg5pS9q301ZH/ePvsYy+taOOhN4eiSWu3QDpjaW
HYDcUdLCfGq9IfJZHI/RoNk18uRb6GIxivDGdtsUkZEyC0bDiNQ+tJxj8GJoETAp
s9PTW8KdYNr73fh96ARzszFTkzDYLQUjDwsswBuOa9IMk1LJ+D6AS7QvxxlLZLbM
mcV3TwRyIFGQLfhhbBBHKXu9Si7+QmzmEwiYbvanHktbFsiOFUw=
=eKUp
-----END PGP SIGNATURE-----

--ZDUkX/BKqX2zEUMG--
