From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Tue, 2 Jan 2018 21:29:14 -0600
Message-ID: <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
References: <20180101041518.23806-1-kevans@FreeBSD.org> <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com> <20180103025856.GL24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103025856.GL24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jan 2, 2018 at 8:58 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> Fwiw, some years ago I did a bunch of work to get dtc to compile and
> pass the tests on FreeBSD.  Working out of the box on *BSD is
> something I'd like it to have.  Unfortunately, because I can't easily
> test on a BSD machine, the BSD support tends to bitrot rather rapidly.


Happy to hear this. =) You're not too far off, fortunately. This, the
alloca header situation, and an -ldl in tests/Makefile.tests are the
only obstacles to being able to do a simple "gmake && gmake check"
here. I've submitted patches for the first two, and as of r320872 [1]
we provide a libdl on -HEAD.

I will likely submit a patch in the near future to use `stat -f %Uz`
automatically if stat --version exits with a non-zero exit code or
indicates that it's GNU stat(1). This should cover the *BSDs, to
include MacOS.

[1] https://svnweb.freebsd.org/base?view=revision&revision=320872
