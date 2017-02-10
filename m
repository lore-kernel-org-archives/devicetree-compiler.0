From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 2/5] Add tests for pylibfdt
Date: Fri, 10 Feb 2017 11:39:22 -0700
Message-ID: <CAPnjgZ3Fz6rCKJde8fVK7uL24=Ad+TpPcRu-_oMpRFF3yvfcbQ@mail.gmail.com>
References: <20170205201323.15411-1-sjg@chromium.org> <20170205201323.15411-3-sjg@chromium.org>
 <20170210045619.GD25381@umbus>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NwKwzvizJNee/QvRqtDUt1Ozk9I8Pfc07wiCKF6T3k8=;
        b=hKrZLyJjR7p/xG4qUZ3p8J+P9r9u9n2ZJ8NtKR3Se28RmG8W2e32YGka5V2hqBLBcR
         B2gYFJ0u+2buBCANfScz4mrQsxGCBTWDmb9VoUUSdDbyQUSPTzNkGGn+MGzsQKAolqlj
         yJ4c6WActbJOqHZTSMtEBPjqU4zR8E8YoH/4Fss9r/tLnLAlXl3vAHNr07dkzEWVbPtw
         10niLzcvb24RtVPt+rQG6aGOo9Y0NDBzmm64Wdfq1vjEh09NFEyI4JSBSeTHcI8LICth
         1IQVEpVsvwZOZLIS+KqpB0JeEhpvF4Am+mlQm0FLs7yBt1YY5DC3P1f2m6ALnK6PkWdO
         UIyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NwKwzvizJNee/QvRqtDUt1Ozk9I8Pfc07wiCKF6T3k8=;
        b=Y5D/SyxIU7jSCSgvM3jNoDBvK8GgNtwDxIUCe1j9riOZnV+6N/puu/cQa14ZTqCh2E
         WQeUgAt3zMSnk1Rky5V6Ta8ECxM/E2n8IeDrTJ0OxfvI7MvL9LQB/RXsg90ZqNqV3WD+
         ug78ba+xhX3GqnO7hj3+kyLwkwHt/Upf/JQA4=
In-Reply-To: <20170210045619.GD25381@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 9 February 2017 at 21:56, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Feb 05, 2017 at 01:13:20PM -0700, Simon Glass wrote:
>> Add a set of tests to cover the functionality in pylibfdt.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> I'd suggest as a base writing Python-equivalent tests for everything
> in tree1_tests().
>

OK I'll go through and do that (for the functions I've chosen to
implement) once we have the swig interface set.

[..]

Regards,
Simon
