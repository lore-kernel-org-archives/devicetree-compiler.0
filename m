From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Wed, 3 Nov 2021 10:59:39 -0500
Message-ID: <CAL_JsqLNyfe8Ou4RXeLm0ie1vvJ+z15J6EDgB96dPbCC5qvHVQ@mail.gmail.com>
References: <20210727183023.3212077-1-robh@kernel.org> <20210727183023.3212077-5-robh@kernel.org>
 <YWPIiqpb3KlwTVN/@yekko> <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA@mail.gmail.com>
 <YWZOjOzqhtakSw56@yekko> <CAL_Jsq+iv7eM+LZ1O8d3V18dHraEAyfgdT8ucFKKVXZc9jEp4g@mail.gmail.com>
 <YYITHjgBGzS4jyNe@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635955193;
        bh=s+z3fa9lZJY6LeRFYIsJ2J4f5zqpVUtsHvJu6DDr/nM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EuWTut5TW/NyJ6NkoefpONRanuQjOgBN9+8wofd+AZScniNnTus9hDTuivxc2YBUC
         lCNqT6iDm5mQTzsxLTWTzLgcfiwMcsTD81n6dtVLpigVNZcULRxS/1/4ldOb5f0feF
         UjiNaF2dSYMIzMjYDIwCsvK1TpCXyMl0jiOtROkj7wNVdVrSs7OYstiSlO2TAVH1jz
         SQFrPY29P78MrOs+Z5cYAFpUFX5zOoZPTuZhjOPhCIgCUw6mkFzF+1z74yj9f/fqY6
         RHG3UiV251oHGBEiG03L/dqFI8u4kCj53ctxYDsKPKa58LPhDsNBZV5fUT3vyG3q3m
         a1vZkNebrtodQ==
In-Reply-To: <YYITHjgBGzS4jyNe@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Nov 2, 2021 at 11:42 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Wed, Oct 13, 2021 at 08:29:53PM -0500, Rob Herring wrote:
> > On Wed, Oct 13, 2021 at 1:26 AM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Mon, Oct 11, 2021 at 08:22:54AM -0500, Rob Herring wrote:
> > > > On Mon, Oct 11, 2021 at 2:19 AM David Gibson
> > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> > > > > > YAML output was restricted to dts input as there are some dependencies
> > > > > > on source annotations which get lost with other input formats. With the
> > > > > > addition of markers by the checks, YAML output from dtb format becomes
> > > > > > more useful.
> > > > > >
> > > > > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > >
> > > > > Urgh.  There's not really anything wrong with this patch of itself,
> > > > > but it really underlines my feeling that the whole yaml output thing
> > > > > is a bunch of hacks in pursuit of a bogus goal.
> > > >
> > > > Validating DTs is a bogus goal?
> > >
> > > Goal probably wasn't the right word.  Validating DTs is fine.  The
> > > bogosity comes from doing the conversion to YAML essentially without
> > > reference to the bindings / schemas.  Bindings describe how to
> > > interpret the DT's bytestrings into meaninful numbers or whatever, so
> > > using the bindings is the only reliable way of converting those
> > > bytestrings into some more semantically useful representation.
> >
> > That is exactly the direction I'm going.
>
> Ok, that's good to hear.
>
> > The YAML format can change if
> > we need it to (remember the plugin interface?).
>
> See, I find that worrying, not reassuring.  It feels like dtc is
> chasing a fuzzy moving target with the yaml output.

I meant either it goes away entirely or a 2.0 version rather than
continual incremental changes.

>  I can see no
> clear line between what parts of the decoding should be done by dtc
> (in making the yaml type choices) and what parts should be done by
> whatever consumes it.  Even if we could define a line, AFAICT it would
> necessarily require dtc to know about *every* binding.  Not every part
> of every binding, but at least part of every binding (enough to make
> those type choices).
>
> Encoding even part of every binding is an unbounded amount of work,
> and not something that was ever really intended to be in dtc's scope.
>
> Now, I realize I kind of started that fuzziness by introducing the
> checks.  But there's a real difference between having some checks for
> the most common errors and *requiring* annotation from the checks in
> order to consume the output.  I don't see any sensible place to stop
> with incorporating of this stuff into the checks, short of absorbing
> the entire validation effort, which I don't think either of us wants.

Only in the form of a plugin. A big part of that was to get source
line numbers for warnings.

>
> In the meantime the only real spec for what dtc needs to output in
> yaml mode is "what the current validation tools want", which means you
> have to watch for version synchronization between dtc and the
> validation tools which sounds like a real pain.

In practice, the format hasn't changed. The lack of spec was more to
avoid any explicit endorsement of the format (and well, laziness).

