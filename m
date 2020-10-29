From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 29 Oct 2020 13:55:03 +1100
Message-ID: <20201029025503.GI5604@yekko.fritz.box>
References: <20201021224914.GB14816@bill-the-cat>
 <20201022040013.GB1821515@yekko.fritz.box>
 <20201022123254.GH14816@bill-the-cat>
 <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
 <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
 <20201028042601.GA5604@yekko.fritz.box>
 <20201028120554.GF5340@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ijf6z65S790CMqo8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1603940611;
        bh=/eKghWR6yNvCc2ZOgveAzUJOZO76Enad1TUHZA4pqG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c58FmI9a4jMwhjWkWU1r6cUAxUhidP1yemcHlsn+jTSTfK/v/w0hShFQgKm76Sgt3
         QlXiVCdUM7auOyGb5O6KZmY7D7+B0e1CpqZ3lA0Ez/g8CE8KfjLtatJP5fBn6K1hOI
         FmQcOgBEgo0jgP94t73JOF0aYeBrQZ2FCZq4oJbc=
Content-Disposition: inline
In-Reply-To: <20201028120554.GF5340@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--ijf6z65S790CMqo8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 08:05:54AM -0400, Tom Rini wrote:
> On Wed, Oct 28, 2020 at 03:26:01PM +1100, David Gibson wrote:
> > On Tue, Oct 27, 2020 at 02:55:17PM -0500, Rob Herring wrote:
> > > On Tue, Oct 27, 2020 at 10:58 AM Andr=E9 Przywara <andre.przywara@arm=
=2Ecom> wrote:
> > > >
> > > > On 26/10/2020 21:51, Rob Herring wrote:
> > > > > On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wr=
ote:
> > > > >> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wrote:
> > > > >>> On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wrote:
> > > > >>>> On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson wrote:
> > > > >>>>> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > >>>>>> But what does all of this _mean_ ?  I kinda think I have an =
answer now.
> > > > >>>>>> One of the things that sticks out is 6dcb8ba408ec adds a lot=
 and
> > > > >>>>>> 11738cf01f15 reduces it just a little.
> > > > >>>>>
> > > > >>>>> Ah, that's a tricky one.  If we don't handle unaligned access=
es we
> > > > >>>>> instead get intermittent bug reports where it just crashes.
> > > > >>>>
> > > > >>>> We really need to talk about that then.  There was a problem o=
f people
> > > > >>>> turning off the sanity check for making sure the entire device=
 tree was
> > > > >>>> aligned and then having everything crash.
> > > > >>>
> > > > >>> Ok... I'm not really sure where you're going with that thought.
> > > > >>
> > > > >> In my reading of the mailing list history of how this issue came=
 up,
> > > > >> it was someone was booting a dragonboard or something, and they =
(or
> > > > >> rather, the board maintainer set by default) the flag to use the=
 device
> > > > >> tree wherever it is in memory and NOT to relocate it to a proper=
ly
> > > > >> aligned address.  This in turn lead to the kernel getting an una=
ligned
> > > > >> device tree and everything crashing.  The "I know what I'm doing=
" flag
> > > > >> was set, violated the documented requirements for device trees n=
eed to
> > > > >> reside in memory and everything blew up.
> > > > >>
> > > > >> After that it was noticed that there could be some internal
> > > > >> mis-alignment and if you tried those accesses on a CPU that does=
n't
> > > > >> support doing those reads easily there could be problems, but th=
at's not
> > > > >> a common at all case (as noted by it not having been seen in pra=
ctice).
> > > > >
> > > > > Nor a problem on many environments to begin with. More below...
> > > > >
> > > > >>>>> I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and it =
will just
> > > > >>>>> break for either an unaligned dtb (unlikely) or if you attemp=
t to load
> > > > >>>>> an unaligned value from a property (more likely, but don't ad=
d the
> > > > >>>>> flag if you're not sure you don't need it).
> > > > >>>>
> > > > >>>> So long as it's abstracted in such a way that we don't grow th=
e size of
> > > > >>>> everything again, yes, that is the right way forward I think.
> > > > >>>
> > > > >>> All the ASSUME flags should be resolved at compile time (at lea=
st with
> > > > >>> normal optimization levels enabled in the compiler), so testing=
 for
> > > > >>> those shouldn't increase size at all.  If they do, something is=
 wrong.
> > > > >>
> > > > >> I'm saying that how ever this new ASSUME flag is done, it needs =
to be
> > > > >> done in such a way the compiler really will be smart about it.  =
So
> > > > >> something like making a new function that does fdt64_ld() if we =
aren't
> > > > >> ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
> > > > >> ASSUME_ALIGNED_ACCESS.
> > > > >
> > > > > Ah, unaligned accesses again... To summarize, both performance and
> > > > > size suffer with not doing unaligned accesses.
> > > > >
> > > > > Why not a HAS_UNALIGNED_ACCESS flag instead (or the inverse) that=
 will
> > > > > do unaligned accesses? That would be more aligned with what the s=
ystem
> > > > > can support rather than sanity checking associated with ASSUME_*.
> >=20
> > So, there are kind of two things here, (1) is "my platform can handle
> > unaligned accesses" and (2) is "assume I don't need unaligned
> > accesses".  We can use the fast & small versions of fdt32_ld() etc. if
> > either is true.  However we need to consider those separately, because
> > they can be independently true (or not) for different reasons.  (1)
> > depends on the hardware, whereas (2) depends on how you're using dtc,
> > and, see below, you may need at least unaligned-handling fdt64_ld() in
> > more cases than you think.
> >=20
> > > > > To repeat from last time, everything ARMv6 and up can do unaligned
> > > > > accesses if enabled.
> > > >
> > > > But that requires the MMU to be enabled, doesn't it? If I read the =
ARM
> > > > ARM correctly, unaligned accesses always trap on device memory,
> > > > regardless of SCTLR.A. And without the MMU enabled everything is de=
vice
> > > > memory. We compile U-Boot with -mno-unaligned-access/-mstrict-align=
 to
