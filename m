From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Wed, 3 Jan 2018 19:47:55 -0600
Message-ID: <CACNAnaGEV=YDFsLbGBN+O68dJnDXeRwd0YaXWb2u3x1rSdkF8Q@mail.gmail.com>
References: <20180101041518.23806-1-kevans@FreeBSD.org> <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
 <20180103025856.GL24581@umbus.fritz.box> <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
 <20180103035510.GO24581@umbus.fritz.box> <CACNAnaGwpwRO27d2trLBqZjtiZYP1HBP=ck6GJ2N8VrTNehnFw@mail.gmail.com>
 <20180104005407.GS24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104005407.GS24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jan 3, 2018 at 6:54 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Jan 03, 2018 at 08:03:27AM -0600, Kyle Evans wrote:
>> On Tue, Jan 2, 2018 at 9:55 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > [... snip ...]
>> > Great.  MacOS support is interesting in particular, because unlike
>> > FreeBSD, I can set up a Travis build to test it there, which means I'm
>> > much more likely to catch regressions.  In fact, looks like I have a
>> > stale branch here that added an OSX build to the travis.yml - I think
>> > some of the errors you've found and didn't have time to debug them
>> > (debugging when your only host is indirect through Travis is pretty
>> > painful).
>>
>> It'd be interesting to see those results as of recent. Their userland
>> should be similar enough in the ways you care about for the results to
>> likely be relevant to us, I would think.
>
> I rebased and tried it again:
>     https://travis-ci.org/dgibson/dtc/jobs/324587391
>
> Looks like we're getting problems with the interesting way I (ab)use
> the assembler to produce a test blob.  I've hit a number of problems
> with that over time, so I'd really like to replace it with something
> else.  Unfortunately, I haven't yet thought of a replacement that
> wouldn't be a pain in the arse.

That's interesting- I wonder what version of LLVM this maps to? Or are
they so far gone that it doesn't matter? We've got an effort over here
going to replace our system linker with LLD; the version of LLD that
we're optionally using on -HEAD right now has no problem with this:

$ ld.lld --version
LLD 5.0.1 (FreeBSD 320880) (compatible with GNU linkers)
