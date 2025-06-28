Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0CC29D0E
	for <devicetree-compiler@vger.kernel.org>; Sun, 29 Jun 2025 02:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751163691; cv=none; b=c5RSmAVpu02KyI4Z6ZbMoqZxV7OqQTERjrfeDd3ys4h4Lt/+zEKQEqn+J9CZk84dISmzdsewJJsDsZbS3j8Gd7+ugNMgZUXZ7T1YdFuTmXcKuZRnBhMGBGyXKUzT87wmui47xaqqtIk78JK5vVQJ7IXqaqalQPuheWIVcBNrr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751163691; c=relaxed/simple;
	bh=WBLCeplwGRE6+LjNPveib7R/xeVO/XO5zPoLQkHUvVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ni8cbH5CgmNR+1aykmDWGPhB9yEfl+YfeKevWfcccCf3vv1HP12zinhprIGIids79Pyx+YpzKmhvQ/9jzvjx/nEJQFAcT2agfqa1FV57kmBFl/Z7PRvVCZXsn40KLGYtK10MyWt7ThC3bKN6MYzDSlNjooQiNv59VSyWcklckW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=j2lOr5Vo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="j2lOr5Vo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202506; t=1751163686;
	bh=4IQyX8bnudvu/F+fAql92pGdWzNL5bWm2TlcZHgV4Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2lOr5VoOKi2ymYUhzst6X4qaSyDTINEvhraAxFP2cZUYGQjH5gK0C+kIJ/Futx1M
	 PXu8vgvnM5ApVXti5Zryswlttv7u/5GUhbF22Q6cjia0Z6jxqRpTuZm80vdHceriGF
	 kAFyMorK2e38O8Et3Kbta11/hxb2Rv136KpiKk3ZwJ7Bht7uaLI2oQFd4hFNvh0ky7
	 qDXQfh1T99xUpQN+qINaFHEsDaSHKUeStCLRjOX6XbosTLtEXSFIZi/0uiUh84RXL7
	 7moet4Qoa7bfwdNAX9f+VVyvdlQvkz/7cy2virusMjRFlXlbs4lrgEe9i0UcY6EDad
	 VU/haogKDPLSQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bVChk54T1z4wcx; Sun, 29 Jun 2025 12:21:26 +1000 (AEST)
Date: Sat, 28 Jun 2025 20:55:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: devicetree-compiler@vger.kernel.org, kernel@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
Message-ID: <aF_KEwXLkQ2ff_69@zatzit>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <aC1Up3yHJURgc2P4@zatzit>
 <aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com>
 <aD7W73A7vWQr8ZPx@zatzit>
 <aF5vSAKbARuThVZR@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mkEWwfQmkMXkzDOy"
Content-Disposition: inline
In-Reply-To: <aF5vSAKbARuThVZR@hu-wasimn-hyd.qualcomm.com>


--mkEWwfQmkMXkzDOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 03:45:36PM +0530, Wasim Nazir wrote:
> On Tue, Jun 03, 2025 at 09:05:19PM +1000, David Gibson wrote:
> > On Fri, May 30, 2025 at 08:06:40PM +0530, Wasim Nazir wrote:
> > > On Wed, May 21, 2025 at 02:20:55PM +1000, David Gibson wrote:
> > > > On Mon, May 19, 2025 at 02:40:39PM +0530, Wasim Nazir wrote:
> > > > > Hello,
> > > > >=20
> > > > > This is follow-up attempt for fdtoverlaymerge tool.
> > > > >=20
> > > > > Currently all the device-tree (DT) code for a given soc is mainta=
ined in a
> > > > > common kernel repository. For example, this common DT code will h=
ave code for
> > > > > audio, video, fingerprint, bluetooth etc. Further this, DT code i=
s typically
> > > > > split into a base (soc-common) code and board specific code, with=
 the soc code
> > > > > being compiled as soc.dtb and board specific code being compiled =
as respective
> > > > > overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents =
hardware configuration
> > > > > of a given SOC while boardX.dtbo represents configuration of a bo=
ard/platform
> > > > > designed using that soc.soc.dtb and boardX.dtbo files are flashed=
 separately on
> > > >=20
> > > > So.. *build time* separation of the SoC and board pieces makes sense
> > > > to me, which is I think how this convention arose.  *Boot time*
> > > > separation of the SoC and board seems kind of pointless.  Almost by
> > > > definition of what a "board" is, you must know early in boot which
> > > > board it is.  Still, I guess the convention is established, even if
> > > > it's stupid.
> > >=20
> > > Android Treble requires separation of soc and board DT bits and so we
> > > need to have soc.dtb & board.dtbo in separate images.
> > >=20
> > > In the above example I tried to simplify using 1 soc & multiple
> > > board-variants but we have setup with different combination of socX +=
 boardY,
