From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 2/4] dtc: Add plugin documentation and examples
Date: Mon, 3 Aug 2020 15:09:01 +0100
Message-ID: <b2f04d65-736a-802a-7e49-648ed6784a09@arm.com>
References: <20200721155900.9147-1-andrei.ziureaev@arm.com>
 <20200721155900.9147-3-andrei.ziureaev@arm.com>
 <20200803080808.GD7553@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK3JhJSpy6NzIvnZF3sd5g/CGcruKOgb0+i5dlKhbHQ=;
 b=OWdcbNPLDe9b/IT1Nz8cyV4L6L3HXr1bZxO18BJjiSsO2gTpxsMX5dl4swopXfV7vNQpMqYJK3gawWuLQGihoCn+DSOQshamh8bBgSppkr3eDo3+1jXtFg3S/mx/sX+jK3RHolbiL8BuCr/810JFNEw8QB/5U7xOwMLAhNJR8eg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK3JhJSpy6NzIvnZF3sd5g/CGcruKOgb0+i5dlKhbHQ=;
 b=OWdcbNPLDe9b/IT1Nz8cyV4L6L3HXr1bZxO18BJjiSsO2gTpxsMX5dl4swopXfV7vNQpMqYJK3gawWuLQGihoCn+DSOQshamh8bBgSppkr3eDo3+1jXtFg3S/mx/sX+jK3RHolbiL8BuCr/810JFNEw8QB/5U7xOwMLAhNJR8eg=
In-Reply-To: <20200803080808.GD7553-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


On 8/3/20 9:08 AM, David Gibson wrote:
> On Tue, Jul 21, 2020 at 04:58:58PM +0100, Andrei Ziureaev wrote:
>> Document the plugin API in Documentation/manual.txt and provide an
>> example plugin.
>>
>> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
> So, thanks for starting out with some docs.  However, I don't think
> these docs cover the most important things for them to cover: what the
> API is for the plugin - what information goes in, what information
> goes out, and what all the supported entry points are.  Understanding
> the data model of the plugin would make reviewing the rest of the
> details much easier.
OK, so I'll add some documentation to dtc-plugin.h and duplicate that in
the manual. That will look something like this:

/*
  * Function types that plugins can export.
  * DTC calls each type exactly once for each plugin.
  */

/**
  * Called right after the plugin is loaded.
  *
  * Every plugin must export a function of this type.
  *
  * @param dtc_ver    DTC's plugin API version
  * @param argc       Length of argv
  * @param argv       Array of plugin arguments
  * @return 0 on success, or 1 on failure
  */
typedef int (*init_fn_t)(struct plugin_version dtc_ver, int argc,
                          struct plugin_arg *argv);

/**
  * Called after DTC's parsing stage, but before the output stage.
  *
  * @param dti    DTC's internal live tree. Implementations can modify
  *               the live tree and "pass it back" to DTC and to
  *               subsequent plugins.
  */
typedef void (*validate_fn_t)(struct dt_info *dti);

One other point: we could pass validate_fn_t a copy of the live tree.
Then plugins won't be able to "pass back" the live tree. The external
live tree could then be a completely separate struct from the internal
one. So, less flexibility for plugins, but a better, more stable API.
>
>> ---
>>   Documentation/manual.txt         | 74 ++++++++++++++++++++++++++++++++
>>   plugins/example/Makefile.example | 19 ++++++++
>>   plugins/example/example.c        | 29 +++++++++++++
>>   3 files changed, 122 insertions(+)
>>   create mode 100644 plugins/example/Makefile.example
>>   create mode 100644 plugins/example/example.c
>>
>> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
>> index adf5ccb..18624aa 100644
>> --- a/Documentation/manual.txt
>> +++ b/Documentation/manual.txt
>> @@ -10,6 +10,10 @@ I - "dtc", the device tree compiler
>>       4.1) Overview
>>       4.2) Properties
>>       4.3) Labels and References
>> +    5) Plugins
>> +    5.1) Loading plugins
>> +    5.2) Exporting Functionality
>> +    5.3) Building Plugins
>>
>>   II - The DT block format
>>       1) Header
>> @@ -115,6 +119,16 @@ Options:
>>       -d <dependency_filename>
>>      Generate a dependency file during compilation.
>>
>> +    -l, --plugin <plugin name>[,key][,value]
>> +    Load a plugin and, optionally, pass it an argument.
>> +            plugin name - the name of the shared object without the ext=
ension (can contain a path)
>> +            key         - the name of the argument
>> +            value       - can be omitted
>> +    Example: dtc -lsome-plugin,o,out.dts -lsome-plugin,help -l path/to/=
another-plugin [...]
>> +
>> +    -L, --plugin-dir <arg>
>> +    The directory in which to search for plugins
>> +
>>       -q
>>      Quiet: -q suppress warnings, -qq errors, -qqq all
>>
>> @@ -272,6 +286,66 @@ And used in properties, labels may appear before or=
 after any value:
