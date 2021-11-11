From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add static lib to meson build
Date: Wed, 10 Nov 2021 20:20:52 -0700
Message-ID: <CAPnjgZ3RuJAkndfHf6tUpVd07Nxi1Y8aWtZOaDbik0Ss8xpO_g@mail.gmail.com>
References: <20211111003329.2347536-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fpp1KD6lkDMNNEoQfmsV38KRhY1M4ttFfL1EaaEhe0s=;
        b=a6AlHYtb4WrJuffBlwMOJxpU11cp0tVMD84BEpm2j6CaUMRK0mput1yVsAULvDx8xr
         +qbn6KXEoinv+5El/e6RIg4QWx9ROWAhD0j/b6fSnGag4PEBbvtMVHmVx3PzYUpy8pyc
         t0012BDLfJtVDuXsZJptzjXpsW7R9qErBT0OM=
In-Reply-To: <20211111003329.2347536-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,
On Wed, 10 Nov 2021 at 17:33, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> The meson build is not building the static libfdt, so add it.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  libfdt/meson.build | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I have again lost the patchwork thing for this mailing list. Any hints?

Regards,
Simon
