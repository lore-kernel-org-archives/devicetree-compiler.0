From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: add size_hint parameter for get_path
Date: Thu, 2 Feb 2023 10:13:28 -0700
Message-ID: <CAPnjgZ0A-hAyW2WWZYZmedbn3RcbS3hH978m1+HeJwA4T5CjtA@mail.gmail.com>
References: <20230201181112.1644842-1-luca@z3ntu.xyz> <CAPnjgZ1hHkTuAiUwxPuTeWTeJX1Sju2tnZz-pCyBY0BeW6cYhg@mail.gmail.com>
 <Y9taTeDc9Nro2F43@yekko> <2060136.KlZ2vcFHjT@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GCpGQGSisqBjGLPJQEWl8k+RunhIDQ5rSPWfrEEH5+A=;
        b=cXqXn92fy0c8sLurAcKEL3OM/ql5phwUDA9M3OlTv67PMznXl6vEecueuaJajuxdso
         zTZm5MaOcaB8d8s1nCUF63wpaiGOGX0DhOoNz9WBM5hAOoNGvg6L5/FjMOu3s52Dk4mu
         qzW0SPffoO8d5Opi+XiZ45ZIXTuNyQOLp4FKs=
In-Reply-To: <2060136.KlZ2vcFHjT-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Luca,

On Thu, 2 Feb 2023 at 10:08, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> On Donnerstag, 2. Februar 2023 07:38:05 CET David Gibson wrote:
> > On Wed, Feb 01, 2023 at 01:20:51PM -0700, Simon Glass wrote:
> > > Hi Luca,
> > >
> > > On Wed, 1 Feb 2023 at 11:16, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > This also enables us to test the -NOSPACE condition by adding a test
> > > > setting size_hint=1 so this path is taken.
> > > > ---
> > > > Follow-up from "pylibfdt: add FdtRo.get_path()" from April 2022
> > > >
> > > >  pylibfdt/libfdt.i       | 8 ++++----
> > > >  tests/pylibfdt_tests.py | 1 +
> > > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > >
> > > Can you add a motivation for this? Why are the paths so long?
> >
> > I'm also curious about that.
>
> Please see this for context:
> https://www.spinics.net/lists/devicetree-compiler/msg03922.html
>
> Basically just for the new test.

Got it, thanks.

>
> >
> > > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Code looks sane, so
> >
> > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> >
> > Unfortunately, I have no way to test this until
> > https://github.com/dgibson/dtc/issues/78 is fixed.
> >
> > Also, I'll need a Signed-off-by line in order to apply this change
> > (see CONTRIBUTING.md for details).
>
> Right.
>
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
>
> If I should resend with it, please let me know.
>
> Regards
> Luca
>
> >
> > > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > > index f9f7e7e..0c80c54 100644
> > > > --- a/pylibfdt/libfdt.i
> > > > +++ b/pylibfdt/libfdt.i
> > > >
> > > > @@ -443,11 +443,12 @@ class FdtRo(object):
> > > >          """
> > > >          return fdt_get_alias(self._fdt, name)
> > > >
> > > > -    def get_path(self, nodeoffset, quiet=()):
> > > >
> > > > +    def get_path(self, nodeoffset, size_hint=1024, quiet=()):
> > > >          """Get the full path of a node
> > > >
> > > >          Args:
> > > >              nodeoffset: Node offset to check
> > > >
> > > > +            size_hint: Hint for size of returned string
> > > >
> > > >          Returns:
> > > >              Full path to the node
> > > >
> > > > @@ -455,11 +456,10 @@ class FdtRo(object):
> > > >          Raises:
> > > >              FdtException if an error occurs
> > > >
> > > >          """
> > > >
> > > > -        size = 1024
> > > >
> > > >          while True:
> > > > -            ret, path = fdt_get_path(self._fdt, nodeoffset, size)
> > > > +            ret, path = fdt_get_path(self._fdt, nodeoffset, size_hint)
> > > >
> > > >              if ret == -NOSPACE:
> > > > -                size = size * 2
> > > > +                size_hint *= 2
> > > >
> > > >                  continue
> > > >
> > > >              err = check_err(ret, quiet)
> > > >
> > > >              if err:
> > > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > > index 68d6aaa..34c2764 100644
> > > > --- a/tests/pylibfdt_tests.py
> > > > +++ b/tests/pylibfdt_tests.py
> > > >
> > > > @@ -354,6 +354,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > > >          node2 = self.fdt.path_offset('/subnode@1/subsubnode')
> > > >          self.assertEqual("/subnode@1", self.fdt.get_path(node))
> > > >          self.assertEqual("/subnode@1/subsubnode",
> > > >          self.fdt.get_path(node2))
> > > >
> > > > +        self.assertEqual("/subnode@1/subsubnode",
> > > > self.fdt.get_path(node2, size_hint=1))> >
> > > >          with self.assertRaises(FdtException) as e:
> > > >              self.fdt.get_path(-1)

Regards,
Simon
