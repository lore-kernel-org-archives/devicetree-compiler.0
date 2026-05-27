Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BDC1C695
	for <devicetree-compiler@vger.kernel.org>; Wed, 27 May 2026 04:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779855960; cv=none; b=d7OmgZXPBF/3T28OjxIRGobNfdKWHsb2Tr4LAtDE+5qQrosErYigIrAFV6gBL3vgwp2KDQVIXyMz6aS/pYro0uxoo95RLsBFE5jF5CNTkcIEebF+w2LT7rZpHQvXD4QQ3+jOl8dmVwnDjCBqusJN/zjE5o360QijF071A5dT1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779855960; c=relaxed/simple;
	bh=oBqWpZjR5GV3Rcu/LpR6yXXYuNoX0whSlouYjKYQ8h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTbqL2MInJukXUSGqkOK28Dvf9VEz/JtLgJROdNcBl+hSJctRmxiuOJQKivTJ2bWwJ7LCGfQkiLw6VUXnzymt9mmU4ZlWURyd1LoA6UmpbEAGxLQtQPeKG/xffsVyeDz0tRnGRHeO2y4VBcYJPw52DYJr/NbX5fMmRZt7Nu8AOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=V8t36PVY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="V8t36PVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1779855956;
	bh=lPYkml8I9FigJmo44lhbqSqLvmEAGdUEfxkCY6SfzR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8t36PVYN6YsUp8tSXqxqIN4Ov0g7gwSW5ilOzLgrJfUZk8tzHz9DmQVNXUfTKniF
	 jjVHpxGbD9403E/qzfNpa4z6N6zMyOK8aBxjgz5VqaNPtJgreDapgz1RdaSHxK3O9A
	 YJE/A9wNQi+9FMjAJZ58nTMSonOpyABlMPlBduCeuXKobgpp7DXPTFKYUAyQHiFBGN
	 DkM4Dgr8EBb9KpX6CC1cGDQhice8iv2FKlNeX+xFfs1Q5JSkBChBCbPCnRSPIQarc/
	 pQQTCWsDmaeVW4XbF5Q1EgsRerJ5B5+lKFFvkv8i+kWLT0MhlShpHQnaqDM/QceUK0
	 5N69FUqLu/KrQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4gQGl86gp6z4w9h; Wed, 27 May 2026 14:25:56 +1000 (AEST)
Date: Wed, 27 May 2026 14:25:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: Tag a new dtc version?
Message-ID: <ahZyT0glgYg0783m@zatzit>
References: <CAHuF_ZqwfZ9U5FBG+BQdmcVzESfKWvghCL5nc8sqzzzO0VBDYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Af2xgtxSUh1b+EQ"
Content-Disposition: inline
In-Reply-To: <CAHuF_ZqwfZ9U5FBG+BQdmcVzESfKWvghCL5nc8sqzzzO0VBDYg@mail.gmail.com>


--4Af2xgtxSUh1b+EQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2026 at 03:39:34PM +0200, Yedaya Katsman wrote:
> Hello,
> I had some issues with the python bindings from fedora, and it seems they
> are behind the ones published on pip, since there wasn't a release of dtc
> for a while. Is there a plan for a new tag to be released?

I pushed version 1.8.0 yesterday, sorry it's taken so long.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--4Af2xgtxSUh1b+EQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoWck4ACgkQzQJF27ox
2Ge9Wg//STx7+hvmyZOLnm4hZQHJKnwrFOTFu9eng/hvfN+25wjg18qyhU9GjSJv
RD+exg8flNrKlYUd+J9w2rpAtkg/I4OIUTBW1NheP6P8twG9Nv3hfSVeHgz+GksB
TsGdqIZsavow4DjojTgm+f/jnFYWuX1FyxqowhOHlpp+2MQCtGVDwh2cEEmY2oZP
/U0HwwFiyhoQVnDXHlZHjkYitdkyKbHglioczIYRX0oGffGx7MPW9+C/cRaaJoyY
wM9S5ND7YDGLQjZu+HEL8TZLnzgPrp/aJpDbfxkl0akU/mDOjyg4Co5l7E8YMhws
UfD1ft5CAiRl0fEFMc1U7zHb1XkGyp4DkIB9Nba0E1868FXbkuDWNdDSjgvtolzj
69zkivHrV9bCXOCMVyIVyXEl7hB5KuIm727WiiDH9x8G8RLrdwkmdz1SKihKQSVW
A0mby6VvufhGbM5ZfdV2HLeaAK5bgEgRsByWfcNXIsFZoHLQtPcanOAOTp7WBoHK
ylCtavYo0OpQcywx30h6D7ibk1hXJQOGGNWJ2HWtzodenYJF0LgVeFgYshIv/1+6
EsUY59+XyKfbjt6VvoNeAblZw7VxsWOD9YJbtMrsCi3UQQcNsbJZyVN517x2S0gx
2hwkoBzury+hjxjzIFa+ZYdcElI4Dx4USvwTxKLMEMXU1cPuFnw=
=nPBH
-----END PGP SIGNATURE-----

--4Af2xgtxSUh1b+EQ--
