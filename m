From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v8 2/5] Add tests for pylibfdt
Date: Sat, 4 Mar 2017 15:59:31 -0700
Message-ID: <CAPnjgZ1W9QzgW+T2qCWw4ZSw7Xs73RTv6=H9h8osEdnV5fo0sw@mail.gmail.com>
References: <20170301053415.5388-1-sjg@chromium.org> <20170301053415.5388-3-sjg@chromium.org>
 <20170302122941.GA4067@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rmHgsR9KhzVwnHWYbu/tZBRy31XpVSuxe+F4EegwVpY=;
        b=rntIq2NNRH9jp4SOa+Wa5Ho3y8kphG+w0ZgCimmICfrAIFSca9/klTzcciJlBEY7nV
         oGaEECcTUNR3gDXwZ8j5Hl5ScrShBl5JDQeBT/Prr0I30dhsLPxjK9u6sjLkvgjcnx3s
         qYZ57s3GbLw+jFbot9pORYHxsRCGdzHyLqdMrVlgkO99afh/HEegRuWIk8e26iu6iANk
         hlQu3bFe3cN0yEIXj1Qout7JnfySuAiqrmIsOPkiEci930L2WH+o20hLGn7IAmuDyLBL
         GGiHZfb6qc0p3XGHd5sjouRBz/yzUy9kItYTRr6nSmWPcb+RY2sTLwbQn/09YbM5EGrv
         Jl6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rmHgsR9KhzVwnHWYbu/tZBRy31XpVSuxe+F4EegwVpY=;
        b=Y0umHDOfeK9aQW1vmuJs8WQfqk7kjMxPnnpdzL7vfKmLnLdvjc9RyyONOtItaBUITM
         vrAziaPRQwJxfwFx+xe+a+jyhfHvelVjgTYzxItKlRjr9tDTUjwMR2u1v8d/+swVJjul
         xJ2mUBmeAQENWx+fk7P3U4bM+nmJnZ+tfBneU=
In-Reply-To: <20170302122941.GA4067-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 2 March 2017 at 05:29, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Feb 28, 2017 at 10:34:12PM -0700, Simon Glass wrote:
> > Add a set of tests to cover the functionality in pylibfdt.
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> With the first two patches applied, "make check" gives me 34 failures
> - but it doesn't actually seem to list them.

OK that's because I am changing the test script in commit 2. I'll move
it to the last commit after the library is actually built.

Regards,
Simon
