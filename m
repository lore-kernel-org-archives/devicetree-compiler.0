Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716252;
	b=sjdCV46jppxDEZAGCmSgu5l+lk316HRatowM436bCVJlm8LTiKBscY4RT0pmPv3lKL8H
	 eHBHSqRgmPUUBWyV901wturgNqzGapLGS/LV3o1UbMTIdK34SNPJP2pcm6+FZ8HLEKlmO
	 NPTyXJMLSGefkYikJbZOuuPktjM/8D7pqXGe4OseUK9Nt+hCSbN2oLKMgExs3arjr22qk
	 vqeRjKH0p5AuQbzF5YKhPFgCm2U5hEXjCExnMLqgwYL8ML57M32pvG+IiSnxvTYrIvMdh
	 h9KWHyU8lLBXl1I0pNbNqITjgB3H13knQISp6LqbaJkeZyoPB7plwHvPjHpruLnQn/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=PtFx+v97BVVhkt5j+ZvOF0ILZ+5yGrBD/B/mv6pbUhc=;
	b=I8sTToGDqQIG1vvwrN2dFMGRCHbCC+UzuF+hNUr6yS7FZS4ptRNurguP1Dpm2EhjxObJ
	 m62NrwE27k8og1MkQceEAX3308oJ60WrDM7PZ0CqgJdGZL4JyBWS4h4/heZ5gXzwNs05J
	 PtbD1i9tUyTCjam0L+CLZp0Tw8MR9t9iGYjWeF5eBaZIskZPUET1AkOPyRxX0cYU1efpO
	 FiDeqPRTMvkJOB12AG6RCrDj6tfJyU970zfwr/x2FQACR4qCPm2GjOv97H4u6Kxhx8Rb5
	 WmMz1Q2aToE9E+C0jsvheocs1WhvMswOOxgDwj7OcY1gkOQ5cWhjKIlRz7TS27MeT8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="QL/VBqIM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6368C606A323
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6368C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QL/VBqIM
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so8258458a12.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795716251; cv=none;
        d=google.com; s=arc-20260327;
        b=GUXA7C9eC/ztBS0i6MFBbxpnopeVvXsuzol0EpuUIBljLOs/g3KmL2b83kxWe8RIAF
         51vF8/xfCE3PJw3mhsOCJ0xl1QiZZXnKavR+D4/KwSAPTnhM2VICxsEsfmxJhmjLC79/
         DBKWmDNEkAxiasciXMM10c468mkY3jbujHfvmsnLbuc91dM3NWe1LccWqROVglt+t6Co
         uU2oXZOd1LgIrvo2cPExqTZTkEL5Fh/uHLhxI1BBCuvLuaeHMky++d0o/OYEC/avw4MF
         In87G86OBaagSGjlctQsHmxDQLfYcO38jNZgVCLYr3zJ/uMAPMiU3zNkRxNhhRB1EuLt
         RNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PtFx+v97BVVhkt5j+ZvOF0ILZ+5yGrBD/B/mv6pbUhc=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=klaYSwAGWuX/eFAfcpttA+GR8RodReTrcxmjmM/Cqgfwsu6rJDML1ObO3IhWJEhYy9
         QICo92lo7PbgRHyvbAbEJ7M7tm0UIuKXVLQiPY5Q5i3hSZgtP/QguLS9g27xgxcwIKoU
         /I6/BdtujiK10a0gS15kTuh77KtHV9wQiQ9yFS1dQj9RmgiJUsKLkERWs4J0S2SxcDkT
         slMFXvaYoNRyzO//QMgdokrlHi8MGK7yG3Q0p1u/OChohcLSUYXu2LDrEZHVdDWj0lBn
         H5XEhUpq62tQanae0Hm2PUiaKILLtN6jLK4TKD1XfZZxXVKduklUIGpPkWRLyfRhp7nC
         VPNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795716251; x=1796321051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtFx+v97BVVhkt5j+ZvOF0ILZ+5yGrBD/B/mv6pbUhc=;
        b=QL/VBqIMeOA7j0qsHGcKc813Efej+++HtMbNOw5WwWWhhSO7KOAHzdT427a6hW7x0b
         A2y2RZt/F58T8l49C3JG9cIiRsBe5fifE3BJ2EEZ8PsA+EB0+mg9lSR0Knd1JwK5TYQY
         iDpaDohfVcctkSk6iETcpCicGo5JOUVzli5Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716251; x=1796321051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PtFx+v97BVVhkt5j+ZvOF0ILZ+5yGrBD/B/mv6pbUhc=;
        b=1rrwUm6qAZYnYV7EUlj1gLHcwL5M4FbO4M1cBM3Y3n9+GBOdM0p9/POLgAjPIfPovG
         IE4jSMFFBRUPhNvePAw1OqAndqF/QrI5weMPanDiDd/oaNzjrNFDqlRMflkCfeynsW6E
         GbzXT5pATTJ//pVyzovc2X0PamDwl4hWNTRM4K0qFhsDlkack/X3PQbYWftDHbMgwyXg
         W8F+qbAoEcRz8h8J39WiMXXK+lHwXyUfaGchvCPP1Uu3/UsV9Q+1c2CegDfawxcYd5NY
         8dpRquTHc2hcNpb/TU7CFcw68s49AYslo0W3p032JmKZk15unuo7+tXZ8X+wkA+4jhYh
         QrEg==
