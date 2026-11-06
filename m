Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793970367;
	b=IV6z7QMi/AJsupQR5PACr4hdoVSTkb1Lo0HtM4hc6fGRZl4NI7+D4MHbjzcdNwZtz2St
	 Ncviq+a7qB2Yg3AG6F96KCYhBqI9rSi7OmdwZ9IoyFDB2NxdZfKjHzo6Xm32S7/MrF+bi
	 KO5YuqcSE+HFeCpJZiKv/QBlewEmuyeruYIOy0C71NuAzpog6MjWfhgBQDJEyjT1TLX6g
	 z/J2l9IEUI6JHK1s9Cl2wShQP/6FWgA+JzVcZqblZfIC66/1KESaXODmmjsOBixMtaWWI
	 SZDQZCtt/WTn6TpILWwkwKlBH04HPKDCkH6maeZyNCUwONJFik60TMPYAOPbleM9pSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=liROFxAscGhnc+b9yzy0y8HLqCbVwfNaDFSgHU3Zr9I=;
	b=sw0MzrPyVvCQqAaoPlmd0Twh9/EKrvn3vEOQ8DpxM52epphA4LX8zSNgX3CkLv7BQtok
	 QPelk2/SsCskSwdKctxuD7aeSj81O0/P8Z5UaxZvjZ+Wor/yrMNUbKmSjmBVs6/6owWd5
	 o4oSHOnWprdSVlXBjjWYwyGnxtLBiJ+EyOwFaptof3OE17z+OA9smwBHV9KZNeWskXD7L
	 sBgQURVk6s79hDmgGiZ9ldKfWFqISwzVFqXjH+r98ZgDLQN1d/sqG4vZUU9umiMAkBuRd
	 Q153kU/UTu6Cj7c2pcMUxkKCqozjc3stIhy523CTDY0G47z3LgVIf+Df7XI7OmJihSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QtAs7Fe0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27556606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 13:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27556606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QtAs7Fe0
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3fd91337baso109257766b.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 05:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793970365; cv=none;
        d=google.com; s=arc-20260327;
        b=kUCqMWMSApyQBi42Mash8cxtyeuvsCJL9ScGgkXJf1qAEOjgkqPH3KBk88zANNuSRf
         THLsbpTYDTutjYj/0EvXWtaLZWpRvGENnl7uK96Bthj4Ajsx62mpahH+6LFMbUT9tuhF
         2kHCUopewIsJYSCHSlLj/ZtQKYCqzw7fMIaqrNek3TaWfuVK8KTly7xlQslB4c6YHnoF
         WJJV7bB0QBrVxrQ2TJfSZDxuyjE3oHy9Y7Key/cGmEa01MmE+r7/yHitne8Tyqv1UV89
         1eqEzw7QTCRNHwD15WfQ/mt7iclU0sV5sMtplR//W7BOI7I/DPA5kEKefpfJ2TfWAQLJ
         pP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=liROFxAscGhnc+b9yzy0y8HLqCbVwfNaDFSgHU3Zr9I=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=PuFs6683KTXHPyG20ghcNj5spXkiukmYjz1WXLAZvVJfU5466LMCMQdwepIHJzGQ8K
         e13Fg6GBQsRm6k7NcchnH/shN2O9bwmsCaFlx3vatqjJTjQ7zZiDq+0tPSrqXO62qwF+
         DTlTyqJsE1UCWUYkhqbfjOCCQ5QuWGT86ISKqCPJMKNjj0B6n/4c8oNZ5ah1AlfH5J1r
         POSIzUP88dy9KrRJ5GKch4x0yB1n6Q+f4BGQZzoPOZjVVA3G/V7pJ+u5ka/FT3sPIgJ2
         d4PCxZ9ceLPpezU7bHUw7xErF8N+YNJPNVspTecbmBpZFe9q2VGk1F07fV1R+8lkBswm
         RijQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793970365; x=1794575165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=liROFxAscGhnc+b9yzy0y8HLqCbVwfNaDFSgHU3Zr9I=;
        b=QtAs7Fe0EFb+QwL4zO1MoMk8iDssAeFW66vnBsftjOgFxrnxvRRKLS9w4DngwSsqyC
         V1CQ5g/vJ9Q7WD2oDH/G1sia2VNh9rnadrGRPfW0MsBjXcMkGyOdF+a5xiMdCK4lf9x4
         OAQ1OSTxrcwljcmD6+nnMzoAON0Jv8LfHr7uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970365; x=1794575165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liROFxAscGhnc+b9yzy0y8HLqCbVwfNaDFSgHU3Zr9I=;
        b=KqptpdKWqo6k68RzTRxVQNAZ4vaZEGwIVnckW6ERudsI5M5ZN2DEK+7hUHpyO9rSvf
         6tUZUVZuDerlRP28Llqc+D2pcSIgVTjPrIFCov4ky9hOUAlJDT32klbOK2Al8VKC7daR
         UB3DqRU2h/k3HqJny9TbGGsE/F4jf2qwA8pUGBYvO4uf4friz9dnFkWXVRTUqi5IyYXN
         GPKd8UvfvP2FESJ3Nj2sJinepIh4g3MBGYxXaD8XzrPIH8IxAyJ+f7GHnjj9xXU4rz+B
         U4fsYFch4iXX5exxwIzyuPU7xmgQ+qVLlHelLYMTl1AJmZ8GcMVNUPGt0Wx7QlyIBCZD
         wPcw==
