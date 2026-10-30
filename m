Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364620;
	b=f05KQoXu8UKhV7KygK4anoOWV8x+tlr3He0LWcXGWzIezJLk2qIB2zmkWtnCCNBPpK3g
	 /kpu3SbJ+3ENcJSQyxSmO1NTVgeMvKfWI60Sci6wtf6jwjKFrM4vYWMtAYkkUuwIwt7v4
	 u3B8mbXoK0KJJUFYfj9SQ9wt+BHarVZgZbNiabg4va6A5KYeGTS0ZiP8E4y8NYyn9c/bR
	 7sVDVpmPNAPfE1PTmh7DdWkoukhEEKg6V48vPNr4PuGe1UkyjCoTQcsEeHhCr6YFPuo24
	 DoiTl5hIee4uFgfKFhtYzMVgEOYWA8/JItVmaBjInQvg+CfLMr8zCX68suPrkL2lCRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
	b=kD1NE/0fSwBxzKs9ovf+w0EnJabRdtUUNrLcG+nyD6a5aXDBQnQWP/7VEy2FMizzZKge
	 l9mjFrfZwtChdyHdLPDyakJRkYQdiZuxSWZFQidoed4cO02M0HgSci7nHRjzZYrCdL08O
	 N59+ZaMLsLN5S0XrfGGB+nckUBNzxzEeomKo50S7ulM/Y58KzM49GbZDegJWbUvv938b5
	 j/O2pJngpiM8f1Bb4sbHKs0QZGzoTOEtzKuJVCjMIuhmsCzAWxDBrtwgVZv37d3q6AqZ/
	 soOqjvNPPJTQwgyEX0yhfyhhW3yIB/cH0wnfW9r+8lVbTanXx4bIaY81AOadT4Zdw3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KHHdpcUT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A3560A2604
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A3560A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KHHdpcUT
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1003011a12.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364618; cv=none;
        d=google.com; s=arc-20260327;
        b=Rb7h2GYP97vhZZUns/eXViu7Vv4rXDfp49AufG0BeK9NlJS2c0M751yNKHaSp1VOHC
         +wtZJiFNQbwX09h0P2XoEhs1VIdZIKKoIlR72rwCYcLMutYUxHKF+1+1ftYc+iAlQ8x6
         Xwev6gsp87mrsWxrolEo+m1x7+m4O3HJuUvsBGDffG6M6iqPl5R2Y8bWX+oZU8ExQs1K
         DLEcB8ddG3yjrA67Vwy9xCrYjalBCOZhvZuexFAG9vN6lpq3HbJUUclsVBujVZHqNMP0
         uaWPZAzLrECJ4thqj4+eTqSVQQ1Wz7XiTP0L7LLAMysVm8v6uD63hmlKydQBdw0hx/aV
         mv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=Tfw3PD+wVYMUsP75z+JGpw+pUrZnV7vefa8X0UF76fWqO9H082V+Dwc7GuoMPxWww8
         clY32QMF5BaybBx32zf9RfoGVACsflC3SZ5FWmFGZVyhMeniGNI4QEhoet8FAEaUmAA5
         enNNiP20F/5a4k5SQjLznxEK6ZmiiDw9E1cagozhXlH4LnVxdVZR67B3HV3I/mhpRa4k
         M5NQexLQ+pfaIeSNTqG4ALCe6xVnijWqz6ZoSkSGJxqM2YSTWS4Ahg7PjqTtuWt9Ap5g
         3MHrRxJClNoVFycv8LhMhzvIWUMw9JkVzWCEMgYvC+vSF04SGqrSkzPX1TDmF3nBpfaX
         SCUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364618; x=1793969418; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        b=KHHdpcUTHJvchgBPJQabUdSUEghlqS/fchyOsKrjgVCvaGw5UnAtr4ZdcJ1I+qWGyj
         ojbjkUIJQ9748Ki6fNOyDJKLh94MFruFhK85usWjwHWAzImovqbxH7PQ96Buhg25vZh/
         wPNv5tauvx7bDZB4Zw9kfH4zYBEINND6rF+Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364618; x=1793969418;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        b=QfcLR9YU3ugHTDDDhyrhFSHLwFyLmCLeRYOMogq1FFRX6vuBp/INP1gs1pe0WcCgdC
         aqri1h2G+Q/a827KwLy6d8Ay8Z7a+JOr4PcEndF7Hyq+8dCgakzUo8+RDiXJ3ZagCqFI
         kh1F96Oq559OVhFbxnNge6rcvvvdDRn2iYwPmQ6f/bv+XnbyC4RudhInwuJ3jE7tf6Nf
         f3GrzvMOZH53op1OsI9axGfPiZNhFpk8Nrj6NDjnie7fbF0AVP47VJUP3aLpn8B0WBK+
         lXgk6IAxXiWesS8PYoKRyZlGNwkOn5g9kRGfzMWRWeQnVcxfCGLTy9xfId4WkPCvh6P1
         D7UQ==