>>       };
>>
>>
>> +5) Plugins
>> +
>> +Plugins are shared libraries that DTC loads at runtime using
>> +
>> +    dlopen(path, RTLD_NOW | RTLD_GLOBAL | RTLD_DEEPBIND)
>> +
>> +RTLD_NOW means they are loaded immediately (right before the parsing
>> +stage).
>> +
>> +RTLD_GLOBAL means their symbols can be used by other plugins.
>> +
>> +RTLD_DEEPBIND means the dynamic linker will look for symbols within the
>> +plugin first, before searching in the main program and other plugins.
>> +
>> +All plugins must include the "dtc-plugin.h" header.
>> +
>> +
>> +5.1) Loading plugins
>> +
>> +Please, refer to the -l and -L options in the "Command Line" section.
>> +
>> +
>> +5.2) Exporting Functionality
>> +
>> +Plugins export functionality through the "EXPORT_FUNCTION(type, fn)"
>> +macro, where "type" is one of the typedefs from "dtc-plugin.h", and
>> +"fn" is the function that will be called by DTC. Each type of function
>> +gets called once for each plugin.
>> +
>> +Every plugin must export a function of type "init_fn_t".
>> +
>> +"plugins/example/example.c" shows how an init function can be used.
>> +
>> +
>> +5.3) Building Plugins
>> +
>> +The command "make plugins" infers the names of the shared library files
>> +from the names of directories under "plugins/". For example, the
>> +presence of a
>> +
>> +    plugins/example/
>> +
>> +directory means that make will try to build
>> +
>> +    plugins/example/example.so
>> +
>> +from
>> +
>> +    plugins/example/example.c
>> +
>> +It will then make a symlink
>> +
>> +    plugins/example.so
>> +
>> +for convenience.
>> +
>> +Please, see "plugins/example/Makefile.example" for how to override the
>> +defaut behavior.
>> +
>> +
>>
>>   II - The DT block format
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> diff --git a/plugins/example/Makefile.example b/plugins/example/Makefile=
.example
>> new file mode 100644
>> index 0000000..56d4e17
>> --- /dev/null
>> +++ b/plugins/example/Makefile.example
>> @@ -0,0 +1,19 @@
>> +# Optional per-plugin makefile
>> +#
>> +# Here you can add gcc flags:
>> +# PLUGIN_CFLAGS_example =3D -some-flag
>> +#
>> +# Add libraries:
>> +# PLUGIN_LDLIBS_example =3D -lsome-lib
>> +#
>> +# Add files to clean:
>> +# PLUGIN_CLEANFILES +=3D $(PLUGIN_dir)/example/*.tmp
>> +#
>> +# Or override the default rules:
>> +# $(PLUGIN_dir)/example/example.$(SHAREDLIB_EXT): $(PLUGIN_dir)/example=
/example.o
>> +#   @$(VECHO) LD $@
>> +#   ...
>> +#
>> +# $(PLUGIN_dir)/example/example.o: $(PLUGIN_dir)/example/example.c
>> +#   @$(VECHO) CC $@
>> +#   ...
>> diff --git a/plugins/example/example.c b/plugins/example/example.c
>> new file mode 100644
>> index 0000000..3bbf9ea
>> --- /dev/null
>> +++ b/plugins/example/example.c
>> @@ -0,0 +1,29 @@
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#include "dtc-plugin.h"
>> +
>> +#define NAME "example: "
>> +
>> +static int init_example(struct plugin_version v, int argc, struct plugi=
n_arg *argv)
>> +{
>> +    if (!dtc_plugin_default_version_check(v)) {
>> +            fprintf(stderr, NAME"Plugin is incompatible with this versi=
on of DTC\n");
>> +            return 1;
>> +    }
>> +
>> +    for (int i =3D 0; i < argc; i++) {
>> +            if (strcmp(argv[i].key, "h") =3D=3D 0
>> +             || strcmp(argv[i].key, "help") =3D=3D 0) {
>> +                    printf(NAME"This is an example plugin. It prints it=
s arguments.\n");
>> +                    return 1;
>> +            } else {
>> +                    printf(NAME"%s: %s\n", argv[i].key,
>> +                           argv[i].value ? argv[i].value : "");
>> +            }
>> +    }
>> +
>> +    printf(NAME"Loaded plugin 'example'\n");
>> +    return 0;
>> +}
>> +EXPORT_FUNCTION(init_fn_t, init_example);
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
