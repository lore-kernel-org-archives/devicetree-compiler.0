From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] dtc: fdtdump: check fdt if not in scanning mode
Date: Mon, 26 Dec 2016 18:24:20 +1300
Message-ID: <CAPnjgZ0Tu-UdEg0Yx1aX+1exnXsR7ukN8d7hCDuxMCDRzboMRQ@mail.gmail.com>
References: <20161221224138.GA14282@umbus.fritz.box> <20161221235906.24281-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=aL28ZrvlPF70Zpsj+xLmAudnlyqH2EWSRevFisyeBlE=;
        b=cl2EYX7fymJhZvlBDq0D27amhUhISNQYyQPsP11CWaQIqbB9mQNssDiQzallzAgw5P
         UryvL01Je0uMjiLNJBeXTCkSuac/YtMaDWLColYnc3IlMFmhxlhRKMvbMw8gzT10LDgV
         Y9RA+s2K2HUjwb8qdM+LZDAwWaOUTZU0slKieEaNIWrI8FJKq8Hj92lTEFjxFTnZzen4
         afVf/Wdq5iNhLGil5/4E2y7OU9UyNd3SxMry7idjbJH8BV78JfMtIKfj2zEhTnI8GA9B
         2dhZKlBRbq7oUMR8cpppL8K/m+UOQb0zCH+mwt6HGQu4R+XE7MYP4dGF4RK6Ms/UaFGs
         GXdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=aL28ZrvlPF70Zpsj+xLmAudnlyqH2EWSRevFisyeBlE=;
        b=FNv1JrzVVajb47JTKSvxcgQii72rt4L9Srdhq+/ENbnWqQHWtFpDqCKTh1KgqQ8gi5
         1YZKoJQPhHs4RRahN7+HGq4txut7yGf74a6GSV1owm7SzuxDMaMmA1/u48MsHo/KpGGL
         DASOQt+hfNtwvhZWplXX/cytZfeRU2SwWvKqg=
In-Reply-To: <20161221235906.24281-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 22 December 2016 at 12:59, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> Running fdtdump without scan mode for an invalid file often
> results in a segmentation fault because the fdt header is
> not checked.
>
> With the patch the header is checked both in scanning as
> well as in non-scanning mode.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>
> v2:
>         Refactor header check as separate function.
>
>  fdtdump.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

nit: I don't think the function needs to be marked 'inline'. It is not
time-critical.
