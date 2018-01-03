From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Wed, 3 Jan 2018 08:03:27 -0600
Message-ID: <CACNAnaGwpwRO27d2trLBqZjtiZYP1HBP=ck6GJ2N8VrTNehnFw@mail.gmail.com>
References: <20180101041518.23806-1-kevans@FreeBSD.org> <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
 <20180103025856.GL24581@umbus.fritz.box> <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
 <20180103035510.GO24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103035510.GO24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

[Resending with a proper mail client, because my initial response
didn't go to the lists]

On Tue, Jan 2, 2018 at 9:55 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> Ok sounds good.  I had a look at the tests using -ldl and it looks
> like they couldn't easily be adapted to avoid it.  However, I'd be ok
> with logic to skip those tests if libdl isn't available, if you want
> to broaden support to older releases.

The hard part is that libdl doesn't need to be available. With FreeBSD
(and generally, all BSDs if I understood right), the symbols expected
of libdl are available in libc.

If I have my terminology right, our libdl is in fact just a filter on
libc to isolate these symbols/functions for all of the software that
expected libdl. We'd spent enough time patching out -ldl that it
seemed a good idea, but these binaries *do* compile without it.

> At the moment dtc seems to be just teetering on the edge of being
> complex enough to need some sort of configuration system (whether it
> be hand-rolled scripts, autoconf or whatever).  So far I've been
> avoiding adding such a thing, because that introduces a bunch of
> problems of its own: hand rolled scripts are a pain to maintain,
> autoconf is ugly as sin, pretty much anything else is nonstandard and
> liable to introduce a bunch of extra dependencies.  But, I might have
> to bite the bullet at some point.

Ugh, build systems. =P

> Great.  MacOS support is interesting in particular, because unlike
> FreeBSD, I can set up a Travis build to test it there, which means I'm
> much more likely to catch regressions.  In fact, looks like I have a
> stale branch here that added an OSX build to the travis.yml - I think
> some of the errors you've found and didn't have time to debug them
> (debugging when your only host is indirect through Travis is pretty
> painful).

It'd be interesting to see those results as of recent. Their userland
should be similar enough in the ways you care about for the results to
likely be relevant to us, I would think.
