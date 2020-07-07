From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] dtc: Preserve negative integers in yaml and dts output
Date: Tue, 7 Jul 2020 09:47:49 -0600
Message-ID: <CAL_JsqJt5a1SGN4JsTLBdO0+7niYh0hvEP_Ta80iuFV-__5TZA@mail.gmail.com>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com> <20200705085940.GB12576@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594136881;
        bh=Z2kCvcz76n0TeEwEf2LD/xWZ+eMDCAzBzhcrOdgit5s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UnRSqrpRoCX5KqHVHzSUmsxkeig/faneCGHIzxEG3L2DG3QJCDGv+EmY1aUtm25YW
         /+EqRqtO0OXP5Q1sM6nQ9T/qDbasvcH3R9R5JG603MPwI4aVaNbX+ibpFlwXLx+5HH
         31IjzB7df4GR+ExNPb7negkqm+AZO8VfCgUXSu8w=
In-Reply-To: <20200705085940.GB12576-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sun, Jul 5, 2020 at 2:59 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Fri, Jun 26, 2020 at 05:25:25PM +0100, Andrei Ziureaev wrote:
> > Currently, in yaml output, negative values are indistinguishable from
> > positive ones. Some bindings (for example
> > Documentation/devicetree/bindings/iio/accel/lis302.txt) mention negative
> > values. If those binding are converted to yaml, dt-schema validation
> > wouldn't work with them.
>
> > The first patch is a mechanical change and shouldn't affect dtc's
> > behaviour.
> >
> > The second one is the functional change. When applied, dts to dts and
> > dts to yaml conversions preserve the '-' sign in front of integers.
> >
> > For now, in dts parsing, only the unary '-' operator creates negative
> > values (the other operators just set the 'is_negative' flag to false),
> > but it should be easy to add support for other operators if needed.
>
> Hmmmmm.  I'm really not convinced by this.  It seems like a lot of
> fiddly work to preserve the sign only in a pretty narrow set of cases.
> Basically it will only be reliably correct in the case of just
> (-literal).  Something like (5-3) will still show as 0xfe rather than
> -0x2, and if you do -(3-5) or (-3+5) you'll get the very strange
> looking "-0xfe".

It's a narrow set of cases if you assume an equal distribution of
expressions, but I'd bet you'd be hard pressed to really find examples
beyond (-literal).

But I guess at least the above examples could be supported. We'd have
to assume that if there's any subtraction, then types are signed and
we carry that thru. And perhaps give up and revert to unsigned if
there's anything more complex (signed values plus logic ops). In that
case, rather than tracking 'is_negative', we'd track is_signed and
then the output side would have to check that plus the data value to
output a negative.

> I also don't see why this is vital to schema validation.  The
> validator should know the binding, and will therefore know which
> values are signed, and can appropriately treat 0xfe and -2 (or
> equivalent at whatever width) as the same.

We could do that to some extent. The type is abstracted from the
binding and it just specifies 'int8' for example. That could be
internally set to { maximum: 0xff, minimum: 0 }. This works until you
want to further constrain the values for the specific bindings (e.g. {
enum: [ -1, -2, 127 ]}). We could process the schemas to find every
negative number and transform them to an unsigned value, but this gets
messy and fragile and is something I want to minimize.


> > One issue is that there are two ways to format an array of bytes in dts:
> > '/bits/ 8 <...>' and '[...]'.
>
> So, these are intended for different purposes.  If you want to think
> of your bytes as a bunch of 8-bit numbers, the former is appropriate.
> The [ ... ] notation is more intended to be a compact way of putting
> in "untyped" binary data.  For example, a blob of information which
> gets verbatim copied into a device without interpretation by the
> driver would make sense to use this form.

That probably means we should have a schema type for [...], but so far
I haven't seen a need.

> > Only the former supports negative
> > integers. But, in dts output, only the latter is used. Therefore, I
> > didn't include support for negative 8-bit values in dts output (I did
> > add support for them in yaml output). Some possible alternatives are:
> >
> > - switch to the '/bits/ 8 <>' format in dts output
> >
> > - only switch to the '/bits/ 8 <>' format if the array contains negative
> >   values
> >
> > - add another marker to differentiate between the two formats
>
> I'd be ok with this, given the distinction above.  This is similar to
> putting different for markers for say "abc" and <0x61626300> which
> likewise represent the same bytes.

Okay, fine by me.

Rob
