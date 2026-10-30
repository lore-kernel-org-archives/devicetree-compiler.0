Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364622;
	b=wtO2hdagh8ts/hCUNjgiOYIk8+Oe8NItkx0onleqrprz6owriX8jyRCdf+72IZhIGHz/
	 NCQoDbWju7KtoB3aO/sykp6kQC/L/Yg2QLdqJEnOK5as/i+26jSCAiXjbI9oxTYKbacVB
	 tOpdXFKQumzwJm4/fZx+LYEHySZ77m/FwwFEcrg+8y/xtguTcJJhLWS8eZqg9Tnt3G6Mz
	 ey3m7Ow+rDk4Q6swlipGlHbe/OTerI6iZb927AlNZeeWCdCTQwvYAhxPlzg25Z/BevXgu
	 Y6/F/TL0h1RWD1Ylma4gbmpE7mnASeC0hfDpvFoOHYBkbzPYJSqBJ8uFDbw7kODKuuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
	b=vkZgilG1Jfx7F/jFe76GhmzC31jkc6+ttYY38fiSllPnY+1xG/7HlbzSQAYPN4aNak0A
	 ZOjPusz2VwXjj3QWB7TO/KKUppJQS1j1f2/Rr2TzwXHovstD5Z+6Kdp8so/+lCdIbn/Jl
	 mRzYi6V5QQvj+Ps3Td0+BUzqgKQs7uX58eyut7FBXjV2Ao8duNZDAWwbgMmP/jcIadBn6
	 DTK/JDVkLrHKSdOi+2zGjhQhK32C+lOHo5esAhTPbGxkA3F/wFG6qhFul0MzBedJBR7+b
	 plK69gRENEphjbdFz3cQ2+Fb/Fdv9Ggrfr90r8njd+6RXlhqn5TSPc2mLnXPT74EoIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QHrlIIjP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3A660A2610
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3A660A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QHrlIIjP
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49c32650adso77584466b.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364621; cv=none;
        d=google.com; s=arc-20260327;
        b=W/XCa3yMGrk1xMyBvVf4fTmJs7aBxyYD1mVLpXHYU0SL1yJrPajIrhBHSSFSktaSUA
         aBsKIXjYy/1FfYDPdfCOVwola2N7UQ6YWtHO4jw8DZYdSOUE6WplcZ92E9Ia2/eI7nq9
         s6iIrs0R246ffGLcigAA0DzICwQIHOBpmngpEGNdrOM16Kj2aUdGxpqEkP0ouqKSM2/k
         LZPAbSI9yKi/+m28j3th1fsXVR5YXiEstBZ669+6NmdDxL3jyU4cGzrdWuzOoV1DapGE
         qQn5YTF5nZ3dmrXM8JR9uAP1c2X6p88dRbrd7jqBYWXomOKX8qS7pl0GL22o/L1MJZNu
         q+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=WaMx8G24LR9paY1GDXlUGvYtMjYw58M4nYUBdaatpsnsungipK6nqMuG1eMh3WrErY
         Ep0k7NAfsuOIk9QulAKEjDakUKvScSGaDcDyPbmF4C6llMJqmR6r7k3OBMGp3amcwkQW
         eCNqtJEvECeU90WVjSz/O2W05aAQOlQS3p8u7816wZwQ43OtI1Vpbu/RnWi0t8saTfXG
         aQMnFL1HNXuxYn9rRvVcsNasRT886al3X8l2zjKoDn9NXtc2wWMSCYyOcheogKdjIRXS
         7Q0kzwDCC3pDe7xUlaXxgFWg3VlM0W3+NYzmoaH+UT5aY3u316EavE7pfYsrY6fuI9fl
         qgsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364621; x=1793969421; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        b=QHrlIIjPYRpyvppFPBu8+5vfCTAFEeBT02gaKSYxL7dgK8lo4tdAzO7fwvBEqG99z1
         XgorNXrxNiIcXvim5XZdlbG86BCc2jiApMfdqY6bN8FzNmjqQgEWd3DO3w+vc6ZLMXsi
         8BYhGzf+Fv27F3YR6Y+2yrh/QYWKVzIsoHOgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364621; x=1793969421;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        b=X22AB3QX1WDF6Uxb7JFLO4/zpVgii4tGK5nJJFuI871dMJCnOgNUV5tDidT/ENH0s4
         1MrjQwyXDU+8CDrG/Zj4nv3SMw6O2XhTMzCr0isuqF7bzH0GVEYcxi+XjLj/dMzMRlbB
         nuqHJeNuEwA9/CSVKplzFl1YzGWDSfS8whJfPFl7fzsTgTEwA66KPnoF7Wd4dLfSk0Ff
         rtZp/+Zm1JZTs44GRoZcOUhJCSsRaQMPWu1bqJ/0re6Z1QcKF/QfrK1G2YuJaNiOR6Gl
         4T9QdQMPV0wVAQvC4pK81959BDY0A9L4g0R3OHhxXRnrW7oJuvskJulWxRiwR80SPSx/
         vSzw==
