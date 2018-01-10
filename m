From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH] checks: Use source position information for check
 failures
Date: Thu, 11 Jan 2018 10:43:40 +1100
Message-ID: <20180110234340.GD24770@umbus.fritz.box>
References: <20180108224927.1016-1-robh@kernel.org>
 <20180110053020.GD19773@umbus.fritz.box>
 <CAL_Jsq+Brr4e1ZvPapnpRLb5hJPsyBjxoZAdDeaqsD2y0Ma6Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515628795;
        bh=/Iw3Op0a7pMfGWI05Z4IQx56gOHBjwbMfyelZEOWm84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pdj1T7ZZ8T99Rvix3TSvGXvhc55KnAyNE127aWTPbuaoTP66/sfU6w5hAJVdqlQUc
         Ye9ij2pfyFCHqGdiGWZdnc8pVhZ/hwe+/FyAFpYSUwLKGEa8RPnTc33XaU8mVe+4ON
         pckOZmX/P0lgBGeLYzsU5mBjRurZNOGvHb366PXI=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Brr4e1ZvPapnpRLb5hJPsyBjxoZAdDeaqsD2y0Ma6Jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2018 at 10:41:54AM -0600, Rob Herring wrote:
> On Tue, Jan 9, 2018 at 11:30 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Mon, Jan 08, 2018 at 04:49:27PM -0600, Rob Herring wrote:
> >> Now that we retain source position information of nodes and properties,
> >> make that the preferred file name (and position) to print out in check
> >> failures. This will greatly simplify finding and fixing check errors
> >> because most errors are in included source .dtsi files and they get
> >> duplicated every time the source file is included.
> >>
> >> For now, only converting a few locations and using a new macro name. I
> >> will convert all FAIL occurences once we agree on the new syntax. Also,
> >> after this, some checks may need some rework to have more specific
> >> line numbers of properties rather than nodes.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > So, I like the basic idea here - something I've kind of wanted for a wh=
ile.
> >
> >> ---
> >> This is based on Julia's annotation series.
> >
> > But that series will need a new spin, which will require a new spin of
> > this at the last.
>=20
> Yes, I expected that.
>=20
> >>  checks.c | 28 ++++++++++++++++++++++------
> >>  1 file changed, 22 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/checks.c b/checks.c
> >> index 7845472742e0..2078c0fe75eb 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -19,6 +19,7 @@
> >>   */
> >>
> >>  #include "dtc.h"
> >> +#include "srcpos.h"
> >>
> >>  #ifdef TRACE_CHECKS
> >>  #define TRACE(c, ...) \
> >> @@ -72,7 +73,8 @@ struct check {
> >>  #define CHECK(nm_, fn_, d_, ...) \
> >>       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> >>
> >> -static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt=
_info *dti,
> >> +static inline void  PRINTF(4, 5) check_msg(struct check *c, struct dt=
_info *dti,
> >> +                                        struct srcpos *pos,
> >>                                          const char *fmt, ...)
> >>  {
> >>       va_list ap;
> >> @@ -80,8 +82,15 @@ static inline void  PRINTF(3, 4) check_msg(struct c=
heck *c, struct dt_info *dti,
> >>
> >>       if ((c->warn && (quiet < 1))
> >>           || (c->error && (quiet < 2))) {
> >> +             const char *file_str;
> >> +             if (pos)
> >> +                     file_str =3D srcpos_string(pos);
> >> +             else if (streq(dti->outname, "-"))
> >> +                     file_str =3D "<stdout>";
> >> +             else
> >> +                     file_str =3D dti->outname;
> >>               fprintf(stderr, "%s: %s (%s): ",
> >> -                     strcmp(dti->outname, "-") ? dti->outname : "<std=
out>",
> >> +                     file_str,
> >>                       (c->error) ? "ERROR" : "Warning", c->name);
> >
> > Incidentally, the reason it currently shows the output name, which
> > seems weird at first glance, is so that if you have a whole batch of
> > dtc commands running from a script or Makefile, you can at least tell
> > which command caused the check failure.
>=20
> Yes, better than nothing...
>=20
> >
> >>               vfprintf(stderr, fmt, ap);
> >>               fprintf(stderr, "\n");
> >> @@ -93,7 +102,14 @@ static inline void  PRINTF(3, 4) check_msg(struct =
check *c, struct dt_info *dti,
> >>       do {                                                            \
> >>               TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);  \
> >>               (c)->status =3D FAILED;                                 =
  \
> >> -             check_msg((c), dti, __VA_ARGS__);                       \
> >> +             check_msg((c), dti, NULL, __VA_ARGS__);                 \
> >> +     } while (0)
> >> +
> >> +#define FAIL_POS(c, dti, p, ...)                                     =
        \
> >> +     do {                                                            \
> >> +             TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);  \
> >> +             (c)->status =3D FAILED;                                 =
  \
> >> +             check_msg((c), dti, p, __VA_ARGS__);                    \
> >>       } while (0)
> >>
> >>  static void check_nodes_props(struct check *c, struct dt_info *dti, s=
truct node *node)
> >> @@ -126,7 +142,7 @@ static bool run_check(struct check *c, struct dt_i=
nfo *dti)
> >>               error =3D error || run_check(prq, dti);
> >>               if (prq->status !=3D PASSED) {
> >>                       c->status =3D PREREQ;
> >> -                     check_msg(c, dti, "Failed prerequisite '%s'",
> >> +                     check_msg(c, dti, NULL, "Failed prerequisite '%s=
'",
> >>                                 c->prereq[i]->name);
> >>               }
> >>       }
> >> @@ -1049,7 +1065,7 @@ static void check_avoid_unnecessary_addr_size(st=
ruct check *c, struct dt_info *d
> >>       }
> >>
> >>       if (!has_reg)
> >> -             FAIL(c, dti, "unnecessary #address-cells/#size-cells wit=
hout \"ranges\" or child \"reg\" property in %s",
> >> +             FAIL_POS(c, dti, node->srcpos, "unnecessary #address-cel=
ls/#size-cells without \"ranges\" or child \"reg\" property in %s",
> >>                    node->fullpath);
> >
> > Checks are already associated with a node, would it make more sense to
> > print the position information from the general code?
>=20
> Not sure I follow the question. You mean pass in the struct node and
> get the srcpos and fullpath inside check_msg?

Basically, yes.

> While checks are associated with nodes, specific error messages may be
> associated with properties. This is one example where we could make
> the error message be the exact line (of the #address-cells or
> #size-cells), but that would require re-working the check a bit to get
> the property structs (and srcpos).

Ah, good point.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpWpSkACgkQbDjKyiDZ
s5K2zBAA0QOyMyPzdhOb8tkAmrUhFR12O4iiXRl1d8K2slQXyT8xxz4zSoFRHFpb
YOyhq1HCqrGjNbexbwRSEaiOEuXAhiD0EAVMQnrYdC8OhhsnuEQNuIWZrZbQ5Xss
TZ4TLBcZrPi7Aa5WgWqojH3kY7W/cP8A4pIjMSEx/DfoPhC0lDmm6Ao5aUmSNoij
PNd2wJZKk4aBCJuhSx6DTNamn/JUZhG0MB6wjQ0J3VABp7trEX/DAe5I4o0vvPVB
aO9LABa7Iqday5985ROs1zGdvv+zLckcIojoFZY0ExGtHdiidbeMXpzOIj1fWarZ
ZMWhVlZ1TY9lfnrS+kS36WCoF2NlDZJ5wEt0SGM6y48zgeKn1vAkqF0NdeueNOud
/g9ES1hYmPYYQ30rTsBmOcPsQJQ6t0ejlWAzpzDZMFVV6bux5HN8YkwGeRvPWucA
2tWqeC3Cj4tx6+O20AeByKvcdSeBZqmmEfhZ7crdb1tyHoBXoPZKHgvE4RVgIQvx
w6c8AsqYDqvqMAFI+cGCkodeOKrVk8AfWeC1W0zCW4BIgsx6yRvTR4tizOVcVjcO
oh3mumyUV51Vr4i6Hihc+cWgtMaQjKa4HOrAQrg3ODOvmfIaQL/hn4+pKPtmkf9f
+bW3CajcReg0T6y6bePPeyQd/UmPC42BOVz6lpZbWRc7pJHeylY=
=LmCW
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
