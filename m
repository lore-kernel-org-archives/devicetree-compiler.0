Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806208;
	b=TRSGgte27x7CCPPlbZ2Kxp21olH+AOWxZoRnOlW1Kzd8f7M/QUUerq2MQ/nDith8qYLK
	 UOA6t7aspQjdw/HQZrod1J3Vhx6dDyKYw5iiz77QSegfV/dHWoMEvKHoDmgoQcVuLrea/
	 PKlEv9kurSVUXLEctTh3erELTwEHMjK3zYq/zOxfrclogIvgkayKTItfgHyB3tOa3je4R
	 8QN58wD+uJ39YDsBW4Vqy1sJkrLXIdF8DYdbCEeTy7hncHXBWjtBsKD5agiuB/KA2upDl
	 ZhRvvcoAnHGA3siD9uet+GawOukmOXFN1AotnGi2kgSQCcCDSIHkD8f64kv0NL1myPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
	b=KSSOYMX2sj+9uH/wQByeXZ8GW8rewSvNdN7OtFhrGT+AawzOC5NsWa0IKk7xLLpSDS1o
	 ofmnfJsaz18T+U7Ph4M4w1BetV62f4KXCQIxgkuvUyNyl7ze+8rG7H+62nm27/+WhHk0u
	 aWHN/5K3gD/oz+TKVtvWDyvYGybLw23jzVX3RBHBfFpx1ZVBds0O4VZSblznLlsSyXA34
	 KR6D1p0zhOyQ4OD+rMXWoe5iJ041F6J/4FrE2sX8BwwPXHTK0xLdmrSWZsEGaExObdbvf
	 Mu83M5nHlsRIsupIXspPwBwLpcTyOpgjaHN+ACT67FoTB1VNkBb0FYB7LuLAlncwFWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B4NHfTIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F62C606A32C
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F62C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B4NHfTIu
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so1192415ad.1
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793806207; cv=none;
        d=google.com; s=arc-20260327;
        b=isjmVUpCfgmdHiHsfFWmCXvp0Y96CMmp1dNDIKuCwGsHigbqgt+prBsNEzzofdHQ5G
         JQ8+OxugWSt06/Cuoj33JbqXGTLR3lEcOpW4J5IT4l+5/K5rnmHCFhegkvbbI2coIjE7
         Z1s5py9Skas7RIag1k2FE0Vwt3pnvkS7xHfPiD0gzUOrfZeGxu3PDwkMraZjpfnLpv/9
         ajMYELIj3SyiOwWnPiKSqp394hVUJ7kUcR0qVsB4OQT/4jgKn7fTzmL/VuLWRR2OLnsA
         JoHbzxpXqjAGfzfF59G4Kt0L9Mu3rmDK88NFn0/Mns3PmsAfD/0kFB/bXEk9BcC7wDO+
         Y4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        fh=OS5E4iogK9XO6HZ5HU7AD/BA7NwtvS2CKR4artam0A4=;
        b=f2ko/3iFMgpRzEJ21jmSNnq2H30wL8BJx7EskfzgcufDWUa73X5khjerFLOMlZzV8P
         BZcsiLCboUHSkGCx16983cvxioMmD2zAWancHOtdk60NQ3GbbnlU6pjVlcrqjI6yaLA5
         xJEJdAMaCH4doAQJTtosismpdiYBzFYf9l6DrEWrmzRCbcJD4Ll9/sUtOhlqWhwuLpug
         Ln9NTa9uT3lrPcLxWd9IDC61ysQu9XIWNXx+FPr0eYFhbFQJa1hjsT+vgss1OsBXSel+
         2Qgz38571T5rPYOU/mm2yiAlMdqj6f/0RCG0uc3H6B48VNyAYPPQ3PAYxWvqV2UD4zvK
         wwXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793806207; x=1794411007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        b=B4NHfTIu7W5Ik7sQdP4RN5hm0J86+FR85I04AzBg7ypd2fJn9pxo/7ZX93dGZsY9kl
         Rp3qinlS41/vaPrpdVn+ECCfZv8Gek+jndUktyAnem1TxUETpQpUkPg9xgD0lJHCLy53
         5tUQne+vcfegt7vRg915Sm7j7KAIkmt+IZb+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806207; x=1794411007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        b=lRiXkxNNWDbyH7tFpm1+tbjNvvPFChA7vZEaiWTcwPwD2aiZMIMKSibU46l4aoF2GQ
         QHTrXEx9+C7RQRJXLALB794gfBzAC3zmHjcCe0UwBz5x8bk3OyIk221RUQqbkPxdCWnl
         6hwDUd3vV3mGVo4ycpdEIrVh6xqtOuef0J/rI5rqGBjf1HM4zluFsxottjpKC7AWfEJX
         5DJWLaCQi5zR8Kq0WSyI06wVRjbLcIstfyQUdfRJhsT/XLw0GhwyTx/rrc7IcpnFPwOT
         VhibftocFgRVesbB9czsMhiK2L+JKJXyFGbWBhrLMm91SaQPe9+TjgZ6vNMO/3Ksemf5
         OBIA==
