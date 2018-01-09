From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: Overlay syntactic sugar clarification
Date: Tue, 9 Jan 2018 10:50:08 -0600
Message-ID: <CACNAnaFYrbu-=FT+h6TAkzzY-iH4nPvMPAhfqX-nuzEM6oUJbw@mail.gmail.com>
References: <CACNAnaFASS-1dC4Vp7JbwEjtF0vbAxOP248AtPabPLhZ_MHVoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACNAnaFASS-1dC4Vp7JbwEjtF0vbAxOP248AtPabPLhZ_MHVoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Jan 8, 2018 at 11:36 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> Hello!
>
> I see the syntactic sugar patch was merged in late September this
> year. I have some resulting questions:
>
> 1.) Are there plans to deprecate the handcrafted fragment syntax? I
> find it somewhat useful for hacking things into /soc (via target-path)
> for development since this node is often not labelled, so it's
> probably a good idea to ask this up front. =)
>
> 2.) Is it expected and/or OK that the output/behavior of this dtc(1)
> gets kind of funky when combining handcrafted fragments with these
> generated fragments?
>
> "funky" ranges from outright errors to silently merging a handcrafted
> fragment into a generated fragment in a way that yields an overlay
> that you're definitely not expecting. If this isn't a supported
> use-case, then I suppose this is OK.
>
> I ask because I recently implemented this syntax into our BSDL dtc,
> and naturally in my work I had it generate fragments for these nodes,
> merge them all into one /, and renumber any handcrafted fragments
> based on their position and the "fragment delta" (highest generated
> auto-fragment at that point).
>
> The reasoning being that there's likely no good way to merge a manual
> fragment with one of these auto-fragments, and with our implementation
> is was almost easier to do this than it is to just discard the
> handcrafted if we start out with the sugary versions.
>
> Thanks,
>
> Kyle Evans

To be clear, I've tarred up three example DTS [1], with simple targets
and property changes to demonstrate what I'm talking about. Files with
the .reverse suffix have been added to show the results so that you
don't necessarily need to compile/reverse them yourselves, but feel
free to do so of course. =)

example1 merges the explicit fragment@0 with the &a node appearing
before it, clobbering the target to &b from the explicit fragment.

example2 is a "working" example; &a takes the fragment@0 as expected
and is merged with the root from the explicit fragment@1.

example3 has fragment@2 explicitly defined, then later &d tries to
take fragment@2 and dtc throws an error about the duplicate
definitions.

I don't expect this will be a practical problem for anyone, just
thought it should be noted.

Thanks,

Kyle Evans

[1] https://people.freebsd.org/~kevans/gpldtc/examples.tar
