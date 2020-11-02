From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Default to assuming aligned reads are OK
Date: Mon, 2 Nov 2020 11:03:47 -0500
Message-ID: <20201102160347.GJ5340@bill-the-cat>
References: <20201030185658.4655-1-trini@konsulko.com>
 <20201102005607.GA143651@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BaAhobP9R+klFZfp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G/dQIcQ9ETZPvgWDhLV8HTB72STWurbjO36oVxfq7IU=;
        b=Ca8xzQq9Q0BMdaJp1TE4RmYsaMdWN1Ic5hHX2kwrqjDkF/0iGWyBeKeNsZx+FmthRM
         CFaSxQr8tNotTCUusQr81M0yk0xTjyewKBHgIcpjbgxCd/hTpXmFECVbjnTBuK87m0oB
         Bmc2lbvJ3SdBTXuKEjavdlRa2OpUZyvEGTnAM=
Content-Disposition: inline
In-Reply-To: <20201102005607.GA143651-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--BaAhobP9R+klFZfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 11:56:07AM +1100, David Gibson wrote:
> On Fri, Oct 30, 2020 at 02:56:58PM -0400, Tom Rini wrote:
> > Start with commit 6dcb8ba4 "libfdt: Add helpers for accessing unaligned
> > words" which introduced changes to support unaligned reads for ARM
> > platforms and 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned
> > reads on ARM" to improve the performance of these helpers, libfdt has
> > defaulted to assuming that unaligned memory access could be a fatal
> > problem.
> >=20
> > Upon further discussion on the mailing list, we leave the improved
> > unaligned-safe memory load functions available if needed, but go back to
> > using fdt{32,64}_to_cpu() for access as generally platforms handle
> > unaligned access safely and there is still a sizable performance and
> > size impact of using the always-safe helpers in all cases.
>=20
> I think the basic change is ok, but there's some details I'd like to
> see changed.
>=20
> First, I'd like to see an alignment check added to fdt_probe_ro_().

OK, that's not hard.  Do you want a new error code or FDT_ERR_INTERNAL
or something else?

> > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  fdtget.c        |  2 +-
> >  libfdt/fdt_ro.c | 20 ++++++++++----------
> >  libfdt/libfdt.h |  2 +-
> >  3 files changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/fdtget.c b/fdtget.c
> > index 777582e2d45f..7cee28718cbc 100644
> > --- a/fdtget.c
> > +++ b/fdtget.c
> > @@ -62,7 +62,7 @@ static int show_cell_list(struct display_info *disp, =
const char *data, int len,
> >  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
> >  		if (i)
> >  			printf(" ");
> > -		value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> > +		value =3D size =3D=3D 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
>=20
> Second, getting rid of these ugly open-coded constructions was an
> additional reason I went to using fdt32_ld() everywhere.  So I'd like
> to see both an assume-aligned and an unaligned-safe helper, rather
> than open-coding the load-and-byteswap everywhere.

OK, I think I've got an idea.

--=20
Tom

--BaAhobP9R+klFZfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+gLeAACgkQFHw5/5Y0
tyzk6gv/S9b+HVZduOcKGVF2Xjo25R3v4IX3dc33wLIhc1L1ZJkqA3afkc1ly2OK
RtT3/ntMawacGIACfMPoUy9dpJ7q7tDE2dfhXqqDdPZqx8yQPSA8J4+DN2p3KuFr
gELrlTcwqGiN7CB61zPVHfquZ8L6DAsVHSVE5a1rDE1nYPHm+nGDxrgfl1hkuxFX
BlhbL2V3aHt8K6PaqkRcItk04lfIPYF19v8j4FzeJwUYE2zt9oypR34je6zH+j43
KKmIVkQ+W73a3ZBIdXj3UVpJFKsOwaKTY520L/KoH5rFUB6sGCq2n8woBi7AO5M4
R6OWX6ObV4jXtdQz+lcKkhO2++EkCmGPCWNa4qeLtVsrSmA3tgc/GeeMc3b3OE43
YrWUxaO3scMEVRbdFBIm5D3XJC6HbC+XYPXG+9C0Yw/LqO52C99JjuEXNVGXgguL
B0T3+RmdiFZ9ntbiVNb4zo2VcN8THgo0M6pLS+dfjlrfh64OqwPlIWCeAUK7nSB9
VEYxhvJB
=AttF
-----END PGP SIGNATURE-----

--BaAhobP9R+klFZfp--
