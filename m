From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Thu, 17 Feb 2022 15:44:26 -0700
Message-ID: <CAPnjgZ1TM751YD-VOgk-+Kc--shAt4=1FaFdTyGGn5_27P0s0g@mail.gmail.com>
References: <20211107224346.3181320-1-sjg@chromium.org> <YgCblAa5Hxw33OXV@yekko>
 <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w@mail.gmail.com>
 <YgM9hujN+PTXdi3d@yekko> <CAPnjgZ2-tgy-L15S=p4dajpF+hSwX-McPSU3Fez2=cXOqXypZQ@mail.gmail.com>
 <CAL_JsqJkG84jnn3OiC+aYOdqRvYcMWzfEg4r-74bbFsGC-4img@mail.gmail.com>
 <CAPnjgZ2OjgXxQ0HxC_pBe+yZnmbJL-QYd+jDDQ5eacO=vkerNQ@mail.gmail.com> <CAL_JsqLkOMELMjCNJ_xSt7hdVvHx5dMfrifzRWFuZQkGcsXwjQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9xalDNZX6kQt2Z1JwGi6NTFM1QppKSGk2O4gZoGTjfs=;
        b=EVIgrcyNbRpxLyXnuc/tc4NKkeh2ka/kCFv3PkG78m3VYWDh+mXdm5V2UDsFDukBwu
         Oc6M8h4ro4Mcg+qiFbN3HZZwu83Me1hhHFlcYIcU+bqqulU7eW+NaJmi4RTNdEyAJZgp
         3ucgIqbhDlWgIhMH3ECUD3UVi6M5636zxyBYM=
In-Reply-To: <CAL_JsqLkOMELMjCNJ_xSt7hdVvHx5dMfrifzRWFuZQkGcsXwjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Rob,

I am open to ideas...perhaps dtc-extra?

Yes, empty is fine.

Regards,
Simon

On Thu, 17 Feb 2022 at 15:09, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Thu, Feb 17, 2022 at 2:37 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi Rob,
> >
> > On Wed, 9 Feb 2022 at 17:19, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > >
> > > On Wed, Feb 9, 2022 at 10:04 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > >
> > > > +Rob Herring
> > > >
> > > > Hi David and Rob,
> > > >
> > > > On Tue, 8 Feb 2022 at 23:31, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Tue, Feb 08, 2022 at 02:43:44PM -0700, Simon Glass wrote:
> > > > > > Hi David,
> > > > > >
> > > > > > On Sun, 6 Feb 2022 at 21:10, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > > > >
> > > > > > > On Sun, Nov 07, 2021 at 03:43:42PM -0700, Simon Glass wrote:
> > > > > > > > Note: This was last sent 6 years ago. It really belongs upstream and I
> > > > > > > > believe it is useful functionality for libfdt, so I am trying again.
> > > > > > > > Please take a fresh look at this. It is cut back from the previous series.
> > > > > > > > If accepted we can expand the feature set piece by piece from here.
> > > > > > >
> > > > > > > Sorry it's taken me so long to look at this.  Again.  I can't dispute
> > > > > > > that it's useful for certain use cases.  But as for belonging
> > > > > > > upstream...
> > > > > > >
> > > > > > > This series adds quite a lot of conceptual complexity.  It introduces
> > > > > > > a new data structure, new state structures, a entirely new mode of
> > > > > > > working with a tree and a bunch of configuration parameter types on
> > > > > > > top of the new entry points and new tool.  I still find the semantics
> > > > > > > of the different criteria for inclusion/exclusion from a region pretty
> > > > > > > bewildering.
> > > > > >
> > > > > > It is sufficient to achieve its purpose, but I don't think it is any
> > > > > > more complex than that.
> > > > >
> > > > > I don't disagree, but that still ends up being quite complex.
> > > > >
> > > > > > > That makes me pretty disinclined to add this to the scope of
> > > > > > > maintenance for libfdt.  As you've probably noticed, I'm already
> > > > > > > struggling to keep on top of maintenance for the existing libfdt
> > > > > > > interfaces.  AFAICT everything here can be implemented fairly
> > > > > > > naturally in terms of libfdt's existing public interface. so I'm not
> > > > > > > really seeing a compelling reason for this to be merged into libfdt,
> > > > > > > rather than being its own separate library that depends on libfdt.
> > > > > >
> > > > > > Are you suggesting:
> > > > > >
> > > > > > 1. that libfdt should move to a new maintainer
> > > > > > 2. that you would accept these patches if someone else maintained them
> > > > > > within the libfdt tree
> > > > > > 3. that we set up a separate tree to fork libfdt, with these changes in
> > > > > > 4. that we put these changes in a separate tree?
> > > > >
> > > > > Right now (4) is what I'm suggesting.  Or to be more precise, creating
> > > > > a new repo with "libfdtrange" or whatever, that depends on libfdt.
> > > > >
> > > > > (1) and/or (2) are potentially worthy of further discussion.  (3) is
> > > > > just a bad idea, IMO.
> > > >
> > > > Where are things going with device tree validation in terms of
> > > > source-code location?
> > >
> > > Right now it doesn't use libfdt at all, but that's what I'm working on
> > > if we can get pieces in place to package pylibfdt sorted out. If not,
> > > I may be doing 3 just for packaging.
> > >
> > > > Is it likely there might be a separate tree for
> > > > that, which could perhaps hold other libfdt dependent things?
> > >
> > > It is a separate tree[1], but it's a pure python project and I don't
> > > think it's the right place for a C library. But we can setup a new
> > > project in the GH devicetree.org group[2] if you want.
> >
> > If David has no objection, then I think that would be a good idea,
> > please. I can add the fdtgrep tool as well as the new fdt_sign stuff
> > (once we get some thoughts on how exactly that should work).
>
> What do you want it called and I can setup an empty repo. Or once you
> have a tree in place, I can add it.
>
> Rob
