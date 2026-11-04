Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805348;
	b=k8a/lS6vnmXPiUbKAAcZQdw2dE1k++hTaCNVVka7fdx7W9RV059BFxLaPycDznSp4NyR
	 NARtU0wOz8QUZNJv99gzkWH1bTZd3OkC1K4ikgfqlfnbMWK4jVX1DA8NAuD9wa41k/tb9
	 siItTInTINTQb8cGwSd/TmV4qgzqjJSYs0TnSzaAEmd5iTOrn1R8JcqGapxHFdS8OJdhO
	 f+vT0/fXth+ZUc7VS5lMXgRM16xYy9jWyPUpoguqVUacgDFkCojHxV63UqHB1QPS82aZ5
	 H+2tLPvu47R/QaWC/z71miDtBpkhzzkRSKo3AqxLBR56WoGcFtxa4Np+JMvPNFbUIBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=abLToeWwChXUHvZ7Esrpb8skFzhXdUGVODRPIT/+DFY=;
	b=qdmGtw8xM561bSJaXzgqTA2OEUCuJrC0O1j+S8ys2dg/PdI2+/4NjctpCta6KO6NbKRa
	 vTHiYXv9/65J8nwcOCL8WsGtJ1RueMev3BwYhhuSC478ZIkMg268JjswrXVLWNyDOYkon
	 VEiPmc2gVcfVylynNEgPcuba2+2Ps5eVVQmLM55WC+1DGY7+hYtiqFjTeQgIn9P7lMDIC
	 bSyWAqEPikK7ejiS46tSLHVDkahkUiXokPg+JPRH2AiRjj2nYJTGAzarjMqABo0T04XLq
	 qpqSjzt4CsaYuQQOClnyTEWfoHB/jLA1nd6j4oMpRSdrhn06Uz3bnXiWqw3hGdhFdcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FzownC6S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A28A606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A28A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FzownC6S
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c411e139259so93576566b.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805346; cv=none;
        d=google.com; s=arc-20260327;
        b=VsWFKHaxKR55joUCOrtk0KjixHkCl2lvpGpaH63E3SVOUlh14O7wDICYjzuodUZgm5
         jARVxkxoRlSKXfu2yABeUnlE8J6Srk4WsoGB2zhWV/X5n+TH0GjkbIZm2kUo50pOiAVX
         ikiHCUDHgmldBdUjlZh/wsHPCCVgPhWKHOoyJ+DKKiAvmfuB1RiR+qaN897ywHddXipR
         oEXvcIsyDcwWqqkYt7jLeIWpXjBpkwqG+QKY94LTKqrgUbZuuEcl0xpvmB9TDBTPKzeT
         GOvTdc7bWmt8o6sFgBB0lHrc7+rlPIrvFwtgAp3ra4M0Zs9tle+3ymmU+O2l8RDE056k
         MCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=abLToeWwChXUHvZ7Esrpb8skFzhXdUGVODRPIT/+DFY=;
        fh=srd9RlF+16/dPyjlTyWSZRXUPbkLZ5CDxVawIXOQn9Q=;
        b=ixRU7vmBB2MKlmQwhhKwkv+6Ueha0UzCJBmiSqci7JsebvCuYf752ZdCDEhNCqfwWb
         AEnjVUuxGP1L1QY6OSA8cdm7NlovH4L5yzVvkEWkHSDzgbUdv9u8aKthqIwSgNzigvms
         2dBeGAXw6ucJN4sB/QAIP83nbF3GcDDZlrqpR+0ai0Jl8YoRTgUkBjOrHQKFtg0j0KRu
         Gz3peL8hubdPZzgXZNd7J6Dv3su9LTnESHnIasbWRvhoJAnH73l0ZeO9J4T5g/XqVC6j
         bZDUM2JOuh7z2yEwpP6Uds4FJA0GrIOkqNGoWP+hw5OOCQKxYGKgfkJh9mf0Ki/PFwQJ
         WiFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805346; x=1794410146; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abLToeWwChXUHvZ7Esrpb8skFzhXdUGVODRPIT/+DFY=;
        b=FzownC6Sy0Ga4sy3Ue/wAHJinNvuIs+epIznr6RmwVky9Xdh0WR9OzURaO714OCJt+
         prvIyx1uWv79p+Wump356Lc4Uvds9dmCi/jkxmfonXps1TZ/Ei6zv81NunMT0EFxGDS9
         Fd0IJ5abi7XyNdC+bZ2jtjEGeAAuMXNF3XydM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805346; x=1794410146;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=abLToeWwChXUHvZ7Esrpb8skFzhXdUGVODRPIT/+DFY=;
        b=BNGaMGtH/vREdsE8Ik7NswqM4rEZjN/mAbvo7hfsFCx+QQGvc6Z83FMedMU2+sRgR4
         3ZxCzBzOkcGzXyQla87c2AUGoILRp45NadgTlfVO2zeXPO4t6KN4Vd8CGq/ueXSSVTFT
         1j98cfqhSU7hudqfs1Pm9/jdWntAkBhx1QARW71pnfeKmkYFW5yNqR+4SftWwMYWEzft
         ebPiJlHhLlKehFUgVJ/GR+pyECwaIPNyaEINYgvJdIBCW/F5SdWHw8XLb2MRDlBu6Yr4
         KwInhoGN2BbVGH9Mq+553yjcDlaikefvin+GyQUx5WAMmOUXELpmzAnsQajK2Jxgn/wg
         SsNw==
