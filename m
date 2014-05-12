From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] libfdt: Add address translation functions
Date: Mon, 12 May 2014 14:01:14 -0500
Message-ID: <CAL_Jsq+Lppxf7OHO1ekqpc7E+P8cMJcTOftZSd2TrN8kb4PQuQ@mail.gmail.com>
References: <1399874771-23089-1-git-send-email-david@gibson.dropbear.id.au>
	<1399874771-23089-2-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Xb1EFOejfSeA6uHM4UZn8GYGI4vVWcPGNUvSvUCToTs=;
        b=c+NANyeS/wMTMd1P8FUKXJ3KNquqM3yyEPeT+HbxD8Q4cfSzx9YES5FQLJgzRfBeoH
         gQTR1bziJ0qVliEzS6Ss+bz20MzibazSdYOqw/f2yDmJ9nzG49SHMjtypJ/yS1LiJvW5
         yHYjc/C4iny5zm18AuQukI10YLVMki5zA+6YvYzvYN7PTCrA3JaC4q6MinvxBwpzkwV9
         6RoOC7HYcMtS/2pRnMtzD5wMBpwrQAoU/3b9wbKY18qh12YYLOmIKVpmMxH+VQtz1gmJ
         2gjKdq+SPVJamnqoGrB3lM5A6nmy7IUYG3tXzHb3d0CrydfpreYJTlI+AuIZ3wClvnRz
         VubQ==
In-Reply-To: <1399874771-23089-2-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-ClAdetSTwOo@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Mon, May 12, 2014 at 1:06 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> Add the fdt_address_translate() function to process 'ranges' properties
> to translate addresses from one bus to another.

Some trailing whitespace errors:

Applying: libfdt: Add address translation functions
dtc/.git/rebase-apply/patch:87: trailing whitespace.

dtc/.git/rebase-apply/patch:208: trailing whitespace.
 * @inbusoffset: offset of node which defines the address space of the input
dtc/.git/rebase-apply/patch:342: trailing whitespace.

warning: 3 lines add whitespace errors.

[...]


> +int fdt_address_translate(const void *fdt,
> +                         int inbusoffset, const fdt32_t *inaddr,
> +                         int outbusoffset, fdt32_t *outaddr)

The translated address in native endian would be more useful, but more
importantly how does one determine the translated address size needed
to convert it? I don't see any reason for the caller to have the
outaddr in be32. While in theory you could need something larger than
a uint64_t, the reality is any >2 cell case is broken anyway.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
