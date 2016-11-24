From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v9 3/4] dtc: Plugin and fixup support
Date: Thu, 24 Nov 2016 13:49:35 +0000
Message-ID: <dab7f38a-89c3-adbc-07a5-8ef8669ded42@raspberrypi.org>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1479990693-14260-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=raspberrypi.org; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=yBNsxElBtcSOb0gKWgFNlllBVMkRtjXrFD4cdKUBxIE=;
 b=TqkP2OzQW5lDx18knQokLmhDGrKwnx2aJFdVKzPFZ4vEYowO6GKs9mEXPzTNgU9dkwB9
 jPOt0XzvYydzboiI3MMzFJhNtZNh6d+2u5RfR8xm+0QOKXIzwdy6L7vg4MbF2emJe+kB
 Rw6q/kIMeFXYpRLaHXAqDpiY+q/Sq7U14jgPlNa0UIKO1V8N66P1sZnKuB1klkIg9zaI
 ExWj47Z3SRZ+tY0BTlTwjWlcFkQ7rbZ6v4Cq5kowZoKXFhGD58c6yDlns5LOe8iJOTH0
 TxnAgD/ZBLx5P+Wm8bWTndW4LlVapTypCfvqCuyvkCqslq7/IFvXH7ztZ6XI9hjbrFCm vg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Hi+umSRF5i3ursIqbmG3bLy4TkohcAFh2ZnsTow5ORM=;
        b=OJCmXW0pVLTIqRj+iIZsaZOrwT7lB3D012k+SqUSVnme2s0B9iPrpR6hb4qPDkLdPJ
         mBS9lhTlcax/wCtf8M+ZVEttPecsSQ8x26bBfFSlV0lUoN0hknCSikp1t8irurPRNqj9
         hBBy6SppsWYYsHpRisdK3T5l7daG6n97GiMHVaW4YKkyZNZ2aYh9NR88f7XfXxV3OXc/
         qnUwKbBu94xvpbX5YnEn8quTX+QDgyLf2tMblSA0qycxD2vX60Mujh7HT09H5Q0yR6y+
         bJW9dAEznYOWaVrY9OumWRGcrhTeVZBkT7Nh8PpIuk8UX7ahdbqGvIDTqpQeM8AGkYJu
         GAIw==
In-Reply-To: <1479990693-14260-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 24/11/2016 12:31, Pantelis Antoniou wrote:
> This patch enable the generation of symbols & local fixup information
> for trees compiled with the -@ (--symbols) option.
>
> Using this patch labels in the tree and their users emit information
> in __symbols__ and __local_fixups__ nodes.
>
> The __fixups__ node make possible the dynamic resolution of phandle
> references which are present in the plugin tree but lie in the
> tree that are applying the overlay against.
>
> While there is a new magic number for dynamic device tree/overlays blobs
> it is by default disabled. This is in order to give time for DT blob
> methods to be updated.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
It's great to see this work about to come to fruition, but I have a
reservation about this patch. Like previous versions, this
implementation generates __fixups__, __local_fixups__  and __symbols__
whenever the "-@" command line parameter is given; without it you get
none. In my opinion, this logic causes the DTBs to be unnecessarily
large with no obvious benefit.

You can divide the compiled outputs from DTC into two categories - fully
resolved DTBs (what I would call base DTBs), and overlays. Base DTBs
should include __symbols__ to allow overlays to be applied, and it is
right that this should be controlled by the "-@" flag, but since base
DTBs are fully resolved I think there is no reason to include either
__fixups__ or __local_fixups__. Therefore I think both kinds of fixups
should only be omitted when the "/plugin/ " directive is used. This was
the purpose of one of the patches I provided you with.

Phil Elwell, Raspberry Pi
