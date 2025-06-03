Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF722F39B
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Jun 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948969; cv=none; b=hmr6gc0AaOhJNYEAD1c84IbpqltY1QWv9K3kMvdzIhyks8oNrW7Ld6/uoLojh9+4+Urbu0ed/ZDcEShnYWWKKNOl4AsBj1ufSrlIW2+56/s93OfHiYHIEkKHHaHMVD+m6gMJNkB1wO4UTwIXqhWgXpKlnTG+Ei+y8qgCSymGxZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948969; c=relaxed/simple;
	bh=rxbvrjLNxpYf3aVReBZfKCBCoYDGPSse5+X3I4vf29c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL6yo1eHP3BakNyYvHbL+/xfcWCpb8atUVXl+9Pf8g8DV5V59YHBtvhKP8Os+VDlBCPs6QP3bfetc06vkW0M+9491eLz48qFWk2rafEUZiYDdSkfIHbeghJcbld4NusoG+jI3yjJcNsVrO4WCFD/TtbsCcQOXLvZi3AGwa2pLOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=E9I7IU7c; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="E9I7IU7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1748948964;
	bh=lskPS5BJuowms8MsNh63k7nF3AkwcQEoJqm/r8Oxp8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9I7IU7c9X4cRAONX9COCLW5iUukk3A3tdsMSL78xa9ipCXau/dulH4muXcRgrLlk
	 awuJ/iH6DFdUIdca3mUfpLODk7Eh8oh4TZAiRO3hc43C11ykeCGx/aKOA30f3kq5Hx
	 TF8L1MTb4XSKBBk022FRnUl2at+NC5saCEsHJQz2oSUUoCC3C0C9tzwi6YsXGPjkUw
	 KuTizFusAi+cayHp0Ec0k11jBxs9oRWQxEXrBt8V5aMIWYCHyftThWN+Jk8vuTHu8Q
	 BSTtjrsEqbEagRIV2AwJGK2/iQzHDbvLxmcHazFc/dos9xOFyavdyBrmWP6YwhkjuG
	 rP5olKtB4PPAQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bBSdw4GVrz4yM7; Tue,  3 Jun 2025 21:09:24 +1000 (AEST)
Date: Tue, 3 Jun 2025 21:05:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: devicetree-compiler@vger.kernel.org, kernel@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
Message-ID: <aD7W73A7vWQr8ZPx@zatzit>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <aC1Up3yHJURgc2P4@zatzit>
 <aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WkqXVBf2JUBu5HMl"
Content-Disposition: inline
In-Reply-To: <aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com>


--WkqXVBf2JUBu5HMl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 08:06:40PM +0530, Wasim Nazir wrote:
> On Wed, May 21, 2025 at 02:20:55PM +1000, David Gibson wrote:
> > On Mon, May 19, 2025 at 02:40:39PM +0530, Wasim Nazir wrote:
> > > Hello,
> > >=20
> > > This is follow-up attempt for fdtoverlaymerge tool.
> > >=20
> > > Currently all the device-tree (DT) code for a given soc is maintained=
 in a
> > > common kernel repository. For example, this common DT code will have =
code for
> > > audio, video, fingerprint, bluetooth etc. Further this, DT code is ty=
pically
> > > split into a base (soc-common) code and board specific code, with the=
 soc code
> > > being compiled as soc.dtb and board specific code being compiled as r=
espective
> > > overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hard=
ware configuration
> > > of a given SOC while boardX.dtbo represents configuration of a board/=
platform
> > > designed using that soc.soc.dtb and boardX.dtbo files are flashed sep=
arately on
> >=20
> > So.. *build time* separation of the SoC and board pieces makes sense
> > to me, which is I think how this convention arose.  *Boot time*
> > separation of the SoC and board seems kind of pointless.  Almost by
> > definition of what a "board" is, you must know early in boot which
> > board it is.  Still, I guess the convention is established, even if
> > it's stupid.
>=20
> Android Treble requires separation of soc and board DT bits and so we
> need to have soc.dtb & board.dtbo in separate images.
>=20
> In the above example I tried to simplify using 1 soc & multiple
> board-variants but we have setup with different combination of socX + boa=
rdY,
> where X & Y can vary.
> So we compile socX & boardY separately and combine socX dtb's in one image
> while boardY dtbo's in another image.
> Now at run-time based on SKU/HW config, we select particular socX and boa=
rdY
> to boot the system.

Ok, sure.  Still seems like a silly approach to me, but it sounds like
that's not within your control.

> In our workspace each repository i.e kernel & tech-packs (viz. audio, vid=
eo etc.)
> are independent (building in its own workspace) and can create dtb & dtbo.
> Kernel can have socX.dtb & boardY.dtbo; Tech-packs can have socX-featureZ=
=2Edtbo
> and boardY-featureZ.dtbo, Z can vary.

