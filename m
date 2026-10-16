Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98F2346A18;
	Fri, 16 Oct 2026 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792127897; cv=none; b=sbmOSkBbhvwBGznPez5u/Bj2soSGoSiDqgZQ5xwFBzZtyou5pRNzE5XnBZr9azKOidwa+BA9mXLbmMGUchsO2ftCe0oo7Ttum0o9tBh7NZx5/yVTUnxvmvSQpruzq5YCYwsZ30agK6rVJmvohxXgcPUsMqPO2w/B/jYwW+HIw8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792127897; c=relaxed/simple;
	bh=IlssBYPh8uiBNSsc87OvPOO3ndxGL3L0wr7oLrphUuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIsygSSckeYxa9qJtucmXAjH75PsNWhk7XgfMsA73oHpGTFt71DwkTg7xxDVbwASfubnpA/DHmTzoBFDPlQ4TK4COQl3hjZEKoSaw5zjEtZ1HnD3KCga/38sZ8fLVpconPZcm9j3XdeKRlisMD79B6x/k578EK++bDZfkdIfHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=OGzR0/02; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="OGzR0/02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792127889;
	bh=W2oZB0hSbB4Bw3vzpSERNYS5I4yA830BtjJg5NP+xDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGzR0/02btColTPA4P6zWGizJkMvMpycQ8ct6XEWodaxSJLPx5hJjqy0YZPhAWjvm
	 zKWfOf2yu2dQ82kMZ2JAkDRPf/aQxLd3Kwm/nPUfwep74KOfFk2UIbN83aDTwpLN4e
	 apz30o/SGHw631qmMGndMKxzl2bgOxL677Nb/vHiNAlagenSr8kdGBx9lkjflScsnS
	 0786oXCIk3w8RdHyeYzqLA73RBUuPJjxv9INryKdnDkMEz257j5ngAjw/Zl1r+eV0K
	 +w5NFUzbRqaK+WMRgwjMyxtKbOOgVZPAlR/B1XZQffu5sfsG8fER5VOzWjPKKuWtDS
	 R5VKdT0DTCSQw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j5Y9s2Vkfz4wDx; Fri, 16 Oct 2026 16:18:09 +1100 (AEDT)
Date: Fri, 16 Oct 2026 16:18:03 +1100
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
Message-ID: <atGzdxETQZ9ovJFh@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-16-herve.codina@bootlin.com>
 <arDMhoNNXcPi81sR@gractus.seuss>
 <20260925152157.511dc65c@bootlin.com>
 <as3ZWBr3wRonkxXF@gractus.seuss>
 <20261013190347.4f1d9b9d@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r/nTOTF7zr3Ep2sX"
Content-Disposition: inline
In-Reply-To: <20261013190347.4f1d9b9d@bootlin.com>

