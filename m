From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 2/4] dtc: Add plugin documentation and examples
Date: Mon, 3 Aug 2020 18:08:08 +1000
Message-ID: <20200803080808.GD7553@yekko.fritz.box>
References: <20200721155900.9147-1-andrei.ziureaev@arm.com>
 <20200721155900.9147-3-andrei.ziureaev@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1596442206;
        bh=qN3e4o/q0z64Wh+RGSXUBs2NYoVPdbJ4qDf8/H3qbTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZQtkHXkb1UEc1cPIBbBk9ANaroOoDfHrgJcchV1xGnUN9ugTXlp/CHWFgYFnQQDGj
         nsG8BDgHwWSHMuLe5zSf25siSISKuGCkzSYUS46uaaaeKChKfT/vabrZ6L6Vc37Ss9
         rslh5ZE+gWFuDjy27+J4gnnt7qmS+y3jLSoVMdLI=
Content-Disposition: inline
In-Reply-To: <20200721155900.9147-3-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 04:58:58PM +0100, Andrei Ziureaev wrote:
> Document the plugin API in Documentation/manual.txt and provide an
> example plugin.
>=20
> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>

So, thanks for starting out with some docs.  However, I don't think
these docs cover the most important things for them to cover: what the
API is for the plugin - what information goes in, what information
goes out, and what all the supported entry points are.  Understanding
the data model of the plugin would make reviewing the rest of the
details much easier.

> ---
>  Documentation/manual.txt         | 74 ++++++++++++++++++++++++++++++++
>  plugins/example/Makefile.example | 19 ++++++++
>  plugins/example/example.c        | 29 +++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 plugins/example/Makefile.example
>  create mode 100644 plugins/example/example.c
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index adf5ccb..18624aa 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -10,6 +10,10 @@ I - "dtc", the device tree compiler
>      4.1) Overview
>      4.2) Properties
>      4.3) Labels and References
> +    5) Plugins
> +    5.1) Loading plugins
> +    5.2) Exporting Functionality
> +    5.3) Building Plugins
> =20
>  II - The DT block format
>      1) Header
> @@ -115,6 +119,16 @@ Options:
>      -d <dependency_filename>
>  	Generate a dependency file during compilation.
> =20
> +    -l, --plugin <plugin name>[,key][,value]
> +	Load a plugin and, optionally, pass it an argument.
> +		plugin name - the name of the shared object without the extension (can=
 contain a path)
