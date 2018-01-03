From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Wed, 3 Jan 2018 08:04:52 -0600
Message-ID: <CACNAnaHW19kCE24KUpi2LFNUS94H2xajq6WWpi0NgY53FAymzw@mail.gmail.com>
References: <20180101065945.65451-1-kevans@FreeBSD.org> <20180101065945.65451-2-kevans@FreeBSD.org>
 <20180103054220.GP24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103054220.GP24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

[Resending with a proper mail client, because it didn't go to the lists]

On Tue, Jan 2, 2018 at 11:42 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> Regardless of anything else, these two patches need different one-line
> summaries.
>
> On Mon, Jan 01, 2018 at 12:59:44AM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
>> Currently, references cannot be made to nodes in the base that do not already
>> have phandles, limiting us to nodes that have been referenced in the base fdt.
>> Lift that restriction by allocating them on an as-needed basis.
>
> Hmm.  I'm a bit dubious about this.
>
> - My feeling is that one of the problems with the overlay format is
>   that it's already too free, allowing the overlay to change
>   essentially anything in the base tree.  So I'm not that keen on
>   making it even more free.
>
> - An overlay can already add a 'phandle' property to a node in the
>   base tree.  Can you use that directly instead of adding a new
>   mechanism?
>

That feels like it might be a bit difficult to work with, for a couple
of reasons that might be logically wrong, so forgive me if I'm
thinking wrong:

 - A phandle is just a number, so it won't get adjusted as overlays
get applied. All of the overlays that one of my boards needs to apply
would need to choose sufficiently high phandles that they hopefully
won't conflict with other overlays, especially as new nodes get
introduced with their own phandles.

 - If more than one overlay needs to reference a specific node, we
have other conflicts. These overlays aren't necessarily related, but
they would need to agree with each other on the phandle of the node OR
make sure they apply in a specific order so one can add the phandle
and subsequent overlays can reference them symbolically only as
intended.

The problem is that these overlays aren't necessarily curated by a
single authority, so conflicts with multiple overlays trying to
reference a node is scary. Ideally, we'd like these things to be as
usable as possible for average Joe Blow.
