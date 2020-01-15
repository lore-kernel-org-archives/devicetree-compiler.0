From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Wed, 15 Jan 2020 15:56:02 +0000
Message-ID: <E1irl1W-00082F-CF@mail.einval.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200113181625.3130-1-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alexandre.torgue-qxv4g6HH51o@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Alexandre!

alexandre.torgue-qxv4g6HH51o@public.gmane.org wrote:
>
>The goal of this series is to add device tree build information in dtb.
>This information can be dtb build date, where devicetree files come from,
>who built the dtb ... Actually, same kind of information that you can find
>in the Linux banner which is printout during kernel boot. Having the same
>kind of information for device tree is useful for debugging and maintenance.
>
>To achieve that a new option "-B" (using an argument) is added to dtc. 
>The argument is a file containing a string with build information
>(e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>DTC use it to append dts file with a new string property "Build-info".
>
>of/fdt.c is modified to printout "Build-info" property during Kernel boot and 
>scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>last part could be improved for sure).
>
>Regards
>Alex
>
>Alexandre Torgue (3):
>  dtc: Add dtb build information option
>  of: fdt: print dtb build information
>  scripts: Use -B dtc option to generate dtb build information.
>
> drivers/of/fdt.c           |  9 +++++++
> scripts/Makefile.lib       | 11 +++++---
> scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
> scripts/gen_dtb_build_info | 11 ++++++++
> 4 files changed, 76 insertions(+), 10 deletions(-)
> create mode 100755 scripts/gen_dtb_build_info

Looks good to me in testing here:

[    0.000000] OF: fdt: From Linux 5.5.0-rc6-00031-g95e20af9fb9c-dirty by stemci01 the Wed 15 Jan 14:33:25 GMT 2020.

Tested-By: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
