From: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v3 4/4] dtc: Add a plugin interface
Date: Sun,  6 Sep 2020 14:12:20 +0100
Message-ID: <20200906131220.6192-5-andrei.ziureaev@arm.com>
References: <20200906131220.6192-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gBEt+FMF4lit2I8MyTfFSHe+WOxqILrPt5bs6g7Z8Wo=;
        b=T0llZIwzsSY9mqUDLkdQUZbtCbtoujlqn2MIxOUVCcCjSBjhOskKh75uLHj5XVJCXs
         ZTcPzBZkgIp+cdusBIUCPuG7aMJVr0tlENxiexWILe0TSmfyjdIiV5Cfgb9LN3odiW6I
         R+mrpq9E7VwQoMHNFptigqrBx3h9hwbTx4cNPMgV7taZj/lmcnfSszRKf3ZaIDTQmBsB
         i43W65tAoLlviXWcsfBkzbQZTMbra+wBUUc9oUFJ3remGx/C/tCAnzjKajgSV/yHA99+
         WDEgsHmlH0W0S6UiF3ZtLVTK2BxhlEdSWmZPgNkAgpDnIgIcNvyz+kOevYvUZiLeo52d
         phxg==
In-Reply-To: <20200906131220.6192-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrei.ziureaev-5wv7dgnIgG8@public.gmane.org

Add support for building and loading plugins.

A plugin interface makes it possible to add checks in any language. It
also allows these checks to print dts source line information.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changes in v3:
- plugins have to implement prototypes
- better wording of comments and messages

Changes in v2:
- describe the data model in dtc-plugin.h
- plugins must register with the build system
- the "validate_fn_t" hook can return a status
- specify that minor versions are compatible
- check if plugin_dir is NULL, just in case
- better variable names in register_plugin_info

 Makefile     |  29 ++++++++++-
 dtc-plugin.h |  76 +++++++++++++++++++++++++++
 dtc.c        | 142 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 dtc.h        |  46 +++++++++++++++++
 4 files changed, 291 insertions(+), 2 deletions(-)
 create mode 100644 dtc-plugin.h

diff --git a/Makefile b/Makefile
index c187d5f..e96bc6e 100644
--- a/Makefile
+++ b/Makefile
@@ -25,6 +25,8 @@ WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
 CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
 
+LDLIBS_dtc += -ldl -export-dynamic
+
 BISON = bison
 LEX = flex
 SWIG = swig
@@ -66,14 +68,17 @@ ifeq ($(HOSTOS),darwin)
 SHAREDLIB_EXT     = dylib
 SHAREDLIB_CFLAGS  = -fPIC
 SHAREDLIB_LDFLAGS = -fPIC -dynamiclib -Wl,-install_name -Wl,
+PLUGIN_ldflags = -fPIC -dynamiclib
 else ifeq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
 SHAREDLIB_EXT     = so
 SHAREDLIB_CFLAGS  =
 SHAREDLIB_LDFLAGS = -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
+PLUGIN_ldflags = -shared
 else
 SHAREDLIB_EXT     = so
 SHAREDLIB_CFLAGS  = -fPIC
 SHAREDLIB_LDFLAGS = -fPIC -shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
+PLUGIN_ldflags = -fPIC -shared
 endif
 
 #
@@ -187,7 +192,29 @@ ifneq ($(MAKECMDGOALS),libfdt)
 endif
 endif
 
