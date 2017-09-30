From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: build errors with swig
Date: Sat, 30 Sep 2017 11:10:44 +1000
Message-ID: <20170930011044.GA3251@umbus.fritz.box>
References: <CAODfWeERM-HwcdmsZi+Afo2i5M54rnQk8vRJ_3nOSsC5H0qhYw@mail.gmail.com>
 <20170929003436.GA7712@umbus.fritz.box>
 <CAODfWeHyJpGw_GxqA6F=w4Fc=1if9-HabUXmSNcbBRKcrk74Sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1506738286;
        bh=sVFF2VXWK73JNVEtgZEPb0kIinVl1RvQfL+0dcEQIDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iTlaUaArfTwFfmHTfODOHx2fMxe65B+bKc2wJU8t4XKDHxiyvoMIFCznPae3FJ33e
         hWjxArP4RkTnYy2GfiXlKB/6lxa0qQmoV2vfnONoiCSY68i1NVN1ECHXDDSomV4PI9
         D8sui1g6GcfEArnv++TZye08X0NHWrAeRpS/4lGU=
Content-Disposition: inline
In-Reply-To: <CAODfWeHyJpGw_GxqA6F=w4Fc=1if9-HabUXmSNcbBRKcrk74Sg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?H=E9ctor_Or=F3n_Mart=EDnez?= <hector.oron-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 10:32:58AM +0200, H=E9ctor Or=F3n Mart=EDnez wrote:
> Hello,
>=20
> 2017-09-29 2:34 GMT+02:00 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>:
> > On Fri, Sep 29, 2017 at 12:28:19AM +0200, H=E9ctor Or=F3n Mart=EDnez wr=
ote:
>=20
> > Hrm, I haven't seen errors like that.  What swig and compiler version
> > do you have?
>=20
> GCC 7.2.0
> Swig 3.0.12

Oh :/.  I have very similar versions here:

swig-3.0.12-7.fc26.x86_64
gcc-7.2.1-2.fc26.x86_64

So, I'm a bit at a loss as to why youre seeing this.  Just to be sure,
maybe "git ls-files -o | xargs rm" then make to ensure you're building
=66rom a completely clean starting point?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnO7xIACgkQbDjKyiDZ
s5KlHhAA0Ty8/9sbA+SAfgQiEaTcwMkx//fFOAYPJw7kmn6UtmjG+zbyXC8MgXl8
TXgI+sH36R4eNe+WwPJNBq3S5R7UGO1r+HuIYH42WzBkNl2LRlLpoErglIeijIkw
S9zKKseA/wroskaADeZS92gL8EbvL0R58v/gTqWNSXVD56C+Uduan1V9Bd9eMr+9
XW/GwpSOvz6tON75jpBKVHFodTtnia/uLCt4zwqIR+8a5uIS5dGeu4gzp2GjYWF6
SYmyYTRxWw2+iJZw5wT3vY0JDyt20OwLFPiNrXb9M48VLehJw3k8EB5wucQoTYXp
fm3CqHiZHFKlTUy4G9Fms5+435/2BQkSYGbtFDvBFx/6Ec6uZN9gfZDMplGi0jXd
1St4d/uTvzOuKN+VOYIWgggdYHr2Wc1FG6kMKCakvyjYtDFQ8MGi3YMdUixdgtI+
HHIZMnNTSenn2KiqNhTPasXdmnVFcQ1UA2Q8tnK+zXZSSDcqRKK1GlAdQ4Q7qYWN
bsyomD672aihElAylf6RSCRcihVp2J1g8a31/lMFRw+vVJUZKD8O0FDEDzbCKckg
G5RdJL4Ak3BbVXvihf31I/bKXxXwcDDLeK+wBFjd2JIVi9hleiQB/AfJjF92HIdC
M/vMiPmGgKiCPbX5gFwgncwk4i3yz8oewJYYldrnzWKESu242EA=
=nxc0
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
