From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v2 6/9] libfdt: Add max phandle retrieval
	function
Date: Thu, 09 Jun 2016 19:55:39 -0700
Message-ID: <1c2a60de1fd7026565b8d324391670d8@agner.ch>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-7-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1464340402-2249-7-git-send-email-maxime.ripard@free-electrons.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1465527411; bh=GOLO50jgZPHpI3NoeRzxoEGbJj8Xc5I5kkufws1bbL4=;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 b=C1V1QWILbV8X/VEDMUa9zDKWfnYYisHGSgmN2FigjRsz5x8rAIEm/uXaVNqxSkoQPj/zTN+fW22srk5R5h9l1OCR/flp95DV6cm3Xtc6+3vS+2KYWtDNHpxsHVEkaK9zbNeLmmeia16z922jUio7+HMXmorMMftolkGrw9JRa78=
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
> Add a function to retrieve the highest phandle in a given device tree.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  include/libfdt.h    | 13 +++++++++++++
>  lib/libfdt/fdt_ro.c | 15 +++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/include/libfdt.h b/include/libfdt.h
> index 4e8eb9ede3a4..1e01b2c7ebdf 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -284,6 +284,19 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
>  const char *fdt_string(const void *fdt, int stroffset);
>  
>  /**
> + * fdt_get_max_phandle - retrieves the highest phandle in a tree
> + * @fdt: pointer to the device tree blob
> + *
> + * fdt_get_max_phandle retrieves the highest phandlle in the given

Typo: phandlle

> + * device tree
> + *
> + * returns:
> + *      the highest phandle on success
> + *      0, if an error occured

Typo: occur(r)ed

Otherwise looks good to me!

Reviewed-by: Stefan Agner <stefan@agner.ch>

> + */
> +uint32_t fdt_get_max_phandle(const void *fdt);
> +
> +/**
>   * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
>   * @fdt: pointer to the device tree blob
>   *
> diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
> index 7b0777b67eb3..9130ce718965 100644
> --- a/lib/libfdt/fdt_ro.c
> +++ b/lib/libfdt/fdt_ro.c
> @@ -47,6 +47,21 @@ static int _fdt_string_eq(const void *fdt, int stroffset,
>  	return (strnlen(p, len + 1) == len) && (memcmp(p, s, len) == 0);
>  }
>  
> +uint32_t fdt_get_max_phandle(const void *fdt)
> +{
> +	uint32_t max_phandle = 0, phandle;
> +	int offset;
> +
> +	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
> +	     offset = fdt_next_node(fdt, offset, NULL)) {
> +		phandle = fdt_get_phandle(fdt, offset);
> +		if (phandle > max_phandle)
> +			max_phandle = phandle;
> +	}
> +
> +	return max_phandle;
> +}
> +
>  int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
>  {
>  	FDT_CHECK_HEADER(fdt);
