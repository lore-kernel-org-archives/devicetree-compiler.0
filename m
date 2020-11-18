From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Check for 8-byte address alignment in
 fdt_ro_probe_()
Date: Wed, 18 Nov 2020 15:54:24 -0500
Message-ID: <20201118205424.GM5340@bill-the-cat>
References: <20201104130605.28874-1-trini@konsulko.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H8v0AKYbMTBGAAClZDv2z6bur8tSNUe966+p4gciLdE=;
        b=qE+oIKgcnQ5qLeueaEDr9i2xCva5uhXiwd0DxopUuZJ2cJmqH+UyoMHDht2UPtsyJm
         HvDOz7yTM0AVGIlLZEpMONyOELx6dli1+vq61C+c5l/FAeTaR3FBAAf3SYJOvTdY0FpL
         WRYiepFc+ANKMXfuhKxbAGagey6sjb0iGgPVY=
Content-Disposition: inline
In-Reply-To: <20201104130605.28874-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Wed, Nov 04, 2020 at 08:06:05AM -0500, Tom Rini wrote:

> The device tree must be loaded in to memory at an 8-byte aligned
> address.  Add a check for this condition in fdt_ro_probe_() and a new
> error code to return if we are not.
> 
> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  libfdt/fdt.c    | 4 ++++
>  libfdt/libfdt.h | 6 +++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 6cf2fa03b037..3e893073da05 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -22,6 +22,10 @@ int32_t fdt_ro_probe_(const void *fdt)
>  	if (can_assume(VALID_DTB))
>  		return totalsize;
>  
> +	/* The device tree must be at an 8-byte aligned address */
> +	if ((uintptr_t)fdt & 7)
> +		return -FDT_ERR_ALIGNMENT;
> +
>  	if (fdt_magic(fdt) == FDT_MAGIC) {
>  		/* Complete tree */
>  		if (!can_assume(LATEST)) {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 544d3efff584..b600c8d6dd41 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -101,7 +101,11 @@ extern "C" {
>  	/* FDT_ERR_BADFLAGS: The function was passed a flags field that
>  	 * contains invalid flags or an invalid combination of flags. */
>  
> -#define FDT_ERR_MAX		18
> +#define FDT_ERR_ALIGNMENT	19
> +	/* FDT_ERR_ALIGNMENT: The device tree base address is not 8-byte
> +	 * aligned. */
> +
> +#define FDT_ERR_MAX		19
>  
>  /* constants */
>  #define FDT_MAX_PHANDLE 0xfffffffe

Any comments?  Thanks.

-- 
Tom