> > > where X & Y can vary.
> > > So we compile socX & boardY separately and combine socX dtb's in one =
image
> > > while boardY dtbo's in another image.
> > > Now at run-time based on SKU/HW config, we select particular socX and=
 boardY
> > > to boot the system.
> >=20
> > Ok, sure.  Still seems like a silly approach to me, but it sounds like
> > that's not within your control.
> >=20
> > > In our workspace each repository i.e kernel & tech-packs (viz. audio,=
 video etc.)
> > > are independent (building in its own workspace) and can create dtb & =
dtbo.
> > > Kernel can have socX.dtb & boardY.dtbo; Tech-packs can have socX-feat=
ureZ.dtbo
> > > and boardY-featureZ.dtbo, Z can vary.
> >=20
> > I mean.. how you organise your repositories should serve the needs of
> > the problem, not the other way around.  But I guess that's equally
> > true of dtc and associated tools.
> >=20
> > > At build-time, we parse sku-id mentioned in all dtb & dtbo and combin=
e matching
> > > files i.e we overlay socX-featureZ.dtbo to socX.dtb & similarly
> > > merge (fdtoverlaymerge) boardY-featureZ.dtbo to boardY.dtbo.
> > >=20
> > > We can create single dtb as socX-boardY.dtb but Android Treble doesn't
> > > allow that. Moreover, this modularity also helps us to reduce dtb + d=
tbo
> > > image size by choosing N combinations with X+Y files instead of having
> > > X*Y files which can increase image size.
> > > If we don't merge boardY-featureZ.dtbo to boardY.dtbo then we need to
> > > overlay Z number of boardY-featureZ.dtbo at run-time and it increases
> > > boot-time.
> >=20
> > So, you clearly have a late-build stage where you combine the various
> > dtbos down to just two (soc & board).  Why can't the output from the
> > earlier (single repo) build stages be a dts instead of a dtbo, then
> > you use dtc to combine those into the two dtbos you need at the late
> > build stage?
>=20
> Our repositores are following android structure based on android-treble
> where vendor subsystems needs to be modular for ease of OTA upgrade and
> development.
>=20
> As a result of which each feature/techpack (viz. audio, video etc.) have
> its own independent repositories where it can build its modules and
> overlay DT (soc & board).
> Kernel is separate and provides only the core images and base DT (soc &
> board).

The build system should serve the needs of the project, not the other
way around.  If the feature repos can emit a dtbo, why can't they emit
a dts as well?

> So, dtbo is the option to build it independently and at last we have
> options to either "overlay all dtbo at boot-time" or "merge it at build-t=
ime and
> overlay final dtbo at boot-time".
>=20
> This build-time merge is done outside techpack build system.
> But if we want to have dts from each techpack, then techpack-build system=
 needs
> to communicate somehow to know which dts to include with which base dts.

Why is that a harder problem than knowing which dtbo?  The dtbo must
have been built from some sort of dts, no?

> This is not possible at build-time between techpacks.

The build system is not immutable - you're proposing changes to libfdt
and/or dtc; why not changes to the build system?

> > > > > target (besides improving the overall size of DT blobs flashed on=
 target, Android
> > > > > Treble also requires separation of soc and board DT bits). Bootlo=
ader will pick
> > > > > one of the board overlay blobs and merge it with soc.dtb, before =
booting kernel
> > > > > which is presented a unified DT blob (soc + board overlay).
> > > > >=20
> > > > > For ease of code maintenance and better control over release mana=
gement, we are
> > > > > exploring allowing some of the tech teams (audio/fingerprint sens=
or etc) to
> > > > > maintain their kernel code (including their DT code) outside a co=
mmon kernel
> > > > > repository. In our experience, this simplifies number of branches=
 maintained in
> > > > > core kernel repo. New/experimental features in fingerprint sensor=
 driver for
