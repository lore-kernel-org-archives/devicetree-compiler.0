Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794872996;
	b=RRhitaGtoX2kHbGf/My/meLUvBBUMXPGhWPANmXObG9EzxkaSGhGaylV+7ozUb9y7uYz
	 HvLotFgazAHbo+LBKNeyzSYdv0R4jCgnhzwRJhacsNIZjyK6cvl/XA58pEwYpGGd+R1NK
	 U4Q1DlDL5uzcY8JXHOs+vhl8v7DxLlyXNuPSD7aT83GEGbKdMN0ygI8BuQcmv2Jtd1W2o
	 B7v9MSZYDLMucrQ+zmtmFMQa67RWBIzFIZYIJeLYzUiscsz5DlW518DhcnwVmPUq7XJ3t
	 hD+VRzGt2aemK/bWcLa+Ny7ZQvI3mfC+zweqAEaZ1lABENWmCB2GvhgF3iOWgnAd8AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=zAFA2XEJhPercE7X1Qk+/DDqQijobUwzhel6OYEhYwQ=;
	b=mit5tPBLFHJNd2Zr21M9FlEYqXpzK2IAp2f6kEI6/ekjWr+lwT+aK3AcsH5/tGaV1AV5
	 SXRBT3fSN0wxJJWE5o9FXWX3gzxId99ikQJ3nnenZQnWyyp0x1tn0S5ZRqADdMRtcyxk/
	 KgPR4sTYqO0xDwf10++B0i2sqN44k1ae4xU5yHOLD4oROrr/9V0noSC/wmCaC8bZvaUZ1
	 Ecf4DnQ06epDHRI4YoGxnkCyfboaEvqfiCL2Bpsh5XPAmnjK2D/8vl+g6olLdiDRDJa2z
	 e5ZFnnVVYyI5vqCqz9biaFPDIcKcarJ38PZFsXMFIjC4tUvqghTnb7diswhL9GTKiXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="ig/m0mBI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC57606A31C
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ig/m0mBI
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso2248587a12.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:49:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794872994; cv=none;
        d=google.com; s=arc-20260327;
        b=SGK61hZijhJ/GyeAJMYPodkN9QIU51gbt1Kxw3oKE9/TcUnex18rntJW5AjpX7r+Nw
         LH+5luoy1K1WmXOgxzwTynXvWuVkkjih4mTKkv+ySNyQuBVyu77yDuMerz0rWzHA5m1B
         4/m3P6uUXCtXXHK6Q/Fw31u13h/kLn9DxnI11gp6TTFdXC+9wc2CWKfFu/0mATrkWIHy
         dMR4b74GqKbyy67YAtUCHt1GLBPTjIJY2RXwraaSCQb9Uywrq5UaRl02cugqF4rLilME
         fDyJqxEqCHS6hJqfRwpdlMj3i4liZkAxGtlwNw4inx51oiZQbfC1Gpz6X1bVx+ZTRErW
         qPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zAFA2XEJhPercE7X1Qk+/DDqQijobUwzhel6OYEhYwQ=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=eW6nvqyzm1Gf5Xq9Qm59c9OGSUem44OCMmzuxLThpxFreYMnyJTpFBLsaKhm52pS5j
         IXMfUbQryRm7sh+fGd4SkAKuCU6pnSDSVbzZb0+TA4Gb/mviYUAb3iV24m8n0XKSsfHG
         dVHSMflA/UVUu/589EvzuN2CkkdPBtUHEXLQkOZF/2QHxhvHotqitiFTdkMD+L1iyG1S
         iavFEjruOJt0jxaGUEQsL8Wcz12TCF1Xvblfh61K6VwoZGOEX+l65MLJxXGiu1qAuPIr
         157FVPNgCzfaZvlebAmNEpo6nCW44+n5++6NWUKK87tlu3HKBGgafSH5TRLi43c8Ug3R
         Fspg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794872994; x=1795477794; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAFA2XEJhPercE7X1Qk+/DDqQijobUwzhel6OYEhYwQ=;
        b=ig/m0mBIxQ5j1vQOxL6jxAdkQIdEKxgz7P4YH+RRsBc/a1svdxiP/j+tMjH+XcZ5UX
         lqsCq9+aomKkCulrUPRpXz3dlPlMGgfmI85Xwc8mOqWjl46e/vhHMteLkoqBX7GiAPX2
         sKFcYdF4eSbDhKqCUrLL0OYHrh2sdR6/rZ9qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794872994; x=1795477794;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zAFA2XEJhPercE7X1Qk+/DDqQijobUwzhel6OYEhYwQ=;
        b=pl3a9rsR6gdoqdaW86eeCx9bdrumO2g9Vmpd00wp2WX6cj/cGSRjs5XOt2mJUsPxZC
         DmnfOGg2T7bMJ2qonb1/VGUUogkoLJB/QPGT9up/lI/hx8OeNoNIBn30wul+ZBnTkbjP
         GbY7qLea+JzY7GCwGlw5JR4738aeVbwHDdXuEzcW6CfJHQi/5NG+OF2jkloEuA3x75mz
         eaD3Bp0GgpCKmbCE924Iiw1ZYaodMWTFr7RMqznn/KrPRbf1da0jaG1TKOxD3IakvcGE
         dNOgv8l8ceXTq84C6yVbneZb3J+Wz3uSsZtg5vpXLflTA2GDijyyxWf8OgiYgNb3J5iC
         e1pA==
