From: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Sun, 22 Oct 2017 10:29:47 -0400
Message-ID: <A2F88E43-0C42-4BD5-BF51-23C4550D780E@gmail.com>
References: <20171020175548.2566-1-programmingkidx@gmail.com>
 <f9bd98f1-d45c-6d3a-c35c-c67da67c881f@linaro.org>
 <CAFEAcA8WnzZpdTWjJafLDjTCOpT_=azr6T+8UAnMNyDiD2ZxAQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=aWJjv7RyGysbJQEDnvlXQXUx/deHcRO5caXQv6XWvNY=;
        b=Eu1DbTjo41kOkcSaJ8lpKjsKTtSpTYqk/f1e/t2I32RJtVWj3yHTMCWVwTm5Tq0bg2
         qK8jmdcK3laDB6JBQ2WUxr6Vv+in/V3tq+Y5MRfU/OtYisDsUQeyAGq70EPqhdeApdbB
         uuIIw0SlmrA6ExOCEtH+5c54JBjslzdKpd6+HWCyvCLoGAQQgnu4zYJ7Dyevpld+0fpE
         kXA9uMM4WwdH6fb/5/HOR3dHDfaDvoKVUMu5uTAa+LEOviv8YiHs15JqtNsBUD97FoKv
         sshuYYti9yrQkhr1CNfCPNQi/ZYq4K1XaLWYA6yIIAgw8K/8LQkrSKpShKly4fgs9w73
         J2YQ==
In-Reply-To: <CAFEAcA8WnzZpdTWjJafLDjTCOpT_=azr6T+8UAnMNyDiD2ZxAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>


> On Oct 22, 2017, at 9:37 AM, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
>=20
> On 21 October 2017 at 00:44, Richard Henderson
> <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 10/20/2017 10:55 AM, John Arbuckle wrote:
>>> +static inline size_t strnlen(const char *string, size_t max_count)
>>> +{
>>> +    size_t count;
>>> +    for (count =3D 0; count < max_count; count++) {
>>> +        if (string[count] =3D=3D '\0') {
>>> +            break;
>>> +        }
>>> +    }
>>> +    return count;
>>=20
>> Not to nitpick, but
>>=20
>>  const char *p =3D memchr(string, 0, max_count);
>>  return p ? max_count : p - string;
>=20
> Am I misreading that, or do you have the ?: arms the wrong way
> around there?
>=20
> thanks
> -- PMM

Yes. It should read:

return p ? p - string : max_count;=
