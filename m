Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197042;
	b=Xn231mw54evxGtmOXXIUPFVRmLUsl8ZfM2vK9wc8HGdeV5htipi1LknhH7fYpjih/7Lz
	 LMaZUvZJ8Zc8FSJ76dm7fkS9257DIeZQTwtwvLTPdjnsiZoDbQfemzt4IwEvoz3YADm8y
	 sxwwzsu+VGX73v80Vr5qZF0mxEzUdssrMz8QrQdCVp0HaMlRXaoZM8470nh2GxQ0762FR
	 36970KvNz9KDdUTmcZjv+0j1pT8PZTrTe3X+SOkn3h2lkFUbXWY276JodhmIrlEWOLxHe
	 PT1+a7AXIqljp9t9qa6Sf00N/nL7SS58qbCbx95YUL+TC2veYUp4MEVM8k0UYSjA/+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
	b=U3pYa742P44txjM4o8Ln5RuOp3+Czxr7C2thtx9XOXtY/qK0t4N/I0yC0w0T1Mjt6kJb
	 7k5fBOOdbvqYhBEY+e6PjNZFnQzJ4o6s4EQxOMqh+G4tTOYkfx7d1ixgYnOM1MXZ6Yl4K
	 bDHJc08IBrlYIdTEFQhB+GeetydUj2rv04A2LTvmXML0AlHI39xSnfjVemg6XqndtvkyS
	 dWqfn0EPYRTw4SB2P5cvT23/k05yeSUDi62ZpSqRLVxz5J7DIf6F/SyXvhl6lFn9gveby
	 TYUurNC0uUoBORfnRxUrdAwRy6Ruxq5H0/vKz+rids576SIbU1aXl4ejSMPMDYBs37Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UpuiBTQU;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AC60A2607
	for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 17:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6AC60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UpuiBTQU
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5118deebcfso187056666b.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197038; x=1795801838; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
        b=UpuiBTQUGJmwSFS4Jnthxb10aVlfEM4wkQ29i2ohJY8kKDUVwMhBuPYbVOZZDvnqWg
         TbvXZVivcWUQgVpVD17BwViVvK5KcC+Plca35oT93nLlUx08YBVkZxMVZ6tKZ4YiSesR
         jxAeLMWpmPPGY8Bxoi0R1rJn3r/JKz1OZyBpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197038; x=1795801838;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
        b=xgnHUkxp93AsTWtEv5hjZp9wN2O7zxbxzQlve9QNVvbc6g07jsUTB0hHcxabdAvcAy
         z1IjiPxDnpT6HxjrSVUoFv1NpAIuHeS4yWZs/uzsU5gWr0YBJYHulYJAjURB1d+Bk9NV
         vPOjEOImTe3xJCGHizGm34aDjVxIPIaaRadV9bELaGpZPrWGGvGfkcrJAEBXkxfecXH1
         q4h0z/QC3qhw7bJ0pGh5tFFsFWYfFD/8J9k5ld++wZDTPpx59ltVBFqNV1B5mu2LBnae
         PA5IZWR7lMg0XJ7mdrmjaGOZx41XZtXz36Cf+t5T5WDZA0BjOuHeQV8teqrPhbf8R8l1
         Ikdw==
X-Gm-Message-State: APuU4Z9gk2Did1ad9YYGOvn5NJJnI/1ju9ishhOKy7kfjMd4selkkzeR
	6igZlfnSrCibpYZtzUkSMhn8Y9jSR4eJelSkpEaSN7H09wTz8pqHs8oVuef0evrqMBj3vYfMbwh
	SqyyINQnm
