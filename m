From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/5] checks: Pass boot_info instead of root node
Date: Sat, 3 Dec 2016 18:05:09 -0700
Message-ID: <CAPnjgZ1UNAkkSeuMu-kP855esT78APu0rVKqgqDPVJoj=ORLug@mail.gmail.com>
References: <1480812452-7561-1-git-send-email-sjg@chromium.org> <1480812452-7561-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=KVteXQ40oBKbHLFLVtXKW0llBf23sNouaadXsGMj0uQ=;
        b=ewvsmknfyTJEwUNOeSHkJT+Zc4R6mEfcRnCNrFM2OhXOuQAJUs783DYCh/xK+G1ymD
         4CDbCtzzsX9J0qVS2+PZCi5H9UT/lgmTnrAa9emed0ntwpkXfWpsXN/VAJ7WRXESnZLM
         3xh9GwVpuDSB12VlokVfPpyurv02htbv/x27Nd6XQhpwwwtN7/EaZBiRiccSpNjSt8kj
         NTEiuW0DpgBtmA6vgtoB84hXJ70Jwf1fPrh6mO+VIfbC1sywztCKTQbnqFS/1X0wrO9G
         /WFcbwIl/COaKDFH1l/VV4GsQitMCgu17Lc7aRxeCTOEu3/kiZTRFfnKlPrCfVxxTpuy
         Tt6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=KVteXQ40oBKbHLFLVtXKW0llBf23sNouaadXsGMj0uQ=;
        b=TEppJPi9zEdoRv0ZsoCt2vVO/ETrPi8OXXXiDiSEETSENrHp8m+s+OCNbAbPmktPwh
         64ZMN39kW/vhQ181g9w2LGOPZ81uWR5PxGH6LDOfSW4LTBTu9IpHLA958NF+YbbzZxkJ
         YoJQiK1QxOCeDxMNsBOH0r9AEJ1Dlzfnj9reo=
In-Reply-To: <1480812452-7561-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hi,

On 3 December 2016 at 17:47, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>
> As preparation for overlay support we need to pass the boot info
> parameter instead of the root node to each check method.
>
> The root node can be retrieved by accessing boot info's dt member.
>
> No other functional changes are made.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  checks.c | 78 ++++++++++++++++++++++++++++++++++------------------------------
>  1 file changed, 42 insertions(+), 36 deletions(-)

Please ignore this patch.

Regards,
Simon