X-Gm-Message-State: APuU4Z9e7W7NuHDBzqC+zqxrQuNPA6PwEW35qij5oSEmuvt0qrBXbUzk
	A5WIokAs5itDYaO6Z7iyTFOLJlKhjeMAdj5Ks56Tig/0oWTSQFfPvgDIvSiGYLYdBsSb7QkE+Ik
	ZlkTkAAPa0k2VLpSWgftb5pF5uiBlbdANU0FMSERv1mrGTrv/xLE=
X-Gm-Gg: AYBFou2lPpMvos7g0gcEMzlsC5y3MFDdJsW033mTzM6wk9+452ZHS+1PsfsRHqakCwv
	K84aVJAQR0yz0Q1vvOmGqqJdMKIuDyQl5San5Z3WqcgJcXthhM45enRwhStlZqcB8rIxaKzLPrW
	UIuft9XNot8tPpZp55XfAxalghQOL+V1s/B/ISalbwTCyX47OPW1sl4Xv9SX67bPfkJ3uc/NjUW
	ZNv+aBTEES8N8VRZ8vgWRPsEfPgajCC3BY62pvrCCKiok3M40EfT8nq9idppwDTQoSyUTSLs54n
	BJdAO4/BkqG0RTeDD9VPZnKG+ffEd1z4ZhInwUqNcLNn3tK3Q0gVdRNatrkaOQzEYWSuHulRO8a
	wdo4vQnRdkoB2QWBcl82MPyatmlQgChqqzHH6urjeftKRdtq+g/3RQmlnTBdq47xBWAz1n3eFxx
	sPaYcsvls0UNMSdrjh
X-Received: by 2002:a17:907:868a:b0:c40:80eb:c543 with SMTP id
 a640c23a62f3a-c4ca7975914mr1477722166b.4.1793805346481; Wed, 04 Nov 2026
 07:15:46 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101163721.2458982-1-sjg@chromium.org> <20261101163721.2458982-2-sjg@chromium.org>
 <auguYCmZz3fSo3eB@gractus.seuss>