X-Gm-Message-State: APuU4Z/NJpuW1fX1HPUodgjNX6+7nbAAfGDju2a3zs69yijHT6a5UsMQ
	buV/AR8XKU7Ch4Y4Iudh1bYCuuEyKrp30FcGUxMom3lTd7S9ClNUK47iuQ06+Qp4stDuQa8F3PK
	e2U8fc6aFzTxn57ZbzB3rS0L5iSINbyNgDBF5mHlr
X-Gm-Gg: AYBFou37aZ8E9wcY1ud6g8zsNH92SprPOE6pvxBFA07f6tGD8hE8Xf8CJcdCOar7g9s
	k8dUkbVt+ajf03wHqnPNJ0gcegMUDskVPg5oxDlzIsUUrav7cNHybV079yjoY3dhgJQVRmYV2zc
	wQxbQNHfoVE6A/yU8f3V0ekukivcLNhD7VoDqAKiHNprdJQFnw5Lfzm1KwJRe6Q+F5MP1hWU+i3
	5oABKeE8BlQU4WDiFr9PeLAd7DsMy6hTuAWPbgJNlhBdh58HBpwX5ZqpLJs3wVJQNaZ4Dh8TF0y
	HZnOJa0TaiYq5I4YGwfTieS5xSoeF8OgAWMxZmpky7FpQ0gzeSUeNHcovhUppM/yufKqXaaeKCa
	FleN8gjKwd/rRjlNhPFJbHagStTYW66PV8sk1lcAaYQ/MbB0ZawgP6hwla7WYNaMgVmBN+ds=
X-Received: by 2002:a05:6402:a506:20b0:6b5:4f5c:cba with SMTP id
 4fb4d7f45d1cf-6b7c0bddae2mr5734591a12.18.1794872994238; Mon, 16 Nov 2026
 15:49:54 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106195159.2623314-1-sjg@chromium.org> <20261106195159.2623314-10-sjg@chromium.org>
 <avaNYs7ZU6bLDy2h@gractus.seuss>
