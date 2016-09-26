From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: Home Page of dtc is gone?
Date: Mon, 26 Sep 2016 10:49:40 -0600
Message-ID: <CANCZdfpDnsx-eMqBUg30BUnfxTPt1qQKbXd=gp6um03Z1vfVTQ@mail.gmail.com>
References: <1f25b3eb-efbb-561c-1eff-f3daebdaa80a@redhat.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=94Twb3t14GXTcqELpI7Gc91Fd+UUqH+3aLstN5dfaEg=;
        b=r/UAOC8dlvawXAxGZk2gqJDttfpclD2NlO0mfXlDzhoslqswd9ZhO5VE6T3XESJF4H
         ezlt30ofvR47za1SDKaldIHr1ig4THc9lYWWxn180XIERawv1owdRzOb1RZepGjL2KCh
         mNaHpIr7skxu6b8VQkXbGF+12ECIWfDxLwTr/H0vlLZGiST7KYvwA5BIt+EW90HObz1M
         7C7DNR1ZLoh2AZRg2/cYD66XH2zuUon+Ii1Fuj1xpMLsSVyb1o/Ubt1CyuSq7p5NOLFB
         s4t4NJ6JUzb0pKpjuAVWGfREn1t+FC5BRwbjVtYidHwrGUs1agelcJtqocDFzWK4fYwz
         WBMA==
In-Reply-To: <1f25b3eb-efbb-561c-1eff-f3daebdaa80a-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Also looks like the "standard" needs to have the de-facto additions
for overlays that are now widely deployed added.

Warner

On Mon, Sep 26, 2016 at 10:18 AM, Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>  Hi all,
>
> according to the README, the home page of dtc is:
>  http://devicetree.org/Device_Tree_Compiler
> However, when I open that URL in a browser, I only get a 404 error.
> Seems like the Wiki that used to be there is gone now and dtc needs a
> new home page?
>
>  Thomas
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
