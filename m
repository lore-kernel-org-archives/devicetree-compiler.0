From: Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/4] Improve pylibfdt python packaging
Date: Thu, 11 Nov 2021 09:22:56 -0500
Message-ID: <bcce25e8-cee3-0ad7-625c-a5a887ab373a@xilinx.com>
References: <20211111011135.2386773-1-robh@kernel.org>
 <YYyQ747Z6EeGIg0s@yekko>
 <CAL_JsqJ1gSzVH1OYU6kPCYDfg32j8whCKaOmo2VU8hsUFsJZuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRKIykSDeJ9HtsAlcVaIodsPS/GEFocYfTNi6U53/OM=;
 b=l/WMj/Ix8Qgmh3p6KGabKMHCqpGGjejMIFdnhopiT3oawkW4okJlUiRdG1BOzs2ypAB1eGQEWd0DMeYYrge4VseMKCmeV2kZghz84qw78MFw9m2zG+DB9IOtyHeaB38VEaDimA9OcerzWzSVG07nVcNTnptKebHiwJSgXwSOj4s=
In-Reply-To: <CAL_JsqJ1gSzVH1OYU6kPCYDfg32j8whCKaOmo2VU8hsUFsJZuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

On 11/11/2021 9:08 AM, Rob Herring wrote:
> On Wed, Nov 10, 2021 at 9:41 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>
>> On Wed, Nov 10, 2021 at 07:11:31PM -0600, Rob Herring wrote:
>>> I'm interested in getting pylibfdt into PyPI and ran into a few issues
>>> with pylibfdt using the python packaging tools. Primarily, pip didn't
>>> work nor did setup.py sdist and bdist_wheel subcommands. This series
>>> fixes those issues.
>>>
>>> I've left meson calling setup.py intact for now, but think it's the
>>> wrong way around. In fact, there's actually some efforts to make meson
>>> the backend for pip/setuptools. I made several attempts to completely
>>> eliminate putting files in the source tree without success. Also, I
>>> noticed a meson install builds pylibfdt twice (though make may too).
>>>
>>> I don't think I broke anything. Tests and installs both work with make
>>> and meson.
>>
>> Applied, it certainly looks better to me.
>>
>> However, I've just spotted another nasty problem.  I think it must
>> have started with moving to Fedora 35 on my laptop.  A bunch of the
>> Python tests now fail like this:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ERROR: testGetIntProperties (__main__.PyLibfdtBasicTests)
>> Test that we can access properties as integers
>> ----------------------------------------------------------------------
>> SystemError: PY_SSIZE_T_CLEAN macro must be defined for '#' formats
>>
>> The above exception was the direct cause of the following exception:
>>
>> Traceback (most recent call last):
>>    File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 378, in test=
GetIntProperties
>>      self.assertEqual(0xdeadbeef, self.get_prop("prop-hex32").as_uint32(=
))
>>    File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 374, in get_=
prop
>>      return self.fdt2.getprop(0, name)
>>    File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 451, in ge=
tprop
>>      pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_na=
me),
>>    File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 1279, in f=
dt_getprop
>>      return _libfdt.fdt_getprop(fdt, nodeoffset, name)
>> SystemError: <built-in function fdt_getprop> returned a result with an e=
xception set
>>
>> Any ideas?
>=20
> Python 3.10? Only guessing because I'm on 3.9. Otherwise, I have no clue.
>=20

FWIW, and in case you haven't already sorted it out.

We just fixed this in the yocto integration of dtc/libfdt this
morning (I case the patch hasn't made it upstream to you yet).

It is indeed python 3.10, and in particular:

https://docs.python.org/3.10/whatsnew/3.10.html#id2

(and again, a patch should arrive shortly if it hasn't already).

Cheers,

Bruce

> I was going to look at making '.setup.py test' work as testing is
> intertwined with meson too. Most python CI testing runs against a
> matrix of python versions which would help here.
>=20
>> Also, Rob, did you have patches to finish the conversion of the
>> Makefiles to wrappers around meson?
>=20
> That was Marc-Andr=C3=A9...
>=20
>> If so, I'm sorry I've lost track
>> of them.  Can you repost please?
>=20
> One of the issues you had with Travis CI. Are you still using Travis
> CI after their move? I found it easier to just move to GH workflows
> than move given I always seem to hit login token issues (maybe that's
> just group projects with multiple users).
>=20
>> That README addition with meson
>> native building instructions would also be really good to have.
>=20
> I can look at that. It's gotten a bit more straight-forward with newer
> meson versions as you don't have to run ninja directly. So it is just:
>=20
> One-time init:
> meson <builddir>
>=20
> And then:
> meson compile|test|install -C <builddir>
>=20
> (I find specifying the builddir every time pretty annoying. Guess I
> need a wrapper script.)
>=20
> Rob
>=20

