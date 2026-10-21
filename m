Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549703;
	b=byIY4eascDFCaW4KjLxmJQ04B2fc+4BI0QzmO30dAU7bq7uQaNMsKBi3/fFdFBXQQ9rP
	 mfNVr4Jx1bpW1LTxEsBk3jOZkDO9UTw1Vsueer7u7Q8xL3KMyvmm2i9gGr02rgsyJa4Rf
	 k4xyBWw06v0QUmvHjKpvE7boUatSb9Z8qbtJyjsc2Ea2R8EriWX8MjJm9tr6kuBcn1tpL
	 g2Ut3aVCmDqyqXkGKQrYLuurgC4zxRtiuExU2IVf4bYFRaotUjMia/0X9BpRagqV+NvgI
	 pKw3Tmo74Pw+lco+m4nFn1rifgSRg71CnZeeRa+2qIUayg6zKLTxnSL3D/o9iGUtP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549703;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=JuBIwquPBjH9UwLI5hrgg+Gnwhl/uhFDEqddy4XggAI=;
	b=RsE7EIse8EnjKvEBDujSMTpdy8uLx9eC3ThIzNVNAin/IhbOoli1HeDBPC6kzdiGL0KV
	 M+yzatiZvN1Kno92EqSdqRASqoBBxueJrDkRA7/yecGfeKLaFTyqBzDE4zFUwthg+FF4P
	 dCB2fwtSvT5iv/i+OzqKhznXpQfWt4hI8yzf/UWNf4x9vxXK4UcOnQ+yznoDmzedoJC9L
	 AWu4z+z42/aOiNhy01ochqjz0VfHAJSJesvK2kD7jabNKm/6U2UZUXtuEWevz3ijjarRp
	 grY2nN57wrs8dniWRhTYepjrAoxGqjySQBRFPABGEc9ybkG5g+yx+PiLvn2mPsk8JnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gZyqGlfN;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6A5606A319;
	Wed, 21 Oct 2026 02:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6A5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gZyqGlfN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792549699;
	bh=JuBIwquPBjH9UwLI5hrgg+Gnwhl/uhFDEqddy4XggAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZyqGlfNZQYrg20AtrUe2v/iCaUvWfNrbQ2LzvRZqb7ih2DAXfQXrqTMxBtNeux/8
	 tdhI9+NEOpUHpTJMgSaD1FANdMh73pSYKnDn035FsL8fg54kBS84ljJ37nduyFKi5l
	 oo6+tZTEAM9jf58yvPqFSPyi+TbdnWXpQfTmkbJTYLKlFy+q1tMesHLBnw49RCpVjN
	 Lgod6wzqe914Rb/4btjgS+jOiU54xntJ/+YxZtdarcWrdmMzmxpqc4md/zmC+P/rRr
	 ehPsBnzOoSdwLaXgf0IIFM5lm7HEt2Zc2mN1taMWZHZgU9KmFy3HrZ0CIeFxF5zI7B
	 7RbIjlD0ypzyQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j8Y9b3mk4z4wCH; Wed, 21 Oct 2026 13:28:19 +1100 (AEDT)
Date: Wed, 21 Oct 2026 13:26:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <atgi4rMsw5W6kKkS@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-16-herve.codina@bootlin.com>
 <arDMhoNNXcPi81sR@gractus.seuss>
 <20260925152157.511dc65c@bootlin.com>
 <as3ZWBr3wRonkxXF@gractus.seuss>
 <20261013190347.4f1d9b9d@bootlin.com>
 <atGzdxETQZ9ovJFh@gractus.seuss>
 <20261019151121.26d99f30@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="lUZUhPJPDS1MELZu"
Content-Disposition: inline
In-Reply-To: <20261019151121.26d99f30@bootlin.com>

--lUZUhPJPDS1MELZu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 03:11:21PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Fri, 16 Oct 2026 16:18:03 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Oct 13, 2026 at 07:03:47PM +0200, Herve Codina wrote:
> > > Hi David, Rob,
> > >=20
> > > On Tue, 13 Oct 2026 18:10:39 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote: =20
> > > > > Hi David,
> > > > >=20
> > > > > On Mon, 21 Sep 2026 16:20:02 +1000
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >    =20
> > > > > > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:  =
 =20
> > > > > > > This v18 version will add support for
> > > > > > >   - Structured tags.
> > > > > > >     Those tags value definition will allow "old" libfdt, dtc =
and other
> > > > > > >     tools to skip unknown tags if encountered in future dtb v=
ersion.
> > > > > > >=20
> > > > > > >     libfdt, dtc and other tools implementing version v18 will=
 be able to
