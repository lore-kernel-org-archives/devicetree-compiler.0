From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] libfdt: overlay: Check the value of the right
 variable
Date: Thu, 9 Mar 2017 12:35:00 +1100
Message-ID: <20170309013500.GM19967@umbus.fritz.box>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org>
 <20170304132647.23286-2-nicolas.iooss_linux@m4x.org>
 <CAPnjgZ2Lon3e-NV-FH76QpXFP2tAcc=Ex48hG7OMQxbcjzBfig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mI5TpPl/qDRoXxBg"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1489028393;
        bh=MZ1eOso4FWHFJcmTekADqT/iPxhwIACcVIv+S7dzAtk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kKAdw78NhTGt5SdRBZdntWuGaKNL9h80Gg86qkMT/k4bsBdVHYsiVbO1dOFWv/7+U
         tyVuL4vHpjdgMo7HYoCeb/kAGgwbz7PDWMYYuiI7JYGLvTWxYO6PNhxOHk99KdBuCG
         GVpiwPygq/NuTHYfRrWkANtJQXFTwJC9H0icMoxQ=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2Lon3e-NV-FH76QpXFP2tAcc=Ex48hG7OMQxbcjzBfig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--mI5TpPl/qDRoXxBg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 02:01:44PM -0700, Simon Glass wrote:
> On 4 March 2017 at 06:26, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org> wro=
te:
> > overlay_update_local_node_references() saves the result of
> > fdt_subnode_offset() into variable tree_child but checks for variable
> > ret afterwards. As this does not make sense, check tree_child instead of
> > ret.
> >
> > This bug has been found by compiling with clang. The compiler reported
> > the following warning:
> >
> >     libfdt/fdt_overlay.c:275:7: error: variable 'ret' may be
> >     uninitialized when used here
> >           [-Werror,-Wconditional-uninitialized]
> >                     if (ret =3D=3D -FDT_ERR_NOTFOUND)
> >                         ^~~
> >     libfdt/fdt_overlay.c:210:9: note: initialize the variable 'ret' to
> >     silence this
> >           warning
> >             int ret;
> >                    ^
> >                     =3D 0
> >
> > Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
> > ---
> >  libfdt/fdt_overlay.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> This suggests we need a new test case.

True.  I've already merged this but adding a testcase as a followup
would be most appreciated.

>=20
> >
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index 56cb70ed4445..b2fb5d970ccc 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -272,7 +272,7 @@ static int overlay_update_local_node_references(voi=
d *fdto,
> >
> >                 tree_child =3D fdt_subnode_offset(fdto, tree_node,
> >                                                 fixup_child_name);
> > -               if (ret =3D=3D -FDT_ERR_NOTFOUND)
> > +               if (tree_child =3D=3D -FDT_ERR_NOTFOUND)
> >                         return -FDT_ERR_BADOVERLAY;
> >                 if (tree_child < 0)
> >                         return tree_child;
> >

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mI5TpPl/qDRoXxBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYwLFEAAoJEGw4ysog2bOSV/kQAJh4syxqX8E447g8FaLGwysR
DlKG/QsxRdFNR5a9KuE2vZLJYpRWx213lLtqubATjnpi6DEt4nAu9DXo2sudQMQO
XvkorxYaA5H4f1UeAOZ8WxuI+6hnU5c3hM+rqqeBeNdiJOV+9O6NSN3d7SChxQbo
VhQoE74tIdS5l84JaYoL7a/SlB+dz9QppQDLELb2xc3OYno266rBoVGrdM1mJFKX
DiVhqekeWlXfcTEpXgck8kVauV24f79wNZGshifQmItzGSv7VC9yG2gxJOOuuVvi
WJthj2/ofruH/WOmDYtNk2xQL9UIxtBOS7MNcdlx+Z5EzCuAJbAxXHTblaugoWqT
gyPUsCeMIGR3R+SS+b9iSA3LycuvqzsCAGUbhy5Q/MlNAGBT717/9DqRIjOhc8yJ
94yK+1KYkbEdLuckDufJYwa7mFKHyZixqMLIqBs1RNlGzH13dKSsiNmPOY0p4L8M
en0PtUCWjbKK6HZTGM6x519APYw7q+0wPd1kar7A7iTH3foCsTWDHmcmIQcU2Rq3
/nEgooMqV5KI7ZkbxY288qmOszwJuLTFpdNjHnX/emLEA2eabnScZrCgQjSMa740
G7458FTPizzWR1uCIJEN1QVcKr5b9vFPMqO2dBeUYCfW2kN8hjDXd8KmOAZQlsVH
8znmpOwYD+LqoZz6ermu
=iDOW
-----END PGP SIGNATURE-----

--mI5TpPl/qDRoXxBg--
