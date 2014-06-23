From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/3] Correct output from memreserve in fdtdump
Date: Mon, 23 Jun 2014 06:21:12 -0600
Message-ID: <CAPnjgZ0qcXSazY4Vb6=u-pq5iAaFmuUnFzrTk0d1ej4YEPY0Ug@mail.gmail.com>
References: <1403074825-5069-1-git-send-email-sjg@chromium.org>
	<20140618103215.GF29264@voom.redhat.com>
	<20140618111429.GG29264@voom.redhat.com>
	<E1WxGmt-0004MW-Vk@jdl.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=G8H3jXV0o/BdRBglZRNvhotjpNEDnUGgP//+XHHgGdc=;
        b=XbkHeEf8t/rEomCYq2WTVO8pt1pbkl19HQKn31XcJML/MAQf/In6yD3WNunFEfONeq
         UNioSGlXxzEKSjmXtS62/hmVXcp1vsq+7rdpDwuVvX2beJNH8JRhvjEU5IDaY7XJ0R3P
         d++JBt8xyNFFh287j35cXrQnKWVn3DAhpmm3qGyp6GCvvpjMEaDoYvjx1Y7E80bbPkZ5
         9gdIg3Gc/pj5g4fYIttaaiPOKr9dq/CqC/+SMGtxZVjlkopRATRpmx7ufmJqVQQ4srcg
         yae7tuk/biiwHvtgvbjwDWEnqk9Bl0ZiriuSLGLhYG/mnyKr7jp/ZVS2Y/SNu3AfNo8B
         fLmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=G8H3jXV0o/BdRBglZRNvhotjpNEDnUGgP//+XHHgGdc=;
        b=m/vPrC9WEk82HU9wM3YfnPEuMiio/xB4rMJjUqhaxzPpv3rT7bcpMXekFpX6BUqtyO
         3/7alDfqjVJLtTnIoreH3VcZsLBPGijigAhgSSVKjLOdIpBXLp9mKkVch2cushXxMyeh
         z72eo5sBy+8k+teaJzGGeqHTlOEgRE+Qlqoig=
In-Reply-To: <E1WxGmt-0004MW-Vk-CYoMK+44s/E@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Jon,

On 18 June 2014 08:24, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>>
>>
>> Never mind, found the reference, and the # flag's behaviour is there.
>>
>> Applied.
>
> Geeze.  You guys generated patches, discussed, and
> applied them before I even woke up and read them! :-)

Yes that was a bit quicker than my last series!

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