X-Gm-Message-State: AFq9FYLeoIwlcf7MMtlPujzMVQmTsRLF6CRydUR4OO5zAhq8kncDLxVP
	jo5SAxFZL0EvfLs8jyoDdXSUe/qt4dTXkB6qjiPf9+Vt+baYQz7XHXidOwN7w50hE/6xDQbxUDN
	eF+KR+v1GBEx8xyjvG/vVJ2f4CLc2130pTXhANvCP
X-Gm-Gg: AYBFou22TrwUGyvfhtymqhv6aYiGxycQf3NZcQTSyLTCtv5p3Qyhuf8aNzRwfVEqx3H
	6ttYAnpi8LzT/EtbjeqzAoOen6nqsf+ObwyYKM4Rx8mQSuNy+lTfR+jxGsMnQ7q9OVOwnvtbaE1
	yxAyKSv8b0jga18cREi3qcBwuC8+QYAZt2HyXWePx9b12c3UUEqpCHwC2D1eUTAhE1D1LgozVm0
	HrU+kEL2boOoq9+E20hVNqOelXRGxtfd3N79BHTBailxfR4iTka5Pdfv4Eo64zFTWDM3VObgT2X
	jLcmKswGYuqW8u6hkZBdPSfHEJ8mj33a7Pmg/cCD40xonNaYsktp7xZpwn9hlzBDRG+CyZt3sor
	oAivij6KXZlhTEUZ3lF4fxoVBzIgkzUfTET0Mp4qOoKcaqtkt6vhAfbtw3rgfiscuIxSJGs0=
X-Received: by 2002:a17:907:2d24:b0:c2d:bc33:7be3 with SMTP id
 a640c23a62f3a-c4ca7b804abmr217479166b.47.1793364620924; Fri, 30 Oct 2026
 05:50:20 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:18 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:39:26 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-4-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-4-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:18 -0700
X-Gm-Features: AclHuK9XH5inA75nLtEVNACEt-kvj5ilQrhpx6qKrKd1EbyJPnQrCjVXnDxbS0A
Message-ID: <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Add NodeTree live tree representation
>
> Add `NodeTree`, an in-memory live tree representation of a devicetree
> node and its subtree, to `pylibfdt`:
>
> - `NodeTree.unflatten(fdt, offset=0)` builds a `NodeTree` hierarchy from
>   an `FdtRo` instance.
> - `NodeTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
>   `NodeTree` back into a packed FDT blob via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation (updating
>   `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
>   properties raise `ValueError` or return `[]` rather than
>   `IndexError`).
>
> Add unit tests in `tests/pylibfdt_tests.py` covering `NodeTree`
> unflatten/flatten round-tripping and helper methods.
> [...]
>
>  pylibfdt/libfdt.i       | 262 +++++++++++++++++++++++++++++++++++++++++++++++-
>  tests/pylibfdt_tests.py |  54 ++++++++++
>  2 files changed, 315 insertions(+), 1 deletion(-)

> provide typed property access and mutation (updating
> `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
> properties raise `ValueError` or return `[]` rather than
> `IndexError`).

When you split this out (as David suggests), please can you add tests
that call Property directly rather than only going through NodeTree?

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +        node = cls()
> +        for prop in fdt.properties(offset):
> +            node.props[prop.name] = bytes(prop)
> +        for suboff in fdt.subnodes(offset):
> +            node.children[fdt.get_name(suboff)] = cls.unflatten(fdt, suboff)
> +        return node

If a blob has two sibling nodes (or two properties) with the same
name, one is silently dropped. I checked with FdtSw: with two 'a'
subnodes under the root, only the second survives. libfdt does not
reject such blobs and fdtfactor reads input it does not control, so I
think it is better to raise ValueError here than to quietly throw data
away.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +        self._flatten_subtree(sw, '')
> +        fdt = sw.as_fdt()
> +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> +        fdt.pack()

This reaches into fdt._fdt and calls the raw SWIG function. It would
be worth adding Fdt.set_boot_cpuid_phys() to go with the existing
FdtRo.boot_cpuid_phys(), and calling that instead.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +class NodeTree:
> +    """In-memory live tree representation of a devicetree node and its subtree.
> +
> +    Attributes:
> +        props: Dict mapping property name (str) to raw property value (bytes).
> +        children: Dict mapping child node name (str) to child NodeTree.
> +    """

BTW in patch 7, fdtfactor adds 'phandle' and 'fixups' attributes to
NodeTree objects on the fly, so they carry attributes the class does
not declare. Since unflatten() uses cls and create_path() uses
type(self), subclassing already works, so a small subclass in
fdtfactor declaring these two attributes would be cleaner. What do you
think?

Regards,
Simon
