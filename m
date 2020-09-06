From: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v3 3/4] dtc: Add plugin documentation and examples
Date: Sun,  6 Sep 2020 14:12:19 +0100
Message-ID: <20200906131220.6192-4-andrei.ziureaev@arm.com>
References: <20200906131220.6192-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5JNLEimWwlsjC/zDgDXdTQQ8lMiiSL7c3iw5oD1wqHw=;
        b=g2i4C79/rOhWmJyYenQ8OfgxZiOp6ml7eE7rccJGEMCuy/XuK0lTEz8kKzzAn22P23
         eC6iDH9uVYEelOrYW9ml0KhG0dXR8YvvEviCfwG2q3Qho3f/Aaxi0OK7I4fOXMvARHCh
         PJwpAH8E82r58PFmDIEtS1VqpEVmzyyiCZeqNGrOWa2kmvuLEaXmc7hy4npX26pB3zEk
         EO79MNSPxD1Gub8VgzD26kgAjSRyxxl0QAupp49uTouAnyM3VjMoBx2jWstJY2QlR0VF
         56qGRLOjw6+w2Jh45WwTP/TPko0gfNMAmgMQWfWVSht9sFZ0V6Q/i0s62Jh7n6Dm7Uz8
         aLdQ==
In-Reply-To: <20200906131220.6192-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrei.ziureaev-5wv7dgnIgG8@public.gmane.org

Document the plugin API in Documentation/manual.txt and provide an
example plugin.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changes in v3:
- plugins have to implement prototypes
- added license tags to the example
- copied some definitions from dtc-plugin.h to the manual
- better wording

Changes in v2:
- better structure
- information about the data model under "5.2) Exporting Functionality"
- plugins must register with the build system
- the "validate_fn_t" hook can return a status

 Documentation/manual.txt         | 146 +++++++++++++++++++++++++++++++
 plugins/example/Makefile.example |  27 ++++++
 plugins/example/example.c        |  33 +++++++
 3 files changed, 206 insertions(+)
 create mode 100644 plugins/example/Makefile.example
 create mode 100644 plugins/example/example.c

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index adf5ccb..c87d1f3 100644
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
 
+    -l, --plugin <plugin name>[,key[,value]]
+	Load a plugin and, optionally, pass it an argument.
+		plugin name - the name of the shared object without the extension (can contain a path)
+		key         - the name of the argument
+		value       - the value of the argument (can be omitted)
+	Example: dtc -l some-plugin,o,out.dts -l some-plugin,help -l another-plugin [...]
+
+    -L, --plugin-dir <arg>
+	The directory in which to search for plugins
+
     -q
 	Quiet: -q suppress warnings, -qq errors, -qqq all
 
@@ -272,6 +285,139 @@ And used in properties, labels may appear before or after any value:
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
+Suppose your plugin is called "example" and its source code is in
+"plugins/example/example.c". To register it with the build system,
+create a file "plugins/example/Makefile.example" with the following
+line as its contents:
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
+for convenience. You could then call DTC like this:
+
+    ./dtc -Onull some-file.dts -l plugins/example
+
+Please, see "plugins/example/Makefile.example" for how to override the
+default behavior, add GCC flags, etc.
+
+
+5.2) Exporting Functionality
+
+- From "dtc-plugin.h":
+
+```
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
+```
+
+- "struct plugin_version" is defined as:
+
+```
+struct plugin_version {
+	int major;	/* Incompatible changes */
+	int minor;	/* Compatible changes, such as adding a new field
+			 * to the end of a struct */
+};
+```
+
+- A version check can be performed by calling this function:
+
+```
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
+```
+
+- "struct plugin_arg" is defined as:
+
+```
+struct plugin_arg {
+	char *key;	/* A non-empty string */
+	char *value;	/* NULL or a non-empty string */
+};
+```
+
+Please, see an example of a "dtc_init" implementation in
+"plugins/example/example.c".
+
+
 
 II - The DT block format
 ========================
diff --git a/plugins/example/Makefile.example b/plugins/example/Makefile.example
new file mode 100644
index 0000000..9dc06e1
--- /dev/null
+++ b/plugins/example/Makefile.example
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Makefile.example
+#
+# This is not a complete Makefile of itself.  Instead, it is designed to
+# be easily embeddable into other systems of Makefiles.
+#
+
+# Allow "make plugins" to discover the plugin
+PLUGIN_LIBS += $(PLUGIN_dir)/example/example.$(SHAREDLIB_EXT)
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
index 0000000..4d4e7f3
--- /dev/null
+++ b/plugins/example/example.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * (C) Copyright Arm Holdings.  2020
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+#include "dtc-plugin.h"
+
+#define NAME "example: "
+
+int dtc_init(struct plugin_version dtc_ver, int argc, struct plugin_arg *argv)
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
-- 
2.17.1

