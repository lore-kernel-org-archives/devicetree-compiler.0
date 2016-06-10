From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 3/9] vsprintf: Include stdarg for va_list
Date: Fri, 10 Jun 2016 17:00:16 +0300
Message-ID: <5C56982F-F37C-4DFA-B42F-6B1B4435C24A@konsulko.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-4-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=subject:mime-version:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7sXziJlmt3ssGBrsWrfZHXIotEqBaykdorT81BzB5HU=;
 b=f0iWj39fyNj/aBTk/+9AiOfjYxxWKxPgWvMgvLMYuCbZnL8XfNrERSFg/wF6hC4TnR
 FUcpmWUE4dUaNkR146WkOCoLIllA82hcAFbaelDhebYqCYmwtjnQ9BdbrxXSjUIJJOiA
 r9V7xcNAvWsg3VxlcF0KbKacj5TO4E5JSEtuo=
In-Reply-To: <1464340402-2249-4-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, Alexander Kaplan <alex@nextthing.co>, devicetree-compiler@vger.kernel.org


> On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> 
> vsprintf.h doesn't include the stdarg.h file, which means that it relies on
> the files that include vsprintf.h to include stdarg.h as well.
> 
> Add an explicit include to avoid build errors when simply including that
> file.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> include/vsprintf.h | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/include/vsprintf.h b/include/vsprintf.h
> index 376f5dd32499..60e91d119eee 100644
> --- a/include/vsprintf.h
> +++ b/include/vsprintf.h
> @@ -8,6 +8,8 @@
> #ifndef __VSPRINTF_H
> #define __VSPRINTF_H
> 
> +#include <stdarg.h>
> +
> ulong simple_strtoul(const char *cp, char **endp, unsigned int base);
> 
> /**
> -- 
> 2.8.2
> 

Acked-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
