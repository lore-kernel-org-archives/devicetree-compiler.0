From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Updated ePAPR specification?
Date: Fri, 27 Jun 2014 21:52:29 -0700
Message-ID: <CAGVrzcZCt7Yp7Yxa9Kn-A38qwFCpZNpnawzSR0B+9pKBDKwOAw@mail.gmail.com>
References: <CAGVrzcZcLooRwP3yH=HxgaGNfVp6AbGdk9cqx7vvhsPgwv0BMA@mail.gmail.com>
 <1403856166.19234.7.camel@hornet>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=qVhCxUsyV0WA04MhRcDKjmWQN2NrOCL7KNIdbrOZZ4s=;
        b=RC6f1SgMwJfWnkiLInkkw9kKG1ghthKBYH405BAn2L1HA/MF1cy1lHF2tEPIwLOlZ2
         NUmukzaZ+P+ES1iJYcK5znqnRsvUqLP6KE3BbHVIeFjug+wZtzXKP5tYG6B1JPfzEfJx
         1gxGZUkr3cRGY3mGFOSWx1LAn2q16pVyDq/6qkcaZgRrs3loY7U2eGuiY0ieyzAeGW2G
         Fu4wMLg53JJ8tZRWjcKMK03TCwegszF+dT57QOLdUXTjY3vybphqoSjYA+BV5Uyy7DcP
         00G7gJ2RvemTsvF6X9bIooSmPGLWeLngud4RS6WPYdXy0wQYYUvO2AGYvPW3t9jroYYP
         tpIA==
In-Reply-To: <1403856166.19234.7.camel@hornet>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

2014-06-27 1:02 GMT-07:00 Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>:
> On Thu, 2014-06-26 at 19:24 +0100, Florian Fainelli wrote:
>> If we were serious about doing this, how would you recommend we move
>> forward, should we aim at doing something similar to the virtio
>> specification and publish an update Device Tree binding specification
>> as part of an OASIS working group?
>
> I'm sure OASIS admins would be delighted to have more non-XML-related
> standards in the portfolio ;-)
>
> One thing I must point out (after going through the process with virtio)
> is that in order to participate in a OASIS Technical Committee, one must
> be either an employee of a company being a OASIS member, or pay for an
> individual membership (there seem to be some limitations in this case
> though). OASIS people are very strict on this (also on the communication
> channels - ie. all discussions *must* happen on the official OASIS
> mailing lists) due to IP Rights policies.

Ok, that should not be a problem, I can certainly get my employer to
back me up on this initiative.

I am mostly wondering if having something aside from ePAPR either
makes sense or is something that is desirable to have for the various
open-source and proprietary boot loader and OSes out there that use
Device Tree.

Thanks
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
