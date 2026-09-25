Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE783BCD0B
	for <devicetree-compiler@vger.kernel.org>; Fri, 25 Sep 2026 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355796; cv=none; b=is0H38qQb+WesswV1SUeD8HvuwRzPmB15Lf5jovYFFurC8BtvPyhhKU9Rbnl2miWIDA/n0dYdF62QEQYJXjgJ3BdzthCqKYa9Ec9H1/fUkir9DBAIXCVwZN6yyEDW5MuM+fKjXaCsWNk1NInvE71d/MkdLFCT5YBuNZpn2kvb7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355796; c=relaxed/simple;
	bh=dlMcQAtcsplf+UQ74AfU4eRIfGdXWAVKKhIW7D6IGZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVwlQISApxZil4FVL4gcPRZz2B4llH6SjRn7P08gq1bdwuA93trQ0dqOyTc5uHv2m2OdsLmF4KDSf/dzRD1xQk4vXD+zftyaOPIA9WkVjJ7KgnBD3eDyFP6Y7vkX1+WXpXwVdSbrNI4ayJclr9Ay1jmhrKNrVXJ9m0w8OIjDi6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VY2mHxB+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VY2mHxB+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E6F14E41074;
	Fri, 25 Sep 2026 17:03:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22E156073B;
	Fri, 25 Sep 2026 17:03:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04B56102F1E32;
	Fri, 25 Sep 2026 19:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790355782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YBwyj/YSkQfbpAPsvfRK0fYFf4tbVDZmq82ucRZXW3Q=;
	b=VY2mHxB+Kn3PtsTlAfXzlxCCXuReQE7BcHsV8xdkWHWX44WFTeCqm4+Aej/BI9VLicOWWe
	73BEoDlqPKR4WRV64Ys2hCXTkWAQG+O/uMbPhoPDh72q2rijZnesZdsm1Qmhq0pZw29iwf
	Z2lM161AP954QP521XSRmjm31vtQK31wQu6FV9EyVYOkAW69YO4ONyvVGp3k/46t8DAJhB
	Tf+l2Dgr/8iUYFkdvIZ5BlOC6ZoHowahEC/C3oMo/x5ggxn91KEAVFzV72i3GJ+0fnmj/m
	lsZ9cVYxmHV61Ih2+D5UiFl6tA+LuxCGlr682xARC0hOUDfKyupQZs0drthNRQ==
Date: Fri, 25 Sep 2026 19:03:00 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about overlapping reserved-memory ranges
Message-ID: <20260925190300.7e3c1620@bootlin.com>
In-Reply-To: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
References: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Bjorn,


On Wed, 23 Sep 2026 17:50:18 +0000
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com> wrote:

> Static /reserved-memory entries associate physical address ranges with
> particular purposes and properties. While not explicitly prohibited,
> overlapping ranges commonly indicate an incorrect address or size and
> may assign the same memory conflicting attributes. Dtc currently
> provides no diagnostic for this type of mistake.
> 
> Check every non-empty reg range under available reserved-memory children
> and report overlaps. Add tests covering overlapping and adjacent ranges,
> as well as unavailable, zero-sized, and dynamically allocated regions.

I am not so sure that this has to checked by dtc.

Should dtc have the knowledge of /reserved-memory nodes and sub-nodes meaning?

Overlaps on regs and size can appear in many places in the devicetree which
are not correct from a functional point of view. Should dtc check this kind
of issue? I am not so sure.

I'm not in a position to judge the validity of the test but, anyway, I can
review the code.

