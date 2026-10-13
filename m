Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B70D4746C0;
	Tue, 13 Oct 2026 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875457; cv=none; b=L9FTY53oPtqE3CSEy6uXZIQIQkSe4qGW3u4DX5Zk+nO6w0POtnCnVhpOVKn6/5oAVj0ikqKufIt2aWcaSVbY22GYWdjwhyMXLvWaDtfUobneUg7BGBwLmavM+iVN74WVCZaPmHK5KpPSDTFvZduGy4RJ6VsAcEBvaKSwcKvAgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875457; c=relaxed/simple;
	bh=hByn10bJNoZebm6V3wgBX07ezYPy6CjWK72QGerzSF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DB1WsCS1YPRlTIh9AY+1+hbZdmxi1jFMS+wSaXY2HXRLcVbN856TmK4CeIC66jYvDSEAyvWA0HE0AuVP66A2E1bJ+W5exUzR2o1MF21blLwVEG3IBUFFJkM+cY/i8ERdCHiDIeZlSOoyuubYWmuBNBzXFttyOGx6DgidnWEgu9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=I/SvRCW9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="I/SvRCW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1791875450;
	bh=KHJJ6bd4PUseGr9aMvadgkcCTpYbLf5JRG/Ap/xrrkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/SvRCW9IIg/yJppNC0i7uucBdfRXKfIyAJiJMe2XSmK9lYQCSkZ90p2jb3yryzIb
	 zcBq32Pqy4dCdgwB60M4G1KIf3r31D7rumDKMnq/tlmhaLrdxT7XhMTR3oEcgbIoYI
	 rYq9WwPeC9N580i9UsAGhwJyIeRRcce33RmHqkXhGKBqMx19vkTFGnUCKjkh7wrVTd
	 MdEFAEC7wXl0WGOKvb93vQ54pKmFj6cVDR6Z/O9Foq3BGvJO8lJg97rnrRsPZpIz9I
	 SbZnTacw0Ao7g8IjjDfGYsdNtjQhO8HWCozTmybul2YOlZmnB9GNri2tD8u3JYNW88
	 8FPrG3raHXGrQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j3lqG295hz4xcZ; Tue, 13 Oct 2026 18:10:50 +1100 (AEDT)
Date: Tue, 13 Oct 2026 18:10:39 +1100
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
Message-ID: <as3ZWBr3wRonkxXF@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-16-herve.codina@bootlin.com>
 <arDMhoNNXcPi81sR@gractus.seuss>
 <20260925152157.511dc65c@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WjVfNxm1aa21zhMm"
Content-Disposition: inline
In-Reply-To: <20260925152157.511dc65c@bootlin.com>

--WjVfNxm1aa21zhMm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Mon, 21 Sep 2026 16:20:02 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:
> > > This v18 version will add support for
> > >   - Structured tags.
> > >     Those tags value definition will allow "old" libfdt, dtc and other
> > >     tools to skip unknown tags if encountered in future dtb version.
> > >=20
> > >     libfdt, dtc and other tools implementing version v18 will be able=
 to
> > >     skip unknown tags available in dtbd generated with later version =
of
> > >     dtc.
> > >=20
> > >   - dt_flags header field.
> > >     For now this flag field is set to 0. It is a placeholder for futu=
re
> > >     dtb version and could be used to store some dtb related informati=
on
> > >     such as the kind of dtb. For instance, the future addons format w=
ill
> > >     use this field to clearly identify that the dtb is an addon dtb.
> > >=20
> > >   - last_comp_version_w header field.
> > >     This field is similar to last_comp_version but for writing.
> > >     It contains the lowest version of the devicetree data structure w=
ith
> > >     which the version used can safely perform modifications (taking i=
nto
> > >     account following rules related to unknown tags).
> > >     If this lowest version is greater than the last known supported
> > >     version, modification are simply forbidden and lead to a
> > >     FDT_ERR_BADVERSION error.
> > >=20
> > > For modification, when an unknown tag that can be skipped is involved
> > > and last_comp_version_w allows modifications, the following rules
> > > apply: =20
> >=20
> > "last_comp_version_w allows modifications" is a bit hard to
> > understand.  What exactly is the version number against which we're
> > comparing that value?
>=20
> We had one last_comp_version.
>=20
> Now we have two last_comp_version, one for reading and one for writing.
> We compare again the dtb version supported by our libfdt version.
>=20
> This comes from the discussion [1]
>=20
> [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on=
8VfkP7CDvw@mail.gmail.com/

Ok, I now see that the logic is you simply fail to proceed with writes
if the library's latest understood version is < last_comp_version_w.

As I said elsewhere, this approach doesn't particularly make sense to
me.  If lib_version >=3D last_comp_version you *can* write, even if it
means stripping everything that's not understood at lib_version.

So the real question here is how do we know, for any given structured
tag, what write operations require the version to be downgraded (which
might in turn require this and/or other structured tags to be stripped
entirely).

This is related to (though not the same as) the question of whether
introducing a new structured tags requires a bump to the dtb version
(though not to last_comp_version, of course).

Here's the simplest model I can think of.  It's what I'd suggest,
unless one of it's limitations is a showstopper for what you have in mind:

 - version and last_comp_version retain their meanings.  No new header
   version.
 - New structured tags *do* require a new version.  If a dtb wants to
   include a specific tag, it must label itself with a version that
   defines that tag.  To enforce that:
    - For read operations, if we encounter a (known) tag that
      doesn't belong in the header version, we throw an error (either
      BADSTRUCTURE, or a new error for the purpose).
       - If version <=3D FDT_LAST_SUPPORTED_VERSION and we encounter an
         unknown tag that also trips the error (since if it was
	 defined in this version, we should know about it).
    - For write operations (including in-place), we always error if
      version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
    - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_VERSIO=
