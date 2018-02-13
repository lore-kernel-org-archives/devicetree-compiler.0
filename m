From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] checks: add graph binding checks
Date: Tue, 13 Feb 2018 16:58:43 +1100
Message-ID: <20180213055843.GP11634@umbus.fritz.box>
References: <20171215031853.8229-1-robh@kernel.org>
 <20171219050400.GN4786@umbus.fritz.box>
 <CAL_Jsq+3AiKuBj5kRA+EDpGSBBYJ-J4ZRCf0Yuk_XF9eMKb18w@mail.gmail.com>
 <CAL_JsqKi9zU6tLotqcRVYSfCCDKF1Oxz=1=3PpMZTRtdJr=tcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8HHeiRpSfOSMcPVo"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1518503214;
        bh=ZI3iaypCF/17gFmkwM4yZqJ6a6P9mEJqXs14eVHnPCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HBC49zBBFJmcfQHWwlq7Mu2+k/IoGF8GXBT1uTHX6k4Sd+I44K0Qdyz+Qk51yICPJ
         NRZYQO385Fu9xeRHQulE43keb0UW+Kw6rV9qRZlQjJh9p6uYsdhK6YOsWGWBiFGABj
         7tMc0EMZggNBekZkZNnMmV01euGuDAbzuugfnF+4=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKi9zU6tLotqcRVYSfCCDKF1Oxz=1=3PpMZTRtdJr=tcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--8HHeiRpSfOSMcPVo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2018 at 08:49:51AM -0600, Rob Herring wrote:
> On Tue, Dec 19, 2017 at 12:36 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Mon, Dec 18, 2017 at 11:04 PM, David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> On Thu, Dec 14, 2017 at 09:18:53PM -0600, Rob Herring wrote:
> >>> Add checks for DT graph bindings. These checks check node names,
> >>> unit-addresses and link connections on ports, port, and endpoint node=
s.
> >>>
> >>> The graph nodes are matched by finding nodes named 'endpoint' or with=
 a
> >>> 'remote-endpoint' property. We can't match on 'ports' or 'port' nodes
> >>> because those names are used for non-graph nodes. While the graph nod=
es
> >>> aren't really buses, using the bus pointer to tag matched nodes is
> >>> convenient.
> >>>
> >>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>
> >> Could you give me a reference to somewhere these graph nodes are
> >> described?  It' a type I wasn't even vaguely aware of up until now.
> >
> > It is newish:
> >
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/graph.txt
>=20
> Any comments on this?

Sorry, I've been sidetracked by all sorts of other things.  It's still
on my list.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8HHeiRpSfOSMcPVo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqCfpAACgkQbDjKyiDZ
s5LIBg//S2vd+aemx8H7Ka5MWsLxyVTBMEkiAhyiKrQGxAj89A0gQW5I7u+9A5lG
uN0So7bm3bQxWOQXwmdOfGzg2VZfEyPowDWjbwuneTyYBgxEn1cx5w1nh4f3UFIp
lzTqACmXHm6XAGlTsWZg05goF+RnSuthhQNhE3j4R6dl6MvsVUui1PMxlBD3YVuZ
MdqcaRan6oPcvheFJeXNkZFNhXZ/exVzLiFtwQPRb9vG+PoMYYi9O4TLvMBawCax
/pvm1+2ljpQvhU4b4mbdAcVgy3Gpq8YKlb3QlH6e2WvEZVspgaQcXsS7gSI3HsEc
1KsDmRsKnW0cJAlpNXPBdlI0zL4ZDewnOW/HXiJrU8W3Nk+C3Q4K14Fy+YNfgZR4
B5lj9y6LAl3JSrpbSQRXBOw4H+kjkSZgEN+Ut/3jcg07ek8VcswtreL608VS2asX
vdI0onIk6jEoXELdApsH0RvUUdQjVBy+Ps7wCZoUQkVWSrZQ3IyfO8Ia/o/MtdFh
+sVFRSo+IhSVhM1vGXsppHAg6jKVdPbD9vEngDhw5H9EoI3ENR28/M1ZLDMgY6cL
38xJYj9V8ZbuCPMi1lRCEfD/ljBUH3zQAP6O8aQK3HOMf6KQFeVhuyIezxjc9JxM
52VwWzLYMLMWejdubfLzHk1hFY/92kv/6LQy+GyXGbA/LXMOFIc=
=UlIg
-----END PGP SIGNATURE-----

--8HHeiRpSfOSMcPVo--
