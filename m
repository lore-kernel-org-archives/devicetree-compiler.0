From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Wed, 9 Feb 2022 18:19:01 -0600
Message-ID: <CAL_JsqJkG84jnn3OiC+aYOdqRvYcMWzfEg4r-74bbFsGC-4img@mail.gmail.com>
References: <20211107224346.3181320-1-sjg@chromium.org> <YgCblAa5Hxw33OXV@yekko>
 <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w@mail.gmail.com>
 <YgM9hujN+PTXdi3d@yekko> <CAPnjgZ2-tgy-L15S=p4dajpF+hSwX-McPSU3Fez2=cXOqXypZQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644452354;
        bh=fqDUso8/0QhTsjxn5gk0i6ms1Yd0KEOCdPVPTzvWAHE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HDZkTbf66onpiD3edhpQYxRpVhLVm8SrdnwvsELy2c24whOsZjMtPZAoo+PPQXuTf
         99U6Iu2QzB702shTIwKejWS7R/M8zyu7V/cRxpAZwFNrYlXYmdiFBh2VP6AVgVh5co
         2fsB5JvoMShLAuHHqUEEjQsVrFRVm+MTBIyWSCleZbIfkwRBOuZEECAXdqiNKZr3GC
         5phrFLZ9tzGaZtANQRlUNJd3VpqeUbT4wIwn4NMNgg/YWD63jYsB0dEE5SE0DTgFXG
         NhxuRTGBM58+9x5tMIXRBh9KSDWhzdUHleGQcwK25cpgiFAyF46ObGQEv1/S1QXywe
         fxCIerFMSosGg==
In-Reply-To: <CAPnjgZ2-tgy-L15S=p4dajpF+hSwX-McPSU3Fez2=cXOqXypZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Feb 9, 2022 at 10:04 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> +Rob Herring
>
> Hi David and Rob,
>
> On Tue, 8 Feb 2022 at 23:31, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Feb 08, 2022 at 02:43:44PM -0700, Simon Glass wrote:
> > > Hi David,
> > >
> > > On Sun, 6 Feb 2022 at 21:10, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Sun, Nov 07, 2021 at 03:43:42PM -0700, Simon Glass wrote:
> > > > > Note: This was last sent 6 years ago. It really belongs upstream and I
> > > > > believe it is useful functionality for libfdt, so I am trying again.
> > > > > Please take a fresh look at this. It is cut back from the previous series.
> > > > > If accepted we can expand the feature set piece by piece from here.
> > > >
> > > > Sorry it's taken me so long to look at this.  Again.  I can't dispute
> > > > that it's useful for certain use cases.  But as for belonging
> > > > upstream...
> > > >
> > > > This series adds quite a lot of conceptual complexity.  It introduces
> > > > a new data structure, new state structures, a entirely new mode of
> > > > working with a tree and a bunch of configuration parameter types on
> > > > top of the new entry points and new tool.  I still find the semantics
> > > > of the different criteria for inclusion/exclusion from a region pretty
> > > > bewildering.
> > >
> > > It is sufficient to achieve its purpose, but I don't think it is any
> > > more complex than that.
> >
> > I don't disagree, but that still ends up being quite complex.
> >
> > > > That makes me pretty disinclined to add this to the scope of
> > > > maintenance for libfdt.  As you've probably noticed, I'm already
> > > > struggling to keep on top of maintenance for the existing libfdt
> > > > interfaces.  AFAICT everything here can be implemented fairly
> > > > naturally in terms of libfdt's existing public interface. so I'm not
> > > > really seeing a compelling reason for this to be merged into libfdt,
> > > > rather than being its own separate library that depends on libfdt.
> > >
> > > Are you suggesting:
> > >
> > > 1. that libfdt should move to a new maintainer
> > > 2. that you would accept these patches if someone else maintained them
> > > within the libfdt tree
> > > 3. that we set up a separate tree to fork libfdt, with these changes in
> > > 4. that we put these changes in a separate tree?
> >
> > Right now (4) is what I'm suggesting.  Or to be more precise, creating
> > a new repo with "libfdtrange" or whatever, that depends on libfdt.
> >
> > (1) and/or (2) are potentially worthy of further discussion.  (3) is
> > just a bad idea, IMO.
>
> Where are things going with device tree validation in terms of
> source-code location?

Right now it doesn't use libfdt at all, but that's what I'm working on
if we can get pieces in place to package pylibfdt sorted out. If not,
I may be doing 3 just for packaging.

> Is it likely there might be a separate tree for
> that, which could perhaps hold other libfdt dependent things?

It is a separate tree[1], but it's a pure python project and I don't
think it's the right place for a C library. But we can setup a new
project in the GH devicetree.org group[2] if you want.

Rob

[1] https://github.com/devicetree-org/dt-schema/
[2] https://github.com/devicetree-org/
