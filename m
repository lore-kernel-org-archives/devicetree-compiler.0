Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA3AD2C
	for <devicetree-compiler@vger.kernel.org>; Wed, 19 Mar 2025 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365822; cv=none; b=ZXJpKnIxaqAJ+MAhl9SnIT1QmstVVjUygezvPPYFwn5b2ldVjCGBRmv12xaniyCMCc4HZe7y8gdt6qv+MVOSLUV2oOdNL/0dSwUGZMTOySCdOJKmMud3RHn1nDFlHt/2aTZoe5AnbNE/pHqTwMxwipFpK1eicDQoIXqfig/Ntw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365822; c=relaxed/simple;
	bh=h2fvY93GgA3SJ2SYhsCWTL4bwUpVT+If/YltjSIonO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjX/gR4Eh12F+g3+n85RmQqhV16+76omNFVftlw2gDaDL5r02SPsuk8IhKHpMBawAv7rzwxQulUmEgZZRDIZzhBTG5Dt126YV/06Q1RpGQXHssU2YOCfR+fg1o7+2uO9TwVZHCS7wq6B/sTyOTEqn0VrJarvwV4U2LyIf/LzuMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [IPV6:2603:6011:3f0:6f00::12ac] (unknown [IPv6:2603:6011:3f0:6f00::12ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: eschwartz)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BC3F3343016;
	Wed, 19 Mar 2025 06:30:19 +0000 (UTC)
Message-ID: <71826390-c019-4a8c-9290-2d6ae9a4105d@gentoo.org>
Date: Wed, 19 Mar 2025 02:30:17 -0400
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
 <Z9pcREBBRThiamcB@zatzit>
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
In-Reply-To: <Z9pcREBBRThiamcB@zatzit>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8f0fXAHCfNXBKwSxv9OHf0gh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8f0fXAHCfNXBKwSxv9OHf0gh
Content-Type: multipart/mixed; boundary="------------YDZMS6RRO3vgASbfBXosH0b8";
 protected-headers="v1"
From: Eli Schwartz <eschwartz@gentoo.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Message-ID: <71826390-c019-4a8c-9290-2d6ae9a4105d@gentoo.org>
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
References: <20250317004056.14564-1-eschwartz@gentoo.org>
 <Z9pcREBBRThiamcB@zatzit>
In-Reply-To: <Z9pcREBBRThiamcB@zatzit>

--------------YDZMS6RRO3vgASbfBXosH0b8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/19/25 1:55 AM, David Gibson wrote:

>> diff --git a/MANIFEST.in b/MANIFEST.in
>> deleted file mode 100644
>> index 904d124..0000000
>> --- a/MANIFEST.in
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
>> -
>> -global-exclude *
>> -include README.md
>> -include GPL
>> -include BSD-2-Clause
>> -include setup.py
>> -include pylibfdt/libfdt.i
>> -include libfdt/libfdt.h
>> -include libfdt/fdt.h
>> -include libfdt/libfdt_env.h
>> -include VERSION.txt
>=20
> We can't just delete the MANIFEST.in and setup.py, for now, because
> they're still needed for the Makefile build.  I'm certainly
> considering dropping support for make, but we're not there yet.


If, as discussed in the previous emails, we drop support for *building
python from Make* but don't drop Make for C, is that acceptable?


>> diff --git a/libfdt/meson.build b/libfdt/meson.build
>> index c2f4bd6..9c6ef54 100644
>> --- a/libfdt/meson.build
>> +++ b/libfdt/meson.build
>> @@ -31,7 +31,7 @@ libfdt =3D library(
>>    version: meson.project_version(),
>>    link_args: link_args,
>>    link_depends: 'version.lds',
>> -  install: true,
>> +  install: get_option('default_library') !=3D 'static' or not wheel_o=
nly,
>=20
> The first clause doesn't quite make sense to me.  Why would we not
> install a static library?


Read this the other way around.

We *do* install, if either (or both) conditions are true:

- we are building a non-static library, so we certainly need it at
  runtime (thus it has to be installed at runtime)

- we are NOT building a special wheel-specific build, which is to say,
  we assume we need this installed if we aren't running from pip install


i.e. the purpose of this is that we assume the end goal for python
wheels is as I'm going to describe in the latter half of this email, and
this specific conditional over here is just trying to detect "PyPI mode".=



>> +[tool.meson-python.args]
>> +'setup' =3D ['-Ddefault_library=3Dstatic', '-Dwheel-only=3Dtrue']
>=20
> Shouldn't the python library use the shared library, at least by
> default?


This isn't about building the python library. If I'm building the python
library, I just use "meson setup" like normal, and it builds the full
dtc stack, including tools, library, python bindings and all.

meson-python is *specifically* about building a python wheel. Python
wheels have two choices:

- the shared library is copied into the wheel
- don't use the shared library

Without setting these options, a wheel uploaded to PyPI ends up looking
like this:

$ bsdtar -tf dist/libfdt-1.7.2-cp312-cp312-linux_x86_64.whl
libfdt-1.7.2.dist-info/METADATA
libfdt-1.7.2.dist-info/WHEEL
=2Elibfdt.mesonpy.libs/libfdt.so.1.7.2
=2Elibfdt.mesonpy.libs/pkgconfig/libfdt.pc
libfdt-1.7.2.data/scripts/convert-dtsv0
libfdt-1.7.2.data/scripts/dtc
libfdt-1.7.2.data/scripts/fdtdump
libfdt-1.7.2.data/scripts/fdtget
libfdt-1.7.2.data/scripts/fdtput
libfdt-1.7.2.data/scripts/fdtoverlay
libfdt-1.7.2.data/scripts/dtdiff
libfdt.py
_libfdt.cpython-312-x86_64-linux-gnu.so
libfdt-1.7.2.data/headers/fdt.h
libfdt-1.7.2.data/headers/libfdt.h
libfdt-1.7.2.data/headers/libfdt_env.h
libfdt-1.7.2.dist-info/RECORD

And,

$ readelf -d _libfdt.cpython-312-x86_64-linux-gnu.so

    Library runpath: [$ORIGIN/.libfdt.mesonpy.libs]

This is all necessary since pip install can't know that libfdt is
already installed via a package manager (dpkg, rpm, portage, pacman,
xbps, apk, etc), so it has to ship its own just in case.

Building statically simplifies distribution as a PyPI wheel.

If you really want to build bloated wheels, you can still do it:


python -m build --wheel \
    -Csetup-args=3D-Ddefault_library=3Dstatic \
    -Csetup-args=3Dwheel-only=3Dfalse



By the way, the locations that the files get installed to when building
via pip aren't great either. The *.data/headers/ gets installed to

/usr/include/python3.12/libfdt/

and the library and pkg-config files end up in

/usr/lib/python3.12/site-packages/.libfdt.mesonpy.libs/libfdt.so.1.7.2
/usr/lib/python3.12/site-packages/.libfdt.mesonpy.libs/pkgconfig/libfdt.p=
c

The pkg-config file doesn't even get remapped, it still says
-I/usr/include and -L/usr/lib64

If you install with pip install --user (default when not running with
sudo), then you even end up with this:


    /home/eschwartz/.local/bin/convert-dtsv0
    /home/eschwartz/.local/bin/dtc
    /home/eschwartz/.local/bin/dtdiff
    /home/eschwartz/.local/bin/fdtdump
    /home/eschwartz/.local/bin/fdtget
    /home/eschwartz/.local/bin/fdtoverlay
    /home/eschwartz/.local/bin/fdtput
    /home/eschwartz/.local/include/python3.12/libfdt/fdt.h
    /home/eschwartz/.local/include/python3.12/libfdt/libfdt.h
    /home/eschwartz/.local/include/python3.12/libfdt/libfdt_env.h

/home/eschwartz/.local/lib/python3.12/site-packages/.libfdt.mesonpy.libs/=
libfdt.so.1.7.2

/home/eschwartz/.local/lib/python3.12/site-packages/.libfdt.mesonpy.libs/=
pkgconfig/libfdt.pc

/home/eschwartz/.local/lib/python3.12/site-packages/_libfdt.cpython-312-x=
86_64-linux-gnu.so
    /home/eschwartz/.local/lib/python3.12/site-packages/libfdt.py


So yeah, IMO all of this cruft is out of place for pypi.org / pip.


Python packaging *cannot*, in any way shape or form be used outside of
its closed-in silo. They literally forbid, via their standards body, the
possibility of installing outside of the locations I described. The only
way to install to arbitrary locations the way Make or Meson can, is to
use what they describe as "the legacy install route" of running

```
python setup.py install
```

and then having the equivalent of Makefile

`cp XXXX ${DESTDIR}${PREFIX}/bin`

i.e. completely disrespecting the pip install approach.


The point of distributing on PyPI is so that people can get a
python-specific copy of the bindings easily, with a minimum of fuss, and
nothing else. You can always get the complete set using a real build
system and installing with "meson install" instead of pip, and usually
using a distro package manager even. But people installing via pip
install aren't necessarily interested in that. They just want to
download a binary package which their python scripts depend on.


--=20
Eli Schwartz

--------------YDZMS6RRO3vgASbfBXosH0b8--

--------------8f0fXAHCfNXBKwSxv9OHf0gh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTnFNnmK0TPZHnXm3qEp9ErcA0vVwUCZ9pkeQUDAAAAAAAKCRCEp9ErcA0vVxUF
APwK9GMFbwKN/3qr3Xmivq/duGbanLVAyIiwBbcCwXBMIAD9FE45+rfnX3qB2FGdbDqepqnrmQ+n
3gxygMdXD374DQE=
=HLp7
-----END PGP SIGNATURE-----

--------------8f0fXAHCfNXBKwSxv9OHf0gh--
