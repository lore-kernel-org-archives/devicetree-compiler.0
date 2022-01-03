From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] Revert "libfdt: Add static lib to meson build"
Date: Tue, 4 Jan 2022 10:47:48 +1100
Message-ID: <YdOLJEVoJRAx5Ojg@yekko>
References: <20220103073855.1468799-1-marcandre.lureau@redhat.com>
 <20220103073855.1468799-2-marcandre.lureau@redhat.com>
 <CAPnjgZ2+SdumGaCp7TTvJ-WtC4=VdH6mbvAL+q6Hx3oRoCtjEw@mail.gmail.com>
 <CAMxuvazDvsbMekArEngSECHrE0EzzLccZtPVUj44SZ0s-=NwqA@mail.gmail.com>
 <CAPnjgZ1tK09j8b+kAyZKLjnB9fNY=3yP4e=CeSyPTJmfauLbkg@mail.gmail.com>
 <CAMxuvayq16QG29M7zyOd_bYVH+=Xyu8D-XTyrxuFSVYF+ipXbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/JMoUOj/mI+Ts6Gg"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1641263288;
        bh=pL8dym0i7+PRSJ6xgsSxcJb8uU5mPjz7Qo51nwSzWtU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I1+ZDb7KS7E+O0VeBmPf0713K2nrEBGeMOTvXLoiHHhNJfZOmfxja/YMGB2gAcHPb
         CshFSf/02GLeFgRHHE2Mv+yUS/ZL1qrp9kpOmRv59jyiMJi7GC8Q+TNiRVzl0xI3BK
         7QmxcOVolyVujLk29IcAICEVMQOr8z6q0smJNEWs=
Content-Disposition: inline
In-Reply-To: <CAMxuvayq16QG29M7zyOd_bYVH+=Xyu8D-XTyrxuFSVYF+ipXbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--/JMoUOj/mI+Ts6Gg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 03, 2022 at 02:22:32PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi Simon
>=20
> On Mon, Jan 3, 2022 at 2:18 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi Marc-Andr=E9,
> >
> > On Mon, 3 Jan 2022 at 03:04, Marc-Andr=E9 Lureau
> > <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > >
> > > Hi Simon
> > >
> > > On Mon, Jan 3, 2022 at 1:59 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > >
> > > > Hi Marc-Andr=E9,
> > > >
> > > > On Mon, 3 Jan 2022 at 00:39, <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > > >
> > > > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > You can build the static library by running meson configure
> > > > > -Ddefault_library=3Dboth or static.
> > > > >
> > > > > This reverts commit 5216f3f1bbb70aef463b6cd78dbbb0f4c4c71606.
> > > >
> > > > What is the reason for the revert?
> > >
> > > Did you miss the comment above?
> >
> > I think you alluded to it but it is good to be explicit as to the motiv=
ation.
> >
> > >
> > > There is no need to have a static_library() to build a static library.
> > > library() handles both kinds, you just have to specify with the
> > > -Ddefault_library option what you want.
> >
> > But don't we want the standard build to produce both static and
> > dynamic libraries?
>=20
> If we wanted that (this is not the most common option these days), the
> recommended way is to set project() default_options.

Hmm.. the existing make behaviour is to build both libraries by
default, so I'd prefer to keep that with meson unless there's a
compelling reason not to.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/JMoUOj/mI+Ts6Gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHTiyEACgkQbDjKyiDZ
s5LTjxAA4KxA61qWtghwCqCduZJ2bj7gunGco3MtbmrEmOmTyV2O0N3PQLOgXtNQ
VsvjwOH8rN6qzwp6y96bqtdqZdDaV4Xm+Sd4tdvO47SoBcjjzPlOx88Hw0ptxLc2
UAqvvLF2BtSu1Yq+BBHJq07XGus672BjCE6OAM+OUV/VHgiUkx/4cdT3flPk6lHs
VQFqg3ZrYkcwNAug8Zap214x8jRwhDtpvQ//IKqkwYeMQofi+fTkaAicDUKdhRjx
qHzsv+B9b8YtOwn5d50luT5rwpiK14YXpGwSJmN1RgQaVTB1BjpRNPw1/HjsGBSB
htUcJZxL3xOlay10mqqTsUBLwfZ0jRFz2VZQFCjZ0jepIgiVXCiwZ5A5e5ByP01M
qPTqlCMoT93soMZjMBFWcLE9LuPbJhNyLLIn9v2WRrcMMVa0rMFKTfmxTmVN4bWp
+RRIpjUMvLvo3zLC0jcpALkh0W1XSqJf1/Z+uIx8XnSfhj1eQVIIvj5kychRdLE0
WHpUpgu20XWB+eC5WqvdphcEk+6Yp4gSb0NNSPXlYnJfJZ6j3/c4mUyCPqxNXYPE
GYjOwXufIA8PgyHiJLQI2o/4GUTVKW6VdLVllrBDsRIxqQ89xt+vBkoJbUj/rp79
L6Cs2BDUsU3dSvhkp6fYPoCY+vW6S07Mutp1CV+sr9M0zrf2GKM=
=X962
-----END PGP SIGNATURE-----

--/JMoUOj/mI+Ts6Gg--
