From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 2/4] dtc: Add plugin documentation and examples
Date: Tue, 21 Jul 2020 16:58:58 +0100
Message-ID: <20200721155900.9147-3-andrei.ziureaev@arm.com>
References: <20200721155900.9147-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200721155900.9147-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
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
 Documentation/manual.txt         | 74 ++++++++++++++++++++++++++++++++
 plugins/example/Makefile.example | 19 ++++++++
 plugins/example/example.c        | 29 +++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 plugins/example/Makefile.example
 create mode 100644 plugins/example/example.c

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index adf5ccb..18624aa 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -10,6 +10,10 @@ I - "dtc", the device tree compiler
     4.1) Overview
     4.2) Properties
     4.3) Labels and References
+    5) Plugins
+    5.1) Loading plugins
+    5.2) Exporting Functionality
+    5.3) Building Plugins
 
 II - The DT block format
     1) Header
@@ -115,6 +119,16 @@ Options:
     -d <dependency_filename>
 	Generate a dependency file during compilation.
 
+    -l, --plugin <plugin name>[,key][,value]
+	Load a plugin and, optionally, pass it an argument.
+		plugin name - the name of the shared object without the extension (can contain a path)
+		key         - the name of the argument
+		value       - can be omitted
+	Example: dtc -lsome-plugin,o,out.dts -lsome-plugin,help -l path/to/another-plugin [...]
+
+    -L, --plugin-dir <arg>
+	The directory in which to search for plugins
+
     -q
 	Quiet: -q suppress warnings, -qq errors, -qqq all
 
@@ -272,6 +286,66 @@ And used in properties, labels may appear before or after any value:
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
+5.1) Loading plugins
+
+Please, refer to the -l and -L options in the "Command Line" section.
+
+
+5.2) Exporting Functionality
+
+Plugins export functionality through the "EXPORT_FUNCTION(type, fn)"
+macro, where "type" is one of the typedefs from "dtc-plugin.h", and
+"fn" is the function that will be called by DTC. Each type of function
+gets called once for each plugin.
+
+Every plugin must export a function of type "init_fn_t".
+
+"plugins/example/example.c" shows how an init function can be used.
+
+
+5.3) Building Plugins
+
+The command "make plugins" infers the names of the shared library files
+from the names of directories under "plugins/". For example, the
+presence of a
+
+	plugins/example/
+
+directory means that make will try to build
+
+	plugins/example/example.so
+
+from
+
+	plugins/example/example.c
+
+It will then make a symlink
+
+	plugins/example.so
+
+for convenience.
+
+Please, see "plugins/example/Makefile.example" for how to override the
+defaut behavior.
+
+
 
 II - The DT block format
 ========================
diff --git a/plugins/example/Makefile.example b/plugins/example/Makefile.example
new file mode 100644
index 0000000..56d4e17
--- /dev/null
+++ b/plugins/example/Makefile.example
@@ -0,0 +1,19 @@
+# Optional per-plugin makefile
+#
+# Here you can add gcc flags:
+# PLUGIN_CFLAGS_example = -some-flag
+#
+# Add libraries:
+# PLUGIN_LDLIBS_example = -lsome-lib
+#
+# Add files to clean:
+# PLUGIN_CLEANFILES += $(PLUGIN_dir)/example/*.tmp
+#
+# Or override the default rules:
+# $(PLUGIN_dir)/example/example.$(SHAREDLIB_EXT): $(PLUGIN_dir)/example/example.o
+#	@$(VECHO) LD $@
+#	...
+#
+# $(PLUGIN_dir)/example/example.o: $(PLUGIN_dir)/example/example.c
+#	@$(VECHO) CC $@
+#	...
diff --git a/plugins/example/example.c b/plugins/example/example.c
new file mode 100644
index 0000000..3bbf9ea
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
+static int init_example(struct plugin_version v, int argc, struct plugin_arg *argv)
+{
+	if (!dtc_plugin_default_version_check(v)) {
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

