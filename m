From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] libfdt: add helpers to read address and size from reg
Date: Fri, 18 Nov 2016 11:37:41 -0600
Message-ID: <99dd8a63-19bb-0d06-8bc2-f2ad575ca2cb@ti.com>
References: <1478710712-25010-1-git-send-email-b-fair@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478710712-25010-1-git-send-email-b-fair-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 11/09/2016 10:58 AM, Benjamin Fair wrote:
> This patch extends the capability of libfdt to parse the contents of device
> trees in a similar manner to fdt_address_cells and fdt_size_cells.
>
> It adds a helper function which reads the address and size of a device from
> the reg property and performs basic sanity checks.
>
> It does not perform translation to a physical address using the ranges
> properties of parents, but this enhancement may be added as a separate
> function in the future.
>
> Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> ---
>
> The intent of this patch is similar to the commit "libfdt: Add helpers to read
> #address-cells and #size-cells" [1].
>
> It is related to "libfdt: add address translation support" [2] but does not
> attempt to perform address translation and was written from scratch rather than
> reusing GPL code. If the issues with that patch are resolved, that
> functionality will complement what is added in this patch.
>
> [1] http://www.spinics.net/lists/devicetree-compiler/msg00113.html
> [2] http://www.spinics.net/lists/devicetree-compiler/msg00093.html
>
>  libfdt/fdt_addresses.c | 62 ++++++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h        | 29 ++++++++++++++++++++
>  libfdt/version.lds     |  1 +
>  tests/.gitignore       |  1 +
>  tests/Makefile.tests   |  2 +-
>  tests/addr_size.c      | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  tests/addresses.dts    | 11 ++++++++
>  tests/run_tests.sh     |  1 +
>  8 files changed, 180 insertions(+), 1 deletion(-)
>  create mode 100644 tests/addr_size.c

Hi David,

Did you see this patch?

-- 
Benjamin Fair
