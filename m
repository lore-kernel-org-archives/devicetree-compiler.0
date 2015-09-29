From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/3] fdt: Add a function to get the index of a string
Date: Tue, 29 Sep 2015 15:54:46 +1000
Message-ID: <20150929055446.GQ19428@voom.redhat.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
 <1437045021-4549-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7kD9y3RnPUgTZee0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437045021-4549-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--7kD9y3RnPUgTZee0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 01:10:20PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Given a device tree node and a property name, the new fdt_find_string()
> function will look up a given string in the string list contained in the
> property's value and return its index.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This also looks good, except for the name.  I'd prefer
'fdt_stringlist_search()' again to match the existing
'fdt_stringlist_contains()'.

Speaking of which, fdt_stringlist_contains() could be reimplemented in
terms of this function.

> ---
> Changes in v2:
> - handle non-NUL-terminated properties more gracefully
> - improve documentation
>=20
>  libfdt/fdt_ro.c | 30 ++++++++++++++++++++++++++++++
>  libfdt/libfdt.h | 22 ++++++++++++++++++++++
>  tests/strings.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index cf55c71df79c..39b84b1cea60 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -563,6 +563,36 @@ int fdt_count_strings(const void *fdt, int nodeoffse=
t, const char *property)
>  	return count;
>  }
> =20
> +int fdt_find_string(const void *fdt, int nodeoffset, const char *propert=
y,
> +		    const char *string)
> +{
> +	int length, len, index =3D 0;
> +	const char *list, *end;
> +
> +	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
> +	if (!list)
> +		return -length;
> +
> +	len =3D strlen(string) + 1;
> +	end =3D list + length;
> +
> +	while (list < end) {
> +		length =3D strnlen(list, end - list) + 1;
> +
> +		/* Abort if the last string isn't properly NUL-terminated. */
> +		if (list + length > end)
> +			return -FDT_ERR_BADVALUE;
> +
> +		if (length =3D=3D len && memcmp(list, string, length) =3D=3D 0)
> +			return index;
> +
> +		list +=3D length;
> +		index++;
> +	}
> +
> +	return -FDT_ERR_NOTFOUND;
> +}
> +
>  int fdt_node_check_compatible(const void *fdt, int nodeoffset,
>  			      const char *compatible)
>  {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index bf60c1593e4e..e64680dd741c 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -885,6 +885,28 @@ int fdt_stringlist_contains(const char *strlist, int=
 listlen, const char *str);
>   */
>  int fdt_count_strings(const void *fdt, int nodeoffset, const char *prope=
rty);
> =20
> +/**
> + * fdt_find_string - find a string in a string list and return its index
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of a tree node
> + * @property: name of the property containing the string list
> + * @string: string to look up in the string list
> + *
> + * Note that it is possible for this function to succeed on property val=
ues
> + * that are not NUL-terminated. That's because the function will stop af=
ter
> + * finding the first occurrence of @string. This can for example happen =
with
> + * small-valued cell properties, such as #address-cells, when searching =
for
> + * the empty string.
> + *
> + * @return:
> + *   the index of the string in the list of strings
> + *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
> + *   -FDT_ERR_NOTFOUND if the property does not exist or does not contain
> + *                     the given string
> + */
> +int fdt_find_string(const void *fdt, int nodeoffset, const char *propert=
y,
> +		    const char *string);
> +
>  /**********************************************************************/
>  /* Read-only functions (addressing related)                           */
>  /**********************************************************************/
> diff --git a/tests/strings.c b/tests/strings.c
> index e10d9ece5a3e..29c49bfcc78c 100644
> --- a/tests/strings.c
> +++ b/tests/strings.c
> @@ -40,6 +40,24 @@ static void check_expected_failure(const void *fdt, co=
nst char *path,
>  	err =3D fdt_count_strings(fdt, offset, "#address-cells");
>  	if (err !=3D -FDT_ERR_BADVALUE)
>  		FAIL("unexpectedly succeeded in parsing #address-cells\n");
> +
> +	err =3D fdt_find_string(fdt, offset, "#address-cells", "foo");
> +	if (err !=3D -FDT_ERR_BADVALUE)
> +		FAIL("found string in #address-cells: %d\n", err);
> +
> +	/*
> +	 * Note that the #address-cells property contains a small 32-bit
> +	 * unsigned integer, hence some bytes will be zero, and searching for
> +	 * the empty string will succeed.
> +	 *
> +	 * The reason for this oddity is that the function will exit when the
> +	 * first occurrence of the string is found, but in order to determine
> +	 * that the property does not contain a valid string list it would
> +	 * need to process the whole value.
> +	 */
> +	err =3D fdt_find_string(fdt, offset, "#address-cells", "");
> +	if (err !=3D 0)
> +		FAIL("empty string not found in #address-cells: %d\n", err);
>  }
> =20
>  static void check_string_count(const void *fdt, const char *path,
> @@ -61,6 +79,23 @@ static void check_string_count(const void *fdt, const =
char *path,
>  		     path, property, err, count);
>  }
> =20
> +static void check_string_index(const void *fdt, const char *path,
> +			       const char *property, const char *string,
> +			       int index)
> +{
> +	int offset, err;
> +
> +	offset =3D fdt_path_offset(fdt, path);
> +	if (offset < 0)
> +		FAIL("Couldn't find path %s", path);
> +
> +	err =3D fdt_find_string(fdt, offset, property, string);
> +
> +	if (err !=3D index)
> +		FAIL("Index of %s in property %s of node %s is %d, expected %d\n",
> +		     string, property, path, err, index);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	void *fdt;
> @@ -78,5 +113,10 @@ int main(int argc, char *argv[])
>  	check_string_count(fdt, "/device", "compatible", 2);
>  	check_string_count(fdt, "/device", "big-endian", 0);
> =20
> +	check_string_index(fdt, "/", "compatible", "test-strings", 0);
> +	check_string_index(fdt, "/device", "compatible", "foo", 0);
> +	check_string_index(fdt, "/device", "compatible", "bar", 1);
> +	check_string_index(fdt, "/device", "big-endian", "baz", -1);
> +
>  	PASS();
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7kD9y3RnPUgTZee0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWCiemAAoJEGw4ysog2bOSD2cQANf37hyQ3SEmbuBDT4K9pCoa
mHzvHadHp9MDx50VimianvvKIpX7UiksnbnMNOf41O1UIy8F6RMEHhKP3M25pwzb
cYHzmUdj0CoIH9uA1WMfbo2vmv+cbTNz3yi8F7vBkaomW0CwbHNH67SNzH36MzHh
5pj2No4oK6S7VzWxwxn41Z2Q8J18Gith7qhPwDuaNqe+fajdyjvWvCCW8bOg/hYv
epkh4j0pz1eJiBeIBQkSlPSWmPO+ysYkli1xDwvtCL+/47i8SKYqAcDtekM9FSDC
MfhhY5cKXcwqvGGELi/0xH0vuxJq1QX3s5rFpEGM21gyBkuCBvDwrL9ga01BM47o
mDRI/iOBdfrrNbDLRF9ey9Vnn7LyPEUFg0FORIsI4dOLKMa9aoDf/xm1lSrMbkgy
Zh+zYklTCIISFEtVRbDb7w3Bpq80qp9+vkoxi71+pLdSphuJjaw7U8Bjq8yhY4Ws
38Zg9VKrHri1CMtMQ8LQ2R8GYnMBRrfZbp3vWw0AdIHbqHO4s3mZ+0SCMgr/hkUq
cwm2KRLENF6Z62C4Q4M7t55b9qYnSjQCs/JGosTRb2sxLIHElILRljd2AqDrV7Z8
YySKwfl0qHYqinlPwdfasG6IY1F0bh1pZjv15RSJawsFR7fxOfGLx1W/nNHJG0I3
wiRH81BsXl0yaVR5EM6r
=ViIX
-----END PGP SIGNATURE-----

--7kD9y3RnPUgTZee0--
