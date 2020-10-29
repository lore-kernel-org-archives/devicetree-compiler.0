From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 29 Oct 2020 16:21:45 -0400
Message-ID: <20201029202145.GO5340@bill-the-cat>
References: <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
 <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
 <20201028042601.GA5604@yekko.fritz.box>
 <20201028120554.GF5340@bill-the-cat>
 <20201029025503.GI5604@yekko.fritz.box>
 <20201029150603.GH5340@bill-the-cat>
 <CAL_JsqJUixnyZx-tu9EV8YZ-gSDE7i1jvMddnNZZWFzezaHftw@mail.gmail.com>
 <20201029160429.GM5340@bill-the-cat>
 <CAL_JsqJTTJAoTYwxDn3i0KETMXLyGg3WXzxN3-OdRLx=R96a-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Us1vGbk6rx5/o4d9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BG8m6T/yqJuFpECeFLIWPZSBIEEJufUTdSr9kJPkqVc=;
        b=BmPFTA6Fwn8e9nCrX5TYCkUSdf9up9Vy5rQDkEDOgeqvZ9CYEnm2s4nqClimDzCS46
         Q7gwupR71Wle0AE77sSPSxpfezh77u+HPJsuZEAGVqghM/7h4VnTGYCLejXhmEqCMNwO
         6p52hQwp2hoavTf0TJtCTNLd9PBydWAyDtoVo=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJTTJAoTYwxDn3i0KETMXLyGg3WXzxN3-OdRLx=R96a-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Us1vGbk6rx5/o4d9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 01:08:37PM -0500, Rob Herring wrote:
> On Thu, Oct 29, 2020 at 11:04 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >
> > On Thu, Oct 29, 2020 at 10:48:28AM -0500, Rob Herring wrote:
> > > On Thu, Oct 29, 2020 at 10:06 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > >
> > > > On Thu, Oct 29, 2020 at 01:55:03PM +1100, David Gibson wrote:
> > > > > On Wed, Oct 28, 2020 at 08:05:54AM -0400, Tom Rini wrote:
> > > > > > On Wed, Oct 28, 2020 at 03:26:01PM +1100, David Gibson wrote:
> > > > > > > On Tue, Oct 27, 2020 at 02:55:17PM -0500, Rob Herring wrote:
> > > > > > > > On Tue, Oct 27, 2020 at 10:58 AM Andr=E9 Przywara <andre.pr=
zywara-5wv7dgnIgG8@public.gmane.org> wrote:
> > > > > > > > >
> > > > > > > > > On 26/10/2020 21:51, Rob Herring wrote:
> > > > > > > > > > On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini@konsul=
ko.com> wrote:
> > > > > > > > > >> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson=
 wrote:
> > > > > > > > > >>> On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wr=
ote:
> > > > > > > > > >>>> On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibs=
on wrote:
> > > > > > > > > >>>>> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini =
wrote:
> > > > > > > > > >
> > > > > > > > > > [...]
> > > > > > > > > >
> > > > > > > > > >>>>>> But what does all of this _mean_ ?  I kinda think =
I have an answer now.
> > > > > > > > > >>>>>> One of the things that sticks out is 6dcb8ba408ec =
adds a lot and
> > > > > > > > > >>>>>> 11738cf01f15 reduces it just a little.
> > > > > > > > > >>>>>
> > > > > > > > > >>>>> Ah, that's a tricky one.  If we don't handle unalig=
ned accesses we
> > > > > > > > > >>>>> instead get intermittent bug reports where it just =
crashes.
> > > > > > > > > >>>>
> > > > > > > > > >>>> We really need to talk about that then.  There was a=
 problem of people
> > > > > > > > > >>>> turning off the sanity check for making sure the ent=
ire device tree was
> > > > > > > > > >>>> aligned and then having everything crash.
> > > > > > > > > >>>
> > > > > > > > > >>> Ok... I'm not really sure where you're going with tha=
t thought.
> > > > > > > > > >>
> > > > > > > > > >> In my reading of the mailing list history of how this =
issue came up,
> > > > > > > > > >> it was someone was booting a dragonboard or something,=
 and they (or
> > > > > > > > > >> rather, the board maintainer set by default) the flag =
to use the device
> > > > > > > > > >> tree wherever it is in memory and NOT to relocate it t=
o a properly
> > > > > > > > > >> aligned address.  This in turn lead to the kernel gett=
ing an unaligned
> > > > > > > > > >> device tree and everything crashing.  The "I know what=
 I'm doing" flag
