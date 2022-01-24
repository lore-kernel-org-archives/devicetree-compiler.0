From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] pylibfdt: add FdtRo.get_path()
Date: Mon, 24 Jan 2022 10:57:47 -0700
Message-ID: <CAPnjgZ2Zj7gaT8G6WrVCKunVZgRMgef-rQLRhSRk9siR-f69DQ@mail.gmail.com>
References: <20220122105653.31219-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P81KlUiBlY76re+5uSAdnVTIp50gRxyWrvU5OGTGsPU=;
        b=CwARQUg/j8gtaoWeYD5XJHWubl2WnSj4/OSpcL6B4JXx1wgI/pCFGnZ9Mdx9meEjUl
         6FsZMb8VU1lMxKJ5JoBax5lcBcFHpqfyRJORUW8/EWd1ubMzgrktKqppdWRquloQlVNl
         u4SbHObsLCL4pwjcUmm6PhODLmHnK3bDzGPcs=
In-Reply-To: <20220122105653.31219-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Sat, 22 Jan 2022 at 03:59, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Add a new Python method wrapping fdt_get_path() from the C API.
>
> Also add a test for the new method.
>
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
> Changes in v2:
> - dynamically increase size of string buffer until it fits.
>   The values are chosen relatively arbitrary, and terminates at lengths
>   over than 4096 as I don't expect paths to be longer and there should
>   be an exit condition to not eat up RAM in case of some bug.
>
>  pylibfdt/libfdt.i       | 27 +++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py |  7 +++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index ac70762..d103bb6 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -443,6 +443,28 @@ class FdtRo(object):
>          """
>          return fdt_get_alias(self._fdt, name)
>
> +    def get_path(self, nodeoffset):
> +        """Get the full path of a node
> +
> +        Args:
> +            nodeoffset: Node offset to check
> +
> +        Returns:
> +            Full path to the node
> +
> +        Raises:
> +            FdtException if the path is longer than 'size' or other error occurs
> +        """
> +        size = 64
> +        while size < 4096:
> +            ret, path = fdt_get_path(self._fdt, nodeoffset, size)
> +            if ret == -NOSPACE:
> +                size += 64
> +                continue
> +            check_err(ret)
> +            return path
> +        raise ValueError('Node path is unexpectedly long')

Do you think it would hurt to go with 4096 immediately? Python is not
the most efficient language so it should not matter. You can also copy
it to another object of the correct size, perhaps, to avoid memory
wastage.

Also can you please explain how swig works here? I'm a bit lost as to
the magic for calling fdt_get_path().

> +
>      def parent_offset(self, nodeoffset, quiet=()):
>          """Get the offset of a node's parent
>
> @@ -1115,6 +1137,11 @@ typedef uint32_t fdt32_t;
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
> index 5479363..2335a73 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -348,6 +348,13 @@ class PyLibfdtBasicTests(unittest.TestCase):
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
>      def testParentOffset(self):
>          """Test for the parent_offset() method"""
>          self.assertEqual(-libfdt.NOTFOUND,
> --
> 2.34.1
>

Regards,
Simon
