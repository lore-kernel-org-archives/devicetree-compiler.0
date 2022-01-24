From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Mon, 24 Jan 2022 21:50:01 +0100
Message-ID: <3246478.aeNJFYEL58@g550jk>
References: <20211225132558.167123-1-luca@z3ntu.xyz> <5532817.DvuYhMxLoT@g550jk> <CAPnjgZ1NX2Q884T_LNUOLJT8=RKZXEj2z7uxzQF4MrHiKObZvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1643057401; bh=zmYRxbSG7soyBGJjMxoOMLk9l+p8i+jAkkUqbzn0cqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YiMopVSDLTGv18lcZ0qsrwgEM2AhIo+f9LCMfCpVjfz5h2+nk2DdXEQ+UgmMbvMfG
         peEUW83PqahM6UENMWNvzHOaS5l0nfWE89icaSzgGClY3jlIpgEs5OePChaeWpEuU9
         IJgjerCSnHAjlNzaOgqZR+6PJ8EoLIGsVgEiQkeo=
In-Reply-To: <CAPnjgZ1NX2Q884T_LNUOLJT8=RKZXEj2z7uxzQF4MrHiKObZvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Simon,

On Montag, 24. J=E4nner 2022 18:57:45 CET Simon Glass wrote:
> Hi Luca,
>=20
> On Sat, 22 Jan 2022 at 03:36, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > Hi Simon,
> >=20
> > On Dienstag, 28. Dezember 2021 09:34:57 CET Simon Glass wrote:
> > > Hi Luca,
> > >=20
> > > On Sat, 25 Dec 2021 at 06:26, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > Add a new method that doesn't throw an exception when a property is=
n't
> > > > found but returns None instead.
> > > >=20
> > > > Also add a test for the new method.
> > >=20
> > > You can use
> > >=20
> > > getprop(node, prop, quiet=3DQUIET_NOTFOUND)
> >=20
> > This returns -1 when not found which I found quite un-pythonic (not that
> > pylibfdt is currently super pythonic ;) ).
> > Having None returned if not found is much nicer to use and much more cl=
ear
> > to use
> >=20
> >     if foobar is None:
> >  instead of having to use
> > =20
> >     if foobar =3D=3D -QUIET_NOTFOUND:
> > Are there any changes I can do for you to reconsider your position on t=
his
> > patch?
>=20
> I think I was put off by the mention of an exception in the commit
> message. Really all you are doing is trying to make this function more
> pythonic. I suppose we could change the getprop() function to return
> None if there is no property (with QUIET_NOTFOUND supplied for the
> 'quiet' argument). That makes not-found special, but I suppose if the
> error were anything else, e.g. -FDT_ERR_BADSTRUCTURE and
> quiet=3D[BADSTRUCTURE] were passed, we could return None in that case
> too?
>=20
> I agree it is more pythonic.

The "proper" way (in my opinion) would be to return the property or None,=20
except for more serious errors like the BADSTRUCTURE one that just throws a=
n=20
exception; and hide all the C integer return values inside the wrapper.
And instead of passing quiet=3D[BADSTRUCTURE] you would do

try:
    myprop =3D fdt.getprop(foobar)
except FdtBadStructureError:
    foobar()

I understand it's probably not a good idea to change the existing function =
too=20
much given current users where scripts depend on this behavior but this way=
=20
it's definitely more approachable to an average Python user.

Regards
Luca

>=20
> David, what do you think?
>=20
> Failing that I'm OK with this function, but with the commit message
> updated to not mention exceptions, as we already have that mechanism,
> so it is confusing.
>=20
> BTW you can use QUIET_NOTFOUND instead of [FDT_ERR_NOTFOUND]
>=20
> Regards,
> Simon




