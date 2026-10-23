Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792731868;
	b=yZpIrodPa9hJJISTvcHkdRzrDa0cb2Vtd+gEDcqhluvJkwt9WXxx4NV8Qs3EGUcitynq
	 Wx7zHu/QCUQybVh+usUX2DefDkSPvZHzDy8DOSZfgmRe2fRmv/OlouFEwP1YgQoLdyncQ
	 b4qr4aDLe5kBagm0wrcz2OjKhYu4VwFRMRlJvZAfOPoACTNW0p5C8WPKlozH9BIXpdh0p
	 gWEFsonQspxRVvlMVG9wIzMGaG0vMtnN4B7FnGzr5n4LdBH5PfvKJd0x6MRsPnU8ThWlY
	 YGYCHkzWRxD4eBTRlwSZZ7oSg7sJX9ruGx5Xwv3dGGJGqGyzSaBm+FNjQkBimIBNwTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792731868;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8tUc+1l0YIZOdnjhi2/tDxI58lIRgTJwLko7PdeJijA=;
	b=UPmTSemYOof3kZhgMtX7+lcSbc0ZjjVYI18cw3UqommGr+oh0vmMrMu6v25bfMWTZwes
	 w/2biIa2hdy/8WDio3nM2QRAO4bHBv+Vvwo8ip+og6iDqeRmmSsF5w9kBhbFw9PrzVGXs
	 CzzpJSeTgHv7vDibYB3zNDRGa/ZE1x6zn7D3uSbogkA3UyDPRw51K5AlQm5Af7Qk1nap8
	 CKOKSxAUXp98olYtcv9aZp+dGdoLTXQvBXqL3ypjEAYeF7B38bTdtBWXe9goBF/+w8G1k
	 wW765PJwxVXk9ZQJYUyXPGQefe+kgZiAmTHx/IifcXfVD2Hn0PQ2M0UrDtTxRH6wBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Ej8mhLOJ;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99518606A31A;
	Fri, 23 Oct 2026 05:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99518606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Ej8mhLOJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792731862;
	bh=8tUc+1l0YIZOdnjhi2/tDxI58lIRgTJwLko7PdeJijA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ej8mhLOJglVNv+Mpu2FJ4Vp0HCPEpArtkI6MPaerMYEey+C+j0mjXLn8cQN73s/Rf
	 LWJUSO4NJdYzAKwyJXH/sUIPgWeD5+g40bcP/004ibestokt6ALAVeULpA5qfLB8eg
	 B1H1qkm+pAmzdyLLpwH/db8T8RFitGh4QMHqBhOz5g7QigAYK7sPdehV3HKWa1pONU
	 KUl+wMAJDHHiFDv/1gNLG8iaT8xUCWIgv0VzxS9nOciV0g7GNoSe9pRUw8RuSVcFCr
	 UuOvNf4Hnktz88cyKQFF2P66ppdLaSbMIKHchGimqiKpv1z5W+mcDYdOx4aMVKIRR4
	 FnFbGzBP1E67w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j9rXk3M9Wz4wDh; Fri, 23 Oct 2026 16:04:22 +1100 (AEDT)
Date: Fri, 23 Oct 2026 15:49:09 +1100
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
Message-ID: <atrnN0ICA41TU1B3@gractus.seuss>
References: <20261015182221.2931742-1-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="nmhuka+lC2JdbKwb"
Content-Disposition: inline
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>

--nmhuka+lC2JdbKwb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:21:33AM -0700, Douglas Anderson wrote:
>=20
> Devicetree overlays allow you to have a "base" compiled devicetree and th=
en
> to apply an "overlay" to it to add or modify nodes. Devicetree overlays h=
ave
> at least two purposes:
>=20
> 1. Supporting add-on boards (like "hats" on a dev board). In this case the
>    main board is described as a base devicetree and the add-on board is an
>    overlay. In this case there is a clear separation between the base and=
 the
