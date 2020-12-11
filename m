From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Fri, 11 Dec 2020 08:03:42 -0600
Message-ID: <CAL_Jsq+N69AdhS+fa5VR_Y86_Sq5_sSNiKc14fW6B1fHRbYBEg@mail.gmail.com>
References: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
 <4e3cdb1c-87c4-810b-513d-eaae64456d36@physik.fu-berlin.de> <20201211010739.GB4874@yekko.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607695436;
        bh=lxJBFmeHUM9XcsFglevWNKvoo7vynDViDVecqTIztFQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Obsk0N97g1SL7wUEl5Y0lLfHn1jL7SwiHemtsEBgRtB8wnRAilJt0bqufPwQMAKJu
         lPo48B92hlCadGrdJfW8JJ5f260I/GRp9GFp/hTDSZtsLxydyk7UlDI84uttDI7ydN
         xZhL2eD65YLFpgKs/g6CbqaXCvScsa+AalittwkkjLUPN6SO9pihG8LTu+2MFOj975
         T7Gj4y8P8gKgjeciD0JQF7547g1PE/9VgtjStgCzt1G1qI7WUjBY9FsJgZ/cudFkn5
         wApT0ShgfvlTUPrGiEAnc14KJkPRhtdpZ1Pa3IV/n2DPlaGM5ZcWv7Un69IZdPrVSm
         HdXDQn9ZGkwSg==
In-Reply-To: <20201211010739.GB4874-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

On Thu, Dec 10, 2020 at 7:09 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Thu, Dec 10, 2020 at 10:04:47AM +0100, John Paul Adrian Glaubitz wrote:
> > On 12/10/20 10:01 AM, John Paul Adrian Glaubitz wrote:
> > > I have not done any bisecting yet, but this is most likely a result of someone casting
> > > a pointer of type A into a pointer of type B which is normally not allowed but unfortunately
> > > also not something that gcc complains about.
> >
> > Hmm, it seems someone fixed the issue on git master already:
>
> Right, alignment issues have been a perennial problem.  We find some
> platform that has alignment constraints that break, fix that, then
> someone finds the alignment fixups cause horrible performance
> problems, repeat ad nauseum.
>
> There's been another round of this pretty recently, which is probably
> the cause of the fixup.  I just hope the re-optimizations that Tom
> Rini has in his pipeline don't break things again for you.

I think the case here is dtc, not libfdt. My guess is something to do
with marker handling writing out dts.

Rob
