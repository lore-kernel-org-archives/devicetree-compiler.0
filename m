From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Unchecked return value error in fdt_rw.c
Date: Mon, 1 Mar 2021 20:29:49 -0600
Message-ID: <CAL_JsqK68HjwdT5+-kjo3Yr7XokC=6ioa7dkMzeUsve8iEzVxA@mail.gmail.com>
References: <1614637450-4972-1-git-send-email-ryan.long@oarcorp.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614652202;
        bh=9nHV0rRA2sDA5ECAEql0By2WEAkPLUuRutt2t0XmsSM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NtQrPnvvVIIJA5L4aZMB2Z4EhS0c5Vq+fOAphB9bFnjzJXriPyWGOuyFLo5sL4iKz
         2NdhEl3xdYGQ83vVnBvSVKxXf3XoT0BdTf3D+uiyRH4sKOT+jTGOv9KUwO7HYZVqTg
         /uHrqR9DEem1M+XisnO+L7rr7p1SG+lKVGw/ul8ToD4KiB/fsvoO5Ga+6MCEgLX+4g
         7THNHWMVUFAJT6coRv6Ssrx5tkwVRhZeRrZzGkl8f+VlSxOwpiBPGeG8Ll8VVLocJA
         PkIc1SPt9zkpwJkweAJGAEXFjEhA/L5VtABcnxW1VkfXJzucuGfGbBEPocBlTGbLJH
         x6KbuUZm/OJzQ==
In-Reply-To: <1614637450-4972-1-git-send-email-ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>

On Mon, Mar 1, 2021 at 4:27 PM Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi,
>
> I filed an issue on github, but I was told it'd be good to send this to
> the mailing list as well.
>
> RTEMS (RTEMS.org) is a free single process, multi-threaded real-time operating
> system with a long history. Your dtc toolchain has been incorporated into
> RTEMS. The RTEMS Project is a member of the Coverity Scan program and it
> flagged an issue with /dtc/libfdt/fdt_rw.c. In trying to be good citizens of
> the wider open source community, the project wants these issues to be reported
> to the upstream owner along with a fix or suggestions. This is one of those
> reports.
>
> When Coverity Scan was ran on some of your code, a "Unchecked return value"
> error was found at line 352 in fdt_rw.c. For similar errors that we received
> for RTEMS, we created a macro that will assert the value returned and "use" the
> return value like so.

Humm, I think Coverity scans run on the Linux kernel too, but I've
never seen any reports on the kernel's copy. Just wondering why...

Rob
