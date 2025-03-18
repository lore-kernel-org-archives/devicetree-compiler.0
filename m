Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F620E32D
	for <devicetree-compiler@vger.kernel.org>; Tue, 18 Mar 2025 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308621; cv=none; b=eT7QxMcLoR8SXyuo3I7sgoT4r/7RXzXVemWLU1EXKteHXImGnsHVkBvqP/30NvQn5OOYO4PtaL3v158h+4Dlh4xoQZ+Fbqz5RmxCnWMWApNFXnKwmQMrmpgAokNVvgbCXlm1ypa6TbUX5nLLjiK5LzVBNR1Sf3z502trCa7/ZPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308621; c=relaxed/simple;
	bh=FxSZKIvI5bVlCUX8puEwTvpglGART54pYhKm5ublePI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eg/GSriSTAutJxwincVvI+GsJ3xaxT0LqjR9b+OWToDJi/FrLQa44w2W65mVkxm3iXnq0rzE+6SOe9XgbusM/c4Ej2Vcx2tXTTvuVuovr+mjk7fzQfZcYRuQGnv8xY0T0rM2tmJyaPOrMngGdGnDCoKxb9H0CIKU71ohqm802JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [IPV6:2603:6011:3f0:6f00::12ac] (unknown [IPv6:2603:6011:3f0:6f00::12ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: eschwartz)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 56A623430E7;
	Tue, 18 Mar 2025 14:36:59 +0000 (UTC)
Message-ID: <767597b0-c812-4ddb-9caf-bd051ef202d0@gentoo.org>
Date: Tue, 18 Mar 2025 10:36:55 -0400
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
In-Reply-To: <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K6I0X3GE3rIf2xGOGLET4Ydf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K6I0X3GE3rIf2xGOGLET4Ydf
Content-Type: multipart/mixed; boundary="------------bQjV8pe0cFjaLXnATl7lDUe4";
 protected-headers="v1"
From: Eli Schwartz <eschwartz@gentoo.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org
Message-ID: <767597b0-c812-4ddb-9caf-bd051ef202d0@gentoo.org>
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
References: <20250317004056.14564-1-eschwartz@gentoo.org>
 <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>

--------------bQjV8pe0cFjaLXnATl7lDUe4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/18/25 10:15 AM, Rob Herring wrote:
> On Sun, Mar 16, 2025 at 7:42=E2=80=AFPM Eli Schwartz <eschwartz@gentoo.=
org> wrote:
>>
>> We get full build parallelism and fewer confusing ancient distutils
>> paths. The python wheels build fully standalone, including linking
>> libfdt as a static library.
>>
>> For convenience, when running pip install a meson option is passed tha=
t g
>> prevents building tools or installing headers/pkgconfig files.
>> meson-python would otherwise include them in the wheel itself, in case=

>> they are needed, but this is essentially a bit useless so don't bother=
=2E
>=20
> This is great as building a sdist that can be uploaded to pypi works.
> I've been maintaining a separate repo solely for that purpose.


Interestingly, the one you uploaded to PyPI seems to be called something
different from the name in setup.py and which I reused for pyproject.toml=
 :)


>> Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
>> ---
>>  MANIFEST.in          | 12 ------
>>  libfdt/meson.build   | 32 ++++++++-------
>>  meson.build          |  3 +-
>>  meson_options.txt    |  2 +
>>  pylibfdt/meson.build | 28 ++++++++-----
>>  pyproject.toml       | 25 ++++++++++++
>>  setup.py             | 97 -------------------------------------------=
-
>=20
> Isn't removing this going to break make based builds as that calls
> setup.py directly? Personally, I think that's fine because I think
> python things should be built "the Python way", rather than trying to
> wrap them in make or meson. David didn't agree though. I think the
> only somewhat sane path is making the make support purely a wrapper to
> call meson so we're not maintaining 2 parallel build systems.


Ah yes, that's true.

Meson *is* "the python way", for what it's worth, as it's a genuine
python build system, no wrapper :) but I do think it's not worth
supporting make as a route for the python bindings since Make can't
actually build the python code at all. Also, if you're interested in
python bindings you can afford to have python installed, and
consequently, to invoke a build system (meson) written in python.

I have no strong opinions about whether to maintain Makefile rules for
building pure C code.

I'm not really sure that people building python bindings will need a
Make rule that just runs meson...



--=20
Eli Schwartz

--------------bQjV8pe0cFjaLXnATl7lDUe4--

--------------K6I0X3GE3rIf2xGOGLET4Ydf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTnFNnmK0TPZHnXm3qEp9ErcA0vVwUCZ9mFBwUDAAAAAAAKCRCEp9ErcA0vV3I3
AQD8I7zdzbihOBIQS0pf8WEaZuk7eYgQK0MlnVuap8YcmAD/Ryl5j2Wmi2spP+HaiR5udbaSGUZU
SdphrX6StGFy4AI=
=r14j
-----END PGP SIGNATURE-----

--------------K6I0X3GE3rIf2xGOGLET4Ydf--