X-Gm-Message-State: APuU4Z85cm7wd0xp8brtvpFG5Aqh54ZLlxxBpLXr9UmSCsdFbEfokSdg
	sZnN8xUu4Sw1bnXMQunALflVqLPvzBIB3Zvqc+WJ8i2RBpMA0FgTT8Fp/4+CJiHY6At5AuDAXzt
	D56e3AH35/HtcQC0SII/FB+D5MJm1ty9OkKabOyy7
X-Gm-Gg: AZFdTZeqZovifpOWXVnuw+9AhfKwXK3okIZjBNw0wPQqU8K2qvAk1NhoMsG/FoNsZyg
	j+iQn8h6bhtxJNaOfH9JeVDo0VTdcgIa2ljOlGUGWvMSkQiU4D4E5saPIUaZizQt8dgb8pc7VkP
	BY+lqqX2K6uY17OG1BHx9+J+SbD+ixM+gax4Lvwsk6Iv5Ay6+dE8qGpj8WU48RuwLWSWBRiaOKW
	N0tiFwHGqb2J+ZlXRNZ2mAOCzP35mwYv+cqqL8IlgMz026XvbCgO1/FAJbT2zq9oLijuiOTL+xn
	LJ21pGmzgNof+C2wSuWAD0j9glP+8giubGKuXeOdcv7scVxr1C5k+PTR44f5doTztQN3kvqhLv4
	bgrU1xIHZ3kpbvLLcU+CcH+wyE926uE8fJwQ/BoCDxO3ZCK/cTLJ52DbKBD0+L5LNWPmiDKOSRE
	FwjxtsBtMCnvUni0qp
X-Received: by 2002:aa7:c68d:0:b0:6bb:6d98:2408 with SMTP id
 4fb4d7f45d1cf-6bb6d9826a9mr968352a12.19.1795716250698; Thu, 26 Nov 2026
 10:04:10 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116235813.935070-1-sjg@chromium.org> <20261116235813.935070-3-sjg@chromium.org>
 <awYvRAeiVSO9f0ls@gractus.seuss>
In-Reply-To: <awYvRAeiVSO9f0ls@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 26 Nov 2026 11:03:59 -0700
X-Gm-Features: Aa3M54q8XahXCKOsScGtC2lMtObJpB6nX2BQz_OY_BjfAaCRxmZTNOGNOtH4C2Q
Message-ID: <CAFLszTjS4nTAn2bKioqsFYXdm7+KeLioWd691A-Mm6GbQH7k9w@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments of
 a dts file
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 24 Nov 2026 at 18:00, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Nov 16, 2026 at 04:57:56PM -0700, Simon Glass wrote:
> > A dts file is made up of top-level fragments: the root node, later
> > definitions of a node by label or path, and /delete-node/ or
> > /omit-if-no-ref/ with a reference. We would like to deal with each
> > fragment on its own before it is merged, for example to apply deletes
> > consistently or to run some checks on each one, but that requires
> > keeping the fragments apart. At present the parser merges each one into
> > the tree as soon as it is parsed.
> >
> > Add a struct fragment to hold one which refers to a node, with a
> > function to build each kind and one to free it.
> >
> > These are not used yet.
>
> After consideration of our previous discussions, I'm leaning towards
> using the term "source layer" for these top level components (thanks
> for the "layer" suggestion).  It's more verbose than I'd like, but I
> think disambiguating from dtb level "fragments" is worth it.

I really like that! Will update.

Regards,
Simon

>
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Apart from the suggested name change,
>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>
> > ---
> >
> > Changes in v4:
> > - Drop build_fragment_root(), append_fragment() and the next pointer
> > - Drop label_srcpos, since the position of the reference is enough
> > - Shorten the comment on struct fragment
> > - Use 0 rather than '\0' in memset()
> >
> > Changes in v2:
> > - Add a constructor for each kind of fragment, taking all its fields
> > - Add the list to struct dt_info later, when it is first used
> > - Change the subject from 'Add a list' to 'Add a struct'
> > - Drop path_ref in favour of checking the ref for a leading '/'
> > - Replace FRAGMENT_ROOT and FRAGMENT_REF with FRAGMENT_NODE
> > - Use a NULL ref for the root node
> >
> >  dtc.h      | 33 +++++++++++++++++++++++++++++++++
> >  livetree.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 85 insertions(+)
>
