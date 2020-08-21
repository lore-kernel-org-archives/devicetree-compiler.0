From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v2 0/3] dtc: Add a plugin interface
Date: Fri, 21 Aug 2020 19:01:52 +0100
Message-ID: <20200821180155.16680-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

v2 includes data flow information in "Documentation/manual.txt" under
"5.2) Exporting Functionality". The full changelog is below.
===========

This is one possible implementation of a plugin interface for dtc.

A plugin interface would allow us to add checks in languages other than
C. Specifically, it would allow dtc and DT Schema (which is written in
Python) to be integrated.

It would also allow for better debugging of dts files. For example, DT
Schema would be able to print dts source line information, without us
having to add source line annotations to yaml files.

The plugin interface exports the live tree, making it an ABI. Plugins
are allowed to modify the live tree and pass it back for further
processing.

There is a possibility of improving "dtc-plugin.h" by making a standard
library for live trees.

There's also a question of whether we should relicense dtc-plugin.h to
dual BSD to be able call Python code.

Any thoughts would be much appreciated.

Thanks,
Andrei.

Changes in v2:
- improved documentation
- plugins must register with the build system
- the "validate_fn_t" hook can return a status
- define "struct reserve_info" in "dtc-plugin.h"
- specify that minor versions are compatible
- check if plugin_dir is NULL, just in case
- better variable names in register_plugin_info

Andrei Ziureaev (3):
  dtc: Add plugin documentation and examples
  dtc: Move some definitions into dtc-plugin.h
  dtc: Add a plugin interface

 Documentation/manual.txt         |  93 +++++++++++++
 Makefile                         |  29 +++-
 dtc-plugin.h                     | 232 +++++++++++++++++++++++++++++++
 dtc.c                            | 142 ++++++++++++++++++-
 dtc.h                            | 200 +++++++-------------------
 plugins/example/Makefile.example |  20 +++
 plugins/example/example.c        |  29 ++++
 treesource.c                     |  21 ---
 8 files changed, 591 insertions(+), 175 deletions(-)
 create mode 100644 dtc-plugin.h
 create mode 100644 plugins/example/Makefile.example
 create mode 100644 plugins/example/example.c

-- 
2.17.1

