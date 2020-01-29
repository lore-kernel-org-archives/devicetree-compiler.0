From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Wed, 29 Jan 2020 10:05:12 -0600
Message-ID: <CAL_JsqLYobRrLtF9z3eMt=YneGuxDpvpKU7DQruza-jq4n6B3Q@mail.gmail.com>
References: <20200117153106.29909-1-trini@konsulko.com> <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat> <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat> <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat> <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
 <b5e2288c5b06419fbfd057b8895ade5c5493cde5.camel@freebsd.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580313925;
        bh=21c58g1SxutihdKVz3IgrNMPTXg8HaU1pCYkkPTAwxQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ghMSYB5fHFjnRHeVGQNiQ8uJCfPmGdMbYE2N0n8LMmZAAeqWin4EN5Q1O7j0hh32/
         nqRF1Zqkg8Q0dkE2A71MBFMapw/4cIR2/FcTrLFyP6DqoxboqPbndarmJDM5c05NMh
         HPLNbHTDXFs72qnTXmE2SVg83oSu3LelTyJo6Wew=
In-Reply-To: <b5e2288c5b06419fbfd057b8895ade5c5493cde5.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>

On Tue, Jan 28, 2020 at 8:15 PM Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>
> On Tue, 2020-01-28 at 08:08 -0600, Rob Herring wrote:
> > On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > >
> [...]
> > > I still believe you have things wrong.  There's not an unaligned access
> > > problem that libfdt needs to care about.  ARM doesn't need help handling
> > > unaligned accesses.  The only problem that's been reported is from when
> > > a user got themselves so far off in the weeds that nothing else matters.
> >
> > I think while the vast majority of DTBs don't have anything that would
> > cause unaligned accesses, that's not guaranteed by the FDT format.
> > libfdt needs to handle the worst case.
> >
> > What about ARMv5 and v4 which don't universally support unaligned
> > accesses or any other architecture. Do all mips, openrisc, riscv, arc,
> > microblaze, xtenza, etc. support unaligned accesses?
> >
>
> Unaligned support is optional even on armv6 and armv7.  For quite a
> long time freebsd ran armv7 chips with strict alignment (mostly because
> we had no real need to do otherwise until people started complaining
> that 3rd-party opensource software often failed on freebsd because it's
> written with the assumption that the whole world is linux, and linux
> used relaxed alignment).

That's not really correct. See sections L.3.1 and O.3.1 of the Arm ARM
for v7-A/R. First, unaligned support is always supported for armv7 and
armv6 hardware. In armv6, alignment behavior can follow armv5 or
armv6+ behavior (SCTLR.U bit). In armv6k, the armv5 behavior is
deprecated. It is possible to configure the processor to fault on
misaligned accesses (SCTLR.A bit) which is probably what you meant.
However, gcc (and probably others) will themselves generate unaligned
accesses for code compiled for armv7 (don't know about armv6). The
specific case I remember was for packed structs.

Linux has always supported unaligned accesses for userspace code
though that is configurable. I think this is because x86 always did
and lots of software only got tested on x86 (less true today). For
armv5 and earlier, the kernel had to handle the faults and perform the
accesses.

There was a long debate about all of this for u-boot[1]. Though since
then, it seems clearing SCTLR.A won out thanks to UEFI which also
requires enabling unaligned accesses if the arch supports it (u-boot
commit 78f90aaeeccc9e).

Rob

[1] http://u-boot.10912.n7.nabble.com/PATCH-arm-enable-unaligned-access-on-ARMv7-td126385.html
