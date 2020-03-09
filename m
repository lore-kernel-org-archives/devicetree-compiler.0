From: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Subject: Re: valgrind tests don't test anything
Date: Mon, 9 Mar 2020 17:31:00 +0100
Message-ID: <20200309163100.GA15388@comp.lan>
References: <20200308183221.GA10025@comp.lan>
 <20200309082920.GF617846@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200309082920.GF617846-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Mar 09, 2020 at 07:29:20PM +1100, David Gibson wrote:
> Uhh... I don't think it's accurate to say the valgrind tests don't
> test *anything*.  They're not checking for leaks, but they're still
> checking for use after free, use of uninitialized data and so forth.

Ok, indeed, sorry, my fault.  I should have said that valgrind tests
do not check for memory leaks.
 
> I'm actually not particularly concerned about leaks in dtc, because
> it's a strictly short runtime transient process.  You can think if it
> as using the OS process as a rudimentary pool allocator.  Leaks in
> libfdt would be a problem... but libfdt doesn't use the allocator at
> all, so they're essentially impossible.  Between those two is probably
> why I never enabled the valgrind leak detector.

Ok, I see.  As a sidenote, --tool=memcheck is the default option for
valgrind so it could be removed but it's not a big deal.

-- 
Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
