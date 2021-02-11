From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [DTC][RFC] dtc: Allow better error reporting
Date: Thu, 11 Feb 2021 08:22:30 -0600
Message-ID: <CAL_JsqLfLQe7bxcGYeoSWsBnS+JoagLcOZ-RGS0hbdwjRhfBqA@mail.gmail.com>
References: <3950d7da35130a850ba9217ac7bfef781fa850b2.1613042485.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613053364;
        bh=+vkDUGE9k0q1TcP98IVbVBVpIIpuD2DYvqDyFTRnLO0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=drTjfn23jTZ8ZOR++TJJc5hgtb8c6rsepYRLvAgrE5G7IXsNeLs+HnLZTccQivJtX
         +2cEwz4RGkKBS293Vy0KAzuGquiZUKRXMsz8wr8lJATSMxX01J3x+ntlCDBFfLOfUI
         ZGzMsE4+gqIKQoPplKpOV/UQq/ZWL5wj0s+ki00+GsUXUewMAWG9q+QdUYfKMwy+XC
         iGT/WA7LR6is60NU8ah8ozFQSv+LxEppwtVp+eMpqA2Nm/fnNdsvA99bCMBgPxwTNO
         +qKJghtnWI02Jb9IwQ2DK2YMNO/HibQSO8E07GShgSRBD3Ibbs1IoPXUtbHH75pOji
         VEpwSkdWrN44A==
In-Reply-To: <3950d7da35130a850ba9217ac7bfef781fa850b2.1613042485.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Feb 11, 2021 at 5:27 AM Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> The dtc tool doesn't do very elaborate error reporting to keep the size
> of the executables small enough for all kind of applications.
>
> This patch tries to provide a way to do better error reporting, without
> increasing the size of the executables for such cases (where we don't
> want elaborate error reporting).
>
> The error reporting will only be enabled if 'VERBOSE' (as -DVERBOSE)
> flag is passed during compilation of the tools.
>
> This also updates the fdtoverlay tool to do better error reporting,
> which is required by the Linux Kernel for now.
>
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> ---
> Hi David,
>
> Unfortunately I am not a core DT guy and don't understand most of the
> stuff going on here. I tried to do minimal changes to get more
> information out on errors and it may require someone who understands the
> code well to write better error logs.
>
> FWIW, I stumbled upon this because of the discussion that happened here:
>
> https://lore.kernel.org/lkml/74f8aa8f-ffab-3b0f-186f-31fb7395ebbb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
>
> Thanks.
>
> ---
>  dtc.h                |   6 ++
>  fdtoverlay.c         |   1 +
>  libfdt/fdt_overlay.c | 156 ++++++++++++++++++++++++++++++++++---------
>  3 files changed, 132 insertions(+), 31 deletions(-)
>
> diff --git a/dtc.h b/dtc.h
> index d3e82fb8e3db..b8ffec155263 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -29,6 +29,12 @@
>  #define debug(...)
>  #endif
>
> +#ifdef VERBOSE
> +#define dtc_err(fmt, ...)      fprintf(stderr, "DTC: %s: %d: " fmt, __func__, __LINE__, ##__VA_ARGS__)
> +#else
> +#define dtc_err(fmt, ...)
> +#endif

This needs to go in libfdt.

The executables can always print, it's the libfdt library that may or
may not be able to.

Rob
