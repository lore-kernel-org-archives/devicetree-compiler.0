From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/5] Add an initial Python library for libfdt
Date: Fri, 10 Feb 2017 16:04:51 +1100
Message-ID: <20170210050451.GG25381@umbus>
References: <20170205201323.15411-1-sjg@chromium.org>
 <20170205201323.15411-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486703135;
        bh=hcR2yXOQ+6v15yCsCNBlp4oDywZsU2JBnq23XZ4wINc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G38wXfVyXWlLXjueIrhu2a9jRbINoJkAkcW+vpiNnlf96Awv0t4kyweXnJq6KbE/2
         pFVNpwDnhsM7oSqvvqj0pznQVEHAlx1JTE3F//A/fvR15uJaLdVbVTLNlboC98MUbl
         EXijwR/B7zJ7ecvtqwscft6M/6xlnQqdOzet+6YY=
Content-Disposition: inline
In-Reply-To: <20170205201323.15411-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2017 at 01:13:19PM -0700, Simon Glass wrote:
> Add Python bindings for a bare-bones set of libfdt functions. These allow
> navigating the tree and reading node names and properties.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v4:
> - Make the library less pythonic to avoid a shaky illusion
> - Drop classes for Node and Prop, along with associated methods
> - Include libfdt.h instead of repeating it
> - Add support for fdt_getprop()
> - Bring in all libfdt functions (but Python support is missing for many)
> - Add full comments for Python methods
>=20
> Changes in v3:
> - Make the library more pythonic
> - Add classes for Node and Prop along with methods
> - Add an exception class
> - Use Python to generate exeptions instead of SWIG
>=20
> Changes in v2:
> - Add exceptions when functions return an error
> - Correct Python naming to following PEP8
> - Use a class to encapsulate the various methods
> - Include fdt.h instead of redefining struct fdt_property
> - Use bytearray to avoid the SWIG warning 454
> - Add comments
>=20
>  pylibfdt/.gitignore        |   3 +
>  pylibfdt/Makefile.pylibfdt |  18 ++
>  pylibfdt/libfdt.swig       | 565 +++++++++++++++++++++++++++++++++++++++=
++++++
>  pylibfdt/setup.py          |  34 +++
>  4 files changed, 620 insertions(+)
>  create mode 100644 pylibfdt/.gitignore
>  create mode 100644 pylibfdt/Makefile.pylibfdt
>  create mode 100644 pylibfdt/libfdt.swig
>  create mode 100644 pylibfdt/setup.py
>=20
> diff --git a/pylibfdt/.gitignore b/pylibfdt/.gitignore
> new file mode 100644
> index 0000000..5e8c5e3
> --- /dev/null
> +++ b/pylibfdt/.gitignore
> @@ -0,0 +1,3 @@
> +libfdt.py
> +libfdt.pyc
> +libfdt_wrap.c
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> new file mode 100644
> index 0000000..fa74dd2
> --- /dev/null
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -0,0 +1,18 @@
> +# Makefile.pylibfdt
> +#
> +
> +PYLIBFDT_srcs =3D $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_SRCS))
> +WRAP =3D $(PYLIBFDT_objdir)/libfdt_wrap.c
> +PYMODULE =3D $(PYLIBFDT_objdir)/_libfdt.so
> +
> +$(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
> +	@$(VECHO) PYMOD $@
> +	python $(PYLIBFDT_objdir)/setup.py "$(CPPFLAGS)" $^
> +	mv _libfdt.so $(PYMODULE)
> +
> +$(WRAP): $(PYLIBFDT_srcdir)/libfdt.swig
> +	@$(VECHO) SWIG $@
> +	swig -python -o $@ $<

Forgot to mention this before: please wrap this in a $(SWIG) make
variable.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnUnzAAoJEGw4ysog2bOS+VMP/ilKiKLJtq/vCRH8an7jBiO/
LuU0FCZc6blC7psIodMs62O7QQ5NEeuDeuM8oA+FbshfvtrQPD8rVvFXbjpfqIvG
6KL8UEbgJZsAVOk87h8UbvebYzWBP8FH/Z3kYN62O96t4oUR9+fFJs6t57/shkXU
UIOA/K9bDW06gXPxjjc1bDUid7L0PtUbDUU8qLT1sZypHkrp6jXQZwyiIol736Tf
IDkeaIibCVQYjkxykB9AU/CRHVnDnKHxL85IvoEp8wa+vd68oWFmSBidOcyQnbCH
6QySwbNUPmnAkK3HnadqxsuArHOodghfByAONpvOWo1XBWiBH0NGpdRY28z4vD0a
/V6y9nj+jaDRzpD3ZNNKezlfNNeXlMK9FMBvqtCw1ROy+PgRbaaIhddGDap03ODU
Ji1JDhuYKIr/fxLaZ3Mj8wDpRWU62Lzv+ERh3nxogcLaup0J5lSuQ+PkcQQxDhg5
4WOdHQgOCuskXoU37jqKZJ9opXXwDW4J0LhHua43Lc2xi4vmTFb10xkmkDw1z2hp
ztu6WR3TBCIfezNDOjE/CdeDrOJ5WeQCFrezHlMaedjIJe67FYoRC6iNKd+Ddfgt
v1xUz3rqsBOHIsuOA0UxMApmELOT0XUsV0qANAdDtXaIXhK9RiCvOKb1dmEuS9r6
8mJOzIj8XYYMeG5ZHShK
=AXfo
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