> > > > > example that needs to be on a separate branch will not result in =
unnecessary
> > > > > branching in core kenrel repo, affecting all other drivers.
> > > > >=20
> > > > > In addition to compiling DT code outside core kernel tree, we als=
o want to merge
> > > > > the blobs back to respective blobs found in kernel build tree at =
buildtime
> > > > > (soc.dtb or boardX.dtbo), as otherwise relying on bootloader to d=
o all the
> > > > > overlay impacts boot-time.
> > > >=20
> > > > It's again unclear to me why you need a boot time separation of the=
se
> > > > devices rather than merely boot time.  What does using separate .dt=
bo
> > > > files give you that just /include/ing multiple pieces into a single
> > > > .dtbo at build time would not?
> > > >=20
> > >=20
> > > Since our workspace is split into multiple independent repositories w=
e cannot
> > > include the pieces in one place.
> >=20
> > I still don't see why not.  If you can emit dtbos from the single
> > repository stages, why can't you emit dts instead?
> >=20
> > > > > This brings up the need to merge two overlay blobs (fingerprint-o=
verlay.dtbo +
> > > > > boardX.dtbo), which currently doesn't seem to be supported and wh=
ich this patch
> > > > > series aims to support.
> > > >=20
> > > > Merging overlays is a logically sensible operation, but it's not cl=
ear
> > > > to me why the need for it follows from the premises above.  It's al=
so
> > > > unclear why you need to compile to .dtbo *then* merge, rather than
> > > > combine .dts files then compile into a single .dtbo.
> > >=20
> > > Due to splitted repository structure we cannot combine all .dts toget=
her.
> > > And due to standalone build system for kernel & tech-packs we are
> > > creating dtbo and merging together at end.
> > >=20
> > > > > fdt_overlay_apply() API currently allows for an overlay DT blob t=
o be merged
> > > > > with a base blob. It assumes that all external symbols specified =
in overlay
> > > > > blob's __fixups__ section are found in base blob's __symbols__ se=
ction and
> > > > > aborts on the first instance where a symbol could not be found in=
 base blob.
> > > > > This is mostly fine as the primary use of overlay is on a target =
for its
> > > > > bootloader to merge various overlay blobs based on h/w configurat=
ion detected.
> > > > > But when the number of overlays increased then bootloader takes l=
ot of time to
> > > > > apply the overlays on base DT.
> > > > >=20
> > > > > So we need new API/tool to merge all the overlays into single ove=
rlay file
> > > > > at host (build machine) side,
> > > >=20
> > > > Merging into a single overlay at build time makes sense to me.  But=
 at
> > > > build time you'd expect to have access to the .dts files.  Why do y=
ou
> > > > need to merge .dtbo rather than merge the .dts before compiling to
> > > > .dtbo?  The latter should be possible already by /include/ing each =
of
> > > > the individual overlays in order then compiling with dtc.
> > >=20
> > > This is not possible with our current repository structure.
> > > Moreover, this splitting of repository is needed to work independently
> > > without slowing any teck-packs.
> >=20
> > I really don't know what you mean by that.
> >=20
> > A few other things bother me about the situation, but maybe I'm
> > misunderstanding.
> >=20
> > 1) You imply you need many various of the soc.dtb as well as the
> > board.dtbo.  How does that come to be the case?  Isn't there a fixed
> > set of SoCs with known features?  Remember that device trees should -
> > as much as is possible - describe just the hardware, not how it's to
> > be configured or used.
> >=20
> > 2) To a certain extent the same concern applies to boards.  What's
> > controlling when the extra features are needed?  Are extre pieces
> > physically connected on?  Is it controlled by on-board switches?
> > Something else?
> >=20
>=20
> We do have a fixed set of SoCs, but there can be multiple boards using sa=
me SoC.
> socX-featureZ.dtbo & boardY-featureZ.dtbo is describing one of the
> feature (viz. audio, video etc.) for each soc & board respectively.

But why does the set of features on a SoC vary?  Generally, by its
nature, a SoC has the components it has, they're not variable.

> > 3) What exactly is costing the additional time when applying may
> > .dtbos at boot time.  Combining many together at build time will
> > obviously result in a larger dtbo with more fragments that will itself
> > take longer to apply.  I can certainly believe it's still faster
> > overall, but it's not obvious to me why,  Understanding that will
> > allow us all to reason better about what's a good approach here.
>=20
> In our setup, we have 7 overlays (boardY-featureZ.dtbo) for 1 of the board
> (soc overlay (socX-featureZ.dtbo) are different so excluding that here).
> So, if we do overlay-merge at build-time we are saving ~60% boot-time spe=
nt on
> overlaying the board dtbo's.

Well, sure,  but I'm trying to understand *why* doing it all at once
is so much faster.  I know the code for overlay application, and
there's not an obvious large cost per-dtbo - I'd expect the time to be
dominated by things that are per-fragment or (roughly) proportional
to the total size of the applied dtbos.  That leaves two possibilities
that I can see:

1) the later dtbos are frequently overwriting properties in the
   earlier dtbos, resulting in a final dtbo substantially smaller than
   the sum of the original dtbos.  This seems implausible to me given
   the structure you've described - I'd expect each dtbo to be
   altering different parts of the tree.

2) There *is*, contrary to my intuition, a substantial once off cost
   for each fdt_overlay_apply() call, independent of the dtbo's size.
   If that's the case, we should understand why and see if it can be
   mitigated.  That would help all use cases, not just your one.

In short, adding a substantial new feature to dtc/libfdt seems
premature without better understanding the cause of the poor
performance you're seeing.

