From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 29 Oct 2020 10:48:28 -0500
Message-ID: <CAL_JsqJUixnyZx-tu9EV8YZ-gSDE7i1jvMddnNZZWFzezaHftw@mail.gmail.com>
References: <20201022040013.GB1821515@yekko.fritz.box> <20201022123254.GH14816@bill-the-cat>
 <20201022145804.GI1821515@yekko.fritz.box> <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com> <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
 <20201028042601.GA5604@yekko.fritz.box> <20201028120554.GF5340@bill-the-cat>
 <20201029025503.GI5604@yekko.fritz.box> <20201029150603.GH5340@bill-the-cat>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603986521;
        bh=qNlZ0Q3voFds8VkquvkHxgKOVpV1oWhjBQlYogJ7rsA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QEhPf3c87Vehauh+OaMidDHbXbxMlB5hXvJ6FDKU+EhIqYqpghHSdgq1Em+gA7aMJ
         iF0DgjfCjPVrcE5Mc9dUIJXa/lUejTSCWY8N3a6vc8X6d14woACqEPA+NlSCJLgUi+
         vbml0hT+qmcHVEpZpl7ltx3o/tGwzeCxUVuIwXuU=
In-Reply-To: <20201029150603.GH5340@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Oct 29, 2020 at 10:06 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>
> On Thu, Oct 29, 2020 at 01:55:03PM +1100, David Gibson wrote:
> > On Wed, Oct 28, 2020 at 08:05:54AM -0400, Tom Rini wrote:
> > > On Wed, Oct 28, 2020 at 03:26:01PM +1100, David Gibson wrote:
> > > > On Tue, Oct 27, 2020 at 02:55:17PM -0500, Rob Herring wrote:
> > > > > On Tue, Oct 27, 2020 at 10:58 AM Andr=C3=A9 Przywara <andre.przyw=
ara-5wv7dgnIgG8@public.gmane.org> wrote:
> > > > > >
> > > > > > On 26/10/2020 21:51, Rob Herring wrote:
> > > > > > > On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org=
> wrote:
> > > > > > >> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wrote=
:
> > > > > > >>> On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wrote:
> > > > > > >>>> On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson wro=
te:
> > > > > > >>>>> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
> > > > > > >
> > > > > > > [...]
> > > > > > >
> > > > > > >>>>>> But what does all of this _mean_ ?  I kinda think I have=
 an answer now.
> > > > > > >>>>>> One of the things that sticks out is 6dcb8ba408ec adds a=
 lot and
> > > > > > >>>>>> 11738cf01f15 reduces it just a little.
> > > > > > >>>>>
> > > > > > >>>>> Ah, that's a tricky one.  If we don't handle unaligned ac=
cesses we
> > > > > > >>>>> instead get intermittent bug reports where it just crashe=
s.
> > > > > > >>>>
> > > > > > >>>> We really need to talk about that then.  There was a probl=
em of people
> > > > > > >>>> turning off the sanity check for making sure the entire de=
vice tree was
> > > > > > >>>> aligned and then having everything crash.
> > > > > > >>>
> > > > > > >>> Ok... I'm not really sure where you're going with that thou=
ght.
> > > > > > >>
> > > > > > >> In my reading of the mailing list history of how this issue =
came up,
> > > > > > >> it was someone was booting a dragonboard or something, and t=
hey (or
> > > > > > >> rather, the board maintainer set by default) the flag to use=
 the device
> > > > > > >> tree wherever it is in memory and NOT to relocate it to a pr=
operly
> > > > > > >> aligned address.  This in turn lead to the kernel getting an=
 unaligned
> > > > > > >> device tree and everything crashing.  The "I know what I'm d=
oing" flag
> > > > > > >> was set, violated the documented requirements for device tre=
es need to
> > > > > > >> reside in memory and everything blew up.
> > > > > > >>
> > > > > > >> After that it was noticed that there could be some internal
> > > > > > >> mis-alignment and if you tried those accesses on a CPU that =
doesn't
> > > > > > >> support doing those reads easily there could be problems, bu=
t that's not
> > > > > > >> a common at all case (as noted by it not having been seen in=
 practice).
> > > > > > >
> > > > > > > Nor a problem on many environments to begin with. More below.=
..
> > > > > > >
> > > > > > >>>>> I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and=
 it will just
> > > > > > >>>>> break for either an unaligned dtb (unlikely) or if you at=
tempt to load
> > > > > > >>>>> an unaligned value from a property (more likely, but don'=
t add the
> > > > > > >>>>> flag if you're not sure you don't need it).
> > > > > > >>>>
> > > > > > >>>> So long as it's abstracted in such a way that we don't gro=
w the size of
> > > > > > >>>> everything again, yes, that is the right way forward I thi=
nk.
> > > > > > >>>
> > > > > > >>> All the ASSUME flags should be resolved at compile time (at=
 least with
> > > > > > >>> normal optimization levels enabled in the compiler), so tes=
ting for
> > > > > > >>> those shouldn't increase size at all.  If they do, somethin=
g is wrong.
> > > > > > >>
> > > > > > >> I'm saying that how ever this new ASSUME flag is done, it ne=
eds to be
> > > > > > >> done in such a way the compiler really will be smart about i=
t.  So
> > > > > > >> something like making a new function that does fdt64_ld() if=
 we aren't