>    add-on board and the base/overlay separation models reality nicely.
>=20
> 2. Supporting a "family" of similar boards in a space-efficient way. In
>    upstream Linux, there are 47 distinct sc7180-trogdor boards supported.
>    These board are all highly similar, but we compile (and ship) a separa=
te
>    devicetree for each. Devicetree overlays can make this much more effic=
ient
>    by factoring the common bits to the base devicetree and having each
>    of the 47 boards represented by a small devicetree overlay.
>=20
> Up to this point, the usage of overlays in the upstream devicetree repo h=
as
> mostly been for case #1.

I don't think it invalidates the concept you're going for, but this
description is a bit misleading without some historical context.  In
particular this is a bit confused by the fact that there are both
source-level (dts) overlays and binary-level (dtb) overlays.

Source overlays came first, in conjuction with /include/ support in
dtc, and were intended for use case (2) and similar.  A group of
boards with the same SoC was the most common case, but families of
similar boards and families of similar SoCs also used this mechanism.
At the time this was still envisaging that a complete tree was built
at boot time, and didn't change.

This started to drift into use case (1) since without hotplug (we'll
get to that), a board with different hats (or whatever) can be
considered variants of the same base board.

That still required the complete tree be built at compile time (or at
least bootloader / kernel installation time).  That wasn't great for
two reasons, roughly matching your two use cases:

 1. Compile time is obviously no good for hotplugged hats.  Even for
    coldplug hats, it's desirable to be able to complete the tree at
    boot time rather than compile / deploy time.

 2. Bootloaders often want to support a variety of related boards, not
    just a single configuration.  That was already possible by
    incorporating a full dtb for every variant, but it gets pretty
    bulky and bootloaders are often pretty constrained.

dtb overlays were invented to address these, though I don't know that
difference between the two motivations was particularly well
understood at the time.

dtb overlays were pretty much a direct transcription of dts overlay
semantics to dtb and runtime.  The use of "in band" encoding (special
properties) is kind of inelegant, but it worked well enough to become
popular.

This works reasonably well for use case (2).  That makes sense: the
semantics are based on dts overlays which were designed for use case
(2).

But, dtb overlays have always been a nasty hack for case (1), even
though that's become the predominant one.  Overlays can change
anywhere in the tree, whether or not that's physically sensible via
the hat connector (or whatever).  The semantics of applying an overlay
lose information (by design), which means that removing an overlay for
hot unplug is a complete mess.  The way we encode the information
necessary to apply an overlay is kind of messy and inconsistent.

Still, they worked well enough for (1) that they've become widespread.
Herv=E9 Condina is now working on a new scheme (dubbed "addons") which
is actually designed for case (1), and should suit it much better.
It's a fair way off being ready for use, but it's a good development.

> Many Android phones attempt to use overlays for case #2 by describing the=
 SoC
> as the base devicetree and then describing boards in overlays. However,
> this solution doesn't get as much savings as it could since there is still
> lots of duplication between the overlays. Upstream reception towards
> structuring boards this way has also been lukewarm [1].
>=20
> This patch series introduces a tool to help make case #2 a reality. The
> idea (suggested by Konrad Dybcio at LPC) is to continue to represent all =
the
> boards in a family as completely separate device trees in source code.
> Then, after we've done building everything, have a tool to automatically
> factor things to a base devicetree and a set of overlays.
>=20
> This tool has quite a few advantages over other solutions:
> 1. No change to the way device trees are stored / arranged upstream.
> 2. No need to deal with some of the awkwardness / limitations of overlays.
> 3. Better savings than just a simple partitioning, like between SoC and
>    boards.

I like this idea.  It separates the case where the impetus is just to
save binary size from the case where there's a logical separation
between the pieces.  It decouples the generation of dtb overlays from
their expression as dts overlays (where you want a logical separation
for human readability).

> I've used this tool to reduce sc7180-trogdor device tree files (which
> are stored lz4 compressed) from 1.71 MB to 213 KB, a 87.5% savings.

Nice.  I suspect this gap would be substantially smaller with a large
window compressor.  The trick here is that the factoring is finding
long distance redundancies which lz4 won't be able to see.

