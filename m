From: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: Re: fuzzing dtc with AFL
Date: Tue, 5 Jan 2016 22:16:30 +1100
Message-ID: <20160105221630.1f94c6ce@kryten>
References: <20160103023247.2d04c28a@kryten>
	<20160103092848.GE9329@voom.BigPond>
	<20160104115858.GG9329@voom.BigPond>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; s=42627210;
	h=Message-ID:Cc:To:From:Date; bh=988UFJHlQOTUnCtWDpzdAxQ0JaL31ItOYAy/Nm+WxEs=;
	b=uwvbFvUwHAXYLWCoSAvnWRT0pEe8rYkSUW4+ThimL5ttqGf3kma22xFVm23N6G3VQW/Txd0XK1qGRC80QwXMYf6jseZIiGLN3kBceyg08LuSftV0uGIcBKseTdUMA65ltO/UThuIX+a5xnlScFg64H/+Pd/z7z+6HtlDPxXRQkI=;
In-Reply-To: <20160104115858.GG9329-JFWYtBTiNpwvqAi9XkHEEA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


> I've now commited fixes (and test cases) for all of these to the
> master tree.

Thanks David! It's looking much better, but the fuzzer did trip on
another divide by zero, this time a modulo:

/dts-v1/;

/ {
        x = <(0%0)>
};

Anton
