From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: /bits/ encoding
Date: Fri, 12 Jun 2020 14:02:55 -0600
Message-ID: <CAL_JsqLsT=HBTdRzEg4k6jOHDYkELj4cLXDjX8+9mdc1fNk0RQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5ziFDF79fp6g8ptH4rMrxvM7y0rWIVY5lEviImAkYNE=;
        b=Lpg5EK8yK4HVo6Shvr0G62+oageYvLqOdjPJ5+G91Io7ZIU9Ivgd4k6Eauy4uEmfTm
         3VMRQ9lTaLrfpXyzlKbQ4eI176nj9gdn28VcX3bzqo2sHN14UnTB2kgCi5izE/QDL9jL
         mWcJfbkciGdaNBqU34WDo8bgnmkjrzoCvnvgGPOUjN0OIwYiohOMXgQ+hj1afKUPZyyW
         xJ6qUCSfFX49/sNOmEG4SCySiVDvKt/v5ivMJOGRPbP9mR5WZGvLMjaTEZk8fBP1pDJh
         B8HDMpK2vREURGrGs6ts56LHG0QkB3x8AIFUjKdsGqUbhio3UprgvbF4bvugB/gQtEhj
         RQmg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>

What's the expected property length in these 2 cases?:

prop = /bits/ 16 <0x1234 0x5678>, <0x9abc 0xdef0>;
prop = /bits/ 16 <0x1234 0x5678 0x9abc 0xdef0>;

For 32-bit sizes, the <> don't matter. I had assumed /bits/ applied to
the whole property value and the <> don't matter in that case either.
But that's not the case in dtc. In the 1st example, the last 2 values
are 32-bit. In order to make all values in the 1st example 16-bit, we
have to do:

prop = /bits/ 16 <0x1234 0x5678>, /bits/ 16 <0x9abc 0xdef0>;

That also means one could do:

prop = /bits/ 16 <0x1234 0x5678>, /bits/ 8 <0x9a 0xbc 0xde 0xf0>;

Something we want to support (it already works)? I don't think such a
thing exists in the wild, the kernel's array parsing doesn't expect
it, and I haven't encountered a use for it. Given the non-existent
type information in FDT, that doesn't seem like a great idea.

Rob