I mean.. how you organise your repositories should serve the needs of
the problem, not the other way around.  But I guess that's equally
true of dtc and associated tools.

> At build-time, we parse sku-id mentioned in all dtb & dtbo and combine ma=
tching
> files i.e we overlay socX-featureZ.dtbo to socX.dtb & similarly
> merge (fdtoverlaymerge) boardY-featureZ.dtbo to boardY.dtbo.
>=20
> We can create single dtb as socX-boardY.dtb but Android Treble doesn't
> allow that. Moreover, this modularity also helps us to reduce dtb + dtbo
> image size by choosing N combinations with X+Y files instead of having
> X*Y files which can increase image size.
> If we don't merge boardY-featureZ.dtbo to boardY.dtbo then we need to
> overlay Z number of boardY-featureZ.dtbo at run-time and it increases
> boot-time.

So, you clearly have a late-build stage where you combine the various
dtbos down to just two (soc & board).  Why can't the output from the
earlier (single repo) build stages be a dts instead of a dtbo, then
you use dtc to combine those into the two dtbos you need at the late
build stage?

> > > target (besides improving the overall size of DT blobs flashed on tar=
get, Android
> > > Treble also requires separation of soc and board DT bits). Bootloader=
 will pick
> > > one of the board overlay blobs and merge it with soc.dtb, before boot=
ing kernel
> > > which is presented a unified DT blob (soc + board overlay).
> > >=20
> > > For ease of code maintenance and better control over release manageme=
nt, we are
> > > exploring allowing some of the tech teams (audio/fingerprint sensor e=
tc) to
> > > maintain their kernel code (including their DT code) outside a common=
 kernel
> > > repository. In our experience, this simplifies number of branches mai=
ntained in
> > > core kernel repo. New/experimental features in fingerprint sensor dri=
ver for
> > > example that needs to be on a separate branch will not result in unne=
cessary
> > > branching in core kenrel repo, affecting all other drivers.
> > >=20
> > > In addition to compiling DT code outside core kernel tree, we also wa=
nt to merge
> > > the blobs back to respective blobs found in kernel build tree at buil=
dtime
> > > (soc.dtb or boardX.dtbo), as otherwise relying on bootloader to do al=
l the
> > > overlay impacts boot-time.
> >=20
> > It's again unclear to me why you need a boot time separation of these
> > devices rather than merely boot time.  What does using separate .dtbo
> > files give you that just /include/ing multiple pieces into a single
> > .dtbo at build time would not?
> >=20
>=20
> Since our workspace is split into multiple independent repositories we ca=
nnot
> include the pieces in one place.

I still don't see why not.  If you can emit dtbos from the single
repository stages, why can't you emit dts instead?

> > > This brings up the need to merge two overlay blobs (fingerprint-overl=
ay.dtbo +
> > > boardX.dtbo), which currently doesn't seem to be supported and which =
this patch
> > > series aims to support.
> >=20
> > Merging overlays is a logically sensible operation, but it's not clear
> > to me why the need for it follows from the premises above.  It's also
> > unclear why you need to compile to .dtbo *then* merge, rather than
> > combine .dts files then compile into a single .dtbo.
>=20
> Due to splitted repository structure we cannot combine all .dts together.
> And due to standalone build system for kernel & tech-packs we are
> creating dtbo and merging together at end.
>=20
> > > fdt_overlay_apply() API currently allows for an overlay DT blob to be=
 merged
> > > with a base blob. It assumes that all external symbols specified in o=
verlay
> > > blob's __fixups__ section are found in base blob's __symbols__ sectio=
n and
> > > aborts on the first instance where a symbol could not be found in bas=
e blob.
> > > This is mostly fine as the primary use of overlay is on a target for =
its
> > > bootloader to merge various overlay blobs based on h/w configuration =
detected.
> > > But when the number of overlays increased then bootloader takes lot o=
f time to
> > > apply the overlays on base DT.
> > >=20
> > > So we need new API/tool to merge all the overlays into single overlay=
 file
> > > at host (build machine) side,
> >=20
> > Merging into a single overlay at build time makes sense to me.  But at
> > build time you'd expect to have access to the .dts files.  Why do you
> > need to merge .dtbo rather than merge the .dts before compiling to
> > .dtbo?  The latter should be possible already by /include/ing each of
> > the individual overlays in order then compiling with dtc.
>=20
> This is not possible with our current repository structure.
> Moreover, this splitting of repository is needed to work independently
> without slowing any teck-packs.

I really don't know what you mean by that.

A few other things bother me about the situation, but maybe I'm
misunderstanding.

1) You imply you need many various of the soc.dtb as well as the
board.dtbo.  How does that come to be the case?  Isn't there a fixed
set of SoCs with known features?  Remember that device trees should -
as much as is possible - describe just the hardware, not how it's to
be configured or used.

