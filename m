From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 2/6] Add a way to control the level of checks in the code
Date: Mon, 13 Jan 2020 07:39:07 +1300
Message-ID: <CAPnjgZ0fGwoM1WO=UhSRsHXYpS6Xv4SXMQawf_vgBb3r_ZeLNw@mail.gmail.com>
References: <20191113015422.67210-1-sjg@chromium.org> <20191113015422.67210-3-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/4YubRJ+aKzhQ9Pp3vXddrQsdKjAv7UmDMNzok7UNs=;
        b=XvVTffsI1f6MYK8cjhvrf0kgI0ig8RA9UUa8rhKrszFgwucyX3blj4yfzqZmWhYHYI
         I25rmGpbELcDWxkT8+Fs3UHr1iHy9hxG+FtQKnCbFidfEYcNiWtKZShbNXK/qNAWY6js
         M7UOOo2KzigDsNpsZ5sdV3a7G8/2xt5J83gvw=
In-Reply-To: <20191113015422.67210-3-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Hi David,

On Wed, 13 Nov 2019 at 14:54, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Add a new ASSUME_MASK option, which allows for some control over the
> checks used in libfdt. With all assumptions enabled, libfdt assumes that
> the input data and parameters are all correct and that internal errors
> cannot happen.
>
> By default no assumptions are made and all checks are enabled.
>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>
> Changes in v4:
> - Add a can_assume() macros and squash the inline functions into one
> - Drop unnecessary FDT_ prefix
> - Fix 'Incosistencies' typo
> - Merge the 'friendly' and 'sane' checks into one
> - Update and expand comments
>
> Changes in v3:
> - Expand the comments about each check option
> - Invert the checks to be called assumptions
> - Move header-version code to fdt.c
> - Move the comments on check options to the enum
> - Use hex for CHK_MASK
>
> Changes in v2:
> - Add an fdt_ prefix to avoid namespace conflicts
> - Use symbolic names for _check functions and drop leading underscores
>
>  Makefile                 |  6 ++-
>  libfdt/libfdt_internal.h | 88 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+), 1 deletion(-)

Any thoughts on this latest series? We are still carrying a temporary
version in U-Boot.

Regards,
Simon
