From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Introduce fdt_overlay_merge() to allow merge of
 overlay blob
Date: Fri, 2 Oct 2020 13:53:44 +1000
Message-ID: <20201002035344.GO1844@yekko.fritz.box>
References: <1599671882-310027-1-git-send-email-gurbaror@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0u4QAjBqqw4+MLTw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601615084;
        bh=wX6h5g+s7q8kLMYU8qrb7QXEQ1Mpzl6BYCHJDBbMG98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PhLhdjl7zF13Drjq1CYk9inRsxXpaaH1rRlT48VvlRidAxFAkG8RxmvNWMm5Y8HZm
         1VMD5l4M991Rca+25G6U0ppYoUzwUQJIV+F/vlqgy6KzM9QN8bUAaCGKkTKlIFMHrV
         cpQ6E+hQ6g/BtHVV2HTYzt/WRUvBOorMFiaqauks=
Content-Disposition: inline
In-Reply-To: <1599671882-310027-1-git-send-email-gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org


--0u4QAjBqqw4+MLTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 10:17:56AM -0700, Gurbir Arora wrote:
> Hello Upstream Team,
>=20
>          This is the second upstream attempt for the fdtoverlay changes a=
nd the first attempt can
> be found here: https://www.spinics.net/lists/devicetree-compiler/msg01949=
=2Ehtml. All of the
> issues/comments from the first attempt have been addressed and fixed in t=
his patch.

Sorry I've taken so long to look at this.  Before delving into the
code, I think I need to understand your use case a bit better.

There's some confusion here, because there's at least 2 things that
"merging overlays" could mean.

1) Combining 2 overlays into one which will have the same effect as
both applied sequentially.  This is almost trivial, since you can just
list all the fragments of the first, followed by all the fragments of
the second, with only the fixups nodes needing to be actually
"merged".

The question is, does this alone provide any tangible benefit over
just processing a list of overlays in order.

2) "Partially resolving" an overlay.  That is finding cases where we
can determine enough about the targets of 2 fragments that we can
combine the fragments together.  It's entirely possible - both in
theory and in practice with dtc - for a single overlay to have
multiple fragments targetting the same node (or one targetting a
subnode of the first).  Thus, this is something that makes logical
sense on a single overlay.

If you really need both of these operations, I'd suggest separate
entry points for them, so that your "merge" would be (1) followed by
(2) on the result.

> Changelog:
>=20
> v1 -> v2:=20
> - Introduction of new entry point, fdt_overlay_merge(), to handles merging
>   overlay blobs (rather than overload that in fdt_overlay_apply()).
> - Removed use of printf() in libfdt. snprintf() is still used to help wit=
h string
>   manipulation.
> - Changed the logic to identify fragment nodes.
> - Removed use of malloc/calloc and global variables.
> - Incorporated a function that copies a node in the overlay tree along wi=
th its children and their
> properties.
>=20
> fdt_overlay_apply() API currently allows for an overlay DT blob to be mer=
ged
> with a base blob. It assumes that all external symbols specified in overl=
ay
> blob's __fixups__ section are found in base blob's __symbols__ section and
> aborts on the first instance where a symbol could not be found in base bl=
ob.
>=20
> This is mostly fine as the primary use of overlay is on a target for its
> bootloader to merge various overlay blobs based on h/w configuration dete=
cted?
>=20
> We are exploring an extended use of fdt_overlay_apply() for offline use, =
i.e on
> the host (build machine) side, which requires merging two overlay DT blob=
s i.e
> the base (overlay) blob will not resolve all the external node references=
 found
> in overlay blob.
>=20
> Currently all the device-tree (DT) code for a given soc is maintained in a
> common kernel repository. For example, this common DT code will have code=
 for
> audio, video, fingerprint, bluetooth etc. Further this DT code is typical=
ly
> split into a base (soc-common) code and board specific code, with the soc=
 code
> being compiled as soc.dtb and board specific code being compiled as respe=
ctive
> overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware=
 configuration
> of a given SOC while boardX.dtbo represents configuration of a board/plat=
form=20
> designed using that soc.soc.dtb and boardX.dtbo files are flashed separat=
ely on=20
> target (besides improving the overall size of DT blobs flashed on target,=
 Android=20
> Treble also requires separation of soc and board DT bits). Bootloader wil=
l pick=20
> one of the board overlay blobs and merge it with soc.dtb, before booting =
kernel=20
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
> the blobs back to respective blobs found in kernel build tree (soc.dtb or
> boardX.dtbo), as otherwise relying on bootloader to do all the overlay im=
pacts
> boot-time.
>=20
> This brings up the need to merge two overlay blobs (fingerprint-overlay.d=
tbo +
> boardX.dtbo), which currently doesn't seem to be supported and which this=
 patch
> series aims to support.

Can you connect the dots a bit more as to why your neeed overlay
merging?  If the concern is boot time, then it seems like you want to
merge everything into the base tree before boot time, in which case
you can just apply all the overlays in order.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0u4QAjBqqw4+MLTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92pEYACgkQbDjKyiDZ
s5KuTw//bI4dIo/KEXItvnmbo9YYcZn6KCVQoeZMehM9dqp51k5SZLGYHjBfeY/C
AulFr/+bxsp3IgetrlDYw6l9e52Ia7Z6v1Qu+lCnS06zmbaPSSNCAVOhKHwzOp74
ETpeWTrv+kiWX/D5A6eHQrL/yyrvYmYOce8deTDOOfLBlOHZLhT9gh6zXUJkMSt5
YBAcHtUmAmvfYSSSLZD33wS4L1Bhxcs5KA9tfE7NED6/4dIRlIt7vXUd8Jcm/FY3
7tPQmujY99lyv/tfn1iEaJ3NNeKpFdmfG6FT9sktA2HVuOtdMLIPBdYW28LffGgG
iI86XsoNOApVvpYFptuy9RFcnccB0HU97Q4Svoa+T45q9sLLfCu7Cz5nvUnQhXGY
foeXXF9y+Ucymi+4KObql0Hmty2IDmdpvxwYNPK97s3MWFS22kvRDB87BhOXqGgb
TKTlqqEV9kxcWj8HfFgjwb6D7TjgvFHD2MR8396+0VIm/9p8JmOqVB28MMMRqMG6
uut8fFXqsG3Dvfl1V32CQYj9mhQ5QjUbShfGovgrgwofkRxQgW6xd/IDdTtUHx07
kEoXmHeNa/aTAZhppfPtuYAQVQ7wzUbgFbJzJlhMH8q7QCAutb7kQs+aNfnxHKe4
Y0O31il95GmJZ+3X9Aw2XpeTuLQiMiEQmeM7HXm/f9C6xTFQ9z8=
=yfmX
-----END PGP SIGNATURE-----

--0u4QAjBqqw4+MLTw--
