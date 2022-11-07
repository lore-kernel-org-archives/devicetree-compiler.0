From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
Subject: Re: [RFC] libfdt: add fdt_alignprop
Date: Mon, 07 Nov 2022 13:52:22 +0100
Message-ID: <87bkpjvse1.fsf@miraculix.mork.no>
References: <20221106141247.867853-1-bjorn@mork.no> <Y2jCPhdETrPDojh8@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1667825542; bh=JKKytHFFlP6eu+tBDnmokPQPBiPKbZDnc27z/tE8dpQ=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=CkMulc8vZWL1bgfKvFOy6Ef2UoPFTmvB3GH4ZkvYPpvQPUXokS83NhP8L0iKPzxoK
         GNg/v/FriADb5flLNb9O7Q9kPsGDvO9Jx+vWYVuvwUY8Vvqa5zb6C7nFdJsa7/m/zt
         QfpYGSDS5/9nsmNrcoFgmfjePHanGb/G4W0Vaff8=
In-Reply-To: <Y2jCPhdETrPDojh8@yekko> (David Gibson's message of "Mon, 7 Nov
        2022 19:30:54 +1100")
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:

> Adjusting the positioning and filling with nop tags is a clever idea.
> The main concern I have about it is that it's pretty fragile.
>
> Calling fdt_alignprop() with align the property you requested, but
> could unalign any property that lies after it in the blob (even in a
> wholly unrelated node).  So if you need to align multiple properties
> in a tree, you have to do it in order, which is a somewhat unnatural
> mode of using libfdt, at least with the higher level functions.

Yes, there's an underlying assumption that aligned properties are
processed in order. I guess this should be part of the docs.  Or does
it prevent the creation of a high level API altogether?

> Such alignment is alsonot likely to survive processing by other tools
> (e.g. dtc), or indeed using any other read-write libfdt function.
> Essentially alignprop calls would have to be done as just about the
> last step in fdt preparation.

Yes, depending on property alignment is fragile by design. No doubt
about that. It will break with any sort of normal processing like
reordering etc. U-Boot discourage the use of their "in place" fdt
feature for good reasons.

But the feature exists and is in use.

I guess reliable alignment, regardless of tool, would require some hint
inside the blob?  That's unnecessarily complicated IMHO.  At least for
FIT images/U-Boot.  Any sort of manipulation by dtc of the final FIT
blob is out of the question anyway.

The FIT spec includes a signing algorithm which absolutely must be the
last modification of the blob.  Another unfortunate design...

FIT signing works by hashing sectons of the binary blob.  A more robust
way would have been an ordered list of properties to sign, similar to
DKIM email header signatures for example.  The FIT hashed data even
includes FDT_NOP tags. So any sort of normal manipulation, like
reordering properties or injecting FDT_NOP, will "break" the blob from
the U-Boot consumer's point of view.

To make things even worse, the signatures are coded as variable length
nodes, inserted into the blob at a number of parent nodes. I'm currently
signing twice and re-aligning in-between the steps.  The first step adds
signature nodes with their final size and order.  Only then can we
calculate the proper alignment. Last, if aligning changed the blob, then
we have to re-sign to update the signature nodes.  The order and size of
every object is constant in this last step, fortunately.

dtc can be (and is) used to prepare initial FIT images.  But it cannot
touch images after mkimage is finished post-processing them, whether or
not we add an alignment policy. Only mkimage can do that.

Which is why I believe it's fine to have the specific FIT alignment
policy coded into mkimage, and not stored inside the blob itself.

That's the background for my simple best effort proposal

> Given that, I wonder if we could come up with some interface that
> enforces - or at least encourages - that use mode alone.  Maybe some
> kind of finalize function that aligns every property that needs it
> (according to a callback, maybe?) then finishes with an fdt_pack().

Yes, this would be great. I just couldn't come up with any working
proposal.

But I don't think it makes much difference for the U-Boot case.  Users
manipulating FIT images with dtc will be able to mess up.  I'm happy if
I can make the mkimage tool safe for FIT images. And fdt_alignprop() is
sufficient for that.

If someone has generic use cases, then the picture is different of
course.




Bj=C3=B8rn
