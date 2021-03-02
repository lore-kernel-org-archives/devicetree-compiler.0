From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fdt_rw.c: Fix Unchecked return value error
Date: Mon, 1 Mar 2021 20:26:50 -0600
Message-ID: <CAL_Jsq+FJz5pFqMHeSrQauuJksJton1qeciwpo3fP91NM6aAfQ@mail.gmail.com>
References: <1614637450-4972-1-git-send-email-ryan.long@oarcorp.com> <1614637450-4972-2-git-send-email-ryan.long@oarcorp.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614652023;
        bh=+bRQxIsv6HQ52ASnxLW4esbrPyafkYCKkP7pm3BtDVc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mmH3oC7P1ZhPszYyhWxK60NdVQrntqSet9KLG2T3WdY3QRpVaTUvJ6s62nfVS1Q+h
         AGVti4UlEWgoj0XZUBBaWqQyrZMbjwn2/YJiG1t9l1vOWmqWhTQhZKdHaCfN4YmpCG
         bkFUqvHXGVNPIe7o1/4oQs4hRdmoIgLPoaXOPkTuVIV8NVgv60cI7/hoF06gdET75g
         N/23H6b80aMdF02OvIlXjc3+1c2QFuFkCDbYy3rv4kBGbPfdnGh2l0cwp3c3AwEp4z
         cXrd5w/om8wyapVGVNFN8ZklmGM5787n4mPL/X+mZs0C7lFQ21seYy9xzJuukrJHNP
         /OEcubeNUb1XA==
In-Reply-To: <1614637450-4972-2-git-send-email-ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>

On Mon, Mar 1, 2021 at 4:27 PM Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Fixed "Unchecked return value" error, by adding "(void)" in front of the
> function call.

You don't need cover letters for single patches. Move the explanation
here because it's a lot better at explaining the why. The what is not
needed here so much because we can read what the patch does.

You also need a S-o-b.

> ---
>  cpukit/dtc/libfdt/fdt_rw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/cpukit/dtc/libfdt/fdt_rw.c b/cpukit/dtc/libfdt/fdt_rw.c
> index 1385425..cdae5dd 100644
> --- a/cpukit/dtc/libfdt/fdt_rw.c
> +++ b/cpukit/dtc/libfdt/fdt_rw.c
> @@ -348,7 +348,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
>                 return offset;
>
>         /* Try to place the new node after the parent's properties */
> -       fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */
> +       (void) fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */

Can't we just actually check the error here?

>         do {
>                 offset = nextoffset;
>                 tag = fdt_next_tag(fdt, offset, &nextoffset);
> --
> 1.8.3.1
>