> 
> Assisted-by: pi:gpt-5.6-sol
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  checks.c                             | 131 +++++++++++++++++++++++++++++++++++
>  tests/reserved-memory-no-overlap.dts |  43 ++++++++++++
>  tests/reserved-memory-overlap.dts    |  21 ++++++
>  tests/run_tests.sh                   |   2 +
>  4 files changed, 197 insertions(+)
> 
> diff --git a/checks.c b/checks.c
> index a6037ed08000..baa0914e37a5 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1266,6 +1266,136 @@ static bool node_is_disabled(struct node *node)
>  	return false;
>  }
>  
> +static bool node_is_available(struct node *node)
> +{
> +	struct property *prop;
> +	const char *status;
> +
> +	prop = get_property(node, "status");
> +	if (!prop)
> +		return true;
> +
> +	if (!data_is_one_string(prop->val))
> +		return false;
> +
> +	status = prop->val.val;
> +	return streq(status, "okay") || streq(status, "ok");
> +}
> +
> +static bool get_reg_value(struct property *reg, unsigned int cell,
> +			  int cell_count, uint64_t *value)
> +{
> +	uint64_t val = 0;
> +	int i;
> +
> +	if (cell_count < 0 || cell_count > 2)
> +		return false;
> +
> +	for (i = 0; i < cell_count; i++)
> +		val = (val << 32) | propval_cell_n(reg, cell + i);
> +
> +	*value = val;
> +	return true;
> +}
> +
> +static bool ranges_overlap(uint64_t addr_a, uint64_t size_a,
> +			   uint64_t addr_b, uint64_t size_b)
> +{
> +	if (!size_a || !size_b)
> +		return false;
> +
> +	if (addr_a <= addr_b)
> +		return addr_b - addr_a < size_a;
> +
> +	return addr_a - addr_b < size_b;
> +}
> +
> +static void format_range_end(char end_str[20], uint64_t addr, uint64_t size)
> +{
> +	uint64_t end = addr + size;
> +
> +	if (end < addr)
> +		snprintf(end_str, 20, "0x1%016" PRIx64, end);
> +	else
> +		snprintf(end_str, 20, "0x%" PRIx64, end);
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
> +	} *ranges = NULL;
> +	struct node *child;
> +	unsigned int range_count = 0;
> +	int addr_cells, size_cells, entry_cells;
> +
> +	if (!streq(node->fullpath, "/reserved-memory"))
> +		return;
> +
> +	addr_cells = node_addr_cells(node);
> +	size_cells = node_size_cells(node);
> +	entry_cells = addr_cells + size_cells;
> +
> +	/* Physical addresses and sizes wider than 64 bits cannot be compared. */
> +	if (addr_cells > 2 || size_cells > 2 || entry_cells <= 0)
> +		return;
> +
> +	for_each_child(node, child) {
> +		struct property *reg;
> +		unsigned int cell;
> +
> +		if (!node_is_available(child))
> +			continue;

Could a "status" property be present in a /reserved-memory subnode?

> +
> +		reg = get_property(child, "reg");
> +		if (!reg)
> +			continue;
> +
> +		for (cell = 0; cell < reg->val.len / sizeof(cell_t);
> +		     cell += entry_cells) {
> +			uint64_t addr, size;
> +			unsigned int i;
> +
> +			if (!get_reg_value(reg, cell, addr_cells, &addr) ||
> +			    !get_reg_value(reg, cell + addr_cells,
> +					   size_cells, &size))
> +				continue;
> +
> +			for (i = 0; i < range_count; i++) {
> +				char end[20], other_end[20];
> +
> +				if (!ranges_overlap(addr, size, ranges[i].addr,
> +						    ranges[i].size))
> +					continue;
> +
> +				format_range_end(end, addr, size);
> +				format_range_end(other_end, ranges[i].addr,
> +						 ranges[i].size);

Why do you need to convert to a string ?


> +				FAIL(c, dti, child,
> +				     "reg range [0x%" PRIx64 ", %s) overlaps with %s "
> +				     "[0x%" PRIx64 ", %s)",
> +				     addr, end, ranges[i].node->fullpath,
> +				     ranges[i].addr, other_end);

Weird to have '[' and ')'.

Also, IHMO, end and other_end don't bring any benefit in the message.

I think the following message is enough:
--- 8< ---
  "reg 0x%PRIx64 size 0x%PRIx64 overlaps with reg 0x%PRIx64 size 0x%PRIx64 from %s",
     addr, size, ranges[i].addr, ranges[i].size, ranges[i].node->fullpath
--- 8< ---

or in a more compact way:
 "reg (0x%PRIx64, 0x%PRIx64) overlaps with reg (0x%PRIx64, 0x%PRIx64) from %s",

> +			}
> +
> +			ranges = xrealloc(ranges,
> +					  (range_count + 1) * sizeof(*ranges));
> +			ranges[range_count].node = child;
> +			ranges[range_count].addr = addr;
> +			ranges[range_count].size = size;
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
> @@ -1945,6 +2075,7 @@ static struct check *check_table[] = {
>  
>  	&avoid_default_addr_size,
>  	&avoid_unnecessary_addr_size,
> +	&reserved_memory_overlap,
>  	&unique_unit_address,
>  	&unique_unit_address_if_enabled,
>  	&obsolete_chosen_interrupt_controller,
> diff --git a/tests/reserved-memory-no-overlap.dts b/tests/reserved-memory-no-overlap.dts
> new file mode 100644
> index 000000000000..0293986ef746
> --- /dev/null
> +++ b/tests/reserved-memory-no-overlap.dts
> @@ -0,0 +1,43 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		first@100000000 {
> +			reg = <0x1 0x00000000 0x0 0x00100000>;
> +		};
> +
> +		adjacent@100100000 {
> +			reg = <0x1 0x00100000 0x0 0x00100000>;
> +		};
> +
> +		disabled@100020000 {
> +			reg = <0x1 0x00020000 0x0 0x00100000>;
> +			status = "disabled";
> +		};
> +
> +		reserved@100040000 {
> +			reg = <0x1 0x00040000 0x0 0x00100000>;
> +			status = "reserved";
> +		};
> +
> +		failed@100060000 {
> +			reg = <0x1 0x00060000 0x0 0x00100000>;
> +			status = "fail";
> +		};
> +
> +		zero-size@100080000 {
> +			reg = <0x1 0x00080000 0x0 0x0>;
> +		};
> +
> +		dynamic {
> +			size = <0x0 0x00100000>;
> +		};
> +	};
> +};
> diff --git a/tests/reserved-memory-overlap.dts b/tests/reserved-memory-overlap.dts
> new file mode 100644
> index 000000000000..fec7c3a33b1f
> --- /dev/null
> +++ b/tests/reserved-memory-overlap.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		first@100000000 {
> +			reg = <0x1 0x00000000 0x0 0x00100000>,
> +			      <0x2 0x00000000 0x0 0x00200000>;
> +		};
> +
> +		second@200100000 {
> +			reg = <0x2 0x00100000 0x0 0x00100000>;
> +		};

And other dts with only one node but with a reg composed to 2 items which
overlap could be a good test pattern.

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
> +    check_tests "$SRCDIR/reserved-memory-overlap.dts" reserved_memory_overlap
> +    check_tests "$SRCDIR/reserved-memory-no-overlap.dts" -n reserved_memory_overlap
>      check_tests "$SRCDIR/obsolete-chosen-interrupt-controller.dts" obsolete_chosen_interrupt_controller
>      check_tests "$SRCDIR/reg-without-unit-addr.dts" unit_address_vs_reg
>      check_tests "$SRCDIR/unit-addr-without-reg.dts" unit_address_vs_reg
> 
> ---
> base-commit: 7a1e017926004ecff5fce62d62d42ce9f3e00082
> change-id: 20260923-check-reserved-overlap-6c5fc2214ea4
> 
> Best regards,
> --  
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> 

Best regards,
Hervé
