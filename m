Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584157;
	b=1zs//SsPYETJv26QklJNK9UhZcz+8LbePJ2KGGs1daO5GmoYudT8JyChM6zkUhSbJMax
	 Hnvzmn3Jd/sX2RZf6T80B5lT4fawBBMLi45C0zKeSMelwygFWuKJu8Xzc3QxCnTnSE1PK
	 gAvQXf338w+gCH9y+eCQERM0Rolq7P/7/n15/5XS80/Lj9VkwyYlBuuYtWDEHhPIA/5PI
	 1KO6vjEdjK1gIc9X+l/0CpvQHQox/lRYQoDnJRuqPw/guQG8tsoSL76cB9K2+ngh56y5x
	 y7ndTCcq3mTivaZcpEhuWXfICCUnrh2onIpt7VFtualx5W2am8dCmezm4yIV03YfGbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584157;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=18SqGK/PIQXaam5T+y8Kux6aYcZDlE1mP3zDFN7i6l8=;
	b=JgbXqsj5wg73Pwi7oQd+/wEkKghZ68Y6EXknWmL8ibvtZctMh7tF3LukdhkdnYyjqN6E
	 aa3keNTYb/ZZb2nRRqSKhZlqbqtT2KAdITMwRDrStTleCRcE5IjNBisuWZ6kpd7OoXS1+
	 NtemDeyGWkdn7YEJByDO9PhIsuXq3MiAsVVGU1/+uuE4Rce/2nwbHOsBtfshE0yK1VE9N
	 mS5aZmh2gBU3ZshlUd6sS5EyfnZ2uBlxJNWtjSByvkegiCqxdxzgYxx8FxqKTZws6T+mN
	 xrZt2k7LgopYUcjExJp3Xu6/tysEhU3RuxH8ulj2pfD4nTfvtWULWSd+91bk5Sy3l7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=MJLF3vp0;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23E606A327;
	Mon,  2 Nov 2026 01:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E23E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=MJLF3vp0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793584153;
	bh=18SqGK/PIQXaam5T+y8Kux6aYcZDlE1mP3zDFN7i6l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJLF3vp0vIACySlOMz9ZDVRXF7L1A6gX2FoLicBiDyk/4oUZb54QEA7ECmrTIFVD2
	 xMY9mhwafz9UE29JXIjqmSrkWixwFjzVbZmIyb2LE8+4Pdlhdy7EGFYcQ7JIPzlAYU
	 8VmWeNxva3gNJ9usy/XboMfpSUSNmB+rgUAl6ZBv3vaqqihTKLJAFWEWVtlbFDii+i
	 16ab+SqlRm/pwBfhAhMFX5HrckPNQjCXAj1nrecmXpRTMHbq7Zl2ARt+0q/qAw4uO7
	 L5RC2X2Agm6TqA3cm+pnIsfoOnEyI3l8kmiYGsaE8QuYsKyny1d50tv1eXA8wrTUk3
	 SI6AwK2dgTdMg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHvkx4tBRz4wC6; Mon, 02 Nov 2026 12:49:13 +1100 (AEDT)
Date: Mon, 2 Nov 2026 12:48:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: dianders@chromium.org, Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and
 get_mem_rsv_list()
Message-ID: <aufr7SA1BO7zDQws@gractus.seuss>
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-3-dianders@chromium.org>
 <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x6ApwphbQFNCmrOS"
Content-Disposition: inline
In-Reply-To: <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>

--x6ApwphbQFNCmrOS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 07:50:17AM -0500, Simon Glass wrote:
> Hi Doug,
>=20
> On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> > pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
> >
> > Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> > properties, and memory reservation entries without manual offset loops
> > or `-FDT_ERR_NOTFOUND` sentinel handling:
> >
> > - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
> >   of `nodeoffset`.
> > - `properties(nodeoffset)`: yields a `Property` object for each property
> >   of `nodeoffset`.
> > - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
> >   all entries in the memory reservation block.
> >
> > Assisted-by: Gemini:gemini-pro-prerelease
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> >  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++=
++++
> >  tests/pylibfdt_tests.py | 18 ++++++++++++++++++
> >  2 files changed, 63 insertions(+)
>=20
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -201,6 +201,23 @@ class FdtRo(object):
> > +        soff =3D self.first_subnode(nodeoffset, quiet=3DQUIET_NOTFOUND)
> > +        while soff >=3D 0:
> > +            yield soff
> > +            soff =3D self.next_subnode(soff, quiet=3DQUIET_NOTFOUND)
>=20
> Since Fdt inherits this generator, a caller can easily write 'for off
> in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
> offsets move under it.

Right.  I noticed that, but merged anyway, since you can basically do
the same thing with the existing interfaces.  By abstracting it
further, this interface does arguably make the problem worse.  This is
kind of a perennial problem with the Python bindings.  The libfdt
interface is shaped by what is and isn't possible with the flattened
format - the reason we insistently name "offsets" everywhere, rather
than just "nodes" or "properties" is an attempt to inculcate the right
mental model.  By abstracting things more, the Python bindings make it
easier to miss that.

[Aside: one of the many projects I'll probably never find time for is
 to write a Rust-native libfdt, where the ownership model could be
 harnessed to enforce many of the required invariants]

> Since David has applied this, please can you
> send a follow-up noting in the docstring (here and in properties())
> that the tree must not be modified while iterating, as with
> fdt_for_each_subnode() in C?

Right, adding a comment is probably a good idea.

> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > +        leaf =3D self.fdt.path_offset('/subnode@1/ss1')
> > +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
>=20
> The docstrings say both iterators raise FdtException for a bad offset,
> but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
> list(self.fdt.properties(-1)) raise, perhaps alongside
> testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
> same follow-up. Since these are generators, the exception only appears
> on the first next(), not when the method is called.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--x6ApwphbQFNCmrOS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrn6+0ACgkQzQJF27ox
2Gctew/+OiJ2e5xrfpdrmfiambPg91RD6NR/oOZLdGELob8d0s4Uo0KpXNGlqZXs
SjEddpJ0srIMlNlABTVawtwPC/L9fS3yATYKkTyudX9jA/Z2krP/hW6/qfdTaDIy
h9wyz4tDV06kZb2/ho9664QhSATXa7Lbex37kXcI27QqYN3FXjkDGonYKcynEbzI
KA8AwGPJvNDnepI0L9KgHDKVNNwL4lG70j9dg5IIaq1Y9TIkthgAZMLsl3mkPuwo
R318c8YnzpIMuiXRatjAZIbZi1zZSvHQP5MxZJ+bA+O5SFpBgzxluBTTBp70tTHF
7ODNxitnHFceBVPZb2AT07UG8yLaNGX6m1tHoRpjWyGM65FwRD1mTxZu48sMc+ws
jdcQCd2REAmMRXfHQvaZ7ZUYepdF5kqaC4vtRK5y+dDuXeS+dKS4TwO+ikXzzB7u
GUi1uYGsEmwWGw0lHfCc9YD8sDw4dktErUewHUnBhL+m6bxkpoehrGxHMus2ko7e
K4hnjfheJitfqecLXoh9FS8oRyJ/WLJZ5lkAdL2cYgu7pk/4Y0ACqfJqmkSEUL13
boJtEGC/TjZWJSjgv5JkV+fg6qSzu2vCDoBAGJ+c0RmhDQ8AEhIQ4soLDFSW6xRs
fm903uGYemqahkeS/2iD/ViyhQtRIm1fu8otQ6VyguoEaPJKpoU=
=H1eg
-----END PGP SIGNATURE-----

--x6ApwphbQFNCmrOS--