> NOTE: on Chromebooks like sc7180-trogdor, using overlays like this is
> an optimization. On Android phones like Pixel 10, the bootloader logic
> bakes in the need for overlays. Specifically, if we want to be able to
> build a single image that supports multiple boards and have the bootloader
> auto-construct the right devicetree, we need the boards to be represented
> by overlays. This fdtfactor tool can make that a reality.
>=20
> The fdtfactor tool can either work directly on a set of compiled devicetr=
ee
> files or it can work on FIT (flattened image tree) file. The idea is that
> you'd create the FIT file containing all of the duplicated devicetree
> files and then fdtfactor would "optimize" them.
>=20
> I'll freely admit that the patches in this series were pretty heavily vibe
> coded. I'll not pretend that I have a deep understanding of the intracici=
es
> of how overlays are implemented. That being said:
> * I've spent quite a bit of time reviewing the code from a high-level
>   perspective: confirming that functions are well documented, well struct=
ured,
>   and make sense.
> * I believe that what the tool is doing and how the tool is used make sen=
se.
> * I have had quite a number of internal "the AI reviews the AI" rounds to
>   the point of diminishing returns.
> At this point, I'm not embarassed to put my name behind this. While I won=
't
> promise that there is zero cases of the AI doing something really stupid,
> I'd be willing to bet that the end result is better (and cleaner / better
> structured) than what I would have coded up if I had spend a few weeks do=
ing
> this on my own.

Thanks for that clear and helpful context.  My views on AI are
complicated, leaning negative, but I do think it can be a useful tool
and have no plans to reject patches purely because they're AI
assisted.  A statement like that goes a long way to convincing me that
I'm not about to waste my effort reviewing slop.  c.f. my rather
unfriendly response[2] to a recent very sloppish bug report which
vastly overestimated the impact of the bugs in question.

[2] https://lore.kernel.org/devicetree-compiler/as8RYmIp0pDCplpu@gractus.se=
uss/

Understand that all dtc maintainership is unpaid volunteer time for
me, so I'm less responsive about reviews than would be ideal.  I am
gradually chiping away at the backlog, though.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--nmhuka+lC2JdbKwb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmra5zcACgkQzQJF27ox
2GfoKg//V+ArnW8sBgvMY4B20fMtZQyGRxabfVXW5cfc5i4rhywDcvpe25mEJ6kL
Tw2OZZdhTrRdpoZPB4jFey+D0CcydbsuUmcSYYH+E4LkbU8kz/tnE0fjO68ZG8d5
bnYbvXDAESTGLtOs+NAqgTLEbwDHk6QUWGcVueXjd7+WCUQa+fCSvkogiSbhAZl9
/GlRwkmEZ+mFv8Z/x/6EB0jH6f1QHZn/gMpEifFV63GvVRntvRKB+yDYbYB7YTo8
dEthJARPTk5uqXGjw4C5cdDD2FEd9y/qUCiXteUIOse1EB2j99vHmvcPSDrwTJp4
3I85+9jBJ0Cm0Y2IVXJ6kOfBo+JEaAVVM+uZ11vijd/yVCsoG6WicSiiQr+gIse7
96V4ayDVJXr2ir6uV+atCNGQddLGGP04BYEAjQ0lKvKG174xRM12Phx2z1xL0M+f
cQ3NMqsjlssFtFBS1EafjxYweiHErcWswWv/n3oCw15w4t7LKEu7EHQtcODYX3l0
IOH4D++xAUANYeMy7iXHHG/VlmjTRceFAFEkLhmnQ/lsd8AZpyitlJwFjP5Z3Qvs
X5bMXbs78G6ShWi3lIGAPRI4sJgpSGUddw1dVVGJcBhOB7q9s3AT8+fKZuftFaqT
mvhDF6/6rbVToQbBOSu9139UNtjxQAp6vISaw6usVYdust/hSeI=
=NFk7
-----END PGP SIGNATURE-----

--nmhuka+lC2JdbKwb--
