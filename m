From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Wed, 3 Jan 2018 10:51:23 -0600
Message-ID: <CAL_JsqK+ySbuCC27sSQ+VJg78n0m_QOTHQ90ur5pwahyBoU0Dw@mail.gmail.com>
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
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Jan 2, 2018 at 9:55 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Jan 02, 2018 at 09:29:14PM -0600, Kyle Evans wrote:
>> On Tue, Jan 2, 2018 at 8:58 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > Fwiw, some years ago I did a bunch of work to get dtc to compile and
>> > pass the tests on FreeBSD.  Working out of the box on *BSD is
>> > something I'd like it to have.  Unfortunately, because I can't easily
>> > test on a BSD machine, the BSD support tends to bitrot rather rapidly.
>>
>>
>> Happy to hear this. =) You're not too far off, fortunately.
>
> Good to hear.
>
>> This, the
>> alloca header situation, and an -ldl in tests/Makefile.tests are the
>> only obstacles to being able to do a simple "gmake && gmake check"
>> here. I've submitted patches for the first two, and as of r320872 [1]
>> we provide a libdl on -HEAD.
>
> Ok sounds good.  I had a look at the tests using -ldl and it looks
> like they couldn't easily be adapted to avoid it.  However, I'd be ok
> with logic to skip those tests if libdl isn't available, if you want
> to broaden support to older releases.
>
> At the moment dtc seems to be just teetering on the edge of being
> complex enough to need some sort of configuration system (whether it
> be hand-rolled scripts, autoconf or whatever).  So far I've been
> avoiding adding such a thing, because that introduces a bunch of
> problems of its own: hand rolled scripts are a pain to maintain,
> autoconf is ugly as sin, pretty much anything else is nonstandard and
> liable to introduce a bunch of extra dependencies.  But, I might have
> to bite the bullet at some point.

What about meson? All the cool kids are using it now.

Rob
