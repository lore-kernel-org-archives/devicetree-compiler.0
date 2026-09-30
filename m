Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81AF3C1D50
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Sep 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762960; cv=none; b=tLIaA36JoEIWnutaCQgOLowWOJvNtnbHFplVe8TgJtUNFI1qzu2jAssSuuYMP7RvP6GUf9L/VRqzzO8GWpw8ihXMPUwhyspzbD33mAWUte7NVwjPoUL3xCmwviiITkAyRwQovzsXfaW5qyd2TCu7TKvOO62pn5lncgGcvDMurok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762960; c=relaxed/simple;
	bh=rIBpbWe0LtiQyPqcWz56eiRkrUNsXomoDvdj6LyTRvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPOipnFG0Dcb205ljFgymB3simRXf6ppAGsSwP6dRgwPnBkUhJ/Mx+FrLWf+Fy0sPuf7ZBi1on5ASWObzamBov9jadHlvvtmainWsw5QnmQigJKpP8SwOKWr+v5bSgbZcIakMt661G2xDHK02X9i2XZ4wazinMamhiFVuibJBhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=OnpzcMdM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="OnpzcMdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1790762922;
	bh=hT4eHHhvubiNY59hWjnh1n80vSX9bts3if98wBtEWnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnpzcMdMyxoOyUsSWOC8MZxIXXz1JrBUXrxJ0ihyLbdG3llSD/+NA0+ifLFSHJYli
	 eBNTKpHy6gngD5vtoNv4QjtAdF0eS3PaLWciYIKYEwT9DNEOs02mfqF7GM/BTyPaa1
	 6YQbxh/npQ5w8pHXTp0WZgb3+Hno8DxCaew5XK9RPEBdE2s9iv47YgbS7NbvogfjvZ
	 mHym0BR1nRjeJNgEgDs5uTrIXfTYXqGaBgT6zKEyzIEuotl7Z2R9fvzCVPPD1zevH0
	 /BrnXUAlPA4T+Fy5fdHTfTL1Lz8KEHInjtVsfbXs03Ljd82dkzYuK9V9kghUrwxYib
	 D7bdNRkgHC0ag==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hvrNV5lBrz4w02; Wed, 30 Sep 2026 20:08:42 +1000 (AEST)
Date: Wed, 30 Sep 2026 20:09:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about overlapping reserved-memory ranges
Message-ID: <arzftrUIt95F--kU@gractus.seuss>
References: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wk1E5wV6D2ekzgMm"
Content-Disposition: inline
In-Reply-To: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>

--Wk1E5wV6D2ekzgMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 05:50:18PM +0000, Bjorn Andersson wrote:
> Static /reserved-memory entries associate physical address ranges with
> particular purposes and properties. While not explicitly prohibited,
> overlapping ranges commonly indicate an incorrect address or size and
> may assign the same memory conflicting attributes. Dtc currently
> provides no diagnostic for this type of mistake.
>=20
> Check every non-empty reg range under available reserved-memory children
> and report overlaps. Add tests covering overlapping and adjacent ranges,
> as well as unavailable, zero-sized, and dynamically allocated regions.

Hm.  It occurs to me that overlapping reg values are generally bad on
*any* bus, not just /reserved-memory.  It might be worth generalising
that part of the test.

> Assisted-by: pi:gpt-5.6-sol
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  checks.c                             | 131 +++++++++++++++++++++++++++++=
++++++
>  tests/reserved-memory-no-overlap.dts |  43 ++++++++++++
>  tests/reserved-memory-overlap.dts    |  21 ++++++
>  tests/run_tests.sh                   |   2 +
>  4 files changed, 197 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index a6037ed08000..baa0914e37a5 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1266,6 +1266,136 @@ static bool node_is_disabled(struct node *node)
>  	return false;
>  }
> =20
> +static bool node_is_available(struct node *node)

Do we really need a new function, rather than just
!node_is_disabled()?

