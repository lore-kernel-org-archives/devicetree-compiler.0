From: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] dtc: check.c fix compile error
Date: Wed, 7 Jun 2017 12:46:52 -0600
Message-ID: <db3a0ff9-bea2-4f6f-a1d6-34e8bc7ff44c@osg.samsung.com>
References: <20170516160808.8075-1-shuahkh@osg.samsung.com>
 <20170517021218.GC15596@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nT7x36qCahduUa0WCGrHQfQii8BvsGkbQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170517021218.GC15596-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nT7x36qCahduUa0WCGrHQfQii8BvsGkbQ
Content-Type: multipart/mixed; boundary="BwUUlG2KX53leI92k25CmWtvDm59D6hia";
 protected-headers="v1"
From: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Message-ID: <db3a0ff9-bea2-4f6f-a1d6-34e8bc7ff44c-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] dtc: check.c fix compile error
References: <20170516160808.8075-1-shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
 <20170517021218.GC15596-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
In-Reply-To: <20170517021218.GC15596-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>

--BwUUlG2KX53leI92k25CmWtvDm59D6hia
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi David,

On 05/16/2017 08:12 PM, David Gibson wrote:
> On Tue, May 16, 2017 at 10:08:08AM -0600, Shuah Khan wrote:
>> Fix the following compile error found on odroid-xu4:
>>
>> checks.c: In function =E2=80=98check_simple_bus_reg=E2=80=99:
>> checks.c:876:41: error: format =E2=80=98%lx=E2=80=99 expects argument =
of type
>> =E2=80=98long unsigned int=E2=80=99, but argument 4 has type
>> =E2=80=98uint64_t{aka long long unsigned int}=E2=80=99 [-Werror=3Dform=
at=3D]
>>   snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
>>                                          ^
>> checks.c:876:41: error: format =E2=80=98%lx=E2=80=99 expects argument =
of type
>> =E2=80=98long unsigned int=E2=80=99, but argument 4 has type
>> =E2=80=98uint64_t {aka long long unsigned int}=E2=80=99 [-Werror=3Dfor=
mat=3D]
>> cc1: all warnings being treated as errors
>> Makefile:304: recipe for target 'checks.o' failed
>> make: *** [checks.o] Error 1
>>
>> Signed-off-by: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>=20
> The bug is real, but the fix is only correct for some platforms (just
> as the original would only compile for some platforms).  I've adjusted
> to %zx which should be right for all platforms and applied.
This patch with %zx made it into Linux 4.12-rc4 and I am seeing these
warnings:

  HOSTCC  scripts/dtc/checks.o
scripts/dtc/checks.c: In function =E2=80=98check_simple_bus_reg=E2=80=99:=

scripts/dtc/checks.c:876:41: warning: format =E2=80=98%zx=E2=80=99 expect=
s argument of type =E2=80=98size_t=E2=80=99, but argument 4 has type =E2=80=
=98uint64_t {aka long long unsigned int}=E2=80=99 [-Wformat=3D]
  snprintf(unit_addr, sizeof(unit_addr), "%zx", reg);
                                         ^
scripts/dtc/checks.c:876:41: warning: format =E2=80=98%zx=E2=80=99 expect=
s argument of type =E2=80=98size_t=E2=80=99, but argument 4 has type =E2=80=
=98uint64_t {aka long long unsigned int}=E2=80=99 [-Wformat=3D]
  HOSTLD  scripts/dtc/dtc
  CHK     scripts/mod/devicetable-offsets.h


build doesn't fail, which is good. This probably needs fixing,
but since my fix using %llx fails on some platforms, I am just
reporting the problem, instead of attempting to fix.

thanks,
-- Shuah



--BwUUlG2KX53leI92k25CmWtvDm59D6hia--

--nT7x36qCahduUa0WCGrHQfQii8BvsGkbQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJZOEojAAoJEAsCRMQNDUMcrEYP/jbwkEhjW490Z+2KadBSgVnr
qImGXxMPCSOO3HIV/MAN9jxqbqvj2wgl2i+8owV5WydY4rjdxWwdsIZXg0zSV8QS
R6CGF15LqLXsTEMdxTfnqIG07DEqdRRwMqpfEXwO/YOwLUrjy+OIXlahMfwZK9Kl
61M6pJNEOoUygjatYDwutEzB/UXlCdFZ1WBd4/IKv2UoDGM4JvcHkHCJRZYPivh2
+DcUsD7P1PuCfz+ouBR61JasvpGijMSJsikDgxasaCfOO9SrIW95cHSVk49M0Twm
MZNY7eiOJ9+CwZj77BvIWytE5zT2y5432qdLWhw357PXDaAn6srxO1RmQxilnA3T
abZDNiL5YXh6dZiREDDTufG1N7sp/6Mds3B6D4fgsP1+tF64ev4UwT48uvXx5EwE
t21/adUjRj0j5GL94xzD0Ayf5Rx//Fiav1Kxr7EdBDtoy77W7S4ejLJKOjcoPny5
h+b2M9HD1giCokZq+yHsOXXyCNlxzKiKNIc8Kb6DKtMLL9KWLHfCeKS+9A/sSZ8F
OQwuuBbZrhpvSs7b1NzwZtjIrb/6+dq975kzrfhaWy+Ej9PE3obQtA202mqunS3z
8hVL5tRQ5hMLQeyQG/dO9s3d+egiXMfnP7yUEeVo4I236rsG9utwP5eoWNW/hBOl
q69HDYypmaJmpyq3Turt
=oLQI
-----END PGP SIGNATURE-----

--nT7x36qCahduUa0WCGrHQfQii8BvsGkbQ--
