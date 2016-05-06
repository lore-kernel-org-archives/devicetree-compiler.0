From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] plugin: Transparently support old style syntax
Date: Thu, 5 May 2016 19:58:28 -0500
Message-ID: <CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg@mail.gmail.com>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com> <1462477724-8092-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=tqR2x7bQNCvbGZKVa7sOLtQBPawIPNcdIrHK/uI8wQs=;
        b=Mb80zzACXQyTYinwdgB2zeYsM//7AGNbL/1IaNVFhyjz2AtzbB+o3gnudOxey74zQr
         dEeAyC7MAHs8JsvRgJv9rdM5Ah9mdnwfn9UND9r8ipGb8C8UtyV+baoDzVWPpkprlhqT
         5281OvtNigRDiBw6du+OWkK8V9MZQOnq064HB0c5aZnnIXrhKqS74eI6Koi93GtKm+lC
         uUw6ZoStHjSbHGxgX0AdgdxlryMnp86Qn/ACN72oBmSe+/9mR43Mm0iSnQSTjPGKCXvi
         XmUl093uUzZt1MuWDIvtflq89mz4gAU8g6jzzzuVKwmMdqMIxRpbz9KwltfP2W3QJ34w
         m+iQ==
In-Reply-To: <1462477724-8092-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, May 5, 2016 at 2:48 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> The old style syntax for plugins is still out in the wild.

In the wild where?

IMO, too bad. That's the danger of deploying prototype code. Perhaps a
tool to convert them would be better.

Rob