> > > > > > >     skip unknown tags available in dtbd generated with later =
version of
> > > > > > >     dtc.
> > > > > > >=20
> > > > > > >   - dt_flags header field.
> > > > > > >     For now this flag field is set to 0. It is a placeholder =
for future
> > > > > > >     dtb version and could be used to store some dtb related i=
nformation
> > > > > > >     such as the kind of dtb. For instance, the future addons =
format will
> > > > > > >     use this field to clearly identify that the dtb is an add=
on dtb.
> > > > > > >=20
> > > > > > >   - last_comp_version_w header field.
> > > > > > >     This field is similar to last_comp_version but for writin=
g.
> > > > > > >     It contains the lowest version of the devicetree data str=
ucture with
> > > > > > >     which the version used can safely perform modifications (=
taking into
> > > > > > >     account following rules related to unknown tags).
> > > > > > >     If this lowest version is greater than the last known sup=
ported
> > > > > > >     version, modification are simply forbidden and lead to a
> > > > > > >     FDT_ERR_BADVERSION error.
> > > > > > >=20
> > > > > > > For modification, when an unknown tag that can be skipped is =
involved
> > > > > > > and last_comp_version_w allows modifications, the following r=
ules
> > > > > > > apply:     =20
> > > > > >=20
> > > > > > "last_comp_version_w allows modifications" is a bit hard to
> > > > > > understand.  What exactly is the version number against which w=
e're
> > > > > > comparing that value?   =20
> > > > >=20
> > > > > We had one last_comp_version.
> > > > >=20
> > > > > Now we have two last_comp_version, one for reading and one for wr=
iting.
> > > > > We compare again the dtb version supported by our libfdt version.
> > > > >=20
> > > > > This comes from the discussion [1]
> > > > >=20
> > > > > [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdi=
ECtk49on8VfkP7CDvw@mail.gmail.com/   =20
> > > >=20
> > > > Ok, I now see that the logic is you simply fail to proceed with wri=
tes
> > > > if the library's latest understood version is < last_comp_version_w.
> > > >=20
> > > > As I said elsewhere, this approach doesn't particularly make sense =
to
> > > > me.  If lib_version >=3D last_comp_version you *can* write, even if=
 it
> > > > means stripping everything that's not understood at lib_version.
> > > >=20
> > > > So the real question here is how do we know, for any given structur=
ed
> > > > tag, what write operations require the version to be downgraded (wh=
ich
> > > > might in turn require this and/or other structured tags to be strip=
ped
> > > > entirely). =20
> > >=20
> > > The rules is well known. =20
> >=20
> > I really don't think they are.  You've proposed one set of rules (as
> > code) - although I don't think they quite make sense.  I've proposed
> > another.  Other variants are possible.
> >=20
> > > An old libfdt version will strip the tag and
> > > downgrade the version. If, when we define a new tags this rules canno=
t be
> > > follow by olf libfdt version, last_comp_version_w will be set to prot=
ect
> > > against modification.
> > >=20
> > > Maybe the problem is just downgrading the version.
> > >=20
> > > Instead of downgrading it could be better if we mark the dtb "one or =
more
> > > 'unknown' tags have been removed due to a write by an old libfdt vers=
ion" ?
> > >=20
> > > We have a dt_flags header field. We can dedicate one bit for this mar=
ker.
> > >=20
> > > Could it make sense ? =20
> >=20
> > I really dislike this idea.  It means we effectively have at least two
> > variants of every version which strikes me as pretty confusing.
> >=20
> > > > This is related to (though not the same as) the question of whether
> > > > introducing a new structured tags requires a bump to the dtb version
> > > > (though not to last_comp_version, of course).
> > > >=20
> > > > Here's the simplest model I can think of.  It's what I'd suggest,
> > > > unless one of it's limitations is a showstopper for what you have i=
n mind:
> > > >=20
> > > >  - version and last_comp_version retain their meanings.  No new hea=
der
> > > >    version.
> > > >  - New structured tags *do* require a new version.  If a dtb wants =
to
> > > >    include a specific tag, it must label itself with a version that
> > > >    defines that tag.  To enforce that:
> > > >     - For read operations, if we encounter a (known) tag that
> > > >       doesn't belong in the header version, we throw an error (eith=
er
> > > >       BADSTRUCTURE, or a new error for the purpose).
> > > >        - If version <=3D FDT_LAST_SUPPORTED_VERSION and we encounte=
r an
> > > >          unknown tag that also trips the error (since if it was
> > > > 	 defined in this version, we should know about it).
> > > >     - For write operations (including in-place), we always error if
> > > >       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()=
).
> > > >     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTE=
D_VERSION.
> > > >       It will strip all unknown structured tags from the entire tree
> > > >       and downgrade the version to FDT_LAST_SUPPORTED_VERSION.
> > > >=20
>=20
> Ok, my proposal seems to be a no-go and so I will follow your proposal gi=
ven
> above.

