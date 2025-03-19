Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D433AE552
	for <devicetree-compiler@vger.kernel.org>; Wed, 19 Mar 2025 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367083; cv=none; b=nh3Q1UkyvC785gJDiyolBId/XvXuc9NOFPT14vUJ+EjR2shQUGqFxL8hjRjEcvwqrtE6Hmn5FK3gBUDuJFCPh/iMRcHXqPFWrv1mUCp/0nMSI2cxB8GBDMrSKd4WuBZLT898AKqUV9Ma0iEn/mrGP+JVI2z4OLUDZVSzg2m6X08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367083; c=relaxed/simple;
	bh=AGKDOuFiIl+U2vBZ81usVRlyJpWmtBsrDxs0j0mJPUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeQNlTsc5njSOAuK3AWXoXseDG1HMBhqjxTUU9iovx+3OsmPfrQCJ1ujXCY/pbUiZRefZ4YNPi0T6+e1Gyzeus0GDEhT/97HnPVNFrFwp2aeWHcRmWo0nLsVPcM/JwhbO/ZDMiNFDdOcevbtpc2mSdkVbiRGg1AcADMEH7zRGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [IPV6:2603:6011:3f0:6f00::12ac] (unknown [IPv6:2603:6011:3f0:6f00::12ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: eschwartz)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E409D34319F;
	Wed, 19 Mar 2025 06:51:20 +0000 (UTC)
Message-ID: <b6965087-26a8-4f6a-b06e-75c009ee322e@gentoo.org>
Date: Wed, 19 Mar 2025 02:51:18 -0400
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
To: Rob Herring <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org
References: <20250317004056.14564-1-eschwartz@gentoo.org>
 <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>
 <767597b0-c812-4ddb-9caf-bd051ef202d0@gentoo.org>
 <CAL_JsqLdMRrtyWjL8-iyuYM9LfVc9RoA9VK=+3vpuEkez2q3kg@mail.gmail.com>
Content-Language: en-US
From: Eli Schwartz <eschwartz@gentoo.org>
Autocrypt: addr=eschwartz@gentoo.org; keydata=
 xjMEZmeRNBYJKwYBBAHaRw8BAQdAYNZ7pUDWhx1i2f3p6L2ZLu4FcY18UoeGC04Gq/khqwfN
 I0VsaSBTY2h3YXJ0eiA8ZXNjaHdhcnR6QGdlbnRvby5vcmc+wpYEExYKAD4WIQTvUdMIsc4j
 CIi+DYTqQj6ToWND8QUCZoRL+gIbAwUJBKKGAAULCQgHAwUVCgkICwUWAgMBAAIeBQIXgAAK
 CRDqQj6ToWND8aB5AP9r4kB691nNtNwKkdRiOdl7/k6WYzokvHvDamXxRJ0I+gEAjZqR5V8y
 mfR3fy2Z+r2Joeqdt3CIv5IwPs64spBvigLOOARmZ5E0EgorBgEEAZdVAQUBAQdATT46Z06b
 1X9xjXFCYFxmq/Tj3tSEKZInDWTpoHQp4l8DAQgHwn4EGBYKACYWIQTvUdMIsc4jCIi+DYTq
 Qj6ToWND8QUCZmeRNAIbDAUJBKKGAAAKCRDqQj6ToWND8a2RAP40KPfbfoiZAJW5boFmFJ3G
 TUBDJRh9CWHyaPqq2PN+0wD/R07oLzfnJUN209mzi9TuTuHjeZybysyqXSw4MAxkMAY=
In-Reply-To: <CAL_JsqLdMRrtyWjL8-iyuYM9LfVc9RoA9VK=+3vpuEkez2q3kg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KkV60DqUvPjlNGCzktjJqBSm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KkV60DqUvPjlNGCzktjJqBSm
Content-Type: multipart/mixed; boundary="------------vXyDsaEYyY0O9Os3QNBTBXFv";
 protected-headers="v1"
From: Eli Schwartz <eschwartz@gentoo.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org
Message-ID: <b6965087-26a8-4f6a-b06e-75c009ee322e@gentoo.org>
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
References: <20250317004056.14564-1-eschwartz@gentoo.org>
 <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>
 <767597b0-c812-4ddb-9caf-bd051ef202d0@gentoo.org>
 <CAL_JsqLdMRrtyWjL8-iyuYM9LfVc9RoA9VK=+3vpuEkez2q3kg@mail.gmail.com>
In-Reply-To: <CAL_JsqLdMRrtyWjL8-iyuYM9LfVc9RoA9VK=+3vpuEkez2q3kg@mail.gmail.com>

--------------vXyDsaEYyY0O9Os3QNBTBXFv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/18/25 1:02 PM, Rob Herring wrote:
>> Meson *is* "the python way", for what it's worth, as it's a genuine
>=20
> As a backend, yes it seems so, but I meant as a front-end where users
> run pip (or historically setup.py) rather than running ninja to run
> pip or setup.py. But looks like with this patch meson works as both
> the front-end and back-end. All news to me really, as pretty much
> nothing I've read on how to create and/or install python projects
> mentions meson, but it's certainly a moving target with setup.py,
> setup.cfg, pyproject.toml...


It is a bit confusing, but I think that's mostly a PR thing.

For a bit of context here:

Way back in the old day, setup.py was a second-stage cross platform
"basically a Makefile" for cpython itself. The cpython standard library
bootstrapped itself far enough to run a script called setup.py which
built the rest of the standard library C modules, in part because
writing this logic in python meant they didn't have to do it twice, once
in a unix makefile and once in a Windows VS solution file.

Naturally, shipping "basically a Makefile" in the standard library so
you could build the standard library, was an attractive idea to others
who wanted to build third-party python modules. Free build system! Runs
on Windows without GNU Make! So people used it, and the PyPI ecosystem
grew up around it, and setuptools was created to add some extra commands
for `setup.py`, especially since not all functionality was needed by the
standard library but was needed by third-party modules.

Along the way, setup.cfg was invented. It's an ini file that you can use
instead of passing most arguments to setup() because it's easier to
configure metadata arguments via a config file rather than a python
program. "declarative config" is the big appeal. At a certain point they
also decided that ini files were too 2010s and wanted to shift to the
hot new thing, TOML. (Tom's non-obvious maximalist language)

Around the same time, people were feeling a bit let down by this
glorious hack of unintended functionality (a stdlib portable Makefile
retrofitted as a packaging standard) and especially setuptools was
relatively very slow if all you had was pure *.py scripts, so they
invented some alternative wheel builders (flit and poetry) and
eventually decided to make a formal spec that would allow "pip install"
to stop assuming everything is a setup.py

Basically, they tried to reinvent linux distro build recipes I guess?

So, pyproject.toml fulfills two roles:

- it has the metadata-only parts of setup.py, all declarative

- it tells pip what the python module contains a "build_wheel" function
  that knows how to build this particular package


For us, that latter one is meson-python. It's a tiny python script that
knows how to run the "meson" program, invoke ninja as needed, and tar up
the results in a wheel file. All the real work aside for packaging is
done by meson.

Setuptools, naturally, provides its own "build_wheel" function (and you
will no doubt be shocked to learn it executes `python3 setup.py
bdist_wheel`).

The moving target was years ago. These days the confusion is all about
everyone inventing their own "build_wheel" functions now that they are
allowed to. Most of them do exactly the same thing as each other, but
rewritten from scratch with slightly different spelling (or in some
cases their explanation is that they needed to create a new fork because
they "need to be able to control the quality of the error messages")
rather than rely on existing, proven tools such as meson, autotools, or
cmake.


It is what it is. For us, meson-python is only just enough of a thin
wrapper to convert the results of "meson install" into a wheel file,
which is simply format shifting.


>> python build system, no wrapper :)=20



--=20
Eli Schwartz

--------------vXyDsaEYyY0O9Os3QNBTBXFv--

--------------KkV60DqUvPjlNGCzktjJqBSm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTnFNnmK0TPZHnXm3qEp9ErcA0vVwUCZ9ppZgUDAAAAAAAKCRCEp9ErcA0vV9Xf
AP0ZtGSYoIUN/SJw9FW18+OVc1eei5pkqIQtG/knpj1YBAD/Vj5aedl0DlLCexy06p7xCNxNV4Bf
SvfKRkNa4hrxrgs=
=d6Jz
-----END PGP SIGNATURE-----

--------------KkV60DqUvPjlNGCzktjJqBSm--