N.
      It will strip all unknown structured tags from the entire tree
      and downgrade the version to FDT_LAST_SUPPORTED_VERSION.

This does mean that every new tag does require a new version, which
may make experimenting with new tags more awkward.  More
significantly, it also means that any change requires a version
downgrade, even if it's just updating a handful of properties.

On the plus side, it's fairly simple, retains as much as possible
current version semantics.  Most especially there's no tricky
questions about what sorts of writes might invalidate an unknown tag
(they'll all be stripped by the time we permit a write operation).

If those limitations really are a showstopper, I do have a few other
models that might work, though.

> > >   - When a property is modified, tags related to this property are
> > >     removed and the dtb version is downgraded. =20
> >=20
> > We need a definition of what "related to" means somewhere.
>=20
> Yes a tag is said related to a property if it is available after its FDT_=
PROP and
> before the next FDT_PROP (other proterty) of FDT_BEGIN_NODE (subnode) for=
 FDT_NODE_END
> (end of node).
>=20
> This is defined by "structured tag"
>=20
> Devicetree Specification will be updated to have all of this documentation
> available.

Ok.

> > >   - When a property is removed, tags related to this property are
> > >     obviously removed. The dtb version is kept unchanged.
> > >=20
> > >   - When a property or a node is added, obviously no unknown tags are
> > >     added and the dtb version is kept unchanged. =20
> >=20
> > Again, this rule doesn't make sense to me at the same time as the
> > property modification rule.
>=20
> A current libfdt/dtc version cannot add tags which will be defined in the
> future.

Sure, but it can still add whole new nodes or properties.  The
question is whether a version can mandate the presence of certain
tags.  Dowgrading the version when we strip tags from a modified
property suggests "yes", but _not_ downgrading the version when we
add new property suggests "no".

> > >   - When a node is removed, tags related to this node are obviously
> > >     removed. The dtb version is kept unchanged.
> > >=20
> > >   - Adding, removing or modifying a property is not considered as a n=
ode
> > >     modification and so, those operations have no impacts on unknown
> > >     tags related to the node. Those node related tags are kept
> > >     unchanged.
> > >=20
> > >   - The only modification considered as a node modification is setting
> > >     its name. We consider that this operation has no impact on tags
> > >     related to the node. Here also, those node related tags and the d=
tb
> > >     version are kept unchanged.
> > >=20
> > >   - Global (dtb related) unknown tags are kept unchanged regardless t=
he
> > >     modification done.
> > >=20
> > > In all cases, if unknown tags are not involved in a modification, the
> > > dtb version is not downgraded when the modification is made.
> > >=20
> > > It is worth noting that with this v18 version, the dtb version is not
> > > downgraded for any modification but only when unknown tags are removed
> > > due to a property modification. In v17 or older version any modificat=
ion
> > > led to a dtb version downgrade. =20
> >=20
> > I don't think removing that behaviour is safe.  Even if the rules
> > above make sense specifically for the metadata tags (which I'm not yet
> > convinced of), that's not sufficient.  If nothing else, future
> > versions could add extra header fields.  If we modify the tree, those
> > header fields could be stale, or even removed.
>=20
> last_comp_version_w will be used by the future version to prevent this
> kind of issue with old version.
>=20
> Best regards,
> Herv=E9
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--WjVfNxm1aa21zhMm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrN2VgACgkQzQJF27ox
2GfR2A/+Pl4h60Lh95Q9QFtaHZ1rs8OTFnjzlvlQ9cJvsf/QXuAY4IeRu7UEgG6c
j7Qri16XK7vjlPcSmHp61/o59LWliA30BoH/FEbQoFcqoK+hY1yY6zdemK2Xgv9k
dBTCQwngE8/x6vijiYNraOFD2KXexdAYc1KrKEptGFG6O2/Fs0WRGVOAOYEGOvS9
wkAU+a2zrjFR7+6rBPZwCL55v9rND1R9RjIFUriy4VmyrE/jo9w9q/kZ1GjVd2Q7
mV1Hlq9yyLiuX4DfRJWLBA+f92FJQClUiYOD7WmIN4ly293rmkKFaAHSxBArXbL3
8vSyUGWCzt5gnowFWGdOjD6Nx4yHbKUAxCgRm9UjOG4kv159wpLgoWNHwAl+H26I
0VaMPAW41AipZ1jvwO5TQ4L4xXgii6uAaTHKWHvxYTH2bWJpSC42LdD9Rg2s6uXf
Lnd9Li7pteTXNESoVizmyPqVBzBSsdeMDiO+C1XpNBwcPP4mSD4C2Ypnjcdt6RCq
pUQ3xeeqySXBvrb2wQLCx+D+zgg3vDEDoWub7BnpRvQvB4+tHmzpQn0L/ybQab8M
IWofVnGRU1kRc9Qvy7GZ8DJV1QSyMr+G8jVFXWagdOIzfFQEdkZcB7KwMcpK2N/a
8GGg1dea/fnXM6Cfa0iemWq9r4tKRNaQzr8dI8TZ3qCqOB+dFjc=
=disM
-----END PGP SIGNATURE-----

--WjVfNxm1aa21zhMm--
