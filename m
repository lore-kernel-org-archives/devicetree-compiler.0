From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Size growth?
Date: Wed, 28 Oct 2020 15:26:01 +1100
Message-ID: <20201028042601.GA5604@yekko.fritz.box>
References: <20201019123700.GH14816@bill-the-cat>
 <20201020020907.GA64103@yekko.fritz.box>
 <20201021224914.GB14816@bill-the-cat>
 <20201022040013.GB1821515@yekko.fritz.box>
 <20201022123254.GH14816@bill-the-cat>
 <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
 <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603859167;
        bh=rg0ipiH0nHhjL6dSysielbrioOzQDQAz4RFV9FZ7bjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HDH5BK42uyycpsv+BGlAZa1UyqDv9mih6w6wino+4t9e5FgB9LFm0nXaYAhLTAqKF
         FtK6j+tJ53xDupRa7w4WtXtmimEejdOCirjqPgRoPN5FlFy9PkL9VYIuRIz73vOvVF
         FDT2n0af/fFXnAgEX3sdt36VB6X4TaPKI2AOn5RE=
Content-Disposition: inline
In-Reply-To: <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 02:55:17PM -0500, Rob Herring wrote:
> On Tue, Oct 27, 2020 at 10:58 AM Andr=E9 Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org=
> wrote:
> >
> > On 26/10/2020 21:51, Rob Herring wrote:
> > > On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > >> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wrote:
> > >>> On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wrote:
> > >>>> On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson wrote:
> > >>>>> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
> > >
> > > [...]
> > >
> > >>>>>> But what does all of this _mean_ ?  I kinda think I have an answ=
er now.
> > >>>>>> One of the things that sticks out is 6dcb8ba408ec adds a lot and
> > >>>>>> 11738cf01f15 reduces it just a little.
> > >>>>>
> > >>>>> Ah, that's a tricky one.  If we don't handle unaligned accesses we
> > >>>>> instead get intermittent bug reports where it just crashes.
> > >>>>
> > >>>> We really need to talk about that then.  There was a problem of pe=
ople
> > >>>> turning off the sanity check for making sure the entire device tre=
e was
> > >>>> aligned and then having everything crash.
> > >>>
> > >>> Ok... I'm not really sure where you're going with that thought.
> > >>
> > >> In my reading of the mailing list history of how this issue came up,
> > >> it was someone was booting a dragonboard or something, and they (or
> > >> rather, the board maintainer set by default) the flag to use the dev=
ice
> > >> tree wherever it is in memory and NOT to relocate it to a properly
> > >> aligned address.  This in turn lead to the kernel getting an unalign=
ed
> > >> device tree and everything crashing.  The "I know what I'm doing" fl=
ag
> > >> was set, violated the documented requirements for device trees need =
to
> > >> reside in memory and everything blew up.
> > >>
> > >> After that it was noticed that there could be some internal
> > >> mis-alignment and if you tried those accesses on a CPU that doesn't
> > >> support doing those reads easily there could be problems, but that's=
 not
> > >> a common at all case (as noted by it not having been seen in practic=
e).
> > >
> > > Nor a problem on many environments to begin with. More below...
> > >
> > >>>>> I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and it will=
 just
> > >>>>> break for either an unaligned dtb (unlikely) or if you attempt to=
 load
> > >>>>> an unaligned value from a property (more likely, but don't add the
> > >>>>> flag if you're not sure you don't need it).
> > >>>>
> > >>>> So long as it's abstracted in such a way that we don't grow the si=
ze of
> > >>>> everything again, yes, that is the right way forward I think.
> > >>>
> > >>> All the ASSUME flags should be resolved at compile time (at least w=
ith
> > >>> normal optimization levels enabled in the compiler), so testing for
> > >>> those shouldn't increase size at all.  If they do, something is wro=
ng.
> > >>
> > >> I'm saying that how ever this new ASSUME flag is done, it needs to be
> > >> done in such a way the compiler really will be smart about it.  So
> > >> something like making a new function that does fdt64_ld() if we aren=
't
> > >> ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
> > >> ASSUME_ALIGNED_ACCESS.
> > >
> > > Ah, unaligned accesses again... To summarize, both performance and
> > > size suffer with not doing unaligned accesses.
> > >
> > > Why not a HAS_UNALIGNED_ACCESS flag instead (or the inverse) that will
> > > do unaligned accesses? That would be more aligned with what the system
> > > can support rather than sanity checking associated with ASSUME_*.

So, there are kind of two things here, (1) is "my platform can handle
unaligned accesses" and (2) is "assume I don't need unaligned
accesses".  We can use the fast & small versions of fdt32_ld() etc. if
either is true.  However we need to consider those separately, because
they can be independently true (or not) for different reasons.  (1)
depends on the hardware, whereas (2) depends on how you're using dtc,
and, see below, you may need at least unaligned-handling fdt64_ld() in
more cases than you think.

