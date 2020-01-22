From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Date: Wed, 22 Jan 2020 19:00:18 +0100
Message-ID: <9d83a36c-78c5-3452-bb48-209d68c46038@st.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus> <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200120181708.GN3697@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=FD3TOxxOgAtCMT+1BxBtntOt5Z7oR4wttkJhsEbfDwY=;
 b=QSnkPW9EQAL047il27ei1fTP2oMQjoFJPVoppePLs5mUE+D/Wu9jQ4DnvP/0jzwponSP
 LC0GftePNu91R42x9cQpb2ejYdi3DMQM8xt9K13XTXfYlOQxp/6/nU5rU2yPFQvAj7Vk
 QiPV00jZHj5Al3TMe4LTZVmlisryZsmpYdnVHqJCBI+I4mD4RPpKSb4YNEqI6hwrLjP1
 OSae02ppyQdFSAi+V1bueMdhHWx1XVNWaL8zO5Py/8OPlr0ELqD0NKbq+so0FwcAT/da
 s4ub8DhaReZnhA88dESmwvKko8PS3srlJY6LuzwPIoR7kewMNFB91wYhYZxqDZQIYmWX Ug== 
In-Reply-To: <20200120181708.GN3697-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org
Cc: Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On 1/20/20 7:17 PM, Steve McIntyre wrote:
> On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
>> On Fri, Jan 17, 2020 at 6:26 AM David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> 
> ...
> 
>>> What might be better would be to have a dtc option which force appends
>>> an extra .dts to the mail .dts compiled.  You can then put an overlay
>>> template in that file, something like:
>>>
>>> &{/} {
>>>          linux,build-info = /incbin/ "build-info.txt;
>>> }
>>
>> I like this suggestion either as an include another dts file or an
>> overlay. The latter could be useful as a way to maintain current dtb
>> files while splitting the source files into base and overlay dts
>> files.
> 
> ACK, that sounds like it could be helpful.
> 
>> But no, let's not prepend this with 'linux'. It's not a property
>> specific for Linux to consume.
> 
> Right. We might be seeing the data coming through from U-Boot (or any
> other random bootloader) too.
> 
> Cheers,
> 

Thanks for reviews. I gonna prepare a V2 with David proposition (to use 
overlay format) by keeping in mind not to modify existing dts(i) files.

Remaining questions are:

1- "build-info" or "linux,build-info"? IMO, If information is "generic" 
then first one should be used.

2- Looking at Franck proposition[1] some years ago and objections on it, 
do you think that this one could accepted ?

regards
Alex

[1] https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/




