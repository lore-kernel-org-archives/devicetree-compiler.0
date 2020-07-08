From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] dtc: Preserve negative integers in yaml and dts output
Date: Wed, 8 Jul 2020 10:26:07 -0600
Message-ID: <CAL_JsqJ5+um_2XMzzL90K3wS-N98MXP52SBSnJgNQ1agsjz-eg@mail.gmail.com>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
 <20200705085940.GB12576@umbus.fritz.box> <CAL_JsqJt5a1SGN4JsTLBdO0+7niYh0hvEP_Ta80iuFV-__5TZA@mail.gmail.com>
 <20200708111204.GI18595@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594225580;
        bh=KhpELMmplU7noShbkAzeYzzVUi+bBpV4Hjvg17tJqrY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kZWjOVN58eVF/L6aQr3lM89gkwwgRwWEy10cfSk7gctBhNd23O9PIX/WN87k5aBqg
         Iz7BPNQPFEQpxtCfYL9YYPMZRiETUmtpFbg0W+RJa07588le9LnXb82um7QoH5cLXI
         wwNCXTX9PMD1S/YyBW2heDgHzfrOoIdyedYCbNHE=
In-Reply-To: <20200708111204.GI18595-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Jul 8, 2020 at 5:12 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Jul 07, 2020 at 09:47:49AM -0600, Rob Herring wrote:
> > On Sun, Jul 5, 2020 at 2:59 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Fri, Jun 26, 2020 at 05:25:25PM +0100, Andrei Ziureaev wrote:
> > > > Currently, in yaml output, negative values are indistinguishable from
> > > > positive ones. Some bindings (for example
> > > > Documentation/devicetree/bindings/iio/accel/lis302.txt) mention negative
> > > > values. If those binding are converted to yaml, dt-schema validation
> > > > wouldn't work with them.
> > >
> > > > The first patch is a mechanical change and shouldn't affect dtc's
> > > > behaviour.
> > > >
> > > > The second one is the functional change. When applied, dts to dts and
> > > > dts to yaml conversions preserve the '-' sign in front of integers.
> > > >
> > > > For now, in dts parsing, only the unary '-' operator creates negative
> > > > values (the other operators just set the 'is_negative' flag to false),
> > > > but it should be easy to add support for other operators if needed.
> > >
> > > Hmmmmm.  I'm really not convinced by this.  It seems like a lot of
> > > fiddly work to preserve the sign only in a pretty narrow set of cases.
> > > Basically it will only be reliably correct in the case of just
> > > (-literal).  Something like (5-3) will still show as 0xfe rather than
> > > -0x2, and if you do -(3-5) or (-3+5) you'll get the very strange
> > > looking "-0xfe".
> >
> > It's a narrow set of cases if you assume an equal distribution of
> > expressions, but I'd bet you'd be hard pressed to really find examples
> > beyond (-literal).
>
> You might be right, but I still really dislike guessing the type from
> how the user has happened to format it.  Oh, and another case: it's
> not uncommon to use "-1" just as a shorthand for 0xfffffffff (or
> whatever) in an essentially unsigned field.

~0 would be more correct for this IMO.

Shouldn't we follow C rules here? If we do signed operations we
default to signed. And since we don't have casting, the above should
not be valid. (I couldn't find any examples of the above).

> > But I guess at least the above examples could be supported. We'd have
> > to assume that if there's any subtraction, then types are signed and
> > we carry that thru. And perhaps give up and revert to unsigned if
> > there's anything more complex (signed values plus logic ops). In that
> > case, rather than tracking 'is_negative', we'd track is_signed and
> > then the output side would have to check that plus the data value to
> > output a negative.
> >
> > > I also don't see why this is vital to schema validation.  The
> > > validator should know the binding, and will therefore know which
> > > values are signed, and can appropriately treat 0xfe and -2 (or
> > > equivalent at whatever width) as the same.
> >
> > We could do that to some extent. The type is abstracted from the
> > binding and it just specifies 'int8' for example. That could be
> > internally set to { maximum: 0xff, minimum: 0 }. This works until you
> > want to further constrain the values for the specific bindings (e.g. {
> > enum: [ -1, -2, 127 ]}). We could process the schemas to find every
> > negative number and transform them to an unsigned value, but this gets
> > messy and fragile and is something I want to minimize.
>
> I find it really hard to believe this would be *more* messy and
> fragile than what you're proposing here.

You are basing that statement on having looked at the schema tools?

The code to walk the schema and doing this for all the possible schema
structures that can exist is messy. I've re-written the code 3 times
and still don't like it. So I don't want to add more to it.

>  You're putting the onus on
> dtc which fundamentally *does not have* the information it would need
> to do this correctly.  So you're resting the validation on some
> heuristic of how the user expresses the value, which really doesn't
> seem like a good idea.
>
> The schema checking has (or should have) the binding, which specifies
> the types (including signedness, I would hope) of each field.  That's
> what you need to correctly analyze this
>
> I don't see why constraining to particular values makes this hard.
> You know the type, so you can translate each of the specific values
> into that type

Actually, I wasn't thinking about that, but you may not have all the
information. There can be multiple schemas for a given property. This
is a very common pattern where we have a common definition containing
the type and then specific bindings have further constraints such as
valid values. Even within a single binding we can have this pattern:

properties:
  signed-prop:
    $ref: /schemas/types.yaml#/definitions/int8

if:
  properties:
    compatible:
      const: foo,bar
then:
  properties:
    signed-prop:
      enum: [ -1, 0, 1 ]
else:
  properties:
    signed-prop:
      enum: [ -2, 0, 2 ]


While we could fixup this case and all the possible variations in
structures (such as allOf/anyOf/oneOf schemas), I don't see how we can
do it when the schema is split across different schema files.

If we don't address this in dtc, signed types are so rare (I found 22
cases of (-literal) and one case of subtraction in 1200 dts files),
I'm inclined to just make the schemas define unsigned values. That's
awful for readability and writers and reviewers of schema files,
but...


I'll throw out another idea. What if we extend '/bits/' to include the
sign. So we could have '/bits/ -8' for signed 8-bit. Then it's
explicit and there's no guessing.

Rob
