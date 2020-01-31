From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 1/6] libfdt: De-inline fdt_header_size()
Date: Fri, 31 Jan 2020 11:14:25 -0700
Message-ID: <CAPnjgZ2MUorvc1+MY2mBozQn+kYA1Q=SLFhPPGXixoSZshUGsg@mail.gmail.com>
References: <20191113015422.67210-1-sjg@chromium.org> <20191113015422.67210-2-sjg@chromium.org>
 <20191120035121.GD5582@umbus.fritz.box> <CAPnjgZ0bP3Hmk7daknD275J0SxJR6XoxNXPustqKJ4k3POPqiw@mail.gmail.com>
 <20200128082402.GG42099@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B09eeAvsgF2fCULFq3yv9zzvF1Kis0e6n2aLk5Ig5XE=;
        b=eMOcz7UwCSW2t5Oxgl6P9Nckm/8rO1ygHjMYimJqxhTUXgPFtqltH6RrNiod/4emwT
         RQlCHC0OmIsnj0zgsHnvi19z8U55FkMEPHPDczmhDOSxDRhqTWIW0kVzLa98F0AXZetI
         J6Zv46K1jTGppt1i5fJjHw+Xk/qdTXY21H8E8=
In-Reply-To: <20200128082402.GG42099-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Dec 02, 2019 at 06:07:16PM -0700, Simon Glass wrote:
> > Hi David,
> >
> > On Tue, 19 Nov 2019 at 21:01, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Tue, Nov 12, 2019 at 06:54:17PM -0700, Simon Glass wrote:
> > > > There does not seem to be a strong reason to inline this function.
> > >
> > > Well.. I think my rationale was just that this function should be a
> > > single load, followed by the call to fdt_header_size_().  I suspect
> > > it's not called enough for removing that to balance out the code
> > > overhead of an extra function.  Or have you made measurements which
> > > show I'm wrong about that?
> >
> > Well it isn't called in U-Boot at all, other than via
> > fdt_check_header(). The inlined version saves 16 bytes of code space
> > on Thumb2.
> >
> > But even better would be to drop fdt_check_header_(). something like:
> >
> > size_t fdt_header_size(uint32_t version)
> >    {
> >    if (fdt_chk_version()) {
> >       if (version <= 1)
> >          return FDT_V1_SIZE;
> >       else if (version <= 2)
> >          return FDT_V2_SIZE;
> >       else if (version <= 3)
> >          return FDT_V3_SIZE;
> >       else if (version <= 16)
> >          return FDT_V16_SIZE;
> >       }
> >
> > return FDT_V17_SIZE;
> > }
> >
> > That saves an additional 8 bytes.
>
> Uh.. I'm a little lost here.  Is what you're suggesting moving all of
> fdt_check_header_() to the .h file, so it can be inlined (and
> therefore constant folded)?
>
> That could be a reasonable plan, though we'll need to make sure to
> include an out-of-line version as well, for ABI compatibility.

OK that sounds like a pain with little gain. Let's leave it as it is then.

Regards,
Simon

[..]
