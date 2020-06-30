From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] dtc: Add sign preservation tests
Date: Mon, 29 Jun 2020 19:40:35 -0600
Message-ID: <CAL_JsqJeqgj3rujiJFh1=j4gQsFcdw6jnueY_OA1_X9XXjyamQ@mail.gmail.com>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com> <20200626162528.2129-4-andrei.ziureaev@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593481248;
        bh=fvb7GDcn+FxM/JwC78cHzr+PImBRzY6XhDayfDmsWeo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ka41eyADOksrZVEn5+FmHSqxAJfRyhfq0hRbsQa/ySPAPl2s9n0CCzVR+N9zbzfGD
         N0zifE9TV3FgXHZMJmItmsr1TAHrMNwhuP3kVKnq2RjHUM+cUfXa185pqy128bqPXP
         mDoWXvbUq5KIrzjuv0xV+k5ARalnvvk5RRntjMVc=
In-Reply-To: <20200626162528.2129-4-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Jun 26, 2020 at 10:25 AM Andrei Ziureaev
<andrei.ziureaev-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Test whether dts and yaml outputs preserve the signs of integers.
>
> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
> ---
>  tests/run_tests.sh                    |  4 ++--
>  tests/sign-preservation-bytes.dt.yaml |  5 +++++
>  tests/sign-preservation-bytes.dts     |  7 +++++++
>  tests/sign-preservation.dt.yaml       | 20 +++++++++++++++++++
>  tests/sign-preservation.dts           | 28 +++++++++++++++++++++++++++
>  5 files changed, 62 insertions(+), 2 deletions(-)
>  create mode 100644 tests/sign-preservation-bytes.dt.yaml
>  create mode 100644 tests/sign-preservation-bytes.dts
>  create mode 100644 tests/sign-preservation.dt.yaml
>  create mode 100644 tests/sign-preservation.dts

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
