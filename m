From: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Sun, 22 Oct 2017 15:52:43 -0400
Message-ID: <5DBD5EDC-4F6C-4A75-ADB0-C1A52532A323@gmail.com>
References: <20171020175548.2566-1-programmingkidx@gmail.com>
 <f9bd98f1-d45c-6d3a-c35c-c67da67c881f@linaro.org>
 <20171022053315.GA15297@umbus>
 <82BA0070-FFBB-4868-AE48-D7A3671621C5@gmail.com>
 <1508699172.7314.12.camel@freebsd.org>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Nj7llkhnxTCpW6bfxa4B6wWBNGjwLUIQI1nSD4XuE9g=;
        b=uAS0gPXxNzPVldxvfSHP2RSXKT5vCTlOSNxjG7uFSGp02KoAcqrCVMKdjLnDL4N/39
         vDzCQ8sJWDkLGjqnkuxldwbHSa/AU1VaIb1qnKPqqlatDGnSOv0CDy0C4ag+9R+ebVwa
         7ym5wRVl1GM845f3DrVo5PL2v8sOYBO7IlLMQ8cPD3qoJUKAp8+17EPyuqGanGR1pIa/
         NZo+KPSWPsIYBBeQbxsSg1Ep10guAfaIdOxSptGfeQSbLr3T/tx/mFpbS19iszGxGLix
         rHqOxS1hBWJXkP2OeyMpjtjtI81NVXKwMfvb3OJF3DG7lQoVGjhp8VROMWzPRPYD4rhX
         JV2A==
In-Reply-To: <1508699172.7314.12.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "list-l3A5Bk7waGM@public.gmane.org:PowerPC list:PowerPC" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org qemu-devel" <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


> On Oct 22, 2017, at 3:06 PM, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>=20
> On Sun, 2017-10-22 at 10:41 -0400, Programmingkid wrote:
>>>=20
>>> On Oct 22, 2017, at 1:33 AM, David Gibson  wrote:
>>>=20
>>> On Fri, Oct 20, 2017 at 04:44:58PM -0700, Richard Henderson wrote:
>>>>=20
>>>> On 10/20/2017 10:55 AM, John Arbuckle wrote:
>>>>>=20
>>>>> +static inline size_t strnlen(const char *string, size_t =
max_count)
>>>>> +{
>>>>> +    size_t count;
>>>>> +    for (count =3D 0; count < max_count; count++) {
>>>>> +        if (string[count] =3D=3D '\0') {
>>>>> +            break;
>>>>> +        }
>>>>> +    }
>>>>> +    return count;
>>>> Not to nitpick, but
>>>>=20
>>>>  const char *p =3D memchr(string, 0, max_count);
>>>>  return p ? max_count : p - string;
>>> Richard's right, that's definitely a better implementation.
>> His implementation is smaller, but this one is even smaller. Plus it =
uses the familiar strlen() function:
>>=20
>> size_t strnlen(const char *string, size_t max_count)
>> {
>>     return strlen(string) < max_count ? strlen(string) : max_count;
>> }
>=20
> That is not a proper implementation of strnlen(), which is not =
supposed
> to access any source-string bytes beyond max_count.
>=20
> -- Ian

http://pubs.opengroup.org/onlinepubs/9699919799/functions/strlen.html
This specification document should help anyone who wants more info.

The first implementation using the loop would never access anything =
beyond max_count. My second implementation does go beyond max_count. The =
implementation using memchr() will probably live up the requirement so I =
guess it wins.

Thank you Ian for this information.=20
