From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 08/12] libfdt: Add fdt_path_offset_namelen
Date: Sun, 26 Jun 2016 10:10:00 +0200
Message-ID: <20160626081000.GI4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-9-maxime.ripard@free-electrons.com>
 <CAPnjgZ1ErVW+kN_Jypaf88BUDfBPW9pScgbtqufeDpatPO5oHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0973671244=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ1ErVW+kN_Jypaf88BUDfBPW9pScgbtqufeDpatPO5oHg@mail.gmail.com>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Simon Glass <sjg@chromium.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alexander Kaplan <alex@nextthing.co>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>


--===============0973671244==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jQIvE3yXcK9X9HBh"
Content-Disposition: inline


--jQIvE3yXcK9X9HBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 25, 2016 at 08:53:53PM -0600, Simon Glass wrote:
> On 24 June 2016 at 08:27, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Add a namelen variant of fdt_path_offset to retrieve the node offset us=
ing
> > only a fixed number of characters.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  include/libfdt.h    | 16 +++++++++++++++-
> >  lib/libfdt/fdt_ro.c | 18 ++++++++++--------
> >  2 files changed, 25 insertions(+), 9 deletions(-)
>=20
> fdt_setprop_inplace

What do you mean?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jQIvE3yXcK9X9HBh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb43YAAoJEBx+YmzsjxAgltoP/0PnQOtnxGrUXu5p1JGQIomN
IVzyUkIkhTDEzMiJeoN/Cxm2IEKN7RTJbCB/Cz5XEMxP4tHvn5cLbxoxeHIYdnlu
6/YUMIjuqfAZNRe7JyO2C7Z4JHPqnQ8aMvwTySyNN/VcrvMUB8BUo8iXPcePQTbV
UTLFcv2Yr5j4Ls7SvWA+mpvpJsKo1Y/byv4AllfEEpuoQYxXpT489aDEdKAFj01O
4SFDOvgtIHBYCotS4m33ndl7x4bb33d+a84o1mwjYIDNJL0bLKJ+l62qJdmqvWMa
ikRwn+q0Hb8Jk4xOuhAMQ0fgp8Vs6fP1RtKBRj8FcD8cgWmgQ3Lo2OIPITkXO8s0
vIn7D1O6ZwaxCY6LkZ0IdrDrE2WHbs3GO34WxNBdyp931weCyfCMqBXMtKb8os4L
wZ7fZh6oLGrjjtD3F2ORNCjTOPy66IkRInkRRfA8vFU6lc7ySROaIKRDqiAfPOIo
ab/8GadfiYWxEXjmZ2JN0HsMfpxHGaebXk+JNRHILQVlZridxTPhEWJqrnAnnRA5
6ADpd/uq5Qnc1U4jWhjgPIo4z+Wwhw0L7pW/TG2UQ1MBFC8rQGnzOdGWeudWV++z
meDRuVsF+kpgONqZ2jJYWXLUf0FlJYpN9aYxnhqjFJnUVnjPBRhcZgrbzjtQb3ux
K85ZnC7eaRlYZSOxhA13
=1HoE
-----END PGP SIGNATURE-----

--jQIvE3yXcK9X9HBh--

--===============0973671244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0973671244==--