> > > > > > > > > >> was set, violated the documented requirements for devi=
ce trees need to
> > > > > > > > > >> reside in memory and everything blew up.
> > > > > > > > > >>
> > > > > > > > > >> After that it was noticed that there could be some int=
ernal
> > > > > > > > > >> mis-alignment and if you tried those accesses on a CPU=
 that doesn't
> > > > > > > > > >> support doing those reads easily there could be proble=
ms, but that's not
> > > > > > > > > >> a common at all case (as noted by it not having been s=
een in practice).
> > > > > > > > > >
> > > > > > > > > > Nor a problem on many environments to begin with. More =
below...
> > > > > > > > > >
> > > > > > > > > >>>>> I suppose we could add an ASSUME_ALIGNED_ACCESS fla=
g, and it will just
> > > > > > > > > >>>>> break for either an unaligned dtb (unlikely) or if =
you attempt to load
> > > > > > > > > >>>>> an unaligned value from a property (more likely, bu=
t don't add the
> > > > > > > > > >>>>> flag if you're not sure you don't need it).
> > > > > > > > > >>>>
> > > > > > > > > >>>> So long as it's abstracted in such a way that we don=
't grow the size of
> > > > > > > > > >>>> everything again, yes, that is the right way forward=
 I think.
> > > > > > > > > >>>
> > > > > > > > > >>> All the ASSUME flags should be resolved at compile ti=
me (at least with
> > > > > > > > > >>> normal optimization levels enabled in the compiler), =
so testing for
> > > > > > > > > >>> those shouldn't increase size at all.  If they do, so=
mething is wrong.
> > > > > > > > > >>
> > > > > > > > > >> I'm saying that how ever this new ASSUME flag is done,=
 it needs to be
> > > > > > > > > >> done in such a way the compiler really will be smart a=
bout it.  So
> > > > > > > > > >> something like making a new function that does fdt64_l=
d() if we aren't
> > > > > > > > > >> ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
> > > > > > > > > >> ASSUME_ALIGNED_ACCESS.
> > > > > > > > > >
> > > > > > > > > > Ah, unaligned accesses again... To summarize, both perf=
ormance and
> > > > > > > > > > size suffer with not doing unaligned accesses.
> > > > > > > > > >
> > > > > > > > > > Why not a HAS_UNALIGNED_ACCESS flag instead (or the inv=
erse) that will
> > > > > > > > > > do unaligned accesses? That would be more aligned with =
what the system
> > > > > > > > > > can support rather than sanity checking associated with=
 ASSUME_*.
> > > > > > >
> > > > > > > So, there are kind of two things here, (1) is "my platform ca=
n handle
> > > > > > > unaligned accesses" and (2) is "assume I don't need unaligned
> > > > > > > accesses".  We can use the fast & small versions of fdt32_ld(=
) etc. if
> > > > > > > either is true.  However we need to consider those separately=
, because
> > > > > > > they can be independently true (or not) for different reasons=
=2E  (1)
> > > > > > > depends on the hardware, whereas (2) depends on how you're us=
ing dtc,
> > > > > > > and, see below, you may need at least unaligned-handling fdt6=
4_ld() in
> > > > > > > more cases than you think.
> > > > > > >
> > > > > > > > > > To repeat from last time, everything ARMv6 and up can d=
o unaligned
> > > > > > > > > > accesses if enabled.
> > > > > > > > >
> > > > > > > > > But that requires the MMU to be enabled, doesn't it? If I=
 read the ARM
