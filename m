From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Date: Wed, 22 Jan 2020 12:28:51 +1100
Message-ID: <20200122012851.GD2347@umbus.fritz.box>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200119063916.GD54439@umbus>
 <9c4e873ef998a5800a4cac673b7e925fc90e3293.camel@freebsd.org>
 <20200121020525.GL54439@umbus>
 <52f4b34454ab41151113c4ba5e4011d8b992e21f.camel@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579658286;
        bh=Dcug6vNDfM03K+1O5AYnsh6NlDDbyhOfhbNyIKSxFSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d+xBtS3v+ig+ZZFkRu6gJ4B20iYPCK2zJZwt+gx3euWn9JQBxGrUQDZdkQ6ieaTXd
         ftP9hnjg/CQBMs4l2mkrbCVWSjAYn+1z0cLJmT24mFWDg5llgYAXL+H4Z7SufzsYdp
         msC8VbDJS6CB2Hh+P3AFUOSZ14qeVIHQFYXFPhJ4=
Content-Disposition: inline
In-Reply-To: <52f4b34454ab41151113c4ba5e4011d8b992e21f.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 08:37:34AM -0700, Ian Lepore wrote:
> On Tue, 2020-01-21 at 13:05 +1100, David Gibson wrote:
> > > Given that dts files are run through the C preprocessor before being
> > > fed to dtc, the build script could use the '-include' flag to force-
> > > include a fragment containing generated build info without any need to
> > > modify existing dts files.
> >=20
> > Uh... maybe.  -include will essentially prepend the forced file, which
> > is a bit awkward for our purposes.  It means that the prepended file
> > would need the /dts-v1/ tag, and we couldn't have it in the main files
> > which would be a bit confusing.  I think it would also cause problems
> > with any /memreserve/ tags and means that the main tree could in
> > theory overwrite the build information which we don't necessarily
> > want.
>=20
> Oh.  I thought I had seen a proposal or patch fly by here recently that
> allowed multiple /dts-v1/ tags without any warnings, specifically to
> wish away any problems with what order things might get included.  If
> that was just some kind of fever-dream, then I guess: nevermind. :)

Multiple /dts-v1/ tags are allowed, but they all have to be at the top
of the logical file (once includes are resolved) before anything
else.  That wouldn't be the case here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4npVAACgkQbDjKyiDZ
s5LN4xAAvkwTd3C9nAaE8EAnnXcwWhFQ/WZjx99x+L+ayjvqDuPdhSlkiTfrcWfH
gomqOMvUlcCqUSzk3/bgxaeFpfUCA79DhuXj8uG8AfL/qOcuD9mVpbKO2KPkb3e6
pFKhVh1SZ5Tw3k/q6odUG6GCTvp9YZ1ZFJF6UfJlnyN17QeaJTVoI8GJtvJX9RNE
TNdPwuto2dmEcfKQv870Uq4rUlZkBCSQdys/GRccckO1qv6jv7fmutfsCUUE+mlp
i62o8iDG3XcQpdhUQSPO+bfVEkdzB9vW9dUR8McbC+7UPFijr5OGFqgYa6EoFAVm
7R9xI5mZjkwB7BYItxnjxuo5ZhqEm6AqbnKsadF4xi2j+4eGBNT5hsSSaxWB6koP
SlgDUad+MxW8JemjRIp5Hc15kywnOwGQMlPfrmrCeyXWLM6O9w8yJ9GrvG/FngNd
9FazNxLe0KQbsA+bHix8hI1lDWylxdqk0HBwoLxgZMP7g9RZUElGImwX+4qXAqEK
y+iFyYGqmiYfS9qIUAQkXAulLdP7w5mFQsxdjRk2423eQdifZbo40D4jNuRvBi/9
/txHqhnkS/IUrk8UnRsAjbhfCBmWRiuTRyUyGSUnWhbcxdZxy7NTeHBgp4jNc0nY
Yil/xmUVCbgrkTwF9OkQ3KFgSAMltaLTBnqbycJANpGOE4vhRvY=
=kbfA
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
