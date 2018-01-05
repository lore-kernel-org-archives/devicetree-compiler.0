From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Fri, 5 Jan 2018 14:40:57 +1100
Message-ID: <20180105034057.GH24581@umbus.fritz.box>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
 <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3JWHCGIvlHPlU6rB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515124175;
        bh=+Orq5umr+UUvg5scvytLk67+bhT+V7WiRmudD5hOFmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=px7UhKH+4Nhe4hCBovVX5U5L27qZfiSbAiPtiVnCKr8zan8h7KgcxLRsaaZ5EeB1M
         7+7sUD9pyetmk7RpbF3H7rMlfVZG7IcySE4QVEA94jr86cID6WPCHFds30juZZ7Y2l
         nCEJshCGELbYKsUtrxVZhMoAOCcbkyULesDSF+gs=
Content-Disposition: inline
In-Reply-To: <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--3JWHCGIvlHPlU6rB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 02:41:22PM -0600, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> > [... snip ...]
> >
> > Does this remove the need for the proposed patch, or am I still
> > missing something?
>=20
> ... nope. Apparently I never tested this with this particular dtc(1)
> and instead just assumed it did the same as ours- allocate phandle
> sparsely, even with -@. That certainly removes the need for this
> patch, and I'm somewhat upset that I hadn't previously considered
> this.

Ah! Sorry, I'd forgotten about that behaviour of -@.

> @David, Jon: Please disregard all of the patches along these lines...
> I'll fix this in our dtc, where it should be fixed.

Ok :).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3JWHCGIvlHPlU6rB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpO88kACgkQbDjKyiDZ
s5KT8A/6A4Ob6EqEc92iAtDc+gkbKy3FhDkwQcxZGPbJzo07//xB63oTEhyc/YlG
Zd1e3WW60l2vjXSEy+HxcPzfUq5A+6VnJFT94Ek5RDO0FEAY9tklRTpTlLlbQGuh
h3leI//x/vcD/IPneIJwK5kQZ+3seTGe3CH4obir18FFhyKqv0Id9Wtw6yWfI+1X
8ebCNK6R/MYL9AX8LVYQ4yNnjruawV49UQW9Q38fDNlDcU0CGKhOjnblWAnnp+HS
dvS2RPO5uAnu0dVJ0WicjMf82R2ApIkM6gLUQvE0CZv/mMQHtEIoeA8Ex94aR/ii
WNpybPG3A0HHFlRv62jdTqqYtwQ1pwkrnx18W8eFf01uhECAacyVRV2APJIO4gyQ
5XjFK+7SRV+6gGCcG3KEiFQfBKjy6y6/wREOlN2ZTwqIvBiMgrWugV1bPsy5BAhU
FxHeNuBTzM37FTFdg/uKZN4kBWI6qZOvNF4/R7aDO+XE265Sp1Xvm6eyO/GmlzD3
O51orPq9Jn/skUIoGZIHwzLgd2gKSnBva8rDp0mqcOVASwL3cBN6KbaEKUAbeW38
eVBWKFO0LL4E7blATzyEvtHQHnozRZOrkI8/UgeKycI02pBdA7/CGawuUfIVwHuh
ozHw+BytFLGuU8GZtWAMUt8X7YQ8RH7nlDppC4eu0VKcMBedoUY=
=Em8c
-----END PGP SIGNATURE-----

--3JWHCGIvlHPlU6rB--
