From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 6/9] libfdt: Add max phandle retrieval function
Date: Fri, 10 Jun 2016 18:13:00 +0300
Message-ID: <2AE7D3B0-3F2F-4F4C-B46E-C23EE25D178B@konsulko.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com> <1464340402-2249-7-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:mime-version:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PdZfBkzkjFgL8B64rIDsxc4Orkw50FN15UlAzz1vM6c=;
        b=Xf1SbC9SU8qGaq/EeT4s4rlKL9Asb1AAtMxWBk4tWARwQxzJe9kCmL/s0ah4JYOIxs
         18Udv8vGF5ajowU/1ZIqnN8eeZDR9WjMsA04oF+KOB2jL6bxp4ep72YWvpOcP0OkrRJw
         LRIGwoO6EiXrPPZADQk0R1pDeNDqLN214yY/c=
In-Reply-To: <1464340402-2249-7-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


> On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electro=
ns.com> wrote:
>=20
> Add a function to retrieve the highest phandle in a given device tree=
=2E
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> include/libfdt.h    | 13 +++++++++++++
> lib/libfdt/fdt_ro.c | 15 +++++++++++++++
> 2 files changed, 28 insertions(+)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index 4e8eb9ede3a4..1e01b2c7ebdf 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -284,6 +284,19 @@ int fdt_move(const void *fdt, void *buf, int buf=
size);
> const char *fdt_string(const void *fdt, int stroffset);
>=20
> /**
> + * fdt_get_max_phandle - retrieves the highest phandle in a tree
> + * @fdt: pointer to the device tree blob
> + *
> + * fdt_get_max_phandle retrieves the highest phandlle in the given
> + * device tree
> + *

^ typo; phandlle -> phandle
> + * returns:
> + *      the highest phandle on success
> + *      0, if an error occured
> + */
> +uint32_t fdt_get_max_phandle(const void *fdt);
> +
> +/**
>  * fdt_num_mem_rsv - retrieve the number of memory reserve map entrie=
s
>  * @fdt: pointer to the device tree blob
>  *
> diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
> index 7b0777b67eb3..9130ce718965 100644
> --- a/lib/libfdt/fdt_ro.c
> +++ b/lib/libfdt/fdt_ro.c
> @@ -47,6 +47,21 @@ static int _fdt_string_eq(const void *fdt, int str=
offset,
> 	return (strnlen(p, len + 1) =3D=3D len) && (memcmp(p, s, len) =3D=3D=
 0);
> }
>=20
> +uint32_t fdt_get_max_phandle(const void *fdt)
> +{
> +	uint32_t max_phandle =3D 0, phandle;
> +	int offset;
> +
> +	for (offset =3D fdt_next_node(fdt, -1, NULL); offset >=3D 0;
> +	     offset =3D fdt_next_node(fdt, offset, NULL)) {
> +		phandle =3D fdt_get_phandle(fdt, offset);
> +		if (phandle > max_phandle)
> +			max_phandle =3D phandle;
> +	}
> +
> +	return max_phandle;
> +}
> +
> int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64=
_t *size)
> {
> 	FDT_CHECK_HEADER(fdt);
> --=20
> 2.8.2
>=20

Regards

=E2=80=94 Pantelis