--r/nTOTF7zr3Ep2sX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 07:03:47PM +0200, Herve Codina wrote:
> Hi David, Rob,
>=20
> On Tue, 13 Oct 2026 18:10:39 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Mon, 21 Sep 2026 16:20:02 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote: =20
> > > > > This v18 version will add support for
> > > > >   - Structured tags.
> > > > >     Those tags value definition will allow "old" libfdt, dtc and =
other
> > > > >     tools to skip unknown tags if encountered in future dtb versi=
on.
> > > > >=20
> > > > >     libfdt, dtc and other tools implementing version v18 will be =
able to
> > > > >     skip unknown tags available in dtbd generated with later vers=
ion of
> > > > >     dtc.
> > > > >=20
> > > > >   - dt_flags header field.
> > > > >     For now this flag field is set to 0. It is a placeholder for =
future
> > > > >     dtb version and could be used to store some dtb related infor=
mation
> > > > >     such as the kind of dtb. For instance, the future addons form=
at will
> > > > >     use this field to clearly identify that the dtb is an addon d=
tb.
> > > > >=20
> > > > >   - last_comp_version_w header field.
> > > > >     This field is similar to last_comp_version but for writing.
> > > > >     It contains the lowest version of the devicetree data structu=
re with
> > > > >     which the version used can safely perform modifications (taki=
ng into
> > > > >     account following rules related to unknown tags).
> > > > >     If this lowest version is greater than the last known support=
ed
> > > > >     version, modification are simply forbidden and lead to a
> > > > >     FDT_ERR_BADVERSION error.
> > > > >=20
> > > > > For modification, when an unknown tag that can be skipped is invo=
lved
> > > > > and last_comp_version_w allows modifications, the following rules
> > > > > apply:   =20
> > > >=20
> > > > "last_comp_version_w allows modifications" is a bit hard to
> > > > understand.  What exactly is the version number against which we're
> > > > comparing that value? =20
> > >=20
> > > We had one last_comp_version.
> > >=20
> > > Now we have two last_comp_version, one for reading and one for writin=
g.
> > > We compare again the dtb version supported by our libfdt version.
> > >=20
> > > This comes from the discussion [1]
> > >=20
> > > [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk=
49on8VfkP7CDvw@mail.gmail.com/ =20
> >=20
> > Ok, I now see that the logic is you simply fail to proceed with writes
> > if the library's latest understood version is < last_comp_version_w.
> >=20
> > As I said elsewhere, this approach doesn't particularly make sense to
> > me.  If lib_version >=3D last_comp_version you *can* write, even if it
> > means stripping everything that's not understood at lib_version.
> >=20
> > So the real question here is how do we know, for any given structured
> > tag, what write operations require the version to be downgraded (which
> > might in turn require this and/or other structured tags to be stripped
> > entirely).
>=20
> The rules is well known.

I really don't think they are.  You've proposed one set of rules (as
code) - although I don't think they quite make sense.  I've proposed
another.  Other variants are possible.

> An old libfdt version will strip the tag and
> downgrade the version. If, when we define a new tags this rules cannot be
> follow by olf libfdt version, last_comp_version_w will be set to protect
> against modification.
>=20
> Maybe the problem is just downgrading the version.
>=20
> Instead of downgrading it could be better if we mark the dtb "one or more
> 'unknown' tags have been removed due to a write by an old libfdt version"=
 ?
>=20
> We have a dt_flags header field. We can dedicate one bit for this marker.
>=20
> Could it make sense ?

I really dislike this idea.  It means we effectively have at least two
variants of every version which strikes me as pretty confusing.

> > This is related to (though not the same as) the question of whether
> > introducing a new structured tags requires a bump to the dtb version
> > (though not to last_comp_version, of course).
> >=20
> > Here's the simplest model I can think of.  It's what I'd suggest,
> > unless one of it's limitations is a showstopper for what you have in mi=
nd:
> >=20
> >  - version and last_comp_version retain their meanings.  No new header
> >    version.
> >  - New structured tags *do* require a new version.  If a dtb wants to
> >    include a specific tag, it must label itself with a version that
> >    defines that tag.  To enforce that:
> >     - For read operations, if we encounter a (known) tag that
> >       doesn't belong in the header version, we throw an error (either
> >       BADSTRUCTURE, or a new error for the purpose).
> >        - If version <=3D FDT_LAST_SUPPORTED_VERSION and we encounter an
> >          unknown tag that also trips the error (since if it was
> > 	 defined in this version, we should know about it).
> >     - For write operations (including in-place), we always error if
> >       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
> >     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_VE=
RSION.
> >       It will strip all unknown structured tags from the entire tree
> >       and downgrade the version to FDT_LAST_SUPPORTED_VERSION.
> >=20
> > This does mean that every new tag does require a new version, which
> > may make experimenting with new tags more awkward.  More
> > significantly, it also means that any change requires a version
> > downgrade, even if it's just updating a handful of properties.
> >=20
> > On the plus side, it's fairly simple, retains as much as possible
> > current version semantics.  Most especially there's no tricky
> > questions about what sorts of writes might invalidate an unknown tag
> > (they'll all be stripped by the time we permit a write operation).
> >=20
> > If those limitations really are a showstopper, I do have a few other
> > models that might work, though.
>=20
> The use case we want to support (initially mentioned by Rob) can be summa=
rize
> in the following.
>=20
> Assume:
>  - bootloader: supported version 2.0
>  - kernel: supported version 3.0
>  - dtb version 3.0: New tags, skippable but unknown in version 2.0
>=20
> The bootloader has to modify the dtb version 3.0. I has to add nodes such=
 as
> 'choosen', 'memory', 'reserved-memory', plus probably modify some others
> properties (usual fixup() stuff).
>=20
> Then it passes this dtb to the kernel.
>=20
> This bootloader (version 2.0) will encounter unknown tags. We don't want =
the
> bootloader stops in that case and we just want him to do the best it can =
do
> ending to pass the dtb to the kernel.

With my proposal it won't stop in this case, but it will downgrade the
dtb to version 2.0, denying the kernel the use of any 3.0 features.

I can see why that's undesirable, but allowing modifications without
stripping unknown tags requires some very careful consideration.  In
fact I don't think it's possible without adding more bits to the
structured tag definition to indicate what changes will invalidate the
tag.

For example, take a tag indicating that part of a property represents
a phandle (I believe you'll need something like this for addons).
In order to rely on this tag the consumer which needs it will
generally need to know that *every* phandle is marked with such a tag.
So, suppose vZZZ requires this tag be present for every phandle.

A bootloader which only supports vYYY, not vZZZ _must_ downgrade if it
modifies or adds any properties, because it could break the vZZZ
constraint that every phandle must be tagger.

Some other tags might be safer, they're always optional and can be
safely stripped from a modified property.  But if the bootloader
doesn't know the specific tag, the only way it could know this is if
we encode it into the structured tag itself.

> Indeed, if this bootloader writes a property with an unknown related tag,=
 it
> has to handle this unknwon related tag (rules already exposed).

Right, but it also has to handle the case of adding a new property,
because it can't know if v<future> might require certain future tags.

> When the dtb version 3.0 has defined new tags, the rules related to
> modification performed are well known

They're really not.  You've proposed a set, but I don't think they're
adequate for some very forseeable cases.

> and several thinks can be done to avoid
> the old bootloader applying modification rules.
> - The tag is not skippable
>   Game over for the old bootloader, an error is reported if the tag is fo=
und
> - last_comp_version_w
>   Game over for the old bootloader, modification not allowed.

As I said, I really don't like that semantic.  To be clear, I'm not
against adding a new version field, I just think the semantics
proposed for last_comp_version_w are not very helpful.

A version which says, if you don't understand this, you must downgrade
the whole dtb (stripping all unknown tags) would be better.  Although
then there's a secondary question of what should the downgraded
version be.

> In that case, the only solution is to bump the bootloader version.
>=20
> >=20
> > > > >   - When a property is modified, tags related to this property are
> > > > >     removed and the dtb version is downgraded.   =20
> > > >=20
> > > > We need a definition of what "related to" means somewhere. =20
> > >=20
> > > Yes a tag is said related to a property if it is available after its =
FDT_PROP and
> > > before the next FDT_PROP (other proterty) of FDT_BEGIN_NODE (subnode)=
 for FDT_NODE_END
> > > (end of node).
> > >=20
> > > This is defined by "structured tag"
> > >=20
> > > Devicetree Specification will be updated to have all of this document=
ation
> > > available. =20
> >=20
> > Ok.
> >=20
> > > > >   - When a property is removed, tags related to this property are
> > > > >     obviously removed. The dtb version is kept unchanged.
> > > > >=20
> > > > >   - When a property or a node is added, obviously no unknown tags=
 are
> > > > >     added and the dtb version is kept unchanged.   =20
> > > >=20
> > > > Again, this rule doesn't make sense to me at the same time as the
> > > > property modification rule. =20
> > >=20
> > > A current libfdt/dtc version cannot add tags which will be defined in=
 the
> > > future. =20
> >=20
> > Sure, but it can still add whole new nodes or properties.  The
> > question is whether a version can mandate the presence of certain
> > tags.  Dowgrading the version when we strip tags from a modified
> > property suggests "yes", but _not_ downgrading the version when we
> > add new property suggests "no".
>=20
> If the version mandate some tags on nodes and properties, last_comp_versi=
on_w
> will be used to block old bootloaders. They are not more allowed to modif=
y the
> dtb. They need to be bumped to newer versions.

So, this will only be useful if it's common to add new tags which are
_not_ mandatory.  I'm not convinced that will be the case, since most
previous version revisions have been about advertising that the tree
*must* include certain information that was previously not available.

> > > > >   - When a node is removed, tags related to this node are obvious=
ly
> > > > >     removed. The dtb version is kept unchanged.
> > > > >=20
> > > > >   - Adding, removing or modifying a property is not considered as=
 a node
> > > > >     modification and so, those operations have no impacts on unkn=
own
> > > > >     tags related to the node. Those node related tags are kept
> > > > >     unchanged.
> > > > >=20
> > > > >   - The only modification considered as a node modification is se=
tting
> > > > >     its name. We consider that this operation has no impact on ta=
gs
> > > > >     related to the node. Here also, those node related tags and t=
he dtb
> > > > >     version are kept unchanged.
> > > > >=20
> > > > >   - Global (dtb related) unknown tags are kept unchanged regardle=
ss the
> > > > >     modification done.
> > > > >=20
> > > > > In all cases, if unknown tags are not involved in a modification,=
 the
> > > > > dtb version is not downgraded when the modification is made.
> > > > >=20
> > > > > It is worth noting that with this v18 version, the dtb version is=
 not
> > > > > downgraded for any modification but only when unknown tags are re=
moved
> > > > > due to a property modification. In v17 or older version any modif=
ication
> > > > > led to a dtb version downgrade.   =20
> > > >=20
> > > > I don't think removing that behaviour is safe.  Even if the rules
> > > > above make sense specifically for the metadata tags (which I'm not =
yet
> > > > convinced of), that's not sufficient.  If nothing else, future
> > > > versions could add extra header fields.  If we modify the tree, tho=
se
> > > > header fields could be stale, or even removed. =20
> > >=20
> > > last_comp_version_w will be used by the future version to prevent this
> > > kind of issue with old version.
> > >=20
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--r/nTOTF7zr3Ep2sX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrRs3cACgkQzQJF27ox
2Gd+3RAArQhQYnNskM8FOXHXxyhtZ6KzzY0K7D3CW9MvIlMrG3N0D0ci9U8hyHNv
BxpwRhEJEYs3Rwuiv015Ym9u7inGTc6p3Ug5NVUI5jRCGoznB+txYUKuTITbEk/f
3kbFtEGgBj/PlPrm6JS6iOgQS/cYOkQB2Z4tYB6xetKaJtLgjSu54UogmRJUbmw8
Ei+o4V5K8/QneYmTm6BWbB2lvNp6X5IRsqLI8MK/Jf7ZurwjG8J/dCPkD/F2GkpD
WwtdBy6oC+te9qY0v+NCMI2XvtpJCtNkb3iF4eWRpRT4jF08A4XVb3npINT5CmlU
oLU0bIaZXFbG6uPTEQfg2BsXdjCDfc9LwSoqO5vXMIuEs0zLyvq0iivI97mg6FNx
NN3obdqNgCgd9pKIMPwRe5+DF+kja4SqpHisuFsMFIdtr01KNDovpHHIsueufeh+
47e2U2uacEKewQjZn0you5+wb6kWoRfcLsbJiZLzovC2/TF9z/xW7hUdS4mKiciM
j3PJ4Ev+Lp1yU75aXxirt6491wITmFd12wMONX+GkJvW6yliZqehHEwFj01Qpe3n
MPsHPUVvrTX6nQpzlmrNAw/09D5tDqJHhnuxYCZg0QhO2MICKwtDElNXmMw+XYjM
6ymNS7GkL48QEAiqAekerMETFknga0e3Nf6RYAoaXeZfF9BOMm4=
=vSws
-----END PGP SIGNATURE-----

--r/nTOTF7zr3Ep2sX--