> > > > > > >> ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
> > > > > > >> ASSUME_ALIGNED_ACCESS.
> > > > > > >
> > > > > > > Ah, unaligned accesses again... To summarize, both performanc=
e and
> > > > > > > size suffer with not doing unaligned accesses.
> > > > > > >
> > > > > > > Why not a HAS_UNALIGNED_ACCESS flag instead (or the inverse) =
that will
> > > > > > > do unaligned accesses? That would be more aligned with what t=
he system
> > > > > > > can support rather than sanity checking associated with ASSUM=
E_*.
> > > >
> > > > So, there are kind of two things here, (1) is "my platform can hand=
le
> > > > unaligned accesses" and (2) is "assume I don't need unaligned
> > > > accesses".  We can use the fast & small versions of fdt32_ld() etc.=
 if
> > > > either is true.  However we need to consider those separately, beca=
use
> > > > they can be independently true (or not) for different reasons.  (1)
> > > > depends on the hardware, whereas (2) depends on how you're using dt=
c,
> > > > and, see below, you may need at least unaligned-handling fdt64_ld()=
 in
> > > > more cases than you think.
> > > >
> > > > > > > To repeat from last time, everything ARMv6 and up can do unal=
igned
> > > > > > > accesses if enabled.
> > > > > >
> > > > > > But that requires the MMU to be enabled, doesn't it? If I read =
the ARM
> > > > > > ARM correctly, unaligned accesses always trap on device memory,
> > > > > > regardless of SCTLR.A. And without the MMU enabled everything i=
s device
> > > > > > memory. We compile U-Boot with -mno-unaligned-access/-mstrict-a=
lign to
> > > > > > cope with that, and that most likely affects libfdt as well?
> > > > >
> > > > > Ah yes, I think you are right.
> > > > >
> > > > > In that case, seems like we should figure out whether (internal)
> > > > > unaligned accesses are possible with dtc generated dtbs at least
> > > > > rather than just "not a common at all case (as noted by it not ha=
ving
> > > > > been seen in practice)." I'm sure David will point out that not a=
ll
> > > > > dtbs come from dtc, but all the ones u-boot deals with do in
> > > > > reality.
> > > >
> > > > Assuming the blob itself is 8-byte aligned in memory, then all
> > > > structural elements (i.e. the tree metadata) of a compliant dtb wil=
l
> > > > be naturally aligned.  The spec requires 8-byte alignment of the me=
m
> > > > reserve block w.r.t. the base of the blob and 4 byte aligned struct=
ure
> > > > block w.r.t. the base of the blob.  Likewise the layout of the mem
> > > > reserve block will preserve 8-byte alignment of all the 64-bit valu=
es
> > > > it contains, assuming the block itself starts 8-byte aligned.
> > > > Similarly the structure blob will preserve 4-byte alignment of all =
its
> > > > tags and other structural data (this amounts to requiring an alignm=
ent
> > > > gap after node names and property values).
> > > >
> > > > However, "all structural elements" does not include values within
> > > > property values themselves.  Assuming propery alignment of the bloc=
ks
> > > > and the blob itself, then all property values will *begin* 4 byte
> > > > aligned.  However that leaves two relevant cases:
> > > >
> > > >  a) 64-bit property values may be 4-byte aligned but not 8-byte
> > > >     aligned
> > > >  b) complex property values including both strings and integers
> > > >     typically use a packed representation with no alignment gaps.
> > > >     Such property structures are usually avoided in modern bindings=
,
> > > >     but they definitely exist in a bunch of older bindings.  Obviou=
sly
> > > >     that means that integer values sitting after arbitrary length
> > > >     strings may not have any natural alignment
> > > >
> > > > So acccesses made by libfdt internally should be safe(*) assuming t=
he
> > > > blob itself is loaded 8-byte aligned, and the dtb is compliant.
> > > > However the libfdt user may hit both problems (a) and (b) getting
> > > > things they actually want from the tree.  fdt{32,64}_{ld,st}() are
> > > > intended to handle those cases, so that they're useful for the call=
er
> > > > to pull things from properties as well as for libfdt internal
> > > > accesses.
> > > >
> > > > (*) There are a number of other functions that looked like they mig=
ht
> > > >     be dangerous for case (a) because they are based on 64-bit
> > > >     property values: fdt_setprop_inplace_u64(), fdt_property_u64(),
> > > >     fdt_setprop_u64(), fdt_appendprop_u64() and
> > > >     fdt_appendprop_addrrange().  However I think they're actually
> > > >     ok, because the way they're built in terms of other functions
> > > >     means there's implicitly a memcpy() from a byte buffer.
> > > >
> > > > > > Also some 32-bit ARM platforms run U-Boot proper with the MMU d=
isabled
> > > > > > all the time, and I know of at least the sunxi-aarch64 SPL runn=
ing with
> > > > > > the MMU off as well.
> > > > >
> > > > > I'm making a mental note of this for the next time performance is=
sues come up.
> > > >
> > > > Right, running early with MMU off is definitely a real use case for
> > > > libfdt.  For similar reasons we can't assume we have an OS which wi=
ll
> > > > trap and handle unaligned accesses, which we might for a more
> > > > conventional userspace library.
> > > >
> > > > This kind of underscores why I'm a bit hesitant to introduce "my
> > > > platform handles unaligned acccesses" flag.  Not only does it requi=
re
> > > > detailed knowledge of the target CPU, but it can also depend on
> > > > exactly what mode that hardware is in.
> > >
> > > Can you please note the existing user(s) where we have just the right
> > > combination of factors and so everything fails?
> >
> > Sorry, I don't understand the question.
>
> I'm asking what the platform(s) are that have the very specific "and
> here be failure" problem you're concerned with.

I'm also and still confused with your question.

>  I'm concerned that
> right now we're going to end up with larger pile of reverts to dtc in
> U-Boot rather than being able to just sync with the project properly
> again.

I think we have some agreement which I believe would end being the
revert you originally submitted, but just keep the fdt*_ld() accessors
which always do safe accesses.

Rob
