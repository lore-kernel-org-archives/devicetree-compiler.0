From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] checks: Add interrupt provider test
Date: Thu, 11 Jun 2020 14:04:54 -0600
Message-ID: <CAL_Jsq+FzBqNjAZ0ZjjC0fvp5henjuNRON3fGTJ8Xh4FN5KW8g@mail.gmail.com>
References: <20200602110419.22488-1-andre.przywara@arm.com>
 <20200602110419.22488-2-andre.przywara@arm.com> <20200610051057.GM494336@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591905906;
        bh=3aoXD2QlbiPuzv3iCO7SuU+16BlEFKG2sVlEH30qfi8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Sooj1+YHq2DW+8MHQ8plWR/77iOHNbtEVVaNAZZnQ1zDaesZodrOofxgdMfLiO1F8
         BI5GQm5AgtzXWFaadL42G9VTgNZylW9tcWQXBXF8Xfe7eVIIA3C1awYByLmSkw+gRM
         hJuYa3GYk9AP1pCKhr8m1GWcoMFLrr308/JcyHbI=
In-Reply-To: <20200610051057.GM494336-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Jun 9, 2020 at 11:12 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Jun 02, 2020 at 12:04:17PM +0100, Andre Przywara wrote:
> > An interrupt provider (an actual interrupt-controller node or an
> > interrupt nexus) should have both #address-cells and #interrupt-cells
> > properties explicitly defined.
> >
> > Add an extra test for this. We check for the #interrupt-cells property
> > already, but this does not cover every controller so far, only those that
> > get referenced by an interrupts property in some node. Also we miss
> > interrupt nexus nodes.
> >
> > A missing #address-cells property is less critical, but creates
> > ambiguities when used in interrupt-map properties, so warn about this as
> > well now.
> > This removes the now redundant warning in the existing interrupts test.
> >
> > Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  checks.c                           | 32 ++++++++++++++++++++++++++------
> >  tests/bad-interrupt-controller.dts |  7 +++++++
> >  tests/run_tests.sh                 |  1 +
> >  3 files changed, 34 insertions(+), 6 deletions(-)
> >  create mode 100644 tests/bad-interrupt-controller.dts
> >
> > diff --git a/checks.c b/checks.c
> > index 4b3c486..23faca5 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1547,6 +1547,28 @@ static bool node_is_interrupt_provider(struct node *node)
> >
> >       return false;
> >  }
> > +
> > +static void check_interrupt_provider(struct check *c,
> > +                                  struct dt_info *dti,
> > +                                  struct node *node)
> > +{
> > +     struct property *prop;
> > +
> > +     if (!node_is_interrupt_provider(node))
> > +             return;
> > +
> > +     prop = get_property(node, "#interrupt-cells");
> > +     if (!prop)
> > +             FAIL(c, dti, node,
> > +                  "Missing #interrupt-cells in interrupt provider");
>
> I like splitting the check for #interrupt-cells into a separate check
> from the 'interrupts' property check.
>
>
> > +     prop = get_property(node, "#address-cells");
> > +     if (!prop)
> > +             FAIL(c, dti, node,
> > +                  "Missing #address-cells in interrupt provider");
>
> However, I'm a bit less sold on checking #address-cells here.
> Although #address-cells is necessary for interrupt-maps, there are a
> lot of cases with just a single, simple interrupt controller that's
> not a bus root so it's not obvious why it would need to have an
> #address-cells property at all.
>
> So, I think you do want to check #address-cells only where you
> actually do need it (the interrupt provider is the target of an
> interrupt-map).

That seems okay for me. I'd expect that's a whole lot less warnings
generated. If not, then maybe should still be separate.

Rob
