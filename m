From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 29 Oct 2020 16:26:56 -0400
Message-ID: <20201029202656.GP5340@bill-the-cat>
References: <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
 <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
 <20201028042601.GA5604@yekko.fritz.box>
 <CAL_JsqJPrnjKjdmvyY2NOay0YrYc20Tr3OSr0yjq+9HjCN+anA@mail.gmail.com>
 <20201029030247.GJ5604@yekko.fritz.box>
 <20201029150401.GG5340@bill-the-cat>
 <20201029195658.GK5604@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A7rymFNmjC2ggD58"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Zn59ST57xbAKKgNvbKygM1ee1khmNbZxEa8X6ZR++w=;
        b=o8foDVzuK9TUv5XQgzh9JEclsJZX+XRfIFHz8pBRyoiaTUaqRwZ4T2Lyfafy1oi3Dk
         q9kMYllj9IVHpthLgwFoaPlyEtKVw1X3udf0VnY8dK3XoyzBK8R1ixeZkHdEJMXkStuH
         XE3w4zOHCJUslBjHVqrkOmEUJrbXqIuoYDGh0=
Content-Disposition: inline
In-Reply-To: <20201029195658.GK5604-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--A7rymFNmjC2ggD58
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 06:56:58AM +1100, David Gibson wrote:
> On Thu, Oct 29, 2020 at 11:04:01AM -0400, Tom Rini wrote:
> > On Thu, Oct 29, 2020 at 02:02:47PM +1100, David Gibson wrote:
> > > On Wed, Oct 28, 2020 at 12:49:08PM -0500, Rob Herring wrote:
> > > > On Tue, Oct 27, 2020 at 11:26 PM David Gibson
> > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Tue, Oct 27, 2020 at 02:55:17PM -0500, Rob Herring wrote:
> > > > > > On Tue, Oct 27, 2020 at 10:58 AM Andr=E9 Przywara <andre.przywa=
ra-5wv7dgnIgG8@public.gmane.org> wrote:
> > > > > > >
> > > > > > > On 26/10/2020 21:51, Rob Herring wrote:
> > > > > > > > On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini@konsulko.c=
om> wrote:
> > > > > > > >> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wro=
te:
> > > > > > > >>> On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wrote:
> > > > > > > >>>> On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson w=
rote:
> > > > > > > >>>>> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrot=
e:
> > > > > > > >
> > > > > > > > [...]
> > > > > > > >
> > > > > > > >>>>>> But what does all of this _mean_ ?  I kinda think I ha=
ve an answer now.
> > > > > > > >>>>>> One of the things that sticks out is 6dcb8ba408ec adds=
 a lot and
> > > > > > > >>>>>> 11738cf01f15 reduces it just a little.
> > > > > > > >>>>>
> > > > > > > >>>>> Ah, that's a tricky one.  If we don't handle unaligned =
accesses we
> > > > > > > >>>>> instead get intermittent bug reports where it just cras=
hes.
> > > > > > > >>>>
> > > > > > > >>>> We really need to talk about that then.  There was a pro=
blem of people
> > > > > > > >>>> turning off the sanity check for making sure the entire =
device tree was
> > > > > > > >>>> aligned and then having everything crash.
> > > > > > > >>>
> > > > > > > >>> Ok... I'm not really sure where you're going with that th=
ought.
> > > > > > > >>
> > > > > > > >> In my reading of the mailing list history of how this issu=
e came up,
> > > > > > > >> it was someone was booting a dragonboard or something, and=
 they (or
> > > > > > > >> rather, the board maintainer set by default) the flag to u=
se the device
> > > > > > > >> tree wherever it is in memory and NOT to relocate it to a =
properly
> > > > > > > >> aligned address.  This in turn lead to the kernel getting =
an unaligned
> > > > > > > >> device tree and everything crashing.  The "I know what I'm=
 doing" flag
> > > > > > > >> was set, violated the documented requirements for device t=
rees need to
> > > > > > > >> reside in memory and everything blew up.
> > > > > > > >>
> > > > > > > >> After that it was noticed that there could be some internal
> > > > > > > >> mis-alignment and if you tried those accesses on a CPU tha=
t doesn't
> > > > > > > >> support doing those reads easily there could be problems, =
but that's not
> > > > > > > >> a common at all case (as noted by it not having been seen =
in practice).
> > > > > > > >
> > > > > > > > Nor a problem on many environments to begin with. More belo=
w...
> > > > > > > >
> > > > > > > >>>>> I suppose we could add an ASSUME_ALIGNED_ACCESS flag, a=
nd it will just
> > > > > > > >>>>> break for either an unaligned dtb (unlikely) or if you =
attempt to load
> > > > > > > >>>>> an unaligned value from a property (more likely, but do=
n't add the
> > > > > > > >>>>> flag if you're not sure you don't need it).
> > > > > > > >>>>
> > > > > > > >>>> So long as it's abstracted in such a way that we don't g=
row the size of
> > > > > > > >>>> everything again, yes, that is the right way forward I t=
hink.
> > > > > > > >>>
> > > > > > > >>> All the ASSUME flags should be resolved at compile time (=
at least with
> > > > > > > >>> normal optimization levels enabled in the compiler), so t=
esting for
> > > > > > > >>> those shouldn't increase size at all.  If they do, someth=
ing is wrong.
> > > > > > > >>
> > > > > > > >> I'm saying that how ever this new ASSUME flag is done, it =
needs to be
> > > > > > > >> done in such a way the compiler really will be smart about=
 it.  So
