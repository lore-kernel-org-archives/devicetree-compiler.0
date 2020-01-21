From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Date: Tue, 21 Jan 2020 13:05:25 +1100
Message-ID: <20200121020525.GL54439@umbus>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200119063916.GD54439@umbus>
 <9c4e873ef998a5800a4cac673b7e925fc90e3293.camel@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BXhH8iG0/4JcYZU2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579578220;
        bh=ZPS3gYOvVp4j9920lOV5YSCi8e7m9baBlPt+nNtFMXY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CJsKJgBAZ4ygUdcjsTS3dRojOc+goTKxmU/RQXFnqYR83HmtwZDHxRJmNVZYHvKCI
         n26ObAOkt1bawx5VvoXsICKw2mTXvP5GG5G/gWXE8EbzdAg/ROBhSP0iO8zvNyZD9u
         7PDULbu2OPnyrPOw/qfUcfZIJAC4vhkAx0qLl5f8=
Content-Disposition: inline
In-Reply-To: <9c4e873ef998a5800a4cac673b7e925fc90e3293.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--BXhH8iG0/4JcYZU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 11:55:52AM -0700, Ian Lepore wrote:
> On Sun, 2020-01-19 at 16:39 +1000, David Gibson wrote:
> > On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
> > > On Fri, Jan 17, 2020 at 6:26 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >=20
> > > > On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> > > > > Hi David
> > > > >=20
> > > > > [...]
> > > > >=20
> > > > > My first idea was to not modify all existing .dts files. Adding
> > > > > an extra option in dtc is (for me) the softer way to do it. I
> > > > > mean, compile information should come through compiler without
> > > > > modify .dts files outside from dtc. In this way it will be easy
> > > > > to everybody using dtc (inside our outside Linux tree) to add
> > > > > dtb build info (even if they don't how to write a dts file).
> > > >=20
> > > > But you're not really having this information coming from the
> > > > compiler.  Instead you're adding a compiler option that just
> > > > force includes another file into the generated tree, and it's up
> > > > to your build scripts to put something useful into that file.
> > > >=20
> > > > I don't really see that as preferable to modifying the .dts
> > > > files.
> > > >=20
> > > > I also dislike the fact that the option as proposed is much more
> > > > general than the name suggests, but also very similar too, but
> > > > much more specific than the existing /incbin/ option.
> > > >=20
> > > > What might be better would be to have a dtc option which force
> > > > appends an extra .dts to the mail .dts compiled.  You can then
> > > > put an overlay template in that file, something like:
> > > >=20
> > > > &{/} {
> > > >         linux,build-info =3D /incbin/ "build-info.txt;
> > > > }
> > >=20
> > > I like this suggestion either as an include another dts file or an
> > > overlay.
> >=20
> > Sorry, to be clear what I'm talking about here is just including
> > another dts file, and using the compile-type overlay syntax.  This is
> > not the same as .dtbo style runtime overlays (though the final result
> > is about the same in this case).
>=20
> Given that dts files are run through the C preprocessor before being
> fed to dtc, the build script could use the '-include' flag to force-
> include a fragment containing generated build info without any need to
> modify existing dts files.

Uh... maybe.  -include will essentially prepend the forced file, which
is a bit awkward for our purposes.  It means that the prepended file
would need the /dts-v1/ tag, and we couldn't have it in the main files
which would be a bit confusing.  I think it would also cause problems
with any /memreserve/ tags and means that the main tree could in
theory overwrite the build information which we don't necessarily
want.

I guess we could build things the other way around: have the main .dts
file specified with -include and have the dts on the dtc commandline
be a fixed one with the build information.  It'd be a little weird,
though.

> > > The latter could be useful as a way to maintain current dtb
> > > files while splitting the source files into base and overlay dts
> > > files.
> > >=20
> > > But no, let's not prepend this with 'linux'. It's not a property
> > > specific for Linux to consume.
> >=20
> > It's not really about who consumes it.  It's about defining a
> > namespace for the new property to exist in, since it's not part of a
> > relevant standard (if we wanted to make it such, we should pin down
> > what goes in there with much more precision).
> >=20
> > This is specific to files built in the Linux tree, hence my
> > suggestion of "linux", whoever ends up consuming them.
> >=20
>=20
> I tend to agree with this.  We use the dts files in freebsd, and if we
> wanted to include some build metadata, it would probably have different
> info in a different format than what linux uses.  I would be inclined
> to add those as freebsd,build-info.  As well as the namespace, this
> would give consumers some clue about what format the build info string
> might have.
>=20
> -- Ian
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BXhH8iG0/4JcYZU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4mXGUACgkQbDjKyiDZ
s5IYRhAAgv+1VW5dkrqF6dLFFLIHltZsMXwoBSj/YECbPgFS/xliMcQc4AFIFAbC
xja9RRTHb47FXrBKjyxoSNxDeZmYw8VKzakEIBD7LEsgJWtpzOUZWabWJuw1Zrmd
RgaLuDo0sqqXzpmP5kviQ5zmltKLSG2312iEUWXHLlzKXJPYa6PNEXPaEHfHhDdP
a6B3YuxKtWqfqzQv3SjWpjQCTuf/p1eRLE5+C8Pnf2J0TeetGZyj//yW8DLNtX+Q
N//LfKQHxbzbphXx5d5Kw7FFIUL/XatHYAQmvE7iXEj4F7DUFHiUpMTmxFhY7tSG
Mpv9WNRBzQNYOhN546bu0z1OZOWiUJIBZK8312w+NBn9WrtglqBFJIfVSbdK4/2W
xL9PxuPvbC69wBTXqSyKyE5ZI4YGVWAqZhum4J5aysdekl+4lXvREOeW6ll0yU2I
puUmuVbyj8yLICLg7V3y/ChnRTqzGNPvnPxvklPD2ysb8cImWPINzr1DZ1J/Y7ay
TEMSQ0SmcIDz1tDWAFt+c9etC2OMCw5inGMUnKmumejTn9iby04KDpsjxQ+eivnf
4MTuO2TM/fwxABheVCg6Vz7w4enSexymL/DDmkY2MDf9f2FLYYyou8yn8XwLmp9B
O1By6nk9qoTmQ6ea7OySXbGz+SouS5m2AU63iaIQMKkBTEMEUqY=
=5Gm6
-----END PGP SIGNATURE-----

--BXhH8iG0/4JcYZU2--