X-Gm-Gg: AZFdTZdbq9HhswS9c35OiO65dQ+uu9l33aIwYrUpADJiVK1qDvyWtI0MBzInmsUT+Ml
	9npkkTolTMhM9YR1IkcIMXIjPrsZVP3/DTEMQGqo7EP5HrA/CWM8wg1UqzRxaecU1z+ceVsY/fz
	tbg7+45tvrlq/+5ywJl2NjnI0JCeRq0DuBFvvjFz5uo9zu7hYTNi3jnJicZvH/K/krc3HXWFeIf
	eDj5rKFFdoKNiDn3LsyZLAfyrTphLYvWFJO62rKs4oDrHrb5g7g4cVBn+0wkg8+R5I7ydkHjii9
	dV5tTtkJ70tuFIcbKP72sjjTE8QTA0PiKZnfp61TlDqKUTqsPVWJqBzSiPKpaOo+BAQlK5TVlsS
	BmKSAZ9GdAPHsEQefe8FWyHgx9DT3DoCjFKGhD3eA5pmYH7XLQ4iBM3mxcOtkeQ4Y6K+a84AgxH
	ZE2cZoCkX5g1X2jjp9fZPgF/0YMn2mklZv2jqogjtUSjyxNrd5Fqrokps1i8I5TK6KfOLe3SPwn
	X7+cJpfUIqt5jkURip3ezxp0QpWjW7/BXajP5Eo6XUO+IAgJ75Q32lJAXU36nlcrcA5TFsphWxQ
	kQEEPIR0qWQarK87zZEpNxQCaWF8MzVYKoOng0Wm9XRZkFRgeUiXsmK+Cq/68J9oqGNIWg==
X-Received: by 2002:a17:906:ad1:b0:c2d:d408:5d9c with SMTP id a640c23a62f3a-c513ac9c0d9mr289045166b.48.1795197038094;
        Fri, 20 Nov 2026 09:50:38 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01afbsm126444666b.5.2026.11.20.09.50.36
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:50:36 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e46e449e8so806574f8f.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 09:50:36 -0800 (PST)
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id
 ffacd0b85a97d-4abb86ed79amr7743142f8f.43.1795197035286; Fri, 20 Nov 2026
 09:50:35 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org> <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
In-Reply-To: <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:50:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UAhKxpYwyEeySOC6X_MCNh=u8eG7f3bS5mhr++Ewkr0A@mail.gmail.com>
X-Gm-Features: Aa3M54pY3fAgFZhZ3EalnJBZbaFaTtvllnxvHJmj4hAyavZ60vgvrfdEQ0Tz-zA
Message-ID: <CAD=FV=UAhKxpYwyEeySOC6X_MCNh=u8eG7f3bS5mhr++Ewkr0A@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:22 AM Simon Glass <sjg@chromium.org> wrote:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
> > +        name_obj = PyUnicode_InternFromString(pname);
> > +        if (!name_obj) {
> > +            Py_DECREF(list);
> > +            return NULL;
> > +        }
>
> Just to check, how much of the 1.8x comes from interning? My
> understanding is that interned strings are immortal in Python 3.12 (I
> am not sure about later versions), so every distinct property name
> seen in any blob stays allocated for the life of the process. If the
> gain is small, PyUnicode_FromString() would be safer.

Interning isn't where the 1.8x comes from. Switching to
`PyUnicode_FromString()` keeps the same ~1.8x speedup in
`FdtRo.properties()`. Switched to `PyUnicode_FromString()` for v5.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -477,10 +532,9 @@ class FdtRo(object):
> > -        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
> > -        while poff >= 0:
> > -            yield self.get_property_by_offset(poff)
> > -            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
> > +        return iter(check_err(
> > +            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
> > +        ))
>
> This changes the behaviour a little, since properties() is no longer a
> generator. The FdtException is now raised by the call itself rather
> than on the first next(), and an error part-way through a node (e.g. a
> truncated blob) now produces no properties at all, where before the
> caller saw the earlier ones first.
>
> I think that is OK, but please can you mention it in the commit
> message and update the docstring, which still says 'Yields'.

Done. Updated the docstring (`Yields:` -> `Returns:` plus a note on
eager evaluation) and noted the behavior change in the commit message.


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > @@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > +        with self.assertRaises(FdtException) as e:
> > +            list(self.fdt.properties(-1))
> > +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
>
> There is already an identical check a little further up in this file
> (just before testGetName()) and, since it wraps the call in list(), it
> passes with both the old and new code.
>
> It would be worth replacing it with a test for the new error path,
> i.e. a failure after the first property, such as a blob truncated in
> the middle of a node's properties.

Done. Replaced the duplicate check in `testPropertiesIterator` with a
test that truncates `size_dt_struct` after `/subnode@1`'s first property
and verifies `fdt_trunc.properties(node)` raises `-libfdt.TRUNCATED`
directly on the call.

-Doug
