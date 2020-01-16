From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Thu, 16 Jan 2020 20:58:12 +1300
Message-ID: <CAPnjgZ2vbphSbvohBD3YTswX2WtKdVxgs9Ltg9vFfrEQyr2LGw@mail.gmail.com>
References: <20200112185209.75847-1-sjg@chromium.org> <20200116064955.GR54439@umbus>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ptgMY8dyQJ/4k00uR1dLUmOq9IejtqRu0GV1dHR1LUs=;
        b=jVJeYc/yFt/R6iBt4lNxwucw1AYQhd42UtVxZC69bi821dd7WP9dLpfawuYs8Tgk5/
         spkAtewajSJSAJGW2Oc+uoYYQeqJuXePOkbdQzcvsu6Wgbqg835MLOq/ovy0PC3KA0AJ
         z+yetPSVjTsZdo3N2EZi+JxD+n8+/Vk1ClorY=
In-Reply-To: <20200116064955.GR54439@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On Thu, 16 Jan 2020 at 19:50, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wr=
ote:
>
> On Sun, Jan 12, 2020 at 11:52:08AM -0700, Simon Glass wrote:
> > These warnings appear when building U-Boot on x86 and some other target=
s.
> > Correct them by adding casts.
> >
> > Example:
> >
> > scripts/dtc/libfdt/fdt.c: In function =E2=80=98fdt_offset_ptr=E2=80=99:
> > scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer express=
ions of different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=98i=
nt=E2=80=99 [-Wsign-compare]
> >    if ((absoffset < offset)
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Hmm.  So squashing warnings is certainly a good thing in general.
>
> Unfortunately, I'm really uncomfortable with most of these changes.
> In a number of cases they are outright wrong.  In most of the others,
> the code was already correct.  I dislike adding casts to suppress
> spurious warnings on correct code because that can end up hiding real
> problems which might be introduced by future changes.
>
> Case by case details below.

Thanks for the review. I agree this is all really horrible,
particularly in light of the fact that it doesn't fix bugs and perhaps
introduces some.

This was just a quick patch to silence the warnings. If we do make
fixes here we should really make sure that there are test cases to
trigger each check. I suspect we have some but not all.

What do you think we should do? The warnings are going to be very
annoying for people. I could perhaps split the patch up and work
through things one by one.

Regards,
Simon
