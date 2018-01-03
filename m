From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] overlays: auto allocate phandles for nodes in base fdt
Date: Wed, 3 Jan 2018 11:25:59 -0600
Message-ID: <CACNAnaEHCKHF1N14J=p9yZDnxWh1UyznY7_P8H2JkJt9AqmEYg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jan 3, 2018 at 11:12 AM,  <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> Nodes in the base fdt that do not have phandles cannot currently be referenced
> in overlays; we can target them for an overlay, but we cannot use them as a
> reference in another property if needed. This is quite limiting for some
> use-cases where you're needing cross-references that don't currently exist in
> the base.
>
> Kyle Evans (2):
>   fdt_overlay: Allocate phandles as needed for nodes referenced in base
>     fdt
>   fdt_overlay: Basic regression tests for automatically allocated
>     phandles
>
>  libfdt/fdt_overlay.c                               | 64 +++++++++++++++++-----
>  tests/overlay_base_manual_symbols_auto_phandle.dts | 24 ++++++++
>  tests/run_tests.sh                                 |  6 ++
>  3 files changed, 81 insertions(+), 13 deletions(-)
>  create mode 100644 tests/overlay_base_manual_symbols_auto_phandle.dts
>
> --
> 2.15.1

It seems I also goofed the Signed-off-by lines this series; I've been
changing them manually for dtc/libfdt patches as I'm doing these in a
FreeBSD capacity. Apologies.
