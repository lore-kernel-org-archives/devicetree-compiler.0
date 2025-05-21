Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022004430
	for <devicetree-compiler@vger.kernel.org>; Wed, 21 May 2025 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747801454; cv=none; b=KCoPobdfmBPef99r/1x4GXnSN2GyKmbi6hwhh+0IXkruKQvMRh1sYGvWLSpEgtEuBYneGZ5ymEWjgApTZ9vjuMHzW9tLiLIkbxT+xDBFZp6TWqXTaQVpExcLH6im5XDesXwLrrmgeZNmpaB7UvrVAZehO9Ruz2axes+NmEJGLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747801454; c=relaxed/simple;
	bh=jojeepNHVnMYR4qsc1AYEHT/7LrL1ZfX8wioAP2OTIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx82lQC96GUmgj13tiT0hHv3ZzUi3GpV0MlgueZAoMfn7CC8yGetn0hlWjhS8FOOCpGjdged/vKvhXH4y+yI1eM17p+YQ6U+JvkvSOgx2YfDecTVxfAZreOu2FsS6OmnPiM1rtBtAiSnRTWu/KIbgiGkT6LGxv4nWvUSvr2RBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=efOlxs3L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="efOlxs3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1747801448;
	bh=AGWRXvs4Wh7YfdmNT8PkGC7HMRIBYHCagN4H3PMVTf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efOlxs3LGlaK2l23nFe7P4YXzTrznwbedYBqWtY7v7S/7CBqCUENPVkDsxHB/VQB8
	 B1BWMSyQ3E8uLoI+n7E/VgCv69ymNbiExtxIFtghECPyvZTPnDS4uZkLEd1CqeqcZs
	 g0/XbibB0bGRrXax/3/mmDXClqV2TFwBeWkWuWg39cugXXvDja1SJy/8sr2ivG4XRS
	 E2kxVP2QTEdiWo0YpgO7KT4rSHt/MZJiIA6pPdkZpGdQF8cMbIwhxrRVfGya1beMUP
	 3brJFtycsrMaRMljVdnqAbLzXEZZuhHrRE+OtsrdW9sIwty8o4I4BzmGrCXpNnmPO6
	 nsTxUchPgpvYQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4b2JGJ3J7dz4x8f; Wed, 21 May 2025 14:24:08 +1000 (AEST)
Date: Wed, 21 May 2025 14:20:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: devicetree-compiler@vger.kernel.org, kernel@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
Message-ID: <aC1Up3yHJURgc2P4@zatzit>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V5oC5rQBmZ/9Se2t"
Content-Disposition: inline
In-Reply-To: <20250519091043.621316-1-quic_wasimn@quicinc.com>


--V5oC5rQBmZ/9Se2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 02:40:39PM +0530, Wasim Nazir wrote:
> Hello,
>=20
> This is follow-up attempt for fdtoverlaymerge tool.
>=20
> Currently all the device-tree (DT) code for a given soc is maintained in a
> common kernel repository. For example, this common DT code will have code=
 for
> audio, video, fingerprint, bluetooth etc. Further this, DT code is typica=
lly
> split into a base (soc-common) code and board specific code, with the soc=
 code
> being compiled as soc.dtb and board specific code being compiled as respe=
ctive
> overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware=
 configuration
> of a given SOC while boardX.dtbo represents configuration of a board/plat=
form
> designed using that soc.soc.dtb and boardX.dtbo files are flashed separat=
ely on

So.. *build time* separation of the SoC and board pieces makes sense
to me, which is I think how this convention arose.  *Boot time*
separation of the SoC and board seems kind of pointless.  Almost by
definition of what a "board" is, you must know early in boot which
board it is.  Still, I guess the convention is established, even if
it's stupid.

> target (besides improving the overall size of DT blobs flashed on target,=
 Android
> Treble also requires separation of soc and board DT bits). Bootloader wil=
l pick
> one of the board overlay blobs and merge it with soc.dtb, before booting =
kernel
> which is presented a unified DT blob (soc + board overlay).
>=20
> For ease of code maintenance and better control over release management, =
we are
> exploring allowing some of the tech teams (audio/fingerprint sensor etc) =
to
> maintain their kernel code (including their DT code) outside a common ker=
nel
> repository. In our experience, this simplifies number of branches maintai=
ned in
> core kernel repo. New/experimental features in fingerprint sensor driver =
for
> example that needs to be on a separate branch will not result in unnecess=
ary
> branching in core kenrel repo, affecting all other drivers.
>=20
> In addition to compiling DT code outside core kernel tree, we also want t=
o merge
> the blobs back to respective blobs found in kernel build tree at buildtime
> (soc.dtb or boardX.dtbo), as otherwise relying on bootloader to do all the
> overlay impacts boot-time.

It's again unclear to me why you need a boot time separation of these
devices rather than merely boot time.  What does using separate .dtbo
files give you that just /include/ing multiple pieces into a single
=2Edtbo at build time would not?

> This brings up the need to merge two overlay blobs (fingerprint-overlay.d=
tbo +
> boardX.dtbo), which currently doesn't seem to be supported and which this=
 patch
> series aims to support.