> > > > cope with that, and that most likely affects libfdt as well?
> > >=20
> > > Ah yes, I think you are right.
> > >=20
> > > In that case, seems like we should figure out whether (internal)
> > > unaligned accesses are possible with dtc generated dtbs at least
> > > rather than just "not a common at all case (as noted by it not having
> > > been seen in practice)." I'm sure David will point out that not all
> > > dtbs come from dtc, but all the ones u-boot deals with do in
> > > reality.
> >=20
> > Assuming the blob itself is 8-byte aligned in memory, then all
> > structural elements (i.e. the tree metadata) of a compliant dtb will
> > be naturally aligned.  The spec requires 8-byte alignment of the mem
> > reserve block w.r.t. the base of the blob and 4 byte aligned structure
> > block w.r.t. the base of the blob.  Likewise the layout of the mem
> > reserve block will preserve 8-byte alignment of all the 64-bit values
> > it contains, assuming the block itself starts 8-byte aligned.
> > Similarly the structure blob will preserve 4-byte alignment of all its
> > tags and other structural data (this amounts to requiring an alignment
> > gap after node names and property values).
> >=20
> > However, "all structural elements" does not include values within
> > property values themselves.  Assuming propery alignment of the blocks
> > and the blob itself, then all property values will *begin* 4 byte
> > aligned.  However that leaves two relevant cases:
> >=20
> >  a) 64-bit property values may be 4-byte aligned but not 8-byte
> >     aligned
> >  b) complex property values including both strings and integers
> >     typically use a packed representation with no alignment gaps.
> >     Such property structures are usually avoided in modern bindings,
> >     but they definitely exist in a bunch of older bindings.  Obviously
> >     that means that integer values sitting after arbitrary length
> >     strings may not have any natural alignment
> >=20
> > So acccesses made by libfdt internally should be safe(*) assuming the
> > blob itself is loaded 8-byte aligned, and the dtb is compliant.
> > However the libfdt user may hit both problems (a) and (b) getting
> > things they actually want from the tree.  fdt{32,64}_{ld,st}() are
> > intended to handle those cases, so that they're useful for the caller
> > to pull things from properties as well as for libfdt internal
> > accesses.
> >=20
> > (*) There are a number of other functions that looked like they might
> >     be dangerous for case (a) because they are based on 64-bit
> >     property values: fdt_setprop_inplace_u64(), fdt_property_u64(),
> >     fdt_setprop_u64(), fdt_appendprop_u64() and
> >     fdt_appendprop_addrrange().  However I think they're actually
> >     ok, because the way they're built in terms of other functions
> >     means there's implicitly a memcpy() from a byte buffer.
> >=20
> > > > Also some 32-bit ARM platforms run U-Boot proper with the MMU disab=
led
> > > > all the time, and I know of at least the sunxi-aarch64 SPL running =
with
> > > > the MMU off as well.
> > >=20
> > > I'm making a mental note of this for the next time performance issues=
 come up.
> >=20
> > Right, running early with MMU off is definitely a real use case for
> > libfdt.  For similar reasons we can't assume we have an OS which will
> > trap and handle unaligned accesses, which we might for a more
> > conventional userspace library.
> >=20
> > This kind of underscores why I'm a bit hesitant to introduce "my
> > platform handles unaligned acccesses" flag.  Not only does it require
> > detailed knowledge of the target CPU, but it can also depend on
> > exactly what mode that hardware is in.
>=20
> Can you please note the existing user(s) where we have just the right
> combination of factors and so everything fails?

Sorry, I don't understand the question.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ijf6z65S790CMqo8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+aLwUACgkQbDjKyiDZ
s5JDxA//UGx/ajjBHfsFaSjlFbdOvmgsZkN/bYEf2pnSBzj2cceR76YzX9sqXU7H
bwlRmGJcjEgeXprDJY2VNLvc9zZwbw8q3VdEWeOCF/1QBX/bTEmjRiwqnaAxaje7
C/Il8+cG6hMDOb+kQKEHMNRQBTbXiMg+De4Y23iKgH5deLIAWw62z9gfeC/5as6x
R/TkznBz1L6qhf9/md9U0poO0/IXUsFRex5z3v6SlmhEKxd7O7dVpUn62ZltjYAb
vVKDDtRlikEblgWJB081wdAaHSUU08LuJrjpgP/8b2AoIMjPElL4McvYBIckwqTC
l9hirw1TVxHU1k06QqQs4RMyjsnHM06GOHLOlmqmtIqyRn1+rc/Ceo4X89Ey2hYz
+9CWNt3Jwn8CbyEMB3BHxAM2R2y/niTsZy7QQ5nyz+zYIv58NUc8b1ugvnzSgW7Z
VZTypAh5ycoxrLf4o2iXTo47ec08x5gKaqGn2oHgEr1Cc42aK+WIrZP80XtGKYYI
0B+tSIuekaHUhnepqiK59io/qQijUrVYEZtz5VnuI2jHCZEhmyhRV+yF5CGwVbzS
gLSxb64pxave96GLHVm6TuJGUTHhFF6ZgmcQOZz/GlwRkLHSo2pmV1H9saObsUXl
L214U8ipaeYBAU81RL+f/UC2nUq/aYrEC92kQaRF7c9ZHa3vwFU=
=9wl1
-----END PGP SIGNATURE-----

--ijf6z65S790CMqo8--
