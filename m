From: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Sun, 22 Oct 2017 10:41:49 -0400
Message-ID: <82BA0070-FFBB-4868-AE48-D7A3671621C5@gmail.com>
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
        bh=hY5Wn/JdN10wryaruYlY1X6g6uFdE0/BSw9UVnL95Yo=;
        b=lgMqYX2ST8P3CupddSPM5uHInXPR8dkCxfly4AsKGDoNL0SMfiWEx8tvL034Z9Z+p/
         xNHqiO95A7dBbQVJY4JVjh734L8L5xtmVhGpdFFFfRN7HdL2T6Fyi1argAZWUFyFj55j
         JVE+NsAOts0Owq3tlHXUCuQOXYvU0BzrD86I9ASgPd26es6J7tLwivs+Lp5K0lsWrHYp
         qfpB6x0fzvwgvBS9uGG+SJ7jhGe0YxID5OtPUqW2Buf5fsjr6wzhcIehFVFcjimdSgX8
         375YWoG7yVGriEcZ2q+M12LdOamvD1s7ee63+1Oufcy1RpUDqvYHL/ILO19ymmdNmewk
         8Q+A==
In-Reply-To: <20171022053315.GA15297@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "list-l3A5Bk7waGM@public.gmane.org:PowerPC list:PowerPC" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org qemu-devel" <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


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

His implementation is smaller, but this one is even smaller. Plus it =
uses the familiar strlen() function:

size_t strnlen(const char *string, size_t max_count)
{
    return strlen(string) < max_count ? strlen(string) : max_count;
}=
