From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Mon, 24 Jan 2022 14:28:38 -0700
Message-ID: <CAPnjgZ34KbvDOAUTGC+LRyUTNnyJkHsOd9yu52trGpz=MrD20w@mail.gmail.com>
References: <20211225132558.167123-1-luca@z3ntu.xyz> <5532817.DvuYhMxLoT@g550jk>
 <CAPnjgZ1NX2Q884T_LNUOLJT8=RKZXEj2z7uxzQF4MrHiKObZvA@mail.gmail.com> <3246478.aeNJFYEL58@g550jk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FTK/LEcR01lwH3rWyqS8ECkVmEP0BSDqnzpaFVP8Gfs=;
        b=l13+XWWvobNrhg0rKZcYHi6EbF65NBTWEJskFQTBuznm79545ZIKrMK1uz0/lqpj0V
         qVVD6yooP05XkV2BgPziv+O4CaYjlyWcdWWoM7RcPhvGLz1GGabVzDTNkAejF5DNfFzc
         +u5damFDetdHzue7u9fr39BIfj9mxWVeTegPg=
In-Reply-To: <3246478.aeNJFYEL58@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Mon, 24 Jan 2022 at 13:50, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Hi Simon,
>
> On Montag, 24. J=C3=A4nner 2022 18:57:45 CET Simon Glass wrote:
> > Hi Luca,
> >
> > On Sat, 22 Jan 2022 at 03:36, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > Hi Simon,
> > >
> > > On Dienstag, 28. Dezember 2021 09:34:57 CET Simon Glass wrote:
> > > > Hi Luca,
> > > >
> > > > On Sat, 25 Dec 2021 at 06:26, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > > Add a new method that doesn't throw an exception when a property =
isn't
> > > > > found but returns None instead.
> > > > >
> > > > > Also add a test for the new method.
> > > >
> > > > You can use
> > > >
> > > > getprop(node, prop, quiet=3DQUIET_NOTFOUND)
> > >
> > > This returns -1 when not found which I found quite un-pythonic (not t=
hat
> > > pylibfdt is currently super pythonic ;) ).
> > > Having None returned if not found is much nicer to use and much more =
clear
> > > to use
> > >
> > >     if foobar is None:
> > >  instead of having to use
> > >
> > >     if foobar =3D=3D -QUIET_NOTFOUND:
> > > Are there any changes I can do for you to reconsider your position on=
 this
> > > patch?
> >
> > I think I was put off by the mention of an exception in the commit
> > message. Really all you are doing is trying to make this function more
> > pythonic. I suppose we could change the getprop() function to return
> > None if there is no property (with QUIET_NOTFOUND supplied for the
> > 'quiet' argument). That makes not-found special, but I suppose if the
> > error were anything else, e.g. -FDT_ERR_BADSTRUCTURE and
> > quiet=3D[BADSTRUCTURE] were passed, we could return None in that case
> > too?
> >
> > I agree it is more pythonic.
>
> The "proper" way (in my opinion) would be to return the property or None,
> except for more serious errors like the BADSTRUCTURE one that just throws=
 an
> exception; and hide all the C integer return values inside the wrapper.
> And instead of passing quiet=3D[BADSTRUCTURE] you would do

You could return None for the ones that are quietened, but then note
that you cannot recover the actual error. So in fact I think that is a
problem with what I proposed above, so in fact we should only return
None for -FDT_ERR_NOTFOUND, if even that.

>
> try:
>     myprop =3D fdt.getprop(foobar)
> except FdtBadStructureError:
>     foobar()
>
> I understand it's probably not a good idea to change the existing functio=
n too
> much given current users where scripts depend on this behavior but this w=
ay
> it's definitely more approachable to an average Python user.

Unless you are possibly expecting an error, e.g. -FDT_ERR_NOSPACE. It
is a pain to have to catch exceptions for what is normal operation. In
fact if I recall the Python sages recommend against things like that?

Regards,
Simon


> >
> > David, what do you think?
> >
> > Failing that I'm OK with this function, but with the commit message
> > updated to not mention exceptions, as we already have that mechanism,
> > so it is confusing.
> >
> > BTW you can use QUIET_NOTFOUND instead of [FDT_ERR_NOTFOUND]
> >
> > Regards,
> > Simon
>
>
>
>
