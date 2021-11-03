From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Wed, 3 Nov 2021 14:16:56 -0500
Message-ID: <CAL_JsqKeNne0Bf0ahG_h977snsBtsk3hbQOPO-6RiyFSyiOsfA@mail.gmail.com>
References: <20210727183023.3212077-1-robh@kernel.org> <20210727183023.3212077-5-robh@kernel.org>
 <YWPIiqpb3KlwTVN/@yekko> <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA@mail.gmail.com>
 <YWZOjOzqhtakSw56@yekko> <CAL_Jsq+iv7eM+LZ1O8d3V18dHraEAyfgdT8ucFKKVXZc9jEp4g@mail.gmail.com>
 <YYITHjgBGzS4jyNe@yekko> <CAL_JsqLNyfe8Ou4RXeLm0ie1vvJ+z15J6EDgB96dPbCC5qvHVQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635967029;
        bh=F9ood1OCs1V5H1/TZUKBzBvEVn7RsyFCZp5JIpjtZzg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NXsOiMUK4+ezZLkbIY6rOY7CD+RI39h1yDlE9Kv6wlPTYQCsp0FFfUxyNWaCCkU/4
         HK5SDB5p/adWD0x131O2ZoBGrOIW4DFJC5V4JzZhhgUwatjrghbAEIqaRssuSMN1aq
         LxSJt36EMcu/zwMB75wm5gIyMyL7V5d0kvlUzhPeBIWj8ulXjRJkD2yU2zVMuOncu0
         H2hcV3WdNlDXwpvumn0mA7BfSX7RgXPODHJ3bc0F1heCz1AEVkCRyKzG0Ik7LZV44/
         BI6K2seJtNHiFtwv+qQf0xU3I7cQuYIGXpbxwEzqdMeWT8xFHzCPoP15h1vblZIllS
         7mLQGtcPSGfYA==
In-Reply-To: <CAL_JsqLNyfe8Ou4RXeLm0ie1vvJ+z15J6EDgB96dPbCC5qvHVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Nov 3, 2021 at 10:59 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Tue, Nov 2, 2021 at 11:42 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Wed, Oct 13, 2021 at 08:29:53PM -0500, Rob Herring wrote:
> > > On Wed, Oct 13, 2021 at 1:26 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Mon, Oct 11, 2021 at 08:22:54AM -0500, Rob Herring wrote:
> > > > > On Mon, Oct 11, 2021 at 2:19 AM David Gibson
> > > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > > >
> > > > > > On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> > > > > > > YAML output was restricted to dts input as there are some dependencies
> > > > > > > on source annotations which get lost with other input formats. With the
> > > > > > > addition of markers by the checks, YAML output from dtb format becomes
> > > > > > > more useful.

> > Heh.  Ok, but there's no reason you couldn't bundle a dtb->yaml
> > preprocessor written in C (or Rust, or Go) with the rest of the
> > validation tools.  Then it would be colocated with the rest of the
> > binding information and can be updated in lockstep.
>
> That's a great idea. I found some code on the internet written in C
> that already does dtb->yaml conversion, so I can use that. Do you
> think it is any good[1]? ;)
>
> >  Or better yet,
> > write a preprocessor that goes direct from dtb to Python native data
> > types, avoiding the problems with YAML.
>
> That's exactly what the plugin did. Maybe the last patch should have
> been removing YAML output. You seemed fairly lukewarm on the whole
> thing, so it seemed like it was going to take more time than I had to
> spend on it.
>
> Maybe using pylibfdt could work here though it doesn't already
> unflatten the tree into dictionaries. Maybe that already exists
> somewhere. Simon?

dtoc in u-boot is one though it unpacks into custom classes rather
than pure dict I need. But implementing unpacking was quite simple.
The harder part seems to be the lack of any packaging for pylibfdt.

Rob