> > > > > > > > > ARM correctly, unaligned accesses always trap on device m=
emory,
> > > > > > > > > regardless of SCTLR.A. And without the MMU enabled everyt=
hing is device
> > > > > > > > > memory. We compile U-Boot with -mno-unaligned-access/-mst=
rict-align to
> > > > > > > > > cope with that, and that most likely affects libfdt as we=
ll?
> > > > > > > >
> > > > > > > > Ah yes, I think you are right.
> > > > > > > >
> > > > > > > > In that case, seems like we should figure out whether (inte=
rnal)
> > > > > > > > unaligned accesses are possible with dtc generated dtbs at =
least
> > > > > > > > rather than just "not a common at all case (as noted by it =
not having
> > > > > > > > been seen in practice)." I'm sure David will point out that=
 not all
> > > > > > > > dtbs come from dtc, but all the ones u-boot deals with do in
> > > > > > > > reality.
> > > > > > >
> > > > > > > Assuming the blob itself is 8-byte aligned in memory, then all
> > > > > > > structural elements (i.e. the tree metadata) of a compliant d=
tb will
> > > > > > > be naturally aligned.  The spec requires 8-byte alignment of =
the mem
> > > > > > > reserve block w.r.t. the base of the blob and 4 byte aligned =
structure
> > > > > > > block w.r.t. the base of the blob.  Likewise the layout of th=
e mem
> > > > > > > reserve block will preserve 8-byte alignment of all the 64-bi=
t values
> > > > > > > it contains, assuming the block itself starts 8-byte aligned.
> > > > > > > Similarly the structure blob will preserve 4-byte alignment o=
f all its
> > > > > > > tags and other structural data (this amounts to requiring an =
alignment
> > > > > > > gap after node names and property values).
> > > > > > >
> > > > > > > However, "all structural elements" does not include values wi=
thin
> > > > > > > property values themselves.  Assuming propery alignment of th=
e blocks
> > > > > > > and the blob itself, then all property values will *begin* 4 =
byte
> > > > > > > aligned.  However that leaves two relevant cases:
> > > > > > >
> > > > > > >  a) 64-bit property values may be 4-byte aligned but not 8-by=
te
> > > > > > >     aligned
> > > > > > >  b) complex property values including both strings and intege=
rs
> > > > > > >     typically use a packed representation with no alignment g=
aps.
> > > > > > >     Such property structures are usually avoided in modern bi=
ndings,
> > > > > > >     but they definitely exist in a bunch of older bindings.  =
Obviously
> > > > > > >     that means that integer values sitting after arbitrary le=
ngth
> > > > > > >     strings may not have any natural alignment
> > > > > > >
> > > > > > > So acccesses made by libfdt internally should be safe(*) assu=
ming the
> > > > > > > blob itself is loaded 8-byte aligned, and the dtb is complian=
t.
> > > > > > > However the libfdt user may hit both problems (a) and (b) get=
ting
> > > > > > > things they actually want from the tree.  fdt{32,64}_{ld,st}(=
) are
> > > > > > > intended to handle those cases, so that they're useful for th=
e caller
> > > > > > > to pull things from properties as well as for libfdt internal
> > > > > > > accesses.
> > > > > > >
> > > > > > > (*) There are a number of other functions that looked like th=
ey might
> > > > > > >     be dangerous for case (a) because they are based on 64-bit
> > > > > > >     property values: fdt_setprop_inplace_u64(), fdt_property_=
u64(),
> > > > > > >     fdt_setprop_u64(), fdt_appendprop_u64() and
> > > > > > >     fdt_appendprop_addrrange().  However I think they're actu=
ally
> > > > > > >     ok, because the way they're built in terms of other funct=
ions
> > > > > > >     means there's implicitly a memcpy() from a byte buffer.
> > > > > > >
> > > > > > > > > Also some 32-bit ARM platforms run U-Boot proper with the=
 MMU disabled
> > > > > > > > > all the time, and I know of at least the sunxi-aarch64 SP=
L running with
> > > > > > > > > the MMU off as well.
> > > > > > > >
> > > > > > > > I'm making a mental note of this for the next time performa=
nce issues come up.
> > > > > > >
> > > > > > > Right, running early with MMU off is definitely a real use ca=
se for
> > > > > > > libfdt.  For similar reasons we can't assume we have an OS wh=
ich will
> > > > > > > trap and handle unaligned accesses, which we might for a more
> > > > > > > conventional userspace library.
> > > > > > >
> > > > > > > This kind of underscores why I'm a bit hesitant to introduce =
"my
> > > > > > > platform handles unaligned acccesses" flag.  Not only does it=
 require
