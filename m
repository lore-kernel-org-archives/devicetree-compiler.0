From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Date: Mon, 20 Jan 2020 18:17:14 +0000
Message-ID: <20200120181708.GN3697@linaro.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ueFhoq0888bObMU/MyWNjalID6TVX62BYMUk86CN9sY=;
        b=URqlkO1HRRK4JEksGOMOKBeLeUw2xDoWJkLqihkgtjh2adEvHnEmR5yDIn4unCT45S
         aFI8umb1/wYVs0ip9chXxIwjwYTv8fb+Lo9xbBt67VEjKe71syIiJEjSf+avDIUlgkMm
         nR2TS/uAT9ysoaxOMFy3QHwy/79RTB8MB9eBRgdpfovmPUGEEmNuxqyf6trbybXWs7U5
         6MVZwQ1HJ3tg5qIIDFq+SGn+dJsFh7VKygE4O/gkq9Trlit+pEb6pqGuCWb+a/PO4DdN
         j30va57due0cY8AGVnhpGRp/pSPv9uepqdnyuBhF72i5RG3ZbdrxQY3eRtfEUYeyHjsR
         OOFQ==
Content-Disposition: inline
In-Reply-To: <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
>On Fri, Jan 17, 2020 at 6:26 AM David Gibson
><david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:

...

>> What might be better would be to have a dtc option which force appends
>> an extra .dts to the mail .dts compiled.  You can then put an overlay
>> template in that file, something like:
>>
>> &{/} {
>>         linux,build-info = /incbin/ "build-info.txt;
>> }
>
>I like this suggestion either as an include another dts file or an
>overlay. The latter could be useful as a way to maintain current dtb
>files while splitting the source files into base and overlay dts
>files.

ACK, that sounds like it could be helpful.

>But no, let's not prepend this with 'linux'. It's not a property
>specific for Linux to consume.

Right. We might be seeing the data coming through from U-Boot (or any
other random bootloader) too.

Cheers,
-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

