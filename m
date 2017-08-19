From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] checks: add interrupts property check
Date: Sat, 19 Aug 2017 17:42:46 +1000
Message-ID: <20170819074246.GB12356@umbus.fritz.box>
References: <20170814214807.338-1-robh@kernel.org>
 <20170814214807.338-2-robh@kernel.org>
 <20170818044303.GR5509@umbus.fritz.box>
 <CAL_JsqJuUu-6FpLqQZZyVdCueV18CHRZ4qQUvacSrn2XAfpiSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503129142;
        bh=Pswb3/ny3SRLdUQJ8ppA1DMngPpKN2cGHm13NGvWvRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R5oi3iXuSB+wtlfhB/jmYb4wQTa/A4gn4dTrhRqxbtWwAJ8V7yFblPot5Ry458mzh
         zMZCPsDnrnh1tt48bzTqCf9+3an/ZTkGPEGf6u6ucnGT8qXlAhWxvxZBY3Y+fK3q6h
         LWpcwxElkDjPOurlaHdCoEzEBYGby4Gc6HQbvTI0=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJuUu-6FpLqQZZyVdCueV18CHRZ4qQUvacSrn2XAfpiSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2017 at 10:53:56AM -0500, Rob Herring wrote:
> On Thu, Aug 17, 2017 at 11:43 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Mon, Aug 14, 2017 at 04:48:07PM -0500, Rob Herring wrote:
> >> Add a check for nodes with interrupts property that they have a valid
> >> parent, the parent has #interrupt-cells property, and the size is a
> >> valid multiple of #interrupt-cells.
> >>
> >> This may not handle every possible case and doesn't deal with
> >> translation thru interrupt-map properties, but should be enough for
> >> modern dts files.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  checks.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++
> >>  1 file changed, 58 insertions(+)
> >>
> >> diff --git a/checks.c b/checks.c
> >> index c0450e118043..0d452bf8e674 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -1070,6 +1070,63 @@ static void check_gpio_cells_property(struct ch=
eck *c,
> >>  }
> >>  WARNING(gpio_cells_property, check_gpio_cells_property, NULL);
> >>
> >> +static void check_interrupts_property(struct check *c,
> >> +                                   struct dt_info *dti,
> >> +                                   struct node *node)
> >> +{
> >> +     struct node *root =3D dti->dt;
> >> +     struct node *irq_node =3D NULL, *parent =3D node;
> >> +     struct property *irq_prop, *prop =3D NULL;
> >> +     int irq_cells, phandle;
> >> +
> >> +     irq_prop =3D get_property(node, "interrupts");
> >> +     if (!irq_prop)
> >> +             return;
> >> +
> >> +     while (parent && !prop) {
> >> +             if (parent !=3D node) {
> >
> > So, it's kind of academic, but is it actually disallowed for an
> > interrupt-controller node to itself have interrupts which are
> > implicityly routed to itself?
>=20
> I think so, yes. Because otherwise how do you describe a chained
> interrupt controller? "interrupts" in the chained controller's node
> are the parent's interrupts. I guess you have to rely on the
> compatible implying any interrupts connected to itself. It could work
> with interrupts-extended though.

Ah.. yes.  My guess would be that you could do it by using an explicit
interrupt parent - which would mean that interrupt-parent would need
to take precedence over an interrupt controller in the same node.  I
guess we should probably check the old interrupt binding document.

Note that a possible, though strange case is for a node to have
interrupt-parent pointing at itself, with itself being an interrupt
nexus redirecting the interrupts elsewhere.  I've used this in the
past to handle a device with interrupts going to multiple interrupt
controllers before interrupts-extended was invented.

>=20
> [...]
>=20
> >> @@ -1103,6 +1160,7 @@ static struct check *check_table[] =3D {
> >>
> >>       &provider_cells_property,
> >>       &gpio_cells_property,
> >> +     &interrupts_property,
> >>
> >>       &always_fail,
> >>  };
> >
> > With both these patches testcases to make sure the checks actually
> > trip on a bad example would be good.
>=20
> Yeah, I wanted to get some initial feedback first.

Fair enough.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmX6/YACgkQbDjKyiDZ
s5KI7RAA0BEX1ZGUzqZlqwAUygeLZE8+gO8xznFtl8cvs/I3mc1R4Ksi9zQVggPW
TENmeR0bJ+e+X9v7tenMqKUYtNq637OzO3Yz5+gR+xVfeht+QJ3XAcGVU6PlWAS1
NxoKVEnDsUmzjIMJwwy3TyYViOB+btmN/oj5NjjGWQOQgZ8fTa8lM5paNHKjjYmn
d27K4hV6KLc/hX+hZw/SRYEICPjru0jF2FSGFqSeqaKntzynvzzooaqO9MmiuUID
gOuUF18OgZVUL/DFadzttpKuoX5TUtre5BGcACxYOGasmKcHZFrsOelQTnZ2xDJ0
9Lfrafr7nlriiGJI8tXcYBv4eUjYtFqkc4GAPKT6u8smRX431E8PA/UPxPA2XQyL
9hPk6dixPKdhLCg8VUIMbrv0N7eljudgGfHyywG2zBOTHyyD2KY6q/SeNYMBa5jC
z3zX4cbcREq0HSdcCf9oV6lxhk+RdMcEtnWnw33ux5cFSHqeURf7ajT21IQDPl0T
FA85uoCs8soOQh4j4XrAF1MnUbsxVZXm1uTMl+yf2GD+EgDLOfmZVYHIb68/yPxW
cO1QSVtCVUrTCzYckTYs9XNjz/kGYjFWX76Yx8peQJRWUWbX4aA/0t6T/JSvz/rQ
bJ9k6cPL4nLKrG8hp7H/4tVuJJ1SJUMKNstonlg2gu8gMjmCvkY=
=ZkOt
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
