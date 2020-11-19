From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v4 0/4] dtc: Add a plugin interface
Date: Thu, 19 Nov 2020 09:44:12 -0600
Message-ID: <CAL_JsqLskX5+v+N_oHQ=XRsXf5zm-Fuo8NQ_TyQfaONzkE-EHQ@mail.gmail.com>
References: <20200915170726.15434-1-andreiziureaev@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605800664;
        bh=UvJYJP7ZbS25U6AW8ac9k+bxL9xs110kdTDK8641LWk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LneDvTPPpqWv+jYLAJZ+N5zgzwRzvX/QIpuCCbQhUrQ+VhM5SXsjqnxin1iooXe/m
         NxL5eeJ3bU5mvq0fAmCGq6FLH6IBthopTJpclTB8c2wDHHjtvrBxBOnACNT8kTmK7w
         nqW/PzNamFB38ITlIaKx5tOHSGbIn/kFaaEJ9jKI=
In-Reply-To: <20200915170726.15434-1-andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On Tue, Sep 15, 2020 at 12:07 PM Andrei Ziureaev
<andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
>
> I added full documentation to the live tree API and changed the style of
> comments in "dtc-plugin.h" to kernel-doc.

David, more comments on this series?

>
> The live tree can be kept read-only. So, the input to a plugin is some
> information about the tree and its outputs are printed error messages
> and an ack/nack return back to DTC.
> ===========
>
> This is one possible implementation of a plugin interface for DTC.
>
> A plugin interface would allow us to add checks in languages other than
> C. Specifically, it would allow DTC and DT Schema (which is written in
> Python) to be integrated.
>
> It would also allow for better debugging of dts files. For example, DT
> Schema would be able to print dts source line information, without us
> having to add source line annotations to yaml files.
>
> Plugins are allowed read-only access to the internal unflattened device
> tree using the provided API. They can print error messages and return a
> boolean status back to DTC.
>
> There's a question of whether we should relicense some headers to
> dual BSD to be able call Python code.
>
> Any thoughts would be much appreciated.
>
> Thanks,
> Andrei.
>
> Changes in v4:
> - full documentation for live tree API
> - changed comments to kernel-doc
> - simplified "Exporting Functionality" in the manual
> - the docs mention that the tree is read-only
>
> Changes in v3:
> - live tree API (dt.h and dt.c)
> - additional functionality in dtc.h
> - plugins have to implement prototypes
> - improved documentation
>
> Changes in v2:
> - improved documentation
> - plugins must register with the build system
> - the "validate_fn_t" hook can return a status
> - define "struct reserve_info" in "dtc-plugin.h"
> - specify that minor versions are compatible
> - check if plugin_dir is NULL, just in case
> - better variable names in register_plugin_info
>
> Andrei Ziureaev (4):
>   dtc: Add marker type functionality to dtc.h
>   dtc: Add a live tree API
>   dtc: Add plugin documentation and examples
>   dtc: Add a plugin interface
>
>  Documentation/manual.txt         | 154 ++++++++++++++++
>  Makefile                         |  29 ++-
>  Makefile.dtc                     |   1 +
>  dt.c                             | 158 ++++++++++++++++
>  dt.h                             | 299 +++++++++++++++++++++++++++++++
>  dtc-plugin.h                     |  90 ++++++++++
>  dtc.c                            | 142 ++++++++++++++-
>  dtc.h                            |  57 ++++++
>  plugins/example/Makefile.example |  27 +++
>  plugins/example/example.c        |  33 ++++
>  treesource.c                     |   8 +-
>  11 files changed, 992 insertions(+), 6 deletions(-)
>  create mode 100644 dt.c
>  create mode 100644 dt.h
>  create mode 100644 dtc-plugin.h
>  create mode 100644 plugins/example/Makefile.example
>  create mode 100644 plugins/example/example.c
>
> --
> 2.17.1
>
