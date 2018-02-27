From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2] mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias
Date: Tue, 27 Feb 2018 12:27:26 +0100
Message-ID: <CAPDyKFrFKp7Bn+86jWN1t4Q7bLup0z3cnPM8zMMTdMTQLJSfQA@mail.gmail.com>
References: <1519389859-14947-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=k7rlO5oGE37fvJESDfhsQoK5i5Pi/Kv6Dh04MbXT6T0=;
        b=FQy0VsEg4zUM/gv8dpTqAxZMG0sWbNg794T33819WEU80W31aTR6W3Lo5z65tZvDy0
         W6UsMo8WDcRYC3HxcUAGioiscyfH6R0DFVYREe4Hm+QWTh5E4XzmWHLF5JtfSKeA4QBX
         /ZBE42Wma7KgCZ9+tJEUYjRHg2aDKbwTEBQng=
In-Reply-To: <1519389859-14947-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree-compiler@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 23 February 2018 at 13:44, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The hs_timing_cfg[] array is indexed using a value derived from the
> "mshcN" alias in DT, which may lead to an out-of-bounds access.
>
> Fix this by adding a range check.
>
> Fixes: 361c7fe9b02eee7e ("mmc: dw_mmc-k3: add sd support for hi3660")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for fixes!

Should we add a stable tag as well?

Kind regards
Uffe

> ---
> v2:
>   - Fix Fixes reference.
>
> There is another possible out-of-bounds access in
> drivers/mmc/host/dw_mmc.c:dw_mci_init_slot():
>
>     if (drv_data && drv_data->caps)
>             mmc->caps |= drv_data->caps[ctrl_id];
>
> With ctrl_id derived from "mshcN".
>
> Unfortunately the upper bound is not known at run-time, without adding
> such a field to struct dw_mci_drv_data first.
> ---
>  drivers/mmc/host/dw_mmc-k3.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
> index 73fd75c3c824904d..75ae5803b0db24dd 100644
> --- a/drivers/mmc/host/dw_mmc-k3.c
> +++ b/drivers/mmc/host/dw_mmc-k3.c
> @@ -135,6 +135,9 @@ static int dw_mci_hi6220_parse_dt(struct dw_mci *host)
>         if (priv->ctrl_id < 0)
>                 priv->ctrl_id = 0;
>
> +       if (priv->ctrl_id >= TIMING_MODE)
> +               return -EINVAL;
> +
>         host->priv = priv;
>         return 0;
>  }
> --
> 2.7.4
>
