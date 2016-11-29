From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 10:32:28 +0000
Message-ID: <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
 <20161129021131.GD13307@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=raspberrypi.org; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=UdCHfvwqOZ601haoyTvF1KIaefHToQ4g6HqkY/nUPGM=;
 b=2QrY9EPNtjo4TPGC2embKJweWEZAxIjuIV7OFMhTdMrxgcOxTlVyXMWyCBO2Ebli4r17
 xvhWzz/qXmm+KOOVOU8tWq8VqEBAh1jqYSugVwEgnD2QWgnu6DlAZ08nb7x/pPkb7GAW
 MUktdCkJPRHvdA0ESCxDemsNUhjJsg/fxc6holSbt6WEIDhDf/IRZjyvxNn3l6WT3W6J
 nE1arrmrnollxZEW7NF1Q0m5Y7SFURuHqG1cRIH16y0sHb3mN+VeuOJQofuT9hUeTqd/
 7gwyCiePL9U0Mw7lyGIzRrjhVrxTpn3txEIMRCrOr80uWcI4m4JbIIOXT9hXUCvTAGSm pA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=iM+LVWqTQuO1uG74gNFKu7NfzD1TYxRWoCQn0mwKCE8=;
        b=CcGEOXME+hcagvAdqU8PhxGnRLJBbfoiYGiZCJfPtEkaGx7v3WJRBwksXt8AFsxNvL
         48U9ol5KBS2XfDorePXbJWlGhfcvrR1PJjvtpefDFmkF5MVZ2VFRVpwnWxaRubEsGmvK
         p3N7s0EhcLIMDno4AfK+Y9RkANLRo603QmOGywtVchkxTJ4sUwOSKjKkVS7S5g73IMb4
         crLt3+gK89gJp0Y3SUGX4x36E/akIFxEBTw5758li6TTZ4sNx3XUfHyXvhzC+mUvMdup
         O+n+Hd2UaCWWCiZixS8lK0of5d6QSQy9yHkPiryQ/EXvwzbTiVZ+bpurgeoKhTQ+CH37
         k4ig==
In-Reply-To: <20161129021131.GD13307-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 29/11/2016 02:11, David Gibson wrote:
> On Mon, Nov 28, 2016 at 12:24:20PM +0000, Phil Elwell wrote:
>> On 28/11/2016 12:10, Pantelis Antoniou wrote:
>>> For plugins we need the __symbols__ node to support stacked overlays, i.e.
>>> overlays referring label that were introduced by a previous overlay.
>> Although it is arguably useful to be able to refer to symbols created by
>> one overlay from within another, do we really want all symbols to be
>> global? Isn't there a call for a new syntax or usage pattern to indicate
>> either that a symbol should be local to the overlay or, my preferred
>> option, global?
> So, this is back to a design question about the overlay format.  As
> noted in the initial discussions about possible "connector" formats, I
> think we will want some sort of local symbols.  But the current
> overlay format with all global symbols is out there and we need to
> support it.
The overlay format we have does not dictate the scope of the symbols.

In all implementations I know of - the Raspberry Pi loader, the current
Linux kernel, the latest dtc patch set - there is a completely
asymmetric relationship between the base DTB and an overlay:
* the base DTB exports __symbols__ to resolve the overlays unresolved
label references, as recorded by the __fixups__ node
* the overlay's phandles are renumbered so as not to clash with the base
tree using the __local_fixups__
* the contents of the __overlay__ nodes are applied to the base tree, as
directed by the "target" or "target-path" properties

The __symbols__ node of the overlay is ignored and discarded. The
__fixups__ and __local_fixups__ in the base DTB (if present - the RPi
dtc only generates them for /plugins/) are ignored.

In the set of RPi overlays only one exports a global symbol, which it
achieves with an overlay aimed at target-path = "/__symbols__" that adds
a new symbol (in this case "i2c_gpio").

If the __symbols__ in an overlay are automatically merged with the base
symbols, that is a significant change in semantics which needs to be
discussed.

Phil
