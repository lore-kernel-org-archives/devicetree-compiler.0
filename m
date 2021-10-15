From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] checks: Ensure '#interrupt-cells' only exists in
 interrupt providers
Date: Fri, 15 Oct 2021 13:43:14 -0500
Message-ID: <CAL_JsqLT3FKtaFxTmWU=Y5_D=EyP=L_Aouij2Qw7MKOJ+RY-HQ@mail.gmail.com>
References: <20211011191245.1009682-1-robh@kernel.org> <20211011191245.1009682-4-robh@kernel.org>
 <YWeoEh6n6yzJvEjc@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634323407;
        bh=CPcXKbrg9SxQrH1NAHX58Eg8jEmX82u5lH3jT4uQfDU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HubRPaxZofgBrQP6ghSMjSxMQJ6yYuwjgOMVTwrnV+AWWQP9//Bc03tBRpxPabJj1
         djXiBPgpo9wJBj8I4Ax5MLLonWQSDg5yg+df2Z049uPSE66vh/qr6uDUgXmixWyaAc
         aCCUyZv8HVgfDmM7/oxTa25ulFTS/tzahHkT6Iwgt1Jrf1NoK4VcbIEy/ldSPn+PnR
         VGvl35byVpwhpcXKd1j471nkU4M2P3ma0mJ7hkRBpTvkToPWtBLj0oVtR+6CwOaJs2
         8XVfdjeQqA+FObbhElfDiIiA0LooLJyCc9yCT6rfKh/l1s2UZGx3qhwcl3IfM9Txw2
         qVfNLIRkOaErw==
In-Reply-To: <YWeoEh6n6yzJvEjc@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

On Wed, Oct 13, 2021 at 10:51 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Oct 11, 2021 at 02:12:44PM -0500, Rob Herring wrote:
> > The interrupt provider check currently checks if an interrupt provider
> > has #interrupt-cells, but not whether #interrupt-cells is present
> > outside of interrupt-providers. Rework the check to cover the latter
> > case.
> >
> > Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> > Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Applied, thanks.

Thanks, but not seeing these commits...

Rob
