From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/9] vsprintf: Include stdarg for va_list
Date: Thu, 9 Jun 2016 17:34:39 -0700
Message-ID: <CAPnjgZ39gjACjFpG8LbkhbfMEtkbbnJN=+h5byf+ipXMjFyTgw@mail.gmail.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-4-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=r7COESsvkRGtNbYzvHEZE9S3CD9EGfoX0AY+eUE/F2w=;
        b=gmdZs0MyuHtCoUCOfnNssepmdLwXHDC2PGMrU5byfGxKhyp6SfPX2zz5uDy9JhyJIr
         gyUf3djnG1I9aN3QYtH1/CZl6NrvhMwP1pSJorqbZ+j0o5NdwIFaWaLe5yZtol3Zty3m
         L/jFIlWlsRLdSqQNREgRdbpw++dGuQegUNcybXW1DdijMx9cwpbL8uaMGEUrx+HFVgGI
         86ImdE/B5caRE3UxIKnCN88dB2aNzzrikLsz9wq/oOMSFrUktHFKzLsls7AD8Q+bDVbg
         JYK4jgtZiv8DS7+hk/MSTpeJALe8T07BPQNH/H8yTSRWoqUZBV4XJdQa7OlZNA+tKFgT
         mQFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=r7COESsvkRGtNbYzvHEZE9S3CD9EGfoX0AY+eUE/F2w=;
        b=jfnokHWTyYDMgB+qA3hFwlpuUUWKYypI4pNsV99eqByZt0+1MKHgQws1FFzqdNIJYl
         dAltdwAzLTPaQZKH566qHE2IL+NGJ9EVxXjuAnIHpCG8kIFseATkUlja8QGrAz86nny9
         bp6ECuQIsCquYkLYH2bWQ6ZfzaLe/qeXorMz4=
In-Reply-To: <1464340402-2249-4-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 27 May 2016 at 03:13, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> vsprintf.h doesn't include the stdarg.h file, which means that it relies on
> the files that include vsprintf.h to include stdarg.h as well.
>
> Add an explicit include to avoid build errors when simply including that
> file.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/vsprintf.h | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
