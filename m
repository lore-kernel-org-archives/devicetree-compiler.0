From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 0/4] dtc: Add a plugin interface
Date: Tue, 21 Jul 2020 16:58:56 +0100
Message-ID: <20200721155900.9147-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is one possible implementation of a plugin interface for dtc.

A plugin interface would allow us to add checks in languages other than
C. Specifically, it would allow dtc to parse dts files, validate them
using DT Schema (which is written in Python), and output dtb files, all
in one command. The command would look something like:

dtc -O dtb -o test.dtb -Lplugins/ \
	-ldt-validate,u,./Documentation/devicetree/bindings \
	-ldt-validate,p,./Documentation/devicetree/bindings/processed-schema.yaml \
	test.dts

DT Schema would also be able to access dts source line information. If
we don't end up having a plugin interface, the alternative would be to
add source annotations to dtc's yaml output.

The plugin interface exports the live tree, making it an ABI. This is
the part I'm most unsure about. Right now, I just cut-and-pasted some
definitions that might be useful for plugins into dtc-plugin.h. This
means the whole live tree structure is exposed and plugins can change it
in any way they want.

I guess a better option would be to make a standard library for live
trees, and have that separate from what dtc uses internally. Some
functions from livetree.c seem useful (although I haven't looked too
much into it yet).

There's also a question of whether we should relicense dtc-plugin.h to
dual BSD to be able call Python code.

Patch 1 fixes a small header issue.
Patch 2 contains an overview of what I have in mind.
Patch 3 isn't very exciting.
Patch 4 is the implementation.

TODO:
- add tests
- improve dtc-plugin.h
- write a DT Schema plugin

Any thoughts would be much appreciated.

Thanks,
Andrei.

Andrei Ziureaev (4):
  dtc: Include stdlib.h in util.h
  dtc: Add plugin documentation and examples
  dtc: Move some definitions into dtc-plugin.h
  dtc: Add a plugin interface

 Documentation/manual.txt         |  74 ++++++++++++
 Makefile                         |  32 ++++-
 dtc-plugin.h                     | 200 +++++++++++++++++++++++++++++++
 dtc.c                            | 139 ++++++++++++++++++++-
 dtc.h                            | 192 ++++++++---------------------
 plugins/example/Makefile.example |  19 +++
 plugins/example/example.c        |  29 +++++
 treesource.c                     |  21 ----
 util.h                           |   1 +
 9 files changed, 540 insertions(+), 167 deletions(-)
 create mode 100644 dtc-plugin.h
 create mode 100644 plugins/example/Makefile.example
 create mode 100644 plugins/example/example.c

-- 
2.17.1

