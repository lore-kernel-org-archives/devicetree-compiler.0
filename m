From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 5/6] pylibfdt: Rename libfdt.swig to libfdt.i
Date: Tue, 4 Apr 2017 21:18:18 -0600
Message-ID: <CAPnjgZ3Bj5AY2nburGFmxScH7-Ws4R6sxWZQkqNW3NxNt5-5aQ@mail.gmail.com>
References: <20170329181541.28856-1-sjg@chromium.org> <20170329181541.28856-6-sjg@chromium.org>
 <20170403043721.GD10997@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=FV1jvkrrfP9aEdQ9iw7q05uoXYs74XijPkTdCHG3eXU=;
        b=T7MalaEFYG4072oP+HMfSwXGoNT0U+Oy4eJ5U5LMaEl18cTXWz/AFzVl+h6/m7oEnt
         sFFP4YDwmvOf3bdsi5tA1VNmTLSqV89Xs0m2HTozqOKQh/8aWzM8Tf4Gw3/KYTKtWkW7
         NB3I+OyzXL/uK79Sdm+CftqIf98Or1bPQWugcK0fkiMXgAQ8KnQtFdXpcfpoCu0UfAKJ
         2bctvcj/qJKzhCW0fYSkWpJVIFEQv1yQFnb1sGIKce1pwVnXl1hlVEr3mrXbRBFogQGT
         eCkOhpdPZSCuGZNzDijDtVkNB5k/rA3JiE8gbXyA/xkXUsTN0YQ0gTEtTvo+XfRICELX
         TzWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=FV1jvkrrfP9aEdQ9iw7q05uoXYs74XijPkTdCHG3eXU=;
        b=loJihKv9P4GX2sn8ZUy96dPoVxNMzZdezcsGMXwpNWDX2LVYGgfPaPUns/u/1Ff+gN
         fmsEJtocMkczOjEVX4/05DpdZ9OstrTbXwwXxjgXheF9Xh3KNtvyKJ3xE4C+Ww8Peo2k
         /LGSllpwYmL0ENtb6Hb0dckT6nPUCILiUcRlE=
In-Reply-To: <20170403043721.GD10997-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Hi David,

On 2 April 2017 at 22:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Mar 29, 2017 at 12:15:40PM -0600, Simon Glass wrote:
>> The .i extension allows Python distutils to automatically handle the swig
>> file. Rename it.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Uh.. please don't.  The existing Makefiles use %.i as a target for
> preprocessed-but-not-compiled sources (occasionally useful for
> debugging).

If I don't do this I can't make the setup.py thing work. There might
be a workaround but I don't know of it.

Since it is in a separate directory, do you think we could live with this?

Regards,
Simon
