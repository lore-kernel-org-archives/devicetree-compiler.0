Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570685;
	b=hjmX7mdpdU8aIcGsYI5E//QBCfhXrn1/qV1Jhwz9MAi0d0GdqNlA5H6hdXzGmuxDrn22
	 NOaIgZkzj1QL6/O9JCGO0rlp30Bx9sPeJDPvDm+tyZjN01Rb3IeMK1GqMN6uZMAf891j9
	 Df0CBYnWvWFGhjqASrDbFaWXRxwSZohsu0EAwH6qicEs7SgxJYEVcepo16AVOUVFpHQu2
	 HxlbdSBgXoGCLb4iNun0bCAXzHb9uue1xPke0HtmYwBKnWAC9WInClI9y8vI/hzu5wjic
	 fZ1tAZTYy/eHh+EaxPoVLkdWMp25QIx1NNm+ZMyZBFHpq607y8sfP/rg/j4ym/QLcVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
	b=0in4QRncWrzMm6YNHHfb3XSskD6RZ6LkesI9gBV6reLrq6XHbzOZEJ6Akc6dJyQb1x46
	 3A//VdS9f9oarVMmfv4EcVTCv1bGKE6fzilWo3jo1smERaWmVrbjzANX8g41bc7Fh6Ge8
	 qC8lUyKGptsxNZThku83onJgxpF0xjhBREJTVVFkoLOGDikdSB1xEWTSftgG49D9Rzpto
	 9aKetufiyLB3obeh8Bo5B/gJcxrwyOEuf0eo2UTLUDvvxCePpRP/gCC4GdSTTdVAarK23
	 T20aoaRqAUTBuXIClldb51/Am/afdHl54dEOcLMIx8h7NwdqF+IDIiLdIRwzdK0/CgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QpcXpZEO;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D3606A326
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QpcXpZEO
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c434376dbebso490661566b.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570683; x=1794175483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
        b=QpcXpZEO6efkiiQpo/4ffnHXfgr3mYTYUaYihbw3pmtcbzH08TZqChB4y97jbKLoQg
         QUKuqblPWtTp2KXhcak66EvVffVoIKsXpbRKb0GSsH3SYFHCI8a/Qfjx2622W67Zk8hN
         3F+h3GmdpaVfX6Zf0MceJVtuLrv7yTKquMA0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570683; x=1794175483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
        b=N8Ab5J9gZmbuAQWNGEjnHElsIypuaKu6x8a0mZNkQBYcxUi9vcee1q6zPVeT91xmKj
         kN2oeIb1VYlk4CEGXAh5oxk7ZgP8G/StwpZann2Y0u0Exvm/Z935reh8OrUzFzngNd7t
         vvch388Md93wHzsQ9d4fHrYoS7R1zfoA2ANgKoomPuQthTKrewsF7LAXzr0Bw5/SmoOL
         1wbw2tw0Ube+j8O124r4rhtrdTBfsZ3mbupP7agfYl3Mv6FH82l0dZJ+sNe+pTCEuezm
         rt9GI06wrQnsFD7ATuBezvD55d8LSJmhQflC5yX21WrwBVCuSdp3tN3CmaNj1F8x35Po
         Wyqg==
X-Gm-Message-State: APuU4Z91TgLxBq/VOHsLfIZxn+smPv50KBYXkd7XuJ4JozOGXv0pKwll
	g4N3Kbs3k6V+1/lZqvNbiE/hULqwRYpWH/dEhjX1O7r2P9a/IU4ljPophhFv5X0oPgHfewiYP6F
	WQCFSLMZc
X-Gm-Gg: AYBFou1fLFTmQG4bETk00FVxY0NUkCEeYnd2N3qvnJ9E6BcqxFLVGNGZKHAorA9T4IN
	lPRxK4glavmUFffhY+o+jbBjRiADmYDMVk4aXNAZacxlvhz9RIkfI/Yqjn7MDHlVCV1W1iJAe4N
	WzzY/pHeb25AxP6VLWeRTxTq+45ctLR3OyFdv32mW7BJl1qegZGurmDj4rOY4FsoM9VVGG/9vNf
	XzBcVLX0fmfItcRj3JaN4pLyiAxnz5lzQvlbS4idHpW7LwQ+Cc6z6ZTt6qH0CKkPItXpO49nXXQ
	1oSuzrBFjNfK04w0lUByUq5UqI+P8nyTsBAZ8rPq45HdlLkBgjfKVF09U1Y2zKbjsdvXpX7O9Qe
	p449PL21YO5J/n1wTOSggeOEBq8OXrcDeulALXL/SR9v/qoRvPCBBtBB+nJtqLGMEOwwPcYc/XX
	PyAUAh7d43MRrOw4IJiwPlgo0n8g2Z/+T+qD6Bjd3saCL9WI8Yye8tzBDwF/ESfuzg8IYku6u44
	akcdo5wZcOpgGcEKxz8Fo4hN80ztw+AaJEOTnWM2hUfbl5yXnj/0WuD15JOGzG5djkVmZdqGQID
	xWNzOp45QrFc4DZYXg5E760jRrcJhEF6GftvCdaF0WikzaVMBON4vptk+sLAw+OixXQ=
