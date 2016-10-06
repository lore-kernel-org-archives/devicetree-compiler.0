From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/6] libfdt: Sync to upstream
Date: Thu, 6 Oct 2016 08:36:36 -0600
Message-ID: <CAPnjgZ07Ab8fX2ZNUikjKxenzvswdkzdn1-8uiTDqNp3Um2sQw@mail.gmail.com>
References: <1475452771-16230-1-git-send-email-sjg@chromium.org> <20161006135326.GC4684@lukather>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=u8CarMWc8Ef5dqmxK+0NxA4MOBnKF7SXYgbKrdXrxBM=;
        b=gFUtKDoMdHGE2nal1jGsdNHu97AHY5dwO1F0a48Ah/EQdHXftaj6S/5i16OqpYFyVb
         2lpPgSOdin3x0Cn4+BxkH7yGt6ca9+DhFV+7dZ2EJY0rwJRUKAtqCFmUX7NPrQS415Wj
         PORGbvvbwXJzy8ziHyyT/J7XmS3aVEinosXCfpypUbJLdcVPTrR5uStAIJlkRC5rCDZX
         Pj2xNbhkDcj7PJXLxO2e6Bbhl3n1WB4oMPt/zJE2RkqayP1BVWsXoVFDBu2iuRlliU4N
         D52pV+mY0q6aEaIijsCaaL1Woq/gLlemftwNbANaXxx+7OpyrKps/dl+AWITev1eHfOt
         NGBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=u8CarMWc8Ef5dqmxK+0NxA4MOBnKF7SXYgbKrdXrxBM=;
        b=QUQGDQx+fv4zAHnTzIH2cJNAayD8XMDkd9e7SGL7SjvwcICu56PddT/BcoqRXA5HF3
         KsKB0ODZlbL8WFtCvqllXJtCsSGIql+zcigBkmRObimFmGwEjt8wbEJJuZbfOUrVaZwH
         NFXcq1JJdnfxfbix/SgxHuyB8LtHBrn+fdFE0=
In-Reply-To: <20161006135326.GC4684@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Nikita Kiryanov <nikita-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Andrej Rosano <andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>, Minkyu Kang <mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Przemyslaw Marczak <p.marczak-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom

Hi Maxime,

On 6 October 2016 at 07:53, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Simon,
>
> On Sun, Oct 02, 2016 at 05:59:24PM -0600, Simon Glass wrote:
>> In a few cases the upstream versions of functions first written for U-Boot
>> have landed in a slightly different form.
>>
>> This includes a few patches to fix these as well as various minor changes to
>> reduce the delta.
>
> Thanks a lot for working on this.
>
> The overlay code just got merged, and it has a significant amount of
> fixes, so it might be nice to do that sync with the latest dtc HEAD.

Nice work! I see you have sent some fix-up patches two, right? If so I
should probably wait until they land.

Regards,
Simon
