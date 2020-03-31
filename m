From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/4] Add device tree build information
Date: Tue, 31 Mar 2020 02:03:56 +0100
Message-ID: <20200331010347.GF4037@linaro.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <1b946fcf-47a9-012d-1b04-f4bbd2682607@gmail.com>
 <67d75f0c-7478-23b0-8619-746cf83cedb5@gmail.com>
 <dba17be2-067f-8221-f313-7a3edcf61511@st.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fw2LMhqMpUKtHzYbQVOA9bjQOm3X2jbwN5CrhUGESVY=;
        b=rp3DjIoLk0LM8SIxOuGq5sbJ4rPhWrk5QsErQqD0bL+5tNrJg1LIvspg8AZyyH2r5X
         pT2ta0nzDwpHBnGmQiIEx1jxbjMA29SZzy1bFfQqrGCSSZN9DQWuoXn6Us3JRAg8GFj8
         t73zUdAnwyE7z/ECeluUAfhIpIrVCCmcewk9UKiDPXXZGHsG+IfrjQ4zQYxz6v8d0B7e
         hF7Ys/uNmD+HL1BhS8FgONzC2g6cdEcZukRTyMg4tKbiBp/Sg250tOJ+stSqXDeBHnF2
         w+4lJl8svCssSiM5FHbrphE8WZv4lMPVcSFbB9zdTUPoK5x2kkTnUjBxO9SPenWAlWoq
         sL3A==
Content-Disposition: inline
In-Reply-To: <dba17be2-067f-8221-f313-7a3edcf61511-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

Hi Alexandre,

On Mon, Mar 02, 2020 at 01:55:55PM +0100, Alexandre Torgue wrote:
>On 2/28/20 6:47 PM, Frank Rowand wrote:
>> > This would require modifying every single main .dts file to get the build info
>> > I would prefer the method that Ian and David came up with (sorry, no lore link,
>> > it did not go to lkml).  Extract from David's email:
>> > 
>> >     Date:   Tue, 21 Jan 2020 13:05:25 +1100
>> >     From:   David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>> >     Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
>> > 
>> >     > Given that dts files are run through the C preprocessor before being
>> >     > fed to dtc, the build script could use the '-include' flag to force-
>> >     > include a fragment containing generated build info without any need to
>> >     > modify existing dts files.
>> > 
>> >     Uh... maybe.  -include will essentially prepend the forced file, which
>> >     is a bit awkward for our purposes.  It means that the prepended file
>> >     would need the /dts-v1/ tag, and we couldn't have it in the main files
>> >     which would be a bit confusing.  I think it would also cause problems
>> >     with any /memreserve/ tags and means that the main tree could in
>> >     theory overwrite the build information which we don't necessarily
>> >     want.
>> > 
>> >     I guess we could build things the other way around: have the main .dts
>> >     file specified with -include and have the dts on the dtc commandline
>> >     be a fixed one with the build information.  It'd be a little weird,
>> >     though.
>> > 
>> > -Frank
>
>Yes. I try briefly this idea but I got issues with dts-v1 tag. I agree, it is
>cleaner to not modify input dts file. I can rework int this way.

Have you made any progress on this please?

Cheers,
-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