> > > > > > > detailed knowledge of the target CPU, but it can also depend =
on
> > > > > > > exactly what mode that hardware is in.
> > > > > >
> > > > > > Can you please note the existing user(s) where we have just the=
 right
> > > > > > combination of factors and so everything fails?
> > > > >
> > > > > Sorry, I don't understand the question.
> > > >
> > > > I'm asking what the platform(s) are that have the very specific "and
> > > > here be failure" problem you're concerned with.
> > >
> > > I'm also and still confused with your question.
> >
> > Maybe I'm just confused then.  I'm asking what hardware ends up causing
> > a fault when we read a property that starts at 0x....3 and we would not
> > have already enabled the MMU and done whatever else is required to have
> > the fault fixed up and handled.
>=20
> Ah, well ARMv4 and v5 systems. Outside of that, I don't know.

Right, I don't think anything other than those cases has this specific
potential problem.  Which isn't a common case, but a potential case.

> But as David said, properties will start with 4 byte alignment. It's
> only accesses within a property value that could be a problem, but
> those would be done by the user of libfdt and probably already made
> them alignment safe if needed (or they use fdt{32,64}_ld() if
> relatively recently written).
>=20
> > That's not the case in U-Boot.
>=20
> But it is for u-boot as Andre pointed out if the MMU is off.

But that's just it, the MMU isn't, I would swear, off, at this point for
anything semi modern.  "Everyone" wants dcache, so we have to do some
simple MMU setup.  We care about that before we care about the device
tree.  Unless I'm way off in the weeds in my thinking right now.

> > But
> > that being a possible case seems to be where the underlying concern is.
> >
> > > >  I'm concerned that
> > > > right now we're going to end up with larger pile of reverts to dtc =
in
> > > > U-Boot rather than being able to just sync with the project properly
> > > > again.
> > >
> > > I think we have some agreement which I believe would end being the
> > > revert you originally submitted, but just keep the fdt*_ld() accessors
> > > which always do safe accesses.
> >
> > So keep fdt{32,64}_ld() and switch all of the callers back to
> > fdt{32,64}_to_cpu()?
>=20
> Right.
>=20
> OK, should I spin up a patch or ?
>=20
> Yes.

I'll put it on the TODO list, thanks.

--=20
Tom

--Us1vGbk6rx5/o4d9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+bJFIACgkQFHw5/5Y0
tyxAMQv/cr0ru10QM7poVwBojG3Pd5DmL3AYiAX8jz2MZtep/oFPm2u5iKrEcjI2
DHxCVj96WQSiO9Y2mpy8J1Xo7LYsu1kafk7TiFdECmcFL32YNQDAKwGWTgmVpoqD
wmASG7E+/SohmRQQys81ACMEIdQubR3cMlgW6SbuckwoNg6zQEZdno0w/UYdOkA4
xqMguzjENrMSYyJGNI0DZky52HQ9w9gMMrVNo7T0ZmKEWtPC7LQt6c707mGY90k3
iY9uR1V6A8OCvy2kiZ1m+3CKtdokyUlSns/cbpgT/DmSBwxCecCujL589Em8okJK
whDfYgXr2K9JZFAz1JXOIj/5jZv4oIRmM3yNP1zIyCSi9MasUHNkO8t+bOZ5y1by
BDw51+T5kV3Aeh6UNieB6gpz4sC9AdGV92PyVVNsgCQ000I+SnRk5ZuXYae2ZgWz
5btSL5LvUg3mJTXoMZg2Wo1hGYiv9dXHh4k0JyvTsdg7jQY1yifu0B7EDVaewk6u
lV3/9Kbi
=WTZg
-----END PGP SIGNATURE-----

--Us1vGbk6rx5/o4d9--
