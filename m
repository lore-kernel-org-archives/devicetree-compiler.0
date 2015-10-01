From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add a couple of string-related functions
Date: Thu, 1 Oct 2015 10:23:42 +0200
Message-ID: <20151001082342.GD3070@ulmo>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
 <20150930033132.GD13035@voom.fritz.box>
 <20151001081043.GC3070@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=jIfaWtd+CTFN2enI4Su1BVkxwRVGy9m97bVuJiKC7ng=;
        b=UKmctm7N+OSaRwxUYZB2zyjk5Qr99TDAjPPr7u+FfXGkiRQFUswln2l8MNWgrM5Obg
         ZXeSjMsLOfeHi0w//7YuajYPW2Q0g9ErYTQyzNyxikbaIKlLiBEKtIvF18BPdqrjTlfi
         I0q+L8bbdPK+tUw6EUL6UK8jSi7dVjaZhl6QQAJVHkPw/ydtDBaGlD6v3S3grNFSRyxV
         EHvmYToxkoxigGDCS6BAAjF9N+bUOyr3J2pck7BEGCLTseMrPeOJ20fM21zEWUPj6PAH
         u2mUCW55UXRjPxnoRKqTwELeiBRQLy/dArj5Cd8HHI8fuNO3j7Yx2TGpG6SzHrDiLgc/
         2qCw==
Content-Disposition: inline
In-Reply-To: <20151001081043.GC3070@ulmo>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 10:10:43AM +0200, Thierry Reding wrote:
> On Wed, Sep 30, 2015 at 01:31:32PM +1000, David Gibson wrote:
> > On Tue, Sep 29, 2015 at 11:09:05AM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > These three patches add a couple of string functions that have proven
> > > useful in U-Boot's copy of libfdt, so they are likely to be useful for
> > > other users as well.
> > >=20
> > > Patch 1 adds a function to count the number of strings in a property's
> > > value. This also adds a new DTS sample along with a small test program
> > > to validate the implemented functions.
> > >=20
> > > Patch 2 adds a function to retrieve the index of a given string in any
> > > given property's value. This adds code to the test program introduced=
 in
> > > the previous patch to exercise the new functionality.
> > >=20
> > > Patch 3 adds a function to retrieve a string by index from a property=
's
> > > value. This extends the test program introduced in patch 1 to validate
> > > the new functionality.
> >=20
> > Thanks, I've applied this.
> >=20
> > I did end up making a couple of small changes.
> >=20
> > First, I forgot to say earlier that I also wanted to change the
> > testcase name to stringlist* for clarity.
>=20
> Okay, makes sense.
>=20
> > Second, Travis CI picked up some -Wshadow warnings: in a bunch of
> > places you were using 'index' as a variable name, which shadows the
> > libc index(3) function.  I'm not sure why that didn't show up on a
> > local "make check", but in any case I've changed thos to 'idx' to fix
> > it.
>=20
> As far as I can tell that's because index(3) is declared in strings.h on
> my system (the file ships with the GNU libc 2.22) and that header file
> isn't included from anywhere. Perhaps your system differs from that?
>=20
> Actually there's also a prototype for index(3) in string.h on my system
> but it is guarded with an #ifdef __USE_MISC, and upon closer inspection
> that does get set, so the index(3) symbol should be available. No idea
> why I don't get a warning, though, -Wshadow is definitely getting passed
> to the compiler.

Ah, some further digging shows that this behaviour was changed in GCC
4.8 (search for -Wshadow):

and the link in that note links to a note from Linus Torvalds here:

	https://lkml.org/lkml/2006/11/28/239

which I find quite amusing because the reason for the change in GCC 4.8
was exactly the same example of using a local variable named index while
including string.h.

I suspect that you're using some version of GCC older than 4.8, which
would explain why you saw the warning and I didn't (I use 5.2.0).

Thierry

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWDO2LAAoJEN0jrNd/PrOhR3UQAKxpbawfzeD23Y47uIuaVqgg
EcIX9Lg2E+T8nWPVlFf7OCjnIByaAk39zI090A/ka/RKazZT0qk253dvfrc+eYcn
H70w6o60K+t++ZuZYKCLIgstQnaW4wNuE0ri89QOSeUmmxH5TRrxHxxEf7T5KQGv
4XSAHJdbOCQhG9Akow4e8hYvP5SAj6hWaaVDCFIC8q8hOQ9dpVsxxn99GNKCRUbI
EDeW+nzBrFfkyqwMjLQ299HWIQsWIIwmjh7BisVBEB1MFzQT6dXqSj6stOb28csD
rYcpra01qtQfbrVVEJudoqF5J+pCS1CvRS8V9B/QEsAPk+zLWko7ugAJ5AjNLQz4
5fKkcz5LKspigjt5rbQQqw5zCMi0lxhW0My5GmfnD4YxP/QUCA2MvNqDHi/II21O
XkIv9zHI0LdU1P1t+u7InHbRPsZHkH8Bi8uKKg1Cjie/vVksHM7xFz8WuDGfJLtQ
Kt926EsPNf3ltOnBuKNVuojIJFb5mkaWNHQ6GKSEzqvgdsd8PJ+R4ShJNx4bg0jO
tTR5BDtTclpTPrs/ygtLShqOGXwHVMksHSiL4hNBqlHMapH1QXuOBvJzfiT7V7Fd
VJIOknj6cwArpSXzf9sxyG96UuMm4xaEmzdRMcazUoK+CWzYWElPDKU1NPOBXmV1
vpm7GZ4ItZL9c9JblfSp
=XnmK
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
