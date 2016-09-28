From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Home Page of dtc is gone?
Date: Wed, 28 Sep 2016 11:29:55 +1000
Message-ID: <20160928012955.GC14447@umbus.fritz.box>
References: <1f25b3eb-efbb-561c-1eff-f3daebdaa80a@redhat.com>
 <20160927052513.GA5956@umbus.fritz.box>
 <57EAD19F.2060404@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1475029928;
        bh=yzfVnLftwacUQXSvDPauAN0rF+GrnD7iVHuoIOsGVBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qNipm1W6xV5dk7yJnCtiYnnERH7yWyjdcfDWJ2CiSRFc3mwtQhN06nI/cFxM7F7ZQ
         aNqPWhi4VB+xU/qBg650apTzfANbndKcmcU1f37g6NCJTRjtQbgNHACWf9vWxVnPml
         uJLuzu0q9uDs8BsfpvqXEjrFVe6uG2BD8hED2meY=
Content-Disposition: inline
In-Reply-To: <57EAD19F.2060404-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2016 at 01:07:59PM -0700, Frank Rowand wrote:
> On 09/26/16 22:25, David Gibson wrote:
> > On Mon, Sep 26, 2016 at 06:18:07PM +0200, Thomas Huth wrote:
> >>  Hi all,
> >>
> >> according to the README, the home page of dtc is:
> >>  http://devicetree.org/Device_Tree_Compiler
> >> However, when I open that URL in a browser, I only get a 404 error.
> >> Seems like the Wiki that used to be there is gone now and dtc needs a
> >> new home page?
> >=20
> > Ah.. I'm not really sure who looks after the devicetree.org pages
> > nowadays.  I think it used to be Grant Likely, but I'm not sure if
> > it's still him.
>=20
> The devicetree.org site has been re-purposed for the process of updating
> the device tree specification (previously known as ePAPR). The old
> contents of the root of devicetree.org has been relocated to
> elinux.org/Device_Tree_Usage
>=20
> The most recent version of the Device_Tree_Compiler page (according to
> https://web.archive.org/web/20160326052957/http://www.devicetree.org/Devi=
ce_Tree_Compiler)
> did not have much content. The contents of that page is:
>=20
>=20
>    Device Tree Compiler
>    Current revision (unreviewed)
>=20
>    The Device Tree Compiler (DTC) is the toolchain for building device tr=
ee source files (*.dts)
>    into the binary format (*.dtb).
>=20
>    libfdt is a BSD-licenses library for manipulating device tree files. S=
ince it is BSD licensed,
>    it may be freely incorporated into other software such as firmware and=
 operating system loaders.
>    libfdt can be found in the dtc git repository.
>=20
>    Source Code
>=20
>    Source for dtc and libfdt is maintained in a git repository on git.ker=
nel.org. You can find the
>    repository here:
>=20
>    https://git.kernel.org/cgit/utils/dtc/dtc.git
>=20
>    Or you can clone it with the following command:
>=20
>    git clone git://git.kernel.org/pub/scm/utils/dtc/dtc.git
>=20
>=20
> Most of that information is redundant for README, since README is already=
 in the dtc
> git repo. Maybe the best solution is to remove the link to devicetree.org=
 from
> README.

Yeah, that's probably the best idea in the short term.  Pushed.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6x0TAAoJEGw4ysog2bOSyWoP/A68ZirJonbq+WrYyYBZMOqj
07LKPjlUYIXNGFEG91sBVsRSx2x66jbM0CdiPnwwguRlyMxDWu4ZRRK+DQ5z55vW
mx5YnfF0TJavlEMw8fl1rlXvDcvaWJwT8+e8Xs4AsovN9DPbpYop+tGLVpEZRzlJ
nZ7gPoZBYTDx8TiWNRGgQdteLz5uSNazpLS+IzfNyLvtk8sbHFdkxk3CDnWEvy2R
JB4SZmGVFb/0v65H/B6us8Fn4nUkYcGPNZiy7+XKV+9wliXdyLXGJgObO+s73P5+
cEhCA3HRDKk4rQPSTVMJY9d37NiVGPcAEgYZI4Ylt6WCmFuW7AYE0Tpyl5mAfSKD
O4bJvFUNPfZbfZay21JGHvIbTMUQREyrZrs2MZ+tdGWPsIsYW7lLSGvQXXOKtHoL
5O2WRDQag90A49+FXW32kzQFrBLtmV070s+nbXGQi0da9kazYrItW2LnLFIhB+DP
81UMq7u1ayWOssxSBpHviRwMVX9HfUQIEnmbKXzI7iK+1Nra0PweoDFRHS3vf0F4
dgHeuyTJ9llx4GJPUbWbRjfHnFMNo1RITDR9bQ8E1O9oemzgzEFZWjAq9izQRbug
FfTq6Dy+hXDwMsFKvghzu/RCxCsbLlvI5ikxetDhy3Z6ABIOZVeeLL8QSeHw9l5g
YcjV4Ijz8togatP/C5Np
=ArD8
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
