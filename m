From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Wed, 3 Nov 2021 17:42:09 -0500
Message-ID: <CAL_JsqLdKsVO9kzkZcqL160COrpEp6GsR10AyPvmSG3B=grAXg@mail.gmail.com>
References: <20210727183023.3212077-1-robh@kernel.org> <20210727183023.3212077-5-robh@kernel.org>
 <YWPIiqpb3KlwTVN/@yekko> <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA@mail.gmail.com>
 <YWZOjOzqhtakSw56@yekko> <CAL_Jsq+iv7eM+LZ1O8d3V18dHraEAyfgdT8ucFKKVXZc9jEp4g@mail.gmail.com>
 <YYITHjgBGzS4jyNe@yekko> <CAL_JsqLNyfe8Ou4RXeLm0ie1vvJ+z15J6EDgB96dPbCC5qvHVQ@mail.gmail.com>
 <CAL_JsqKeNne0Bf0ahG_h977snsBtsk3hbQOPO-6RiyFSyiOsfA@mail.gmail.com> <CAPnjgZ3BNPW+L4BrhQ9W4nLovSgcchWPfbznYxtf20sv2ntYaA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635979343;
        bh=lec8G51dJ/EU0P9xxALgBK5xKkWVotBvQ8+h9ijtQAw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cvTy4AP3C7vRygXp9DGWqeWP0bQfGTTnlziMrn4N/6k2JrhAiXmMhSJPYs93aARTK
         Keeigti4yCvho963mPmdpYVl84wBeASG2TJ5592o3kjebxlPUHEQiB2DfmvAGPv8la
         iu9sVUkEfacoNZ4qS2Lu3Wq1v2+qjDmJZa0rHZr4UmF5GAmtL1xO/NWLxleQR99EbG
         9unZI38m+kOBYOdsZsboGNJIv6BsOTpENBY0tAk0LFh4dx/NmWs6OcFDJrFd2gnfkj
         8TCEkZWHyQjri6WelW5i3ARg6UMobE42ZMsbmdbe5dqsgxGddSue5KyYqCvDy9/IGh
         /ye1PhGkW0bow==
In-Reply-To: <CAPnjgZ3BNPW+L4BrhQ9W4nLovSgcchWPfbznYxtf20sv2ntYaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Nov 3, 2021 at 2:56 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi,
>
> On Wed, 3 Nov 2021 at 13:17, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Wed, Nov 3, 2021 at 10:59 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > >
> > > On Tue, Nov 2, 2021 at 11:42 PM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Wed, Oct 13, 2021 at 08:29:53PM -0500, Rob Herring wrote:
> > > > > On Wed, Oct 13, 2021 at 1:26 AM David Gibson
> > > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > > >
> > > > > > On Mon, Oct 11, 2021 at 08:22:54AM -0500, Rob Herring wrote:
> > > > > > > On Mon, Oct 11, 2021 at 2:19 AM David Gibson
> > > > > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> > > > > > > > > YAML output was restricted to dts input as there are some dependencies
> > > > > > > > > on source annotations which get lost with other input formats. With the
> > > > > > > > > addition of markers by the checks, YAML output from dtb format becomes
> > > > > > > > > more useful.
> >
> > > > Heh.  Ok, but there's no reason you couldn't bundle a dtb->yaml
> > > > preprocessor written in C (or Rust, or Go) with the rest of the
> > > > validation tools.  Then it would be colocated with the rest of the
> > > > binding information and can be updated in lockstep.
> > >
> > > That's a great idea. I found some code on the internet written in C
> > > that already does dtb->yaml conversion, so I can use that. Do you
> > > think it is any good[1]? ;)
> > >
> > > >  Or better yet,
> > > > write a preprocessor that goes direct from dtb to Python native data
> > > > types, avoiding the problems with YAML.
> > >
> > > That's exactly what the plugin did. Maybe the last patch should have
> > > been removing YAML output. You seemed fairly lukewarm on the whole
> > > thing, so it seemed like it was going to take more time than I had to
> > > spend on it.
> > >
> > > Maybe using pylibfdt could work here though it doesn't already
> > > unflatten the tree into dictionaries. Maybe that already exists
> > > somewhere. Simon?
> >
> > dtoc in u-boot is one though it unpacks into custom classes rather
> > than pure dict I need. But implementing unpacking was quite simple.
> > The harder part seems to be the lack of any packaging for pylibfdt.
>
> Packaging?

In PyPi: pip install libfdt

Or packaged by the distro. Then I can just add it as a dependency to
dtschema and it all just works for users.

> Yes dtoc has some Python classes for reading the DT and updating it
> (with a separate 'commit' step). I am not entirely happy with the
> state of it though. If you want to tidy it up and upstream it, that
> would be great. If you me some pointers as to what you need, I could
> try it. I need to get back to the fdtgrep stuff in the next week or
> do, so the timing is right.

I've got something working. The Node and Prop classes didn't really
work for me as I need the DT represented as a dict. (And using it
would be a licensing issue too as dtschema is BSD).

Rob
