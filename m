From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/4] Add an initial Python library for libfdt
Date: Thu, 24 Nov 2016 11:08:00 -0700
Message-ID: <CAPnjgZ1=QTBNZa4G_uFpka3acr91ywH2P1QF8FJkfS-7Wpd5OQ@mail.gmail.com>
References: <1479423205-9817-1-git-send-email-sjg@chromium.org>
 <1479423205-9817-2-git-send-email-sjg@chromium.org> <20161118003645.GC31640@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=otrvR3LL1olbjnB+rE2JphsZevp2Qh9jjWLM9BuWIR8=;
        b=OUqR+9CjfHQUuEPEV1uBr54w/9cLOazEIqfxcmoZ80U9mnXjR6a17GH5Xbjrz6uybK
         PNqx1Sj2GxTx1jbTdyAtY3sdq711Xzdr8dzIHtVx74o223zlO19tdpzP3wmutVY542Ig
         NR7dWiVdwS4SXfYTRkgZOrHDPLddV3H5MH4onOvt5dkyVGZYveegzidz8gBkEal4gWi6
         E9Vt4fntbsR2AV7U3Pf3ndVoOndCdHbvhMI4B65t6EajODgPeSK0WvROlT300u+3q8NZ
         3ZJ6xak/GNsrNG57a7AoH/fjjWxqnQnYzcZfVCsYGQ1Z0P48IFzdrBP/hzRyBVtveYbd
         gGbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=otrvR3LL1olbjnB+rE2JphsZevp2Qh9jjWLM9BuWIR8=;
        b=m0ltyyggI0b4byTbMk3XDM2JGDHnYi1jow64WjL1zgkR9PVUou0cBhqftmmOT7gdX/
         r+TSz/fvC7p5n/Nd8LykvmQmileK5XBcKUAsIzI6pjopbkiLGHrJ93CXk7QVJaPLRGZQ
         q/5MNQeeUZuc24fwRWHB8nU+LhEn6Os2lEA4Y=
In-Reply-To: <20161118003645.GC31640-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On 17 November 2016 at 17:36, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Nov 17, 2016 at 03:53:22PM -0700, Simon Glass wrote:
>> Add Python bindings for a bare-bones set of libfdt functions. These allow
>> navigating the tree and reading node names and properties.
>
> Nice idea.  Some nits in the details..
>
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>
>>  pylibfdt/.gitignore        |   3 +
>>  pylibfdt/Makefile.pylibfdt |  21 ++++++
>>  pylibfdt/libfdt.swig       | 157 +++++++++++++++++++++++++++++++++++++++++++++
>>  pylibfdt/setup.py          |  34 ++++++++++
>>  4 files changed, 215 insertions(+)
>>  create mode 100644 pylibfdt/.gitignore
>>  create mode 100644 pylibfdt/Makefile.pylibfdt
>>  create mode 100644 pylibfdt/libfdt.swig
>>  create mode 100644 pylibfdt/setup.py
>>
>> diff --git a/pylibfdt/.gitignore b/pylibfdt/.gitignore
>> new file mode 100644
>> index 0000000..5e8c5e3
>> --- /dev/null
>> +++ b/pylibfdt/.gitignore
>> @@ -0,0 +1,3 @@
>> +libfdt.py
>> +libfdt.pyc
>> +libfdt_wrap.c
>> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
>> new file mode 100644
>> index 0000000..fbdbca5
>> --- /dev/null
>> +++ b/pylibfdt/Makefile.pylibfdt
>> @@ -0,0 +1,21 @@
>> +# Makefile.pylibfdt
>> +#
>> +# This is not a complete Makefile of itself.  Instead, it is designed to
>> +# be easily embeddable into other systems of Makefiles.
>
> So, Makefile.libfdt is explicitly designed for easily embedding libfdt
> in other projecs - even ones with weird build environments, like
> bootloaders.  It's less clear that that's valuable for Python
> wrappers.

OK, but what should i do instead?

Regards,
Simon
