From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/7] pylibfdt: Allow building to be disabled
Date: Tue, 4 Apr 2017 21:28:07 -0600
Message-ID: <CAPnjgZ1CykjYUSO5hfbJ+N0REtnAy5czrwbF6Mb23ccE_usHdQ@mail.gmail.com>
References: <20170326190623.27518-1-sjg@chromium.org> <20170326190623.27518-3-sjg@chromium.org>
 <20170403184106.GX24205@vapier>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=jkcj8xg4cuIDqGwCqplsCjxRSJ3kkL4OMsczjqj0Wzo=;
        b=t1iAKdEDYNT+gKytwSb82ESxslEKQeugtuJ3fbonczMeA+VHenf6E9XqyWQKYlCipO
         R05UVBtutZcEXzrGT74wB9Yz0Dpqviv961fcmIA4yswmuWvlrxzN9EBM2k1+v+mep+36
         s6GOwHQR0v0nFUWkRMJ3krFN4ZwqTtnTm85+jQwvPjGusKzWv/jA58LbPGm+lYAwwbVz
         +pCkyfNwoYVEpweyQ2DGnUcQ1De+5YENxN8IIvRkbJXwwRHm00YneOysp2nRfLx2Fnid
         q17QT1yMqsNY/1R3abTZeu2pmi6SKYPUrjMkhvQO4C+TPS6Myfap8JP4YhQdLSDGknBj
         rD7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=jkcj8xg4cuIDqGwCqplsCjxRSJ3kkL4OMsczjqj0Wzo=;
        b=VTOmg//IPbjikgXbtl3yWvYSUyza4CGaMDWzJNDCYXB6OH4D/QwBTO/IcAco0EDTuQ
         UsIHOyoJkJI29U/aokCQUHPdalAGGBq59KERI7A03DJjGu6pZ18nHlPI8f2TH5gZXb5J
         av0nrXhNzSCEElBrOEuxEq6w9lfwUFeUsNO5k=
In-Reply-To: <20170403184106.GX24205@vapier>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Hi Mike,

On 3 April 2017 at 12:41, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 26 Mar 2017 13:06, Simon Glass wrote:
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -120,6 +120,7 @@ SCRIPTS = dtdiff
>>  # We need both Python and swig to build pylibfdt.
>>  .PHONY: maybe_pylibfdt
>>  maybe_pylibfdt: FORCE
>> +     if [ -n "${NO_PYTHON}" ]; then exit; fi; \
>
> normally this is handled at the Makefile level, not inline in the script.

Yes it's pretty funny that I didn't just do that.

> also, negative variables are messy.

But I want to build Python by default!

>
> what about:
> PYTHON ?= y
> ifeq ($(PYTHON),y)
> all: maybe_pylibfdt
> endif
> -mike

Regards,
Simon
