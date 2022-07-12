From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ftdoverlay overwrites phandle
Date: Tue, 12 Jul 2022 09:53:57 -0600
Message-ID: <CAL_JsqJbU6vUhxRodTSFmPjPUAvw3-qcu=usdPp9Ym43CM+t9A@mail.gmail.com>
References: <20220629205925.v56wxrvib33tgu65@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657641249;
        bh=17yWjKs4WCi/lQMAoaY7WMP/gMyiHU7bSvBIGOS3eKg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Sh8n6FRFN7j7oOiS8ZfmHaWAoWW+GZQUqPiOuBbpqveJq6+3+8gG4FG8IS6g0DT6U
         RHBVXf+czr7n3KxgiUC1jVPKNXkO1m2Eq5w9L3F1/i/vY1RtrO9xAIjxQvgayur794
         PmqLIkyzRy9m2AD5ZYJEMXZgN9arlt7WnpfAIjCrP6UJ75EdZYWfbrVMJICGjaPLAx
         i1YgfNjqQhFLhZNxWpAGPirvU5ftU3wPNdnNzSAlBByrX55bIhxRPGFcphOxdhbXQY
         W6VZ5+TEfL7ib8oiqrrNf/ZillFTjliRc6qFJFaT7DYxm97PXtEeUFnwVox1OpE2Oh
         KVv4E0PnE4d7g==
In-Reply-To: <20220629205925.v56wxrvib33tgu65-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

On Wed, Jun 29, 2022 at 3:20 PM Uwe Kleine-K=C3=B6nig <ukleinek-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>=
 wrote:
>
> Hello,
>
> I want to apply an overlay to a device tree that is compiled without -@
> because that's how dtbs are shipped by the Debian kernel package.

Does applying this overlay work as expected if -@ is used? I would
imagine so as there is an assumption the base dtb was compiled with
-@. The fix is to fix Debian dtbs (or don't use them as dtbs should
come from firmware rather than distros).

There might be sufficient information to make your case work because
IIRC all the (resolved) overlay phandle values get adjusted when
applied as they could collide with the base tree phandle values.
However, doing so would mean users may start working around base DTs
compiled without -@. That would remove labels being an ABI which I
don't love, but it would also remove the abstraction that labels
provide.

Certainly, the base phandle value shouldn't just be silently overwritten.

Rob
