From: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Thu, 14 Oct 2021 11:39:37 +0200
Message-ID: <84be5fc0-0199-aec5-e739-610ba6cf0409@fastree3d.com>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
 <20200820102734.GR271315@yekko.fritz.box>
 <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com> <YL7vh7JkjymjKsQD@yekko>
 <3f28c86d-064d-ec68-e8de-f1dcd38c08ca@fastree3d.com>
 <f6ac309b-c3af-583e-1bce-e869fa129b3f@fastree3d.com>
 <CAL_JsqK52nM1LwjBYJ+iEWYEipimaJ=8vA-Nw5SSJ7x+OAxGXg@mail.gmail.com>
 <c28927c6-4fd1-f047-7c04-d54af609e699@fastree3d.com>
 <CAL_Jsq+q-vNyUok3O7To0KCSG=hcGzHnf4k7tTr=0J3VFUSVjg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zjCgP55eoYoTWxb5O/RDo2XNeAZA697pkq7P5lZD3WE=;
        b=ABRLo+y4195PLbvBJ7knuhEhCw4Vk2OMF7R/QdTEnkX1ang9w/BkrEwAm3miRPo7ka
         AXvpcvkhxD65I2a/LfjgVvgXGFZ/MRlx9F8OuTfoeJ0/mhBB7TIal6uGluAi/ytZsQh3
         Qtfk+NGeeMVjrbrlAiUiUSKnP3D/FBSSXQBXFmrXgFn7gTPEI0LTLcFjZwFqDs+u7a2/
         UOIQGwYATaF6zKa8B3lgX3AuiGZj67USqoCxizB8IxYyMOzyYG0LoOYC8s9bMzLwzx8b
         MeQqJU8wpdh1T2VDj8prGxDjbQYsFmnpFBJzhLDt96IsUfHKPEQuzeG66G/v8kZxcjNh
         2X+Q==
In-Reply-To: <CAL_Jsq+q-vNyUok3O7To0KCSG=hcGzHnf4k7tTr=0J3VFUSVjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, wenzong.fan-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

I let myself add to this thread Wenzong, author of the change in the
yocto class using HOSTCC, and Ross and Richard who signed off the change.

Wenzong, Ross and Richard, there is a problem in the way you use HOSTCC,
once one adds '-g3' debug flag and DTS compiler. All the details
regarding the problem can be found in the archives [1].

Regards,

Adrian

[1] https://www.spinics.net/lists/devicetree-compiler/index.html#03281

On 12.10.2021=C2=A018:50, Rob Herring wrote:
> On Tue, Oct 12, 2021 at 9:47 AM Adrian Fiergolski
> <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
>> On 12.10.2021 15:38, Rob Herring wrote:
>>> On Tue, Oct 12, 2021 at 8:16 AM Adrian Fiergolski
>>> <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
>>>> Hi David,
>>>>
>>>> I am being hit by this problem again. This time on Ubuntu 20.04 LTS wi=
th
>>>> gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04), yocto (hardknott) and
>>>> kernel v5.10.
>>>>
>>>> As it's standard kernel built, I am using scripts/Makefile.lib from
>>>> kernel sources. This line [1] causes the problem. As you indicated, it
>>>> calls the preprocessor and afterwards dtc.
>>> How is '-g3' getting introduced here? You are externally overriding
>>> HOSTCC with 'gcc -g3' or something like that?
>> Yes, that's the way yocto introduces kernel build flags [1].
> HOSTCC is supposed to be set to just the compiler. HOSTCFLAGS and
> others should be used to set the flags.
>
> Rob
>
>> [1]
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/kernel=
.bbclass#n229
>>
>> Adrian
>>
