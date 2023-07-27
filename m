From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Makefile: allow to install libfdt without building executables
Date: Wed, 26 Jul 2023 18:49:43 -0600
Message-ID: <CAPnjgZ1OZBF6YWUCrKUW1FEHaR4EzZMGVn00k62vcQSA91ubzg@mail.gmail.com>
References: <20230726144336.677135-1-nico.escande@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690419300; x=1691024100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vkPJnerjCrTpFJZPQQdqoFC0ebU4OZxxVNrKJOvIv0g=;
        b=GGbRqMfQu+gC8Y26UghXoEYbYjxefgGu7LZOCoAoa8uE8YY75uPo0TIFJZV/zKvKgf
         jnNIr5PiR6f0nwGYlL76gvb9EUfW9KZzLLmvZJACGO+G/4+S4G2rioxXH6aEjm8TPFWk
         yG3ZwsF2DryM3mxZYVPFVTyiXbSe+G2yZnKmk=
In-Reply-To: <20230726144336.677135-1-nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, 26 Jul 2023 at 08:44, Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> When we only need the libfdt calling the target install-lib also builds the
> executables listed in $(BINS) because this target depends on all
> Instead lets make install-lib only depend on libfdt.
>
> Signed-off-by: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

But why would you just want the libs?


>
> diff --git a/Makefile b/Makefile
> index 784e2f8..c0b68a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -238,7 +238,7 @@ install-bin: all $(SCRIPTS)
>         $(INSTALL_PROGRAM) $(BIN) $(DESTDIR)$(BINDIR)
>         $(INSTALL_SCRIPT) $(SCRIPTS) $(DESTDIR)$(BINDIR)
>
> -install-lib: all
> +install-lib: libfdt
>         @$(VECHO) INSTALL-LIB
>         $(INSTALL) -d $(DESTDIR)$(LIBDIR)
>         $(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
> --
> 2.41.0
>
