From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Mon, 28 Nov 2016 12:24:20 +0000
Message-ID: <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=raspberrypi.org; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=l1aTLIO1OGDMNZLv2AeBe8Vm023JaaZ+TV4sa96Fh5E=;
 b=jG0IYc2cUyaTTgw5HpqvppM6VXFVl/89auaJdu1XDQVPRv3yq3GykPEW3SeEhHxyUObZ
 FnJbQgNEL1+NMVUZtkwSIZAJw5dslFU//1ix27lExrOPon4ozs7JHHfZnTmjCcgRnx4m
 4XQEXViWWigEwyYrPZXp0y6QzVTn11rHUjnqfDfXgtME0nOOOrdtRjwRRzxwQvdyyqwJ
 zLKU8CD1X6HoxHgfMMDkRwjhHLdsjkf4W02g0+SNDLedGH3kaGPUZd7ewKME/Q25SadU
 /SbgynzcEPUypI5kr+QXoMwy8hlfKzwtwKzcP12r5C3pv+wfgnViyvbuu3XUuznBRRlV rg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=l1aTLIO1OGDMNZLv2AeBe8Vm023JaaZ+TV4sa96Fh5E=;
        b=ejSDzG7JvIKoI0Qyv0Uh+jfeT+t3tQkrsJOyqHET+a8VI1pNPZeB0wK2EiBKP9FGFP
         BlRMsSrFx9SVkYcWHpySjYBU6QOO3+kaRPdyjcZ2MCideCigaIgYLHzeFzsPfl8RSXVx
         nFVfGnevQKWWmriMtcx/NYLuQuFHytZaaITo4o3yW8k6kFyjslk5umZUfNowjgLdGgnE
         /mR5aUe7ilIvixnQRtiHSUZPyA4BRVISpg4w++jMZj8Y0NJitsdeDeSdqeLyrgFRz4yH
         gUjn6GEO1hUOdWUakR6RXPHI+cZv4sjcWrvKFJA8EkCF6zlu6z+aC7DAXRjIJVlCReR4
         9SFQ==
In-Reply-To: <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 28/11/2016 12:10, Pantelis Antoniou wrote:
> For plugins we need the __symbols__ node to support stacked overlays, i.e.
> overlays referring label that were introduced by a previous overlay.
Although it is arguably useful to be able to refer to symbols created by
one overlay from within another, do we really want all symbols to be
global? Isn't there a call for a new syntax or usage pattern to indicate
either that a symbol should be local to the overlay or, my preferred
option, global?

Phil