X-Gm-Message-State: APuU4Z+20vDg96HkDAbyGV2adIvqRvp7/KVxM1JNDZI9p65nLdj9k7IV
	Eyy4WPMr5piMs/HR52X4eCuFuxPO+Ef1FrDurZ+dwnFKKapvlz3iKj+2FK9WecXcPxFVMwxkQ2+
	zfO6VJK4grieMRoAT0I+U3QQG7ckJApcGFK1jdHiM
X-Gm-Gg: AYBFou0n6D5iYGSIF4olvmECD6ePswTQQ1CQDz9rN9kIzSnz+PAOjnWub1UxJQANdSu
	wXRAwaMQbMQzo0zECHvJxPJYTEQTmrfwMNIv6wdk6iVNlroMn+HplsaTJzB1A7A6tL5qeFQTdDe
	5kAJ2q/Oc7jA0v8sTYbz2qAsSddP04nZ2tswkRrWX7ZyQp/BRn1LkxfyVej0nmPMWtOtppfNDK1
	oTXihPDgzFagdTN6FwtA+hIPX0is47U+dS4P4ChU7CRfFZErOARFbA6AcYpSigXjuwYw/ewwZsM
	68jDBr0/+UluGX5rQLOh5/r1yASuUteWEusnANu7o/9fccmsFhS6UehfX+dj5bQR7Hjv2kUGHFn
	HLOxQO0e6QNEq69cDBEJ43CrLv4INcYleO0oCMbRnvcCjimbSSNb1HIl/BwtbN6fgLnuJ464=
X-Received: by 2002:a05:6402:4024:b0:6b6:e8cb:642d with SMTP id
 4fb4d7f45d1cf-6b6e8cb65f2mr658101a12.8.1793970364715; Fri, 06 Nov 2026
 05:06:04 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104211807.972610-1-sjg@chromium.org> <20261104211807.972610-8-sjg@chromium.org>
 <20261105100714.47bf0434@bootlin.com> <CAFLszTg4tSr7+zJb35efy12TfMWiXc8xujcceL_H+_eGzqW-5g@mail.gmail.com>
 <20261106075641.0fd421ab@bootlin.com>
In-Reply-To: <20261106075641.0fd421ab@bootlin.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Nov 2026 06:05:52 -0700
X-Gm-Features: AclHuK-1m4Wug98e-755-Rvm6uTt1MUryMtlLJvFfngPbahP4SYHrFKaKE6EAlg
Message-ID: <CAFLszTh4do1Yf0FF7LH3OpF7aOpKXpNN_fHjm0_VOY+7yLN8nQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] dtc: Move label-reference handling out of the grammar
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herve,

