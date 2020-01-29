From: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Wed, 29 Jan 2020 09:08:52 -0700
Message-ID: <062bda30ab77bdaf0b31e82f251ac598aee4558c.camel@freebsd.org>
References: <20200117153106.29909-1-trini@konsulko.com>
         <20200123091440.GQ2347@umbus.fritz.box>
         <20200123121650.GV26536@bill-the-cat>
         <20200127032351.GA1818@umbus.fritz.box>
         <20200127150434.GJ9259@bill-the-cat>
         <20200128085918.GO42099@umbus.fritz.box>
         <20200128134304.GQ13379@bill-the-cat>
         <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
         <b5e2288c5b06419fbfd057b8895ade5c5493cde5.camel@freebsd.org>
         <CAL_JsqLYobRrLtF9z3eMt=YneGuxDpvpKU7DQruza-jq4n6B3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=outbound.mailhop.org; s=dkim-high;
        h=content-transfer-encoding:mime-version:content-type:references:in-reply-to:
         date:cc:to:from:subject:message-id:from;
        bh=gWPKZ0nO7i+M50TUk4xtifmYeRZFstZA8yQvIGGplVs=;
        b=Q44J8nq9s8iZYmmyuZIN/pueaojHl8xWoYCCk5JSvFoQFm5JzFe/vL0q3ZuunzLY7Nr9lkKMiZK7e
         idi+UkKf5w3LvO8BOXC2A9i7LlxmsuUnKxTACJ6K202mLfDWIqvgEkuRiPdc67tmBDpa0UtdSbyzUE
         ryrc2zasuvMIb6Up0pqGVI10ui2n00aBlfBPrckxJB/KEVqzezOaNDRKZVwKNRoh/cElBa/N6KBnOF
         kYeAkN1W9IiET/ojAKbZVpA+Q3V0BQQ8Kd7hvULpo2KcLwyTlqCDLDCh/AjO7YOzv5Po6ng1VR+TSX
         197cxgKlSgFytB5afarICBJ0SG9i1PA==
In-Reply-To: <CAL_JsqLYobRrLtF9z3eMt=YneGuxDpvpKU7DQruza-jq4n6B3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>

On Wed, 2020-01-29 at 10:05 -0600, Rob Herring wrote:
> On Tue, Jan 28, 2020 at 8:15 PM Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> > 
> > On Tue, 2020-01-28 at 08:08 -0600, Rob Herring wrote:
> > > On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > > 
> > > > 
> > 
> > [...]
> > > > I still believe you have things wrong.  There's not an unaligned access
> > > > problem that libfdt needs to care about.  ARM doesn't need help handling
> > > > unaligned accesses.  The only problem that's been reported is from when
> > > > a user got themselves so far off in the weeds that nothing else matters.
> > > 
> > > I think while the vast majority of DTBs don't have anything that would
> > > cause unaligned accesses, that's not guaranteed by the FDT format.
> > > libfdt needs to handle the worst case.
> > > 
> > > What about ARMv5 and v4 which don't universally support unaligned
> > > accesses or any other architecture. Do all mips, openrisc, riscv, arc,
> > > microblaze, xtenza, etc. support unaligned accesses?
> > > 
> > 
> > Unaligned support is optional even on armv6 and armv7.  For quite a
> > long time freebsd ran armv7 chips with strict alignment (mostly because
> > we had no real need to do otherwise until people started complaining
> > that 3rd-party opensource software often failed on freebsd because it's
> > written with the assumption that the whole world is linux, and linux
> > used relaxed alignment).
> 
> That's not really correct. See sections L.3.1 and O.3.1 of the Arm ARM

Well, no, it IS really correct, but I'm not going to get into a big
pissing contest with you about it.  I suspect your knowledge of freebsd
and the toolchains it uses (which do not involve gcc) aren't up to the
task, and the discussion would be nothing but noise on this list.

-- Ian


