From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Size growth?
Date: Mon, 26 Oct 2020 18:17:27 -0400
Message-ID: <20201026221727.GY14816@bill-the-cat>
References: <CAPnjgZ3jPciWmoVpuoYb9KC2h3eCevZsq+1BzefCOCAFCDoseQ@mail.gmail.com>
 <20201019014213.GA11625@yekko.fritz.box>
 <20201019123700.GH14816@bill-the-cat>
 <20201020020907.GA64103@yekko.fritz.box>
 <20201021224914.GB14816@bill-the-cat>
 <20201022040013.GB1821515@yekko.fritz.box>
 <20201022123254.GH14816@bill-the-cat>
 <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J9mem0WTb8IwkzPa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+AMEE5TxZg9NuuSX7a1wrrM6YYlaKk0vGd4c9mAjJws=;
        b=QnJQ0F9j89H3VkVsKWcaho8ibPDHvklXVhnLp1wU+YjoTnHnAF9Mw1o+4MRyW1rJaA
         M7wz+537EOk5lgxIAkMhpM+EQkyTdS1ZVlJNk088JHQqczIvuzKHvwtHt/RBhltrr25N
         2x1SU0EmoQuPPrpGYzO5YXuxqeT/GiW4jVP+A=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--J9mem0WTb8IwkzPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 04:51:20PM -0500, Rob Herring wrote:
> On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wrote:
> > > On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wrote:
> > > > On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson wrote:
> > > > > On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
>=20
> [...]
>=20
> > > > > > But what does all of this _mean_ ?  I kinda think I have an ans=
wer now.
> > > > > > One of the things that sticks out is 6dcb8ba408ec adds a lot and
> > > > > > 11738cf01f15 reduces it just a little.
> > > > >
> > > > > Ah, that's a tricky one.  If we don't handle unaligned accesses we
> > > > > instead get intermittent bug reports where it just crashes.
> > > >
> > > > We really need to talk about that then.  There was a problem of peo=
ple
> > > > turning off the sanity check for making sure the entire device tree=
 was
> > > > aligned and then having everything crash.
> > >
> > > Ok... I'm not really sure where you're going with that thought.
> >
> > In my reading of the mailing list history of how this issue came up,
> > it was someone was booting a dragonboard or something, and they (or
> > rather, the board maintainer set by default) the flag to use the device
> > tree wherever it is in memory and NOT to relocate it to a properly
> > aligned address.  This in turn lead to the kernel getting an unaligned
> > device tree and everything crashing.  The "I know what I'm doing" flag
> > was set, violated the documented requirements for device trees need to
> > reside in memory and everything blew up.
> >
> > After that it was noticed that there could be some internal
> > mis-alignment and if you tried those accesses on a CPU that doesn't
> > support doing those reads easily there could be problems, but that's not
> > a common at all case (as noted by it not having been seen in practice).
>=20
> Nor a problem on many environments to begin with. More below...
>=20
> > > > > I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and it will=
 just
> > > > > break for either an unaligned dtb (unlikely) or if you attempt to=
 load
> > > > > an unaligned value from a property (more likely, but don't add the
> > > > > flag if you're not sure you don't need it).
> > > >
> > > > So long as it's abstracted in such a way that we don't grow the siz=
e of
> > > > everything again, yes, that is the right way forward I think.
> > >
> > > All the ASSUME flags should be resolved at compile time (at least with
> > > normal optimization levels enabled in the compiler), so testing for
> > > those shouldn't increase size at all.  If they do, something is wrong.
> >
> > I'm saying that how ever this new ASSUME flag is done, it needs to be
> > done in such a way the compiler really will be smart about it.  So
> > something like making a new function that does fdt64_ld() if we aren't
> > ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
> > ASSUME_ALIGNED_ACCESS.
>=20
> Ah, unaligned accesses again... To summarize, both performance and
> size suffer with not doing unaligned accesses.
>=20
> Why not a HAS_UNALIGNED_ACCESS flag instead (or the inverse) that will
> do unaligned accesses? That would be more aligned with what the system
> can support rather than sanity checking associated with ASSUME_*.

I leave this up to the dtc folks.  With my U-Boot hat on, we'll be
defaulting to "unaligned is fine" for everyone.

> To repeat from last time, everything ARMv6 and up can do unaligned
> accesses if enabled. That's the vast majority of Arm systems that
> people care about. Whether that's enabled or not is up to how SCTLR.A
> is configured. Last I checked, u-boot clears this. Don't know about
> SPL case though.

I think it's something close to never do we ever have things configured
such that truly unaligned access is a problem.  The historical problem
wasn't even that something wasn't at all aligned, it was 4-byte aligned
when the requirement was 8-byte aligned and everything failed.  Only
later were totally unaligned parts of the tree found and that's still
not a problem for how U-Boot uses things.

--=20
Tom

--J9mem0WTb8IwkzPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+XSvAACgkQFHw5/5Y0
tyxeRQv9HNRq53Y3SaiwDDYoAArffHzQuaRl5Tk36ghU/5WhGOsn2WzHB+ikpUFK
8K0glXTPeaXD9s1qOXTax1ZNOQ92XDiwiM7LcstXaYhkM1IlrjOynJVXf6qfoSBT
FFIrzpm67AUaG4Mp+jKKnd2KMIu4JNOdUmVa/I9Z/qe4eSrPq2/bc6FWJNseWHpT
OtPlqNzdiX9cGkhafdnWtrMUg1syBvZAYfDjy6XsdIE8lXSWCcGFcfYcBXYQuEe2
Cnc8iowzRowsxQXDb/T2JafzBeJdqnfoqspHuMryW8IyxLtEqldvN5pCzdgZ3NSj
1x8fdeyZdQtDXV0acBzoLUjwI0Ef65K7AV44daIk4ahMgbVpUDcT2Q1VcwUCrTml
hrkDdUlipeO8kNk/5ODEHkNHs/vCgDfQUCqkpJeUv0qHkXisaCIYVMItVPp++x0G
ld0p6PKHgkYW+2pt0ungLsE4ATWqDx+R7vxz1CVfsp16izhyVT8DIHWbBq296X9D
M/aWEEMo
=Jd7W
-----END PGP SIGNATURE-----

--J9mem0WTb8IwkzPa--