X-Forwarded-Encrypted: i=1; AKwUvBxPtMLJgfQ948dILVilMueUwFUpv0Apacwtc4+ujGrGDLz29rK25qeIyjuDYl9zm2BB4NJ8Braj98fNK0GS/zSnrXBV@vger.kernel.org
X-Gm-Message-State: APuU4Z+WUAmjiDLSFfWpD3PbBnIjrXnH+8KQhRvdkERlHVwpf6MJIuGY
	V04thzueMIm25DnEkvPtoaZRUOPXOUfbxD5BGmwlPYRjr55XkKtF1TtBqtlqn0QcbO5kUSLB0Pz
	V/gIOwH63fY4XjV15PJM2gRziBRqCHDh7/hJi90KC
X-Gm-Gg: AYBFou1h6QWJQgsdnDG8vE4/NyDBOYBvkG5YDFI24mf1CkopY2c5DLh8OhsRIfCiZgq
	TqW7+Hi1CrFWTHZYPOAvO+oARIopEzJ/L63zr9ypwuxiR4sM9nddDWQ+oOmOPr2gQjwn90v/48C
	ylf/1j1m65yvsceZwMEwLO1sDAqTE+5oGXNU6wgn1NwK3WsgPC9Y/59Otd8a7oTjOTMGDmoWg1v
	9E5lYiciXwqw5TZQ0vmlbH2F6v71eEda3wpAe2Epg5iCavqosgDPRB+aW9HBiDbEtFw/6ZSWKG/
	tWS4r2Gsr7xpXRTE2Mg9ryfbK3t6b0kVxoFoBNtBE6NrP9JOUZS+D5EDi+p+//MQ6OcJFxBbRii
	GwDacY2bC168d2xrpnuS5sRc74dO5W2msAKjKhde9J7XRhABhATo2bUHPiwWfeKrfIxuxqULO6M
	Oc1bXfQ8ZSjE9Arg2m
X-Received: by 2002:a17:903:38cf:b0:2ed:1c15:ffc0 with SMTP id
 d9443c01a7336-2ed1c160464mr6880415ad.30.1793806206581; Wed, 04 Nov 2026
 07:30:06 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-3-dianders@chromium.org> <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
 <aufr7SA1BO7zDQws@gractus.seuss>
In-Reply-To: <aufr7SA1BO7zDQws@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:29:51 -0700
X-Gm-Features: AclHuK-zfu9STJuyYWXUh5dKQ38KfyI8wl9OSEqKb4q455Uo0fKzhQBe9ijm_bI
Message-ID: <CAFLszTgpzC_z21mBpOGwFvEvy0LLxCJmUTFnst5g+1pM7BpEjw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: dianders@chromium.org, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sun, 1 Nov 2026 at 18:49, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Oct 30, 2026 at 07:50:17AM -0500, Simon Glass wrote:
> > Hi Doug,
> >
> > On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> > > pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
> > >
> > > Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> > > properties, and memory reservation entries without manual offset loops
> > > or `-FDT_ERR_NOTFOUND` sentinel handling:
> > >
> > > - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
> > >   of `nodeoffset`.
> > > - `properties(nodeoffset)`: yields a `Property` object for each property
> > >   of `nodeoffset`.
> > > - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
> > >   all entries in the memory reservation block.
> > >
> > > Assisted-by: Gemini:gemini-pro-prerelease
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > >  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++++++
> > >  tests/pylibfdt_tests.py | 18 ++++++++++++++++++
> > >  2 files changed, 63 insertions(+)
> >
> > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > @@ -201,6 +201,23 @@ class FdtRo(object):
> > > +        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
> > > +        while soff >= 0:
> > > +            yield soff
> > > +            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)
> >
> > Since Fdt inherits this generator, a caller can easily write 'for off
> > in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
> > offsets move under it.
>
> Right.  I noticed that, but merged anyway, since you can basically do
> the same thing with the existing interfaces.  By abstracting it
> further, this interface does arguably make the problem worse.  This is
> kind of a perennial problem with the Python bindings.  The libfdt
> interface is shaped by what is and isn't possible with the flattened
> format - the reason we insistently name "offsets" everywhere, rather
> than just "nodes" or "properties" is an attempt to inculcate the right
> mental model.  By abstracting things more, the Python bindings make it
> easier to miss that.

Yes that makes sense, and noted.

>
> [Aside: one of the many projects I'll probably never find time for is
>  to write a Rust-native libfdt, where the ownership model could be
>  harnessed to enforce many of the required invariants]

Yes we talked about that briefly last year I think. I haven't
seriously looked at it though, apart from some experiments with
ownership of an offset. I have dug into Rust quite a bit but I'm sure
there are other people who would do a better job of this.

>
> > Since David has applied this, please can you
> > send a follow-up noting in the docstring (here and in properties())
> > that the tree must not be modified while iterating, as with
> > fdt_for_each_subnode() in C?
>
> Right, adding a comment is probably a good idea.
>
> > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > > +        leaf = self.fdt.path_offset('/subnode@1/ss1')
> > > +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
> >
> > The docstrings say both iterators raise FdtException for a bad offset,
> > but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
> > list(self.fdt.properties(-1)) raise, perhaps alongside
> > testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
> > same follow-up. Since these are generators, the exception only appears
> > on the first next(), not when the method is called.
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >

Regards,
Simon
