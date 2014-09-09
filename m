From: Jay Bhukhanwala <jaybhukhanwala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Use cases for fdt_nop_* functions
Date: Tue, 9 Sep 2014 15:52:51 -0700
Message-ID: <CAB8QsTBno6L2MFE_JWbkpAH=iBhNzcEQroe0_yyBfYWRG8eCiA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=VMuThxeK9lbZlSScAsq7b3+kbOdkaf+S91EIL0EKF2M=;
        b=K9F/Nj/l8Pl9jQUIJWMPNDABZaL+Zrg+VqK4PJRp0SRhUBB+SEmWG2xKIU+ER+ZSIu
         NNcZcbBEQu2GXwG3Eal3XR1+wLmzjJH4hgAwljobiiDm+XQOFiWUp+7xiSVRAw+DUNji
         fok7hl4eg1FZ7dsdNxcfIVD+mQoi2Cw6WKAZ/AI3ZsW0AKh4qVnB1yk9gNwFMvTDLGWK
         XVHNXu1xxk1B6YDLgT+rxAlXuhzOJTbd7OQi7O59rGdXO8DITUTUXXKuhag12MW8Jsu3
         MQ0NBkEp9tVQkEfsKjdtBPZx5j02W5RGMNi7iNCh8vboXXYFN8xMwXxbEen1S0zxzI7r
         iJVw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

What are the use cases for the below functions?
fdt_nop_property
fdt_nop_node

How would the fdt_nop_node be any different from setting the status
property to "disabled" ?

I am suspecting the fdt_nop_node, basically makes the node
undiscoverable in DT, but I need someone to please confirm the
assumption.

Thanks,
Jay.
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
