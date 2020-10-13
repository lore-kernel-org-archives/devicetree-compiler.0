From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Fix kernel-doc comments
Date: Tue, 13 Oct 2020 15:47:26 +1100
Message-ID: <20201013044726.GK71119@yekko.fritz.box>
References: <20201012165331.25016-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565777;
        bh=UCu73e50jsi2A164CuniV51Dwkj0mejhnGZLdm/jHM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BfjcxFZOh2SlG+lIkRdO4JJBItB28VnVaiD1GQX6Ql/y4dUrh0k0VQsSSD0JHizNP
         Gmy+eZGIMooadaR6UaKraqpi6ao4CS9SN1LaqxoGESo6QCURfUj784jUzbQaKt/tRz
         VNdoPWdcqUvU4ecfwJRCsPTulO7k9iO+iXj5xCmU=
Content-Disposition: inline
In-Reply-To: <20201012165331.25016-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:53:31PM +0100, Andre Przywara wrote:
> The API documentation in libfdt.h seems to follow the Linux kernel's
> kernel-doc format[1].
>=20
> Running "scripts/kernel-doc -v -none" on the file reports some problems,
> mostly missing return values and missing parameter descriptions.
>=20
> Fix those up by providing the missing bits, and fixing the other small
> issues reported by the script.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Ah, nice.  TBH, I basically just cargo-culted this format as something
somewhat familiar and consistent, with no real intention of actually
using the doc generating tools with it.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/doc-guide/kernel-doc.rst
> ---
> Hi,
>=20
> this is just the basic low-hanging fruit part of the exercise. I refrained
> from changing "returns:" to the canonical "Return:", as this seems to be
> accepted by the kernel-doc script as well.
>=20
> There is more potential work to be done to make this proper kernel-doc:
> - "kernel-doc-ify" the error code descriptions (-FDT_ERR_*)
> - Properly format the return value listings (they become all one line atm=
=2E)
> - Mark parameters with "@" in the function descriptions
> - Cosmetics like changing "returns:" to "Return:"
>=20
> I don't have a Sphinx toolchain installed at the moment (my box wanted to
> take the afternoon off to install all dependencies), but this has the
> potential of creating the long lost, neatly formated libfdt API
> documentation, which could be put to readthedocs, for instance.
>=20
> Happy to provide some fixes, if we want to go forward with this.

Noted, but even if there are still problems, this improves
consistency, so, applied.

