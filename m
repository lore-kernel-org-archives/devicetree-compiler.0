From: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Tue, 12 Oct 2021 16:47:24 +0200
Message-ID: <c28927c6-4fd1-f047-7c04-d54af609e699@fastree3d.com>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
 <20200820102734.GR271315@yekko.fritz.box>
 <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com> <YL7vh7JkjymjKsQD@yekko>
 <3f28c86d-064d-ec68-e8de-f1dcd38c08ca@fastree3d.com>
 <f6ac309b-c3af-583e-1bce-e869fa129b3f@fastree3d.com>
 <CAL_JsqK52nM1LwjBYJ+iEWYEipimaJ=8vA-Nw5SSJ7x+OAxGXg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/eguiPQxtl1Nq+lqzMPAoZ1Cl39GmVL2XkbBuUXVNAY=;
        b=aQ+erhYekviweHod3Qbk5Q53bOT1KeA7NbwYWt34UbpmuN72sYies9GbZqhgZse2P3
         h+MPi49Q1I+aY6IOc4rvTzYrBY4wEADffcPJKthslRlf+DcClccky/SwGld7NzZIsYNf
         4rtnZTR3Eq4fIjbi7Tnc323mK7gwiG/C8V5U0hOfronzzjqqnlioAuQcDaU+aWo/w+Df
         UD+Uo/DEmvLIN9MzAE6wTdHsr3RcNvuF7hUB8igMpGxh/GDxVnOloM2uKw2tPZdacWvq
         vt2BU19S7VLU3XnVXFPJDKTuAOfKNIyobkCDeqUc7PeJa6DYNND14/ihupnRJ5gFA6XN
         7R+w==
In-Reply-To: <CAL_JsqK52nM1LwjBYJ+iEWYEipimaJ=8vA-Nw5SSJ7x+OAxGXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 12.10.2021=C2=A015:38, Rob Herring wrote:
> On Tue, Oct 12, 2021 at 8:16 AM Adrian Fiergolski
> <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
>> Hi David,
>>
>> I am being hit by this problem again. This time on Ubuntu 20.04 LTS with
>> gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04), yocto (hardknott) and
>> kernel v5.10.
>>
>> As it's standard kernel built, I am using scripts/Makefile.lib from
>> kernel sources. This line [1] causes the problem. As you indicated, it
>> calls the preprocessor and afterwards dtc.
> How is '-g3' getting introduced here? You are externally overriding
> HOSTCC with 'gcc -g3' or something like that?

Yes, that's the way yocto introduces kernel build flags [1].

[1]
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/kernel.bb=
class#n229

Adrian

