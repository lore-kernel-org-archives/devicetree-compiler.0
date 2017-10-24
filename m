From: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Tue, 24 Oct 2017 00:16:47 -0400
Message-ID: <4CE427C5-BD1A-4911-9B10-CC1C0F80FD12@gmail.com>
References: <20171020175548.2566-1-programmingkidx@gmail.com>
 <f9bd98f1-d45c-6d3a-c35c-c67da67c881f@linaro.org>
 <20171022053315.GA15297@umbus>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=N77PsAG64rsI+4Z40FYnnE3O7FIjkFbm9HT2ywq3m8w=;
        b=O8HX6u3IA5l658l3T2ZIjW24kbZNddlssqpMe8KTf+w9x604ti8QN4Hptphjy4Fix/
         REni3WKFTXdQf5rhSRSrRATPHMQ3LTduwzt4qhIJy2LDbeHWqnMa1enE5obPZ82DtCHC
         gOCz3qr88g/NHU9cTRYHaltnD7PGxfDgf/TiVhUJY8ch5BV2d1F/LHm2C287Lb8Wm+L+
         lGzpIky6/dx8sfEyVdm6ql2ZqE79MXhkeejP539AlmfiII+oJnQ/dE1xkywY9usDH9P/
         EqQfMEE5hrlO8QRzCa3NS/Dc04UQ3el9FZk/IZtjMK4vUmkuycbYTn97Tl/gToQGHe7h
         mw8w==
In-Reply-To: <20171022053315.GA15297@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org


> On Oct 22, 2017, at 1:33 AM, David Gibson =
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>=20
> On Fri, Oct 20, 2017 at 04:44:58PM -0700, Richard Henderson wrote:
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
> Richard's right, that's definitely a better implementation.

I was just wondering, what if we rewrote the code to use strlen() =
instead of strnlen(). Would that be an acceptable solution?=20