>=20
> Cheers,
> Andre
>=20
>  libfdt/libfdt.h | 111 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 75 insertions(+), 36 deletions(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 544d3ef..5979832 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -184,23 +184,23 @@ int fdt_next_node(const void *fdt, int offset, int =
*depth);
> =20
>  /**
>   * fdt_first_subnode() - get offset of first direct subnode
> - *
>   * @fdt:	FDT blob
>   * @offset:	Offset of node to check
> - * @return offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
> + *
> + * Return: offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
>   */
>  int fdt_first_subnode(const void *fdt, int offset);
> =20
>  /**
>   * fdt_next_subnode() - get offset of next direct subnode
> + * @fdt:	FDT blob
> + * @offset:	Offset of previous subnode
>   *
>   * After first calling fdt_first_subnode(), call this function repeatedl=
y to
>   * get direct subnodes of a parent node.
>   *
> - * @fdt:	FDT blob
> - * @offset:	Offset of previous subnode
> - * @return offset of next subnode, or -FDT_ERR_NOTFOUND if there are no =
more
> - * subnodes
> + * Return: offset of next subnode, or -FDT_ERR_NOTFOUND if there are no =
more
> + *         subnodes
>   */
>  int fdt_next_subnode(const void *fdt, int offset);
> =20
> @@ -225,7 +225,6 @@ int fdt_next_subnode(const void *fdt, int offset);
>   * Note that this is implemented as a macro and @node is used as
>   * iterator in the loop. The parent variable be constant or even a
>   * literal.
> - *
>   */
>  #define fdt_for_each_subnode(node, fdt, parent)		\
>  	for (node =3D fdt_first_subnode(fdt, parent);	\
> @@ -269,17 +268,21 @@ fdt_set_hdr_(size_dt_struct);
>  /**
>   * fdt_header_size - return the size of the tree's header
>   * @fdt: pointer to a flattened device tree
> + *
> + * Return: size of DTB header in bytes
>   */
>  size_t fdt_header_size(const void *fdt);
> =20
>  /**
> - * fdt_header_size_ - internal function which takes a version number
> + * fdt_header_size_ - internal function to get header size from a versio=
n number
> + * @version: devicetree version number
> + *
> + * Return: size of DTB header in bytes
>   */
>  size_t fdt_header_size_(uint32_t version);
> =20
>  /**
>   * fdt_check_header - sanity check a device tree header
> -
>   * @fdt: pointer to data which might be a flattened device tree
>   *
>   * fdt_check_header() checks that the given buffer contains what
> @@ -404,8 +407,7 @@ static inline uint32_t fdt_get_max_phandle(const void=
 *fdt)
>   * highest phandle value in the device tree blob) will be returned in the
>   * @phandle parameter.
>   *
> - * Returns:
> - *   0 on success or a negative error-code on failure
> + * Return: 0 on success or a negative error-code on failure
>   */
>  int fdt_generate_phandle(const void *fdt, uint32_t *phandle);
> =20
> @@ -425,9 +427,11 @@ int fdt_num_mem_rsv(const void *fdt);
>  /**
>   * fdt_get_mem_rsv - retrieve one memory reserve map entry
>   * @fdt: pointer to the device tree blob
> - * @address, @size: pointers to 64-bit variables
> + * @n: index of reserve map entry
> + * @address: pointer to 64-bit variable to hold the start address
> + * @size: pointer to 64-bit variable to hold the size of the entry
>   *
> - * On success, *address and *size will contain the address and size of
> + * On success, @address and @size will contain the address and size of
>   * the n-th reserve map entry from the device tree blob, in
>   * native-endian format.
>   *
> @@ -450,6 +454,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t =
*address, uint64_t *size);
>   * namelen characters of name for matching the subnode name.  This is
>   * useful for finding subnodes based on a portion of a larger string,
>   * such as a full path.
> + *
> + * Return: offset of the subnode or -FDT_ERR_NOTFOUND if name not found.
>   */
>  #ifndef SWIG /* Not available in Python */
>  int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
> @@ -489,6 +495,8 @@ int fdt_subnode_offset(const void *fdt, int parentoff=
set, const char *name);
>   *
>   * Identical to fdt_path_offset(), but only consider the first namelen
>   * characters of path as the path name.
> + *
> + * Return: offset of the node or negative libfdt error value otherwise
>   */
>  #ifndef SWIG /* Not available in Python */
>  int fdt_path_offset_namelen(const void *fdt, const char *path, int namel=
en);
> @@ -588,9 +596,9 @@ int fdt_next_property_offset(const void *fdt, int off=
set);
>  /**
>   * fdt_for_each_property_offset - iterate over all properties of a node
>   *
> - * @property_offset:	property offset (int, lvalue)
> - * @fdt:		FDT blob (const void *)
> - * @node:		node offset (int)
> + * @property:	property offset (int, lvalue)
> + * @fdt:	FDT blob (const void *)
> + * @node:	node offset (int)
>   *
>   * This is actually a wrapper around a for loop and would be used like s=
o:
>   *
> @@ -653,6 +661,9 @@ const struct fdt_property *fdt_get_property_by_offset=
(const void *fdt,
>   *
>   * Identical to fdt_get_property(), but only examine the first namelen
>   * characters of name for matching the property name.
> + *
> + * Return: pointer to the structure representing the property, or NULL
> + *         if not found
>   */
>  #ifndef SWIG /* Not available in Python */
>  const struct fdt_property *fdt_get_property_namelen(const void *fdt,
> @@ -745,6 +756,8 @@ const void *fdt_getprop_by_offset(const void *fdt, in=
t offset,
>   *
>   * Identical to fdt_getprop(), but only examine the first namelen
>   * characters of name for matching the property name.
> + *
> + * Return: pointer to the property's value or NULL on error
>   */
>  #ifndef SWIG /* Not available in Python */
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
> @@ -766,10 +779,10 @@ static inline void *fdt_getprop_namelen_w(void *fdt=
, int nodeoffset,
>   * @lenp: pointer to an integer variable (will be overwritten) or NULL
>   *
>   * fdt_getprop() retrieves a pointer to the value of the property
> - * named 'name' of the node at offset nodeoffset (this will be a
> + * named @name of the node at offset @nodeoffset (this will be a
>   * pointer to within the device blob itself, not a copy of the value).
> - * If lenp is non-NULL, the length of the property value is also
> - * returned, in the integer pointed to by lenp.
> + * If @lenp is non-NULL, the length of the property value is also
> + * returned, in the integer pointed to by @lenp.
>   *
>   * returns:
>   *	pointer to the property's value
> @@ -814,8 +827,11 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeof=
fset);
>   * @name: name of the alias th look up
>   * @namelen: number of characters of name to consider
>   *
> - * Identical to fdt_get_alias(), but only examine the first namelen
> - * characters of name for matching the alias name.
> + * Identical to fdt_get_alias(), but only examine the first @namelen
> + * characters of @name for matching the alias name.
> + *
> + * Return: a pointer to the expansion of the alias named @name, if it ex=
ists,
> + *	   NULL otherwise
>   */
>  #ifndef SWIG /* Not available in Python */
>  const char *fdt_get_alias_namelen(const void *fdt,
> @@ -828,7 +844,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
>   * @name: name of the alias th look up
>   *
>   * fdt_get_alias() retrieves the value of a given alias.  That is, the
> - * value of the property named 'name' in the node /aliases.
> + * value of the property named @name in the node /aliases.
>   *
>   * returns:
>   *	a pointer to the expansion of the alias named 'name', if it exists
> @@ -1004,14 +1020,13 @@ int fdt_node_offset_by_prop_value(const void *fdt=
, int startoffset,
>  int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
> =20
>  /**
> - * fdt_node_check_compatible: check a node's compatible property
> + * fdt_node_check_compatible - check a node's compatible property
>   * @fdt: pointer to the device tree blob
>   * @nodeoffset: offset of a tree node
>   * @compatible: string to match against
>   *
> - *
>   * fdt_node_check_compatible() returns 0 if the given node contains a
> - * 'compatible' property with the given string as one of its elements,
> + * @compatible property with the given string as one of its elements,
>   * it returns non-zero otherwise, or on error.
>   *
>   * returns:
> @@ -1075,7 +1090,7 @@ int fdt_node_offset_by_compatible(const void *fdt, =
int startoffset,
>   * one or more strings, each terminated by \0, as is found in a device t=
ree
>   * "compatible" property.
>   *
> - * @return: 1 if the string is found in the list, 0 not found, or invali=
d list
> + * Return: 1 if the string is found in the list, 0 not found, or invalid=
 list
>   */
>  int fdt_stringlist_contains(const char *strlist, int listlen, const char=
 *str);
> =20
> @@ -1084,7 +1099,8 @@ int fdt_stringlist_contains(const char *strlist, in=
t listlen, const char *str);
>   * @fdt: pointer to the device tree blob
>   * @nodeoffset: offset of a tree node
>   * @property: name of the property containing the string list
> - * @return:
> + *
> + * Return:
>   *   the number of strings in the given property
>   *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
>   *   -FDT_ERR_NOTFOUND if the property does not exist
> @@ -1104,7 +1120,7 @@ int fdt_stringlist_count(const void *fdt, int nodeo=
ffset, const char *property);
>   * small-valued cell properties, such as #address-cells, when searching =
for
>   * the empty string.
>   *
> - * @return:
> + * return:
>   *   the index of the string in the list of strings
>   *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
>   *   -FDT_ERR_NOTFOUND if the property does not exist or does not contain
> @@ -1128,7 +1144,7 @@ int fdt_stringlist_search(const void *fdt, int node=
offset, const char *property,
>   * If non-NULL, the length of the string (on success) or a negative erro=
r-code
>   * (on failure) will be stored in the integer pointer to by lenp.
>   *
> - * @return:
> + * Return:
>   *   A pointer to the string at the given index in the string list or NU=
LL on
>   *   failure. On success the length of the string will be stored in the =
memory
>   *   location pointed to by the lenp parameter, if non-NULL. On failure =
one of
> @@ -1217,6 +1233,8 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
>   * starting from the given index, and using only the first characters
>   * of the name. It is useful when you want to manipulate only one value =
of
>   * an array and you have a string that doesn't end with \0.
> + *
> + * Return: 0 on success, negative libfdt error value otherwise
>   */
>  #ifndef SWIG /* Not available in Python */
>  int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
> @@ -1330,8 +1348,13 @@ static inline int fdt_setprop_inplace_u64(void *fd=
t, int nodeoffset,
> =20
>  /**
>   * fdt_setprop_inplace_cell - change the value of a single-cell property
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node containing the property
> + * @name: name of the property to change the value of
> + * @val: new value of the 32-bit cell
>   *
>   * This is an alternative name for fdt_setprop_inplace_u32()
> + * Return: 0 on success, negative libfdt error number otherwise.
>   */
>  static inline int fdt_setprop_inplace_cell(void *fdt, int nodeoffset,
>  					   const char *name, uint32_t val)
> @@ -1403,7 +1426,7 @@ int fdt_nop_node(void *fdt, int nodeoffset);
> =20
>  /**
>   * fdt_create_with_flags - begin creation of a new fdt
> - * @fdt: pointer to memory allocated where fdt will be created
> + * @buf: pointer to memory allocated where fdt will be created
>   * @bufsize: size of the memory space at fdt
>   * @flags: a valid combination of FDT_CREATE_FLAG_ flags, or 0.
>   *
> @@ -1421,7 +1444,7 @@ int fdt_create_with_flags(void *buf, int bufsize, u=
int32_t flags);
> =20
>  /**
>   * fdt_create - begin creation of a new fdt
> - * @fdt: pointer to memory allocated where fdt will be created
> + * @buf: pointer to memory allocated where fdt will be created
>   * @bufsize: size of the memory space at fdt
>   *
>   * fdt_create() is equivalent to fdt_create_with_flags() with flags=3D0.
> @@ -1486,7 +1509,8 @@ int fdt_pack(void *fdt);
>  /**
>   * fdt_add_mem_rsv - add one memory reserve map entry
>   * @fdt: pointer to the device tree blob
> - * @address, @size: 64-bit values (native endian)
> + * @address: 64-bit start address of the reserve map entry
> + * @size: 64-bit size of the reserved region
>   *
>   * Adds a reserve map entry to the given blob reserving a region at
>   * address address of length size.
> @@ -1691,8 +1715,14 @@ static inline int fdt_setprop_u64(void *fdt, int n=
odeoffset, const char *name,
> =20
>  /**
>   * fdt_setprop_cell - set a property to a single cell value
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @val: 32-bit integer value for the property (native endian)
>   *
>   * This is an alternative name for fdt_setprop_u32()
> + *
> + * Return: 0 on success, negative libfdt error value otherwise.
>   */
>  static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char=
 *name,
>  				   uint32_t val)
> @@ -1863,8 +1893,14 @@ static inline int fdt_appendprop_u64(void *fdt, in=
t nodeoffset,
> =20
>  /**
>   * fdt_appendprop_cell - append a single cell value to a property
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @val: 32-bit integer value to append to the property (native endian)
>   *
>   * This is an alternative name for fdt_appendprop_u32()
> + *
> + * Return: 0 on success, negative libfdt error value otherwise.
>   */
>  static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
>  				      const char *name, uint32_t val)
> @@ -1967,13 +2003,16 @@ int fdt_delprop(void *fdt, int nodeoffset, const =
char *name);
>   * fdt_add_subnode_namelen - creates a new node based on substring
>   * @fdt: pointer to the device tree blob
>   * @parentoffset: structure block offset of a node
> - * @name: name of the subnode to locate
> + * @name: name of the subnode to create
>   * @namelen: number of characters of name to consider
>   *
> - * Identical to fdt_add_subnode(), but use only the first namelen
> - * characters of name as the name of the new node.  This is useful for
> + * Identical to fdt_add_subnode(), but use only the first @namelen
> + * characters of @name as the name of the new node.  This is useful for
>   * creating subnodes based on a portion of a larger string, such as a
>   * full path.
> + *
> + * Return: structure block offset of the created subnode (>=3D0),
> + *	   negative libfdt error value otherwise
>   */
>  #ifndef SWIG /* Not available in Python */
>  int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> @@ -1992,7 +2031,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentof=
fset,
>   *
>   * This function will insert data into the blob, and will therefore
>   * change the offsets of some existing nodes.
> -
> + *
>   * returns:
>   *	structure block offset of the created nodeequested subnode (>=3D0), on
>   *		success

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FMVwACgkQbDjKyiDZ
s5IVEA//dvEIQTNlACzDFgExTMu1atn5XYk6HIEZD7b/GlkFBBksJTrfo+CjWSyg
fI4TiNKlILulxtncMMyp7UTypK3kUJYIByJlbubnH4tFOfdZrNi5+80BMeT2Vh7v
JOE+ZT6y46atR8nUuBaLmZ1HCEm+kwJrObMZdX0HvN45EwiT3aUx2mfgTScq1wL4
LF/crpLKPhx4dVamHQXF1IO7h+plINpAg9gEc7y7rzXipW6Jpi5SxhmEKN+4kxva
4EHmuaMLQqmulJcwSauCAmk1/rwlQPOf8OTV6W2uE//wR1CvV9S13o8c4E0zwOVL
XSAW1ASCWs7Iv7sNUbTTVWYvZvIcz2jvW6NlOR0u1Kj4taKMNRvyWBG+2jWnT87H
uXiUyhJUSD2cBbNuuDTl/tB2XbM7ZB3f+f2wANJTYyumY0fA16G7hrCWpf5aVyUQ
joXgT5jCE6MRn/NTt3Ayw4IdpXjKQLYZ569mEmacgFmpLyJn96KMu30OWK7YuFDS
tw2t5x12MsIzWtj6vikv7qagmEPWQ5xaDfgSzAkGRJvynP5xmpjOXwzSZ1bL+exU
TjazLpkPhlnjH2ZgGP9dZuyrk1iGn0DgvHhfR6lRNCZYgmxDkinMeNUi7yR2UtjT
g1514NbV2x2SU7ZWHBPJFdjKQd0kKZKALu27bjZz4o65SQ5petY=
=QrfW
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--
