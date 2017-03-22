From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 0/5] Introduce Python bindings for libfdt
Date: Wed, 22 Mar 2017 16:35:54 +1100
Message-ID: <20170322053554.GD19078@umbus.fritz.box>
References: <20170317221434.15390-1-sjg@chromium.org>
 <20170321053531.GA19078@umbus.fritz.box>
 <CAPnjgZ0WkRXRqQBx0W6QhMqROZtC=RTebdA0TBrEPidtxRV17A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1490163308;
        bh=zvFRZp8m6GOQD6EEhah1yr7qteBLqf+R3lQQtSY61Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dUh8dVxHkSI7Ws9gWFPyZI/nhNF2vyqZIlfH8th4MYH4p78vjd4IPaCJ7FH9hMHnr
         8s8M6+piC70fza5uqKztAlmcI0zqNG9oN39jGIuXFjJmAC4gZlagA1N7R/gQAUaru+
         m812FNU4BOrh34N0Wn7llcRVt/Gsal8DnpwD5Plk=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0WkRXRqQBx0W6QhMqROZtC=RTebdA0TBrEPidtxRV17A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 10:02:00AM -0600, Simon Glass wrote:
> Hi David,
>=20
> On 20 March 2017 at 23:35, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wro=
te:
> > On Fri, Mar 17, 2017 at 04:14:29PM -0600, Simon Glass wrote:
> >> At present libfdt consists of only a C implementation. Many scripts are
> >> written using Python so it useful to have Python bindings for libfdt.
> >> Apparently this has never been attempted before, or if so I cannot fin=
d a
> >> reference.
> >>
> >> This series starts the process of adding this support, with just a
> >> bare-bones set of methods.
> >>
> >> The v11 series provides binding that can be used like this:
> >>
> >>     fdt =3D libfdt.Fdt(open(fname).read())
> >>     node =3D fdt.path_offset('/subnode@1')
> >>     print fdt.get_prop(node, 'compatible')
> >>     subnode =3D fdt.first_subnode(node, quiet=3D[libfdt.NOTFOUND])
> >>     while subnode > 0:
> >>         print fdt.get_name(subnode)
> >>         subnode =3D fdt.next_subnode(subnode, quiet=3D[libfdt.NOTFOUND=
])
> >>
> >> This version includes a simple class for properties.
> >
> > Applied to master.  I made a small change in the last patch, so that
> > the error message when the python packages aren't installed is less
> > scary looking.
>=20
> Yes that is better, but note the 'pylibgfdt' typo.

Oops.  Fixed now.

> I suppose it is too soon for a new release tag?

Pretty much, yes.

> I'm also interested in your thoughts on where to take this next.
> Presumably we should support the rest of the functions in libfdt.

Yes, I think that's a good idea.  As suggested earlier, I think
getting to the point where you can do a complete Python
re-implementation of the tree1_tests would be a good interim goal, I
think.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY0g04AAoJEGw4ysog2bOSUcoQAK6qRsvbvXuXtwHdryqB4JCw
pYQ1RdNYf2y33ZbTgshzvMw4T8SsqOI7hsenv607G/IVWVk9345wTi26SGv1WhpA
NHCcTJ6kPUo0FUWvLlvITsYUcoeoQCaKSwZd/fKf4w/iLv7U3Xe/Cdxd3LxCn7mR
orJcS+t0KVYKKVmbJYPOsmuumrIMCp+j8IOfQ3a3PfCj9oZYJjXlUPzHrlVOODFg
OFYvUX1IPApQpECE0CIeIShpQatR4WdFksHZhbMMBZrfohl583mCZQlRECiV4vPJ
OHtPLDKDq6fjAzwVzgfL7UGgNTRn0+QFKXPoIUJqIC9o0XHeLRjTa6IkWRU+1r+B
Tr+YIbRrzEfYjtKHaw8RDl3QP9TYNftD8XiGRU1lhjKsA7pPesEl0fjXWELzaH93
zVRAnyMRSAacjNSgioz0jOFLccUOx8DlQ9bGFNiL8yGa84/06rcLyYW11DhKJDpM
Wz5lD2U7oqdpZUzD5V/IuMk2VWSEexdKI8jhqTcL7MOyRovddIKsiX1gEuVyvamZ
Ch+tsmMDt09Z6obg/0MBb7sjJtmsirEsZ1gRJ4LsCfwz5xm4t7GSe80LenzqTs9j
47JyI09TlsIBbIQgzSfUAaFLKRPknU2MtfQy1NQv3I2FAe736r/gcQ9QeNiLiGCz
wcxAPpdbqUc8mBsAfids
=jBhH
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
