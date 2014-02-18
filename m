From: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 18 Feb 2014 14:44:15 -0800
Message-ID: <CA+bK7J5+n2Se4cLv5WjR5B31ej7FdrGjPcjUULNrhb1UQ7=vmA@mail.gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	<20140218155750.GS17250@pengutronix.de>
	<20140218181854.GB7862@titan.lakedaemon.net>
	<CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com>
	<CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=rXEP+rylPAFm2AzDPQk6Qn/9gmXR3LYkJm0KsR4ghek=;
        b=FxvfTkqOekdt7+D/C2CYAUxQpHEOFywqFJwGPHSSrHoAilzSgL10y05+DpZurPn1hj
         xWy+ayCt9AjT/cBlY/ISq0QzzOeNitjC7KBZSFDMzvSMOel3efwi0YCWMFvCo8JXgkL4
         q49GgcE5uiiTUnnDGnPFlEBhIaYGOEvuYwXd90ujVEzwZSaPx5I9cl1OidYEmaZGyhIG
         cCXO1w+zIdK0cImaN9ifRQmrpkJDGvSuaOECaUOKSUsMOhjMMC36jSNlN/PBUJu4hLnq
         JigxVLQ/7xLKu0nJw8E1JnQfO4AV0RDj02fiYcGsjZlnx2dmMXIs99LDLzALhB4jx+34
         aEFA==
In-Reply-To: <CAOesGMi8zJXhfj46CLB-_Kk2s4MY9da46DhMoCtRj=zSUiuOGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I'm not in favor of separating the device tree information from the kernel.

If we switch, then whatever synchronization issues other projects
are having now with synching with the device tree info from the kernel will
just then become the problem of the kernel developers, who will then
have to sync with the device tree info from another repository.  If the
sync issues can't be solved now for them, why or how would it be solved
post-separation for us?  (It sounds like a zero-sum game of pain transfer
to me.)

I'm relatively unfamiliar with the arguments.  Can someone provide
a brief list of reasons this is needed, and how the inconvenience to Linux
kernel developers will be minimized, should it proceed?

Thanks,
 -- Tim


On Tue, Feb 18, 2014 at 2:21 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Tue, Feb 18, 2014 at 11:47 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> Breakage due to the move is something we should have to put up
>> with, etc.
>
> Typo. We absolutely must not have breakage due to this move.
>
>
> -Olof
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
 -- Tim Bird
Senior Software Engineer, Sony Mobile
Architecture Group Chair, CE Workgroup, Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
