From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: columns
Date: Mon, 8 Jan 2018 17:44:10 +1100
Message-ID: <20180108064410.GC2131@umbus.fritz.box>
References: <alpine.DEB.2.20.1801061739130.2579@hadrien>
 <20180108061233.GB2131@umbus.fritz.box>
 <alpine.DEB.2.20.1801080722520.2754@hadrien>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515394122;
        bh=fx0rRRKdjmsIiH3QFVxV40PR50XKzgdDqFREBFHuee0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SbQ1wcF8acoA/+hFTzuPwU2F6xtLAvpvRLMrRK87E9NNZF1HFB6DjaLMhgKrcMnmb
         YYfgGr/HWEr3GXXCmGyR8FWK27G0SodQCNR/ktqzuaxBeeZPonZjGLilo6mIkJ1KNu
         jZY6P8Q4I2xgwrd2yROjBTQqsDKhKg5bs3BmRgug=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1801080722520.2754@hadrien>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 07:24:43AM +0100, Julia Lawall wrote:
>=20
>=20
> On Mon, 8 Jan 2018, David Gibson wrote:
>=20
> > On Sat, Jan 06, 2018 at 05:43:20PM +0100, Julia Lawall wrote:
> > > Hello,
> > >
> > > I have been working with Frank Rowand on a v7 of file and line number
> > > annotations in the -O dts output of the device tree compiler.
> > >
> > > I wanted to make an --annotate-full option that would print the full
> > > filename, and starting and ending line and column numbers.
> > >
> > > The following commit:
> > >
> > > commit 728c5e87c655c17c2fbc1d5386b12ff328e0fc76
> > > Author: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > Date:   Tue Dec 8 14:24:42 2009 +1100
> > >
> > > extends the position mechanism with columns, but considers a tab to b=
e 8
> > > column.  Would it be ok to drop this feature?  I have the impression =
that
> > > counting 1 column for a tab would be more useful for actually finding=
 the
> > > referenced code.
> >
> > Hrm.  I set it up that way initially so that the reported columns
> > would match what shows up inside an editor (e.g. emacs
> > 'column-number-mode').
> >
> > So, I think I'll need to see a more developed case for why not
> > expanding tabs this way is preferable before making the change.
>=20
> OK, my emacs doesn't show column numbers.

Its not on by default; M-x 'column-number-mode' should enable it.  I
don't actually know if it always treats tabs as 8 columns, or if
there's some magic variable controlling how it treats tabs.  Given
it's emacs, probably the latter.

Fwiw, I don't usually use vi, but I had a quick poke in vim and it
seems to show both tab-unexpanded and tab-expanded numbers for the
columns (when pressing ^G, anyway).

> I make a macro that moves
> forward one space, and run that macro, eg 28 times, which ends up in the
> wrong place.

That is a good point.

> But if you prefer tabs to count as 8, I can leave it as it
> is.

I'm no longer sure which I prefer :/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpTEzgACgkQbDjKyiDZ
s5Kw+BAAqGLo5qv0gK1ETLthe/pn3G2IZvR2u7l2yAjPjVSDUgNvk0s91gJ2kR4n
S52klBsPneHZ0w48uWeBCMZK0YBnpjMzxjdwOD1lKrvMV8I9CmGQUY9FljEjAySv
gDTP0rEFaMMvfiinplApu6EzdlD4AWyJCqsNKUB5YsRqwSVKayAc5RTYOFjpxJTs
sAFOkRUsadnWAgYKR0V886SmrjwavLZpuA8kBr04W0ew24NJI34bsumW8CP+Qzl0
e+H/BckbDH6fGJNDXW1deoKmdLw4j8618AltUh/X/CjHsVC4oRu4yWlocAkNa49i
SjSBiEAoUFAmpPVkyLzdkiIa57/gR+TJ7b0CMM7SKvEik3/Gx7egrcNt7iMN7g2y
95xoAqki/7ES+Vf6uM3yZ+ytDetGtq76e/ltmlBZK/9xa3iEX1LD8KD0hj3lXiJa
bHTd3NZXPLtXkPEepdubVajomY1IeFm1WJt2zzQdojG5OpbkqrKlKISM8p9ics3n
QjFikdJYicKWH9w/wFSQyV5hKg1aM81WlTstgO0NlrJhxs+HRg1PuG21OcIzGJAO
jZr5jLVoHtEZzI6yQBnpuEGO4voLvR3UHVVXex+SnisMbcUixo/S58LVHFB4gGoX
dr6d/j/dJW6F+018KbJ5C4StDpSego+NL+Vdn6opRWcekghQ5VI=
=OjHV
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
