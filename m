From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] pylibfdt: add Property.as_stringlist()
Date: Wed, 5 Jan 2022 16:48:31 -0600
Message-ID: <CAL_JsqLvQdm1kqMED8G03LEsm+xgyY2A+F+FD8DYeAy5o+eiGg@mail.gmail.com>
References: <20211225132558.167123-1-luca@z3ntu.xyz> <20211225132558.167123-2-luca@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641422924;
        bh=9NL8VhpZHCALAaIgb+vbw0SuEb3M55My3CKhamHMMjY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XAqT84JjsFVCzvPubJlbevzgaSwRUrfrLcGpR8ZVVZ6aRCmuHZ10BX08xUxKkxSWm
         oXQRP02u8oxBFEu1tbe/emkzCPnnm0WF3QNl9KArlwQJmEUiEqfm4r4+BC3L9GrwyC
         C4lI0rmSH+jfWEIDpYmV0OuqIgUgUhg+E+NKBRLT+YSLVZGoAbEYBVE6lOVEvQ3VR9
         6wUCWwk/x75SqzcVEvqN6nRnGPqOdXfE+hcuLhHyrE2VvSaU5x8l4Nivqx9C2mbOBt
         hbg+qtVu1klM8ETr71yjrT6NVrs0jBjD8JT+ihaRV5k63I6bq6LOEKvKVGkqLi+Bo0
         PSelo1F1peFbQ==
In-Reply-To: <20211225132558.167123-2-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sat, Dec 25, 2021 at 7:26 AM Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Add a new method for decoding a string list property, useful for e.g.
> the "reg-names" property.
>
> Also add a test for the new method.
>
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
>  pylibfdt/libfdt.i       | 7 +++++++
>  tests/pylibfdt_tests.py | 8 ++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 9ccc57b..c81b504 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -724,6 +724,13 @@ class Property(bytearray):
>              raise ValueError('Property contains embedded nul characters')
>          return self[:-1].decode('utf-8')
>
> +    def as_stringlist(self):
> +        """Unicode is supported by decoding from UTF-8"""
> +        if self[-1] != 0:
> +            raise ValueError('Property lacks nul termination')
> +        parts = self[:-1].split(b'\x00')
> +        return list(map(lambda x: x.decode('utf-8'), parts))

Doesn't this result in multiple decode() calls when a single one would work:

return data[:-1].decode(encoding='ascii').split('\0')

Rob