+#
+# Rules for plugins
+#
+PLUGIN_dir = plugins
+PLUGIN_CLEANFILES += $(PLUGIN_dir)/*.$(SHAREDLIB_EXT)
+PLUGIN_CLEANFILES += $(addprefix $(PLUGIN_dir)/*/,*.o *.$(SHAREDLIB_EXT))
+
+include $(wildcard $(PLUGIN_dir)/*/Makefile.*)
+
+plugins: $(PLUGIN_LIBS)
+
+$(PLUGIN_dir)/%.$(SHAREDLIB_EXT): $(PLUGIN_dir)/%.o
+	@$(VECHO) LD $@
+	$(LINK.c) $(PLUGIN_ldflags) -o $@ $< $(PLUGIN_LDLIBS_$(notdir $*))
+	ln -sf $(patsubst $(PLUGIN_dir)/%,%,$@) $(PLUGIN_dir)/$(notdir $@)
+
+$(PLUGIN_dir)/%.o: $(PLUGIN_dir)/%.c
+	@$(VECHO) CC $@
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(PLUGIN_CFLAGS_$(notdir $*)) -o $@ -c $<
 
+plugins_clean:
+	@$(VECHO) CLEAN "(plugins)"
+	rm -f $(PLUGIN_CLEANFILES)
 
 #
 # Rules for libfdt
@@ -331,7 +358,7 @@ endif
 STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 	*.tab.[ch] *.lex.c *.output
 
-clean: libfdt_clean pylibfdt_clean tests_clean
+clean: libfdt_clean pylibfdt_clean tests_clean plugins_clean
 	@$(VECHO) CLEAN
 	rm -f $(STD_CLEANFILES)
 	rm -f $(VERSION_FILE)
diff --git a/dtc-plugin.h b/dtc-plugin.h
new file mode 100644
index 0000000..ea904bc
--- /dev/null
+++ b/dtc-plugin.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef DTC_PLUGIN_H
+#define DTC_PLUGIN_H
+
+/*
+ * (C) Copyright Arm Holdings.  2020
+ */
+
+#include "dt.h"
+
+struct plugin_arg {
+	char *key;	/* A non-empty string */
+	char *value;	/* NULL or a non-empty string */
+};
+
+struct plugin_version {
+	int major;	/* Incompatible changes */
+	int minor;	/* Compatible changes, such as adding a new field
+			 * to the end of a struct */
+};
+
+#define DTC_PLUGIN_API_VERSION ((struct plugin_version){ .major = 0, .minor = 0 })
+
+/**
+ * The strictest possible version check.
+ *
+ * @param dtc_ver       The version passed by DTC
+ * @return true on success, false on failure
+ */
+static inline bool dtc_plugin_default_version_check(struct plugin_version dtc_ver)
+{
+	struct plugin_version plugin_ver = DTC_PLUGIN_API_VERSION;
+	return dtc_ver.major == plugin_ver.major && dtc_ver.minor == plugin_ver.minor;
+}
+
+/*
+ * Plugins export functionality by implementing one or more of the
+ * functions below. DTC tries to call each function exactly once for
+ * each plugin.
+ *
+ * The typedefs are there for conveniently storing pointers to these
+ * functions.
+ */
+
+/**
+ * Initialize the plugin.
+ *
+ * Called right after the plugin is loaded.
+ *
+ * Every plugin must implement this. At the very least, it should
+ * perform a version check.
+ *
+ * @param dtc_ver       DTC's plugin API version
+ * @param argc          Length of argv
+ * @param argv          Array of plugin arguments
+ * @return 0 on success, or 1 on failure
+ */
+int dtc_init(struct plugin_version dtc_ver, int argc, struct plugin_arg *argv);
+typedef int (*dtc_init_fn_t)(struct plugin_version dtc_ver, int argc,
+			     struct plugin_arg *argv);
+
+/**
+ * Validate a device tree.
+ *
+ * Called after DTC's parsing stage, but before the output stage.
+ *
+ * @param dti   The unflattened device tree. Implementations can modify
+ *              it and "pass it back" to DTC and to subsequent plugins.
+ *              The header "dt.h" contains functionality for accessing
+ *              "struct dt_info".
+ * @return 1 on a fatal failure, otherwise 0
+ */
+int dtc_validate(struct dt_info *dti);
+typedef int (*dtc_validate_fn_t)(struct dt_info *dti);
+
+#endif /* DTC_PLUGIN_H */
diff --git a/dtc.c b/dtc.c
index bdb3f59..89f67aa 100644
--- a/dtc.c
+++ b/dtc.c
@@ -4,6 +4,7 @@
  */
 
 #include <sys/stat.h>
+#include <dlfcn.h>
 
 #include "dtc.h"
 #include "srcpos.h"
@@ -47,7 +48,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@AThv";
+static const char usage_short_opts[] = "qI:O:o:V:d:l:L:R:S:p:a:fb:i:H:sW:E:@AThv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -55,6 +56,8 @@ static struct option const usage_long_opts[] = {
 	{"out-format",        a_argument, NULL, 'O'},
 	{"out-version",       a_argument, NULL, 'V'},
 	{"out-dependency",    a_argument, NULL, 'd'},
+	{"plugin",            a_argument, NULL, 'l'},
+	{"plugin-dir",        a_argument, NULL, 'L'},
 	{"reserve",           a_argument, NULL, 'R'},
 	{"space",             a_argument, NULL, 'S'},
 	{"pad",               a_argument, NULL, 'p'},
@@ -89,6 +92,13 @@ static const char * const usage_opts_help[] = {
 	 "\t\tasm - assembler source",
 	"\n\tBlob version to produce, defaults to "stringify(DEFAULT_FDT_VERSION)" (for dtb and asm output)",
 	"\n\tOutput dependency file",
+	"\n\tLoad a plugin and, optionally, pass it an argument.\n"
+	"\tUsage: -l <plugin name>[,key[,value]]\n"
+	 "\t\tplugin name - the name of the shared object without the extension (can contain a path)\n"
+	 "\t\tkey         - the name of the argument\n"
+	 "\t\tvalue       - the value of the argument (can be omitted)\n"
+	"\tExample: dtc -l some-plugin,o,out.dts -l some-plugin,help -l another-plugin [...]",
+	"\n\tThe directory in which to search for plugins",
 	"\n\tMake space for <number> reserve map entries (for dtb and asm output)",
 	"\n\tMake the blob at least <bytes> long (extra space)",
 	"\n\tAdd padding to the blob of <bytes> long (extra space)",
@@ -157,6 +167,114 @@ static const char *guess_input_format(const char *fname, const char *fallback)
 	return guess_type_by_name(fname, fallback);
 }
 
+static struct plugin *get_plugin_with_path(struct plugin_array *plugins,
+					   char *path)
+{
+	struct plugin *p;
+	array_for_each(plugins, p)
+		if (strcmp(p->path, path) == 0)
+			return p;
+
+	return NULL;
+}
+
+static void parse_plugin_info(char *arg, const char *plugin_dir, char **path,
+			      char **key, char **value)
+{
+	char *name;
+	size_t dirlen;
+	char *tmp;
+	size_t tmplen;
+
+	if (arg == NULL || *arg == '\0' || *arg == ',' || plugin_dir == NULL)
+		return;
+
+	name = strtok(arg, ",");
+
+	dirlen = strlen(plugin_dir);
+	tmplen = dirlen + strlen(name) + strlen(SHAREDLIB_EXT) + 2;
+	tmp = xmalloc(tmplen);
+
+	if (plugin_dir[0] == '\0' || plugin_dir[dirlen - 1] == DIR_SEPARATOR)
+		snprintf(tmp, tmplen, "%s%s%s", plugin_dir,
+			 name, SHAREDLIB_EXT);
+	else
+		snprintf(tmp, tmplen, "%s%c%s%s", plugin_dir,
+			 DIR_SEPARATOR, name, SHAREDLIB_EXT);
+
+	*path = realpath(tmp, NULL); /* malloc path */
+	if (*path == NULL)
+		die("Couldn't resolve plugin path %s: %s\n", tmp, strerror(errno));
+
+	*key = strtok(NULL, ",");
+	*value = strtok(NULL, "");
+	free(tmp);
+}
+
+static void register_plugin_info(struct plugin_array *plugins, char *arg,
+				 const char *plugin_dir)
+{
+	char *path = NULL;
+	char *key = NULL;
+	char *value = NULL;
+	struct plugin *old_plugin;
+	struct plugin new_plugin;
+	struct plugin_arg p_arg;
+
+	parse_plugin_info(arg, plugin_dir, &path, &key, &value);
+
+	if (path == NULL)
+		return;
+
+	p_arg = (struct plugin_arg){ .key = key, .value = value };
+	old_plugin = get_plugin_with_path(plugins, path);
+
+	if (old_plugin == NULL) {
+		new_plugin = (struct plugin){ .path = path, .args = empty_array };
+
+		if (key != NULL)
+			array_add(&new_plugin.args, p_arg);
+
+		array_add(plugins, new_plugin);
+		return;
+	}
+
+	if (key != NULL)
+		array_add(&old_plugin->args, p_arg);
+
+	free(path);
+}
+
+static void load_plugins(struct plugin_array *plugins,
+			 const struct string_array *plugin_args,
+			 const char *plugin_dir)
+{
+	dtc_init_fn_t init;
+	struct plugin *p;
+	char **arg;
+
+	array_for_each(plugin_args, arg) {
+		register_plugin_info(plugins, *arg, plugin_dir);
+	}
+
+	array_for_each(plugins, p) {
+		p->handle = dlopen(p->path, RTLD_NOW | RTLD_GLOBAL | RTLD_DEEPBIND);
+		if (p->handle == NULL)
+			die("Couldn't load plugin %s: %s\n", p->path, dlerror());
+
+		init = dlsym(p->handle, "dtc_init");
+		if (init == NULL)
+			die("Plugin %s needs to implement dtc_init\n",
+			    p->path);
+
+		if (init(DTC_PLUGIN_API_VERSION, p->args.len, p->args.data)) {
+			fprintf(stderr, "DTC: Plugin %s wasn't initialized. Exiting DTC.\n",
+				p->path);
+			exit(1);
+		}
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	struct dt_info *dti;
@@ -170,6 +288,10 @@ int main(int argc, char *argv[])
 	FILE *outf = NULL;
 	int outversion = DEFAULT_FDT_VERSION;
 	long long cmdline_boot_cpuid = -1;
+	struct plugin_array plugins = empty_array;
+	struct plugin *plugin;
+	struct string_array plugin_args = empty_array;
+	const char *plugin_dir = "";
 
 	quiet      = 0;
 	reservenum = 0;
@@ -194,6 +316,12 @@ int main(int argc, char *argv[])
 		case 'd':
 			depname = optarg;
 			break;
+		case 'l':
+			array_add(&plugin_args, optarg);
+			break;
+		case 'L':
+			plugin_dir = optarg;
+			break;
 		case 'R':
 			reservenum = strtol(optarg, NULL, 0);
 			break;
@@ -283,6 +411,8 @@ int main(int argc, char *argv[])
 		fprintf(depfile, "%s:", outname);
 	}
 
+	load_plugins(&plugins, &plugin_args, plugin_dir);
+
 	if (inform == NULL)
 		inform = guess_input_format(arg, "dts");
 	if (outform == NULL) {
@@ -324,6 +454,15 @@ int main(int argc, char *argv[])
 
 	process_checks(force, dti);
 
+	array_for_each(&plugins, plugin) {
+		dtc_validate_fn_t val = dlsym(plugin->handle, "dtc_validate");
+		if (val && val(dti)) {
+			fprintf(stderr, "DTC: Plugin %s failed to validate the "
+				"device tree. Exiting DTC.\n", plugin->path);
+			exit(1);
+		}
+	}
+
 	if (auto_label_aliases)
 		generate_label_tree(dti, "aliases", false);
 
@@ -365,5 +504,6 @@ int main(int argc, char *argv[])
 		die("Unknown output format \"%s\"\n", outform);
 	}
 
+	/* Leak the plugins and the live tree */
 	exit(0);
 }
diff --git a/dtc.h b/dtc.h
index 286d999..e66e5d1 100644
--- a/dtc.h
+++ b/dtc.h
@@ -22,6 +22,7 @@
 #include <fdt.h>
 
 #include "util.h"
+#include "dtc-plugin.h"
 
 #ifdef DEBUG
 #define debug(...)	printf(__VA_ARGS__)
@@ -340,4 +341,49 @@ void dt_to_yaml(FILE *f, struct dt_info *dti);
 
 struct dt_info *dt_from_fs(const char *dirname);
 
+/* Plugins */
+
+struct plugin_arg_array {
+	size_t cap;
+	size_t len;
+	struct plugin_arg *data;
+};
+
+struct plugin {
+	const char *path;
+	struct plugin_arg_array args;
+	void *handle;
+};
+
+struct plugin_array {
+	size_t cap;
+	size_t len;
+	struct plugin *data;
+};
+
+struct string_array {
+	size_t cap;
+	size_t len;
+	char **data;
+};
+
+#define empty_array { 0 }
+
+/* Don't add elements to an array while iterating over it */
+#define array_for_each(a, p) \
+	for ((p) = (a)->data; (p) < (a)->data + (a)->len; (p)++)
+
+/* Invalidates all pointers to array members because of the realloc */
+#define array_add(a, p) (						\
+{									\
+	if ((a)->len == (a)->cap) {					\
+		(a)->cap = (a)->cap * 2 + 1;				\
+		(a)->data = xrealloc((a)->data, (a)->cap * sizeof(p));	\
+	}								\
+	(a)->data[(a)->len++] = (p);					\
+})
+
+#define DIR_SEPARATOR '/'
+#define SHAREDLIB_EXT ".so"
+
 #endif /* DTC_H */
-- 
2.17.1

