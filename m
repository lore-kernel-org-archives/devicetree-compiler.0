From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Support 'b' format for printing raw bytes with fdtget
Date: Tue, 7 Dec 2021 08:07:24 -0700
Message-ID: <CAPnjgZ3MCjyJx5u8daJE-j7z1gg_zzWSffPcGiL9KDb3qttN+A@mail.gmail.com>
References: <20211206154953.17089-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=clZ3zaR54IB74JmVWrIiCUn/oIrk6nngAV6AGyR2CQA=;
        b=iDXr3Srp+8HT6aNE+DloKsfWgjqbCjhLRJgnw5oKg11Js8gdY3YmBK23Fp6qn5WaTe
         DeL9VdfcpQk65BghSrbzdsKpmhqMEq2v570JMB80txH82PhYy3dMGPWqHCbLceWvGaJq
         buWzrnm9ebEoOPkaxJcWB4E9TPeER65s3+Mv8=
In-Reply-To: <20211206154953.17089-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Hi Rafa=C5=82,

On Mon, 6 Dec 2021 at 09:09, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>
> FT is sometimes used for storing raw data. That is quite common for
> U-Boot FIT images.
>
> Extracting such data is not trivial currently. Using type 's' (string)
> will replace every 0x00 (NUL) with 0x20 (space). Using type 'x' will
> print bytes but in xxd incompatible format.
>
> This commit adds support for 'b' (binary) format. Example usage:
> fdtget -t b firmware.itb /images/foo data > image.raw
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
>  fdtget.c |  5 +++++
>  util.c   | 24 ++++++++++++++----------
>  2 files changed, 19 insertions(+), 10 deletions(-)

I think this is a good idea.

I'm worried about using 'b' which we already use as a modifier. Won't
that be ambiguous? Perhaps not, but it needs a doc update, at least.

Please add to fdtput also

Please add some tests too.

Regards,
SImon
