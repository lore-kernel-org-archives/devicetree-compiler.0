Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019408;
	b=B9UkqiNNQd0uF+egrXXXInxN7QuglwpUTOKW0LWFZTN2qZDfMo5GOezkBo0LHaGd8TYN
	 4Fb6kTT8z+m34+9Dx4U/FFZP2zzriMN5J9y4CcAMzGCvOAHBNi+hpxA74HX+Z8gZM2kYi
	 eAmc7hWimTX9apL2HqToVtZ5GeveqWIhQQtdHqFujHL6SkPdlwdahf9bumwO2Bf2gPLsl
	 JVxtlbsfq1nn38DBxswyQWY0lNjB6RLMlUhFZQYB50IAbp7I/0rWIperRvfPp17829Hz/
	 DT6C46OMae7ETKyJ3HgrvVUcCK8/nSmEHzKqvW5MAJk2NBD0udqv74lDRHj1DHS+KsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
	b=JMy3p3LTSfwRRctzJN/QA3WhlX2bqcEvZM2ppRWHAdwtz31OHkShVt9v906OEZkO8puH
	 uGeo0BXUCXwpKG98BYHCKj2gxPbTHEln65DCS55EGBi1xo1O6rNEwxsmq3LHRxo+l3g2Y
	 Ek8rUrOPWOMbdLCULK/CWMZWklvLARWLyOAWwvc3UrW77KO277sLdpTlE71WyColUBnH7
	 fg2Jlzw0ULNZ87QPGKQDMC91yoUvlPjS5OKxjr5jjPUpN/lOjuRNsidYRX4VXdhaeVHiN
	 X8D2xJnhEDPEz08afxKw7dhrvjTQgZ2nNPI492HkSKGptnxaTC4httjlF/9YHVEoX+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BHJJTil7;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D33606A337
	for <Devicetree-compiler@vger.kernel.org>; Sat,  7 Nov 2026 02:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D33606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BHJJTil7
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso1213722a12.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 18:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019406; x=1794624206; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
        b=BHJJTil7BkphO9ZpdURTCMJFnvPMfJ9BUXh8HCw4DyHtItieJbzx2IKUsGD04hpUkD
         wOEAww5vlkQD1b41jJy3giWAXlc0f0S9pAPHk/NlFb5LfEfj3Nk0HoLHNqFFecriGWjp
         2QVdBY9LQAuyiwn9WQH8klBWGsGb2Kmtl4GJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019406; x=1794624206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3XFDNttzzNecv3QGeXd1n4niM2PaEt5ZDW6EFwUi3E=;
        b=xemEJW6CHrFxNMn/mlkc7U+uDw2z2GTr1gNcnVmE5OK/q9NpGIXgg7s0+uBWhaRb6X
         PsZt5goJFZamyg88HL4lsL+vfp9mCoV+nDiI8ZjwLqjUASsnz5H+JpMe4S6SRmUeJWTW
         aV1nyqQeOde9iEnov/7w2oxLVJnoeoNHG8S1OPPjj7Euivj+7RevhATonUSdpDjofLZf
         OUcWWXAtbp/qXaPvDbdMGkjbEGe9rXXbn0ENEqowZUxMrtR9MvbN1+jfRjjREkxxjktq
         vVREcOsUoHYKHl3GpbTS7y/KVXS5Ns0nuqIVz5dJe7vF5OVRp7kKko00I8CqsqtiN0HO
         QN2g==
X-Gm-Message-State: APuU4Z+GHowDKQc2bQkHkpNxcOBIL8joqeik+A8wYULKDStkUM9ay7dW
	8Dvqy4pOVdAhwJ28KCxSQdHWQlLFdCMHtQpfdM0+2D1CmY5ez9IDQx1As3ItoDbkKcO0tJ9kMP7
	bl5xji9GY
