From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/5] Move marker functions to dtc.h
Date: Mon, 11 Oct 2021 16:29:45 +1100
Message-ID: <YWPLyV2ZzHnjYwgl@yekko>
References: <20210727183023.3212077-1-robh@kernel.org>
 <20210727183023.3212077-2-robh@kernel.org>
 <YScR9WbrB/1KHsk9@yekko>
 <CAL_Jsq+QAnyu=Fj_RtRu-dS4Ta0bZJWFUABsK1uKbnAKpXi1mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KbBSkxNCZsuzTbAa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1633936793;
        bh=X95TPIQn7EvgP93RfLLZ+J/0lxnlyg9QN9XnicbXWKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mMJRuyPb9leuHCD4D0IQYECIdqGmC024w7vS+D9lJ1/nAIy1jtuKxP7u0nIFqpgJy
         jysICdrmqy2azkQi1K6G3FoHbd+c1TMIYfQcrNzVUoJ/5m7yZCvsxcCTTB/4Fm4weV
         FbHDUKtKObNmSfa8DVwkz2QWoT89BZLmNgLhy+1g=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+QAnyu=Fj_RtRu-dS4Ta0bZJWFUABsK1uKbnAKpXi1mA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--KbBSkxNCZsuzTbAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 03:56:43PM -0500, Rob Herring wrote:
> On Wed, Aug 25, 2021 at 11:09 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Jul 27, 2021 at 12:30:19PM -0600, Rob Herring wrote:
> > > In preparation to share the marker related functions, let's move them=
 all
> > > out of treeresource.c into dtc.h. Rework the next_type_marker()
> > > implementation to use for_each_marker() instead of open coding it.
> > >
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Applied, thanks.
>=20
> I was about to say this never got pushed out. Then I looked at bit
> harder and found this gem:
>=20
> commit ff3a30c115ad7354689dc7858604356ecb7f9b1c
> Author: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Yikes.  I'm not sure how that happened.  I must have screwed up some
git command during a re-org / rebase.  Good news is it postdates the
latest tagged version.  Bad news is it's committed to a public branch
that's not supposed to rebase.

The question is, is it worth forcing anyone who pulled HEAD in the
interim to do a rebase/repull in order to fix it.

> Date:   Tue Jul 27 12:30:19 2021 -0600
>=20
>     asm: Use .asciz and .ascii instead of .string
>=20
>     We use the .string pseudo-op both in some of our test assembly files
>     and in our -Oasm output.  We expect this to emit a \0 terminated
>     string into the .o file.  However for certain targets (e.g. HP
>     PA-RISC) it doesn't include the \0.  Use .asciz instead, which
>     explicitly does what we want.
>=20
>     There's also one place we can use .ascii (which explicitly emits a
>     string *without* \0 termination) instead of multiple .byte directives.
>=20
>     Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>=20
>  dtc.h            | 23 ++++++++++++++++++++++-
>  flattree.c       |  6 +++---
>  tests/base01.asm | 38 +++++++++++++++++++-------------------
>  tests/test01.asm | 52 ++++++++++++++++++++++++++------------------------=
--
>  tests/trees.S    | 10 ++++------
>  treesource.c     | 23 +----------------------
>  6 files changed, 75 insertions(+), 77 deletions(-)
>=20
>=20
> Perhaps your own commits should be sent to the list as well...

Alas, I don't think that would help here.  If there were a problem
with the actual patch content you'd have a point.  However, that error
would have been introduced during commit / merge / git shenannigans,
rather than while writing the patch, so list review wouldn't help.

> Are you going to apply or review the rest of my series that's been
> sitting on the list for 2 months now?

I'm sorry.  I'm moving onto new projects and it's hard to find time to
keep on top of this.  Plus, the fact that I still consider the whole
yaml based schema stuff a fundamentally misguided design doesn't help
with my enthusiasm.  I've merged one and reviewed the rest now.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KbBSkxNCZsuzTbAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFjy8kACgkQbDjKyiDZ
s5L47RAAu0TPWS3Rw8SZKvJvkQMF3hM1sJBymviv0ybjDozkLyKmsqhNUbCb43lq
49t6pbXprIPIbP/K7bUqtf/yANJrpBP6MKdYlC1bgFg/z+2ubRNIkBg3lpaa1hJW
cKvNBZ0JuRo65dYti+i8zp7gehmAkpyxJSLHiBDoChX08cq8JIHn3x03ojEmWb9R
lvsSH22uzZM9saHMX+VTxRAG2KHzctDslicuO2Mhti4d4OMADC1F7SrVGiUTcS/f
MECtBSfCSpKodGEk9d6V966pFdUV8aDi+N7OvnfQlox4vmLRXsIvooQJnM5fkAAH
nyiGj2Qe/qk4ngpRygryUdeXvvw/TGps798zkXLVuYOIuf/0IXf+WFhqa95ycyPg
toxH2q9hv8FtiG0scmEybfcQODIexY3ckAQ6C6/bO/7HKaKttIG68+C0AX0tpAen
2j/N6oH398Omdr4Muheb9zttYUcPaOpEsIUR3Hmqq5EraojL0pswX6DcLk7Ijxo6
LoBcN6sz9bIOy/YTh98NFZqSUAkGKw1Td1B/e961GmvboHflrBWYoR3m8GmaM7fH
uJCJFtc9ft1K45le2ew6fHg4hPltFZO7rKCDfGqCeArfC6J4mPLCLxTaxuVETc/Y
ooCcMaei6TiNG2epyxEQ5TrQ/8wWe9UoAK2sBkLLGTxdZ16HQLc=
=P1Ae
-----END PGP SIGNATURE-----

--KbBSkxNCZsuzTbAa--
