From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Overlay syntactic sugar clarification
Date: Mon, 8 Jan 2018 23:36:57 -0600
Message-ID: <CACNAnaFASS-1dC4Vp7JbwEjtF0vbAxOP248AtPabPLhZ_MHVoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello!

I see the syntactic sugar patch was merged in late September this
year. I have some resulting questions:

1.) Are there plans to deprecate the handcrafted fragment syntax? I
find it somewhat useful for hacking things into /soc (via target-path)
for development since this node is often not labelled, so it's
probably a good idea to ask this up front. =)

2.) Is it expected and/or OK that the output/behavior of this dtc(1)
gets kind of funky when combining handcrafted fragments with these
generated fragments?

"funky" ranges from outright errors to silently merging a handcrafted
fragment into a generated fragment in a way that yields an overlay
that you're definitely not expecting. If this isn't a supported
use-case, then I suppose this is OK.

I ask because I recently implemented this syntax into our BSDL dtc,
and naturally in my work I had it generate fragments for these nodes,
merge them all into one /, and renumber any handcrafted fragments
based on their position and the "fragment delta" (highest generated
auto-fragment at that point).

The reasoning being that there's likely no good way to merge a manual
fragment with one of these auto-fragments, and with our implementation
is was almost easier to do this than it is to just discard the
handcrafted if we start out with the sugary versions.

Thanks,

Kyle Evans
