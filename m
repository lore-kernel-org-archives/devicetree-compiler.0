From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/6] libfdt: Sync to upstream
Date: Thu, 6 Oct 2016 15:53:26 +0200
Message-ID: <20161006135326.GC4684@lukather>
References: <1475452771-16230-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475452771-16230-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Nikita Kiryanov <nikita-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Andrej Rosano <andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>, Minkyu Kang <mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Przemyslaw Marczak <p.marczak-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Sun, Oct 02, 2016 at 05:59:24PM -0600, Simon Glass wrote:
> In a few cases the upstream versions of functions first written for U-Boot
> have landed in a slightly different form.
>=20
> This includes a few patches to fix these as well as various minor changes=
 to
> reduce the delta.

Thanks a lot for working on this.

The overlay code just got merged, and it has a significant amount of
fixes, so it might be nice to do that sync with the latest dtc HEAD.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX9ldWAAoJEBx+YmzsjxAgm48P/i0Wtsw1nusrXeqqvm6HsXnG
iGcLeVSmSco7VWWnruNsyaZ59L8iQT1NsFD7y+Vxb05H8Se2sDIVNRRY98lgwJDe
/Tnall1qcAHxNHPmFHTyKCNHZdbVGSWnXpk1dgAXIBLA3s51fia/cszW4Ll/e7C9
1j7HHB8nvG9Zhsc5P8qaQdYoBIlLQD3uB5foBT6ymksch9onZ3b+hgCSX7G3+C1z
uElA0N7oM472kuBuXr9AMJrBX1/plZnyk/+gwXXcLmEUZ1YoTmtg70kC2SHg8yDT
aT6ehYS9RadyUeRprzZ4z0X2tLqNR/xliOteNWMEAxW6NpTROSbgP/buD2jcKIph
QAC/LnpF3u9Odly13b/zZX8xKi1lwYfh7BiKHBovdnO+XVIpj8RGyoDpp3Ko7lnl
DNbnk3q2kau6Ldu3fRp1xHqfWCVJsQAUMMjea8Z9y8VEPQrfeEOGsAVz/xa7i8h3
ODJSJOWdsMDd2vpTJW6rWhg8+PgjNe91vwWhmH2epjIEWK/7h+31neHcb+S5wFgn
mh9bn8s9xDyHbdoTLj0l6ug+evUo3+DmVSgGm8oOlNcMghw2zFJNrM39aBE3ONuD
M1Eim28CaKcItjmeD+3le8/zncVFqnXLSz+vY0RmSCNcxspuuT3jb26oa81ya/8w
SLVk3A8LbPLgSndmAZcz
=odEx
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
