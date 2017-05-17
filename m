From: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] dtc: check.c fix compile error
Date: Wed, 17 May 2017 07:42:17 -0600
Message-ID: <8529b242-346a-7293-5629-ed1dfa4e0652@osg.samsung.com>
References: <20170516160808.8075-1-shuahkh@osg.samsung.com>
 <20170517021218.GC15596@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="s1tsq11jxJ28h8waPNrfiTWpxiEVbgT8s"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170517021218.GC15596-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s1tsq11jxJ28h8waPNrfiTWpxiEVbgT8s
Content-Type: multipart/mixed; boundary="5PHoNqruu2UEdpaRX4DoeAHSFXDLCXeuA";
 protected-headers="v1"
From: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Message-ID: <8529b242-346a-7293-5629-ed1dfa4e0652-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] dtc: check.c fix compile error
References: <20170516160808.8075-1-shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
 <20170517021218.GC15596-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
In-Reply-To: <20170517021218.GC15596-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>

--5PHoNqruu2UEdpaRX4DoeAHSFXDLCXeuA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

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

Thanks David,

-- Shuah
>=20
>> ---
>>  checks.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/checks.c b/checks.c
>> index 5adfc8f..6dfb82f 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -873,7 +873,7 @@ static void check_simple_bus_reg(struct check *c, =
struct dt_info *dti, struct no
>>  	while (size--)
>>  		reg =3D (reg << 32) | fdt32_to_cpu(*(cells++));
>> =20
>> -	snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
>> +	snprintf(unit_addr, sizeof(unit_addr), "%llx", reg);
>>  	if (!streq(unitname, unit_addr))
>>  		FAIL(c, dti, "Node %s simple-bus unit address format error, expecte=
d \"%s\"",
>>  		     node->fullpath, unit_addr);
>=20



--5PHoNqruu2UEdpaRX4DoeAHSFXDLCXeuA--

--s1tsq11jxJ28h8waPNrfiTWpxiEVbgT8s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJZHFNGAAoJEAsCRMQNDUMcSUoP/3uQeIiJX5FxYIOlXDvdPWEx
5t4jjqpmnlFlE8qoaBTMx0Q+4Ie3tmllZnCmUUiyNDxC3BM0WFff9gw6pbj7S9Un
3iNcUYxQYWmIonYQUCFTYsjcyn0cDWhiMcoIuoi9j0Iy/48Q8vBqvuWIdlSeQPZL
Izqsz1b2J2hid8Khzs3g+NxM+xAH6TGNtlQvYlaTDb1VVDalKy8b8BNsT8+OsF6E
veJGZbeRI5ryvXKWUGgBomfpfGmkuMxA/FiqktAQZXaV+rDCPeyZp6nBI9Yur7lZ
29hJf6IkM0omd19ZngftVZ9N9pQPYVyrBTCN7QMOhrvOc0kD+AmcbLToRtmOerJw
YaZWkU4oiy1Kcm/GqoqnpPcudsD5vcNPkh+py6psy/rg40At5SVdIsUxx+XdC6xU
F1+HVlFJ7olRrg2fSN12BKu4yzMHpauxbaGe2OOgkydSz2iIl9t1kWkrxcbwPOQf
EDB1aBb2QuoafZUfHsEp5n7Phd0pLR8car6r8q+/pWWkGHyihpe1GGLmauOcY1Wb
sxJVMm5kl+pkwEsCpfT4qgt5Qsrm4I38HLrjZ4WfGrQ8MDRGYJO5CKBoIk9oLsvu
K35wnnOsCIwl2N6U00xZ7nTqGiZfAGbIGKChoJtQV4+u3zn9EfqFsU4Ox/uaGvfG
x6VIPwKbdQU06v6LxUlF
=aMqs
-----END PGP SIGNATURE-----

--s1tsq11jxJ28h8waPNrfiTWpxiEVbgT8s--
