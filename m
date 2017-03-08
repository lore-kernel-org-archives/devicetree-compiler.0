From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/5] fdtget: Use @return to document the return value
Date: Wed, 8 Mar 2017 14:01:41 -0700
Message-ID: <CAPnjgZ3wHCrW1qppPx=VwRVrnKNJs5=hKnq2KzHAhmJBs0j=pQ@mail.gmail.com>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org> <20170304132647.23286-4-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=phDdnC79/+otZTyNZ37eYrBjg+VqVn0iZS2KQ3VeQ28=;
        b=rPCCCJPJ283xleyGs9qKWGhTLF++Gf90LLvORBFyykGtPm3yKay7VYP0tGjC1Zhkuq
         2Flutzh58EKjpZOJ+QAOAY61HGcuB43f3UEiWyZbKOD2jtVUQr0ZqkkMkJ+/0a9ruebb
         LuufBrIRnnKzN2tNDdXSDmGME46IM7Lo51PEVUG/lJTcQ82T8AVc+3cvlirtK4gHuXl3
         60Jg62EPgB2aTNUOx01uue67Myu6MUdNpWwpJmPsw+Lx31iMzClKiQP2aP14DxhfV9aF
         nCakykUzt4jl+wPU9KV+yqCw6vKtmu+pDLJ8SDEv05ltd/BDOj+EhTaCJnWhcwmeY9/S
         cjOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=phDdnC79/+otZTyNZ37eYrBjg+VqVn0iZS2KQ3VeQ28=;
        b=bLEIOrFrnO5VE+NufvKGkAde9hboyoB75+9PYeCJEbMIaLNgvdRZavAFtHNygkMZrr
         wDRLl9g1+VWFH7nN8MvnAEeB8S13axhdqrnE2Us51TZFhJBCx5Zwkrn9IjsjPhm28wVU
         GbqnUICKSjiOSYaMiBifDMBirHtMjGOZyNEgo=
In-Reply-To: <20170304132647.23286-4-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 4 March 2017 at 06:26, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org> wrote:
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
> ---
>  fdtget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
