From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 0/3] dtc: checks for phandle with arg properties
Date: Fri, 22 Sep 2017 21:01:50 +1000
Message-ID: <20170922110150.GQ4998@umbus.fritz.box>
References: <20170901185303.24770-1-robh@kernel.org>
 <CAL_JsqLuO24jUO3D_9ROT+tOS6iQEyPGgT8tts7C3bwXPWwskg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b6Y3a1uK/7FdRsLm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1506079183;
        bh=H3tZv90jxqgp+V/RkAqaQx90VByTGJfhOTgPyV1zY9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XTII2hZr1xkAWdFYA4lvOObMBy7X1WwcnRzh5Fx+niVBLei64BnALwIog9RV2FGhC
         lgyy6NF/dEoQg4Hnjb/ANVtej7IHyikoSylc2jxEAPu7cuu7ffwKtgi9xZS/yT5h8q
         GJyzNXMCXNwYtR7CttkjHm3OC1+r185RM7fdUnl4=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLuO24jUO3D_9ROT+tOS6iQEyPGgT8tts7C3bwXPWwskg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--b6Y3a1uK/7FdRsLm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2017 at 05:13:42PM -0500, Rob Herring wrote:
> On Fri, Sep 1, 2017 at 1:53 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > David,
> >
> > Here's a new version of checks for phandle with arg style properties. T=
his
> > checks interrupt and gpio bindings and other common bindings which foll=
ow
> > the same phandle plus args pattern.
> >
> > This generates ~200 warnings building the ARM dts files in the kernel.
>=20
> Ping. Any further comments on this?

Sorry, I know I've neglected this.  I've been sick, and then flat out
with my day job.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--b6Y3a1uK/7FdRsLm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnE7Z4ACgkQbDjKyiDZ
s5I57A//QE+bvDq/9KZ/79+YJ1W5Xvpkfl362QhX9VaaivNEuSP6s6AC+dLx5DX4
aFltsPjpkYplsVHwHF0u6nqu05T7HqQojiT8SEQsDMggMvscI8WcEoMHaDrsG+s8
ZOZBASUB1PfmNvVT1rRu/cvVpFJsbE3IJ3OTiE3dcxN78WAXMWfjoOXNrpLUvDMV
nhwav+k7Hg+JI62nAe9c+0HWxE8A6ldq3ld3FUj9E0PLMAh9U8oBQeIQszb4uo85
KFL1HQHqjHtiIqQDJSND1vJrpOz6RmxOiiDP49kejR8ih17AaKPATHEwzVnRPVA7
QAmhv0ldXR7GTNCXPwR/oBkVAUhDctCvQK6lBAQzmUA/ugXDfvAFdZjCOx6RVSDu
9olFnsuw2FSYgHud6Ny6fFmndm3daACUo1IhSCm6mq6gfdiQ5GRNjnbYTXtS9SIj
fSeFchwy4r1Yjvp6GYz+fT+LTZqcBRtrAhZVFgT6NxPkmpsOmxvhpBPgnry5oQtb
YTcpFOWtFNFG4UDi+aL1M6P9EU6HQWPs1IM235QsFXDQ6mE42AkUxX7EcJYAGnHn
Oh24GYc6nU5O3vy4tCNf28hKu8etnXxolrXwmwJvFMV5o1rOwdeQjFngMN/q3nBn
D747WLvTfIdnnCaoi0ZjG6Fvm97QH/T4AbezrHwZaMxZslsiSLw=
=a4rI
-----END PGP SIGNATURE-----

--b6Y3a1uK/7FdRsLm--
