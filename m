From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v4] dtc: dts source location annotation
Date: Wed, 30 Sep 2015 19:44:30 -0700
Message-ID: <560C9E0E.6010808@gmail.com>
References: <560C9D4B.1040603@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=eVooGoAWK/zAR+EWGBAfRvx2EafAmJwnSCYqA5RVdtw=;
        b=yWsR1wDb1Lb0BfSFHgoLgIggRmQuyybekzXYAdAEeJz2kWCxv8uMpcEFXH7/NrN0Lg
         D0fMqPBRV1MCRijdDMFhiohlSlMHnja54mrXojCtkY/3P9VRSw3HRiKFonXQQIZy1VV/
         W8sw8jTvx9jx/Zw0YvgA+iXj6MNVaZputBG57ojrJKwqh1Q1Xnzb6cY7XpSj8z2vnWMG
         ZsEg3He8eTZBsUGLDrucIjheJopGARPQeSYDuT+h8AuU5l/lipCzAlhUCfEEuZrg0XdT
         Nt4sApHYS9cxN9PW2rBMEJXdLd82KfqmDFh8H3OaZMpX13qJlUfHLUhJnfekZbTGS95C
         Q1Ug==
In-Reply-To: <560C9D4B.1040603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/30/2015 7:41 PM, Frank Rowand wrote:
> 
> Proof of concept patch.
> 
> Annotates input source file and line number of nodes and properties
> as comments in output .dts file when --annotate flag is supplied.

< snip >

> TODO:
>   - Update "make check" tests to reflect review comments.

< snip >

One more TODO.  Test against a wider set of .dts files.  There
are some rules that I did not test extensively (and some rules,
such as delete that I did not test at all in this version).

-Frank
