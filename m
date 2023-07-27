From: "Nicolas Escande" <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Makefile: allow to install libfdt without building
 executables
Date: Thu, 27 Jul 2023 10:45:40 +0200
Message-ID: <CUCTN344O5PH.EOH73270TFQC@syracuse>
References: <20230726144336.677135-1-nico.escande@gmail.com>
 <CAPnjgZ1OZBF6YWUCrKUW1FEHaR4EzZMGVn00k62vcQSA91ubzg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690447541; x=1691052341;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxROrb7tpRIyL7Y/92hcTi8I0JtMRsWWoHYt9gmV25k=;
        b=UFNq+ReecVBGdj+D70aYQsYsg8KupKda6nJ3usSPI2zPZsbqcZcYeixlLduzx2aQO2
         uhsX1MQowO+MGrYW80uc8NnpiwoC+D8ErdCC1nXFlfPNbIoBQNsd+KhMYjlUNQM3ak11
         HEqiegvTgk72mQGAn7gMmAA793lwxyXz5fqL8/u2jdgqh51WYzcHyAkFQ2208eC3yjAO
         rv8PaUT9r7jocLz6qyzWi9ozduth5oSpyUnYEwpFpoq5KrUzz9wzjogpSjVItx6OeWGs
         cD1XRZsg7xv3pSmz8Pxw0JSjcPH2xJp6Uz1MJefY0fGV6k/ZiZVMWytq3LyO5VrSCfIA
         S9fQ==
In-Reply-To: <CAPnjgZ1OZBF6YWUCrKUW1FEHaR4EzZMGVn00k62vcQSA91ubzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu Jul 27, 2023 at 2:49 AM CEST, Simon Glass wrote:
> On Wed, 26 Jul 2023 at 08:44, Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> >
> > When we only need the libfdt calling the target install-lib also builds=
 the
> > executables listed in $(BINS) because this target depends on all
> > Instead lets make install-lib only depend on libfdt.
> >
> > Signed-off-by: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> But why would you just want the libs?
>
Well some projects like qemu & uboot from the top of my head use the libfdt=
 and
do not always need/build the dtc that goes with it.
It's cleary very corner case but I don't think it harms anyone doing so :)
