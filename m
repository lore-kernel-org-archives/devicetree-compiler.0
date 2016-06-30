From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 10/12] libfdt: Add overlay application
	function
Date: Thu, 30 Jun 2016 15:08:57 +1000
Message-ID: <20160630050857.GR8885@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-11-maxime.ripard@free-electrons.com>
 <20160627052607.GK4242@voom.fritz.box>
 <20160627114000.GV4000@lukather>
 <20160628031252.GZ4242@voom.fritz.box> <5774854E.2020008@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0254291236=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1467263751;
 bh=VD5u0wOrqlmHEOLq8VdQU4xvOsU4pfJXR1vlFrIAhIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oSBxdt2irz/mUnJHc3h2lx+gDfSoyUFQZC9FhC3k4RZC45j6Nc0s/pYpMyMfppYIa
 W2fVCgXf7oyPqOTvzCAtlhH+DnKhjwpP29jb8B8SB+ohg/Qjl05fNXJH6LSFtQ1Fhj
 ILFQjCljKz3zKhQMft59PehMpzCMzPtc/7PqvHCo=
In-Reply-To: <5774854E.2020008@gmail.com>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, u-boot@lists.denx.de, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Tom Rini <trini@konsulko.com>, Alexander Kaplan <alex@nextthing.co>, devicetree-compiler@vger.kernel.org


--===============0254291236==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sf3MmCJcUNNLokcm"
Content-Disposition: inline


--Sf3MmCJcUNNLokcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 07:34:54PM -0700, Frank Rowand wrote:
> On 06/27/16 20:12, David Gibson wrote:
> > On Mon, Jun 27, 2016 at 01:40:00PM +0200, Maxime Ripard wrote:
> >> Hi David,
> >>
> >> On Mon, Jun 27, 2016 at 03:26:07PM +1000, David Gibson wrote:
> >>>> +static uint32_t overlay_get_target_phandle(const void *fdto, int fr=
agment)
> >>>> +{
> >>>> +	const uint32_t *val;
> >>>> +	int len;
> >>>> +
> >>>> +	val =3D fdt_getprop(fdto, fragment, "target", &len);
> >>>> +	if (!val || (*val =3D=3D 0xffffffff) || (len !=3D sizeof(*val)))
> >>>> +		return 0;
> >>>
> >>> This doesn't distinguish between a missing property (which may
> >>> indicate a valid overlay using a target-path or some other method)
> >>> and a badly formatted 'target' property, which is definitely an error
> >>> in the overlay.
> >>>
> >>> I think those should be treated differently.
> >>
> >> AFAIK, phandles can have any 32 bits values but 0xffffffff. In order
> >> to cover the two cases, we would need to have some error code, but
> >> that doesn't really work with returning a uint32_t.
> >=20
> > Actually phandles can have any value except 0xffffffff *or* 0.  So you
> > can use 0 for "couldn't find" and -1 for "badly formatted".
>=20
> < snip >
>=20
> Hi David,
>=20
> I would like to capture this for the specification.
>=20
> It seems like I could say that a value of 0 in the FDT is not allowed.
>=20
> Then thinking of what Pantelis is doing with overlays, it seems like a
> value of 0xffffffff is allowed in the FDT, but it means not a valid
> phandle, so do not try to de-reference it.
>=20
> Does that sound good?

That should be ok.  Basically both 0 and -1 are invalid phandle
values, so it's up to us if we want to assign them specific "error"
meanings.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Sf3MmCJcUNNLokcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXdKlpAAoJEGw4ysog2bOSlpAP/jtmU8RZPzXKO1nMRj6ucft+
5OTWc4k8oKjeovKj8/aPwXBj3xh0mfjbzdh8WtmdKYiVViybSZAD/QlrJMoc2Bg7
5GBoWYqut/YZw0VxGKk9no3/vxqw886Nu5C9Fmi8/RyEiOtDEyhDJmOplgRH4KH1
uWpP4v8Ss3T2uS7h2y5XwZ0VegXja8expusbBlKIk/kAqMTgyZTEaekivWqsZUuS
QrEU+DA6zEe4uRI68+BN7rbP8utXqSm7mHNyqubVt3YRMOjLQnr5694jWNVFlsof
cXRmw3UcyuI0EpgbI7j8WmmkWGNPsg4zy4d0jhgJyFmYQeubSe6NW3XAY6a7XPvm
2RVGqg5hJrViZNV3EF89NQ8j6dSJm3Dq6AEXNJq84VfUtjb/06PYZHQcJEiLoZfO
I5oPkfLhQnL3QYxT43R8gco7Z7jzQ+NABe0WLEdWA1+hr0X3QZWSerlehwL3L59K
YW6HSc1t8fz0l2qWqYN1hdvFGWQ7DXWSLyN/EZPPtl3A5PzvXKZJl0B5UHRorueO
d7wL5YWl2MnAJ9bvrxyq/iqX62Qdu4D92rMr2YtFSp4wZVFnqKX5F5iFwg962XSZ
zwiFCwf6hZpOPSaQr3ep2zciMa4h8XR5vSx7xmw8ETrH6CcWjMfBQXBPoxUiTxI9
R4qDcvV/1ITNk9cLLplj
=vhN/
-----END PGP SIGNATURE-----

--Sf3MmCJcUNNLokcm--

--===============0254291236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0254291236==--
