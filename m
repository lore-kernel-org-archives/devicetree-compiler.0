Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793557545;
	b=wOfzkRxNKSiZ5jUnGVRNo3tqxvGq0IaiVsbnY92KKGhOKa9uJC671BJJwH2xBmAeWtJY
	 0jJfzPAfCbexSF9PSewTBnQFWv8gZ/wxiag+rnBVM1FjvW0byi3DVt7gL8F5V1IQeywhG
	 4pR62VHAe7w+0r77R5AkORtJ67M/IGn2WBma74mzdPxjZrS35aDloJ6b8ATPw5T8QKirv
	 NOR2wiLeDpikfTyBjNkF2SaW9AqGALFS4avxwnFxoy5GaG++L0EtSP3bXMOSaDsWzdndy
	 PRBsd9AR7lOtwuoNuit8kDdz7bum/OtAgiOVN8mP6v7MYG2IXpVhJUI4cRSuYradE3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=eovNQxhVLF7ECnp9+cADITdIgr1cTdTsktedzS6JFoY=;
	b=P5sKulY13cD/ULfIcy7174tOytKEysBM15BpELKgOBqq3yVhOeX2xt8iNrFyvpWW1fuy
	 8+g8i6GE2zI4WRbYeSBl6g2r2Qb7atzch0L2kUJ3rk/2h+cqgtGqTa7chKlGP6Ntnk1vK
	 zoBhoFNFJOZ8jTNEW2HLkVDAHEY8QOoeRj7GJekc05MUOU31Pv/W0iUCi4w+h6jhHDmq7
	 2zilcDqV7CzfD9dvFhJZw8xv8gc8IU4PAJINvGpcrMKeLEPHjRr75YM5eWTdUhxzerEkr
	 sB1RaJh0vbHfj+KOY5MBfwzHEHkEdNey9xu8i/kpaPNemdTK8iibqIpNwQv6hnrexYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EnYIfgHO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF5E606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 18:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF5E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EnYIfgHO
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so3709255a12.2
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 10:25:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793557543; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8ICjc1Xl9EX8IH03T671eZ+2rlDtEmvWkBNcjq8ilxiCzo8f3kb32JytM+D2f+kPR
         mdOPy8F7kzO7A7RgF/FtuuXjTtse8Yh0rRqpnmdWrTZV1R4OSjQK8EBYeDGDsmZgyIEB
         a3Mv2+ZrOwCa0OOS7Z+lOCFFDquKIIZNKhZDOUINswtPpMzoRZFNy+Ng5r7Xsd9CIPVx
         zN8XXZaO7toOLuvh4mFJyFoVPDn1xl/LlAdynw2bNVfqTxKTNsOQdrV04Wxc1Gqm5AY7
         mkFWrBJSiki5XTm3yVOzk0/WAT4G4euMo8fQ1ANCFVT6MPo75ZxdvCvp/Wxm5obqaqwR
         Uyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=eovNQxhVLF7ECnp9+cADITdIgr1cTdTsktedzS6JFoY=;
        fh=rvcpfGRtnXrMO3qA4SSq56Dmi4ZrF1I+Auo33drJx6Q=;
        b=TMOi/U6EKSfaTmx2VfuIKm5yH2H0f4BbXtSkjgnie5UanU++9MRlmfY1jToy1PAyWX
         CJoO+/Xasp/GVk7Xr+KJkhgkgY0Q/ZI1zhGlb7mTHGIIat58AJxP/D5wP5D3lTRkrHQt
         E4jidLS8ed/+tIlHJrIpyLIJvU/jUfbu7rVmP38LjWnTdN9LAVv95SLlpJvbjdOFAonJ
         iHqQmiMtoMvKjXuVhwh4O28xkOx2d02sCH8ztjNuD0xfrfyhgyq1nZK1tTbe6jd7JQvr
         HWpSjOqyV9gTTN1oKfTJjyjz6acK7vLwdvzI0NDSeKt8U/DVQKB7Ma5Zl2bn3nO4yna8
         MuEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793557543; x=1794162343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eovNQxhVLF7ECnp9+cADITdIgr1cTdTsktedzS6JFoY=;
        b=EnYIfgHO7b85Hsp/3ksXEgJRIBIOsEu6INFqF4wICOBqR3WL4twTjdd20BiIBOJlOb
         fGDC0Q2Vv9qUWqEW95Y1KbdF0JReFw1FAYMXJQnGfobGnZzF7wg3CmSyfXTRp+iwbKvL
         M43Vh1uM4OhT+gkhum9QJCDh3N4R/Stf8PLo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557543; x=1794162343;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eovNQxhVLF7ECnp9+cADITdIgr1cTdTsktedzS6JFoY=;
        b=ebAgBb5e9FG4sM//RztbXzlFehLUCUmLFM7jL5k17v+Mn9eHw+raPZ7TLLXfiQTupL
         ZLcBGk+0ql0Z1JM/6HVaCYYDIsT+Im1sM/yBEK1Q1zWcE3tb5mBMXpkp5Ew9hREdOY6y
         w5GlfXy12NmZhruxdaxIZ8oAxhoqUhaGeTqPhih3ibnsGIkhZIrt/kuYhevulsRwnlX5
         eA+AeHBkxsVZ8ae0SjXzvONWkX8Pp+GPYzUqFcKV1a1Hm6PkAPYT1H9gw0wiqTWt++Uo
         4cxQ675vjUTP7c22CKYx4v5BXjOPJ3UxWpeH9eoo+trmTDfNfBz3ZK4l11r0RLxrAAlv
         reJQ==