X-Received: by 2002:a17:907:7206:b0:c3e:2224:1b86 with SMTP id a640c23a62f3a-c4ca795565dmr722918266b.2.1793570683215;
        Sun, 01 Nov 2026 14:04:43 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm318731466b.33.2026.11.01.14.04.42
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:42 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1960969f8f.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:42 -0800 (PST)
X-Received: by 2002:a05:6000:4910:b0:48c:69b3:6114 with SMTP id
 ffacd0b85a97d-48e6494c24fmr30421734f8f.3.1793570681174; Sun, 01 Nov 2026
 14:04:41 -0800 (PST)
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
In-Reply-To: <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UZahH27Rb+JrGpuPxxmnOAt3-DvZ1u32TzN9jJftOoeA@mail.gmail.com>
X-Gm-Features: AclHuK-0PMyh2gGf_SdepdjlMGJUnYCAlvxR2gqZjB6i5LECjAnzzbSqRkU6NPI
Message-ID: <CAD=FV=UZahH27Rb+JrGpuPxxmnOAt3-DvZ1u32TzN9jJftOoeA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -204,6 +204,23 @@ class FdtRo(object):
> > +    def subnodes(self, nodeoffset):
> > +        """Iterate over the subnodes of a node
> > +
> > +        Args:
> > +            nodeoffset: Offset of parent node to check
> > +
> > +        Yields:
> > +            Node offset of each direct subnode in order
> > +
> > +        Raises:
> > +            FdtException on error (e.g. invalid nodeoffset)
> > +        """
> > +        soff =3D self.first_subnode(nodeoffset, quiet=3DQUIET_NOTFOUND=
)
> > +        while soff >=3D 0:
> > +            yield soff
> > +            soff =3D self.next_subnode(soff, quiet=3DQUIET_NOTFOUND)
>
> Since Fdt inherits this generator, a caller can easily write 'for off
> in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
> offsets move under it. Since David has applied this, please can you
> send a follow-up noting in the docstring (here and in properties())
> that the tree must not be modified while iterating, as with
> fdt_for_each_subnode() in C?

Done. Added a patch in v3 ("pylibfdt: Clarify iterator docstrings and test
negative offsets") noting in both `subnodes()` and `properties()` that the
tree must not be modified while iterating.


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > @@ -243,6 +243,21 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > +        self.assertEqual(
> > +            [self.fdt.get_name(n) for n in self.fdt.subnodes(0)],
> > +            ['subnode@1', 'subnode@2'],
> > +        )
> > +        leaf =3D self.fdt.path_offset('/subnode@1/ss1')
> > +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
>
> The docstrings say both iterators raise FdtException for a bad offset,
> but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
> list(self.fdt.properties(-1)) raise, perhaps alongside
> testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
> same follow-up. Since these are generators, the exception only appears
> on the first next(), not when the method is called.

Added the test for `list(self.fdt.properties(-1))` raising `FdtException`
(`-libfdt.BADOFFSET`) in `testPropertyOffsetExceptions`.

For `subnodes()`, it turns out `fdt_first_subnode()` and `fdt_next_subnode(=
)`
in `libfdt/fdt.c` map all negative returns from `fdt_next_node()` to
`-FDT_ERR_NOTFOUND` (`if (offset < 0 || depth !=3D 1) return -FDT_ERR_NOTFO=
UND;`,
and `fdt_next_node()` treats `offset < 0` as starting before the root node)=
,
so `subnodes()` never raises `FdtException` on a bad offset. I removed the
inaccurate `Raises:` section from `subnodes()`'s docstring in the same
follow-up patch.


-Doug