> On top of that even if we had a clear boundary between "first stage"
> and "second stage" validation, I think YAML has some pretty serious
> drawbacks as the format for the first to communicate to the second.
> The main one being that we can't safely communicate 64-bit ints across
> it (since YAML is JSON-derived, its "numbers" are actually floats,
> which can't safely carry integers above ~2^53).  It also can't
> naturally represent "blobs" which are sometimes in dtbs, if they're
> not valid Unicode.  Then there's the "Norway problem"[0].  I'm pretty
> sure we quote all our strings so we won't hit that one, but it
> definitely gives me the heebie-jeebies about trusting YAML parsers
> with anything requiring precision.

Fortunately, we've avoided problems there. Perhaps that's because we
generally don't care about the actual value of numbers in validation.
I did hit the Norway problem with booleans, but YAML 1.2 addresses
that.

> > > > > Yaml output wants to include information that simply isn't present in
> > > > > the flattened tree format (without considering bindings), so it relies
> > > > > on formatting conventions in the dts, hence this test in the first
> > > > > place.  This alleges it removes a restriction, but it only works if a
> > > > > bunch of extra heuristics are able to guess the types correctly.
> > > >
> > > > The goal here is to validate dtb files which I'd think you'd be in
> > > > favor of given your above opinions. For that to work, we have to
> > > > transform the data into the right types somewhere.
> > >
> > > Yes - and that should be done with reference to specific bindings, not
> > > using fragile heuristics.
> > >
> > > > We don't need any
> > > > heuristics for that. For the most part, it is done using the
> > > > definitive type information from the schemas themselves to format the
> > > > data.
> > >
> > > Exactly.  That type information should come *from the schemas*.  Not
> > > from separately maintained and fragile approximations to parts of the
> > > schemas embedded into dtc.
> >
> > The same can be said for every client program, too. But we're so far
> > away from all knowledge about a binding flowing from a single source.
> > I'd love it if we could just generate the parsing code out of the
> > schemas to populate typed C structs for the OS to consume. The reality
> > is that knowledge about bindings resides in multiple places and dtc is
> > one of them.
>
> That's really not true on the dtb client side.  No, we don't have
> automated tooling translating a machine readable binding into code.
> However, generally all the knowledge *is* in the (human readable)
> binding, and the client will have a (manual) translation of all that
> into code for the properties it cares about.
>
> Automated tooling would be great, but even absent that, dtb clients
> read and decode *bytestrings*, not structured data, and dtc generates
> bytestrings just fine.
>
> > > > The exception is #*-cells patterns which need to parse the tree
> > > > to construct the type information. Given dtc already has all that
> > > > knowledge in checks, it's easier to do it there rather than
> > > > reimplement the same parsing in python.
> > >
> > > dtc only has parts of that knowledge in checks.  The checks have been
> > > written with the assumption that in ambiguous cases we can just punt
> > > and not run the check.  For the goal of truly parsing everything, the
> > > current design of the checks subsystem really isn't adequate.
> >
> > Yes, but handling 'foos' plus '#foo-cells' is a limited problem space
>
> Every thing like this is a limited problem space, but there's an
> unbounded number of possible things.  Like I say there's no clear
> boundary to what dtc should be doing and what it shouldn't.  Given
> what can be done with YAML, we're pretty much being deliberately
> incomplete if dtc does anything short of reliably and correctly typing
> *every* property, which in turn means knowing (part of) *every*
> binding.  I'm not really willing for that to be in scope for dtc.
>
> > compared to all bindings and not one that fits well with binding
> > schemas.
>
> Yeah.. the way what I've seen of json etc. schemas work doesn't really
> mesh well with the sorts of constraints we have.  But I don't think a
> messy split between "first stage" and "second stage" validation
> particularly helps with that.
>
> > dtc already knows how to parse these properties and we don't
> > get new ones frequently. I'm just trying to use the knowledge that's
> > already in dtc.
>
> Again, there's a real difference betwen knowing about some of them in
> order to catch the most common mistakes, and *having* to know about
> all of them in order to produce correct output.
>
> > I'm a bit worried about doing more in python too, because running
> > validation on 1000+ DT files is already ~2 hours. And we're only a
> > little over halfway converting bindings to schemas (though that's
> > probably a long tail of older and less used bindings).
>
> Heh.  Ok, but there's no reason you couldn't bundle a dtb->yaml
> preprocessor written in C (or Rust, or Go) with the rest of the
> validation tools.  Then it would be colocated with the rest of the
> binding information and can be updated in lockstep.

That's a great idea. I found some code on the internet written in C
that already does dtb->yaml conversion, so I can use that. Do you
think it is any good[1]? ;)

>  Or better yet,
> write a preprocessor that goes direct from dtb to Python native data
> types, avoiding the problems with YAML.

That's exactly what the plugin did. Maybe the last patch should have
been removing YAML output. You seemed fairly lukewarm on the whole
thing, so it seemed like it was going to take more time than I had to
spend on it.

Maybe using pylibfdt could work here though it doesn't already
unflatten the tree into dictionaries. Maybe that already exists
somewhere. Simon?

Rob

[1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/