In-Reply-To: <auguYCmZz3fSo3eB@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:15:34 -0700
X-Gm-Features: AclHuK-AiCSdIFt-Cls-x21Q0Rnsg97SMNpBrFxBnqA_iIzDMQXOh8ZeAIqI4Os
Message-ID: <CAFLszTif_=NqfoBAGaP+14zT7Vbj6uE05ZrT0HQGL1wPQSTNBA@mail.gmail.com>
Subject: Re: [PATCH 01/13] tests: Check each error when merging a dts file
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, 2 Nov 2026 at 01:16, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Sun, Nov 01, 2026 at 09:36:55AM -0700, Simon Glass wrote:
> > When the parser merges the top-level fragments of a dts file, it can
> > report that a label or path is not found, or that a label-relative
> > reference is not supported in a plugin. Most of these errors are not
> > covered by any test, and the two tests which do reach them only check
> > that dtc fails, not the message or where it is reported. The merge
> > logic is about to move out of the grammar, so this needs better tests.
> >
> > Add a test file for each error which is not covered, and check the
> > message and its position for all of them, including the two existing
> > ones. Also check that merging carries on after an error, so that later
> > errors are reported too, that a reference error is still reported when
> > the parser finds another error, and that a labelled reference within a
> > plugin adds the label, since nothing covers these either.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Couple of nits, otherwise LGTM.
>
> > ---
> >
> >  tests/merge-delete-missing.dts     |  9 +++++++
> >  tests/merge-errors.dts             | 14 ++++++++++
> >  tests/merge-first-ref-relative.dts | 10 ++++++++
> >  tests/merge-first-ref.dts          |  9 +++++++
> >  tests/merge-labelled-plugin.dts    | 12 +++++++++
> >  tests/merge-labelled-relative.dts  | 14 ++++++++++
> >  tests/merge-omit-missing.dts       |  9 +++++++
> >  tests/merge-parse-error.dts        | 17 +++++++++++++
> >  tests/merge-path-ref-missing.dts   | 11 ++++++++
> >  tests/merge-path-relative.dts      | 12 +++++++++
> >  tests/run_tests.sh                 | 41 ++++++++++++++++++++++++++++++
> >  11 files changed, 158 insertions(+)
> >  create mode 100644 tests/merge-delete-missing.dts
> >  create mode 100644 tests/merge-errors.dts
> >  create mode 100644 tests/merge-first-ref-relative.dts
> >  create mode 100644 tests/merge-first-ref.dts
> >  create mode 100644 tests/merge-labelled-plugin.dts
> >  create mode 100644 tests/merge-labelled-relative.dts
> >  create mode 100644 tests/merge-omit-missing.dts
> >  create mode 100644 tests/merge-parse-error.dts
> >  create mode 100644 tests/merge-path-ref-missing.dts
> >  create mode 100644 tests/merge-path-relative.dts
> >
> > diff --git a/tests/merge-delete-missing.dts b/tests/merge-delete-missing.dts
> > new file mode 100644
> > index 0000000..b36e39e
> > --- /dev/null
> > +++ b/tests/merge-delete-missing.dts
> > @@ -0,0 +1,9 @@
> > +/dts-v1/;
> > +
> > +/ {
> > +     label: node {
> > +     };
> > +};
> > +
> > +/* Try to delete a node using a non-existent label */
> > +/delete-node/ &nosuchnode;
> > diff --git a/tests/merge-errors.dts b/tests/merge-errors.dts
> > new file mode 100644
> > index 0000000..6d3969f
> > --- /dev/null
> > +++ b/tests/merge-errors.dts
> > @@ -0,0 +1,14 @@
> > +/dts-v1/;
> > +
> > +/ {
> > +     label: node {
> > +     };
> > +};
> > +
> > +/* Each error is reported, not just the first */
>
> I'm a bit confused by this comment - I only see one error in this
> file.

I mean including the /delete-node/ and /omit-if-no-ref/ below. I'll
update the comment to be more specific.

>
> > +&nosuchnode1 {
> > +     prop;
> > +};
> > +
> > +/delete-node/ &nosuchnode2;
> > +/omit-if-no-ref/ &nosuchnode3;
> > diff --git a/tests/merge-first-ref-relative.dts b/tests/merge-first-ref-relative.dts
> > new file mode 100644
> > index 0000000..103cd1f
> > --- /dev/null
> > +++ b/tests/merge-first-ref-relative.dts
> > @@ -0,0 +1,10 @@
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/* A plugin cannot start with a label-relative reference */
>
> That's slightly misleading, insn't it?  A plugin can't have _any_
> label relative references unless they resolve within the plugin.

Yes, I'll reword that to say you can't *define* a node. dtc does allow
'/delete-node/ &{label/subnode}' in a plugin, for example, as long as
the reference resolves within the plugin. Property references work the
same way. Perhaps a node definition could too, since it can merge once
the reference resolved? Anyway, let's worry about that later.

>
> > +&{label/node} {
> > +     prop;
> > +};
> > +
> > +/* Later fragments are still merged */
> > +/delete-node/ &nosuchnode;

[..]

Regards,
Simon