> > > To repeat from last time, everything ARMv6 and up can do unaligned
> > > accesses if enabled.
> >
> > But that requires the MMU to be enabled, doesn't it? If I read the ARM
> > ARM correctly, unaligned accesses always trap on device memory,
> > regardless of SCTLR.A. And without the MMU enabled everything is device
> > memory. We compile U-Boot with -mno-unaligned-access/-mstrict-align to
> > cope with that, and that most likely affects libfdt as well?
>=20
> Ah yes, I think you are right.
>=20
> In that case, seems like we should figure out whether (internal)
> unaligned accesses are possible with dtc generated dtbs at least
> rather than just "not a common at all case (as noted by it not having
> been seen in practice)." I'm sure David will point out that not all
> dtbs come from dtc, but all the ones u-boot deals with do in
> reality.

Assuming the blob itself is 8-byte aligned in memory, then all
structural elements (i.e. the tree metadata) of a compliant dtb will
be naturally aligned.  The spec requires 8-byte alignment of the mem
reserve block w.r.t. the base of the blob and 4 byte aligned structure
block w.r.t. the base of the blob.  Likewise the layout of the mem
reserve block will preserve 8-byte alignment of all the 64-bit values
it contains, assuming the block itself starts 8-byte aligned.
Similarly the structure blob will preserve 4-byte alignment of all its
tags and other structural data (this amounts to requiring an alignment
gap after node names and property values).

However, "all structural elements" does not include values within
property values themselves.  Assuming propery alignment of the blocks
and the blob itself, then all property values will *begin* 4 byte
aligned.  However that leaves two relevant cases:

 a) 64-bit property values may be 4-byte aligned but not 8-byte
    aligned
 b) complex property values including both strings and integers
    typically use a packed representation with no alignment gaps.
    Such property structures are usually avoided in modern bindings,
    but they definitely exist in a bunch of older bindings.  Obviously
    that means that integer values sitting after arbitrary length
    strings may not have any natural alignment

So acccesses made by libfdt internally should be safe(*) assuming the
blob itself is loaded 8-byte aligned, and the dtb is compliant.
However the libfdt user may hit both problems (a) and (b) getting
things they actually want from the tree.  fdt{32,64}_{ld,st}() are
intended to handle those cases, so that they're useful for the caller
to pull things from properties as well as for libfdt internal
accesses.

(*) There are a number of other functions that looked like they might
    be dangerous for case (a) because they are based on 64-bit
    property values: fdt_setprop_inplace_u64(), fdt_property_u64(),
    fdt_setprop_u64(), fdt_appendprop_u64() and
    fdt_appendprop_addrrange().  However I think they're actually
    ok, because the way they're built in terms of other functions
    means there's implicitly a memcpy() from a byte buffer.

> > Also some 32-bit ARM platforms run U-Boot proper with the MMU disabled
> > all the time, and I know of at least the sunxi-aarch64 SPL running with
> > the MMU off as well.
>=20
> I'm making a mental note of this for the next time performance issues com=
e up.

Right, running early with MMU off is definitely a real use case for
libfdt.  For similar reasons we can't assume we have an OS which will
trap and handle unaligned accesses, which we might for a more
conventional userspace library.

This kind of underscores why I'm a bit hesitant to introduce "my
platform handles unaligned acccesses" flag.  Not only does it require
detailed knowledge of the target CPU, but it can also depend on
exactly what mode that hardware is in.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+Y8tcACgkQbDjKyiDZ
s5JfHhAApRFwrZc0ViBkeez0FW9is6Y/g9GeCvlVB1e2YznLLn84hGij9evLRAsW
QUg54dGNpUU74ROJE9dgB0+3wmjiknaKmtuqGwdXrz+EQ7qJ4ah0XfDbn2LWZn7S
VKJs5ryUY7kNG5CSd4RVjRRw4qdItgedMgu8ljEOTRe4x1/9xpMOX9mVQsKsHsEk
ftbJ4Wthkpu6ni+3CGMKUIOXZMt/gs0Rn1YdDhPDZ49sYtWSECKu7nz/KNj1Pqfz
CL5DSWi7T4NRCndAjTLEOaUWJ1+vYTCsJg0bsL1jbq9cMJr7B1+/v2V5oqUp7Hy7
dQuiPrvcp9hNIqXnC683qje5ZqTlXXYWaW7KDmc17wBueOEOjkx4QD6LmbhKDkL1
ovuDV3HF2CbJO3zSxfhTycbOG5kpx4tAcLBKOFMbmZU1AvHP39O2SOmyXDb50r16
y0z4CCPkCmIaHUwZCOGaz0wSu7ZpF6Fb1tDLpliAwoiTDVNh+mCJN1JOuPMUbv9T
IJjMfFZRu/RK9IpbTHLJ7AwcrR8P8Yjrs1Uxor2abki1SwNWba6686ZqhKoGPQNF
od2seS23rBGG7dt0bM5Tt6G0MN2LdhsUbAM1Ptq9rReC1P5foDuzPR3jyxbyl5nh
Pscg96ylOAJr1TzfjUyFfM7IaYcVjF9PMkgzG51UY4lBGoOvJj8=
=EApE
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
