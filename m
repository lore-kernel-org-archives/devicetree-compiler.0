From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 29 Oct 2020 11:04:01 -0400
Message-ID: <20201029150401.GG5340@bill-the-cat>
References: <20201022040013.GB1821515@yekko.fritz.box>
 <20201022123254.GH14816@bill-the-cat>
 <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
 <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
 <20201028042601.GA5604@yekko.fritz.box>
 <CAL_JsqJPrnjKjdmvyY2NOay0YrYc20Tr3OSr0yjq+9HjCN+anA@mail.gmail.com>
 <20201029030247.GJ5604@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+GiWpZ/vZzfY9+ZQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LUrfWpj6C1T1AjnAuoS9xnzLXlwVX9BBukvGPkVsyVc=;
        b=Ax56AJ6YTvgvo4xLpYTTKSkcPc5udsSNYCtXpcbKcxOm5a+7XaLLGhg8GSw81D7v62
         cipmzzIFqkDyLE7+xMXfHB/mKt7ts2S2PYXxYnEZWTfJWgO5AghpO9KNKrxyu3HqC7d2
         a2PWbtHy5oxBYl6g/curKqIJ9UDXV9j0ZU52w=
Content-Disposition: inline
In-Reply-To: <20201029030247.GJ5604-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--+GiWpZ/vZzfY9+ZQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 02:02:47PM +1100, David Gibson wrote:
> On Wed, Oct 28, 2020 at 12:49:08PM -0500, Rob Herring wrote:
> > On Tue, Oct 27, 2020 at 11:26 PM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Tue, Oct 27, 2020 at 02:55:17PM -0500, Rob Herring wrote:
> > > > On Tue, Oct 27, 2020 at 10:58 AM Andr=E9 Przywara <andre.przywara@a=
rm.com> wrote:
> > > > >
> > > > > On 26/10/2020 21:51, Rob Herring wrote:
> > > > > > On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> =
wrote:
> > > > > >> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wrote:
> > > > > >>> On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wrote:
> > > > > >>>> On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson wrote:
> > > > > >>>>> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > >>>>>> But what does all of this _mean_ ?  I kinda think I have a=
n answer now.
> > > > > >>>>>> One of the things that sticks out is 6dcb8ba408ec adds a l=
ot and
> > > > > >>>>>> 11738cf01f15 reduces it just a little.
> > > > > >>>>>
> > > > > >>>>> Ah, that's a tricky one.  If we don't handle unaligned acce=
sses we
> > > > > >>>>> instead get intermittent bug reports where it just crashes.
> > > > > >>>>
> > > > > >>>> We really need to talk about that then.  There was a problem=
 of people
> > > > > >>>> turning off the sanity check for making sure the entire devi=
ce tree was
> > > > > >>>> aligned and then having everything crash.
> > > > > >>>
> > > > > >>> Ok... I'm not really sure where you're going with that though=
t.
> > > > > >>
> > > > > >> In my reading of the mailing list history of how this issue ca=
me up,
> > > > > >> it was someone was booting a dragonboard or something, and the=
y (or
> > > > > >> rather, the board maintainer set by default) the flag to use t=
he device
> > > > > >> tree wherever it is in memory and NOT to relocate it to a prop=
erly
> > > > > >> aligned address.  This in turn lead to the kernel getting an u=
naligned
> > > > > >> device tree and everything crashing.  The "I know what I'm doi=
ng" flag
> > > > > >> was set, violated the documented requirements for device trees=
 need to
> > > > > >> reside in memory and everything blew up.
> > > > > >>
> > > > > >> After that it was noticed that there could be some internal
> > > > > >> mis-alignment and if you tried those accesses on a CPU that do=
esn't
> > > > > >> support doing those reads easily there could be problems, but =
that's not
> > > > > >> a common at all case (as noted by it not having been seen in p=
ractice).
> > > > > >
> > > > > > Nor a problem on many environments to begin with. More below...
> > > > > >
> > > > > >>>>> I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and i=
t will just
> > > > > >>>>> break for either an unaligned dtb (unlikely) or if you atte=
mpt to load
> > > > > >>>>> an unaligned value from a property (more likely, but don't =
add the
> > > > > >>>>> flag if you're not sure you don't need it).
> > > > > >>>>
> > > > > >>>> So long as it's abstracted in such a way that we don't grow =
the size of
> > > > > >>>> everything again, yes, that is the right way forward I think.
> > > > > >>>
> > > > > >>> All the ASSUME flags should be resolved at compile time (at l=
east with
> > > > > >>> normal optimization levels enabled in the compiler), so testi=
ng for
> > > > > >>> those shouldn't increase size at all.  If they do, something =
is wrong.
> > > > > >>
> > > > > >> I'm saying that how ever this new ASSUME flag is done, it need=
s to be
> > > > > >> done in such a way the compiler really will be smart about it.=
  So
