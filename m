From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: add phandle with arg property checks
Date: Wed, 23 Aug 2017 10:19:26 +1000
Message-ID: <20170823001926.GA5379@umbus.fritz.box>
References: <20170814214807.338-1-robh@kernel.org>
 <20170818043502.GQ5509@umbus.fritz.box>
 <CAL_Jsq+yA2W=SD9zSkWxw-R16uNELeqPqJK3fVMvi0_jhEbooQ@mail.gmail.com>
 <20170819073333.GA12356@umbus.fritz.box>
 <CAL_JsqKynMDP2LBjPj2KSgJiVfmNM4e1=uHYUO6GcUjXt7oJbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503448350;
        bh=yXsRhyFAMAv2TJl2WG8B6tWk68m3HW4BGUnXa+DIcHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CTCLNt6JceHMdWAZKBlaVmKp1xYpDYxXNahnhGpGAFuzv4aW/xyuAloRtb+fO511s
         xU19uWYI6VJqNDOZKsBhgOtrKgjQZ2y4yaFVkdOxaC51D60FNWHTiXhmli9hVB802Z
         BlkIrL56xuZzttMjnZzZIKwItNnmEOHKB9QSYPuc=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKynMDP2LBjPj2KSgJiVfmNM4e1=uHYUO6GcUjXt7oJbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 09:38:59AM -0500, Rob Herring wrote:
> On Sat, Aug 19, 2017 at 2:33 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Aug 18, 2017 at 11:02:01AM -0500, Rob Herring wrote:
> >> On Thu, Aug 17, 2017 at 11:35 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Mon, Aug 14, 2017 at 04:48:06PM -0500, Rob Herring wrote:
> >> >
> >> > Yay! Someone actually implementing checks.
> >>
> >> Not like it is my first. I'll celebrate when someone else does.
> >>
> >>
> >> >> Many common bindings follow the same pattern of client properties
> >> >> containing a phandle and N arg cells where N is defined in the prov=
ider
> >> >> with a '#<specifier>-cells' property. Add a checks for properties
> >> >> following this pattern.
> >> >
> >> > I think this description would be easier to follow if you led with a=
n example.
> >> >
> >> >>
> >> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >
> >> > Looks pretty good, though I have some suggestions.
> >> >
> >> >> ---
> >> >>  checks.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++
> >> >>  1 file changed, 117 insertions(+)
> >> >>
> >> >> diff --git a/checks.c b/checks.c
> >> >> index afabf64337d5..c0450e118043 100644
> >> >> --- a/checks.c
> >> >> +++ b/checks.c
> >> >> @@ -956,6 +956,120 @@ static void check_obsolete_chosen_interrupt_c=
ontroller(struct check *c,
> >> >>  WARNING(obsolete_chosen_interrupt_controller,
> >> >>       check_obsolete_chosen_interrupt_controller, NULL);
> >> >>
> >> >> +struct provider {
> >> >> +     const char *prop_name;
> >> >> +     const char *cell_name;
> >> >> +     bool optional;
> >> >> +};
> >> >> +
> >> >> +static void check_property_phandle_args(struct check *c,
> >> >> +                                       struct dt_info *dti,
> >> >> +                                       struct node *node,
> >> >> +                                       struct property *prop,
> >> >> +                                       const struct provider *prov=
ider)
> >> >> +{
> >> >> +     struct marker *m =3D prop->val.markers;
> >> >> +
> >> >> +     if (!m) {
> >> >> +             FAIL(c, dti, "Missing phandles in %s:%s",
> >> >> +                  node->fullpath, prop->name);
> >> >> +             return;
> >> >> +     }
> >> >> +     for_each_marker_of_type(m, REF_PHANDLE) {
> >> >
> >> > So going through the markers I think is not the best approach.
> >> > That'll work if the source contains a reference here, which it usual=
ly
> >> > will, but there are some circumstances where it could contain a "raw"
> >> > phandle value (the most obvious being when you're decompiling an
> >> > existing dtb).
> >> >
> >> > But I don't think you really need to.  Instead you should be able to
> >> > read the actual value, look it up with get_node_by_phandle().  You c=
an
> >> > make this check dependent on fixup_phandle_references to make sure
> >> > it's executed after the references are resolved.
> >>
> >> That's how I implemented it initially...
> >
> > Ok.. why did you change?
>=20
> Just because the code is a bit more compact using markers. But
> decompiling a dtb is a good reason I didn't think of.

Ok.  Well, if you can revert to the first way, that should be good.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmcygsACgkQbDjKyiDZ
s5LhPw//S3Tl9g6iXcvVqbQ871TEFy6YcoCZw8AF9vtquT+n/9uOxNMEyWInz30w
tV+W0/XA/cXwGWTTH6TGzhEs1AdRXNdiFZ0mi0Qn8CK44XA6SjkISV2PeNN6ANsn
XO8O/QCZnhHenPl1U4RrKgXWok0d+vSKe/j5MPS/U+GIPViABvU8Qkduje5dVqzY
spc/W4fVU0IqohYIj5RrBStNiLV4eRsbVsqrE52zUDycylti5Xet5CNYZ2qPLktQ
Gz3hgAw5wI+nRByKz1uDtlYpC/zKKxFUfe3S5mns07b8QY0Kv2yef+CKOnf3E/ti
Ye/etw1F/LabCRY1LtqfLLYZL6TjbbY1zlurdoee82y0ibx162C7KKpBDw3qWP0h
fEPWUFmZYOuaMz2lJ6c78i1ZNvXYIBW/jUPwPxbxBxCD7OyLW3G6N1nMGdXZdZ6y
Aeu16NQcJnt0FJonvFYVXq4Antaq1dMEl7X/z5hugfdu+6vO9AOh/Ha4IcrvTqrz
cJDpRkfA3mvgsz8PwMbQxJN9c+vzEU04sueF1sOyHnKMtRQCuAbOnM4tkuK0VpKE
kenixhPDhRqBcJ7900H2xpdFUXLS3gQSvIXlQhb4Exb9rC0/YPTBa7PW/hmwgD87
4r7/vKRA4BRqM+ImeYWc0DlneedlGjB/pPKY0vOzbdgiy4zxqR4=
=TtXq
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
