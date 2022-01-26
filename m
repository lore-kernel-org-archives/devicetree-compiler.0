From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] pylibfdt: add FdtRo.get_path()
Date: Wed, 26 Jan 2022 12:29:10 -0700
Message-ID: <CAPnjgZ2joJOwVN8D46ehZAmO0EH26fiYgz2zPdq19nW4iFzgow@mail.gmail.com>
References: <20220126155933.865297-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zaGOurRxiOVdVe6b5pUOx2A8hTYFxmO+HXlVDW/jicc=;
        b=mi/Cwzlt90JlFuskTKzrZwtP+nVZOkbsktfZWPB0Ab8U9reLWnbI2l3Hfy6fzY7fjE
         ilyQf7CREQefuUZn+cASfAUu3wvHQW+AacMVY1NqDR/lIEQOTTQK4LfhiJ6JjitPv7YO
         FkVbogo7kAVPUYb5EoXdU6aHjy/T8K/aY7zt8=
In-Reply-To: <20220126155933.865297-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Wed, 26 Jan 2022 at 09:01, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Add a new Python method wrapping fdt_get_path() from the C API.
>
> Also add a test for the new method.
>
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
> Changes since v2:
> * Remove arbitrary size limit
> * Change size calculation to increase exponentially
> * Add test to verify we still get exceptions with bad parameters
>
>  pylibfdt/libfdt.i       | 26 ++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 11 +++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index ac70762..2f085c8 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -443,6 +443,27 @@ class FdtRo(object):
>          """
>          return fdt_get_alias(self._fdt, name)
>
> +    def get_path(self, nodeoffset):

I think this should have:

quiet=()

as another parameter, to pass to check_err() below. See other examples.

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

nit:

size *= 2

> +                continue
> +            check_err(ret)

Should pass 'quiet' return the error here (see other examples)

> +            return path
> +
>      def parent_offset(self, nodeoffset, quiet=()):
>          """Get the offset of a node's parent
>
> @@ -1115,6 +1136,11 @@ typedef uint32_t fdt32_t;
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
> index 5479363..5435881 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -348,6 +348,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
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

Perhaps add a test for non-exception case too

> +
>      def testParentOffset(self):
>          """Test for the parent_offset() method"""
>          self.assertEqual(-libfdt.NOTFOUND,
> --
> 2.34.1
>

REgards,
Simon
