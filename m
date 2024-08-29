Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA471AE85B
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940313; cv=none; b=jdx+j9HpmxeSnbXCE5gC68DBjsGg0s4v+vlQxj7VDZibmWu7YQdT+BcYDiilWulf/Pn3p7zVSTFBblpKdJMDJMTP2/UA5EOugDGUDypYgUoQlsPzUgPU0OLfGy6Yuzb56ssB+hhz/lAlj4uxMB+8iak8KTdxMs8JTmBQ9VRPbpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940313; c=relaxed/simple;
	bh=QBiY/Nxf8kZnTowPwXIkvWogAE9aWFs1Yb/JNXX7G3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikShc5Q54rnI28XZC5+r8XJrgKiGJLOQGDhZOVuPEwGPZE5s7oEGUGWnwh5g0fwfJlB7h6gChIYRDXK3Rj1+HklHRrbaR65/EteDPIbMVHXXsVQzQj4WwCqzxdxwgaowA+rsNv4TQA6fCP69posE8FlqfMgjDH9sWlkF4Njexq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bjwu29mq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bjwu29mq"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d439583573so481247a91.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724940311; x=1725545111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3VhUUAdHi0N5QW/LH1eG62DmpQVKqoy32PT2jJZw7fY=;
        b=Bjwu29mqHThCWiKceESBhQDNhqpEsfI7BzVEL3i0SMAr1sq46zWVb61i4Bb81M+1hG
         dWJUQ6kBMgRvdFY7PcNzqPdxWQkPSLqz1fNaijQhBDhOrRRRMRTKGJvqsYVtxSdL2JDH
         6/vBBolbbqyGiNQhTfCdVbOjTi3ky/hiYcMn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940311; x=1725545111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VhUUAdHi0N5QW/LH1eG62DmpQVKqoy32PT2jJZw7fY=;
        b=joHFnU4EF0VJO0mZ+Or/GdPYIRVwYVStWVAp2qX7/MAMrHtsvmnvB/Xn5BhrRGSo0w
         9kMQDMC7lEz9GIgyiEubsWo4AE1WOsjuqzTFGxx0j4nAvHewUwbajWLMtdc1tH9OWZAz
         VgO9oZ60hnHo1bXOeQ89y//KFuM09hzdZrkfkbSgFn0HXTAkCaMBCnQY9P/v3Y8AHMaW
         0B2F2IkdEZgIVVCICRz7ljMgwWAxVKGqRzEJd5A39WY2liwfQsurxoyNY0uRJN7EX5nu
         kAa6Z3VNkNKrw0d0nk7KIWs1hpDYLc6kP2pdeQLPJOX414d2jB++nvZ8nmnAGzln52cF
         Czng==
X-Forwarded-Encrypted: i=1; AJvYcCX3A4feowoZADe53y6S7oRtJziQAeZrWj6aDL3s6cdW16fz8wlEUN3IqBXcdVWYLmByD5X/3SktI8FJmjXEPJXeS4RA@vger.kernel.org
X-Gm-Message-State: AOJu0YyicVH73CGeTEhnDUOiG+PdBT9Fe2aEh5akTSO2QTQzFd1ZwK1J
	MAJLm2yJGxAPPxUeDKJ2+S05fEqtbknUgoMiWGyI0ACBSuVCpE7L0DDB4Lz/lFrprH5zC87NfMN
	JLwk+L3bYulUJkBHNcc4wA7Mlp9jeW8lztBT+
X-Google-Smtp-Source: AGHT+IFVJTp3hRGMnPgm3GoKlEsASgIWxNdoJ8ZEj52IAWi4VGfr77ajS0cG4UejVABRN7TCwRXwa2Gys+3xT9+Ajhk=
X-Received: by 2002:a17:902:e80a:b0:202:3432:2324 with SMTP id
 d9443c01a7336-2050c4d08a7mr27535015ad.54.1724940310558; Thu, 29 Aug 2024
 07:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org> <20240827-append-v1-1-d7a126ef1be3@beagleboard.org>
In-Reply-To: <20240827-append-v1-1-d7a126ef1be3@beagleboard.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Aug 2024 08:04:58 -0600
Message-ID: <CAFLszTiTcuLTeidpaXOpecf9nKtHuKf2qFc0thWXXoVHpyRsOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dtc: Add /append-property/
To: Ayush Singh <ayush@beagleboard.org>
Cc: lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
	Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ayush,

