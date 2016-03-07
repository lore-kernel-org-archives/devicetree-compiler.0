From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Add a libfdt function to write a property placeholder
Date: Mon, 7 Mar 2016 09:21:21 -0700
Message-ID: <CAPnjgZ1oE91rJ_6jeRWWgWcUQ61_Kpr_yzeqBnKuta+cVGqGCw@mail.gmail.com>
References: <1457319172-24071-1-git-send-email-sjg@chromium.org> <20160307043247.GH22546@voom.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4p2fsRRWGOWrmNNfhNptF0uQOVjl++1/kf0g/XLehuk=;
        b=d3Z4+r9DbkfgyX66DWBAPogOCAltD4NmKTDqgdox5KmD363OahXe304dZvSkPTH16A
         bne3Tpm5MNoFqHd6/OCXWdODE9oLjZHZSMX0Omt9t3rwd7NcTo03CyjyJl7le59Y2QiK
         CbAN1zLVY1/Jm2Z0G3TtHwa9q8C9gjjAS6LZlrlhTtpxb8iZOWYUVMR0TdZfeF02iUwu
         1UbByrnT/jx5wDxIoeHgkcLr4AQK0hql9YbhpC9iBXxi6mashvRxl0Rqu/O4Ay448Yxn
         O9RISEOgM4bx7oW3HlJHrWVQPSaYqld7h/CggYjdXYm/Cnp4HYEleTYP6WIIhBQ/7NgC
         EOKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4p2fsRRWGOWrmNNfhNptF0uQOVjl++1/kf0g/XLehuk=;
        b=hvb7BPdbz9/zKUT6F+iaSAK5Df3tkmqq5DvEnyViVgAreZomqrKNZAYAaXkjgK/jEv
         3p2yRE6yeI8lRHPYn9ynaiJUA0oxNzo/CU3gIa6W/EPNL4qjUF0kyfhO0XL94DGVUnZY
         m7MqkDS+dFCIZza2yMCnyIIx1+gWK4m8+Yi6s=
In-Reply-To: <20160307043247.GH22546-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On 6 March 2016 at 21:32, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sun, Mar 06, 2016 at 07:52:52PM -0700, Simon Glass wrote:
>> The existing function to add a new property to a tree being built requires
>> that the entire contents of the new property be passed in. For some
>> applications it is more convenient to be able to add the property contents
>> later, perhaps by reading from a file. This avoids double-buffering of the
>> contents.
>>
>> Add a new function to support this and adjust the existing fdt_property() to
>> use it.
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> The change looks fine, but I'd like to see a testcase added for it.

OK good. Yes I'll add that.

Regards,
Simon
