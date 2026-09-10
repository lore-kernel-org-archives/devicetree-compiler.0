Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA538D3F8;
	Thu, 10 Sep 2026 05:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018448; cv=none; b=URQu4YeOf2pHHIUKpj1l1UXWIb2IGfkBhaZKCkrq2Lhm+s6wJ4A2ubRekpwLIxTrjayX914RidGOe0terKbiy6WgL6A+rcIkRuJ1PdvwCwcxBKJb2hBp7K/gsTOOikqeImv8uTmbwvhoWQGfJaeUM1c1j7lS7KEJPggPGSHVypA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018448; c=relaxed/simple;
	bh=RBVnYWG41eVLW5pfuSSdHFhwd5diGDtXAXq5ZCGRXKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiYqJmFKSURL6IXMgILY9tSESd8iovdQj2VD+sn4xjIy53N1hSqvDJzwvVVCKDRTU03RpbQfNpWC6JjXUgLeU3c2YXy12uRNKgofxweVP4lWD9IwrlJM1iQ5yq122Co+cHF0IO9QkhqwgcHbXxxY6EvueXNDYLa0mO0w1822iC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=VEwMJPA3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="VEwMJPA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789018433;
	bh=ZVhD1dkTV4ZKUE5dqsXhCj2jw4k6GzMCZNeAMp3AK8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEwMJPA3YfLvKITUaR49nU4qq3LXZ/X9FMiV4aNOfpw0nSujV5+x9PswZ3+0N0xwT
	 BlfS60j0iyOWg1oPyiDWkvmD9i4DQW4sqASnJyWMYV3j7YRGSTda1bRgxtfOOKnW7G
	 htARnxvPIlSYm2S22wE+Zpx8sJa5acjYM/aZSb/p6flLcb8m7o2vmjoT8FwvLRK1BB
	 YAeelmjHn0oJCOJg2U18/8Hrg2yrTmLJE16bMQFaI9I1zj9M7pjEUj1VMqF0YcP/qa
	 O5bQudK8HngaoP61gCY9f1OExErjN651BnT796WPcVoCpQlqMLRfwSV+Q3MKUaxsMZ
	 JUqGgvA0iFUIg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hgRDd1ZD8z4wJj; Thu, 10 Sep 2026 15:33:53 +1000 (AEST)
Date: Thu, 10 Sep 2026 15:33:58 +1000
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
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <aqJBOdFPJbDKHt_9@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v9dsUAeuZ+bztXHH"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-7-herve.codina@bootlin.com>

--v9dsUAeuZ+bztXHH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote:
[snip]
> +#define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
> +		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
> +
> +/* Tests reserved tags */
> +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
> +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
> +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELLS, 0)
> +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
> +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)

Sorry, missed until I saw the later treegen changes that this is
defining some specific tag values.

Given that, "Tests reserved tags" needs to be expanded to better
explain what these tags are for - what should readers do upon
encountering them, when should writers use it ("never, unless you're a
test case" is acceptable).

It might be worth reserving a whole range of tag values for tests /
documentation / experimentation, rather than just a handful of
specific values.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--v9dsUAeuZ+bztXHH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqiQTkACgkQzQJF27ox
2GeCgg//el2cUEh051KKMd4N2cpW0L0KJKAKzkJEL1tVP3YoXWeOtA+VMe3VUxWN
3wWPD6swo1I7s5geovfodyx+Tk7Koy2C9AJN1JdY0OHqanmzVEZq0L+CL8BBEJir
exQNHuZKIad2R5Ka1bQb0KRawG8f43qdU/J7DOIBZLvWUpBnfQd+m3irtRsBLigH
kBbJGTboXgoQbuAWun8wjT+7da0lK2AT7NkG7C6qaDyrN/RiL6lYE2xZQLoZ4hIK
IzrXptBTGg0tXepjwTfkNgrb5BRk533DcKvhPkpnf21qG5xwWxqu5yT9SYOVJqhH
fTUw4L7xA6C1jLNGbwTzoWZb6BIn76hhpLwa6xlxF+TJFj5X7oDDxfoHUVzOSJbj
dZg7psLcSfYNOGPpR0tadiYtu6SiWn/zBlMoQpWMn7UCE8HUeoU4R3kMkxgaYkV8
iJR6OZjtBFZqQWtMbHjNhsnFgxw2WmXboy3eZk/9JSQJ5WDHgIguCEM4Mx/ReaF1
nLv7tjw238SGfcod4CNt2AAUsrTeH3la2lptnBNmfIRbXjFHHZ1w6PF6HMlWDSlg
cxJIHLoJgZdHBRAdgpUlZLve/4fdyaIEyGNwkaqDQ2d/uAfqPmG9eeetpoYcFgcP
Du3pKkmfMLN0Kgweh2ZhC3dFmdn0h3T636wWZYS23eVbqhZxtzU=
=S3Pl
-----END PGP SIGNATURE-----

--v9dsUAeuZ+bztXHH--
