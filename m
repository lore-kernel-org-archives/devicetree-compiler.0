From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V2 2/2] scripts: dtc: fix memory leak after realloc
Date: Wed, 13 Apr 2016 14:17:26 +1000
Message-ID: <20160413041726.GB18218@voom.redhat.com>
References: <1460494500-26922-1-git-send-email-mussitantesmortem@gmail.com>
 <1460494500-26922-3-git-send-email-mussitantesmortem@gmail.com>
 <CAL_JsqKqbj+FmD2SwSsmdBW6SPoJzsP5an1o_XZAozo86ssPCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1460520971;
	bh=MhM2U6LyP4B46aOqJIc4rUHD+zn1JVIEK8CjF5zI5Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAeeYRG8t8yxlmzZE0BYeQIJgkcXUIMbYWOYr6hjbI9f6L9X8JuS81c5rrR9YU5mV
	 x/RUj8LomUb9JT8AkcFn6lJFiEN7Jh2S3MgAClt02UzKpeZwdtWkDgKRdfebkdRo5b
	 Lk5e2EkwbfO+4PXYAfN4Gvg7/Xn/WP/Qxy9TsKws=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKqbj+FmD2SwSsmdBW6SPoJzsP5an1o_XZAozo86ssPCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 04:11:17PM -0500, Rob Herring wrote:
> On Tue, Apr 12, 2016 at 3:55 PM, Maxim Zhukov
> <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > This commit fixed memory leak after errors realloc.
> >
> > Signed-off-by: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  scripts/dtc/fdtput.c | 10 +++++++---
>=20
> Again, your patch is against the kernel copy of dtc. It needs to be
> against upstream dtc and then I can update the kernel copy once this
> lands.

Right.  TBH, I'm not particularly concerned about the leak anyway.
The memory will be freed when fdtput exits moments later, so it's
really not a big deal.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXDchWAAoJEGw4ysog2bOSSacP/2vDyshgNHTQjw5NPeH/4Ffc
1c340bGnRACiNrXH2jN/gtBkAcUcX/7zmlYTaKEeEvx3Y1o1onnRalJ2dembavgL
bNNKPjqkRLcIRFWH3tw82k5aZ7aO36y2ONBtlLFpjuZ21+fl09Vj+4LfBVy8Ymxl
o8BkkjlBFnuhzSuBXvM8JkNISRDJ/Dv/9Ng0YajeKgW9Avxu0DklA5oiR6oVYbp2
tx760IhCevnsghaeIpAbjs66dpfa/WKkvKarufIfDCXmW9vUp0KA2o63cNBPovsu
4SikEY+w4x786Jl2XiCl6gPggEVHqndttoSuw5EMIjfPvBkUvwqEqmTmre6gLaWl
oKmfedXSHu67cSjL7PxMU4iVzlGqV5f3EYoYcXJPumqyoBfsdzoXLlItO/MDmhcw
njhhT1NYXfmB+lApDcqsfGl7BURcwR8gv8EaoYMaJWZeQB1CMhemkEt9Qv5aGiQ5
CECgb4JfpBBoa5x63a3UJUN1zH39bd6J9ZGxhX1KTkM8/QZAkxpBYrbs6ElTOwk5
ijfJ2N1dUDZFKQ9zgiJ1v+I+Ofj94J5f3DJEhEWoDlTuBskmYTdvgC9RNdR7WBB4
mVkq58NxyaRjyDUN2CjgX8zCQohRqB+DnssozjpO85k6YZDZ4DC3D9pe/7ejrU1i
+BfKld1+8FBaaoQFXk6N
=sA7v
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
