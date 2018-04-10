From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH 03/12] libfdt: Safer access to strings section
Date: Tue, 10 Apr 2018 18:36:06 -0400
Message-ID: <20180410223606.GT10996@bill-the-cat.ec.rr.com>
References: <20180325232523.13469-1-david@gibson.dropbear.id.au>
 <20180325232523.13469-4-david@gibson.dropbear.id.au>
 <CAPnjgZ299ffKgtojTGaV+2EigUAT8ediyCSWk2xoxr2sAjeyog@mail.gmail.com>
 <20180403150224.GD1984@umbus.fritz.box>
 <CAPnjgZ3vEkx6zJY9Sj5yQQphaZZbEXTVrAMjX95+WZNHZvheZQ@mail.gmail.com>
 <20180410052254.GK3361@umbus.fritz.box>
 <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6932931052194227095=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9eymhR+BS/TYlVk8Whwsfpl13tqkmFoaFhf/5hfO+xU=;
 b=dhI7dHSfFPAo+3bD0bDKmPwQ0TIZ4+vfm3YP713kV9u1EEKMacvG598zfkRafTnsOk
 61D6wxzQaNmDbIWeictgWHi4cKr+IKPEj2ZCMOw3XSPJ64qWxKIHR02UGjfk+pQImIcL
 +hnvZkb20FUbHHLMAO7NfCZ+LIZHTHLEWX2gg=
In-Reply-To: <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Simon Glass <sjg@chromium.org>, David Gibson <david@gibson.dropbear.id.au>
Cc: aik@ozlabs.ru, U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>


--===============6932931052194227095==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yPZwCHe6H+6rrYXo"
Content-Disposition: inline


--yPZwCHe6H+6rrYXo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 10:42:45AM -0400, Simon Glass wrote:
> +U-Boot, Tom, Masahiro
>=20
> Hi David,
>=20
> On 10 April 2018 at 01:22, David Gibson <david@gibson.dropbear.id.au> wro=
te:
> > On Wed, Apr 04, 2018 at 01:21:10AM +0800, Simon Glass wrote:
> >> Hi David,
> >>
> >> On 3 April 2018 at 23:02, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> >> >
> >> > On Fri, Mar 30, 2018 at 04:42:21PM +0800, Simon Glass wrote:
> >> > > Hi David,
> >> > >
> >> > > On 26 March 2018 at 07:25, David Gibson <david@gibson.dropbear.id.=
au> wrote:
> >> > > > fdt_string() is used to retrieve strings from a DT blob's string=
s section.
> >> > > > It's rarely used directly, but is widely used internally.
> >> > > >
> >> > > > However, it doesn't do any bounds checking, which means in the c=
ase of a
> >> > > > corrupted blob it could access bad memory, which libfdt is suppo=
sed to
> >> > > > avoid.
> >> > > >
> >> > > > This write a safe alternative to fdt_string, fdt_get_string().  =
It checks
> >> > > > both that the given offset is within the string section and that=
 the string
