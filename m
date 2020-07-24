From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] dtc: Add a plugin interface
Date: Fri, 24 Jul 2020 15:26:08 -0600
Message-ID: <CAL_Jsq+gKbA4bYO9DTY3bSyCQ9n8-D_y3JRmeKXsDLK_TuegeA@mail.gmail.com>
References: <20200721155900.9147-1-andrei.ziureaev@arm.com>
 <20200721155900.9147-5-andrei.ziureaev@arm.com> <CAL_JsqL47ykA82LdeXV0ZkfC9s=-aBJ0mkmJqB-t4+Jpeev7Pg@mail.gmail.com>
 <9b0a289f-fd39-9ed7-0866-03390f7188c2@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595625980;
        bh=mdvCyLBlkIMBVA7uyDODcXzm8Lji0uDoU9XcHXIfJjk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KFHuiUFPOxkLsMlXF8t23NUouiL7soZSNpZUM1k2+DYYoSUw3sOhgnreXPLIZE9Jp
         0dW/JPZtyEMmYGlE1j7fr9laEijuEvnMZDFc1wt7du31SrYOq5i2eYb0M6tYG59Dzi
         PZs5OYnGfElIR6pg4h8KGP7Z1sTon7yXyvHBWYjw=
In-Reply-To: <9b0a289f-fd39-9ed7-0866-03390f7188c2-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Jul 23, 2020 at 12:23 PM Andrei Ziureaev
<andrei.ziureaev-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 7/23/20 3:46 PM, Rob Herring wrote:
> > On Tue, Jul 21, 2020 at 9:59 AM Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org> wrote:
> >> Add support for building and loading plugins.
> >>
> >> A plugin interface makes it possible to add checks in any language. It
> >> also allows these checks to print dts source line information.
> >>
> >> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
> >> ---
> >>   Makefile     |  32 +++++++++++-
> >>   dtc-plugin.h |  27 ++++++++++
> >>   dtc.c        | 139 ++++++++++++++++++++++++++++++++++++++++++++++++++-
> >>   dtc.h        |  47 +++++++++++++++++
> >>   4 files changed, 243 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index cb256e8..76bba53 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -25,6 +25,8 @@ WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> >>          -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> >>   CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> >>
> >> +LDLIBS_dtc += -ldl -export-dynamic
> >> +
> >>   BISON = bison
> >>   LEX = flex
> >>   SWIG = swig
> >> @@ -65,14 +67,17 @@ ifeq ($(HOSTOS),darwin)
> >>   SHAREDLIB_EXT     = dylib
> >>   SHAREDLIB_CFLAGS  = -fPIC
> >>   SHAREDLIB_LDFLAGS = -fPIC -dynamiclib -Wl,-install_name -Wl,
> >> +PLUGIN_ldflags = -fPIC -dynamiclib
> >>   else ifeq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
> >>   SHAREDLIB_EXT     = so
> >>   SHAREDLIB_CFLAGS  =
> >>   SHAREDLIB_LDFLAGS = -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
> >> +PLUGIN_ldflags = -shared
> >>   else
> >>   SHAREDLIB_EXT     = so
> >>   SHAREDLIB_CFLAGS  = -fPIC
> >>   SHAREDLIB_LDFLAGS = -fPIC -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
> >> +PLUGIN_ldflags = -fPIC -shared
> >>   endif
> >>
> >>   #
> >> @@ -186,7 +191,32 @@ ifneq ($(MAKECMDGOALS),libfdt)
> >>   endif
> >>   endif
> >>
> >> +#
> >> +# Rules for plugins
> >> +#
> >> +PLUGIN_dir = plugins
> >> +PLUGIN_subdirs = $(patsubst %/,%,$(filter-out $(PLUGIN_dir)/,$(dir $(wildcard $(PLUGIN_dir)/*/))))
> >> +PLUGIN_names = $(notdir $(PLUGIN_subdirs))
> >> +PLUGIN_libs = $(join $(PLUGIN_subdirs),$(patsubst %,/%.$(SHAREDLIB_EXT),$(PLUGIN_names)))
> >> +PLUGIN_CLEANFILES += $(PLUGIN_dir)/*.$(SHAREDLIB_EXT)
> >> +PLUGIN_CLEANFILES += $(addprefix $(PLUGIN_dir)/*/,*.o *.$(SHAREDLIB_EXT))
> >> +
> >> +include $(wildcard $(PLUGIN_dir)/*/Makefile.*)
> >> +
> >> +plugins: $(PLUGIN_libs)
> >> +
> >> +$(PLUGIN_dir)/%.$(SHAREDLIB_EXT): $(PLUGIN_dir)/%.o
> >> +       @$(VECHO) LD $@
> >> +       $(LINK.c) $(PLUGIN_ldflags) -o $@ $< $(PLUGIN_LDLIBS_$(notdir $*))
> >> +       ln -sf $(patsubst $(PLUGIN_dir)/%,%,$@) $(PLUGIN_dir)/$(notdir $@)
> >> +
> >> +$(PLUGIN_dir)/%.o: $(PLUGIN_dir)/%.c
> >> +       @$(VECHO) CC $@
> >> +       $(CC) $(CPPFLAGS) $(CFLAGS) $(PLUGIN_CFLAGS_$(notdir $*)) -o $@ -c $<
> >>
> >> +plugins_clean:
> >> +       @$(VECHO) CLEAN "(plugins)"
> >> +       rm -f $(PLUGIN_CLEANFILES)
> >>
> >>   #
> >>   # Rules for libfdt
> >> @@ -330,7 +360,7 @@ endif
> >>   STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
> >>          *.tab.[ch] *.lex.c *.output
> >>
> >> -clean: libfdt_clean pylibfdt_clean tests_clean
> >> +clean: libfdt_clean pylibfdt_clean tests_clean plugins_clean
> >>          @$(VECHO) CLEAN
> >>          rm -f $(STD_CLEANFILES)
> >>          rm -f $(VERSION_FILE)
> >> diff --git a/dtc-plugin.h b/dtc-plugin.h
> >> index 35c3d19..9ec6b81 100644
> >> --- a/dtc-plugin.h
> >> +++ b/dtc-plugin.h
> >> @@ -10,6 +10,8 @@
> >>   #include <stdint.h>
> >>   #include <stdbool.h>
> >>
> >> +#include "srcpos.h"
> >> +
> > This belongs in patch 3.
> >
> >>   struct dt_info {
> >>          const char *version;
> > Okay, so we don't need this as you are checking the version in a different way.
>
>
> Oops, I forgot to remove this.
>
> >
> >>          unsigned int dtsflags;
> >> @@ -170,4 +172,29 @@ static inline size_t type_marker_length(struct marker *m)
> >>          return 0;
> >>   }
> >>
> >> +struct plugin_arg {
> >> +       char *key;      /* A non-empty string */
> >> +       char *value;    /* NULL or a non-empty string */
> >> +};
> >> +
> >> +struct plugin_version {
> >> +       int major;      /* Incompatible changes */
> >> +       int minor;      /* Somewhat incompatible changes */
> > A minor bump should be compatible changes. A new field added to the
> > end of a struct for example.
> >
> >> +};
> >> +
> >> +#define DTC_PLUGIN_API_VERSION ((struct plugin_version){ .major = 0, .minor = 0 })
> >> +
> >> +static inline bool dtc_plugin_default_version_check(struct plugin_version v)
> > Maybe 'dtc_ver' instead of 'v'.
> >
> >> +{
> >> +       struct plugin_version this_v = DTC_PLUGIN_API_VERSION;
> >> +       return v.major == this_v.major && v.minor == this_v.minor;
> > I think, by default, minor version differences should be okay.
>
> I originally wanted this whole interface to be similar to gcc's (it
> turned out nothing like gcc's), and gcc's default version check is the
> strictest check possible. I guess the idea is that plugin authors can
> write their own less strict checks if they want. But if minor versions
> are compatible, then maybe there's no point in checking them, even by
> default.

Okay. Let's see if there's any other opinions.

> >> +}
> >> +
> >> +/* Hook definitions */
> >> +typedef int (*init_fn_t)(struct plugin_version v, int argc, struct plugin_arg *argv);
> >> +typedef void (*validate_fn_t)(struct dt_info *dti);
> >> +
> >> +#define TYPE_TO_NAME(type) dtc_plugin_v0_##type
> >> +#define EXPORT_FUNCTION(type, fn) type TYPE_TO_NAME(type) = (fn)
> >> +
> >>   #endif /* DTC_PLUGIN_H */
> >> diff --git a/dtc.c b/dtc.c
> >> index bdb3f59..5a9b118 100644
> >> --- a/dtc.c
> >> +++ b/dtc.c
> >> @@ -4,6 +4,7 @@
> >>    */
> >>
> >>   #include <sys/stat.h>
> >> +#include <dlfcn.h>
> >>
> >>   #include "dtc.h"
> >>   #include "srcpos.h"
> >> @@ -47,7 +48,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
> >>
> >>   /* Usage related data. */
> >>   static const char usage_synopsis[] = "dtc [options] <input file>";
> >> -static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@AThv";
> >> +static const char usage_short_opts[] = "qI:O:o:V:d:l:L:R:S:p:a:fb:i:H:sW:E:@AThv";
> >>   static struct option const usage_long_opts[] = {
> >>          {"quiet",            no_argument, NULL, 'q'},
> >>          {"in-format",         a_argument, NULL, 'I'},
> >> @@ -55,6 +56,8 @@ static struct option const usage_long_opts[] = {
> >>          {"out-format",        a_argument, NULL, 'O'},
> >>          {"out-version",       a_argument, NULL, 'V'},
> >>          {"out-dependency",    a_argument, NULL, 'd'},
> >> +       {"plugin",            a_argument, NULL, 'l'},
> >> +       {"plugin-dir",        a_argument, NULL, 'L'},
> >>          {"reserve",           a_argument, NULL, 'R'},
> >>          {"space",             a_argument, NULL, 'S'},
> >>          {"pad",               a_argument, NULL, 'p'},
> >> @@ -89,6 +92,13 @@ static const char * const usage_opts_help[] = {
> >>           "\t\tasm - assembler source",
> >>          "\n\tBlob version to produce, defaults to "stringify(DEFAULT_FDT_VERSION)" (for dtb and asm output)",
> >>          "\n\tOutput dependency file",
> >> +       "\n\tLoad a plugin and, optionally, pass it an argument.\n"
> >> +       "\tUsage: -l <plugin name>[,key][,value]\n"
> >> +        "\t\tplugin name - the name of the shared object without the extension (can contain a path)\n"
> >> +        "\t\tkey         - the name of the argument\n"
> >> +        "\t\tvalue       - can be omitted\n"
> >> +       "\tExample: dtc -lsome-plugin,o,out.dts -lsome-plugin,help -l path/to/another-plugin [...]",
> > Should be '-L':
> >
> > -L path/to/another-plugin
>
>
> "-L" specifies the directory and "-l" - a plugin name with an optional
> path and an argument. I guess we can simplify this, get rid of "-l", and
> just have "-L" take a full path and an argument. Since this is going to
> be called mostly from makefiles, the extra typing shouldn't be a
> problem. We could also pass all the arguments at once with something like:
>
> -L path/plugin-name,"key=value key2=value2"

Ah, I was confused thinking that 'path/to/another-plugin' was a path.
I'd just drop 'path/to/' here.

I think a separate search path is better. We could still do all args
together. I don't really have a preference on that. Probably would
want a comma separator rather than a space though.

Rob
