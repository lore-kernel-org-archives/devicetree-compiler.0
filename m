From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/3] Add a couple of string-related functions
Date: Thu, 16 Jul 2015 10:56:23 -0600
Message-ID: <CAPnjgZ0FQvjkC=LUWeCgeDw+x+DePyaNQ=CiC+ht86U2KY_BMA@mail.gmail.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <E1ZFMkd-0002ir-O5@mylo.jdl.com> <CAPnjgZ12VVSDkALDDg31Sgwo1PpFPfE10GFtrseHWpRX1re-HQ@mail.gmail.com>
 <20150716052716.GB25179@voom.redhat.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=tSnPlxkIIm+MjpKvs3trcapk/ic80fhj+q3MqKP+wAU=;
        b=oypni6VxpGLEH0v4oueAumm4DxZwRWhLOcP1pndjUQtdEfek/AdHAeFUkhsA5N/iRE
         i+4mPTfV97m+n4/QsMaWVQ+4x9K6R0bRsaaLus/IDwcAF0YIHYzcHKd7jAaAsYlY8eQr
         SrsRC3XCafPwLD/hErFvlKLFw8T9CY9z85qVULnwV2x/zMcnP0nEQm1SEB3KyD/JZ7EZ
         Ty3zQu6XnaH7lDo1eKcX/Rd6bFnorE69mE5XAx4zXMEiWOz0vvP9o4qg9xSREuR+hAWA
         vBvJ+UFgDe5xqpqKe/bxEgRXmqkgvTXERhEWNQX12FsSsijnli//F5s9lVE3xlp+rxiS
         sRaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=tSnPlxkIIm+MjpKvs3trcapk/ic80fhj+q3MqKP+wAU=;
        b=hUAT3WWMaegQU4PUJfNXj/yB9VhZNe9iL5awXYf6b0tKWba3tSeJFYcowa4e368J2E
         p29KhfT257NJG4OMbF5MHsgdoGvz2mOJpI4Ks5pBDA3DttjSlXHmStOAjtKL6lF3Kwmt
         FGy+oNvHn6f6X/7CW0PEcoQAtib+vjsJZziv4=
In-Reply-To: <20150716052716.GB25179-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Hi David,

On 15 July 2015 at 23:27, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Jul 15, 2015 at 03:45:07PM -0600, Simon Glass wrote:
>> Hi Jon,
>>
>> On 15 July 2015 at 07:29, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>> >
>> > So, like, Thierry Reding said:
>> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > >
>> > > These three patches add a couple of string functions that have proven
>> > > useful in U-Boot's copy of libfdt, so they are likely to be useful for
>> > > other users as well.
>> > >
>> > > Patch 1 adds a function to count the number of strings in a property's
>> > > value. This also adds a new DTS sample along with a small test program
>> > > to validate the implemented functions.
>> > >
>> > > Patch 2 adds a function to retrieve the index of a given string in any
>> > > given property's value. This adds code to the test program introduced in
>> > > the previous patch to exercise the new functionality.
>> > >
>> > > Patch 3 adds a function to retrieve a string by index from a property's
>> > > value along with a shortcut for index 0. This extends the test program
>> > > introduced in patch 1 to validate the new functionality.
>> > >
>> > > Thierry
>> >
>> >
>> > Hi Thierry,
>> >
>> > While I am generally fine with this patch set, I have
>> > a large-scope question.  Is there a larger plan to
>> > consolidate or unify the U-Boot and DTC libfdts?
>>
>> I maintain the fdt tree for U-Boot at present. About once a quarter I
>> check what has changed and do a bit of a sync. But there are things
>> that libfdt upstream has not accepted - e.g. the grep functionality
>> used by verified boot hashing stuff. I wish we could figure that out.
>> Perhaps a cut-down fdtgrep tool would meet with favour. We're using it
>> even more now since SPL (the minimal U-Boot loader) wants to run with
>> a subset of the full board FDT for SRAM space reasons.
>
> So, short-term: there's no reason your fdtgrep stuff needs to be
> considered as part of your version of libfdt - it could just as easily
> be an add-on sitting alongside libfdt - then you could share the core
> libfdt code at least.

That's how it is today, yes.

>
> Longer term, my main sticking point on the fdtgrep stuff was entry
> points whose semantics don't make me go cross-eyed (includes these
> nodes, but not those nodes, and might include children if this flag is
> set, but not that one and the operator's shoe size matches some other
> property...).  I'm not sure if that's a question of redesigning the
> interface, or just of describing it better.

Neither am I, but perhaps if I cut down the fdtgrep options so that it
only does a few basic things that would help? The full feature set
would still be in the implementation, but it would reduce confusion on
that side.

>
>> I do ask people to send things upstream, and if rejected we then have
>> to work out what to do...there are recent U-Boot mailing list threads
>> on this.
>>
>> Regards,
>> Simon
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson

Regards,
Simon
