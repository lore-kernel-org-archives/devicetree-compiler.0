From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH 03/12] libfdt: Safer access to strings section
Date: Fri, 13 Apr 2018 12:53:19 -0400
Message-ID: <20180413165319.GF10996@bill-the-cat.ec.rr.com>
References: <20180325232523.13469-1-david@gibson.dropbear.id.au>
 <20180325232523.13469-4-david@gibson.dropbear.id.au>
 <CAPnjgZ299ffKgtojTGaV+2EigUAT8ediyCSWk2xoxr2sAjeyog@mail.gmail.com>
 <20180403150224.GD1984@umbus.fritz.box>
 <CAPnjgZ3vEkx6zJY9Sj5yQQphaZZbEXTVrAMjX95+WZNHZvheZQ@mail.gmail.com>
 <20180410052254.GK3361@umbus.fritz.box>
 <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
 <20180412043919.GH9425@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618044727035796632=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MXh4ITCJpuDQEBFQuEMwjvMBa9E1eeZmERXjkNUaS4I=;
 b=cmUhCbCqC0Ls0otczRU5pCw5T+vNb84zKSbKdSMV272zSnLv5QRLd6LqtMH9ri8r5d
 ZPrMlWvnQa2jrQ3ogSjIT1IULvaAbc5svF1vlWps/gjUwzX25+Z+IMdR8rcftxRJSlwE
 bWydlcwXIl3eNpHFYEwomad/JuyXPNN8Uds4U=
In-Reply-To: <20180412043919.GH9425@umbus.fritz.box>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: aik@ozlabs.ru, U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>


--===============0618044727035796632==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YOBxsficDj3eWDuH"
Content-Disposition: inline


--YOBxsficDj3eWDuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2018 at 02:39:19PM +1000, David Gibson wrote:
> On Tue, Apr 10, 2018 at 10:42:45AM -0400, Simon Glass wrote:
> > +U-Boot, Tom, Masahiro
> >=20
> > Hi David,
> >=20
> > On 10 April 2018 at 01:22, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> > > On Wed, Apr 04, 2018 at 01:21:10AM +0800, Simon Glass wrote:
> > >> Hi David,
> > >>
> > >> On 3 April 2018 at 23:02, David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> > >> >
> > >> > On Fri, Mar 30, 2018 at 04:42:21PM +0800, Simon Glass wrote:
> > >> > > Hi David,
> > >> > >
> > >> > > On 26 March 2018 at 07:25, David Gibson <david@gibson.dropbear.i=
d.au> wrote:
> > >> > > > fdt_string() is used to retrieve strings from a DT blob's stri=
ngs section.
> > >> > > > It's rarely used directly, but is widely used internally.
> > >> > > >
> > >> > > > However, it doesn't do any bounds checking, which means in the=
 case of a
> > >> > > > corrupted blob it could access bad memory, which libfdt is sup=
posed to
> > >> > > > avoid.
> > >> > > >
> > >> > > > This write a safe alternative to fdt_string, fdt_get_string().=
  It checks
> > >> > > > both that the given offset is within the string section and th=
at the string
> > >> > > > it points to is properly \0 terminated within the section.  It=
 also returns
> > >> > > > the string's length as a convenience (since it needs to determ=
ine to do the
> > >> > > > checks anyway).
> > >> > > >
> > >> > > > fdt_string() is rewritten in terms of fdt_get_string() for com=
patibility.
> > >> > > >
> > >> > > > Most of the diff here is actually testing infrastructure.
> > >> > > >
> > >> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > >> > > > ---
> > >> > > >  libfdt/fdt_ro.c          | 61 +++++++++++++++++++++++++++++++=
++++--
> > >> > > >  libfdt/libfdt.h          | 18 ++++++++++-
> > >> > > >  libfdt/version.lds       |  2 +-
> > >> > > >  tests/.gitignore         |  1 +
> > >> > > >  tests/Makefile.tests     |  2 +-
> > >> > > >  tests/run_tests.sh       |  1 +
> > >> > > >  tests/testdata.h         |  1 +
> > >> > > >  tests/testutils.c        | 11 +++++--
> > >> > > >  tests/trees.S            | 26 ++++++++++++++++
> > >> > > >  tests/truncated_string.c | 79 +++++++++++++++++++++++++++++++=
+++++++++++++++++
> > >> > > >  10 files changed, 193 insertions(+), 9 deletions(-)
> > >> > > >  create mode 100644 tests/truncated_string.c
> > >> > >
> > >> > > Similar code-size quesiton here. It looks like a lot of checking=
 code.
