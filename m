From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Wed, 13 Oct 2021 20:29:53 -0500
Message-ID: <CAL_Jsq+iv7eM+LZ1O8d3V18dHraEAyfgdT8ucFKKVXZc9jEp4g@mail.gmail.com>
References: <20210727183023.3212077-1-robh@kernel.org> <20210727183023.3212077-5-robh@kernel.org>
 <YWPIiqpb3KlwTVN/@yekko> <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA@mail.gmail.com>
 <YWZOjOzqhtakSw56@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634175006;
        bh=tWo9DXURc8xED5pcGHHqhA4M6Lr1jZn8IUG21BIbnZs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G2puA/SyylGL32Zd69v6qxfoKxgu7Bi+oro6xWkQlHbW2NJRIyGZYr7vBxJ7F5Mqv
         QGsIIfYjS3nwd5TFMpabmZWqsBF4a0Yy9uA7CXDBQ907rL6HhIzo22usa803Dp7rCa
         brEMcCd+vrq+d4rlToB5tVaK17Mq41wA0h3Pbun/B5jwHBe5cKrNmrmQJ1WfAoflyG
         +rXd8yTqJTFx1CcfDb1kXDF2vC2RRVGqfKAlump9UFHGrxUXOVR6O4QzvrgN0l6kh8
         kCwppeaP3Y8QXKR3vbULoX9zaPrOsDKxlFBocpqGZmBaUnl+l8rx0Zp/rB3sEjNkSJ
         gCQLb02SJjQug==
In-Reply-To: <YWZOjOzqhtakSw56@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Oct 13, 2021 at 1:26 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Oct 11, 2021 at 08:22:54AM -0500, Rob Herring wrote:
> > On Mon, Oct 11, 2021 at 2:19 AM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> > > > YAML output was restricted to dts input as there are some dependencies
> > > > on source annotations which get lost with other input formats. With the
> > > > addition of markers by the checks, YAML output from dtb format becomes
> > > > more useful.
> > > >
> > > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > >
> > > Urgh.  There's not really anything wrong with this patch of itself,
> > > but it really underlines my feeling that the whole yaml output thing
> > > is a bunch of hacks in pursuit of a bogus goal.
> >
> > Validating DTs is a bogus goal?
>
> Goal probably wasn't the right word.  Validating DTs is fine.  The
> bogosity comes from doing the conversion to YAML essentially without
> reference to the bindings / schemas.  Bindings describe how to
> interpret the DT's bytestrings into meaninful numbers or whatever, so
> using the bindings is the only reliable way of converting those
> bytestrings into some more semantically useful representation.

That is exactly the direction I'm going. The YAML format can change if
we need it to (remember the plugin interface?).

> > > Yaml output wants to include information that simply isn't present in
> > > the flattened tree format (without considering bindings), so it relies
> > > on formatting conventions in the dts, hence this test in the first
> > > place.  This alleges it removes a restriction, but it only works if a
> > > bunch of extra heuristics are able to guess the types correctly.
> >
> > The goal here is to validate dtb files which I'd think you'd be in
> > favor of given your above opinions. For that to work, we have to
> > transform the data into the right types somewhere.
>
> Yes - and that should be done with reference to specific bindings, not
> using fragile heuristics.
>
> > We don't need any
> > heuristics for that. For the most part, it is done using the
> > definitive type information from the schemas themselves to format the
> > data.
>
> Exactly.  That type information should come *from the schemas*.  Not
> from separately maintained and fragile approximations to parts of the
> schemas embedded into dtc.

The same can be said for every client program, too. But we're so far
away from all knowledge about a binding flowing from a single source.
I'd love it if we could just generate the parsing code out of the
schemas to populate typed C structs for the OS to consume. The reality
is that knowledge about bindings resides in multiple places and dtc is
one of them.

> > The exception is #*-cells patterns which need to parse the tree
> > to construct the type information. Given dtc already has all that
> > knowledge in checks, it's easier to do it there rather than
> > reimplement the same parsing in python.
>
> dtc only has parts of that knowledge in checks.  The checks have been
> written with the assumption that in ambiguous cases we can just punt
> and not run the check.  For the goal of truly parsing everything, the
> current design of the checks subsystem really isn't adequate.

Yes, but handling 'foos' plus '#foo-cells' is a limited problem space
compared to all bindings and not one that fits well with binding
schemas. dtc already knows how to parse these properties and we don't
get new ones frequently. I'm just trying to use the knowledge that's
already in dtc.

I'm a bit worried about doing more in python too, because running
validation on 1000+ DT files is already ~2 hours. And we're only a
little over halfway converting bindings to schemas (though that's
probably a long tail of older and less used bindings).

Rob