> +{
> +	struct property *prop;
> +	const char *status;
> +
> +	prop =3D get_property(node, "status");
> +	if (!prop)
> +		return true;
> +
> +	if (!data_is_one_string(prop->val))
> +		return false;
> +
> +	status =3D prop->val.val;
> +	return streq(status, "okay") || streq(status, "ok");

I'm pretty sure only "okay" is acceptable according to IEEE1275 - I'm
not sure if the flat tree specs expanded on that.

Which does suggest that a check for valid values of the 'status'
property (not just that it's a string) might be a good idea.

> +}
> +
> +static bool get_reg_value(struct property *reg, unsigned int cell,
> +			  int cell_count, uint64_t *value)
> +{
> +	uint64_t val =3D 0;
> +	int i;
> +
> +	if (cell_count < 0 || cell_count > 2)

cell_count < 0 is nonsensical, it should be an unsigned parameter.

> +		return false;
> +
> +	for (i =3D 0; i < cell_count; i++)
> +		val =3D (val << 32) | propval_cell_n(reg, cell + i);
> +
> +	*value =3D val;
> +	return true;

I don't love the fact that this is limited to cases with either 1 or 2
cells.  I'd kind of prefer a general 'reg' overlap checker, although I
recognize that's significantly more complex.


> +}
> +
> +static bool ranges_overlap(uint64_t addr_a, uint64_t size_a,
> +			   uint64_t addr_b, uint64_t size_b)
> +{
> +	if (!size_a || !size_b)
> +		return false;

I'm not sure if this makes sense.  If there's a zero-length range in
the middle of another range it's not technically an overlap, but it
still seems a dubious looking situation that we should probably warn
about.

> +	if (addr_a <=3D addr_b)
> +		return addr_b - addr_a < size_a;
> +
> +	return addr_a - addr_b < size_b;
> +}
> +
> +static void format_range_end(char end_str[20], uint64_t addr, uint64_t s=
ize)

Arbitrary open-coded string lengths are not ok.

> +{
> +	uint64_t end =3D addr + size;
> +
> +	if (end < addr)
> +		snprintf(end_str, 20, "0x1%016" PRIx64, end);
> +	else
> +		snprintf(end_str, 20, "0x%" PRIx64, end);

This seems a very convoluted way of going about things.  You could
instead express memory ranges in inclusive format
(e.g. 0x1000..0x1fff), to avoid the overflow occuring in the first
place.

> +}
> +
> +static void check_reserved_memory_overlap(struct check *c,
> +					  struct dt_info *dti,
> +					  struct node *node)
> +{
> +	struct reserve_range {
> +		struct node *node;
> +		uint64_t addr;
> +		uint64_t size;
> +	} *ranges =3D NULL;
> +	struct node *child;
> +	unsigned int range_count =3D 0;
> +	int addr_cells, size_cells, entry_cells;

These should be unsigned.

> +
> +	if (!streq(node->fullpath, "/reserved-memory"))
> +		return;
> +
> +	addr_cells =3D node_addr_cells(node);
> +	size_cells =3D node_size_cells(node);
> +	entry_cells =3D addr_cells + size_cells;

You try to check for overflow below, but *signed* integer overflow is
UB the moment it happens, it's too late to check it below.  But this
should be unsigned anyway.

> +
> +	/* Physical addresses and sizes wider than 64 bits cannot be compared. =
*/
> +	if (addr_cells > 2 || size_cells > 2 || entry_cells <=3D 0)

Hmm.  If addr_cells + size_cells overflows we have much bigger
problems than this test.  Maybe we should expand sanity checks for
#address-cells and #size-cells and make that a prerequisite for this
check.

> +		return;
> +
> +	for_each_child(node, child) {
> +		struct property *reg;
> +		unsigned int cell;
> +
> +		if (!node_is_available(child))
> +			continue;

Is the 'status' property used in /reserved-memory?  That seems... weird.

> +
> +		reg =3D get_property(child, "reg");
> +		if (!reg)
> +			continue;
> +
> +		for (cell =3D 0; cell < reg->val.len / sizeof(cell_t);
> +		     cell +=3D entry_cells) {
> +			uint64_t addr, size;
> +			unsigned int i;
> +
> +			if (!get_reg_value(reg, cell, addr_cells, &addr) ||
> +			    !get_reg_value(reg, cell + addr_cells,
> +					   size_cells, &size))
> +				continue;
> +
> +			for (i =3D 0; i < range_count; i++) {
> +				char end[20], other_end[20];
> +
> +				if (!ranges_overlap(addr, size, ranges[i].addr,
> +						    ranges[i].size))
> +					continue;
> +
> +				format_range_end(end, addr, size);
> +				format_range_end(other_end, ranges[i].addr,
> +						 ranges[i].size);
> +				FAIL(c, dti, child,
> +				     "reg range [0x%" PRIx64 ", %s) overlaps with %s "
> +				     "[0x%" PRIx64 ", %s)",
> +				     addr, end, ranges[i].node->fullpath,
> +				     ranges[i].addr, other_end);
> +			}
> +
> +			ranges =3D xrealloc(ranges,
> +					  (range_count + 1) * sizeof(*ranges));
> +			ranges[range_count].node =3D child;
> +			ranges[range_count].addr =3D addr;
> +			ranges[range_count].size =3D size;
> +			range_count++;
> +		}
> +	}
> +
> +	free(ranges);
> +}
> +WARNING(reserved_memory_overlap, check_reserved_memory_overlap, NULL,
> +	&addr_size_cells, &reg_format);
> +
>  static void check_unique_unit_address_common(struct check *c,
>  						struct dt_info *dti,
>  						struct node *node,
> @@ -1945,6 +2075,7 @@ static struct check *check_table[] =3D {
> =20
>  	&avoid_default_addr_size,
>  	&avoid_unnecessary_addr_size,
> +	&reserved_memory_overlap,
>  	&unique_unit_address,
>  	&unique_unit_address_if_enabled,
>  	&obsolete_chosen_interrupt_controller,
> diff --git a/tests/reserved-memory-no-overlap.dts b/tests/reserved-memory=
-no-overlap.dts
> new file mode 100644
> index 000000000000..0293986ef746
> --- /dev/null
> +++ b/tests/reserved-memory-no-overlap.dts
> @@ -0,0 +1,43 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +

Hrm.  Is 'ranges' really supposed to be there according to the
/reserved-memory binding?  That indicates this is a bridge with
identity mapping, which doesn't make a lot of sense for an
informational node like this.

Also, is there no 'compatible' that should be resent for /reserved-memory?

> +		first@100000000 {
> +			reg =3D <0x1 0x00000000 0x0 0x00100000>;
> +		};
> +
> +		adjacent@100100000 {
> +			reg =3D <0x1 0x00100000 0x0 0x00100000>;
> +		};
> +
> +		disabled@100020000 {
> +			reg =3D <0x1 0x00020000 0x0 0x00100000>;
> +			status =3D "disabled";
> +		};
> +
> +		reserved@100040000 {
> +			reg =3D <0x1 0x00040000 0x0 0x00100000>;
> +			status =3D "reserved";

"reserved" is not a valid value for 'status' according to IEEE 1275
(p188).

> +		};
> +
> +		failed@100060000 {
> +			reg =3D <0x1 0x00060000 0x0 0x00100000>;
> +			status =3D "fail";
> +		};
> +
> +		zero-size@100080000 {
> +			reg =3D <0x1 0x00080000 0x0 0x0>;
> +		};
> +
> +		dynamic {
> +			size =3D <0x0 0x00100000>;
> +		};
> +	};
> +};
> diff --git a/tests/reserved-memory-overlap.dts b/tests/reserved-memory-ov=
erlap.dts
> new file mode 100644
> index 000000000000..fec7c3a33b1f
> --- /dev/null
> +++ b/tests/reserved-memory-overlap.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		first@100000000 {
> +			reg =3D <0x1 0x00000000 0x0 0x00100000>,
> +			      <0x2 0x00000000 0x0 0x00200000>;
> +		};
> +
> +		second@200100000 {
> +			reg =3D <0x2 0x00100000 0x0 0x00100000>;
> +		};
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 842b543059bb..27c3ebfed338 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -746,6 +746,8 @@ dtc_tests () {
>      check_tests "$SRCDIR/reg-ranges-root.dts" reg_format ranges_format
>      check_tests "$SRCDIR/bad-dma-ranges.dts" dma_ranges_format
>      check_tests "$SRCDIR/default-addr-size.dts" avoid_default_addr_size
> +    check_tests "$SRCDIR/reserved-memory-overlap.dts" reserved_memory_ov=
erlap
> +    check_tests "$SRCDIR/reserved-memory-no-overlap.dts" -n reserved_mem=
ory_overlap
>      check_tests "$SRCDIR/obsolete-chosen-interrupt-controller.dts" obsol=
ete_chosen_interrupt_controller
>      check_tests "$SRCDIR/reg-without-unit-addr.dts" unit_address_vs_reg
>      check_tests "$SRCDIR/unit-addr-without-reg.dts" unit_address_vs_reg
>=20
> ---
> base-commit: 7a1e017926004ecff5fce62d62d42ce9f3e00082
> change-id: 20260923-check-reserved-overlap-6c5fc2214ea4
>=20
> Best regards,
> -- =20
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Wk1E5wV6D2ekzgMm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmq837YACgkQzQJF27ox
2Gem5g/+LiDAiA2ARwj0e0CKjVRi48xfvvMjoD9GFur74QtLcL9HvQQcXYosiBin
w0vavO/W0KNCKISXvSAE05sPdTxa99TnOyqNk684GG8MvlgUIptu1YQ9TGDpID9J
vLKdlv6aP5UCqOxRlGWIVUmF1Bmb7pbagv2cVbKc2zINgXpZqo3Z+y6n2geK+2vc
4bOpsNS2I0cWQf07s7eI84eCWPWYD9fsovyUgoJdCGa6+cyk0dbbVWQ+c5J+osjQ
OVeG4Wl+oe6MYDNRWNVDgZvnP/xDVvxcLkv8Ec4sVpji8WDtEutG1ztj1qiK+MXE
Z1R/d+dI89UWGXyTN4qSwA/lBpZ2XNE8XExQOylDh66VbN3m2tuhw5vAhYxB4Laz
iYirwZD+WjCMArfr83DDjRptVOzb0yuIPKj5YzH1/JuPmBoJliTnOTmtONNu/3We
epJ0n5I0X2eudy4zZwPW61/cE+6kByw6LRpwnmtUfo04fYYrd6GmHUWdmW7LKim1
ErqDna7z9o+zKXlA/kr79S2vFAUyb63S+IdMQFtHR5Grl5JDHIZH3WcI03Fto5mq
jmjoky9uTumZvvIMpBK1d+t/Ce2MZQTOT49O9zRPLZSDHVAnnJIQPwQo8RBc7rq8
779ubMwIYLOUi4OR1ao4slLF+L2/juxNw+AuyUbsGPhKQw4MQ/o=
=ljq1
-----END PGP SIGNATURE-----

--Wk1E5wV6D2ekzgMm--
