From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/7] pylibfdt: Use environment to pass C flags and files
Date: Tue, 4 Apr 2017 21:28:09 -0600
Message-ID: <CAPnjgZ0cCpvSoarjV7v999-yYJ8ttbGX3uG0b3ayCQ_MdzRXcQ@mail.gmail.com>
References: <20170326190623.27518-1-sjg@chromium.org> <20170326190623.27518-4-sjg@chromium.org>
 <20170403184222.GY24205@vapier>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=uSQrXUaE6uOxBwvKLndLTYfxdsj12cVhCvRexLhzzpI=;
        b=j5CMyWGydxGJnBhxG2b/ybdPjhhxrYPh/lRTc4D0Pd49Ik3fkY4mokuyh/krxA2YpD
         RMJapu0YUTUJ0diWijeQqUatgGOOKYwEe1XkFTjXLjgl+ywMNd6ydTDhHPZIjQ2VhpT+
         p+3iM1ylhzyuHfqYQ3artHfvD7AWROulkM6X4myYtPLPbQ4UvIlXteiHBysso0XuNi5P
         7mBUIBxd2yE3XEm5/S+eOcelVq+HeKB9fvvZXYQnr0PqfPOQhwGylvXO4ktV2wmkRHsq
         4u3BXWXTc85Kmb+6bAla/+jcp/nwNFhlt9c/n293bxOS2HAt/cMlppqSBYH3AAHStplh
         33Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=uSQrXUaE6uOxBwvKLndLTYfxdsj12cVhCvRexLhzzpI=;
        b=REm4Ysci/UY3ZgnUfoaxAaEtF8IFlhq1idX0iSXCvWn+g9brz6Zd4UNm5BLlww0UZq
         TpGHiP0d5yAx6D98bDd1ZbXSTbVvhZX/qi322S0a3tij5EMs0p2GAWC9kvSgeheE1gzG
         lx++VG0M4qV8H12mjEPhlPVY0mVc68qifwgaM=
In-Reply-To: <20170403184222.GY24205@vapier>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Hi Mike,

On 3 April 2017 at 12:42, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 26 Mar 2017 13:06, Simon Glass wrote:
>> --- a/pylibfdt/Makefile.pylibfdt
>> +++ b/pylibfdt/Makefile.pylibfdt
>> @@ -7,7 +7,8 @@ PYMODULE = $(PYLIBFDT_objdir)/_libfdt.so
>>
>>  $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
>>       @$(VECHO) PYMOD $@
>> -     python $(PYLIBFDT_objdir)/setup.py "$(CPPFLAGS)" $^
>> +     SOURCES="$^" CPPFLAGS="$(CPPFLAGS)" \
>> +     python $(PYLIBFDT_objdir)/setup.py --quiet build_ext --inplace
>
> you should make setup.py executable and drop the `python` call here
>
>> +files = os.environ['SOURCES'].split()
>
> you could parse this from the Makefile
>
>> +cflags = os.environ['CPPFLAGS'].split()
>
> this should be:
> cflags = os.environ.get('CPPFLAGS', '').split()
>

I did these in a separate patch as Makefile parsing is a separate feature IMO.

>>  libfdt_module = Extension(
>>      '_libfdt',
>>      sources = files,
>
> python style says to not put spaces around = when it comes to args

Yes I was following a crappy example - will change it.

> -mike

Regards,
Simon
