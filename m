From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 5/5] fdtput: Remove star from value_len documentation
Date: Wed, 8 Mar 2017 14:01:50 -0700
Message-ID: <CAPnjgZ2-LvE4Cb7XbwZrBQPLpkrF91nkhCpqhABReUuxiKNXFQ@mail.gmail.com>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org> <20170304132647.23286-5-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=r7Cz5IOnwns0mkthx/s3x7wkgd7CSXp43Ni8vEc4VOE=;
        b=tzjsINcR/SktI/NUCpE8vbBtitLiMP4A1dv6N9Om9jGjr1+0j+rxHC+Ne7NQfa6TNN
         rBPtHS2O56DUx0Wl8MD3fYlJJo7q5qaMLMAe5Agx65aAypRv5Tinxkjqm1v+tJqH3XKD
         1rvRcg+TcP5oDSp4/2fLEYSg20HnkWLWjQd8D66fMqICHVyjb/x4PWxKRInm4Jpl43Wc
         5Lhih+/VLc/0pvHtasAxVIgMl6/PAhP4dt7Fy86tbiv9eEklV7EFS5gk4QpVf6xdq7nw
         T1Pnt1Z+KtF6rh5Sl2ndWFQbtmaHT/CleCCD2lxLJ6fMNFL2f1I/fvt7A/98uXRwMzju
         8oOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=r7Cz5IOnwns0mkthx/s3x7wkgd7CSXp43Ni8vEc4VOE=;
        b=kCtVZ31Lg3/A3bP4ED5MzIeSlQTxKiq9aaim2/mtpeoD0KYN15ls8CqBebMUblniaO
         qJU1jyKhvNfsPOs4dRa1BLk+IM1/gCV6YA0uooiYU4f+rbtmHDQak0zGrMK6LDXIJU+V
         GBaAownGoep4OOMU56rdUdgjpmCzvJgV8kPWs=
In-Reply-To: <20170304132647.23286-5-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 4 March 2017 at 06:26, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org> wrote:
> When clang checks the documentation tags (with -Wdocumentation flag), it
> reports the following warning:
>
>     fdtput.c:70:11: error: parameter '*value_len' not found in the
>     function declaration [-Werror,-Wdocumentation]
>      * @param *value_len    Returns length of value encoded
>               ^~~~~~~~~~
>     fdtput.c:70:11: note: did you mean 'value_len'?
>      * @param *value_len    Returns length of value encoded
>               ^~~~~~~~~~
>               value_len
>
> As this sounds reasonable, remove the star from the documentation tag.
>
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
> ---
>  fdtput.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
