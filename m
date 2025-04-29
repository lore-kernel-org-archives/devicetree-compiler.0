Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D35C2D1
	for <devicetree-compiler@vger.kernel.org>; Tue, 29 Apr 2025 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890468; cv=none; b=b6ho0153boPe5/5ilD1P5QnqHQ5AwX4kC6Gb2G25qELDCXJ0CbGnvQzhsquDe0EURbMsj24a1ojIfaHiAXLeAiU3buPbYiv/Yc/1YyrYjtKmSFkGT/tepuDIRxGbDP6XYnWc81IxmPsE4m0oYoiGiRyraLAWyBV6YLPpq/fWrZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890468; c=relaxed/simple;
	bh=kYgr7WIYZgetsZriN9ePaLBYMLzZzIyJ+V+gT9I5XtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aijZcLc3ndttqgBl4xgvqWetUCHkKjl7OE+Cu2OuYNF9b61dCMvi8fKKHq3POT1UnwO01KrTz3mftvxNnnC8xk6i4V3cVdumjP+yCReXfqO1/TiEBE/RAEeCUYjRlv/i2TLPIx6mnbKUt7vNGz1h9SaGM/+kD8CZYXzs8AVLtMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [IPV6:2603:6011:3f0:6f00::12ac] (unknown [IPv6:2603:6011:3f0:6f00::12ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: eschwartz)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2B86E342FA9;
	Tue, 29 Apr 2025 01:34:26 +0000 (UTC)
Message-ID: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
Date: Mon, 28 Apr 2025 21:34:22 -0400
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
References: <20250317004056.14564-1-eschwartz@gentoo.org>
 <Z9pcREBBRThiamcB@zatzit> <71826390-c019-4a8c-9290-2d6ae9a4105d@gentoo.org>
 <aAtAQGz4HjrlR4-5@zatzit>
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
In-Reply-To: <aAtAQGz4HjrlR4-5@zatzit>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------se0gr2kRTjgI206mthXrp8h0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------se0gr2kRTjgI206mthXrp8h0
Content-Type: multipart/mixed; boundary="------------QlLxVWOMD01hURyE2RHSbNcQ";
 protected-headers="v1"
From: Eli Schwartz <eschwartz@gentoo.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Message-ID: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
References: <20250317004056.14564-1-eschwartz@gentoo.org>
 <Z9pcREBBRThiamcB@zatzit> <71826390-c019-4a8c-9290-2d6ae9a4105d@gentoo.org>
 <aAtAQGz4HjrlR4-5@zatzit>
In-Reply-To: <aAtAQGz4HjrlR4-5@zatzit>

--------------QlLxVWOMD01hURyE2RHSbNcQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/25/25 3:56 AM, David Gibson wrote:
> Sorry, I haven't replied to this for ages.  I've had a lot of stuff
> going on, both at work and otherwise.


No problem. I myself had low availability because your message came in
at the tail end of my holidays. :)


> On Wed, Mar 19, 2025 at 02:30:17AM -0400, Eli Schwartz wrote:
>> On 3/19/25 1:55 AM, David Gibson wrote:
>>
>>>> diff --git a/MANIFEST.in b/MANIFEST.in
>>>> deleted file mode 100644
>>>> index 904d124..0000000
>>>> --- a/MANIFEST.in
>>>> +++ /dev/null
>>>> @@ -1,12 +0,0 @@
>>>> -# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
>>>> -
>>>> -global-exclude *
>>>> -include README.md
>>>> -include GPL
>>>> -include BSD-2-Clause
>>>> -include setup.py
>>>> -include pylibfdt/libfdt.i
>>>> -include libfdt/libfdt.h
>>>> -include libfdt/fdt.h
>>>> -include libfdt/libfdt_env.h
>>>> -include VERSION.txt
>>>
>>> We can't just delete the MANIFEST.in and setup.py, for now, because
>>> they're still needed for the Makefile build.  I'm certainly
>>> considering dropping support for make, but we're not there yet.
>>
>> If, as discussed in the previous emails, we drop support for *building=

>> python from Make* but don't drop Make for C, is that acceptable?
>=20
> I'm conflicted.  I don't really like the idea of making make work for
> only some things, without just removing it completely, or at least
> having a concrete plan to do so.  On the other hand, I'd really like
> to get rid of the confusing setuptools gunk.
>=20
> How about this: could you author a patch deprecating make, which
> prints a message saying so if you build with make (anything, not just
> the Python pieces).  It should say that meson is preferred and give
> example meson commands to use instead.
>=20
> If we start with that, then I'd be ok making the Python build meson
> only, followed by the changes you're suggesting here.


I can do this, yes. In order to avoid the situation where a phony target
is used as a dependency of all targets, leading to one or the other of:

- it is never "up to date", so every target depending on it is
  continually rebuilt
- add "stamp files" which clutter up the source tree to record that a
  warning was issued


I can use GNU Make's $(warning), which emits output as a side effect of
executing the Makefile. Not perfectly ideal as it prints on every build,
not just the first one, but...


--=20
Eli Schwartz

--------------QlLxVWOMD01hURyE2RHSbNcQ--

--------------se0gr2kRTjgI206mthXrp8h0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTnFNnmK0TPZHnXm3qEp9ErcA0vVwUCaBAsngUDAAAAAAAKCRCEp9ErcA0vV1EU
AQC/+ED04yjnbFRqOjvN7pbICmH9HrTEZ6tAAIqoIB2UFQD+IjfIbOMEpZBUQhIb2mj0ba0/p0ls
5e7F7Kf453DuqQU=
=wCQl
-----END PGP SIGNATURE-----

--------------se0gr2kRTjgI206mthXrp8h0--
