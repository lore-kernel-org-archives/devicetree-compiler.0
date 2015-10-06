From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 2/3] dtc: dts source location annotation
Date: Tue, 06 Oct 2015 00:38:19 -0700
Message-ID: <56137A6B.6080805@gmail.com>
References: <560F5D15.9060606@gmail.com> <560F5F20.30709@gmail.com> <20151006045607.GK3861@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=NX6WnQIKwtM2L7De3c7QVEr8FZ8v1XV5u9BM40qITtc=;
        b=hVMSvjAkv+COaklunX0rp9AiTTaYcImkXb+y++sDmMFzaGdWmzyx1PGc8xFfe8KqGf
         ++U3+v79RYF+Zk+7uydmKsRCSZzLIfnMQGyRrtiRpRskCt0+npxZDIQPtCSc2Qbuf7tV
         +W9uXyPrWNC/7kIe8UjuA3sSfmjy05WP6+6slzjoz+ZFneM7cxCWqQktlWEnrjIU5RD2
         MFGz7DkS6b1b2xJ9JfIUmSOUt7cp8OCC0yZRDz/1sWuObrOJKiDAUPUgzpx0CO8gUhbC
         Pobdn+aTzQF+H/3dMo0d8u9253hvITf1tD3tffPDDjpxLlYawjGToFATS0Zyag3h9Ukz
         22Qg==
In-Reply-To: <20151006045607.GK3861-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/5/2015 9:56 PM, David Gibson wrote:
> On Fri, Oct 02, 2015 at 09:52:48PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Proof of concept patch.
>>
>> Annotates input source file and line number of nodes and properties
>> as comments in output .dts file when --annotate flag is supplied.

< snip >

> The two branches here aren't quite consistent - the first doesn't
> include the '/', the second does.  You could either change the second
> to just &@3, or use &@$ for the first.

< snip >

> This one doesn't include the name/label again

< snip>

> 
> .. and this one does.
> 
> Looking at all of these it's probably going to be simplest not to
> include the label/name (i.e. just use the srcpos from the nodedef).

This also shows how much I need to create a better "make check" test
suite to exercise all of the relevant paths (as is on my todo list).

I've been trying to capture the line that the name is on, since it
might be different than the line that the "{" is on, but maybe I'm
just trying too hard and should accept the simpler solution.  The
result will be obvious to the person using the output.

I'll fix this all up after I get back from the conference.

Thanks for checking the patch over at that level of detail!

-frank