X-Gm-Message-State: AFq9FYIlNyTWZApBjMLgqZTWXQ76ziVl5pTlR4Hi+dnEZawXJMSag8/i
	ehP0sWgicHmg/jRfHegvLbe+IBfcD3vVIguy6t35Z3+Fgl0lBwB6wx0ApTZ7gPE7/nd04sG0Ikt
	MMeaaXzTljX72e2yOhMlh79CF417hn29FrVNcG1dE
X-Gm-Gg: AYBFou2wDQ21pzd9u/oWkf/BHTtexFznlfeSJBP1bVNOo9n5z4fEWZV8lV7ME1U06qI
	YfgPRDx9Oc6lYPK7i8y5J6QpWrsuDTvhbpulGnGpqz4Qx8WPj6iXIjK4Tbr9JQ/gFB7Y+H3SPo9
	hVrinMHAtmZUvXe53iw1MdytI7/HbdIermUop7gaqOsgY5gEBxF7D28nZq/3XISnlLcegLmMS0Q
	8xA9ZCKPCbXlqD5qMNnMtgY3V9vdyW+MqznnqCpd1mHh2wx6IP5NrWFwp/4edFw2j5IKb1T6ewn
	KSYi+/HmrUO4Rm8AopPayl0wbtx55ENJZ7XiD2xTO/iQBwDNbux9Z0cJ1shjVLY6bRii+cfsukl
	KtC9KiJPwohhUMhH6L+2mLxgi45VvYdtBueI5szlcg+8o6zD7va1HlpOEQaMdy0Imp6NaGTA=
X-Received: by 2002:a05:6402:13c2:b0:6b4:20bc:f97 with SMTP id
 4fb4d7f45d1cf-6b4d4687f36mr1456603a12.9.1793364618460; Fri, 30 Oct 2026
 05:50:18 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:17 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:39:24 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-3-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-3-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:17 -0500
X-Gm-Features: AclHuK-5haYO3nWpUT-6WoE1n_p6LXGTVa69dgoVQuwfItbU4Tna_j7nctRDCbI
Message-ID: <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
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
> pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
>
> Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> properties, and memory reservation entries without manual offset loops
> or `-FDT_ERR_NOTFOUND` sentinel handling:
>
> - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
>   of `nodeoffset`.
> - `properties(nodeoffset)`: yields a `Property` object for each property
>   of `nodeoffset`.
> - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
>   all entries in the memory reservation block.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 18 ++++++++++++++++++
>  2 files changed, 63 insertions(+)

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -201,6 +201,23 @@ class FdtRo(object):
> +        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
> +        while soff >= 0:
> +            yield soff
> +            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)

Since Fdt inherits this generator, a caller can easily write 'for off
in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
offsets move under it. Since David has applied this, please can you
send a follow-up noting in the docstring (here and in properties())
that the tree must not be modified while iterating, as with
fdt_for_each_subnode() in C?

> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
> +        leaf = self.fdt.path_offset('/subnode@1/ss1')
> +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])

The docstrings say both iterators raise FdtException for a bad offset,
but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
list(self.fdt.properties(-1)) raise, perhaps alongside
testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
same follow-up. Since these are generators, the exception only appears
on the first next(), not when the method is called.

Reviewed-by: Simon Glass <sjg@chromium.org>
