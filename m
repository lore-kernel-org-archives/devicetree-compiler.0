From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4] pylibfdt: add FdtRo.get_path()
Date: Tue, 19 Apr 2022 15:54:07 -0600
Message-ID: <CAPnjgZ2izMUDXJ43jSOzXW7DKbuoN5j26MyKZaLn5Wt2gd28wQ@mail.gmail.com>
References: <20220419194537.63170-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+BEYQcujnveaJ/YUvswM+mQMZw+CggKfswDdul6aPTA=;
        b=h0McUyEFAUHHYPFAi3bqKcdVq0b8wm+Or0EC4OuC7z2Ze637Fb7PVO+E+2woav8C9W
         P4APg4F+SpsZUPZgbJ2ZKqXh9tGwD8RniyqEwKJCoje3H2ZuhuhcZOQw+F+wJBmIRjhD
         cCz8+SROUZwWyxH1NnzImzb88fKw+ODQQqkU8=
In-Reply-To: <20220419194537.63170-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Tue, 19 Apr 2022 at 13:49, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Add a new Python method wrapping fdt_get_path() from the C API.
>
> Also add a test for the new method.
>
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
> Changes since v3:
> * add quiet parameter
> * return integer error when error is quieted
>
> Changes since v2:
> * Remove arbitrary size limit
> * Change size calculation to increase exponentially
> * Add test to verify we still get exceptions with bad parameters
>
>  pylibfdt/libfdt.i       | 28 ++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 13 +++++++++++++
>  2 files changed, 41 insertions(+)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

You don't check for when it is output of space, but I think that is OK.

>
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index ac70762..f9f7e7e 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -443,6 +443,29 @@ class FdtRo(object):
>          """
>          return fdt_get_alias(self._fdt, name)
>
> +    def get_path(self, nodeoffset, quiet=()):
> +        """Get the full path of a node
> +
> +        Args:
> +            nodeoffset: Node offset to check
> +
> +        Returns:
> +            Full path to the node
> +
> +        Raises:
> +            FdtException if an error occurs
> +        """
> +        size = 1024
> +        while True:
> +            ret, path = fdt_get_path(self._fdt, nodeoffset, size)
> +            if ret == -NOSPACE:
> +                size = size * 2
> +                continue
> +            err = check_err(ret, quiet)
> +            if err:
> +                return err
> +            return path
> +
>      def parent_offset(self, nodeoffset, quiet=()):
>          """Get the offset of a node's parent
>
> @@ -1115,6 +1138,11 @@ typedef uint32_t fdt32_t;
>          }
>  }
>
> +%include "cstring.i"
> +
> +%cstring_output_maxsize(char *buf, int buflen);
> +int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
> +
>  /* We have both struct fdt_property and a function fdt_property() */
>  %warnfilter(302) fdt_property;
>
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 5479363..68d6aaa 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -348,6 +348,19 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual("/subnode@1/subsubnode", self.fdt3.get_alias('ss1'))
>          self.assertEqual("/subnode@1/subsubnode/subsubsubnode", self.fdt3.get_alias('sss1'))
>
> +    def testGetPath(self):
> +        """Test for the get_path() method"""
> +        node = self.fdt.path_offset('/subnode@1')
> +        node2 = self.fdt.path_offset('/subnode@1/subsubnode')
> +        self.assertEqual("/subnode@1", self.fdt.get_path(node))
> +        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(node2))
> +
> +        with self.assertRaises(FdtException) as e:
> +            self.fdt.get_path(-1)
> +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
> +
> +        self.assertEqual(-libfdt.BADOFFSET, self.fdt.get_path(-1, quiet=(libfdt.BADOFFSET,)))
> +
>      def testParentOffset(self):
>          """Test for the parent_offset() method"""
>          self.assertEqual(-libfdt.NOTFOUND,
> --
> 2.35.3
>

Regards,
Simon