> > > > > so that on target side bootloader needs to only
> > > > > apply merged-overlay-dt to its base-dt. This saves lot of time du=
e to reduced
> > > > > number file reading/loading & minimizing repeatative overlay appl=
y.
> > > > > In our test setup we see an improvement of ~60% while applying me=
rged-overlay
> > > > > at bootloader and the merged-overlay is product of 7 overlays.
> > > > >=20
> > > > > To serve this overlay-merge feature we have introduce fdtoverlaym=
erge tool
> > > > > which takes input as overlays and gives output to merged-overlay.
> > > > > The tool uses fdt_overlay_merge() API introduced in libfdt to do =
the actual work.
> > > > >=20
> > > > > Additional notes:
> > > > >   If snprintf (in libc) may not available in some environments, t=
hen we will need
> > > > >   to write our own snprintf() in libfdt.
> > > > >=20
> > > > > ---
> > > > > Changelog:
> > > > >=20
> > > > > v3:
> > > > > - Update copy_node & add copy_fragment_to_base to incorporate two=
 cases i.e
> > > > >   - Case1: When target is available and we merge fragments
> > > > >   - Case2: When target is not available and we add new fragments
> > > > > - Change the logic to update fixups & local_fixups in case of ove=
rlay merge.
> > > > > - Few patches are squashed, reduced to 4 patches.
> > > > > - v2-link: https://lore.kernel.org/all/1599671882-310027-1-git-se=
nd-email-gurbaror@codeaurora.org/
> > > > >=20
> > > > >=20
> > > > > Srivatsa Vaddagiri (4):
> > > > >   libfdt: overlay_merge: Introduce fdt_overlay_merge()
> > > > >   libfdt: overlay_merge: Rename & copy overlay fragments and their
> > > > >     properties
> > > > >   libfdt: overlay_merge: Update phandles, symbols, fixups & local=
_fixups
> > > > >   fdtoverlaymerge: A tool that merges overlays
> > > > >=20
> > > > >  .gitignore           |   1 +
> > > > >  Makefile             |   4 +
> > > > >  Makefile.utils       |   6 +
> > > > >  fdtoverlaymerge.c    | 223 +++++++++++
> > > > >  libfdt/fdt_overlay.c | 901 +++++++++++++++++++++++++++++++++++++=
+++++-
> > > > >  libfdt/fdt_rw.c      |  14 +-
> > > > >  libfdt/libfdt.h      |  18 +
> > > > >  libfdt/version.lds   |   1 +
> > > > >  meson.build          |   2 +-
> > > > >  9 files changed, 1146 insertions(+), 24 deletions(-)
> > > > >  create mode 100644 fdtoverlaymerge.c
> > > > >=20
> > > > >=20
> > > > > base-commit: f4c53f4ebf7809a07666bf728c823005e1f1a612
> > > >=20
> > >=20
> > > Regards,
> > > Wasim
> > >=20
> >=20
>=20
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--mkEWwfQmkMXkzDOy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmhfyfQACgkQzQJF27ox
2GezZQ//Y8X/oCRIaqrVQRtHEqDbFbuBzDMCBY1/T7QB1USm9w2/LT8NRywQOLb2
YDwTAE2w4psR93uTCv6izz0gidD4gSRPpujlhB9n7zI6N3Je+gu0MI6C9aYdWK+8
GRqxioja737/WkK/W3d/lgEbZu1ryEikvKpVJ/v5QSPZNGsC2aLhZJ1sCzy0vn1Z
BIPPaP35+CcWTF0R1enSj0rx0WcxgVmOk/GfE0pPkbLSqBGgpPUcZBqvY+PIkVkw
vqq2ByFaFMOBeZxfgxuuEDtAN8UZwLv5rviLb6KgsltP9htQIN1U4/+XB4Mq0ZZB
RA3NtmhRSFOl76ey/0jTcbGMu/PJsguYxqMq2LEBLM2iTjziOA4PutpPAm3zpP3j
uuSGMeabQIGJl0EROxCbYzMfpmSEzfpqd3yS3jxmqQXo1OJIiBWR/fD+Rm1gzzuW
t0eNEW1rySAHdz+QvL1CrQRpQcSE9r2ZYW0VYfZGtKFtIsGTz90tArapo4hCKWbo
tU6nkn0zSKpNt6gKNdw7bZ3kiMCtALcEaTyz2KQxKzsA1thBGznlYZ183ur/4G41
ZSCtvnjyyo0MN8qyNqqjc+IVQI6+wyFjzfM2ArpopBdBnmJQ+bBaDIGtGEeAqXKE
fRTTpPUSJp/QFhl6hLXbGXocBspam+TwfKv/9i61Ii8RAARyMUA=
=cvLk
-----END PGP SIGNATURE-----

--mkEWwfQmkMXkzDOy--
