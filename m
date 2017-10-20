From: Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Fri, 20 Oct 2017 16:44:58 -0700
Message-ID: <f9bd98f1-d45c-6d3a-c35c-c67da67c881f@linaro.org>
References: <20171020175548.2566-1-programmingkidx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=k0VIOOtovkXuK3ux2PflKDtaGIriFZe55ou5BQeYq0I=;
        b=UlmydGL+8/IAylfuaV4Ll6cYq7YnoUSsUxsFne6SwOIq43+5i+b3z3tCEeZzlaajO8
         zICZT867fban2g7ac4uS6pyl8TEE6lgXP7w38zEAQPjjtWUGsQjGROI91E91RicYRRit
         7cqqsN/NkhRS7mb0pUbpC+7ssC0QMjSVIqjCw=
In-Reply-To: <20171020175548.2566-1-programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org

On 10/20/2017 10:55 AM, John Arbuckle wrote:
> +static inline size_t strnlen(const char *string, size_t max_count)
> +{
> +    size_t count;
> +    for (count = 0; count < max_count; count++) {
> +        if (string[count] == '\0') {
> +            break;
> +        }
> +    }
> +    return count;

Not to nitpick, but

  const char *p = memchr(string, 0, max_count);
  return p ? max_count : p - string;


r~