> +		key         - the name of the argument
> +		value       - can be omitted
> +	Example: dtc -lsome-plugin,o,out.dts -lsome-plugin,help -l path/to/anot=
her-plugin [...]
> +
> +    -L, --plugin-dir <arg>
> +	The directory in which to search for plugins
> +
>      -q
>  	Quiet: -q suppress warnings, -qq errors, -qqq all
> =20
> @@ -272,6 +286,66 @@ And used in properties, labels may appear before or =
after any value:
>      };
> =20
> =20
> +5) Plugins
> +
> +Plugins are shared libraries that DTC loads at runtime using
> +
> +	dlopen(path, RTLD_NOW | RTLD_GLOBAL | RTLD_DEEPBIND)
> +
> +RTLD_NOW means they are loaded immediately (right before the parsing
> +stage).
> +
> +RTLD_GLOBAL means their symbols can be used by other plugins.
> +
> +RTLD_DEEPBIND means the dynamic linker will look for symbols within the
> +plugin first, before searching in the main program and other plugins.
> +
> +All plugins must include the "dtc-plugin.h" header.
> +
> +
> +5.1) Loading plugins
> +
> +Please, refer to the -l and -L options in the "Command Line" section.
> +
> +
> +5.2) Exporting Functionality
> +
> +Plugins export functionality through the "EXPORT_FUNCTION(type, fn)"
> +macro, where "type" is one of the typedefs from "dtc-plugin.h", and
> +"fn" is the function that will be called by DTC. Each type of function
> +gets called once for each plugin.
> +
> +Every plugin must export a function of type "init_fn_t".
> +
> +"plugins/example/example.c" shows how an init function can be used.
> +
> +
> +5.3) Building Plugins
> +
> +The command "make plugins" infers the names of the shared library files
> +from the names of directories under "plugins/". For example, the
> +presence of a
> +
> +	plugins/example/
> +
> +directory means that make will try to build
> +
> +	plugins/example/example.so
> +
> +from
> +
> +	plugins/example/example.c
> +
> +It will then make a symlink
> +
> +	plugins/example.so
> +
> +for convenience.
> +
> +Please, see "plugins/example/Makefile.example" for how to override the
> +defaut behavior.
> +
> +
> =20
>  II - The DT block format
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/plugins/example/Makefile.example b/plugins/example/Makefile.=
example
> new file mode 100644
> index 0000000..56d4e17
> --- /dev/null
> +++ b/plugins/example/Makefile.example
> @@ -0,0 +1,19 @@
> +# Optional per-plugin makefile
> +#
> +# Here you can add gcc flags:
> +# PLUGIN_CFLAGS_example =3D -some-flag
> +#
> +# Add libraries:
> +# PLUGIN_LDLIBS_example =3D -lsome-lib
> +#
> +# Add files to clean:
> +# PLUGIN_CLEANFILES +=3D $(PLUGIN_dir)/example/*.tmp
> +#
> +# Or override the default rules:
> +# $(PLUGIN_dir)/example/example.$(SHAREDLIB_EXT): $(PLUGIN_dir)/example/=
example.o
> +#	@$(VECHO) LD $@
> +#	...
> +#
> +# $(PLUGIN_dir)/example/example.o: $(PLUGIN_dir)/example/example.c
> +#	@$(VECHO) CC $@
> +#	...
> diff --git a/plugins/example/example.c b/plugins/example/example.c
> new file mode 100644
> index 0000000..3bbf9ea
> --- /dev/null
> +++ b/plugins/example/example.c
> @@ -0,0 +1,29 @@
> +#include <stdio.h>
> +#include <string.h>
> +
> +#include "dtc-plugin.h"
> +
> +#define NAME "example: "
> +
> +static int init_example(struct plugin_version v, int argc, struct plugin=
_arg *argv)
> +{
> +	if (!dtc_plugin_default_version_check(v)) {
> +		fprintf(stderr, NAME"Plugin is incompatible with this version of DTC\n=
");
> +		return 1;
> +	}
> +
> +	for (int i =3D 0; i < argc; i++) {
> +		if (strcmp(argv[i].key, "h") =3D=3D 0
> +		 || strcmp(argv[i].key, "help") =3D=3D 0) {
> +			printf(NAME"This is an example plugin. It prints its arguments.\n");
> +			return 1;
> +		} else {
> +			printf(NAME"%s: %s\n", argv[i].key,
> +			       argv[i].value ? argv[i].value : "");
> +		}
> +	}
> +
> +	printf(NAME"Loaded plugin 'example'\n");
> +	return 0;
> +}
> +EXPORT_FUNCTION(init_fn_t, init_example);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8nxeYACgkQbDjKyiDZ
s5IVIw/+IMs/W2xq0LfzNz6rTu+vL5BVLdOw78b/HPSXYMcixU8YB+6E+puSUh1F
WSsc41CH0i2/0KzDFanB7/znOKNEnB5xoJFQGF4lEegPk5xJN4aKe4zSTphvN/il
0x76gIDBrj/AVcTQjLQApFLzI49TmqfuSfJvwQCw3bU8CFyWecqVN3YNZ3e6rnbD
43oouSjoMW1p25CeNNtUqaOLaAO3MtwL7M1VQh5Nxoc3upjQ2nQ+1kTxRbuqgPku
4g3P7K3DoxoUzXQC4EvWRCNMIJIlhpfoKHkQ6B8ASaqQUcOv/+hDb5b4m5Pr2RpX
3ybtHspOhVPi62MDxmNoCfbswZaLppOZcgYjdYYuoq//a2EcxAPIM1YzQ9xk4+Kf
EO5NOzqjO7gTZi3JPCC3nISkqOwcMCQkax3raIoWqitQr1VfxkcaFcNJIVntKzXv
xAJv4E+5zULHT57Wwp0j3mTCaxBFaaMO9it81+Iy2DnNcd5r6e/xWfCihaCsqV/n
R2Btg3dxH5GDNS6ex3dk7m9WbjBEOgzjz/gqYdQs9uJVTFjDpylGIo+ouINqYeUv
oAVgrkJNELI1kQlz3v3QdtvbZw+JQVr0hu3+A+nUXw7shNRJPMJnPOeUqVu7pet4
qoT9Zn5haPsKA+qQQihrIf5OfCaAPWRIk6je7QO1VfBrErNeV04=
=ce/Q
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
