Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993756;
	b=NNEES0tABSXARrzUljO1pxK4SjDPZrLWphXYqjI2ycXdkYk4pyL9PveybYVSgOO3uS+m
	 E9u/Md2x8RxHqBNqYKQEiQfT6GldELrhSGQUkyeFhoFraznugETVuZIPW0o/D6TkKbcI9
	 JBa3zmDHsl+9cuN3CR7CppkJ+cgxPOPgcbQLv7XAHJEvI6koMgENISY+6AWQkI1Nb+9xG
	 zBURY7gqN8pzRK9S2dIUEDq+GvRiiLtgjZUY6sYewFhp+jjglpb56jwpSbYuhcFVgxWve
	 Q+8tP8uwPhPWHdPu7X/yZpux3KbLVNtndHSnLqDy0PFk7uLVLkOJvf5GxOdmXjCyp3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993756;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MhFAy4lbkABSIaB8V4GLadKEiGetCotIcrPzjkrSm+Y=;
	b=yoP3INi0hqOSeaplcoBB2ZmTPCBX77k5JqGK7kKrCTz6kii7JSRJj73VmM8c1AgyZa+5
	 d4aMDqLCjYOMswB18BLQi9IlAR7dM1U2oZQGG3vP1fI7t7OV1xRYoq9eP9WV5bDujKn3/
	 s7ltYJGpHUouKIEUUt3SKBjC0lTjxrhUapil6LM/neZCW3Dxu1c4B5oCj+aWQXSwRLGGs
	 2ID9SNL+mMop3mKI+dDdXXJNfAzt3hF4g1K74qyps6EvmIDgiw3eR0VzH/qeWmZN23Pfj
	 uzssGPdTh/JpHfzWqIShvv5gBoFcO7DRw68lZxsqn005p6TuoQ/ye39hexMxTpuKv0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=liiQmoN6;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8736606A331;
	Mon, 26 Oct 2026 05:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8736606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=liiQmoN6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792993753;
	bh=MhFAy4lbkABSIaB8V4GLadKEiGetCotIcrPzjkrSm+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liiQmoN6GbV9QMlRdoVD4oROmZI0wNYNmhFqyZhAXFcVrOYux2W7NIFKsh5eRhAHY
	 QP0uu7BRvDYHd4lwGQ6PU1D4/M+ybTxo7ccIDUPqfbz+I77LlHdr65KIWcilerhYSO
	 N0PDPtjvg9qShC/8lNMZddMOcBXnnhijsUOHDff06VQgtnAaoWnFwFimmfwIPbxKia
	 VBB6q1tUSJshWdZm5RM6QCiMav9vMog0RQKmkJvmG01SJFAWbglLRl0x1I2QuTXemF
	 g/oUkqhaO4LXdsB+BeBtvEqaAOB0Gn6DtdvgL+Cu2giqJWd23o78iuSHkElJCvfx9H
	 G78fJtFexumfQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCjP56mvHz4wK3; Mon, 26 Oct 2026 16:49:13 +1100 (AEDT)
Date: Mon, 26 Oct 2026 16:48:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor
 overlays
Message-ID: <at7poY2M3ori0qIN@gractus.seuss>
References: <20261015182221.2931742-1-dianders@chromium.org>
 <atrnN0ICA41TU1B3@gractus.seuss>
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
	protocol="application/pgp-signature"; boundary="u8HORElLyf/mPT4P"
Content-Disposition: inline
In-Reply-To: <atrnN0ICA41TU1B3@gractus.seuss>

