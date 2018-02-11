From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5] libfdt: add helpers to read address and size from reg
Date: Sun, 11 Feb 2018 13:54:03 +1100
Message-ID: <20180211025403.GA11634@umbus.fritz.box>
References: <20180201230416.6641-1-afd@ti.com>
 <CAL_JsqLJ=KK=PPnKBJBu1S5meTYRQxHyH5JFQGs2MLkm-ALuyA@mail.gmail.com>
 <e9edce2a-d37a-768e-17d5-e48a620780a2@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5cXpu7evJfjLw2dJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1518317649;
        bh=22p0i3qwsOJA9+TqtMcJH9EspSPaWpkWE8uE4Px+QBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N3j/5tUrG7vo5V/txFP7kmTrN2WC7y1AcSMzxk43KK7PZCFiqhtzxup8oXtnjh+ns
         E+QSlZdzwAbf0cx1NPDCKKi3D3sXg8GF2AM8EMSCDj+1x6JP/nkJ5IFFd6Kv74U9D7
         srNbZ03gcUT27vezGHLLoc1rCyHN3dtWLCEzwxo4=
Content-Disposition: inline
In-Reply-To: <e9edce2a-d37a-768e-17d5-e48a620780a2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--5cXpu7evJfjLw2dJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 05, 2018 at 09:24:34AM -0600, Andrew F. Davis wrote:
> On 02/01/2018 10:35 PM, Rob Herring wrote:
> > On Thu, Feb 1, 2018 at 5:04 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
> >> From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> >>
> >> This patch extends the capability of libfdt to parse the contents of d=
evice
> >> trees in a similar manner to fdt_address_cells and fdt_size_cells.
> >>
> >> It adds a helper function which reads the address and size of a device=
 from
> >> the reg property and performs basic sanity checks.
> >>
> >> It does not perform translation to a physical address using the ranges
> >> properties of parents, but this enhancement may be added as a separate
> >> function in the future.
> >=20
> > I'm concerned about merging this without translation support. First,
> > I'd question its usefulness without it. Second, it may encourage
> > people to write their DTs without any ranges just so this will work.
>=20
> It can be useful for nodes where ranges is not appropriate for whatever
> reason, or more likely as a base for other helpers that do perform
> translation (hence the "simple" in this ones name), it will need to
> still be extended for many use-cases.

Yeah, I have very mixed feelings about this.  If I'd just seen the
patches without the threads associated with them, I'd have been happy
enough.  Although it certainly doesn't cover anything, there are
definitely cases where an untranslated retrieval is useful.  Not least
as something for a translating helper to use underneath, but also
because this can be useful for buses which have no direct mapping into
MMIO space (/cpus, i2c amongst others).

However a number of the comments on versions of the patch - and indeed
the function types on this revision - seem to specifically imply this
is intended for the case where an untranslated fetch is somewhere
between fragile and dead wrong.  Like Rob, I'm concerned that will
encourage poor ways of doing things.

Perhaps a version of this which will error if the parent node has any
'ranges' property (including empty)?  That restricts it to the case of
buses that are not mapped into their parent address space.

> > I tried to upstream the kernel and u-boot implementations to libfdt in
> > April 2014 (I couldn't find an archive). We've got to get it
> > relicensed and then David didn't like the implementation. He said he
> > was about to post his version, but then it derailed into PCI handling.

Ugh.. sorry.  Clearly I completely lost that train of thought.

> > There's another implementation in the kernel powerpc boot code that
> > may be easier to re-license.
> >=20
>=20
> My worry with adding translation is this kind of feature creep. PCI and
> other odd cases will block this effort with little gain for the users
> where this simple helper is sufficient.
>=20
> > Rob
> >=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5cXpu7evJfjLw2dJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlp/sEoACgkQbDjKyiDZ
s5KguRAA4V3cVsyUWm24b4kozCErDpG6b65Y+iwQOcU4WPc/UE5KiG5Ms6Ee6BTp
qtS4YsMx+4KlRr3CTXe5ZhbELfL76RbXyG4dKfmtxAfXBnSELC+PORHiHYsv2bD9
e/7Xz/Nb1VT7DK8nY6E0GU1NLG6M8Ew7e4QUjFXxZx1VGBdN/DJDP297RbHuXVO5
0NpxrE7AUnBLjpYDTj7e7lsaXdfiDrZ94bvHcppbctahTGxWE/g3pRxMeCdlL+Kn
wjB0S8PWG/ngpAMKJxvy0xGs/JVunYyw2tPkGfOJuoX9wBM7C+/YfYy8mfOyrAur
NlzmdLD3B//n503OfdNZqadLmCPMIyv5InjEEuhaqSI6tqRv8tvoPIUK0k7kGQsr
qYjbRhIFQhPGZFErUXr5bCbrzRFPxnh+A4fpD33I7UbF4SdrOcofKb+ZoBCaIc5W
Qvd4oL0o/nCrJ7HvqKShTMNF6B94JIAxehIpuj0DKu7av1iuMoIhzjmBaVAuD8Mq
duJi4VXVaXfioe18dGyZSaSI4MQeYo3QUg5xr3Mh+mpCDedRZ45EdFaffKvunj6U
ez1ZATn4fKoBjm31FhWOXGMg17TFA3u8IicgtjcL63OxQXnCi+gv/CilfybxHSLD
o1VwRC9Fkp6+knCa4rVYSGQ7DDNhWTgRO9ONmdRmDTDalljG6VQ=
=Kn/T
-----END PGP SIGNATURE-----

--5cXpu7evJfjLw2dJ--
