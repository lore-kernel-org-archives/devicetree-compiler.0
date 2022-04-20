From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4] pylibfdt: add FdtRo.get_path()
Date: Wed, 20 Apr 2022 15:29:49 -0600
Message-ID: <CAPnjgZ2CjKLrCXEcBH0vTN77d7zk29dxnmRta4tTR_Th2arBzQ@mail.gmail.com>
References: <20220419194537.63170-1-luca@z3ntu.xyz> <CAPnjgZ2izMUDXJ43jSOzXW7DKbuoN5j26MyKZaLn5Wt2gd28wQ@mail.gmail.com>
 <Yl92T9KL/dlQntRi@yekko> <11961807.O9o76ZdvQC@g550jk>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oy5H7L6fFCl5KQsLUifniFqQx3++Me8L23hwadhK0hs=;
        b=mMO+NqYz3IXwUfjNHBZWNiA5CVYsDOump3RE8xZ788gjaqxCmZYyjvHAVK5/ByknKu
         SE6Py7ozag+BNj+ADNTfeYTDDMZqHrcHi3OmA4/K3xBMxCPdqvsab8xBhgf0m7tRHgcH
         F4TkN9ow4Ke0tmPI3FpD/xgrsgCCkdQVePoOk=
In-Reply-To: <11961807.O9o76ZdvQC@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Wed, 20 Apr 2022 at 12:20, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Hi Simon and David,
>
> On Mittwoch, 20. April 2022 04:56:15 CEST David Gibson wrote:
> > On Tue, Apr 19, 2022 at 03:54:07PM -0600, Simon Glass wrote:
> > > Hi Luca,
> > >
> > > On Tue, 19 Apr 2022 at 13:49, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > Add a new Python method wrapping fdt_get_path() from the C API.
> > > >
> > > > Also add a test for the new method.
> > > >
> > > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > > ---
> > > > Changes since v3:
> > > > * add quiet parameter
> > > > * return integer error when error is quieted
> > > >
> > > > Changes since v2:
> > > > * Remove arbitrary size limit
> > > > * Change size calculation to increase exponentially
> > > > * Add test to verify we still get exceptions with bad parameters
> > > >
> > > >  pylibfdt/libfdt.i       | 28 ++++++++++++++++++++++++++++
> > > >  tests/pylibfdt_tests.py | 13 +++++++++++++
> > > >  2 files changed, 41 insertions(+)
> > >
> > > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >
> > > You don't check for when it is output of space, but I think that is
> > > OK.
> >
> > Right, a testcase for that would be good, but it can be a follow up.
>
> I don't quite understand what you mean "is output of space".

is out of space (sorry)

>
> Maybe you mean a test for when the string is longer than 1024 characters
> ("size = 1024") so the size increase gets triggered?
>
> If yes, then I did test that manually before by setting the value absurdly
> low. Not sure how to properly check that in the tests though. Add a node with
> a super long name into the test dtb?

Another option is to add a parameter for the max size, just for
testing, but I doubt David would like that!

You could have a SIZE_INCREMENT = 1024 at the top of the file, then
change it in a try/finally clause in your test.

>
> >
> > Applied.
>
> Thanks!
>
> Regards
> Luca

Regards,
Simon
