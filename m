From: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v4 0/4] dtc: Add a plugin interface
Date: Tue, 15 Sep 2020 18:07:22 +0100
Message-ID: <20200915170726.15434-1-andreiziureaev@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5LXBJBlpA7sVPtU59VWFMaU7nc/ujmPowQ7uEeuK3yA=;
        b=Lt2jPSAaX42U7okkHE3b7XLgWVgwar3Ra2Rqic7/q0QyKhpF3oX+CN+PGWQUSbt0qX
         XHOAnKgQRla2atu0KflrbMbv263uHnOabPRXCZcB1xXAdItJYzysKSQtuY/QNwiUN3Td
         9L8CFUwedYd7FyqRi5ClkIBinMfiqbwFKlPdnd/xiVJwHJ1hHRs3MVPsUl/itKE08Mkp
         tdNwy5rkUwNT3FlTKc0pxxpZ57pJY+1o895qPu83S4XxjZyes5M51UecPONzuyMA5Rj8
         jO6ieXkLewiOOh5TzLsLO3o2hp2OW4qKovePPwE3QhkFBYrrD0SsylCPbChJ12Cccr9V
         Q2EQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>

I added full documentation to the live tree API and changed the style of
comments in "dtc-plugin.h" to kernel-doc.

The live tree can be kept read-only. So, the input to a plugin is some
information about the tree and its outputs are printed error messages
and an ack/nack return back to DTC.
===========

This is one possible implementation of a plugin interface for DTC.

A plugin interface would allow us to add checks in languages other than
C. Specifically, it would allow DTC and DT Schema (which is written in
Python) to be integrated.

It would also allow for better debugging of dts files. For example, DT
Schema would be able to print dts source line information, without us
having to add source line annotations to yaml files.

Plugins are allowed read-only access to the internal unflattened device
tree using the provided API. They can print error messages and return a
boolean status back to DTC.

There's a question of whether we should relicense some headers to
dual BSD to be able call Python code.

Any thoughts would be much appreciated.

Thanks,
Andrei.

Changes in v4:
- full documentation for live tree API
- changed comments to kernel-doc
- simplified "Exporting Functionality" in the manual
- the docs mention that the tree is read-only

Changes in v3:
- live tree API (dt.h and dt.c)
- additional functionality in dtc.h
- plugins have to implement prototypes
- improved documentation

Changes in v2:
- improved documentation
- plugins must register with the build system
- the "validate_fn_t" hook can return a status
- define "struct reserve_info" in "dtc-plugin.h"
- specify that minor versions are compatible
- check if plugin_dir is NULL, just in case
- better variable names in register_plugin_info

Andrei Ziureaev (4):
  dtc: Add marker type functionality to dtc.h
  dtc: Add a live tree API
  dtc: Add plugin documentation and examples
  dtc: Add a plugin interface

 Documentation/manual.txt         | 154 ++++++++++++++++
 Makefile                         |  29 ++-
 Makefile.dtc                     |   1 +
 dt.c                             | 158 ++++++++++++++++
 dt.h                             | 299 +++++++++++++++++++++++++++++++
 dtc-plugin.h                     |  90 ++++++++++
 dtc.c                            | 142 ++++++++++++++-
 dtc.h                            |  57 ++++++
 plugins/example/Makefile.example |  27 +++
 plugins/example/example.c        |  33 ++++
 treesource.c                     |   8 +-
 11 files changed, 992 insertions(+), 6 deletions(-)
 create mode 100644 dt.c
 create mode 100644 dt.h
 create mode 100644 dtc-plugin.h
 create mode 100644 plugins/example/Makefile.example
 create mode 100644 plugins/example/example.c

-- 
2.17.1

