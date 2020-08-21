From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v2 1/3] dtc: Add plugin documentation and examples
Date: Fri, 21 Aug 2020 19:01:53 +0100
Message-ID: <20200821180155.16680-2-andrei.ziureaev@arm.com>
References: <20200821180155.16680-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200821180155.16680-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Document the plugin API in Documentation/manual.txt and provide an
example plugin.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---

Changes in v2:
- better structure
- information about the data model under "5.2) Exporting Functionality"
- plugins must register with the build system
- the "validate_fn_t" hook can return a status

 Documentation/manual.txt         | 93 ++++++++++++++++++++++++++++++++
 plugins/example/Makefile.example | 20 +++++++
 plugins/example/example.c        | 29 ++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 plugins/example/Makefile.example
 create mode 100644 plugins/example/example.c

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index adf5ccb380ca..dd5769d97b32 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -10,6 +10,9 @@ I - "dtc", the device tree compiler
     4.1) Overview
     4.2) Properties
     4.3) Labels and References
+    5) Plugins
+    5.1) Building and Installing
+    5.2) Exporting Functionality
 
 II - The DT block format
     1) Header
@@ -115,6 +118,16 @@ Options:
     -d <dependency_filename>
 	Generate a dependency file during compilation.
 
+    -l, --plugin <plugin name>[,key][,value]
+	Load a plugin and, optionally, pass it an argument.
+		plugin name - the name of the shared object without the extension (can contain a path)
+		key         - the name of the argument
+		value       - can be omitted
+	Example: dtc -l some-plugin,o,out.dts -l some-plugin,help -l another-plugin [...]
+
+    -L, --plugin-dir <arg>
+	The directory in which to search for plugins
+
     -q
 	Quiet: -q suppress warnings, -qq errors, -qqq all
 
@@ -272,6 +285,86 @@ And used in properties, labels may appear before or after any value:
     };
 
 
+5) Plugins
+
+Plugins are shared libraries that DTC loads at runtime using
+
+	dlopen(path, RTLD_NOW | RTLD_GLOBAL | RTLD_DEEPBIND)
+
+RTLD_NOW means they are loaded immediately (right before the parsing
+stage).
+
+RTLD_GLOBAL means their symbols can be used by other plugins.
+
+RTLD_DEEPBIND means the dynamic linker will look for symbols within the
+plugin first, before searching in the main program and other plugins.
+
+All plugins must include the "dtc-plugin.h" header.
+
+
+5.1) Building and Installing
+
+Plugins are built and installed using the command "make plugins".
+
+Suppose your plugin is called "example". To register it with the build
+system, create a file "plugins/example/Makefile.example" with the
+following line as its contents:
+
+PLUGIN_LIBS += $(PLUGIN_dir)/example/example.so
+
+This means "make plugins" will try to build
+
+	plugins/example/example.so
+
+from
+
+	plugins/example/example.c
+
+It will also make a symlink
+
+	plugins/example.so
+
+for convenience.
+
+Please, see "plugins/example/Makefile.example" for how to override the
+default behavior, add GCC flags, etc.
+
+
+5.2) Exporting Functionality
+
+Plugins export functionality through the "EXPORT_FUNCTION(type, fn)"
+macro, where "fn" is the function that will be called by DTC, and
+"type" must be a name of one of the following typedefs:
+
+/**
+ * Called right after the plugin is loaded.
+ *
+ * Every plugin must export a function of this type.
+ *
+ * @param dtc_ver	DTC's plugin API version
+ * @param argc		Length of argv
+ * @param argv		Array of plugin arguments
+ * @return 0 on success, or 1 on failure
+ */
+typedef int (*init_fn_t)(struct plugin_version dtc_ver, int argc,
+			 struct plugin_arg *argv);
+
+/**
+ * Called after DTC's parsing stage, but before the output stage.
+ *
+ * @param dti	DTC's internal live tree. Implementations can modify
+ * 		the live tree and "pass it back" to DTC and to
+ * 		subsequent plugins.
+ * @return 1 on a fatal failure, otherwise 0
+ */
+typedef int (*validate_fn_t)(struct dt_info *dti);
+
+
+DTC calls each type exactly once for each plugin.
+
+Please, see an example at "plugins/example/example.c".
+
+
 
 II - The DT block format
 ========================
diff --git a/plugins/example/Makefile.example b/plugins/example/Makefile.example
new file mode 100644
index 000000000000..ba9460f0eee9
--- /dev/null
+++ b/plugins/example/Makefile.example
@@ -0,0 +1,20 @@
+# Allow "make plugins" to discover the plugin
+PLUGIN_LIBS += $(PLUGIN_dir)/example/example.so
+
+# Add GCC flags:
+# PLUGIN_CFLAGS_example = -some-flag
+
+# Add libraries:
+# PLUGIN_LDLIBS_example = -lsome-lib
+
+# Add files to clean:
+# PLUGIN_CLEANFILES += $(PLUGIN_dir)/example/*.tmp
+
+# Override the default rules:
+# $(PLUGIN_dir)/example/example.$(SHAREDLIB_EXT): $(PLUGIN_dir)/example/example.o
+#	@$(VECHO) LD $@
+#	...
+#
+# $(PLUGIN_dir)/example/example.o: $(PLUGIN_dir)/example/example.c
+#	@$(VECHO) CC $@
+#	...
diff --git a/plugins/example/example.c b/plugins/example/example.c
new file mode 100644
index 000000000000..5a9f647e6a4c
--- /dev/null
+++ b/plugins/example/example.c
@@ -0,0 +1,29 @@
+#include <stdio.h>
+#include <string.h>
+
+#include "dtc-plugin.h"
+
+#define NAME "example: "
+
+static int init_example(struct plugin_version dtc_ver, int argc, struct plugin_arg *argv)
+{
+	if (!dtc_plugin_default_version_check(dtc_ver)) {
+		fprintf(stderr, NAME"Plugin is incompatible with this version of DTC\n");
+		return 1;
+	}
+
+	for (int i = 0; i < argc; i++) {
+		if (strcmp(argv[i].key, "h") == 0
+		 || strcmp(argv[i].key, "help") == 0) {
+			printf(NAME"This is an example plugin. It prints its arguments.\n");
+			return 1;
+		} else {
+			printf(NAME"%s: %s\n", argv[i].key,
+			       argv[i].value ? argv[i].value : "");
+		}
+	}
+
+	printf(NAME"Loaded plugin 'example'\n");
+	return 0;
+}
+EXPORT_FUNCTION(init_fn_t, init_example);
-- 
2.17.1

