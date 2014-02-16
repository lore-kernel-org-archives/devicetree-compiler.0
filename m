From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [0/10] RFC: A new start on richer dtc expression support
Date: Mon, 17 Feb 2014 00:19:31 +1100
Message-ID: <1392556781-7743-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jdl-CYoMK+44s/E@public.gmane.org, 3fa55604225d40864c30a8b17d0dac60b2384cbe-mnsaURCQ41sdnm+yROfE0A@public.gmane.org

So, we've been talking about richer expression / constant / function /
macro support for dtc since forever.  So far attempts to start on that
haven't gotten very far (in large part because of my pickiness about
new syntax).

Anyway, I've started having a new crack at this.  This patch series
implements the infrastructure for "runtime" evaluated expressions.
For now they're just constructed and immediately evaluated, so they're
not quite usable for user-defined functions yet, but it's a big step
towards that.

10/10 is the only patch in this series which implements new
user-visible functionality, the rest are just internal reworking.
10/10 experiments with the new mechanisms to implement string append
and repeat operators - I'm not 100% sure if I'm happy with the syntax
used for this yet (overloaded + and *, like Python).  Suggestions
welcome.

This is indirectly relevant to the schema checking concepts current
much discused.  Any schema language is likely to want richer
expression support than we currently have to be useful.  In addition,
I expect we'll need data structures very similar to the expression
trees implemented here to keep track of schema "patterns" or other
pieces.

These patches can also be found in the 'expressions' branch at
git://git.kernel.org/pub/scm/utils/dtc/dtc.git.  [NOTE: I'm
considering this an experimental branch for now, which will be rebased
at whim].
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
