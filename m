From: "Marcus Comstedt" <marcus@mc.pp.se>
Subject: Re: [PATCH] libfdt: Remove superfluous NUL character from overlay
 symbols
Date: Sat, 23 May 2020 17:13:35 +0200
Message-ID: <yf9o8qe8z1c.fsf@mc.pp.se>
References: <20200522164136.26069-1-marcus@mc.pp.se>
 <CAPnjgZ1eU7xOgfGd_6bnUXs_98YOp8gfCz4YHHoHXtCY_h1_Hw@mail.gmail.com>
 <yf94ks627a2.fsf@mc.pp.se>
 <CAPnjgZ3QVHQg6p6JRgqyCTxNzjpTDvMcdeXpw6pZfjajCB+c7g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mc.pp.se; s=hedgehog;
 t=1590246816; bh=sY/YmIVami4vKTzDbmeUPi0uQjgMsvpurG9X+xJnhDE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
 MIME-Version:Content-Type; b=x5fXjaMO4MnTj5QG/E2Ct6r9f2VqXXKnmwjIk
 TOlUfI1Catr5jt/efixVnitS0ZzXpG6+ACPJfVk08IJANPp57EnAUIZg/a5DDNuQtPd
 gJfpS/NY3/THGeZ2LiGNB7FznvHlmz8aToEoWUyfhgpHp+7+hW6VvdAR71+S6UEmQ2E
 =
In-Reply-To: <CAPnjgZ3QVHQg6p6JRgqyCTxNzjpTDvMcdeXpw6pZfjajCB+c7g@mail.gmail.com> (Simon
 Glass's message of "Sat, 23 May 2020 08:57:20 -0600")
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <https://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>


Hi Simon,

Simon Glass <sjg@chromium.org> writes:

> You can send your patch to the mailing list on cc.
>
> Also see README.fdt-control fo the the git repo and other details.


Thanks.  Sent.


  // Marcus


