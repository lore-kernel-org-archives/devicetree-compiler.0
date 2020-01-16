From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Thu, 16 Jan 2020 16:49:55 +1000
Message-ID: <20200116064955.GR54439@umbus>
References: <20200112185209.75847-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0ZpWocbG2H/Vq+uQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579157403;
        bh=j921J58pRaZxWvFK9EJo1G7JkPuoJPh7okpF3IcAAE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Afxqa7YiI+wUy1QConRPT1GTk62mwNU8Ceh+FpV01ZS1vsjVPEIGPtvrsDW99+38M
         EdDrhce1b5JKQct/SHYVXIr8hxsCPcRb2XNdvj/fCtub0XBgNT1BoX6HQx9LYEoTlV
         15q5mpr6TUNtytPXnpqk9E0u9sCk/yQ+U8irj7Bk=
Content-Disposition: inline
In-Reply-To: <20200112185209.75847-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--0ZpWocbG2H/Vq+uQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2020 at 11:52:08AM -0700, Simon Glass wrote:
> These warnings appear when building U-Boot on x86 and some other targets.
> Correct them by adding casts.
>=20
> Example:
>=20
> scripts/dtc/libfdt/fdt.c: In function =E2=80=98fdt_offset_ptr=E2=80=99:
> scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer expressio=
ns of different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=98int=
=E2=80=99 [-Wsign-compare]
>    if ((absoffset < offset)
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hmm.  So squashing warnings is certainly a good thing in general.

Unfortunately, I'm really uncomfortable with most of these changes.
In a number of cases they are outright wrong.  In most of the others,
the code was already correct.  I dislike adding casts to suppress
spurious warnings on correct code because that can end up hiding real
problems which might be introduced by future changes.

Case by case details below.

> ---
>=20
>  libfdt/fdt.c          |  4 ++--
>  libfdt/fdt_overlay.c  |  2 +-
>  libfdt/fdt_ro.c       | 13 +++++++------
>  libfdt/fdt_strerror.c |  2 +-
>  libfdt/fdt_sw.c       |  9 +++++----
>  libfdt/fdt_wip.c      |  2 +-
>  6 files changed, 17 insertions(+), 15 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index d6ce7c0..8b29dbd 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -116,7 +116,7 @@ const void *fdt_offset_ptr(const void *fdt, int offse=
t, unsigned int len)
>  	unsigned absoffset =3D offset + fdt_off_dt_struct(fdt);
> =20
>  	if ((absoffset < offset)
> -	    || ((absoffset + len) < absoffset)
> +	    || ((absoffset + len) < (unsigned int)absoffset)

I'm baffled by this.  Both absoffset and len are defined as unsigned,
so how is a signed comparison appearing here?

>  	    || (absoffset + len) > fdt_totalsize(fdt))
>  		return NULL;
> =20
> @@ -283,7 +283,7 @@ int fdt_move(const void *fdt, void *buf, int bufsize)
>  {
>  	FDT_RO_PROBE(fdt);
> =20
> -	if (fdt_totalsize(fdt) > bufsize)
> +	if (fdt_totalsize(fdt) > (unsigned int)bufsize)

I don't like this change.  The comparison is correct as it stands,
even though the types are different: fdt_totalsize() > INT_MAX (which
should always result in a false comparison) is an error in the dtb,
and that's checked by fdt_ro_probe_().

Worse, this means that passing in -1 to what is a signed int parameter
will now make the test *pass*, which really doesn't seem right.

>  		return -FDT_ERR_NOSPACE;
> =20
>  	memmove(buf, fdt, fdt_totalsize(fdt));
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index b310e49..dba4f52 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -250,7 +250,7 @@ static int overlay_update_local_node_references(void =
*fdto,
>  			return tree_len;
>  		}
> =20
> -		for (i =3D 0; i < (fixup_len / sizeof(uint32_t)); i++) {
> +		for (i =3D 0; i < (int)(fixup_len / sizeof(uint32_t)); i++) {

Hrm.  Not sure how to handle that.  The explicit cast is ugly (and
casts in general make things more fragile), but there is a real type
difference.  It's pretty easy to see that this usage is safe, since an
int divided by sizeof(uint32_t) is clearly within the range of an int.

>  			fdt32_t adj_val;
>  			uint32_t poffset;
> =20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index a5c2797..e4c90d4 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -44,7 +44,7 @@ const char *fdt_get_string(const void *fdt, int stroffs=
et, int *lenp)
>  		goto fail;
> =20
>  	err =3D -FDT_ERR_BADOFFSET;
> -	if (absoffset >=3D totalsize)
> +	if (absoffset >=3D (unsigned int)totalsize)
>  		goto fail;

Again, this test is correct, despite the difference in types.  This
time the change is safe, because we've just verified that totalsize >=3D
0, but assuming here still makes the code a bit more fragile against
rearrangements.

>  	len =3D totalsize - absoffset;
> =20
> @@ -52,14 +52,14 @@ const char *fdt_get_string(const void *fdt, int strof=
fset, int *lenp)
>  		if (stroffset < 0)
>  			goto fail;
>  		if (fdt_version(fdt) >=3D 17) {
> -			if (stroffset >=3D fdt_size_dt_strings(fdt))
> +			if ((unsigned int)stroffset >=3D fdt_size_dt_strings(fdt))

Again, the test is correct despite the type difference.  We've checked
for the stroffset < 0 case a few lines above.

>  				goto fail;
>  			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
>  				len =3D fdt_size_dt_strings(fdt) - stroffset;
>  		}
>  	} else if (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) {
>  		if ((stroffset >=3D 0)
> -		    || (stroffset < -fdt_size_dt_strings(fdt)))
> +		    || ((unsigned int)stroffset < -fdt_size_dt_strings(fdt)))

This is 100% wrong.  In the SW case stroffset *will* be negative
(we've just checked against that above), and forcing it to an unsigned
will give us the wrong result.

>  			goto fail;
>  		if ((-stroffset) < len)
>  			len =3D -stroffset;
> @@ -151,9 +151,10 @@ static const struct fdt_reserve_entry *fdt_mem_rsv(c=
onst void *fdt, int n)
>  	int offset =3D n * sizeof(struct fdt_reserve_entry);
>  	int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
> =20
> -	if (absoffset < fdt_off_mem_rsvmap(fdt))
> +	if ((unsigned int)absoffset < fdt_off_mem_rsvmap(fdt))
>  		return NULL;

I think there's a real bug here, but rather than casting it would be
preferable to change the type of absoffset and offset to unsigned.

> -	if (absoffset > fdt_totalsize(fdt) - sizeof(struct fdt_reserve_entry))
> +	if ((unsigned int)absoffset > fdt_totalsize(fdt) -
> +	    sizeof(struct fdt_reserve_entry))

Same here.

>  		return NULL;
>  	return fdt_mem_rsv_(fdt, n);
>  }
> @@ -658,7 +659,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint3=
2_t phandle)
>  {
>  	int offset;
> =20
> -	if ((phandle =3D=3D 0) || (phandle =3D=3D -1))
> +	if ((phandle =3D=3D 0) || (phandle =3D=3D (uint32_t)-1))

This change is ok.

>  		return -FDT_ERR_BADPHANDLE;
> =20
>  	FDT_RO_PROBE(fdt);
> diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
> index 768db66..c02c6ef 100644
> --- a/libfdt/fdt_strerror.c
> +++ b/libfdt/fdt_strerror.c
> @@ -48,7 +48,7 @@ const char *fdt_strerror(int errval)
>  		return "<valid offset/length>";
>  	else if (errval =3D=3D 0)
>  		return "<no error>";
> -	else if (errval > -FDT_ERRTABSIZE) {
> +	else if (errval > (int)-FDT_ERRTABSIZE) {

This one confuses me as well.  If the unary - on the RHS was being
interpreted unsigned, I can't see how this could have ever worked.
But I have gotten meaningful results from fdt_strerror(), so that
doesn't seem right.

But if FDT_ERRTABSIZE is being coerced to signed before applying the
unary -, then I don't see why there's any cause to warn.

>  		const char *s =3D fdt_errtable[-errval].str;
> =20
>  		if (s)
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 76bea22..e37d785 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -95,7 +95,8 @@ static void *fdt_grab_space_(void *fdt, size_t len)
>  	spaceleft =3D fdt_totalsize(fdt) - fdt_off_dt_struct(fdt)
>  		- fdt_size_dt_strings(fdt);
> =20
> -	if ((offset + len < offset) || (offset + len > spaceleft))
> +	if ((offset + len < (size_t)offset) ||
> +	    (offset + len > (size_t)spaceleft))
>  		return NULL;

Looks like changing the type of offset would be preferable.

> =20
>  	fdt_set_size_dt_struct(fdt, offset + len);
> @@ -108,7 +109,7 @@ int fdt_create_with_flags(void *buf, int bufsize, uin=
t32_t flags)
>  					 sizeof(struct fdt_reserve_entry));
>  	void *fdt =3D buf;
> =20
> -	if (bufsize < hdrsize)
> +	if ((unsigned int)bufsize < hdrsize)
>  		return -FDT_ERR_NOSPACE;

As with some of the earlier things, the existing comparison is
correct, and the changed one is actively dangerous if the caller
passes a negative bufsize.

> =20
>  	if (flags & ~FDT_CREATE_FLAGS_ALL)
> @@ -154,7 +155,7 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
>  	if ((headsize + tailsize) > fdt_totalsize(fdt))
>  		return -FDT_ERR_INTERNAL;
> =20
> -	if ((headsize + tailsize) > bufsize)
> +	if ((headsize + tailsize) > (size_t)bufsize)

Ditto.

>  		return -FDT_ERR_NOSPACE;
> =20
>  	oldtail =3D (char *)fdt + fdt_totalsize(fdt) - tailsize;
> @@ -248,7 +249,7 @@ static int fdt_add_string_(void *fdt, const char *s)
> =20
>  	offset =3D -strtabsize - len;
>  	struct_top =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
> -	if (fdt_totalsize(fdt) + offset < struct_top)
> +	if (fdt_totalsize(fdt) + offset < (unsigned int)struct_top)
>  		return 0; /* no more room :( */

struct_top is generated as the sum of two unsigneds, so changing its
type would be preferable.

>  	memcpy(strtab + offset, s, len);
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index f64139e..82db674 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -23,7 +23,7 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int =
nodeoffset,
>  	if (!propval)
>  		return proplen;
> =20
> -	if (proplen < (len + idx))
> +	if ((unsigned int)proplen < (len + idx))

Oof. this is a bit nasty.  We're not checking for overflow of len +
idx at all, which is a bigger issue than the signedness.

>  		return -FDT_ERR_NOSPACE;
> =20
>  	memcpy((char *)propval + idx, val, len);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0ZpWocbG2H/Vq+uQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4gB5AACgkQbDjKyiDZ
s5LunQ/9EZHVqOI98rY8ocUjb/QwDzBJ7ji3/k4C/E3CB+2Tf1dqXJ5qHiN6jVuO
f6s6DaagtzZm4SIhaeABrUw/41kLRF5EojSWpJGkA2EzkrMaGd9knN12w97Mtrk1
cNHT4S6qfPQ7NmN68qjcMj0up8oq2vQJh5GVnlpkq2a3DO8Y97PcYPyJTrLnfXSY
UIX+l9z8YOnTTZfbx7VcLIPeOpSGxBCBJSfcpECxcTlautuA2yaOADsNUWEQXmtx
wDqvVksq3PHeq0TuDyikVodHuOSuALwmOoIJ2ynBEvtQqFoZmGuynFl/3ZR/VaWN
cAE4zHr2o/3bY9wD7V9xNj61QIbXY2UVveQXFLMc6UIJUtD2denyMuzb0UChmWmB
Gd8CNIBURfTmOfBbJm6WWvbu1th1134Zo8sBceh3PEK5e1Vdh6kiuvihsf2JATZc
HSe7MrkLUDfmm/7ZuYvLDHHMEPsmB65r4oFSMibSHZ7L2Fq9qEwrbNtLQCafUKJ6
e272WOj8ZekJBvSoBmoP7aQ6kBTJWGkB2VM2666XUmfpt3XszEGBz7MjEW4OcxTP
Ox52Y6D7njYXc+HPaa5V7uKQJUTC59fWF9I+xO6zpk27C3p9kWjjKP2PYDNlUwqC
CzmZ5S3GCX+Tbqw4uShMfEsg/DB92DIqP9hTovK3KnlIn2pjJcc=
=PgDs
-----END PGP SIGNATURE-----

--0ZpWocbG2H/Vq+uQ--
