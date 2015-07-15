From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 0/3] Add a couple of string-related functions
Date: Wed, 15 Jul 2015 08:29:31 -0500
Message-ID: <E1ZFMkd-0002ir-O5@mylo.jdl.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1436958839-14793-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

So, like, Thierry Reding said:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> These three patches add a couple of string functions that have proven
> useful in U-Boot's copy of libfdt, so they are likely to be useful for
> other users as well.
> 
> Patch 1 adds a function to count the number of strings in a property's
> value. This also adds a new DTS sample along with a small test program
> to validate the implemented functions.
> 
> Patch 2 adds a function to retrieve the index of a given string in any
> given property's value. This adds code to the test program introduced in
> the previous patch to exercise the new functionality.
> 
> Patch 3 adds a function to retrieve a string by index from a property's
> value along with a shortcut for index 0. This extends the test program
> introduced in patch 1 to validate the new functionality.
> 
> Thierry


Hi Thierry,

While I am generally fine with this patch set, I have
a large-scope question.  Is there a larger plan to
consolidate or unify the U-Boot and DTC libfdts?

Thanks,
jdl
