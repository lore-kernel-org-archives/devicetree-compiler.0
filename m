From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH] Fix Python crash on getprop deallocation
Date: Sat, 25 Dec 2021 11:25:51 +0100
Message-ID: <5777466.lOV4Wx5bFT@g550jk>
References: <20211224102811.70695-1-luca@z3ntu.xyz> <Yca6ZoKpCjLsFFfo@yekko>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1640427951; bh=YFGIoQ1GuP7SgG+77mYY55AHIJTjO8qvZpMwZ+1xNmY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ml9Aq4LBtnNdqlje8LsFeho+vWsSg3P88lOFDYQA1W0gVnISRzOnRpdRdzmgjnTGV
         0mqPbARhitYtaWGcf3wVK8BmTpofuh2Tju99C2p3VHUAKHEQQnRTMitapPlYTY6ox3
         aD9xm6rrRBie/bDv2eg0kluDSG+Q3cCWxdS6l8Ro=
In-Reply-To: <Yca6ZoKpCjLsFFfo@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

On Samstag, 25. Dezember 2021 07:29:58 CET David Gibson wrote:
> On Fri, Dec 24, 2021 at 11:28:12AM +0100, Luca Weiss wrote:
> > Fatal Python error: none_dealloc: deallocating None
> > Python runtime state: finalizing (tstate=0x000055c9bac70920)
> > 
> > Current thread 0x00007fbe34e47740 (most recent call first):
> >   <no Python frame>
> > 
> > Aborted (core dumped)
> > 
> > This is caused by a missing Py_INCREF on the returned Py_None, as
> > demonstrated e.g. in https://github.com/mythosil/swig-python-incref or
> > described at https://edcjones.tripod.com/refcount.html ("Remember to
> > INCREF Py_None!")
> > 
> > A PoC for triggering this crash is uploaded to
> > https://github.com/z3ntu/pylibfdt-crash .
> > With this patch applied to pylibfdt the crash does not happen.
> 
> Any chance you could rework your testcase into the libfdt testsuite
> (make check)?
> 

To be completely honest I don't exactly understand why this crash is 
happening. If you reduce the iteration count in my PoC from the "10" I used to 
just 1 or 2, then the crash doesn't happen. But I don't have any insights into 
how Python actually allocates and deallocates things internally, as this crash 
happens during dellocation when Python exits and after the supplied code is 
already run.

Regards
Luca

> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> > Unrelated but I've noticed that in this file the indentation is quite
> > mixed between spaces and tabs. This patch tries to keep to the style in
> > the lines around.
> > 
> >  pylibfdt/libfdt.i | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index 075ef70..9ccc57b 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> > @@ -1040,14 +1040,16 @@ typedef uint32_t fdt32_t;
> > 
> >  /* typemap used for fdt_getprop() */
> >  %typemap(out) (const void *) {
> > 
> > -	if (!$1)
> > +	if (!$1) {
> > 
> >  		$result = Py_None;
> > 
> > -	else
> > +		Py_INCREF($result);
> > +	} else {
> > 
> >          %#if PY_VERSION_HEX >= 0x03000000
> >          
> >              $result = Py_BuildValue("y#", $1, (Py_ssize_t)*arg4);
> >          
> >          %#else
> >          
> >              $result = Py_BuildValue("s#", $1, (Py_ssize_t)*arg4);
> >          
> >          %#endif
> > 
> > +    }
> > 
> >  }
> >  
> >  /* typemap used for fdt_setprop() */