2) To a certain extent the same concern applies to boards.  What's
controlling when the extra features are needed?  Are extre pieces
physically connected on?  Is it controlled by on-board switches?
Something else?

3) What exactly is costing the additional time when applying may
=2Edtbos at boot time.  Combining many together at build time will
obviously result in a larger dtbo with more fragments that will itself
take longer to apply.  I can certainly believe it's still faster
overall, but it's not obvious to me why,  Understanding that will
allow us all to reason better about what's a good approach here.

> > > so that on target side bootloader needs to only
> > > apply merged-overlay-dt to its base-dt. This saves lot of time due to=
 reduced
> > > number file reading/loading & minimizing repeatative overlay apply.
> > > In our test setup we see an improvement of ~60% while applying merged=
-overlay
> > > at bootloader and the merged-overlay is product of 7 overlays.
> > >=20
> > > To serve this overlay-merge feature we have introduce fdtoverlaymerge=
 tool
> > > which takes input as overlays and gives output to merged-overlay.
> > > The tool uses fdt_overlay_merge() API introduced in libfdt to do the =
actual work.
> > >=20
> > > Additional notes:
> > >   If snprintf (in libc) may not available in some environments, then =
we will need
> > >   to write our own snprintf() in libfdt.
> > >=20
> > > ---
> > > Changelog:
> > >=20
> > > v3:
> > > - Update copy_node & add copy_fragment_to_base to incorporate two cas=
es i.e
> > >   - Case1: When target is available and we merge fragments
> > >   - Case2: When target is not available and we add new fragments
> > > - Change the logic to update fixups & local_fixups in case of overlay=
 merge.
> > > - Few patches are squashed, reduced to 4 patches.
> > > - v2-link: https://lore.kernel.org/all/1599671882-310027-1-git-send-e=
mail-gurbaror@codeaurora.org/
> > >=20
> > >=20
> > > Srivatsa Vaddagiri (4):
> > >   libfdt: overlay_merge: Introduce fdt_overlay_merge()
> > >   libfdt: overlay_merge: Rename & copy overlay fragments and their
> > >     properties
> > >   libfdt: overlay_merge: Update phandles, symbols, fixups & local_fix=
ups
> > >   fdtoverlaymerge: A tool that merges overlays
> > >=20
> > >  .gitignore           |   1 +
> > >  Makefile             |   4 +
> > >  Makefile.utils       |   6 +
> > >  fdtoverlaymerge.c    | 223 +++++++++++
> > >  libfdt/fdt_overlay.c | 901 +++++++++++++++++++++++++++++++++++++++++=
+-
> > >  libfdt/fdt_rw.c      |  14 +-
> > >  libfdt/libfdt.h      |  18 +
> > >  libfdt/version.lds   |   1 +
> > >  meson.build          |   2 +-
> > >  9 files changed, 1146 insertions(+), 24 deletions(-)
> > >  create mode 100644 fdtoverlaymerge.c
> > >=20
> > >=20
> > > base-commit: f4c53f4ebf7809a07666bf728c823005e1f1a612
> >=20
>=20
> Regards,
> Wasim
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--WkqXVBf2JUBu5HMl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmg+1uAACgkQzQJF27ox
2GedRw/9H3IV7vza/jQWo2u8OOVPHgSTzovpCUzq51V/LWL1Z4fRNDMCU0PCmb6E
e81889Ji0exV8dIqChTS6f2BOpORMMLljATH4lrlYLDU/8GTNkhiRjdVYdK3RU44
dlddnkvI6p7AGGpH97bGgcZBWZnCOB4oXcjLzBE40cBYRTrnYZ6DwvqNv13iLWWN
iqe6EhfosE36JHrhZ/lNpk9xapLF+UThEfpbPMtsfoK+D43L06eneEhlODzASbtA
ID15MpW89KUsHePawTsC1M04iX517R1e/q93EqOGuptAMqX41kG8o06f4xuErDrq
wZwXm1S+NSGvMiEaVCjlMJo1N19nlywXtfDKdFh4fbVVf/Btogm2rrigL60rOfWM
zhWYXr2jJaU4JVnFAQtSNwlMb4EY19GfLkYQTTzW4AMMQfqNUE/tRhhNbGpo4n+o
GTvTBzZw1NW2geozhNekvIIMnP8wSZu7GmHO+fA35UvEttc2Hex0XHHIxhhlQv7C
/wE50dIXVdyz1jUcqVQnmFEz5ApPxEdusig2u/ZPns9shG/By2X3mwI0SCJep578
9rwwptKeghh6pNv8dpSu0zNAGMr5Hrw0mPNRriDPod18VXJYKnb3Gd706DTFTTqI
9PdzurM5ebpCJj7QVvMP9hW4HiVQklmO16GgVNFgLmqRsWyiD0c=
=or39
-----END PGP SIGNATURE-----

--WkqXVBf2JUBu5HMl--