--u8HORElLyf/mPT4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 03:49:09PM +1100, David Gibson wrote:
> On Thu, Oct 15, 2026 at 11:21:33AM -0700, Douglas Anderson wrote:
[snip]
> > I'll freely admit that the patches in this series were pretty heavily v=
ibe
> > coded. I'll not pretend that I have a deep understanding of the intraci=
cies
> > of how overlays are implemented. That being said:
> > * I've spent quite a bit of time reviewing the code from a high-level
> >   perspective: confirming that functions are well documented, well stru=
ctured,
> >   and make sense.
> > * I believe that what the tool is doing and how the tool is used make s=
ense.
> > * I have had quite a number of internal "the AI reviews the AI" rounds =
to
> >   the point of diminishing returns.
> > At this point, I'm not embarassed to put my name behind this. While I w=
on't
> > promise that there is zero cases of the AI doing something really stupi=
d,
> > I'd be willing to bet that the end result is better (and cleaner / bett=
er
> > structured) than what I would have coded up if I had spend a few weeks =
doing
> > this on my own.
>=20
> Thanks for that clear and helpful context.  My views on AI are
> complicated, leaning negative, but I do think it can be a useful tool
> and have no plans to reject patches purely because they're AI
> assisted.  A statement like that goes a long way to convincing me that
> I'm not about to waste my effort reviewing slop.  c.f. my rather
> unfriendly response[2] to a recent very sloppish bug report which
> vastly overestimated the impact of the bugs in question.
>=20
> [2] https://lore.kernel.org/devicetree-compiler/as8RYmIp0pDCplpu@gractus.=
seuss/
>=20
> Understand that all dtc maintainership is unpaid volunteer time for
> me, so I'm less responsive about reviews than would be ideal.  I am
> gradually chiping away at the backlog, though.

Fwiw, here's a follow up on this topic now that I've actually read the
series (or at least, the heart of it in 2/4).

This does exhibit some of the pitfalls of AI generated code.  Most
obviously, that patch itself is pretty monstrous - at least by
default, coding agents aren't very good at considering splitting
series for the benefit of reviewability.  It does exhibit signs of
AI-typical verbosity.  It's not too bad in terms of locally redundant
code, although there are a few examples.  It's worse in terms of
"conceptual verbosity" - most obviously it uses two quite different
ways of representing the tree being processed.  It's not really clear
why or if that's necessary or useful and it makes it substantially
more confusing to read.

I don't know what prompts you used for AI-reviewing-AI, and I don't
have a lot of experience with that, but I wonder if results could be
improved by using some review prompts not focussed on correctness or
(superficial) style.  e.g. "look for DRY violations", "look for
redundantly represented data", "look for workarounds for bugs in
pre-existing code, and fix those sepearately first".

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--u8HORElLyf/mPT4P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmre6aEACgkQzQJF27ox
2GfAyg/8DUjS/fAf3DSfd+bvQj1v90iR92bCR0RPxye6ml0xSd887AEgMy2hItDT
GZ4z1dcSzYsyLCq9rLiPxHUuKR19Ge5eMT3Tu/eojW7lpk2s6xnrXliEiSzHbmeV
5y3ndvlLLj9vS3Q/iQvIpEoqSCYEZx6raqw+5Iks3mJZf1AUxEq+8Pph9eKeoRDo
+Uwx+gMUGrV7+fDaA58iFMvELKqhBTGBW0I8g0bJtEAA2Yh2wAr+Ds/qo17IRFxj
jpPp2OefSIDKKJw1Q+oZD7Y3IwAHaTyfWMcz+Bt+d7JmGEh0xlBth2HQXzDuvVNc
kpB9SIm5kIcMX3+ESN0cirJ9sHPoT+xNQpI+oVP9se2M2wsE7rN1S5ImjLPtbX1F
p5EgHpgaXgn5y0wUZ/b81qnP66b0+KMz4uEgYMn1aZkgaaLT8Mn8hfojra5kjlNd
7cQ95KUtEKEzn0QwdCNTydhxyarmDQUT5+PpzLDNMoeAhivsR3WC5tYMfL0mbrhH
b8D+Hh79LuNuBSQIEai95RfbJGMP+UO0bhFBipP/t+ZMU7K4tONsBwHlvevK8wBU
zHY0tiXcF1f7cgAqph3iBfNhqVWIMgKP3lbSx7WllDH8fxwaM1l0OHMQFWbYqAxs
m93AoOqJX95rlTORKALJ4aeX/pGw4EAM8x7fql6IN9daUXLUnIc=
=RZwm
-----END PGP SIGNATURE-----

--u8HORElLyf/mPT4P--
