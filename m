From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Fri, 19 Jan 2018 10:25:19 +1100
Message-ID: <20180118232519.GW30352@umbus.fritz.box>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20171231022858.10834-1-nwhitehorn@freebsd.org>
 <20180118045903.GL30352@umbus.fritz.box>
 <cfa9f549-b63b-3642-32ab-a2e21898d16e@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l8FkFPwqImiSFyXg"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516317925;
        bh=5qA+1XWbSfihZBbaltz7nUCw2AFEiW95bJsPsiP/ODw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pftRo40oY/i+GpXi6hFYXOIiQ3HNtZorEDSdwz39UZh98K3exEx1iW+5ZANpg9RQh
         /R+RsGfnLF5HF4LfD4ux13zrc22SFPEQdW9aptVkpJ80JNcom+UyisXKkOF/vHk+m3
         oKENYg6ZrPnt9SxlCasjbYZB5Pa4kdnlCPF6AmKU=
Content-Disposition: inline
In-Reply-To: <cfa9f549-b63b-3642-32ab-a2e21898d16e-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--l8FkFPwqImiSFyXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2018 at 12:41:28PM -0800, Nathan Whitehorn wrote:
>=20
>=20
> On 01/17/18 20:59, David Gibson wrote:
> > On Sat, Dec 30, 2017 at 06:28:58PM -0800, nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org wrote:
> > > From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> > >=20
> > > This can be useful in particular in the kernel when booting on systems
> > > with FDT-emitting firmware that is out of date.
> > Hrm, really, *really* out of date.  V2 and V3 are positively ancient.
>=20
> Yes, I was *really* disappointed to run into these things in the wild.
>=20
> >=20
> > > Releases of kexec-tools
> > > on ppc64 prior to the end of 2014 are notable examples of such.
> > Good grief, that's ridiculous.  They were also using dts-v0 years and
> > years after it should have been gotten rid of.
>=20
> Yes. And Red Hat at least is still shipping such versions of kexec-tools
> today...
>=20
> From a fully up-to-date supported RHEL6 system:
> nwhitehorn@gordita:~$ kexec -v
> kexec-tools 2.0.0 released 19th July 2008

*sigh*

> > Anyway that said, the changes below don't look too bad.  There's a few
> > nits, but in principle I'd be ok to apply
>=20
> OK, great. I'll plan to submit a revised diff later today or
> tomorrow.

Ok, thanks.

[snip]
> > > +	if (fdt_version(fdt) < 0x10 && nodeoffset !=3D 0) {
> > > +		/*
> > > +		 * For old FDT versions, match the naming conventions of V16:
> > > +		 * give only the leaf name (after all /) except for the
> > > +		 * root node, where we should still return / rather than ""
> > What's the rationale for returning "/" rather than "" on the root
> > node?  a V16 file will return "", typically.
>=20
> Are you sure?

Pretty sure, yeah..

> The immediate motivation was that parts of the FreeBSD kernel
> were breaking if it was "". Since those parts work fine with V16 trees, I
> did this. I will double-check what the exact problem is -- it might be on
> our side somehow.

[snip]
> > > @@ -324,12 +364,33 @@ const struct fdt_property *fdt_get_property(con=
st void *fdt,
> > >   const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
> > >   				const char *name, int namelen, int *lenp)
> > >   {
> > > -	const struct fdt_property *prop;
> > > +	const struct fdt_property *prop =3D NULL;
> > > +	int offset =3D nodeoffset;
> > > -	prop =3D fdt_get_property_namelen(fdt, nodeoffset, name, namelen, l=
enp);
> > Couldn't you use an fdt_get_property_namelen_() here instead of having
> > to duplicate most of its logic.
>=20
> You could. Since it is pretty short, adding another function did not seem=
 to
> be much shorter. Happy to do this if you prefer.

It's not so much the physical shortness, but the fact that getting the
property scan logic exactly right does have some edge cases you have
to be careful of, so I'd rather only have to do it in one place.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l8FkFPwqImiSFyXg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlphLNwACgkQbDjKyiDZ
s5LqfhAAgurXU/UGquHoW08Ado7b6pAqIZ82qNMp1CoNWDJIAvZu6NzY68CZRKmj
qj0Dn53HhhBlonS3ardOuYT+Q6lCjS8H0qz+43LROBVhomdsCG2ngu+5+5hpqqmI
3PeU7ns6T/flN4LQzpN1L7+CtG3z8z28vLJhIfUOj3PU8pjhQhStfv9xNTSIhms4
J2aOC5Rgrrqhfpu9LZekUZ3ygf32IPEnJQjsXY4gJtB0HZ+IWjMTkZHtjAjMToCU
TaVd3ZkhFcTkXJzIqkqf9Xd0Q4mjfRbKITsmrCZ33ynDmd3MLeRZekXJ4dTzr4gi
eUL84nV0ZGpSd660uinJISO14xslcpHd9qiYrKT53oR7n1it+uH0ksWfiQzf6Pd3
n8SHRzoG7RolR0LRjeG6K5d8FQ6E2a7a6sPDxSQDJTXsUhrf9MRa4oaUr8Rg+T0F
rvw/ul9IG/g/qUyF9+3ImBknwqhQsUdXz9X70pY+fayFIjxJYDmMAfaDJ0anylBu
Okixd0DfyUJBX6Z2hRr6gWbMNY/F2iQmuORBRmrFv1PSxlz3n/tVwNFcgS176G/W
FPj/AT3SWBEixu+pXUuL69psEM0QtIdMkbvIlbNrpJ+j/EDTCJK5pssIXsyqr80u
17wJ/YnB8fYY00kVSjW8Rx9HRPiD0Fw3Yj+hDEOOSxBYdHzCg04=
=R4bl
-----END PGP SIGNATURE-----

--l8FkFPwqImiSFyXg--