Merging overlays is a logically sensible operation, but it's not clear
to me why the need for it follows from the premises above.  It's also
unclear why you need to compile to .dtbo *then* merge, rather than
combine .dts files then compile into a single .dtbo.

> fdt_overlay_apply() API currently allows for an overlay DT blob to be mer=
ged
> with a base blob. It assumes that all external symbols specified in overl=
ay
> blob's __fixups__ section are found in base blob's __symbols__ section and
> aborts on the first instance where a symbol could not be found in base bl=
ob.
> This is mostly fine as the primary use of overlay is on a target for its
> bootloader to merge various overlay blobs based on h/w configuration dete=
cted.
> But when the number of overlays increased then bootloader takes lot of ti=
me to
> apply the overlays on base DT.
>=20
> So we need new API/tool to merge all the overlays into single overlay file
> at host (build machine) side,

Merging into a single overlay at build time makes sense to me.  But at
build time you'd expect to have access to the .dts files.  Why do you
need to merge .dtbo rather than merge the .dts before compiling to
=2Edtbo?  The latter should be possible already by /include/ing each of
the individual overlays in order then compiling with dtc.

> so that on target side bootloader needs to only
> apply merged-overlay-dt to its base-dt. This saves lot of time due to red=
uced
> number file reading/loading & minimizing repeatative overlay apply.
> In our test setup we see an improvement of ~60% while applying merged-ove=
rlay
> at bootloader and the merged-overlay is product of 7 overlays.
>=20
> To serve this overlay-merge feature we have introduce fdtoverlaymerge tool
> which takes input as overlays and gives output to merged-overlay.
> The tool uses fdt_overlay_merge() API introduced in libfdt to do the actu=
al work.
>=20
> Additional notes:
>   If snprintf (in libc) may not available in some environments, then we w=
ill need
>   to write our own snprintf() in libfdt.
>=20
> ---
> Changelog:
>=20
> v3:
> - Update copy_node & add copy_fragment_to_base to incorporate two cases i=
=2Ee
>   - Case1: When target is available and we merge fragments
>   - Case2: When target is not available and we add new fragments
> - Change the logic to update fixups & local_fixups in case of overlay mer=
ge.
> - Few patches are squashed, reduced to 4 patches.
> - v2-link: https://lore.kernel.org/all/1599671882-310027-1-git-send-email=
-gurbaror@codeaurora.org/
>=20
>=20
> Srivatsa Vaddagiri (4):
>   libfdt: overlay_merge: Introduce fdt_overlay_merge()
>   libfdt: overlay_merge: Rename & copy overlay fragments and their
>     properties
>   libfdt: overlay_merge: Update phandles, symbols, fixups & local_fixups
>   fdtoverlaymerge: A tool that merges overlays
>=20
>  .gitignore           |   1 +
>  Makefile             |   4 +
>  Makefile.utils       |   6 +
>  fdtoverlaymerge.c    | 223 +++++++++++
>  libfdt/fdt_overlay.c | 901 ++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/fdt_rw.c      |  14 +-
>  libfdt/libfdt.h      |  18 +
>  libfdt/version.lds   |   1 +
>  meson.build          |   2 +-
>  9 files changed, 1146 insertions(+), 24 deletions(-)
>  create mode 100644 fdtoverlaymerge.c
>=20
>=20
> base-commit: f4c53f4ebf7809a07666bf728c823005e1f1a612

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--V5oC5rQBmZ/9Se2t
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgtVJoACgkQzQJF27ox
2GcuUA//XN+2qpMfYBBmjxkhtyW0I/L0FUWoMX134WtLdLkFU4JQws61oQhCndZj
IPuNaeP+tiW1r55bqfU99X2DLGb0ykF986XYZU2UB7nB37YhbfubbTMW9lxIQlO2
GzzENKLqWQtEvwbCj/W/BYGm5UAl9lBuy6wKpTBzpWMcPGXoAWHDppQD+hqDrtYU
AwJ2dH7IE7nuFlS7Zqp6e+17M+dLwaJE06gkv24Rwv9VM5ff+NI9pu4aezR6jHXQ
vr/A6KzO4CyuQsuZCpg2VdU6ssflROhJ7GEnhDKj5xmKoziaNMD6ch6Sx3i5wrS7
NlSb5hBHcHBJ+qSLn4TGMdyUYQPggpPMVEI2eg70feIne7kh/JO9ZeCQOPze7jyK
eUqpDVSB6I1uGJ+zCAzTvk89krxHkn4nzC+g5tUT/hO57krQ3Ck8ei/x1QKKbche
9Q1qQT25G4qEEs5opWXNP02RAJzDhgdBr/RNt1T+gn9nDYvnR1togq0K5J+nzuY1
9NPkm9hSUeuBqgyGVF5M9FBcXXBKp0DxjnwV9T42OsBldjOaCUhsO6AX/UyN9R40
/Z9BSfLvfp3uDu7n3OnBdbiLbmqknzXV0R6VYO+34+I1C8N5sEZj57n8YWoYHIFk
b8AIuoapqtNOcj1lq9mfz7X9KpkGDl5c+FkN7nxIIfdrldHs/Sc=
=F6Jx
-----END PGP SIGNATURE-----

--V5oC5rQBmZ/9Se2t--
