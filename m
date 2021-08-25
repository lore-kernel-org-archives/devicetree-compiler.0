From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fdtdump: fix -Werror=int-to-pointer-cast
Date: Wed, 25 Aug 2021 10:14:10 -0500
Message-ID: <CAL_Jsq+XWt7jQpkNY3Dqn8zK+Z3xwqgZXoKR4s2XOU04Hz+fXw@mail.gmail.com>
References: <20210825121350.213551-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629904463;
        bh=VE19BdY32wj74LL3xznvcWOjeiw5Fopzs+UmrVtpGd0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Zmbwpa65DDPbRyfbpjblT0S8N7RC174uoOrXIHWSiz+ilrniDF/IHES4rFWNZ9tZk
         keuLl1cksyroLLfvOfyhfS97FCmS2wtRHL6uFPbdqxZdQ/ibTX80iE/ERsp+SJrBvI
         Qo7715lS3c4LYeeDgDjOb0f+kzVLviyBHWR9jj+fa9/zLYzaO1OJTITPtDHGbSHkU6
         tYm3SPP4rp59gme8HGnycf1iaRwA0PXBMkda4M32muVMVco6ON2OO05TjLKUYyYPEe
         l21hFH/j2epWVXy989eXC0eJw0EuCZIGNCp4ane4ZXQZY252eXu+jlQ342VoA8Gd7o
         dZ7j6Nq24AxnA==
In-Reply-To: <20210825121350.213551-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Wed, Aug 25, 2021 at 7:14 AM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> With mingw64-gcc, the compiler complains with various warnings:
> error: cast from pointer to integer of different size [-Werror=3Dpointer-=
to-int-cast]

Perhaps also turn the warning on for all builds so we don't need
specific compilers to find warnings. Though maybe some compiler
versions don't support it?

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  fdtdump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
