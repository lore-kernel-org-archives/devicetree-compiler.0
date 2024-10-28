Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253D218785C
	for <devicetree-compiler@vger.kernel.org>; Mon, 28 Oct 2024 02:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730083333; cv=none; b=mmpTe1Ksql4JMtNU8lqv5Oub0BbqeCDe6FzDzachaIs4XsD+RestsmTuRguHO5ieqtuwSDt4UYo0Y+JEQaF87ZAXvslFBClKmedgnRMjrelJfYzi19XMmGpyj12ltoOIFZjf2H8BJNXON4UBVAumo9z5wJ+55wJKj96yExxVNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730083333; c=relaxed/simple;
	bh=vZMQce113lIxY8GnjrMrTZ/FoPc+wgSBdfPl4WvvEGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ6YwiT1E9lzwq41Pg97LH9QEVGQU8oJdAW3pL+nSPyFL1Z1EalTIz2FFrFM1XpGnLDYY+JZz5y1mTX2WKoSpSTJm+pOn/9I1Kz0PVaVCtSybDvncEvU3AEYLrEC8Mckbo7ow4Tz6cQGT0Ch2XgkgojzotCl2DqYfssoWnC7P6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZArROAEL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZArROAEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1730083325;
	bh=rXU4mQ/368Z7423G90YFWLOFM5E0FaXTW5OB+tN871E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZArROAELSjAwYWG0c5mZgRFC7mUf2jsj+RVLTuXAwfANiiJhzy1n6F12o8Zsl/oXi
	 AuvlIrRrh9BHEQRnIm6PvNF3BmmL4Pc8RzQnCoLsEoUOoCQ53c+rv7HF7xEiqjS0Wh
	 qQj9JossQu5VeJziXS38uA16BE/H9aZiDM9MP9oYnk/z7E6PYR5/fOfM1VTm7DOPqf
	 rbnpYgZCxxwoNEndx8HmfogLFAPjSJOsIWtNrMclRXcVKP4sCm4M2Hgk9cEYOZsJix
	 gjullp3ilAqSNEqeyHZFstJ8jNTSrKKMEP4aXYJo1Yf5b4NZ7QetNTSKknqB2ZgyEB
	 1HaOu/7ceAx0w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XcHj92hM7z4x8C; Mon, 28 Oct 2024 13:42:05 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:42:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] checks: Relax avoid_unnecessary_addr_size check to allow
 child ranges properties
Message-ID: <Zx75-Y1WfBran1nV@zatzit>
References: <20241025161307.3629901-1-p.zabel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7frCZ71SjI1qSY3K"
Content-Disposition: inline
In-Reply-To: <20241025161307.3629901-1-p.zabel@pengutronix.de>


--7frCZ71SjI1qSY3K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 06:13:07PM +0200, Philipp Zabel wrote:
> Do not fail the unnecessary #address-cells/#size-cells check if any
> children of the node have a "ranges" property.

I think this is correct, but I had to think abuot it for a while,
because it's subtler than it looks.

If there is no 'ranges' in the node itself, then the child devices'
address space is not mapped into the parent bus.  Of course, you can
still establish a local address space for them that (e.g.) could be
accessed indirectly via registers in this bridge device.

Having a child device which acts as a bridge from this local address
to another subordinate address space, but no children with any
registers directly on the local bus seems odd... but it is logically
possible.

Given the subtlety, it would be pretty nice to add an explanatory
comment about what this is check for and what some of the edge cases
are.


> Suggested-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/all/CAL_JsqKebRL454poAYZ9i=3DsCsHqGzmocLy0p=
sQcng-79UWJB-A@mail.gmail.com/
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  checks.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 6e06aeab5503..76fdee2ed030 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1217,9 +1217,7 @@ WARNING(avoid_default_addr_size, check_avoid_defaul=
t_addr_size, NULL,
>  static void check_avoid_unnecessary_addr_size(struct check *c, struct dt=
_info *dti,
>  					      struct node *node)
>  {
> -	struct property *prop;
>  	struct node *child;
> -	bool has_reg =3D false;
> =20
>  	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
>  		return;
> @@ -1228,13 +1226,11 @@ static void check_avoid_unnecessary_addr_size(str=
uct check *c, struct dt_info *d
>  		return;
> =20
>  	for_each_child(node, child) {
> -		prop =3D get_property(child, "reg");
> -		if (prop)
> -			has_reg =3D true;
> +		if (get_property(child, "reg") || get_property(child, "ranges"))
> +			return;
>  	}
> =20
> -	if (!has_reg)
> -		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"r=
anges\", \"dma-ranges\" or child \"reg\" property");
> +	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ra=
nges\", \"dma-ranges\" or child \"reg\" property");

=2E.also this message needs updating to reference child "ranges" as well.

>  }
>  WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, =
NULL, &avoid_default_addr_size);
> =20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--7frCZ71SjI1qSY3K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmce+fgACgkQzQJF27ox
2Ge4cBAAg4aP3423hd0/kfbm3yHskthPjDq/vaasll246Ux6OvNRscTN84sy9jsL
M7BjbTW3t17kEIweyS2F23BNTcKfpXIRN9NtJRN7LHl/nD+tgX+bIbJYqd0qjKrY
/njvOEiPUhUSxYKtfEtg9YXW1nrS+6OHM0ocEKXSIkehAV9s5dvH4jTsrZ5qMlIF
TP8dj+Jc4fGmuukLnwBEebNJLLuUnPvjnq87WalNsxQHFDAAMZKD9g7CF8qq5qUt
fY92c+RQLmDc2W+S8FQN6C5NPVpUfofFiLrlYxhmFdbg9GZe0hiYEBBFBSUSxj0r
V6f3wRQhgeoxCL12QKsqRZTC3Bsfgz4VDZPSt0HZ6JBRAp1Jly5cJ4HxG72x+W6H
+exWUGWAGtyCXkIgrACcc/vyd/oXtf/mWBTzuZu5DgS1spD4OJAliN6b6cq1MT8v
kb/2A2XgFl3zinbhB5n3rNMFHimAJST7sNI/ULFin1ly4Ej1JGUbcmwXIicNsfLr
O/BFKLz8VbulBsC91BQu/l3zE6n8I+a5GUED9/j7t/9UphekvFgbSeCExQqQTffj
EFSGIywGoKVQ8avuFzEuEu0dnho0fnyRDYnxxKhLW/tJeHiS59VUL9yfSfmVJGzg
DPuf8iIE4dgbpR/zZYJxvfZgFfY0Qt3kxaF/3APrwfXKYnP+KkE=
=njh2
-----END PGP SIGNATURE-----

--7frCZ71SjI1qSY3K--
