From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: add size_hint parameter for get_path
Date: Wed, 1 Feb 2023 13:20:51 -0700
Message-ID: <CAPnjgZ1hHkTuAiUwxPuTeWTeJX1Sju2tnZz-pCyBY0BeW6cYhg@mail.gmail.com>
References: <20230201181112.1644842-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+hRVWiRoGBOmhHzcQ1acEsQUicYikeXi6qDoqxVos=;
        b=hvqEowXVF9lIXK+TO7aWkuORTI1ptUttpq5oqWFLusha02+ntWUmx52dK+54NrRQvq
         YSAJ0TSH2wmJvwAtMZngmwcBsEI/+7A4y3dBnmHhQpiOssKFsQuhM1B7ZHXDvzxeipVT
         lGo1EAzsxJvvgWMBXhVUEcGGXiSbng6w3GxZ0=
In-Reply-To: <20230201181112.1644842-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Luca,

On Wed, 1 Feb 2023 at 11:16, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> This also enables us to test the -NOSPACE condition by adding a test
> setting size_hint=1 so this path is taken.
> ---
> Follow-up from "pylibfdt: add FdtRo.get_path()" from April 2022
>
>  pylibfdt/libfdt.i       | 8 ++++----
>  tests/pylibfdt_tests.py | 1 +
>  2 files changed, 5 insertions(+), 4 deletions(-)
>

Can you add a motivation for this? Why are the paths so long?

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index f9f7e7e..0c80c54 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -443,11 +443,12 @@ class FdtRo(object):
>          """
>          return fdt_get_alias(self._fdt, name)
>
> -    def get_path(self, nodeoffset, quiet=()):
> +    def get_path(self, nodeoffset, size_hint=1024, quiet=()):
>          """Get the full path of a node
>
>          Args:
>              nodeoffset: Node offset to check
> +            size_hint: Hint for size of returned string
>
>          Returns:
>              Full path to the node
> @@ -455,11 +456,10 @@ class FdtRo(object):
>          Raises:
>              FdtException if an error occurs
>          """
> -        size = 1024
>          while True:
> -            ret, path = fdt_get_path(self._fdt, nodeoffset, size)
> +            ret, path = fdt_get_path(self._fdt, nodeoffset, size_hint)
>              if ret == -NOSPACE:
> -                size = size * 2
> +                size_hint *= 2
>                  continue
>              err = check_err(ret, quiet)
>              if err:
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 68d6aaa..34c2764 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -354,6 +354,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          node2 = self.fdt.path_offset('/subnode@1/subsubnode')
>          self.assertEqual("/subnode@1", self.fdt.get_path(node))
>          self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(node2))
> +        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(node2, size_hint=1))
>
>          with self.assertRaises(FdtException) as e:
>              self.fdt.get_path(-1)
> --
> 2.39.1
>
