From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RESEND PATCH v3 1/3] libfdt: Add function to find regions in an FDT
Date: Thu, 1 May 2014 09:13:51 -0700
Message-ID: <CAPnjgZ0ehgSd1WprpMd1ZY=LaZaKkBG3MaNPV5ja27Q2p12WvA@mail.gmail.com>
References: <1395500836-12735-1-git-send-email-sjg@chromium.org>
	<1395500836-12735-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=4wRTg+GmxgRgX0fiUv86UGoQoE6EcUaHptooEG7cm5o=;
        b=nsFQ2tk7UWxid+bd91Jx33Z3hgLEr7sTDakkpzgnUM2VmeyHeifXHB1Xwj5l3jDADq
         I34f/CL2ZEbqSQCy+xP6UVuv/Dw6j51ORD+vX3EWHMdvVZpNWoZa4mFw+QKDhNZp97DI
         H7YgAU6gK2eBVxgH/Plt2Cy7JGMrFdvoMCXQ2mzR2+eUOjHCtoMEnOFELTvaCJsMRaZs
         EB5Ck62f6a6NSHTXxDfQNzD4x9D/Ik0yTBAdLyVekjoWfAOMyacxW4KI1Ixw36OqUZYL
         FxBTusZXakA16Sq7MSCGi/kE1zZi0pVZxJxZbPkpoLpWHz7N23QRF76aEY5m43LwKCRI
         SM5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=4wRTg+GmxgRgX0fiUv86UGoQoE6EcUaHptooEG7cm5o=;
        b=MPOe4RnlBj6frfHnFc0f7VxEMHJR1YflQaTTofgEJ+OdDMA2/th5TnBefYP6vhO5z2
         TlE6OUEHBBfvWibgnN1yyrj2/AG5jpCVpnGntwy+hGXHE09+SO3DYKZEFCm+0EjSU6G/
         rWPZU1U7A9rwjmOPi+j/Ek1CSmSDLUrGA4oCY=
In-Reply-To: <1395500836-12735-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hi,

On 22 March 2014 08:07, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Given a set of nodes and properties, find the regions of the device tree
> which describe those parts.
>
> A test is provided which builds a tree while tracking where the regions
> should be, then calls fdt_first/next_region() to make sure that it agrees.
>
> Further tests will come as part of fdtgrep.
>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Have I sent this to the right place? Any comments?

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
