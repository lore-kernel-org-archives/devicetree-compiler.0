From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add a couple of string-related functions
Date: Thu, 1 Oct 2015 10:24:20 +0200
Message-ID: <20151001082420.GE3070@ulmo>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
 <20150930033132.GD13035@voom.fritz.box>
 <20151001081043.GC3070@ulmo>
 <20151001082342.GD3070@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=/YQD5b+N+XBDWhmiFGoOicotPEp0REZ9WY7/eoBpHiY=;
        b=ALwLQVQWIs+bb2jdrX0wTOhPxMbYSe4+54ponMOt3PBM8MlHYDMaOBkxO/6Sx9yMDA
         tCL9O6A1l7SQdUqlXUeIBzbrKD8QYyHzFmnfTZLD09Ankiq4aug36Z5yQAwV0F702ul6
         /3kkNt146klHmDybal0HTQau1qUuZQDMPA47FeRDKTvgNqbXel0nhp2J9+YYLmDAf9WW
         Lqa45fh/g077RSIy/MsHwqhF7E1CsLeKnqA/SfSv7OKijhJnG01hjj8JRAB3pF0vKNdS
         kdtsLEJ05F1jPSwa8VSvt+J2PN4r9TyCMtgHk9+FSsTcMo8PwckpOjgyHAQ5jwuKlugp
         O74A==
Content-Disposition: inline
In-Reply-To: <20151001082342.GD3070@ulmo>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 10:23:42AM +0200, Thierry Reding wrote:
> On Thu, Oct 01, 2015 at 10:10:43AM +0200, Thierry Reding wrote:
> > On Wed, Sep 30, 2015 at 01:31:32PM +1000, David Gibson wrote:
> > > On Tue, Sep 29, 2015 at 11:09:05AM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > These three patches add a couple of string functions that have prov=
en
> > > > useful in U-Boot's copy of libfdt, so they are likely to be useful =
for
> > > > other users as well.
> > > >=20
> > > > Patch 1 adds a function to count the number of strings in a propert=
y's
> > > > value. This also adds a new DTS sample along with a small test prog=
ram
> > > > to validate the implemented functions.
> > > >=20
> > > > Patch 2 adds a function to retrieve the index of a given string in =
any
> > > > given property's value. This adds code to the test program introduc=
ed in
> > > > the previous patch to exercise the new functionality.
> > > >=20
> > > > Patch 3 adds a function to retrieve a string by index from a proper=
ty's
> > > > value. This extends the test program introduced in patch 1 to valid=
ate
> > > > the new functionality.
> > >=20
> > > Thanks, I've applied this.
> > >=20
> > > I did end up making a couple of small changes.
> > >=20
> > > First, I forgot to say earlier that I also wanted to change the
> > > testcase name to stringlist* for clarity.
> >=20
> > Okay, makes sense.
> >=20
> > > Second, Travis CI picked up some -Wshadow warnings: in a bunch of
> > > places you were using 'index' as a variable name, which shadows the
> > > libc index(3) function.  I'm not sure why that didn't show up on a
> > > local "make check", but in any case I've changed thos to 'idx' to fix
> > > it.
> >=20
> > As far as I can tell that's because index(3) is declared in strings.h on
> > my system (the file ships with the GNU libc 2.22) and that header file
> > isn't included from anywhere. Perhaps your system differs from that?
> >=20
> > Actually there's also a prototype for index(3) in string.h on my system
> > but it is guarded with an #ifdef __USE_MISC, and upon closer inspection
> > that does get set, so the index(3) symbol should be available. No idea
> > why I don't get a warning, though, -Wshadow is definitely getting passed
> > to the compiler.
>=20
> Ah, some further digging shows that this behaviour was changed in GCC
> 4.8 (search for -Wshadow):

Oops, there should have been a link here:

	https://gcc.gnu.org/gcc-4.8/changes.html

Thierry

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWDO20AAoJEN0jrNd/PrOhMjEQAJqlBdbR/bWWOqMzlnyeju/q
vcqQlB5AujRgCEBGKilXU3S1aRM84XzDempeapsIv0HU3J/vATqq+8YYj9Du+CUd
Wl2OPogMMqhOSFXHlyA8xfc2vkLz9OPJx+tDJInK7SrXhBeBMkxwt4DNWYPAHw6X
TgdQK/TGX361/Ye7L1RKXEooFB+pi813g82IjYZE/C5/sZq8tbDgt8Jq4rxL/hRg
77x/+9x28w/Hkc+AEMHq1uyig0s1JivGEEjoMXIwarZe6cdLCeJlenx9+jBGNHxF
0LQY6Kop9zESlG2psytUfYvXifhKHurVK5MfbO2kDJzD5UNWG8e2e2Ubb4yH3v8H
xfAE/KyGNMNaF0dT1W3/TosJixRm1fY1fkGYJ2AM9KmJ+LKLrlmY9P0b6hbmUwmt
9VnpUEryd4bk8OKmJ4lLMCz4CNKIXN5to0IdkOUYu1oHKac8oyMrB2xQhTotKGwz
1ENFE/nMcPV/6mah8AkaOxxNeZ7F8fFd7NAikgb/1+Hvdnp8ONUWv6val2H14LWi
/1lRqJtouDJinJ8+G6Fh5WdcHfEUQljhDhF+UVpGGP4ciwyQZEQubd858najwKFU
js2lJrZp/hnpzptdaPwhWh4qF+7ziD6WzNMB9xOFCJ0W/9YW/Xmi44tZK45pTnRA
bilugEhOnrzFWCkmAMli
=wvgb
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--
