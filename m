From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Size growth?
Date: Mon, 2 Nov 2020 13:06:54 +1100
Message-ID: <20201102020654.GE143651@yekko.fritz.box>
References: <20201022123254.GH14816@bill-the-cat>
 <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
 <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
 <20201028042601.GA5604@yekko.fritz.box>
 <20201028120554.GF5340@bill-the-cat>
 <20201029025503.GI5604@yekko.fritz.box>
 <20201029150603.GH5340@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1604282863;
        bh=/OYuxWg5p66UKGEggR09ZvAKL5QE0r/n9IIaTzFrSQs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASQhekj4wutb3f+i6F0GVvhd9isxPobhEti1DT5LAWgN8piukqPg/Saz0dqPUI+PE
         hj2xWMsRC1Ph4emJDQVXVp/JxBjoNP24CqgdJEESJ0IoX78aUwLuJ/plP1kXBzixlm
         VaVPWljzppqwF0kJ9ezuzIwJLWlRhhfQvKLaoajQ=
Content-Disposition: inline
In-Reply-To: <20201029150603.GH5340@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 11:06:03AM -0400, Tom Rini wrote:
> On Thu, Oct 29, 2020 at 01:55:03PM +1100, David Gibson wrote:
> > On Wed, Oct 28, 2020 at 08:05:54AM -0400, Tom Rini wrote:
> > > On Wed, Oct 28, 2020 at 03:26:01PM +1100, David Gibson wrote:
> > > > On Tue, Oct 27, 2020 at 02:55:17PM -0500, Rob Herring wrote:
> > > > > On Tue, Oct 27, 2020 at 10:58 AM Andr=E9 Przywara <andre.przywara=
@arm.com> wrote:
> > > > > >
> > > > > > On 26/10/2020 21:51, Rob Herring wrote:
> > > > > > > On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org=
> wrote:
> > > > > > >> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wrote:
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
=2E.
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
> > > >=20
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
> > > >=20
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
> > > > >=20
> > > > > Ah yes, I think you are right.
> > > > >=20
> > > > > In that case, seems like we should figure out whether (internal)
> > > > > unaligned accesses are possible with dtc generated dtbs at least
> > > > > rather than just "not a common at all case (as noted by it not ha=
ving
> > > > > been seen in practice)." I'm sure David will point out that not a=
ll
> > > > > dtbs come from dtc, but all the ones u-boot deals with do in
> > > > > reality.
> > > >=20
> > > > Assuming the blob itself is 8-byte aligned in memory, then all
> > > > structural elements (i.e. the tree metadata) of a compliant dtb will
> > > > be naturally aligned.  The spec requires 8-byte alignment of the mem
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
> > > >=20
> > > > However, "all structural elements" does not include values within
> > > > property values themselves.  Assuming propery alignment of the bloc=
ks
> > > > and the blob itself, then all property values will *begin* 4 byte
> > > > aligned.  However that leaves two relevant cases:
> > > >=20
> > > >  a) 64-bit property values may be 4-byte aligned but not 8-byte
> > > >     aligned
> > > >  b) complex property values including both strings and integers
> > > >     typically use a packed representation with no alignment gaps.
> > > >     Such property structures are usually avoided in modern bindings,
> > > >     but they definitely exist in a bunch of older bindings.  Obviou=
sly
> > > >     that means that integer values sitting after arbitrary length
> > > >     strings may not have any natural alignment
> > > >=20
> > > > So acccesses made by libfdt internally should be safe(*) assuming t=
he
> > > > blob itself is loaded 8-byte aligned, and the dtb is compliant.
> > > > However the libfdt user may hit both problems (a) and (b) getting
> > > > things they actually want from the tree.  fdt{32,64}_{ld,st}() are
> > > > intended to handle those cases, so that they're useful for the call=
er
> > > > to pull things from properties as well as for libfdt internal
> > > > accesses.
> > > >=20
> > > > (*) There are a number of other functions that looked like they mig=
ht
> > > >     be dangerous for case (a) because they are based on 64-bit
> > > >     property values: fdt_setprop_inplace_u64(), fdt_property_u64(),
> > > >     fdt_setprop_u64(), fdt_appendprop_u64() and
> > > >     fdt_appendprop_addrrange().  However I think they're actually
> > > >     ok, because the way they're built in terms of other functions
> > > >     means there's implicitly a memcpy() from a byte buffer.
> > > >=20
> > > > > > Also some 32-bit ARM platforms run U-Boot proper with the MMU d=
isabled
> > > > > > all the time, and I know of at least the sunxi-aarch64 SPL runn=
ing with
> > > > > > the MMU off as well.
> > > > >=20
> > > > > I'm making a mental note of this for the next time performance is=
sues come up.
> > > >=20
> > > > Right, running early with MMU off is definitely a real use case for
> > > > libfdt.  For similar reasons we can't assume we have an OS which wi=
ll
> > > > trap and handle unaligned accesses, which we might for a more
> > > > conventional userspace library.
> > > >=20
> > > > This kind of underscores why I'm a bit hesitant to introduce "my
> > > > platform handles unaligned acccesses" flag.  Not only does it requi=
re
> > > > detailed knowledge of the target CPU, but it can also depend on
> > > > exactly what mode that hardware is in.
> > >=20
> > > Can you please note the existing user(s) where we have just the right
> > > combination of factors and so everything fails?
> >=20
> > Sorry, I don't understand the question.
>=20
> I'm asking what the platform(s) are that have the very specific "and
> here be failure" problem you're concerned with.  I'm concerned that
> right now we're going to end up with larger pile of reverts to dtc in
> U-Boot rather than being able to just sync with the project properly
> again.

I'm afraid I don't know.  I just know that the problem has been
reported on several occasions.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+fabwACgkQbDjKyiDZ
s5IWXBAAmQj2RC/JlyaAhGLFGB1t7pY7hj0e3rXPVX6+PLbx6jWPc/G8sp8gh9z5
kx+MIt3Wf8RuJpZNOepJGLrTcJBfFDfz73DWysE63wCrgZG47v5rpEotgwxtxq9R
tshKSEnDQIQYnmyohaSo8n4DF+hl9ldi2yIz14Ti1e6fltxEhA9+DLw+mOI1SdoS
Q1GeSVCNMFVweuF+BzRdNhd+FG9pi69SvxiK8hj/IF4MflQLmp0YrNx23HrRMXqw
+BMQ/upbCIR2rZ44Ta5FP9l23c809KLC1mZwhCup7LL78HvQWIawO6C7D4Cg9bjS
HQiXGgOrp4jk6/cZZjgHi9a0KQGGfsKjPcPjBNS6tOYyDpgU2dccou5PK/dEDrvZ
I+ny6wjHRf7QmJaxQ2aON09bMbLm/CiyzJ8LMna5TtT27X5fJjRojbG34H1aU4KJ
QJoy7ox0EEdfileRjyCpqmgPppNMDl3P3pomB9Kvm5E6Hc1iebDfvHBd3fk7vkQW
rMvXM9CupQK8daLtbTJT3O56SChdPYS4wO2iuGK68e6KWfWgdcTE11eqOrSyG0L8
IzlZtmysRaQkbxH27W3EguPm1i7UqdPg1NqGd7yRyciplVPZ8QNtmjgwwW+JOS8W
Cq1iiheQ3qFP+elMN+EXhRTx7SDHvlgOl6xSHEK3f8nbOr48rwY=
=V9pu
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