X-Gm-Message-State: APuU4Z9sXSCIaRASSAz2ldF1/mNf8+FuqPSeo7FIj23GoCksMwQc3Mhr
	v77bSNL4KI/fXVvXqTGYGEHflNc50frRzZIcQ+jjNvCB+SD2wCkTey69GoRWPZN9xjGYD5q6Q0a
	UORe2pzN5gylNMV/LsMFNRCHavHgp+cB7LPdlwAqp
X-Gm-Gg: AYBFou1EP9J8xq8nJcOcYRfTz9R3GcaMlp18f6nnEfg2+B8DRv40VEmoQFBtan/b3TJ
	jbqKQSXWhpNLw6d/tkQYzymnsZBe/iKBB3yicuocutTOoEur64NJX/Ge1B995QjxlTKZ5sU799K
	oYbrCR4pSOJOYzVItBNnniXl3eEH2OWFgu8y0L8z8UsY2AAL2XqKTMdzcLFDrs4vJ9fPamT0YD1
	4ySn//Kt7zpusJFDR2FIOfUs8KGk8WKGu8oazQvdNPAzVf0ORomvvh2L1In++VeUpetFslBMVJ+
	wJ8XRW6WPped3q5EamICDhhKvTXg60Dc/LA/19cQ77krrbbgMAb7tfNtISzDmLDb9naqZlMyGXQ
	EKhpve8WwbrAu7pXI9NxhWrwsQsSp7dS80k+Vk0P3djKCfH9mZDqYw1bR6t7RTf35rFZlF/lS
X-Received: by 2002:a05:6402:2750:b0:6b3:cc4e:7c50 with SMTP id
 4fb4d7f45d1cf-6b4d4d7df33mr5496996a12.32.1793557543159; Sun, 01 Nov 2026
 10:25:43 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 10:25:42 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 10:06:01 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261030170602.2142997-1-ayan.kumar.halder@amd.com>
References: <20261030170602.2142997-1-ayan.kumar.halder@amd.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 1 Nov 2026 10:25:42 -0800
X-Gm-Features: AclHuK9QRjbSB8xjrVKdsoHjrWcTrt_udlQCkemA2bPCUSlkBKn99QSE2QqaN_E
Message-ID: <CAFLszTjFZ9x-O2S6AxixSC3ub_qKv+sON=2Bd=iriKc9021bzw@mail.gmail.com>
Subject: Re: [PATCH v2] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
To: ayan.kumar.halder@amd.com
Cc: devicetree-compiler@vger.kernel.org, 
	David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Simon Glass <sjg@chromium.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayan,

On 2026-10-30T17:06:02, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
> libfdt: Fix fdt_get_path() reading before the start of the buffer
>
> Asking fdt_get_path() for an offset past the root node's FDT_END_NODE
> tag makes it read before the start of the caller's buffer. Such an
> offset is not a node offset, so this needs a bad nodeoffset.

The last sentence reads oddly. Perhaps: 'Such an offset is not a node
offset, so fdt_get_path() should return -FDT_ERR_BADOFFSET'

>
> fdt_get_path() trims a component off the buffer for each level the walk
> comes back up, comparing the components it has against the depth from
> fdt_next_node(). On leaving the root node, fdt_next_node() takes the
> depth negative and returns the offset just past that tag rather than an
> error, as commit ce4d9c0f ("libfdt: Rework fdt_next_node()") intended so
> that fdt_node_end_offset_() can find where a node ends. The loop only
> tests the offset, so it runs once more and tries to trim a component
> that is not there, scanning back past the start of the buffer.
>
> Stop the walk once the depth goes negative, as
> fdt_subnode_offset_namelen() and fdt_node_end_offset_() already do, and
> reject the offset up front with fdt_check_node_offset_() where input is
> not assumed valid. Add a bad-offset case to tests/get_path.c; run it
> under valgrind (tests/run_tests.sh -m) to catch the read.
> [...]
>
>  libfdt/fdt_ro.c  |  8 ++++++--
>  tests/get_path.c | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)

> diff --git a/tests/get_path.c b/tests/get_path.c
> @@ -63,6 +63,34 @@ static void check_path(void *fdt, const char *path)
> +static void check_path_bad_offset(void *fdt)
> +{
> +	int offset, depth = 0, badoffset = 0;
> +	char buf[64];
> +	int len, i;

I tried this test against the old fdt_get_path(), i.e. with this
patch's fix in libfdt/fdt_ro.c removed (both the up-front
fdt_check_node_offset_() call and the 'depth >= 0' loop condition),
keeping only the new test. A plain run still passes, since
fdt_get_name() fails on the FDT_END tag and the function returns
-FDT_ERR_BADOFFSET anyway. Valgrind catches it, but only because the
stray read happens to land below the stack pointer ('129 bytes below
stack pointer'), which depends on the frame layout. Please can you
allocate the buffer with xmalloc() so that valgrind (or ASan) reliably
sees the read before the start of the block?

> diff --git a/tests/get_path.c b/tests/get_path.c
> @@ -63,6 +63,34 @@ static void check_path(void *fdt, const char *path)
> +		len = fdt_get_path(fdt, badoffset + i, buf, sizeof(buf));
> +		if (len != -FDT_ERR_BADOFFSET && len != -FDT_ERR_BADSTRUCTURE)
> +			FAIL("fdt_get_path(%d) returns %d instead of an error",
> +			     badoffset + i, len);

With the up-front fdt_check_node_offset_() call, all of these offsets
(misaligned, the FDT_END tag and past the end of the struct block) get
-FDT_ERR_BADOFFSET, so I don't think -FDT_ERR_BADSTRUCTURE needs to be
accepted. Checking only for -FDT_ERR_BADOFFSET would make the test
stricter.

Regards,
Simon