On Tue, 27 Aug 2024 at 11:55, Ayush Singh <ayush@beagleboard.org> wrote:
>
> Allow appending values to a property instead of overriding the previous
> values of property.
>
> Currently, we have /delete-node/ and /delete-property/, but lack
> /append-property/. Hence we end up having to repeat all existing values
> when appending to a property (e.g. see [1] appending to clocks from
> [2]).
>
> This functionality is also important for creating a device tree based
> implementation to support different types of addon-boards such as
> mikroBUS, Grove [3], etc.
>
> [3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
> [2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
> [1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334
>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  dtc-lexer.l  |  7 +++++++
>  dtc-parser.y |  6 ++++++
>  dtc.h        |  3 +++
>  livetree.c   | 30 +++++++++++++++++++++++++-----
>  4 files changed, 41 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

nits below

>
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index de60a70..5da4ca5 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -137,6 +137,13 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
>                         return DT_DEL_NODE;
>                 }
>
> +<*>"/append-property/" {
> +                       DPRINT("Keyword: /append-property/\n");
> +                       DPRINT("<PROPNODENAME>\n");
> +                       BEGIN(PROPNODENAME);
> +                       return DT_APP_PROP;
> +               }
> +
>  <*>"/omit-if-no-ref/"  {
>                         DPRINT("Keyword: /omit-if-no-ref/\n");
>                         DPRINT("<PROPNODENAME>\n");
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 4d5eece..94ce405 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -58,6 +58,7 @@ static bool is_ref_relative(const char *ref)
>  %token DT_BITS
>  %token DT_DEL_PROP
>  %token DT_DEL_NODE
> +%token DT_APP_PROP
>  %token DT_OMIT_NO_REF
>  %token <propnodename> DT_PROPNODENAME
>  %token <integer> DT_LITERAL
> @@ -296,6 +297,11 @@ propdef:
>                         $$ = build_property_delete($2);
>                         free($2);
>                 }
> +       | DT_APP_PROP DT_PROPNODENAME '=' propdata ';'
> +               {
> +                       $$ = build_property_append($2, $4, &@$);
> +                       free($2);
> +               }
>         | DT_LABEL propdef
>                 {
>                         add_label(&$2->labels, $1);
> diff --git a/dtc.h b/dtc.h
> index 4c4aaca..06771c5 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -205,6 +205,7 @@ struct bus_type {
>
>  struct property {
>         bool deleted;
> +       bool append;

Can you add a comment as to what this means?

>         char *name;
>         struct data val;
>
> @@ -263,6 +264,8 @@ void delete_labels(struct label **labels);
>  struct property *build_property(const char *name, struct data val,
>                                 struct srcpos *srcpos);
>  struct property *build_property_delete(const char *name);
> +struct property *build_property_append(const char *name, struct data val,
> +                                      struct srcpos *srcpos);
>  struct property *chain_property(struct property *first, struct property *list);
>  struct property *reverse_properties(struct property *first);
>
> diff --git a/livetree.c b/livetree.c
> index 49f7230..74eca1b 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -62,6 +62,20 @@ struct property *build_property_delete(const char *name)
>         return new;
>  }
>
> +struct property *build_property_append(const char *name, struct data val,
> +                                      struct srcpos *srcpos)
> +{
> +       struct property *new = xmalloc(sizeof(*new));
> +
> +       memset(new, 0, sizeof(*new));
> +       new->name = xstrdup(name);
> +       new->append = true;
> +       new->val = val;
> +       new->srcpos = srcpos_copy(srcpos);
> +
> +       return new;
> +}
> +
>  struct property *chain_property(struct property *first, struct property *list)
>  {
>         assert(first->next == NULL);
> @@ -151,8 +165,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
>         for_each_label_withdel(new_node->labels, l)
>                 add_label(&old_node->labels, l->label);
>
> -       /* Move properties from the new node to the old node.  If there
> -        * is a collision, replace the old value with the new */
> +       /* Move properties from the new node to the old node. If there
> +        * is a collision, replace/append the old value with the new */
>         while (new_node->proplist) {
>                 /* Pop the property off the list */
>                 new_prop = new_node->proplist;
> @@ -165,15 +179,21 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
>                         continue;
>                 }
>
> -               /* Look for a collision, set new value if there is */
> +               /* Look for a collision, set new value/append if there is */
>                 for_each_property_withdel(old_node, old_prop) {
>                         if (streq(old_prop->name, new_prop->name)) {
>                                 /* Add new labels to old property */
>                                 for_each_label_withdel(new_prop->labels, l)
>                                         add_label(&old_prop->labels, l->label);
>
> -                               old_prop->val = new_prop->val;
> -                               old_prop->deleted = 0;
> +                               if (new_prop->append) {
> +                                       old_prop->val = data_merge(old_prop->val, new_prop->val);
> +                               } else {
> +                                       old_prop->val = new_prop->val;
> +                               }

Braces are not needed here.

> +
> +                               old_prop->deleted = false;
> +                               old_prop->append = false;
>                                 free(old_prop->srcpos);
>                                 old_prop->srcpos = new_prop->srcpos;
>                                 free(new_prop);
>
> --
> 2.46.0
>
>

Regards,
Simon
