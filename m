From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] travis: install meson
Date: Thu, 10 Jun 2021 15:28:29 +1000
Message-ID: <YMGi/Tq3msdhBX0s@yekko>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
 <20201207130055.462734-5-marcandre.lureau@redhat.com>
 <YL7p/CdVrOit6oSP@yekko>
 <CAMxuvax=yjONOpay9+CvYvV88MKFu84W8w0SpiDyg3GuQaHA0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lallnEkbOhDiMNLv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623305765;
        bh=xlBGc8p/Ua6CmG03MWM52KL9xiJaJ++UWnfLXMF0kEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xsspu+zkoH4W5PvSCbR0uwsUHVHJYRz2DxNm8XPD/FnFfBd1iF1VKQtQsZZUhi0rh
         wJJxRWWUj3IxJjSv3NWOC/5Ez43/bShTeCU8xZagGiZ4IjkQ5vZCRJtC6po5H1GaqP
         /89cGWVlP4ryZDZ5LXLtXjkZn7I38BGrVWIPJwkk=
Content-Disposition: inline
In-Reply-To: <CAMxuvax=yjONOpay9+CvYvV88MKFu84W8w0SpiDyg3GuQaHA0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--lallnEkbOhDiMNLv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 01:20:03PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi David
>=20
> On Tue, Jun 8, 2021 at 7:54 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> wrote:
>=20
> > On Mon, Dec 07, 2020 at 05:00:54PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
> > wrote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > The next patch is going to switch the build-sys to meson.
> >
> > I'd prefer to also convert the Travis scripts to directly invoke meson
> > rather than going through the Makefile.
> >
>=20
> Ok, but then we don't need to cover the Makefile wrapping?

Ah, yeah, I guess we do.  And I was recently reminded that
travis-ci.org is shutting down.  I'm confused by the suggested
travis-ci.com move, so I'll probably just move to Gitlab's CI
instead.

So let's just leave it as is until then.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lallnEkbOhDiMNLv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDBovoACgkQbDjKyiDZ
s5JOOQ//UfSu7B2Ea3+v3pZhqm4JtCNtCOxvj+6BXedhvEzg2X6Y0TsIYtYQUipI
bmQiOBU60sMLr0xp8xT7g+zcZlgU/WmK9zxTFPyEK/BlSQ9Hlx9XZEGre6PJP+AT
xcWgj6t65U9O444YXVlAevF7jXH0zuDm0jYna1Mvp/Vy91XPlFhyd7LG6kJu5Z4O
5HFhBqFW4hdkSA6ZOuVvjp+jKr83ArwT17L/6XpXyNWedzxZwMy8WGsQKzZnnqy5
XvdVttUcR4t87apqkvea/aB6J1rS92HtlxMirpq9uVmDqqZ6r6q6eHAibj+VeVH/
/gwWMlFtpKjlwbXnqXHzFsJ+KceICTu7amHruAitGOANi2tfe2fXxgTrpSurG1Tg
d+kTTBx60VblSozMoH+EOGVRZEaGbeftHnY7X6HMwUE38tQ3My6Nu1KSvf3NdtvX
lS4KRhkFVqnbCC3HJYzVhErKCh2wXnkGXjBbuPtM8Oi4Eb5rQdg+LeuZ+49sB7Al
4JvGr8JXkRhsukVjXFhdPm2sdn82dT+RJ2lZ+077oHc05K5CskPf/H9az06Nll5T
aFNwDay0r/Q2RrT8NnBgOh3mYX7uqbd2+s2j6gnIS7ojq13FsHSsU+Vmem3XoPQv
0XIEgrdjgqDYdmjBvKNrOCNgBy7b+JYxnftYI6zn74MV4U7LTa0=
=LOHf
-----END PGP SIGNATURE-----

--lallnEkbOhDiMNLv--
