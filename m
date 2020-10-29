From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Thu, 29 Oct 2020 12:04:29 -0400
Message-ID: <20201029160429.GM5340@bill-the-cat>
References: <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
 <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
 <CAL_JsqK_fC346UnCmXMJxKHCM6=eFBF_kmGt_fBdvwPXbPRkvw@mail.gmail.com>
 <20201028042601.GA5604@yekko.fritz.box>
 <20201028120554.GF5340@bill-the-cat>
 <20201029025503.GI5604@yekko.fritz.box>
 <20201029150603.GH5340@bill-the-cat>
 <CAL_JsqJUixnyZx-tu9EV8YZ-gSDE7i1jvMddnNZZWFzezaHftw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1WqHV5/jCvFSwawE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=suYuJhSvReafmF19FD5Eiy1E82IxLFFsAMBqarwSF5I=;
        b=HPmSUubFIhoCpj7t1KQaGCUrdIzin1rQQkdOHh06fzQgmvJhst8Z7hwBBEWOfvDGzX
         i86PA7k3N4n1jp8DEsei1PJ61rUK1Fa401tzpzAFSymBMp3lU/4vAL7d7qUJ8efayts4
         M8qg22Sfy+v9Jc1dfRhykF1cstFmczmTt01yk=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJUixnyZx-tu9EV8YZ-gSDE7i1jvMddnNZZWFzezaHftw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--1WqHV5/jCvFSwawE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 10:48:28AM -0500, Rob Herring wrote:
> On Thu, Oct 29, 2020 at 10:06 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >
> > On Thu, Oct 29, 2020 at 01:55:03PM +1100, David Gibson wrote:
> > > On Wed, Oct 28, 2020 at 08:05:54AM -0400, Tom Rini wrote:
> > > > On Wed, Oct 28, 2020 at 03:26:01PM +1100, David Gibson wrote:
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
> > > > >
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
> > > > >  b) complex property values including both strings and integers
> > > > >     typically use a packed representation with no alignment gaps.
> > > > >     Such property structures are usually avoided in modern bindin=
gs,
> > > > >     but they definitely exist in a bunch of older bindings.  Obvi=
ously
> > > > >     that means that integer values sitting after arbitrary length
> > > > >     strings may not have any natural alignment
> > > > >
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
> > > >
> > > > Can you please note the existing user(s) where we have just the rig=
ht
> > > > combination of factors and so everything fails?
> > >
> > > Sorry, I don't understand the question.
> >
> > I'm asking what the platform(s) are that have the very specific "and
> > here be failure" problem you're concerned with.
>=20
> I'm also and still confused with your question.

Maybe I'm just confused then.  I'm asking what hardware ends up causing
a fault when we read a property that starts at 0x....3 and we would not
have already enabled the MMU and done whatever else is required to have
the fault fixed up and handled.  That's not the case in U-Boot.  But
that being a possible case seems to be where the underlying concern is.

> >  I'm concerned that
> > right now we're going to end up with larger pile of reverts to dtc in
> > U-Boot rather than being able to just sync with the project properly
> > again.
>=20
> I think we have some agreement which I believe would end being the
> revert you originally submitted, but just keep the fdt*_ld() accessors
> which always do safe accesses.

So keep fdt{32,64}_ld() and switch all of the callers back to
fdt{32,64}_to_cpu()?  OK, should I spin up a patch or ?  Thanks!

--=20
Tom

--1WqHV5/jCvFSwawE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+a6AkACgkQFHw5/5Y0
tyyX3gv+N4H6r3EvvX93EQxmS6/KgUQJTrS7aRRnZ0gIsstLlDBjaiwWrCO5AlbD
fimzVkt6/DhxHKwhk4Z8OserFRss6NaT83ipEVZu9Z1shN7NT4hLPC5kQAeEIkhW
DWRKE6gEsep3FFUnRe3ekb5muuUcTYc5WgnO3YeuKJPUJSLKfHUJ8RQZTT0BInfA
0Bw/sXdAsWtFO1iof4J/dcQGpFeQYwfeYRCe5/Om4YpX/Y9XxNRVqgmNpaIIL9KO
nvPXOrzBvSbUvU0D5WzEA6CKYpsl4bfgSImXtGByuXAAVaAvC+CE0G+dQOkoxsBe
OblN2NvoknPDsMUXTej3BRa2LxYKJbrpktmvaNIf2o5SWYVv9FH+HIEquNR2WQfG
OTWEFv3pi5shGs8XAJwsHbv3TleEkOWqQ54F5x8lXEaqnibIdvgSCg74fMRjRVu+
aE4usKi3rl2qUGWcVUYVYFW17k+75wX7E0UaH1zzwc+7ZQgel+kuJE+xR2w62TvF
XXuTkDek
=yQbX
-----END PGP SIGNATURE-----

--1WqHV5/jCvFSwawE--
