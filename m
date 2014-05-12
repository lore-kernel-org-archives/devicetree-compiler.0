From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Mon, 12 May 2014 14:27:31 -0500
Message-ID: <CAL_Jsq+zi72PAjQ+RGvUddLtHocgphPQQ9x2X0S0dYGOKz+Hgg@mail.gmail.com>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	<CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
	<20140512060000.GA28789@voom>
	<1399875002.17624.89.camel@pasglop>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=hL9hJKx1mQJSXJ2GgsM7HsthQ/uEMvZ0LUZ07S8jz1I=;
        b=tHowky5GN+PGVXnyPJpN4o7BpMMjdWKkC74Vdrom9ZCcGR7Q7AKAYw37m9NbMW5BWv
         YWDUjhr6W0Ecb++rDlYcm2+xpcq4XdOj84H5Iiz3z7CBBq0Cw1Bf7AvF6dMj9WtnNrWz
         JAorsd6LEsOTQsS8xiyDuqM4etxlqYSwSDJdDixrwCKreR3bIZNbOfz2cTdYs5EPQZSS
         dKqo76W7R2VAFaFqyabypDmxLGBswbK+qrK4JsLMpIwlj+2SdXOlpjZYisEHktchUDtG
         3bm4IKcGy80uohx07e9xvNN8HWDHfMhdaIeywo4iACYnt13sqdyZ3Id5kl2uErtcmTa3
         9V8Q==
In-Reply-To: <1399875002.17624.89.camel@pasglop>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Mon, May 12, 2014 at 1:10 AM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Mon, 2014-05-12 at 16:00 +1000, David Gibson wrote:
>> I'm not all that impressed by this translation code - in particular
>> the per-bus-type hooks don't make sense to me.  AFAIK the
>> interpretation of ranges is not bus specific. I think it will also
>> fail in some cases with #address-cells > 2, which is unfortunate.
>>
>> I'm about to post my own implementation of address translation.
>
> Well, I came up with the original code which did per-bus type hooks.
> There are cases where it is needed.
>
> Take PCI. The top word can contain completely unrelated stuff such
> as the "prefetchable" attribute.
>
> It's perfectly legal to put a prefetchable BAR under a non-prefetchable
> bridge window.
>
> However a translation scheme that doesn't know to know that bit
> will fail.
>
> It's not far fetched, it happens on our machines today.
>
> And that's just one of the problems I had back then...

But what you wrote was for unflattened tree. For early FDT uses, do we
really need to worry about PCI or other special cases? The current FDT
address translation code in arch/powerpc/boot/devtree.c (yes, now we
have 3 implementations) does not for example.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
