From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v4] dtc: dts source location annotation
Date: Wed, 30 Sep 2015 20:15:21 -0700
Message-ID: <560CA549.1010202@gmail.com>
References: <560C9D4B.1040603@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=6olym7bq6A4sz8z+kXmxzYPUPMaqVN8iqjSYu9yRp/w=;
        b=RwCwg4yd0Klq1YrST+t1YQ6krxVG9zKZ43IgMc3yj63J3UrZyOJvTwqrHh5KH1YzRr
         iYAQ/5Vlfsdy+Funhk+rQLHVBoqsqMQbQJkVQJPXzQ4PxmqC/yfmKOXRaeK+0lT1eBiK
         1YqwrLckNzH5idOl01U1M5qv/479fOXc8qMZlLDk3IeqFJ0ZcNKtk+sFw1+aGcH2hEhQ
         EL2EYZ0Q1tz/7FT3JL4xMQEsVz4dQPXjdRK83brSlidTECjiAPLOhWnDKm0Pk+gX1TB3
         psXmpU5p28UXlHn4hUrlEr0z1oQs50fEGf4GhPd638ruzgpcUhprEGEvfb9ZD1XS0zei
         tbjw==
In-Reply-To: <560C9D4B.1040603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/30/2015 7:41 PM, Frank Rowand wrote:
> 
> Proof of concept patch.
> 
> Annotates input source file and line number of nodes and properties
> as comments in output .dts file when --annotate flag is supplied.

Please ignore v4.  Version v5 will be out in a few minutes.

-Frank