On Thu, 5 Nov 2026 at 23:56, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Hi Simon,
>
> On Thu, 5 Nov 2026 14:49:45 -0700
> Simon Glass <sjg@chromium.org> wrote:
>
> > Hi Herve,
> >
> > On Thu, 5 Nov 2026 at 02:07, Herve Codina <herve.codina@bootlin.com> wr=
ote:
> > >
> > > Hi David, Simon,
> > >
> > > On Wed,  4 Nov 2026 14:17:46 -0700
> > > Simon Glass <sjg@chromium.org> wrote:
> > >
> > > > The grammar action for a top-level &label { ... } holds its merge l=
ogic,
> > > > including making an overlay fragment in a plugin when the label is =
not
> > > > found.
> > > >
> > > > Move it into a new merge_ref(), passing it a struct fragment for th=
e
> > > > reference and node.
> > > >
> > > > The output does not change.
> > > >
> > > > Assisted-by: Claude:claude-opus-5-5
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > ---
> > > >
> > > > Changes in v2:
> > > > - Rename merge_label_ref() to merge_ref()
> > > > - Build the fragment in one step, with build_fragment_ref()
> > > > - Return true on success from merge_ref()
> > > > - Check the fragment type with assert()
> > > >
> > > >  dtc-parser.y | 23 +++++++++--------------
> > > >  dtc.h        |  1 +
> > > >  livetree.c   | 26 ++++++++++++++++++++++++++
> > > >  3 files changed, 36 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/dtc-parser.y b/dtc-parser.y
> > > > index 9b9b6db..c58a66d 100644
> > > > --- a/dtc-parser.y
> > > > +++ b/dtc-parser.y
> > > > @@ -214,21 +214,16 @@ devicetree:
> > > >               }
> > > >       | devicetree DT_LABEL_REF nodedef
> > > >               {
> > > > -                     struct node *target =3D get_node_by_ref($1, $=
2);
> > > > +                     struct fragment *f;
> > > >
> > > > -                     if (target) {
> > > > -                             merge_nodes(target, $3);
> > > > -                     } else {
> > > > -                             /*
> > > > -                              * We rely on the rule being always:
> > > > -                              *   versioninfo plugindecl memreserv=
es devicetree
> > > > -                              * so $-1 is what we want (plugindecl=
)
> > > > -                              */
> > > > -                             if ($<flags>-1 & DTSF_PLUGIN)
> > > > -                                     add_orphan_node($1, $3, $2);
> > > > -                             else
> > > > -                                     ERROR(&@2, "Label or path %s =
not found", $2);
> > > > -                     }
> > > > +                     f =3D build_fragment_ref(NULL, NULL, $2, &@2,=
 $3);
> > > > +                     /*
> > > > +                      * We rely on the rule being always:
> > > > +                      *   versioninfo plugindecl memreserves devic=
etree
> > > > +                      * so $-1 is what we want (plugindecl)
> > > > +                      */
> > > > +                     if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGI=
N))
> > > > +                             treesource_error =3D true;
> > > >                       $$ =3D $1;
> > > >               }
> > > >       | devicetree DT_DEL_NODE dt_ref ';'
> > > > diff --git a/dtc.h b/dtc.h
> > > > index 8c4d7bf..9b4389b 100644
> > > > --- a/dtc.h
> > > > +++ b/dtc.h
> > > > @@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(=
char *ref,
> > > >  struct fragment *append_fragment(struct fragment *list, struct fra=
gment *new);
> > > >  void free_fragment(struct fragment *f);
> > > >  bool is_ref_relative(const char *ref);
> > > > +bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
> > > >  bool merge_delete_node(struct node *dt, struct fragment *f);
> > > >  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> > > >
> > > > diff --git a/livetree.c b/livetree.c
> > > > index 3ff4e14..179866d 100644
> > > > --- a/livetree.c
> > > > +++ b/livetree.c
> > > > @@ -573,6 +573,32 @@ bool is_ref_relative(const char *ref)
> > > >       return ref[0] !=3D '/' && strchr(&ref[1], '/');
> > > >  }
> > > >
> > > > +/*
> > > > + * Merge a fragment which refers to a label into the node with tha=
t label. In
> > > > + * a plugin, a label which is not found becomes an overlay fragmen=
t.
> > > > + *
> > > > + * Returns true on success, false on an error, which has been repo=
rted.
> > > > + */
> > > > +bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> > > > +{
> > > > +     struct node *target =3D get_node_by_ref(dt, f->ref);
> > > > +
> > > > +     assert(f->type =3D=3D FRAGMENT_NODE);
> > > > +     if (target) {
> > > > +             merge_nodes(target, f->node);
> > > > +             return true;
> > > > +     }
> > > > +     if (!plugin) {
> > > > +             srcpos_error(f->ref_srcpos, "Error",
> > > > +                          "Label or path %s not found", f->ref);
> > > > +             return false;
> > > > +     }
> > > > +     /* The label may be in the base tree, so add a fragment@N nod=
e for it */
> > > > +     add_orphan_node(dt, f->node, f->ref);
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > >
> > > Even if this function is slightly modified in later patches, I think =
it mixes
> > > two different operations:
> > >  - Merging fragments
> > >  - Converting fragments in overlay output format.
> > >
> > > IHMO, those two operations should be fully decoupled.
> > >
> > > merge_ref() or any other operation whose goal is to merge a fragment =
should
> > > only merge fragment either in the existing root node or in a previous=
 fragment
> > > available in the fragment list.
> > >
> > > add_orphan_node() should not be called from a merge_*() function rela=
ted to
> > > fragments.
> > >
> > > After merging all fragment we should have a root node and/or a list o=
f fragment
> > > reduced to unmerged ones.
> > >
> > > Base on that, the overlay conversion can be performed using a dedicat=
ed
> > > function, out of merge_*() functions.
> > >
> > > Something like this:
> > > ---- 8< ----
> > > void convert_to_overlay_output_format(struct dt_info *dti)
> > > {
> > >         struct fragment *f;
> > >
> > >         if (!dti->dt) {
> > >                 /* The root node is not present. Create an empty one =
*/
> > >                 dti->dt =3D ...;
> > >         }
> > >
> > >         /*
> > >          * The fragment list have been previously merged.
> > >          * Available fragment left in the list are fragments
> > >          * that cannot be merged and so those fragments are
> > >          * orphan nodes.
> > >          *
> > >          * Convert those orphan nodes to the /fragment@N format overl=
ay
> > >          * format.
> > >          */
> > >         for (f =3D dti->fragments; f; f =3D next) {
> > >                 add_orphan_node(dti->dt, f->node, f->ref);
> > >
> > >         /* Add __fixups__ and __local_fixups__ nodes ? */
> > >         todo();
> > > }
> > >
> > > in main():
> > >
> > >         /* Parse input */
> > >         dti =3D dt_from_*();
> > >
> > >         checks_pre_fragment_merge(dti);
> > >
> > >         merge_fragments(dti); /* <--- Fragments are merged.
> > >                                *      Remaining items in the fragment=
 list, if
> > >                                *      any are Orphan nodes (i.e. frag=
ments that
> > >                                *      couldn't be merged).
> > >                                */
> > >
> > >         checks_post_fragment_merge(dti); <--- Orphan ok for overlays =
but ko for !overlay dts
> > >
> > >         /* Convert outputs */
> > >         if (dti->dtsflags & DTSF_PLUGIN) {
> > >                 convert_to_overlay_output_format(dti);
> > >                 checks_overlay_format(dti);  /* <--- Not sure it is n=
eeded */
> > >         }
> > >
> > >         /* Generate output */
> > >         dt_to_*();
> > > }
> > > --- 8< ---
> >
> > I tend to agree - we are heading in this direction.
> >
> > But this series is meant to keep the output the same (apart from the
> > &{label} case), so I would prefer to do the split as a follow-up. I
> > just filed an issue for the overall effort here:
>
> I don't see why splitting merge and "overlay format conversion" changes t=
he
> output.
>
> This series could split these operations in two distinct functions.

It's only very minor. For example:

/plugin/;
&foo { mine: x { a; }; };
/ { bar { }; };
&mine { b; };
&foo { c; };

This series will have bar between fragment@0 and fragment@1, but with
this change it comes before both fragments. I think that is fine to do
that, just that to my mind it fits better with step 2b of David=E2=80=99s
plan, where each fragment is wrapped in fragment@N after the merge.
There are a couple of other corner cases too, which I'm looking at.

Anyway I've got a patch for your change and I'd like to put it at the
end of the v3 series, since I am trying to move code largely unchanged
out of the parser, avoiding behaviour changes as much as possible in
this series. Does that sound OK?

Regards,
SImon

>
> >
> > https://github.com/dgibson/dtc/issues/201
> >
> > What do you think?
[..]