To be clear, I'm rejecting the original proposal because I think it's
internally inconsistent (if you follow the consequences of decisions
far enough).  I'm not necessarily opposed to something other than the
above, as long as the rules for when unknown tags must be invalidated
(and what that does to the version) are made very clear in the
structured tag spec.  e.g. see an alternative proposal below.

> Just to clarify, correct me if I am wrong.
>=20
> When read if we encountered a skippable unknown tag (this is possible if
> version > FDT_LAST_SUPPORTED_VERSION), we just skip the tag without any
> error.

Correct.  Btw, I know I suggested "skippable tag" as a term, but given
how that gets kind of misleading in the case of writes, I'm coming to
prefer the orignal "structured tag" term.

> For write, "we always error if version > FDT_LAST_SUPPORTED_VERSION".
> If fdt_open_into() has been called before the write operation, this will
> not happen. Indeed, we have downgraded the version to FDT_LAST_SUPPORTED_=
VERSION
> and removed all unknown skippable tags.

Correct.

> Also, during this downgrade process (downgrade version + remove skippable
> unknown tags), if a unknown tag that cannot be skipped is found, the down=
grade
> process fails an return an error.

Yes.  This kind of happens naturally: since non-skippable tags are no
longer structured tags in current thinking, we won't be able to
complete scanning the tree to strip tags if we encounter any
non-skippable unknown tags.

Essentially the theory of the proposal above is to be maximally
conservative: any write (adding, removing, changing, in-place,
whatever) will invalidate all unknown tags and downgrade the version.


But, here's an alternative proposal for invalidation/version semantics
that I think is consistent, while being a bit closer to your original
proposal.

1. version and last_comp_version retain their meanings.  No new header
   version.
2. If version >=3D 18 the tree may include any structured tags, even if
   they weren't defined as of v18.
3. Some future version might _require_ certain structured tags to be
   present.  But a client must only rely on those tags if the version
   indicates it can.
     - e.g. suppose FDT_FOO tag is introduced in v20.  A client
       reading a v19 tree _might_ see some FDT_FOO tags (because of
       (2)), but cannot rely on them being present in all the places
       they should be.
4. Any write to a property (including in place) invalidates all
   unknown tags on that property (they must be stripped)
5. Any write to a property invalidates all unknown tags on that
   property's node
6. Adding or deleting a property on a node invalidates all unknown tags
   on the node
7. Adding or deleting a subnode invalidates all unknown tags on the
   node
8. Whenever a tag is invalidated and stripped, the overall version
   must be downgraded (to let clients know they can't count on tags
   being present)

Points (4)-(7) are all somewhat negotiable.  In particular, I'm not
sure how feasible (6) is to implement.

Note that because writes don't invalidate tags on ancestor nodes
beyond one level, this proposal doesn't permit tags to contain summary
information about an entire subtree that could be invalidated by
writes further down in that tree.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--lUZUhPJPDS1MELZu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrYIuIACgkQzQJF27ox
2GcPWRAAmtwNzmo5KOuljAfXZAxccVRBwYtJqbv76fYzm7D+qRoO6uvcfIYV8jx8
dGiZ0msZP2Pttm2SD42yn2R4wynOt4FqyfmhTBFUj6Zl095qSBtb+ObdRT00dXB7
u5EBSiHdR30f+iw7NuPWrfTf8ZiZ6A1o/wmavXUw++4pXUskN07wub+qbpMMfyar
gLrZLZSI4syjBhHhNm6EGxTvJFMBRVvaji+vyoAOJXU7Jf00Am0fGFC0yG1ByXqS
nhsYsdAh4D7uWGIHAE0Jc65/EvlcwE2MiosHOaadShQlWodUyrRpBOgXjjT4uIGa
cdc6S5GO67/gASrN/HTYw9qqQECughrQbwFpSdi5XY/nRIAiNdJF8VTFDTJUSjwU
ezt77OWfvJepmXVG8rLDsKp2kYfmFg+LfGa0z0b0zP/ubVZojl16esU6ccpc1u32
HsBumCtuLPKeoIzxGT1lzYh2ZbHAgA+GQZtGP6Y69hpvVsZdAFxgwnZQqBBEk0vC
pkRpjjF/upbyWYgAAKLayr5LfDSkSoyOb+WT9BCLEonRepjXT+TBewqqN+SEc3j6
YaeU59ijKyd+QX+RJpUVi+TvUP0J4YSDNydCWnOJOZ4kWvchPBUVKyjIED7+h2cT
nH73MVjjg1iXuuSrggJLc1npkQjb0P4DjZDR/C9rRbVr87OBQG8=
=2RAx
-----END PGP SIGNATURE-----

--lUZUhPJPDS1MELZu--