> >> > > > it points to is properly \0 terminated within the section.  It a=
lso returns
> >> > > > the string's length as a convenience (since it needs to determin=
e to do the
> >> > > > checks anyway).
> >> > > >
> >> > > > fdt_string() is rewritten in terms of fdt_get_string() for compa=
tibility.
> >> > > >
> >> > > > Most of the diff here is actually testing infrastructure.
> >> > > >
> >> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> >> > > > ---
> >> > > >  libfdt/fdt_ro.c          | 61 +++++++++++++++++++++++++++++++++=
++--
> >> > > >  libfdt/libfdt.h          | 18 ++++++++++-
> >> > > >  libfdt/version.lds       |  2 +-
> >> > > >  tests/.gitignore         |  1 +
> >> > > >  tests/Makefile.tests     |  2 +-
> >> > > >  tests/run_tests.sh       |  1 +
> >> > > >  tests/testdata.h         |  1 +
> >> > > >  tests/testutils.c        | 11 +++++--
> >> > > >  tests/trees.S            | 26 ++++++++++++++++
> >> > > >  tests/truncated_string.c | 79 +++++++++++++++++++++++++++++++++=
+++++++++++++++
> >> > > >  10 files changed, 193 insertions(+), 9 deletions(-)
> >> > > >  create mode 100644 tests/truncated_string.c
> >> > >
> >> > > Similar code-size quesiton here. It looks like a lot of checking c=
ode.
> >> > > Can we have an option to remove it?
> >> >
> >> > Again, I'm disinclined without a concrete example of a problem.  Fwiw
> >> > the code size change is +276 bytes on my setup.
> >>
> >> That might not sound like a lot, but the overhead of DT in U-Boot is
> >> about 3KB, so this adds nearly 10%.
> >
> > Hm.  And how much is it compared to the whole U-Boot blob?
> >
> >> The specific problem is that when U-Boot SPL gets too big boards don't
> >> boot. Because we take the upstream libfdt this will affect U-Boot.
> >>
> >> Do you have any thoughts on how we could avoid this size increase?
> >
> > So, again, I'm very disinclined to prioritize size over memory safety
> > without a *concrete* example.  i.e. "We hit this specific problem with
> > size on this specific board that we were really using" rather than
> > just "it might be a problem".

I'm either failing in my Google-fu or is there not an easy way to grab
the patches from patchwork/similar?  But, if you shoot me the series
off-list, I can tell you how much U-Boot targets grow here (we can use
the same script as the kernel to re-sync sources back in, so I can give
you a before/after).  But as Simon notes, we have a number of platforms
that need to use (parts of) libfdt and stick to ~30KiB or less in total,
sometimes including some memory for stack/etc and we've long been using
-ffunction-sections/etc (the latest round of trying to use LTO has me
thinking maybe we can see if that's a valid option finally, but that's
an aside). Thanks!

--=20
Tom

--yPZwCHe6H+6rrYXo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJazTxWAAoJEIf59jXTHXZSdrkP/1weHpBqHyGacnZiikz4GddY
4/hFtfzzQUNeJxbUv4nvjNw9k34qFRcKFT92HolzUvi7EkMOeOntB22/uV1sltNy
Ojvjb/BjQC0V2U6GPoYWdkgNOKsKj+9CjKb6d8cVAIVmIGVU7RnGGEXKlJtpCkXL
FJALmTHaoUlqFPia4nYlH74MCyEfA6/7qPYnUuA7PTARRUdam7skpPezuygzGA4v
SMh5FCIDnapXvCv7HdFdYiC3qvZySvNdmn3DS82mDAEltexzH+bxs/rhLVL+qExS
KjfiNHGiV/vtiboHho9d/WHYBVcPez3muR+YSqqMtBeoFN07JKZSIfyaBR/ga6Zh
mheVO9O9PZDsTTd0145nt2DGIrFktjgCZUNEDsXip4Ck6aUKf7Xd9gMi32J5m153
pnvJ+f/Qrrr6LvIbWDKTiENLr+xH6qycHQFpf1iCKpb/9NmjljyknYvnFQuNk4zS
jR7TVGIWxMomAaJDlI8HIdn1ETQOTEMJKkuK/c8SlWvKp0kJyWGRrN0labFzrfTB
ddzFnbEh3QE00Rrg8TTwaMrqeGmhYokl8k6BbJujyhWhmDIJDD1h2CkH8NZ+deQK
wPQ1UoZARdNxEroupnoCM3ls58xZ1JjgjVkt8i4TLmZCX9RR2rYQJ7e9Ia95Of1Q
i82Fdb6T8jPCmnoBjrdw
=+4O5
-----END PGP SIGNATURE-----

--yPZwCHe6H+6rrYXo--

--===============6932931052194227095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============6932931052194227095==--
