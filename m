From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Applying dtb overlays on pre-compiled dtb's
Date: Mon, 27 Feb 2023 10:47:40 -0600
Message-ID: <CAL_JsqLJ857COrUg9xhqqQRRTxfX_g7pQ=w8Wat6xuZxdHdTXw@mail.gmail.com>
References: <CAL6CDMFiV0_rmE+gTow0X7Wnj7eS6YDu0Ya7dmNACnL1rRy4_w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677516472;
        bh=2U9p2vJxeQgdmE69zhvAsoMf9y/5jFqjUM7Uuvh4IUY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=l1T/9532eZLsAhhtkrE1YjFN7Z9EXVd+rtICQ5h+YloAylzMG6/ED/+d5iVOe0FHq
         jNt4HzSHpDOYvyuLJdU8BwF/ut3emSdconY13cDwpDSZOJlUklvlPt0ETYVnpCXZ2y
         vnu6Qr24xJHcqbp3y/sjvr9q4GDWJKM5k7oE/atzE6VZkotlggBLCBByqH++nhxGaE
         9i1Sl7F2NF8tdP4UuKQgOxg79HaTq1bo+4j6/lEmnqdlxH8Ls3gVYKKYoa2Soim+mA
         cpYYKD1wuGMpxclht2iZTYzQxIb+EK98HODTLTXuKWC7QiJkbAKJeRiMsuZ6SIwS43
         uf/hPXIuWndrw==
In-Reply-To: <CAL6CDMFiV0_rmE+gTow0X7Wnj7eS6YDu0Ya7dmNACnL1rRy4_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Igor Opaniuk <igor.opaniuk-WQOgUJUq/S3vYQKSrp0J2Q@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Feb 27, 2023 at 8:25=E2=80=AFAM Igor Opaniuk <igor.opaniuk@foundrie=
s.io> wrote:
>
> Hi everyone,
>
> I apologize in advance for the possibly wrong ML for this question.
>
> I'm currently looking for any existing ways of adjusting pre-compiled dev=
ice
> tree blobs. I know that dtc doesn't have such ability (and obviously its =
purpose
> is different), but maybe there is something you can recommend in this cas=
e
> (kind of userland analogy of U-Boot's runtime "fdt apply" cmd).

fdtoverlay (in dtc) is the Linux CLI equivalent (and same underlying
implementation).

Rob
