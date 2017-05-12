From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: using labels for stdout-path
Date: Fri, 12 May 2017 09:41:55 +0200
Message-ID: <20170512074155.oshpdio2hb7cz377@pengutronix.de>
References: <20170511130545.co6pyyvlwuitbyne@pengutronix.de>
 <CAL_JsqL66sWFovGhYGaA_sB_pnvTrjyaQ7MW3=5pkD5Qwb6y_w@mail.gmail.com>
 <20170511184023.oi4bwwrutllexjen@pengutronix.de>
 <20170512034816.GA12908@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170512034816.GA12908-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello David,

On Fri, May 12, 2017 at 01:48:16PM +1000, David Gibson wrote:
> On Thu, May 11, 2017 at 08:40:23PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, May 11, 2017 at 10:49:15AM -0500, Rob Herring wrote:
> > > On Thu, May 11, 2017 at 8:05 AM, Uwe Kleine-K=F6nig
> > > <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > > Hello,
> > > >
> > > > on an i.MX28 based machine I want to have the console on &duart with
> > > > 115200 Bd, 8 Bit, no parity.
> > > >
> > > > The options for that are AFAICT:
> > > >
> > > >  - use an alias, like:
> > > >
> > > >         stdout-path =3D "serialX:115200n8";
> > > >
> > > >    the problem here is, that the duart doesn't have an alias. I gue=
ss I
> > > >    shouldn't introduce a new one for my setup?
> > > >
> > > >  - use a label, like:
> > > >
> > > >         stdout-path =3D &duart, ":115200n8";
> > > >
> > > >    This would be the prettiest, but that doesn't work, because ther=
e is
> > > >    a '\0' separating the path and the options.
> > >=20
> > > You could make that work changing the kernel parsing, but that's
> > > probably not a good option if we ever want to support more than 1 out
> > > path.
> >=20
> > Good point. That's a good reason to not use this syntax.
>=20
> Yes, changing the actual property format is a bad idea.
>=20
> > > >  - use the full path, like:
> > > >
> > > >         stdout-path =3D "/apb@80000000/apbx@80040000/serial@8007400=
0:115200n8";
> > > >
> > > >    This is ugly.
> > > >
> > > > Do I miss something? Is that worth to introduce new syntax, maybe
> > > >
> > > >         stdout-path =3D &duart . ":115200n8";
> > > >
> > > > or similar?
> > >=20
> > > Seems like we should make a comma be significant in splitting strings.
> > > I'm not sure if there's anything relying on "foo" "bar" and "foo",
> > > "bar" being the same. At least for numbers, a comma has no meaning, so
> > > it would complicate the parsing I'd imagine. Not really an area I'm
> > > familiar with.
> >=20
> > "foo" "bar" is a syntax error now (and another obvious candidate for
> > string concatination). So writing in the dts
>=20
> Right.  "foo" "bar" would be my preferred syntax for string
> concatenation (the main guiding principle for dts syntax is "be like C
> where possible").
>=20
> >=20
> > 	stdout-path =3D &duart ":115200n8";
> >=20
> > and getting the same result as
> >=20
> > 	stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074000:115200n8";
> >=20
> > looks nicely and consistent with
> >=20
> > 	stdout-path =3D &duart;
> >=20
> > being equivalent to
> >=20
> > 	stdout-path =3D "/apb@80000000/apbx@80040000/serial@80074000";
> >=20
> > After a quick look into the dtc sources I imagine that wouldn't be too
> > hard to implement for someone being fluent in lex and yacc.
>=20
> Unfortunately, there are two complications with this.  The more minor
> one is that an "implicit" operation like this (no actual operator
> symbol) can make things get a bit curly in the grammar - mostly by
> allowing potential ambiguity in situations which are obviously
> different to a human, but not to the parser.

/me remembers his algorithms courses about ambiguous grammars and
mumbles something about left and right recursion.
=20
> The bigger problem is that during the parse which is when we're (for
> example) evaluating integer expressions, we haven't yet resolved
> labels.  So, we can't expand the reference, we just insert a "marker"
> in the property bytestring which says to insert the node path later.
> That means we can't just have simple code to do a string concatenation
> here.  That marker gets expanded later on, once we've resolved all
> references.
>=20
> Note that this is the same reason you can do:
> 	prop =3D < (1+2+3) &foo >;
> But you can't do
> 	prop =3D < (&foo + 1) >;
>=20
> There are two ways we could deal with this:
>=20
>    1) The quick and dirty way: special case string append with a
>    reference, so that we insert a new type of marker which will be
>    expaned to the node path without the final \0.
>=20
>    2) The complicated but powerful way: rather than (mostly)
>    constructing the property values as bytestrings at parse time, we
>    just construct the property values as expression trees at parse
>    time, then evaluate those expression trees later on, once we're
>    able to resolve references.
>=20
> Approach (2) has been suggested before.  As well as this case it would
> be a necessary step for allowing defined "functions" (for integers or
> otherwise) in dtc.  It has some nice properties, but it's a rather a
> lot of work.

lex and yacc are great, but I'm not into them to be of help here :-|

> > And probably
> > it would be cheap to add the other obvious extensions like:
> >=20
> > 	property =3D < 0x12 0x43 > "a string" &label /incbin/(filename);
>=20
> Um.. what?  That's not an obvious extension at all.  The proposed
> change is to have (a b) be a string concatenation, but several of the
> things above aren't strings, so it's not clear what it should do.  If
> you want _bytestring_ concatenation, we already have syntax for that -
> that's exactly what ',' does in dtc.

When compiling and then decompiling a node that contains

	property =3D < 0x41424344 0x45464700 >;

I get

	property =3D "ABCDEFG";

in the dts output. So I assumed that strings and arrays are just
different syntactic ways to define a value and so concatenation would
work for both the same way. Now thinking a bit more there are some
problems that are likely solved best by not allowing concatenation for
arrays and binary data.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