X-Gm-Gg: AYBFou2/VkctXmyosqQktDvU1zkOxR42GoQ0+9e/5b0t3OovfCTOlY7lvjdmLcIBVWQ
	OTSjIJzParZyaedXpweAOkS4Qyim9/h4CHGRO67oX3bT428crQqEv4iAoyZfc6ZfnIaXmTqzNE+
	WB7vuO6vmSTViP/BaRgp+/RiCxUEnqdtL3mERcCRx90fmyYt5Jy7JAA8yES1xB82KkRerhSmogi
	WuaK1FFrv2Q4sY2deFCSrbuD0shWaYKaupDXUsh86RjXRSoTpfaAi50d41OijZLw3p468VJGfAy
	jC/z3XDGsLrAyKFk2vpbrpyGH5RTqh2yhax6Sirvgvx1szc9lrVWlmfgE1oGCrhjBYw4wyoppaM
	1eJ8rJ3IMT2fZqXlj7WL50xIYP7hOSl6aJ+Xc55QlOZ7a8R7Swdi/BY0h6mWl8lNqO4ealzEZEg
	ohEU7OD0HMjedW1DrCS9GVs1KfnpiNu4On8YS2OALog2QUlLL7fVt9DFD+E1m/uT7Ggx8m8tAG6
	cReP3Lo4pf186nXNuxpyuNk3VF9Vul6ojDqk2Abegv1JX0jH8j9tYK/UozjdboCN9sCwVRKZ5rT
	el6EcaJ88xOoEDgDZJpJ1wyVrYY5XXACXqQWRKWApvDRjbeo2pix3ZoUaVhx9RVgDRDr
X-Received: by 2002:a05:6402:13d0:b0:6b6:fddc:dbc3 with SMTP id 4fb4d7f45d1cf-6b6fddcddd1mr359200a12.1.1794019406563;
        Fri, 06 Nov 2026 18:43:26 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664aff32dsm1407601a12.25.2026.11.06.18.43.24
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:25 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e4831c028so1271584f8f.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 18:43:24 -0800 (PST)
X-Received: by 2002:a05:6000:1866:b0:48e:7b12:aca5 with SMTP id
 ffacd0b85a97d-492c3cd30demr8053898f8f.46.1794019403842; Fri, 06 Nov 2026
 18:43:23 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <auhYb6FV2dPrbVxB@gractus.seuss>
 <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com> <aurMrnE3vD5eCEAV@gractus.seuss>
In-Reply-To: <aurMrnE3vD5eCEAV@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:43:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>
X-Gm-Features: AclHuK_3CEM0gWgFJJsOTWsUfr9-4lxY43ohtI8iBZ2YI6Uk7KHCVe6SB4RhC7I
Message-ID: <CAD=FV=UXCnBoU7V--1Sj0dzODCKgYNoBBLHH7N+aGYWzbUdpkQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 4, 2026 at 4:44 AM David Gibson <david@gibson.dropbear.id.au> wrote:
>
> > +class Property(bytes):
> > +    """Holds a device tree property name and value.
> ...
> > +    """
> > +    def __new__(cls, name, value=b''):
> > +        if not isinstance(value, (bytes, bytearray)):
> > +            raise TypeError(f"Expected bytes or bytearray, got {type(value).__name__}")
> > +        obj = super().__new__(cls, value)
> > +        obj.name = name
> > +        return obj
>
> Thanks!  I do wonder if we're doing this if we should update __eq_ and
> __hash__ methods to take into account the property name.

I don't think we can include `self.name` in `Property.__eq__` and
`Property.__hash__` without breaking `Property` comparisons against
plain `bytes`:

1. `fdt.getprop(node, name)` returns a `Property`, and existing callers
   (including 10 assertions in `tests/pylibfdt_tests.py`, such as
   `self.assertEqual(prop, b'test_tree1\0')`) compare `Property`
   directly with `bytes`. If `Property.__eq__` required `other` to be a
   `Property` with the same `.name`, `prop == b'...'` would evaluate to
   `False`.

2. If `Property.__eq__` only compared `self.name == other.name` when
   `isinstance(other, Property)` and still allowed `prop == b'...'` for
   plain `bytes`, then:
   - `==` would no longer be transitive (`Property('a', b'x') == b'x'`
     and `Property('b', b'x') == b'x'`, yet
     `Property('a', b'x') != Property('b', b'x')`).
   - Python's data model requires `a == b` to imply `hash(a) == hash(b)`,
     so `hash(Property('a', b'x'))` must equal `hash(b'x')` if
     `Property('a', b'x') == b'x'` is `True`.

In `DeviceTree`, properties are stored in `node.props` keyed by
`prop.name`, so `node1.props == node2.props` already compares both the
property names and the byte values.

What do you think?


-Doug
