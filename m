From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] checks: add chosen node checks
Date: Fri, 15 Dec 2017 14:16:16 +1100
Message-ID: <20171215031616.GC7753@umbus.fritz.box>
References: <20171214224001.17298-1-robh@kernel.org>
 <20171215022754.GB7753@umbus.fritz.box>
 <CAL_Jsq+M2jjKAstCmS8zPSf-SfFtq+vtKGYJtWvbJL9355L8cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513307781;
        bh=mYsUJcEMpe7WAOZGY3uqU4neV5C7v+iRRAjmG9i83+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VOmgMTlceRI/24nG92r3Xl4UNEcFHCEMiqoTWiR4WslOKB1uYMhDOv0/maarbhtr0
         SuTUUcaLuiGEvv9Jd8R2B/rcjGtCUjcxs+c0rR6tfkCGDvFpF4+LZJsPHGBwDsBsRv
         HLWHZxt7n0EHYExMIGFIWeUJAhfzza5Isah6TRow=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+M2jjKAstCmS8zPSf-SfFtq+vtKGYJtWvbJL9355L8cA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 09:11:52PM -0600, Rob Herring wrote:
> On Thu, Dec 14, 2017 at 8:27 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Dec 14, 2017 at 04:40:01PM -0600, Rob Herring wrote:
> >> Add some checks for /chosen node. These check that chosen is located at
> >> the root level and that bootargs and stdout-path properties are string=
s.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Applied, thanks.
> >
> > One possible follow-on...
> >
> > [snip]
> >> +static void check_chosen_node_stdout_path(struct check *c, struct dt_=
info *dti,
> >> +                                       struct node *node)
> >> +{
> >> +     struct property *prop;
> >> +
> >> +     if (!streq(node->name, "chosen"))
> >> +             return;
> >> +
> >> +     prop =3D get_property(node, "stdout-path");
> >> +     if (!prop) {
> >> +             prop =3D get_property(node, "linux,stdout-path");
> >> +             if (!prop)
> >> +                     return;
> >> +             FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout=
-path'");
> >> +     }
> >> +
> >> +     c->data =3D prop->name;
> >> +     check_is_string(c, dti, node);
> >
> > .. you could also check that it's actually a valid path to a node,
> > couldn't you?
>=20
> Yes I thought of that, but it's often an alias. I didn't look closely,
> but I don't think that would work unless I add that additional
> lookup.

Ah, good point, you would need to check against aliases as well.  We
probably should have a helper that looks up a path, including alias
resolution (so both "/absolute/path" and "alias/path/from/alias").
Both forms are traditionally allowed in most contexts that accept a
path in OF.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlozPoAACgkQbDjKyiDZ
s5IIQBAAj/3Qvkv/hEtV1bz6a860oajNXIYWgZ89jN8Hbx/T+FYYw3Ailq5054mu
xcjZJphrryVSDJVAStedS0dDz6bFOscJFv34EiL3R0cmJOq3FZD1NmGlkVymmPE4
Wa1L3qvL5z2reoYzWPU37m/gyzkv5m9yEtQMejFMt65JRzmISIWO4nqONKnzsyEz
S7L49Lk6Di+QIJLbhYTz9JANrM/jLt4gHgIldAxAGmXSr5bBcCqgR4JFDwEtiGoF
2SZ04FRXdzt7Yj6PpvAPaOTx7f9wer99jbhUxmpfeSxfVpztPqi8LqolItTWeq+S
HBzqhus+MZD2OZIAdLJL+i/JU/iX4PvNA8P7MrZxy1gk0aP8LIOaYaqqtwa8f8mQ
HCHYbQJPNRe32GKQEStXJgx2Ed5xdMyMk7TH5QVBBff4SDWCiEUmBvb9Ch1ovTOa
GUNBKYAaXJO0Nc8ONZCFqAd2QttfyLEaqOPFrrThKljBvlQMAqV/QmxI/3rRI+AI
ljPWFVJvzWMXuH0oGM8/8SAuQmH6Vco7oid10+eGoBUjQBinw+V6FJxRHqG4X4K+
6QpQoOqAs7ksEdxvdNZRJ7/HGurZbm+6X5jiXD9T6xxs/HMst+vwfiv6L85pYMUQ
VVzrR/XqRkyYX6p+3ygqaXKVlw1kx0CtVwh6dxQQntU5BDDs+iM=
=iznI
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
