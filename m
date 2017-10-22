From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Sun, 22 Oct 2017 16:33:15 +1100
Message-ID: <20171022053315.GA15297@umbus>
References: <20171020175548.2566-1-programmingkidx@gmail.com>
 <f9bd98f1-d45c-6d3a-c35c-c67da67c881f@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1508659564;
        bh=Rna66ld9tPjV3gF/0pmTMazOcOGvVve7l6KxzeEYrKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wa0g45x2zm3xKWBaktgpzfIwQu2NOUNbXpKtmDyWUVWTK6kc/BPDAfF0XZxbeneUx
         cfmIfz2s8jKe6goP/ipBPImUcbFTm1k8zfwyVvpRH4Jn63XFgHG2aMfCIyxhg8xLq4
         7Gy81nycDtCJhWE0WfKoPoKm0+cigBI2zd5swrpI=
Content-Disposition: inline
In-Reply-To: <f9bd98f1-d45c-6d3a-c35c-c67da67c881f-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2017 at 04:44:58PM -0700, Richard Henderson wrote:
> On 10/20/2017 10:55 AM, John Arbuckle wrote:
> > +static inline size_t strnlen(const char *string, size_t max_count)
> > +{
> > +    size_t count;
> > +    for (count =3D 0; count < max_count; count++) {
> > +        if (string[count] =3D=3D '\0') {
> > +            break;
> > +        }
> > +    }
> > +    return count;
>=20
> Not to nitpick, but
>=20
>   const char *p =3D memchr(string, 0, max_count);
>   return p ? max_count : p - string;

Richard's right, that's definitely a better implementation.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnsLZYACgkQbDjKyiDZ
s5K9kBAAop+caHzn2iij3iA9mNQV52uY2KdWbKW1+s9SL874WYAQFasuB0lkoAwI
yLvnYg+XMoFIjC8G+++Q7kJhbt3a01XdbDH/+/ZfVBHGe52HshLjd1VTISGwp7Cf
wVolYbIFW83EIwU1OTXZynmfbFC8Rrb1lsgrHah93GHCLnFnk4814BaPdd0rVnee
sjOMykWnHGfcgVi8TuoAfoBKl771AOWo4sbq8j+bqWSz8/sThTIceTbSFux6NNTD
ImzHLKiYqBAVKrH+4Ix6USrEn6Ka/bmatVGcAKOtJ/qMBelLvK7kFLg2YIJfSUNI
mfsh+ii398lHuethEtnERyeiVE6suXnPYTUgS9u97Xe67VeuE2B0IHscWcNMuist
f1wpBmVduLVyC4r28d+zxlaiUg82l62hJ8etZ/3yCDZF8EFYQTvym8sgiq8RgoPb
rYj4qVtP34OqRgPWO0oGV6WKGFY2kGthgnse532FGJj5dxMGRcFGEdmE2BPuC9zQ
rKJVZQCuU4fHajj8lm03zyh2mEPplYgd7sTmJM2ZKM7Z5Y8LuqKcrUkW4RSKSrD2
rM6epXgtnOTsiYuGUFSbNkCsz3/DV7SCBJktyMG7OpHpaL4kX8H33LpGriLY36lM
K57u1rzy1OH1rYXtU9wp/IpXm6l/uU8Bll11nKP3kHLSLJv9KUk=
=CIw8
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