> > >> > > Can we have an option to remove it?
> > >> >
> > >> > Again, I'm disinclined without a concrete example of a problem.  F=
wiw
> > >> > the code size change is +276 bytes on my setup.
> > >>
> > >> That might not sound like a lot, but the overhead of DT in U-Boot is
> > >> about 3KB, so this adds nearly 10%.
> > >
> > > Hm.  And how much is it compared to the whole U-Boot blob?
> > >
> > >> The specific problem is that when U-Boot SPL gets too big boards don=
't
> > >> boot. Because we take the upstream libfdt this will affect U-Boot.
> > >>
> > >> Do you have any thoughts on how we could avoid this size increase?
> > >
> > > So, again, I'm very disinclined to prioritize size over memory safety
> > > without a *concrete* example.  i.e. "We hit this specific problem with
> > > size on this specific board that we were really using" rather than
> > > just "it might be a problem".
> > >
> > > IMO, thinking of it in terms of the "increase" is the wrong way
> > > arond.  If size is really a problem for you, you want to consider how
> > > you can reduce it in any way, not just rolling back the most recent
> > > changes.  The most obvious one to me would be to try
> > > -ffunction-sections to exclude any functions that aren't actually used
> > > by u-boot (if this is helpful and the compiler's an issue, I'd be
> > > willing to consider splitting up libfdt into a bunch more C files).
> >=20
> > Actually U-Boot does use that option. Believe me, a lot of work has
> > gone into making this small. There is constant pressure to
> > reduce/retain the size in SPL so that we can stay below limits. E.g.
> > firefly-rk3288 has a 30KB limit for SPL. Current problems are the
> > 64-bit Allwinner parts which are right up against the limit at
> > present.
> >=20
> > Also, Masahiro recently did some work to make U-Boot's version of
> > libfdt the same as is used by Linux, so any changes will impact us
> > quite quickly.
>=20
> Hm, ok, point taken.
>=20
> I did some quick hacks and I think it wouldn't be too hard to add a
> "-DUNSAFE" or similar option that would turn off most of the checking
> and save a substantial amount of code.
>=20
> I don't really have time to polish this up myself, but I'd be happy to
> merge patches that add something like this.  I am disinclined to hold
> up this safety work for it, though.
>=20
> If someone tackles this, I'd suggest 4 levels of "unsafety":
>=20
> 1) Safe.  The default, as now, full checking and safety wherever possible
>=20
> 2) Remove "assert"s.  Remove all checks that result in
>    -FDT_ERR_INTERNAL.  These are basically supposed to be assert()s,
>    but I don't want to rely on assert() as an external dependency.
>    Testsuite should still pass in full with this change
>=20
> 3) Remove safety against a corrupted fdt.  This would remove basically
>    all the extra checking in this series, plus what was already
>    there.  fdt_offset_ptr() would become a no-op.  A handful of tests
>    that explicitly check against broken trees would need to be skipped
>    in this mode.
>=20
> 4) Remove safety against bad parameters.  All of the above and also
>    remove sanity checks of arguments.  A rather larger number of tests
>    would need to be skipped here.

I'm honestly a little bit torn on this.  I guess the fundamental
question is, what can the bootloader do if the DTB is somehow wrong?  I
kind of feel like it's most important to be able to detect problems
within the tree and have a catchable error rather than assume the input
is good, be incorrect about that and go off in the weeds and possibly
hang.

--=20
Tom

--YOBxsficDj3eWDuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa0OB/AAoJEIf59jXTHXZSzlMP/2+R9TRVodllnstVk5bpbWEU
wrzowMEH+FLAG4LFtyUfFJy6uWjqe4LWgJgc//8bYtQopyE+1Twkhuu2l21e7Cjj
eAaVfy4TCiqLXB6dPF2U2+13zUi1JNELIm6mKNSMa9UPvKlbr7YgGekkMcsh0wRt
V0hdmJ1z7u/EE/pwTMC2HsQ6N9AYAw0j8HsAtA6OdHVUghxdRtbB5vUMwhdapjx/
QLWmD5Xw5qPfZPK/eASZiiwRagfr7w1/JDFkpMFYG7A42QDhuqz6WHsNTDvZ4cVF
49A9woJVDVE0AdFB2M90wsrrYJ/bHjD7wkBHwCslJm2AliSxl3000pmJYFt6c9a2
KLbQIBrnn9kYr0Faf0l6dDORIxhtIBXQeVnbDFbbdLWuuBM7fq4U42BXd7Jw6O/m
9h8fe5ab+toyoYE9DIyq6Xg/WiKGZhEspvAlCkDiBkNPUWGGsMwmw/ICwnJNIpkH
WRcBQ7b27us2eQi7koGjeeznJkmSyvijY6qwLJtTtCXyO3R+BTOTRCLeLbXHqQ09
diY7jPt7EcARFMQlKRB+CvesScRD9zd2yYUhu3sofqDOleyy4wrQuDWkGNNwvtJF
s9o2pWk7/IsvD3Ynz83E+r0lOEcys0sLj35z8b0Eygdg0FYrecveQnSRf/To9xdP
4s9RSEk3zZIQzNS5YDrL
=9UG2
-----END PGP SIGNATURE-----

--YOBxsficDj3eWDuH--

--===============0618044727035796632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============0618044727035796632==--