> > > > > >> something like making a new function that does fdt64_ld() if w=
e aren't
> > > > > >> ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
> > > > > >> ASSUME_ALIGNED_ACCESS.
> > > > > >
> > > > > > Ah, unaligned accesses again... To summarize, both performance =
and
> > > > > > size suffer with not doing unaligned accesses.
> > > > > >
> > > > > > Why not a HAS_UNALIGNED_ACCESS flag instead (or the inverse) th=
at will
> > > > > > do unaligned accesses? That would be more aligned with what the=
 system
> > > > > > can support rather than sanity checking associated with ASSUME_=
*.
> > >
> > > So, there are kind of two things here, (1) is "my platform can handle
> > > unaligned accesses" and (2) is "assume I don't need unaligned
> > > accesses".  We can use the fast & small versions of fdt32_ld() etc. if
> > > either is true.  However we need to consider those separately, because
> > > they can be independently true (or not) for different reasons.  (1)
> > > depends on the hardware, whereas (2) depends on how you're using dtc,
> > > and, see below, you may need at least unaligned-handling fdt64_ld() in
> > > more cases than you think.
> >=20
> > Okay, I guess you were thinking of (2) for ASSUME_ALIGNED_ACCESS, but
> > I read it as (1).
>=20
> Yes.
>=20
> > > > > > To repeat from last time, everything ARMv6 and up can do unalig=
ned
> > > > > > accesses if enabled.
> > > > >
> > > > > But that requires the MMU to be enabled, doesn't it? If I read th=
e ARM
> > > > > ARM correctly, unaligned accesses always trap on device memory,
> > > > > regardless of SCTLR.A. And without the MMU enabled everything is =
device
> > > > > memory. We compile U-Boot with -mno-unaligned-access/-mstrict-ali=
gn to
> > > > > cope with that, and that most likely affects libfdt as well?
> > > >
> > > > Ah yes, I think you are right.
> > > >
> > > > In that case, seems like we should figure out whether (internal)
> > > > unaligned accesses are possible with dtc generated dtbs at least
> > > > rather than just "not a common at all case (as noted by it not havi=
ng
> > > > been seen in practice)." I'm sure David will point out that not all
> > > > dtbs come from dtc, but all the ones u-boot deals with do in
> > > > reality.
> > >
> > > Assuming the blob itself is 8-byte aligned in memory, then all
> > > structural elements (i.e. the tree metadata) of a compliant dtb will
> > > be naturally aligned.  The spec requires 8-byte alignment of the mem
> > > reserve block w.r.t. the base of the blob and 4 byte aligned structure
> > > block w.r.t. the base of the blob.  Likewise the layout of the mem
> > > reserve block will preserve 8-byte alignment of all the 64-bit values
> > > it contains, assuming the block itself starts 8-byte aligned.
> > > Similarly the structure blob will preserve 4-byte alignment of all its
> > > tags and other structural data (this amounts to requiring an alignment
> > > gap after node names and property values).
> > >
> > > However, "all structural elements" does not include values within
> > > property values themselves.  Assuming propery alignment of the blocks
> > > and the blob itself, then all property values will *begin* 4 byte
> > > aligned.  However that leaves two relevant cases:
> > >
> > >  a) 64-bit property values may be 4-byte aligned but not 8-byte
> > >     aligned
> >=20
> > I'd assume that while an arch may support only the above in terms of
> > misalignment, an arch that supports any alignment would always support
> > this as part of that. It would just be odd to support byte alignment
> > only up to 32-bit.
>=20
> Yes, I'd expect so.
>=20
> > I don't think we need to optimize the former case.
>=20
> I don't see how we would, in any case.
>=20
> > >  b) complex property values including both strings and integers
> > >     typically use a packed representation with no alignment gaps.
> > >     Such property structures are usually avoided in modern bindings,
> > >     but they definitely exist in a bunch of older bindings.  Obviously
> > >     that means that integer values sitting after arbitrary length
> > >     strings may not have any natural alignment
> >=20
> > That's the user's problem IMO. Users of older bindings having this
> > aren't likely using a newish function like fdt32_ld either.
>=20
> That doesn't follow.  The bindings still exist and are in use, e.g. on
> IBM PAPR systems, that's not correlated to how recent teh libfdt is.
>=20
> > > So acccesses made by libfdt internally should be safe(*) assuming the
> > > blob itself is loaded 8-byte aligned, and the dtb is compliant.
> > > However the libfdt user may hit both problems (a) and (b) getting
> > > things they actually want from the tree.  fdt{32,64}_{ld,st}() are
> > > intended to handle those cases, so that they're useful for the caller
> > > to pull things from properties as well as for libfdt internal
> > > accesses.
> > >
> > > (*) There are a number of other functions that looked like they might
> > >     be dangerous for case (a) because they are based on 64-bit
> > >     property values: fdt_setprop_inplace_u64(), fdt_property_u64(),
> > >     fdt_setprop_u64(), fdt_appendprop_u64() and
> > >     fdt_appendprop_addrrange().  However I think they're actually
> > >     ok, because the way they're built in terms of other functions
> > >     means there's implicitly a memcpy() from a byte buffer.
> > >
> > > > > Also some 32-bit ARM platforms run U-Boot proper with the MMU dis=
abled
> > > > > all the time, and I know of at least the sunxi-aarch64 SPL runnin=
g with
> > > > > the MMU off as well.
> > > >
> > > > I'm making a mental note of this for the next time performance issu=
es come up.
> > >
> > > Right, running early with MMU off is definitely a real use case for
> > > libfdt.  For similar reasons we can't assume we have an OS which will
> > > trap and handle unaligned accesses, which we might for a more
> > > conventional userspace library.
> > >
> > > This kind of underscores why I'm a bit hesitant to introduce "my
> > > platform handles unaligned acccesses" flag.  Not only does it require
> > > detailed knowledge of the target CPU, but it can also depend on
> > > exactly what mode that hardware is in.
> >=20
> > I think there's a more simple solution with no flags. Given all
> > internal accesses are at least 4-byte aligned, libfdt should just do
> > 32-bit accesses internally (as it used to). Maybe we need a check up
> > front that the dtb is 8-byte aligned though.
>=20
> That's not a bad idea.  We could do it in fdt_ro_probe_().
>=20
> Although, one extra case occurs to me.  Someone (is it uboot?) has a
> wacky format where dtbs for several platforms, along with kernels and
> other information are bundled together in a big dtb (that is, using
> the dtb encoding, even though it's not actually a device tree).  The
> "sub-dtbs" in that will be 4-byte aligned, but maybe not 8-byte
> aligned.

Yes, about 12 years ago now U-Boot introduced (but it's useful anywhere,
really...) FIT images which are what you're thinking of.  That's
unrelated to all of this however.

--=20
Tom

--+GiWpZ/vZzfY9+ZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+a2d4ACgkQFHw5/5Y0
tyyujwv+LjVKnOeh7+Zq6vRNAhldDkhhAy7nANG5ke9prpFl5abXZIOh5YZFSKVg
UfrNfV/wOTZDbVINvcIEGfIJmnOp7RC0214H3+9PGSPJG+4nzpVreKBFUfEJGvjh
J9uGmyWce0ZJe0gaxRmnMbd75o7akygkkT+wdpzGXOHX5hePq+dZAXo/gSGbwo3+
9UEI1mbBIEjEA+7doSpozf0gC2QpInWfJULI/Y4QgKFaIvsTWbRETgFgR1mpHEvI
Q1vHEtrgtrzTY8/UvgLPCTcHzwvUcZO9mYJz38SEneeNcMjaXPpE6FUGYWuOnMXt
forcGUfvc648yhSsDaSGVaqyq0afy5GMI2Ja67UooqG09azJnIMA7b1kc7V2jdgi
NWdVH8d7/NWwnu15hT9lTTPoIQn/NUIaXUHIKHSTM4d0I/9P9Kzj8G3tkLUwKX6B
PsLvmr/E6F5x4LYiqB+susUKdwC3O5L8L3iU5VF8dPldKLmxbhpO0fWv3901Gj7E
91ydD6FQ
=Te16
-----END PGP SIGNATURE-----

--+GiWpZ/vZzfY9+ZQ--