> > > > > > > >> something like making a new function that does fdt64_ld() =
if we aren't
> > > > > > > >> ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
> > > > > > > >> ASSUME_ALIGNED_ACCESS.
> > > > > > > >
> > > > > > > > Ah, unaligned accesses again... To summarize, both performa=
nce and
> > > > > > > > size suffer with not doing unaligned accesses.
> > > > > > > >
> > > > > > > > Why not a HAS_UNALIGNED_ACCESS flag instead (or the inverse=
) that will
> > > > > > > > do unaligned accesses? That would be more aligned with what=
 the system
> > > > > > > > can support rather than sanity checking associated with ASS=
UME_*.
> > > > >
> > > > > So, there are kind of two things here, (1) is "my platform can ha=
ndle
> > > > > unaligned accesses" and (2) is "assume I don't need unaligned
> > > > > accesses".  We can use the fast & small versions of fdt32_ld() et=
c. if
> > > > > either is true.  However we need to consider those separately, be=
cause
> > > > > they can be independently true (or not) for different reasons.  (=
1)
> > > > > depends on the hardware, whereas (2) depends on how you're using =
dtc,
> > > > > and, see below, you may need at least unaligned-handling fdt64_ld=
() in
> > > > > more cases than you think.
> > > >=20
> > > > Okay, I guess you were thinking of (2) for ASSUME_ALIGNED_ACCESS, b=
ut
> > > > I read it as (1).
> > >=20
> > > Yes.
> > >=20
> > > > > > > > To repeat from last time, everything ARMv6 and up can do un=
aligned
> > > > > > > > accesses if enabled.
> > > > > > >
> > > > > > > But that requires the MMU to be enabled, doesn't it? If I rea=
d the ARM
> > > > > > > ARM correctly, unaligned accesses always trap on device memor=
y,
> > > > > > > regardless of SCTLR.A. And without the MMU enabled everything=
 is device
> > > > > > > memory. We compile U-Boot with -mno-unaligned-access/-mstrict=
-align to
> > > > > > > cope with that, and that most likely affects libfdt as well?
> > > > > >
> > > > > > Ah yes, I think you are right.
> > > > > >
> > > > > > In that case, seems like we should figure out whether (internal)
> > > > > > unaligned accesses are possible with dtc generated dtbs at least
> > > > > > rather than just "not a common at all case (as noted by it not =
having
> > > > > > been seen in practice)." I'm sure David will point out that not=
 all
> > > > > > dtbs come from dtc, but all the ones u-boot deals with do in
> > > > > > reality.
> > > > >
> > > > > Assuming the blob itself is 8-byte aligned in memory, then all
> > > > > structural elements (i.e. the tree metadata) of a compliant dtb w=
ill
> > > > > be naturally aligned.  The spec requires 8-byte alignment of the =
mem
> > > > > reserve block w.r.t. the base of the blob and 4 byte aligned stru=
cture
> > > > > block w.r.t. the base of the blob.  Likewise the layout of the mem
> > > > > reserve block will preserve 8-byte alignment of all the 64-bit va=
lues
> > > > > it contains, assuming the block itself starts 8-byte aligned.
> > > > > Similarly the structure blob will preserve 4-byte alignment of al=
l its
> > > > > tags and other structural data (this amounts to requiring an alig=
nment
> > > > > gap after node names and property values).
> > > > >
> > > > > However, "all structural elements" does not include values within
> > > > > property values themselves.  Assuming propery alignment of the bl=
ocks
> > > > > and the blob itself, then all property values will *begin* 4 byte
> > > > > aligned.  However that leaves two relevant cases:
> > > > >
> > > > >  a) 64-bit property values may be 4-byte aligned but not 8-byte
> > > > >     aligned
> > > >=20
> > > > I'd assume that while an arch may support only the above in terms of
> > > > misalignment, an arch that supports any alignment would always supp=
ort
> > > > this as part of that. It would just be odd to support byte alignment
> > > > only up to 32-bit.
> > >=20
> > > Yes, I'd expect so.
> > >=20
> > > > I don't think we need to optimize the former case.
> > >=20
> > > I don't see how we would, in any case.
> > >=20
> > > > >  b) complex property values including both strings and integers
> > > > >     typically use a packed representation with no alignment gaps.
> > > > >     Such property structures are usually avoided in modern bindin=
gs,
> > > > >     but they definitely exist in a bunch of older bindings.  Obvi=
ously
> > > > >     that means that integer values sitting after arbitrary length
> > > > >     strings may not have any natural alignment
> > > >=20
> > > > That's the user's problem IMO. Users of older bindings having this
> > > > aren't likely using a newish function like fdt32_ld either.
> > >=20
> > > That doesn't follow.  The bindings still exist and are in use, e.g. on
> > > IBM PAPR systems, that's not correlated to how recent teh libfdt is.
> > >=20
> > > > > So acccesses made by libfdt internally should be safe(*) assuming=
 the
