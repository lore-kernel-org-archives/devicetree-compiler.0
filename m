From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Bug or feature? /somenode overwrites /somenode@17 in fdt-overlay
Date: Tue, 25 Apr 2023 11:25:42 -0500
Message-ID: <CAL_JsqJt7FFq1Dn3eCd7p2wi_E1xbh_kzd8A6Otu0X4i85-mWQ@mail.gmail.com>
References: <20230425145504.tswuitufzikuhmnz@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682439955;
        bh=VeRXBSqiqE0SqYpCpIm9180c/Wen/+EUhOVTFCYGBk8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jpKx4WL9ZxlVN9IM7BJ5amM1vY4ccyhSpVqzwU9uv/Mub7d2YZ4mGf2iSST3EBjF0
         7VsUtYDu22+GWdWijoIhkuqrWusBRB9KLWzhxrk9xdHRU4/xwWcQOb6tDpjwa7amJU
         5s2UiHCvSAw9tTm1vZ6c3Wa5zKVfJdn5loI6Ey0uROxv3BUhC0wbWzssRYlwoQIFWC
         lIgN1xJI9A8pWxu0ssGENIGWKxAyE2A8qaa6KgYjg77GaRBnQgPnTh8+e2q3vSxx4M
         NHTwVUAkciviB7a6q/hmqqz8Yk9XdHvr1hAH0uOiEo0yFhPR42LStHkwCqPfFZlNsw
         2z0CC02fdjTsw==
In-Reply-To: <20230425145504.tswuitufzikuhmnz-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Apr 25, 2023 at 9:55=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>
> Hello,
>
> TL;DR: The node &{/somenode} in my overlay overwrites &{/somenode@27}.
> Is this expected?

Sounds like a bug to me. Probably due to our mixed of handling node
names with and without the unit-address included.

Rob
