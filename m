From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 1/6] libfdt: De-inline fdt_header_size()
Date: Wed, 5 Feb 2020 22:03:37 -0700
Message-ID: <CAPnjgZ1_UwW_5OYY-r-2OCoYKXpMHn0QuvVEwVNECqcYvc3CBg@mail.gmail.com>
References: <20191113015422.67210-1-sjg@chromium.org> <20191113015422.67210-2-sjg@chromium.org>
 <20191120035121.GD5582@umbus.fritz.box> <CAPnjgZ0bP3Hmk7daknD275J0SxJR6XoxNXPustqKJ4k3POPqiw@mail.gmail.com>
 <20200128082402.GG42099@umbus.fritz.box> <CAPnjgZ2MUorvc1+MY2mBozQn+kYA1Q=SLFhPPGXixoSZshUGsg@mail.gmail.com>
 <20200202031201.GB20412@umbus.fritz.box> <CAPnjgZ2r9wNFpcGJ47pk4mj4sGP_t+eDki7_stqwn0-tE1dATQ@mail.gmail.com>
 <20200206044424.GL60221@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8+NJg1NXUuO/RcUfFNkE28v4oOo0DPDWCkMfLkGkel4=;
        b=jbBHKWcpc4HJNIXgiV3spiZqX7XuHmY6cYxv1Kt3/TJkHAwR7Xye3I3mMI0rEEyGnA
         d6LV0v4nrTkFaSFSHbw6UC4dBqvLm/C1mGVrJiOmusdWFT3f+K4C2i69/gSaj1yzu7Zx
         MxIO46ddswH8zmoh4/R4dNjfE7j5fijnTidKo=
In-Reply-To: <20200206044424.GL60221-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On Wed, 5 Feb 2020 at 21:53, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Wed, Feb 05, 2020 at 01:57:01PM -0700, Simon Glass wrote:
> > Hi David,
> >
> > On Sat, 1 Feb 2020 at 21:38, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Fri, Jan 31, 2020 at 11:14:25AM -0700, Simon Glass wrote:
> > > > Hi David,
> > > >
> > > > On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Mon, Dec 02, 2019 at 06:07:16PM -0700, Simon Glass wrote:
> > > > > > Hi David,
> > > > > >
> > > > > > On Tue, 19 Nov 2019 at 21:01, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > > > >
> > > > > > > On Tue, Nov 12, 2019 at 06:54:17PM -0700, Simon Glass wrote:
> > > > > > > > There does not seem to be a strong reason to inline this function.
> > > > > > >
> > > > > > > Well.. I think my rationale was just that this function should be a
> > > > > > > single load, followed by the call to fdt_header_size_().  I suspect
> > > > > > > it's not called enough for removing that to balance out the code
> > > > > > > overhead of an extra function.  Or have you made measurements which
> > > > > > > show I'm wrong about that?
> > > > > >
> > > > > > Well it isn't called in U-Boot at all, other than via
> > > > > > fdt_check_header(). The inlined version saves 16 bytes of code space
> > > > > > on Thumb2.
> > > > > >
> > > > > > But even better would be to drop fdt_check_header_(). something like:
> > > > > >
> > > > > > size_t fdt_header_size(uint32_t version)
> > > > > >    {
> > > > > >    if (fdt_chk_version()) {
> > > > > >       if (version <= 1)
> > > > > >          return FDT_V1_SIZE;
> > > > > >       else if (version <= 2)
> > > > > >          return FDT_V2_SIZE;
> > > > > >       else if (version <= 3)
> > > > > >          return FDT_V3_SIZE;
> > > > > >       else if (version <= 16)
> > > > > >          return FDT_V16_SIZE;
> > > > > >       }
> > > > > >
> > > > > > return FDT_V17_SIZE;
> > > > > > }
> > > > > >
> > > > > > That saves an additional 8 bytes.
> > > > >
> > > > > Uh.. I'm a little lost here.  Is what you're suggesting moving all of
> > > > > fdt_check_header_() to the .h file, so it can be inlined (and
> > > > > therefore constant folded)?
> > > > >
> > > > > That could be a reasonable plan, though we'll need to make sure to
> > > > > include an out-of-line version as well, for ABI compatibility.
> > > >
> > > > OK that sounds like a pain with little gain. Let's leave it as it is
> > > > then.
> > >
> > > Actually, I suspect it's not that bad, I think "extern inline" does
> > > what we'd need.
> >
> > I get lots of 'multiple definition' errors when I add 'extern inline'
> > to the header file for fdt_header_size().
> >
> > >From here:
> >
> > https://stackoverflow.com/questions/216510/what-does-extern-inline-do
> >
> >    extern inline: like GNU89 "inline": externally visible code is
> > emitted, so at most one translation unit can use this.
> >
> > Can you explain a bit more about what you are thinking here? I am a
> > bit lost. Remember that in my next patch I have to check the
> > assumptions in libfdt_internl.h
>
> Ah, I guess I was wrong.  Ok this will need a closer look.

So how about we go with this patch as it?

Regards,
Simon
