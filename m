From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Sun, 22 Oct 2017 14:37:01 +0100
Message-ID: <CAFEAcA8WnzZpdTWjJafLDjTCOpT_=azr6T+8UAnMNyDiD2ZxAQ@mail.gmail.com>
References: <20171020175548.2566-1-programmingkidx@gmail.com> <f9bd98f1-d45c-6d3a-c35c-c67da67c881f@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6ZZPtrW5e4wUXpLeQlEXOr16v+4lfIkMoGuYkReB9Tc=;
        b=d+ELz2GqS+PLu/+4wIM4ygtgv60ZhN9XMPFWY2K3g2XL94qTa2q/UMi1TfilWeh/Jk
         pgjAt/pN7MxiBgpaz0EfgdH6mlkTISQYfdEomqJDtCqFJt6C/DUrMBO7e4tXlqPajwVl
         gZKEt4DKAt2kRW8P30LWJoJyKbdZWnIsI3UY0=
In-Reply-To: <f9bd98f1-d45c-6d3a-c35c-c67da67c881f-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>

On 21 October 2017 at 00:44, Richard Henderson
<richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 10/20/2017 10:55 AM, John Arbuckle wrote:
>> +static inline size_t strnlen(const char *string, size_t max_count)
>> +{
>> +    size_t count;
>> +    for (count = 0; count < max_count; count++) {
>> +        if (string[count] == '\0') {
>> +            break;
>> +        }
>> +    }
>> +    return count;
>
> Not to nitpick, but
>
>   const char *p = memchr(string, 0, max_count);
>   return p ? max_count : p - string;

Am I misreading that, or do you have the ?: arms the wrong way
around there?

thanks
-- PMM
