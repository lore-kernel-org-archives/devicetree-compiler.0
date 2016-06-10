From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v2 5/9] libfdt: Add iterator over properties
Date: Thu, 09 Jun 2016 19:51:23 -0700
Message-ID: <f00eb3469391b1d3d473c227531cf7a7@agner.ch>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-6-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1464340402-2249-6-git-send-email-maxime.ripard@free-electrons.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1465527154; bh=amIS1LiH83BcCeHH0g/0CDDyDBGlSe3l4gE+bERJ9/g=;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 b=h0ZWodd41J04GhFFJ5gQo1CPsbTamLaWwfZVcwyfBAF1kQc+QlE2sXlbDlK8tO6Lw0smGhi2Hbdko+hsG379yPmy3XMBJkGrjNTz+mgCsVKgn2wzzL14/ZyPg5YEpmi0H7alLlcziuIrgmYh7LE32AzpqeSH5Wr2rhyZsTD9POM=
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alexander Kaplan <alex@nextthing.co>, devicetree-compiler@vger.kernel.org

On 2016-05-27 02:13, Maxime Ripard wrote:
> Implement a macro based on fdt_first_property_offset and
> fdt_next_property_offset that provides a convenience to iterate over all
> the properties of a given node.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  include/libfdt.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Stefan Agner <stefan@agner.ch>

There would be already be several opportunities in existing code to use
that :-)

> 
> diff --git a/include/libfdt.h b/include/libfdt.h
> index 74b1d149c2dd..4e8eb9ede3a4 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -441,6 +441,30 @@ int fdt_first_property_offset(const void *fdt,
> int nodeoffset);
>  int fdt_next_property_offset(const void *fdt, int offset);
>  
>  /**
> + * fdt_for_each_property - iterate over all properties of a node
> + * @fdt:	FDT blob (const void *)
> + * @node:	node offset (int)
> + * @property:	property offset (int)
> + *
> + * This is actually a wrapper around a for loop and would be used like so:
> + *
> + *	fdt_for_each_property(fdt, node, property) {
> + *		...
> + *		use property
> + *		...
> + *	}
> + *
> + * Note that this is implemented as a macro and property is used as
> + * iterator in the loop. It should therefore be a locally allocated
> + * variable. The node variable on the other hand is never modified, so
> + * it can be constant or even a literal.
> + */
> +#define fdt_for_each_property(fdt, node, property)		\
> +	for (property = fdt_first_property_offset(fdt, node);	\
> +	     property >= 0;					\
> +	     property = fdt_next_property_offset(fdt, property))
> +
> +/**
>   * fdt_get_property_by_offset - retrieve the property at a given offset
>   * @fdt: pointer to the device tree blob
>   * @offset: offset of the property to retrieve