In-Reply-To: <avaNYs7ZU6bLDy2h@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 16 Nov 2026 16:49:42 -0700
X-Gm-Features: AclHuK8-vW0HcMDsDySMkomsD1JmmRA_PiY2OxuiXznkvGqhtWv5MOj_ddHYnvk
Message-ID: <CAFLszThKSAWmf-DWaHztT9aCK6yNrHgObcusRW9XuJOZ_8QKKQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/18] dtc: Move path-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Thu, 12 Nov 2026 at 21:09, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Nov 06, 2026 at 12:51:36PM -0700, Simon Glass wrote:
> > The grammar action for a top-level &{/path} { ... } holds its merge
> > logic, including making an overlay fragment in a plugin.
> >
> > Move it into merge_ref(), which can tell a path from a label by looking
> > at the reference, and use a single rule for both kinds of reference.
> >
> > The output does not change.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - Combine merge_path_ref() into merge_ref()
> > - Combine the rules for label and path references, using dt_ref
> >
> >  dtc-parser.y | 27 +--------------------------
> >  livetree.c   | 33 +++++++++++++++++++++++----------
> >  2 files changed, 24 insertions(+), 36 deletions(-)
> >
> > diff --git a/dtc-parser.y b/dtc-parser.y
> > index 3614d71..3ec9254 100644
> > --- a/dtc-parser.y
> > +++ b/dtc-parser.y
> > @@ -191,32 +191,7 @@ devicetree:
> >                               ERROR(&@3, "Label or path %s not found", $3);
> >                       $$ = $1;
> >               }
> > -     | devicetree DT_PATH_REF nodedef
> > -             {
> > -                     struct node *target = get_node_by_ref($1, $2);
> > -
> > -                     /*
> > -                      * We rely on the rule being always:
> > -                      *   versioninfo plugindecl memreserves devicetree
> > -                      * so $-1 is what we want (plugindecl)
> > -                      */
> > -                     if ($<flags>-1 & DTSF_PLUGIN) {
> > -                             if (is_ref_relative($2))
> > -                                     ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
> > -                             /* A path is in the base tree and a label may be */
> > -                             if ($2[0] == '/' || !target)
> > -                                     add_orphan_node($1, $3, $2);
> > -                             else
> > -                                     merge_nodes(target, $3);
> > -                     } else {
> > -                             if (target)
> > -                                     merge_nodes(target, $3);
> > -                             else
> > -                                     ERROR(&@2, "Label or path %s not found", $2);
> > -                     }
> > -                     $$ = $1;
> > -             }
> > -     | devicetree DT_LABEL_REF nodedef
> > +     | devicetree dt_ref nodedef
> >               {
> >                       struct fragment *f;
> >
> > diff --git a/livetree.c b/livetree.c
> > index 179866d..2e9a3b2 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -574,29 +574,42 @@ bool is_ref_relative(const char *ref)
> >  }
> >
> >  /*
> > - * Merge a fragment which refers to a label into the node with that label. In
> > - * a plugin, a label which is not found becomes an overlay fragment.
> > + * Merge a fragment which refers to a label or path into the node it refers to.
> > + *
> > + * In a plugin, a path always refers to the base tree and a label may do so, if
> > + * it is not found. In both cases, the fragment becomes an overlay fragment.
> >   *
> >   * Returns true on success, false on an error, which has been reported.
> >   */
> >  bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> >  {
> > -     struct node *target = get_node_by_ref(dt, f->ref);
> > +     struct node *target;
> > +     bool ok = true;
> >
> >       assert(f->type == FRAGMENT_NODE);
> > -     if (target) {
> > -             merge_nodes(target, f->node);
> > -             return true;
> > +     if (plugin) {
> > +             if (is_ref_relative(f->ref)) {
> > +                     srcpos_error(f->ref_srcpos, "Error",
> > +                                  "Label-relative reference %s not supported in plugin",
> > +                                  f->ref);
>
> AFAICT, the fact that we can't encode label-relative references in
> .dtbo is only relevant in the case that we can't resolve it locally.
> So I think this should go within the next if.

Just on this one, it changes changes behaviour (a local &{label/node}
would be merged rather than rejected), so I think it is better as its
own patch, with a test, in the next series (the second half of what
was in v3).

>
> > +                     ok = false;
> > +             }
> > +             if (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref)) {
> > +                     /* Add a fragment@N node for the reference */
> > +                     add_orphan_node(dt, f->node, f->ref);
>
> Pre-existing, but what will add_orphan_node() actually *do* if given a
> ref it has no way to encode in a dtbo?

It adds target = <&label/node>, then dies when writing __fixups__ with
'Can't generate fixup for reference to path &{label/node}'. The early
error gives a position instead.

>
> > +                     return ok;
> > +             }
> >       }
> > -     if (!plugin) {
> > +
> > +     target = get_node_by_ref(dt, f->ref);
>
> You can leave the get_node_by_ref() at the top, since it's used in
> both branches.
>
> > +     if (!target) {
> >               srcpos_error(f->ref_srcpos, "Error",
> >                            "Label or path %s not found", f->ref);
> >               return false;
> >       }
> > -     /* The label may be in the base tree, so add a fragment@N node for it */
> > -     add_orphan_node(dt, f->node, f->ref);
> > +     merge_nodes(target, f->node);
>
> > -     return true;
> > +     return ok;
> >  }
> >
> >  /*
> > --
> > 2.43.0
> >
> >

Regards,
Simon
