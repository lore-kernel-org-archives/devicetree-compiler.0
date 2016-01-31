From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 07/26] libfdt: Add a function to write a property
 placeholder
Date: Sun, 31 Jan 2016 20:55:09 +1100
Message-ID: <20160131095509.GU23043@voom.redhat.com>
References: <1453999186-18747-1-git-send-email-sjg@chromium.org>
 <1453999186-18747-8-git-send-email-sjg@chromium.org>
 <20160129052917.GM23043@voom.redhat.com>
 <CAPnjgZ3jOaYuZOeafhnH0dq52uRa8iXjq=kC_8qtnB7Knq9GCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JcGvecxLhm+LytDG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3jOaYuZOeafhnH0dq52uRa8iXjq=kC_8qtnB7Knq9GCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--JcGvecxLhm+LytDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 11:23:31AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 28 January 2016 at 22:29, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> > On Thu, Jan 28, 2016 at 09:39:27AM -0700, Simon Glass wrote:
> >> The existing function to add a new property to a tree being built requ=
ires
> >> that the entire contents of the new property be passed in. For some
> >> applications it is more convenient to be able to add the property cont=
ents
> >> later, perhaps by reading from a file. This avoids double-buffering of=
 the
> >> contents.
> >>
> >> Add a new function to support this and adust the existing fdt_property=
() to
> >> use it.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > So, obviously such a patch should really go towards upstream libfdt.
> >
> > I'm happy enough with the concept, but I don't like the name.
> >
> > I'd prefer fdt_property_reserve() - the idea being that it reserves
> > space for the property but doesn't fill it in.
>=20
> Sounds good. I'll work up a patch. I tend to sync with upstream one a
> quarter or so.

Ok.

Actually, on further consideration, fdt_property_placeholder() is a
better name again.

>=20
> >
> >> ---
> >>
> >>  include/libfdt.h    | 16 ++++++++++++++++
> >>  lib/libfdt/fdt_sw.c | 16 ++++++++++++++--
> >>  2 files changed, 30 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/include/libfdt.h b/include/libfdt.h
> >> index e48c21a..c3f37ee 100644
> >> --- a/include/libfdt.h
> >> +++ b/include/libfdt.h
> >> @@ -1181,6 +1181,22 @@ static inline int fdt_property_cell(void *fdt, =
const char *name, uint32_t val)
> >>  {
> >>       return fdt_property_u32(fdt, name, val);
> >>  }
> >> +
> >> +/**
> >> + * fdt_property_val - add a new property and return a pointer to its =
value
> >> + *
> >> + * @fdt: pointer to the device tree blob
> >> + * @name: name of property to add
> >> + * @len: length of property value in bytes
> >> + * @valp: returns a pointer to where where the value should be placed
> >> + *
> >> + * returns:
> >> + *   0, on success
> >> + *   -FDT_ERR_BADMAGIC,
> >> + *   -FDT_ERR_NOSPACE, standard meanings
> >> + */
> >> +int fdt_property_val(void *fdt, const char *name, int len, void **val=
p);
> >> +
> >>  #define fdt_property_string(fdt, name, str) \
> >>       fdt_property(fdt, name, str, strlen(str)+1)
> >>  int fdt_end_node(void *fdt);
> >> diff --git a/lib/libfdt/fdt_sw.c b/lib/libfdt/fdt_sw.c
> >> index 320a914..9c1df3d 100644
> >> --- a/lib/libfdt/fdt_sw.c
> >> +++ b/lib/libfdt/fdt_sw.c
> >> @@ -175,7 +175,7 @@ static int _fdt_find_add_string(void *fdt, const c=
har *s)
> >>       return offset;
> >>  }
> >>
> >> -int fdt_property(void *fdt, const char *name, const void *val, int le=
n)
> >> +int fdt_property_val(void *fdt, const char *name, int len, void **val=
p)
> >>  {
> >>       struct fdt_property *prop;
> >>       int nameoff;
> >> @@ -193,7 +193,19 @@ int fdt_property(void *fdt, const char *name, con=
st void *val, int len)
> >>       prop->tag =3D cpu_to_fdt32(FDT_PROP);
> >>       prop->nameoff =3D cpu_to_fdt32(nameoff);
> >>       prop->len =3D cpu_to_fdt32(len);
> >> -     memcpy(prop->data, val, len);
> >> +     *valp =3D prop->data;
> >> +     return 0;
> >> +}
> >> +
> >> +int fdt_property(void *fdt, const char *name, const void *val, int le=
n)
> >> +{
> >> +     void *ptr;
> >> +     int ret;
> >> +
> >> +     ret =3D fdt_property_val(fdt, name, len, &ptr);
> >> +     if (ret)
> >> +             return ret;
> >> +     memcpy(ptr, val, len);
> >>       return 0;
> >>  }
> >>
>=20
> Regards,
> Simon

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JcGvecxLhm+LytDG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWrdn9AAoJEGw4ysog2bOSkk4QAJ/NFRAt1qf+qKuocwTkHH9K
wO9dpJZ5nQdAsQzlKTCsUbMjxWbo/61ZHiEq7R2RVhBx07Os0PkRA4q63WIpmSiS
TV5LP8isBftJ8kOUCBXgQN1jy2Xa7QC9ipQNvJs9sCDhVHQb6C8uWxUIPAx4QiU8
cRnG3syWvL/J/lEGzOnzHpfWK+iEAsjaINj8+y8nsQC2/IpDPp6X8FmTCQIdX4GN
QJlGmRvpDtPoXN0uriCK8w5InwAxmAc52ewon3PmJgovSWdDwtRPPVEmz1U6V82/
EybzgTuIAlWhe7xAQrLTtEnFRzVq7W+y2OHr+tiCfuQyGiKNDxt/OJ3ozlY0df1c
aplm286FuHX3dN/FCljqrd0NHK6mGNwp9l8lfpWgF81WaYcy5zfvjdUB6yEZFi/k
/CMf4D+y5q39y985rQEWEd0iYevgsgGnY4c4r8SuZ2sYbMxakQLDeoqoVtSfU/ce
VOA82gSyNnvuu0Ux/m9No877DG/NJeZt08p1Xj8cnr30m7HQrTjbLG/PUDKTZ5IU
xpfku+x5o2aEDmoia7LkqjWOGpRThJa1sdMsdy5FOCCjzZNS/XV+x6Oe7fOz0AZI
uDf3w+1j0L8tXRYEhhuTSrOyC0mbecLADsOxwXzHajS6OtbYmJLCIUPD9mqi+yh9
yC0SuKUyiulUuAdSOdRl
=4vx4
-----END PGP SIGNATURE-----

--JcGvecxLhm+LytDG--
