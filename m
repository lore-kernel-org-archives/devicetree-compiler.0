From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Tue, 12 Oct 2021 08:38:41 -0500
Message-ID: <CAL_JsqK52nM1LwjBYJ+iEWYEipimaJ=8vA-Nw5SSJ7x+OAxGXg@mail.gmail.com>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
 <20200820102734.GR271315@yekko.fritz.box> <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com>
 <YL7vh7JkjymjKsQD@yekko> <3f28c86d-064d-ec68-e8de-f1dcd38c08ca@fastree3d.com> <f6ac309b-c3af-583e-1bce-e869fa129b3f@fastree3d.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634045935;
        bh=V6ydBNrctcK/UVNfUDRZVZiCfNi5/fprrHpbDI2B8wo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=esx+Go5n+LaH53TD3Dop6k7IR/RO7J6U+f1Wu968+WyLDbNuedlLUc5asPOANDOrr
         HxBYohXf6Z6HF1N35bHUGAOiWfz252ilMu2uPnqP6+UhJrbcZ1asWz56yil++L4cIp
         MYB1lUQ3OnrvQH1KLJ6eumdvruK+iMdtQsgpv6q3lXs3qehQPNm83cfuMhNbTe3Kcw
         MyUH/gwZLUQDsqA4F5olZLMS2O2ElCbZTkVZMvGVn6sT7P+Qt5Vuo9d7y++BdBqjww
         J8/bGYky/5xah+jsSJh1BNv7cfnc4XLikpikWBAsR+8IV7RGmuPcifr0Hkb3sdmhob
         1pfi5zDYdK5jQ==
In-Reply-To: <f6ac309b-c3af-583e-1bce-e869fa129b3f-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Oct 12, 2021 at 8:16 AM Adrian Fiergolski
<adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
>
> Hi David,
>
> I am being hit by this problem again. This time on Ubuntu 20.04 LTS with
> gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04), yocto (hardknott) and
> kernel v5.10.
>
> As it's standard kernel built, I am using scripts/Makefile.lib from
> kernel sources. This line [1] causes the problem. As you indicated, it
> calls the preprocessor and afterwards dtc.

How is '-g3' getting introduced here? You are externally overriding
HOSTCC with 'gcc -g3' or something like that?

Just add '-g0' to the command line in [1]. Debug info is never useful
here. The documentation for -g3 clearly says it keeps #defines which
is fundamentally incompatible with our usage of the preprocessor.

Rob
