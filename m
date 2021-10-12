From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Tue, 12 Oct 2021 11:50:15 -0500
Message-ID: <CAL_Jsq+q-vNyUok3O7To0KCSG=hcGzHnf4k7tTr=0J3VFUSVjg@mail.gmail.com>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
 <20200820102734.GR271315@yekko.fritz.box> <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com>
 <YL7vh7JkjymjKsQD@yekko> <3f28c86d-064d-ec68-e8de-f1dcd38c08ca@fastree3d.com>
 <f6ac309b-c3af-583e-1bce-e869fa129b3f@fastree3d.com> <CAL_JsqK52nM1LwjBYJ+iEWYEipimaJ=8vA-Nw5SSJ7x+OAxGXg@mail.gmail.com>
 <c28927c6-4fd1-f047-7c04-d54af609e699@fastree3d.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634057428;
        bh=neDgflWLLPwHJrUALxnDvM0TylQWP6nKkztRdYbQcf0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NrVO5RWNOvcA6STbPPyINaNhE/HkcHuATSn1PM03UlCGNHn/FJfpKxqvOn46Qcgkc
         QQYrTjs7gDlL9sUPIgSFgM3CCPzKha2lUPMvIYIwxk/cm6/HGuKSrw9RTiV5ndfqgp
         HKYr8NAOQ/jxu44OsMdN5Y87jooRVXu24x+2rAsAvf3gZzRyIm/hBUt61uKaV4epwZ
         Ng9OVTgEZyELN25K3Fm+unHY4oY8WU29Tf0Kl7ZZwc6eaIU9CVUCnkgOsW+lSmdBZA
         iHVXm5AR8OvYSYXQfO6L7yUICeJ7X5tHmUhjIDEJCtqKzkPLHjqFZ2LsH+fgrpDDt7
         ReSLQFgpaNAqw==
In-Reply-To: <c28927c6-4fd1-f047-7c04-d54af609e699-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Oct 12, 2021 at 9:47 AM Adrian Fiergolski
<adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
>
> On 12.10.2021 15:38, Rob Herring wrote:
> > On Tue, Oct 12, 2021 at 8:16 AM Adrian Fiergolski
> > <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
> >> Hi David,
> >>
> >> I am being hit by this problem again. This time on Ubuntu 20.04 LTS with
> >> gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04), yocto (hardknott) and
> >> kernel v5.10.
> >>
> >> As it's standard kernel built, I am using scripts/Makefile.lib from
> >> kernel sources. This line [1] causes the problem. As you indicated, it
> >> calls the preprocessor and afterwards dtc.
> > How is '-g3' getting introduced here? You are externally overriding
> > HOSTCC with 'gcc -g3' or something like that?
>
> Yes, that's the way yocto introduces kernel build flags [1].

HOSTCC is supposed to be set to just the compiler. HOSTCFLAGS and
others should be used to set the flags.

Rob

>
> [1]
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/kernel.bbclass#n229
>
> Adrian
>
