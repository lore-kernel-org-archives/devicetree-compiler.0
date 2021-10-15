From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] checks: Ensure '#interrupt-cells' only exists in
 interrupt providers
Date: Fri, 15 Oct 2021 14:28:35 -0500
Message-ID: <CAL_JsqKQ1sNxRP_t6+aYzpQ=s5iR1ui=fO=pjQSB1wgTMXLjgQ@mail.gmail.com>
References: <20211011191245.1009682-1-robh@kernel.org> <20211011191245.1009682-4-robh@kernel.org>
 <YWeoEh6n6yzJvEjc@yekko> <CAL_JsqLT3FKtaFxTmWU=Y5_D=EyP=L_Aouij2Qw7MKOJ+RY-HQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634326128;
        bh=PBJJqzsTFc7m1igJHib8dE7h9Y6NQrFncaF9LPYZKCQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PVDK1JdmU32/vvEUEtUqQ5yShPoavV8zLhPCf4HX2oWVaKkks0gVAamiLNyVoOJto
         ZlOnxIcuXAQNWbSY7kOYEPVpED76Qo+3RSS53ErqBB9imNIjNiRNL12k1XMsHyJ6mq
         zu5QITSZ+tt2a2yNp8MoC0bfYMVirnCjUAMyYf7YEDf/KFg7WMR4CB4gwhzoHnebdt
         l7OKK8ZWwYa6n35a79UJMZe8nhq9KizOdqsVUyrCTMXN4O1JqpAigjyC37EghToYG/
         j/IB05pMh5edfGchz5ecCfKsJF0mWagIdqKa998TUGf6aEGd/R63yD55AlGqJIdrPq
         FYnGv8XgUgfbQ==
In-Reply-To: <CAL_JsqLT3FKtaFxTmWU=Y5_D=EyP=L_Aouij2Qw7MKOJ+RY-HQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

On Fri, Oct 15, 2021 at 1:43 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Wed, Oct 13, 2021 at 10:51 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Mon, Oct 11, 2021 at 02:12:44PM -0500, Rob Herring wrote:
> > > The interrupt provider check currently checks if an interrupt provider
> > > has #interrupt-cells, but not whether #interrupt-cells is present
> > > outside of interrupt-providers. Rework the check to cover the latter
> > > case.
> > >
> > > Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> > > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Applied, thanks.
>
> Thanks, but not seeing these commits...

NM, failure on my end...

Rob
