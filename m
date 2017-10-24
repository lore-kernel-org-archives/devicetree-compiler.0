From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] livetree: avoid assertion of orphan phandles with overlays
Date: Tue, 24 Oct 2017 10:21:10 -0500
Message-ID: <CAL_JsqJAPKYf25pW-4awUHpovq-fxesG-E_rYjh8MGufVSYRBA@mail.gmail.com>
References: <1508854458-9937-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=v/ZuHCXTaUPO3M1pqi/mZMD14SJdUwfBWagWlTRcxPo=;
        b=EOZBAFmxHR0SCw/K5gdnioDhR2kjrLPWnNBMPeefku4DamuxcLWLx7bQhwFK2o7x5g
         fBxR+eaeNrhhZhc5FkuqFt6FT3e9Pu+CPqdtEZzCM0fGSjwe9YyXvMQlrKtxDeaO4/VL
         qIxVy6AZvVbwIFT9IrjcokpxqeH8CUWbnY+CD8eCmO86bh+oKCF9PfUl0gelU6hL/L1i
         SkjUkWFphOHx7LkKAPZz6O1yE1q2EEATwQryLii5LcYhyyyrlj9dSjnXF9VSRIbUqzm/
         894Ie5QspHP8uCQx49VIcoPY5R5kriy+pwQt/4SApC9GPGdxTdjNEbyaneNw1k8KThZm
         ad2Q==
In-Reply-To: <1508854458-9937-1-git-send-email-t-kristo-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Oct 24, 2017 at 9:14 AM, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org> wrote:
> Right now, check_interrupts_property fails with overlays, as the phandle
> for the interrupt-parent can be orphan. Avoid this by allowing the orphan
> node to pass the assert check.
>
> The process_checks() call is also moved later during init sequence,
> so that we can use the global variable generate_fixups to check if
> we are compiling an overlay.

This is fixed by [1].

David, BTW, you didn't push to kernel.org dtc repo. That's still the
"official" one?

Rob

[1] https://github.com/dgibson/dtc/commit/c1e55a5513e9bca41dc78a0f20245cc928596a3a
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
