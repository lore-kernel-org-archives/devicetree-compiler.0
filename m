From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fix libfdt_env.h for RHEL7
Date: Wed, 8 Mar 2017 12:44:00 +1100
Message-ID: <20170308014400.GE19967@umbus.fritz.box>
References: <1488558597-21364-1-git-send-email-pbonzini@redhat.com>
 <20170306122557.71669b69@umbus.fritz.box>
 <88992ad1-f92f-7006-3b78-6b2e631f4110@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qz2CZ664xQdCRdPu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1488938152;
        bh=3OuEFJei43y8dEOANmvZPvC0J/jUuTET9n4UQlg/yMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PHZeesFqHW+A/HWLxP0o50R/Qgcwnt/l9dZsJ9jO3FCLJGVAKpr9JZm/y1D6wCmcr
         jA97i0eRVcuNmUagEIhPytHI1nnqrjQOwAZ+4RGKAEtlS290yLdylqof3PsFg+4CrI
         QM7kxt05efuFMuPjR25DdHWMfAYtvwOJLZNOZGw8=
Content-Disposition: inline
In-Reply-To: <88992ad1-f92f-7006-3b78-6b2e631f4110-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Gibson <dgibson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Qz2CZ664xQdCRdPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 01:52:54PM +0100, Paolo Bonzini wrote:
>=20
>=20
> On 06/03/2017 02:25, David Gibson wrote:
> > I'm not sure which your primary concern is:
> >=20
> > 1) For the RHEL release itself.  I don't think updating the qemu module
> > is terribly relevant for this, since we build against the packaged
> > libfdt rather than the qemu submodule.  We could ask Mirek to pull the
> > define fix into the downstream libfdt package.
> >=20
> > 2) For building upstream qemu on RHEL, using the submodule.  I don't
> > have a good answer for this one.
>=20
> Yes, it is for the submodule.  Because QEMU now requires 1.4.2, the
> submodule is needed to compile QEMU on past RHEL releases.  Maybe we can
> "#undef __bitwise" or something like that.

Hm.  I wonder why I haven't hit that with my own recent builds.  I
guess they were on Power, maybe the problematic symbol is only on the
x86 libc.

The problem should go away in not too long - Mirek is packaging dtc
1.4.3 for RHEL.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qz2CZ664xQdCRdPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYv2HdAAoJEGw4ysog2bOSOBYP/RD5nbvll/ilxOA0/WfgpH9b
vBG9amlUrwqces9j8JqX11Q/28UWZHilY953C6v5ghM+5Lvpme7LHWLgXfYXb1xv
mNcMPt58cjlFFHPBOkCwIsiNoGRsGLCJlrNPCjFVh/aCwrJ7T22V0coZJK/tTKJ+
8cBMlbq8pLxY8NYIB2lEm70vGgzIg/EP1nZxHJM5myiSvTg3IcFqSHQfV1Ao5Q9e
rRbOUAUZtI80e8FVM8j9cLgRsLUY/hGUk+ezzcKk88ykiaRtiVo7V20gEkjkpkf9
rjcNBbPEGi2H0PNqeU0a/9I8hnbIhdGyT8fN+t+OnCfxhxBGcNrn8+U/aPPHzaRl
k1eYNpmIhOWDkNiIercYuY7m/rYxU1U281wELk8bIsALzD7Y+bRNDPyEkPQALiIF
GntVAWIuaHYdxahe0ePdzANCA96z9RS2AL5tJpnEr6CJxBiGsC7LOM3gban/Wozo
BJ/X1P3CKmzaDAaK3RkSiLA5f9UmSFlHsCUPX504+kQPFUblGkCSt8iwJQmkQpzD
yRwV0ecs81fLSAad7RyjfJo5gkHFm0gaqAa7XXaxppd5DHLveIIgQEasP6I4tKmZ
+iEjrUu2j+PwzJ9AUnHELjBCIZFa5JwnR4SQbM8WNSZLsw7JZ3MyeaYyklqq7/ed
QiZyo6zZCRwzzCY3Kyg9
=UBSE
-----END PGP SIGNATURE-----

--Qz2CZ664xQdCRdPu--