> > > > > blob itself is loaded 8-byte aligned, and the dtb is compliant.
> > > > > However the libfdt user may hit both problems (a) and (b) getting
> > > > > things they actually want from the tree.  fdt{32,64}_{ld,st}() are
> > > > > intended to handle those cases, so that they're useful for the ca=
ller
> > > > > to pull things from properties as well as for libfdt internal
> > > > > accesses.
> > > > >
> > > > > (*) There are a number of other functions that looked like they m=
ight
> > > > >     be dangerous for case (a) because they are based on 64-bit
> > > > >     property values: fdt_setprop_inplace_u64(), fdt_property_u64(=
),
> > > > >     fdt_setprop_u64(), fdt_appendprop_u64() and
> > > > >     fdt_appendprop_addrrange().  However I think they're actually
> > > > >     ok, because the way they're built in terms of other functions
> > > > >     means there's implicitly a memcpy() from a byte buffer.
> > > > >
> > > > > > > Also some 32-bit ARM platforms run U-Boot proper with the MMU=
 disabled
> > > > > > > all the time, and I know of at least the sunxi-aarch64 SPL ru=
nning with
> > > > > > > the MMU off as well.
> > > > > >
> > > > > > I'm making a mental note of this for the next time performance =
issues come up.
> > > > >
> > > > > Right, running early with MMU off is definitely a real use case f=
or
> > > > > libfdt.  For similar reasons we can't assume we have an OS which =
will
> > > > > trap and handle unaligned accesses, which we might for a more
> > > > > conventional userspace library.
> > > > >
> > > > > This kind of underscores why I'm a bit hesitant to introduce "my
> > > > > platform handles unaligned acccesses" flag.  Not only does it req=
uire
> > > > > detailed knowledge of the target CPU, but it can also depend on
> > > > > exactly what mode that hardware is in.
> > > >=20
> > > > I think there's a more simple solution with no flags. Given all
> > > > internal accesses are at least 4-byte aligned, libfdt should just do
> > > > 32-bit accesses internally (as it used to). Maybe we need a check up
> > > > front that the dtb is 8-byte aligned though.
> > >=20
> > > That's not a bad idea.  We could do it in fdt_ro_probe_().
> > >=20
> > > Although, one extra case occurs to me.  Someone (is it uboot?) has a
> > > wacky format where dtbs for several platforms, along with kernels and
> > > other information are bundled together in a big dtb (that is, using
> > > the dtb encoding, even though it's not actually a device tree).  The
> > > "sub-dtbs" in that will be 4-byte aligned, but maybe not 8-byte
> > > aligned.
> >=20
> > Yes, about 12 years ago now U-Boot introduced (but it's useful anywhere,
> > really...) FIT images which are what you're thinking of.  That's
> > unrelated to all of this however.
>=20
> Well, not entirely, because it's a plausible reason someone would have
> a dtb loaded at a non-8-byte aligned address (though it would be
> 4-byte aligned).

But that in turn gets us back to the original problem.  A board by
default was unfortunately setting the "do not relocate items to be
aligned before use" flag, and got the mess that resulted from that.

Another way to look at it I think is that since we (U-Boot) know what
the alignment requirements are when loading something to memory, it's on
us to make sure those requirements are met and not on a later access
library to deal with "our requirements were broken, but lets use it
anyways".

--=20
Tom

--A7rymFNmjC2ggD58
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+bJY8ACgkQFHw5/5Y0
tyyd9gv+NOxtq+Z2EnKNrp/zQE6RfZMAKD4fXi+7Gogu64f8hoNaCINfhtKlHi4P
lcgH2B1OS6U9Hd0tVhfUqTeMmw3QgkOlbvM6rm3nYdZJ08JXvAa1rvpBKIxrneuM
p76+quKGDRKOjaO+ewFOWGUJQKMurZPO6QVYs+FOZvK8UjKvDH5TCzokn0uNEbLB
ly5No1fPNy2jXrWha9oE216ZkUm2e/dyHvMGDJjgI+8mv6ZxWKkWEihB93yPnov8
O33Km+sp4JNv0mxgAyIMwYgmmhyKKTIfeF1Xa9wbD6gE/QPA+dro3ztFzNNREfoT
LNn1UpDxZY4EhcGIVm3ryvCAjKejpDLGBIHFXRVp6w6Ksu8OdHDGFmOr+KHEu+KR
vATruvR9T7r5mm/oNbr25vcKuqQ6QzjgbbSPqxmCTfQMOCNXF3U+ZJAG42uu7pPP
ppQaFT84aMxS2YTMkYPaEOFRtsKvA5NiM5efa1pY1LHgTfoABk61twUYBT6GslO/
v5CLbtuF
=d9N8
-----END PGP SIGNATURE-----

--A7rymFNmjC2ggD58--
