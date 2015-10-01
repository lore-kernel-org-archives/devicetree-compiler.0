From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add a couple of string-related functions
Date: Thu, 1 Oct 2015 10:10:43 +0200
Message-ID: <20151001081043.GC3070@ulmo>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
 <20150930033132.GD13035@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=S0OorqaQQ2Cy/x4hkNaeBcvUxBgC+vMh1wcGBNpC7qU=;
        b=FaO+Ycs1+ciN0cslwQpaTu2OFpJsm785ExIi9pwng5yMEkoSzps36kcinnFDkQUTEX
         4rU2l0ZHcJFpgS5AP+0QnKDkBKBteUtjpRTgAYmhzREFjhHlbQ/mTpKZe+apskNdZvJe
         s2X4l9iYqEAFNX+lEP65Nd5l4IwWcetcJPWl0V2laj2F3LWCQ3w9dRIWm/2ZDukytP7N
         45Tn2Y6oi1NmcJgF+QKv6cBut8uTFZpJeYlxHYBMjNh7kbbgnGCKrBMTku8SsM1X9YsR
         x+VJqFsicHMQPQKcFeTSQ3khcn8tTE7Ww9j3LW2teOZDDZh9BfdMP9OWNi3NPZV3l6Vi
         z6Mw==
Content-Disposition: inline
In-Reply-To: <20150930033132.GD13035-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 01:31:32PM +1000, David Gibson wrote:
> On Tue, Sep 29, 2015 at 11:09:05AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > These three patches add a couple of string functions that have proven
> > useful in U-Boot's copy of libfdt, so they are likely to be useful for
> > other users as well.
> >=20
> > Patch 1 adds a function to count the number of strings in a property's
> > value. This also adds a new DTS sample along with a small test program
> > to validate the implemented functions.
> >=20
> > Patch 2 adds a function to retrieve the index of a given string in any
> > given property's value. This adds code to the test program introduced in
> > the previous patch to exercise the new functionality.
> >=20
> > Patch 3 adds a function to retrieve a string by index from a property's
> > value. This extends the test program introduced in patch 1 to validate
> > the new functionality.
>=20
> Thanks, I've applied this.
>=20
> I did end up making a couple of small changes.
>=20
> First, I forgot to say earlier that I also wanted to change the
> testcase name to stringlist* for clarity.

Okay, makes sense.

> Second, Travis CI picked up some -Wshadow warnings: in a bunch of
> places you were using 'index' as a variable name, which shadows the
> libc index(3) function.  I'm not sure why that didn't show up on a
> local "make check", but in any case I've changed thos to 'idx' to fix
> it.

As far as I can tell that's because index(3) is declared in strings.h on
my system (the file ships with the GNU libc 2.22) and that header file
isn't included from anywhere. Perhaps your system differs from that?

Actually there's also a prototype for index(3) in string.h on my system
but it is guarded with an #ifdef __USE_MISC, and upon closer inspection
that does get set, so the index(3) symbol should be available. No idea
why I don't get a warning, though, -Wshadow is definitely getting passed
to the compiler.

Anyway, those changes sound reasonable in either case, thanks for
applying.

Thierry

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWDOqBAAoJEN0jrNd/PrOhaEEQALt3ug5CsvcHU6w+t5ab4NKX
9wfVCJP81VCRno1sQPRumFjHAFPwsjpjhaRk8dNx4S4TQEx6bHFLzZVRvOm15u6r
kjN2JYNMb+l9hvhFtPNxGrquri1XXk465jRWf1tvJ5wgtvkPbdzCydqims0FSxOI
JILTVYRnrVUxdB8JmmUHKjfo/b2UxF2dEc2clDU9Sw0jXxpSseeHK5LoWufV8rOR
K2AXXT2kYrIi+EHJwUDVuRAzpBntaKtb8FScaDCMgOTb81zI730vSJdTrOYcVSZI
U8FZneX6cbujOnP1A/eV2VMByZnJhDFXq+EYYgl59Jeg0zQw+LElKh/i0wcaQvqp
lKnMV+w/DjudtTDeRoUK5Z/RoeFsDUfZmZ1WgVz8zL0GH8p5VKLTrDwBsC1rrRLv
q/OriqvdXdl6DWVzIoDIBWvba0AbTvI1cEwX7SKGCa1dosDByyK01hOnqh4vUvJq
7mqNVzZht3zf7ok+vuWVxuoQq+CmEfs/B2qbvwmSba404dNhO6AmRgfnwUTh4cDX
DNbbtaRMLf4vtwV2x7k4UKtQSRMO75/9L7XG+awLhgqhhe+tIqMxJp8iK8cM9kEx
gh1XT3UYfVpLgaYpKlNuxOOlxdD5A5OgxlVEbbMs+Y39/LqzgAPz2QFol7HivwTs
vRlcKP5dKY4qPCUK5+Ye
=AUWH
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
