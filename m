From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Thu, 4 Jan 2018 08:21:34 -0600
Message-ID: <CACNAnaHf6bQcJCkStCWy56cUYeXjZcO6TQfT2pCq=oBviDMckg@mail.gmail.com>
References: <20180101065945.65451-1-kevans@FreeBSD.org> <20180101065945.65451-2-kevans@FreeBSD.org>
 <20180103054220.GP24581@umbus.fritz.box> <CACNAnaHW19kCE24KUpi2LFNUS94H2xajq6WWpi0NgY53FAymzw@mail.gmail.com>
 <20180104032600.GA24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104032600.GA24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jan 3, 2018 at 9:26 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Jan 03, 2018 at 08:04:52AM -0600, Kyle Evans wrote:
>> [... snip ...]
>> The problem is that these overlays aren't necessarily curated by a
>> single authority, so conflicts with multiple overlays trying to
>> reference a node is scary. Ideally, we'd like these things to be as
>> usable as possible for average Joe Blow.
>
> Yeah, fair enough.  I'll re-evaluate your patches with that in mind.

I appreciate your consideration, thank you. =) I'm not necessarily too
keen on requiring our users to likely have to disassemble every
overlay they receive or consider which order they apply in if they're
not functionally related.

It also helps me out as I work on hardware that doesn't have complete
DTS in mainline Linux yet, so I'm frequently adding nodes via overlay
that reference base nodes not yet with phandles. Adding phandles to
everything as I go gets kind of messy in my overlays and makes it that
much more difficult to assemble an upstreamable patch.

I've also had fleeting thoughts of writing a tool like dtdiff, but
will actually generate an overlay of the difference between the two
dts being compared. The main use case here being that we follow Linux
releases (not -rc) for our dts, so automatically generating a DTBO
from where we're at to the next stable release (perhaps in the later
-rc stage) would be really really helpful to evaluate if we still work
and what we need to fix.
