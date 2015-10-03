From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v5 1/2] dtc: dts source location annotation
Date: Fri, 02 Oct 2015 21:29:09 -0700
Message-ID: <560F5995.8050006@gmail.com>
References: <560CA87E.1010103@gmail.com> <560CA9FB.6050700@gmail.com> <20151001054948.GM23574@voom> <560F586F.8040302@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=adRluc54uB+BzhhT6AyJBhA155WgOoe0A1v+Aw2tamk=;
        b=SYW9G+aPStnLwICIOyT5JBr9tKWQI/u97rlZ7wY5c6r46mL603Utr/7vfjM/h601Za
         SU50abs07rmUQ81e+eH3r2e8LIAwW2qBp/jJhh4lLhoC81/GgGiLrxC+kgGe44MZrv+a
         yQ7RHGJ0wxnqR3PTUi43zXkAwyqBRAzK6Dgmv1qrokT8siyL0QbnrgbznNWenj+ttrot
         0xVGh/dW31F9xnTwC4tZbHbugTFsKmnr5mwCJfeLSpFNGx2D+BdG8YD0ib6AGzhawxhL
         hQ/1RG/xoni4+mjD1YIJeWA9S79//c/DItvpbNHRqy2Fkg3Wu62UlR6i0DNjfEY3TAAz
         Q7zQ==
In-Reply-To: <560F586F.8040302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/2/2015 9:24 PM, Frank Rowand wrote:
> On 9/30/2015 10:49 PM, David Gibson wrote:
>> On Wed, Sep 30, 2015 at 08:35:23PM -0700, Frank Rowand wrote:
>>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>>
>>> Proof of concept patch.

< snip >

> Looking at the next version (v5) I see that I named them
> srcpos_string_first() and srcpos_string_last().  I can
> change that in v6.

< snip >

> I missed this in v5.  Will fix for v6.

In both those cases, s/v5/v6/ and s/v6/v7/

-Frank
