From: "Tom Turelinckx" <tom-HiypchcOusz53ZRCpReHOg@public.gmane.org>
Subject: RE: bus error on sparc64 running type-preservation test
Date: Mon, 13 Apr 2020 18:29:52 +0200
Message-ID: <002001d611b0$c2dd7d20$48987760$@turelinckx.be>
References: <001f01d611ad$f1f44420$d5dccc60$@turelinckx.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turelinckx.be;
         h=from:to:cc:references:in-reply-to:subject:date:message-id
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        dI0JUdVCIUP5DqwgmZ2MnGq8Kg/tnFhpqNTXc4/jos8=; b=FpCTxq3I/fm9tn+v
        qV+MhCnQYIqG4dlFBKJHKpPKGOTvC4yQyqb6LCAK6+7A1obKbznDBfpa8+PgmyZQ
        SmX2VcOawdZuWiRlzqkg80wCRDoiW076QcK9k5TtwhyELyPOBoz4mKHJnjMuHwcE
        M6jPmJR58ksktjCtaJagFKvBzldfNJa4byVLmBmhFDAuWkxOLvDSYe5gWl9nAsfO
        Zjmwqcf/tkEwHOt9NGWkfYcf1sOfbUudyt5u7kLCOeRkjOGUNWk5HMEUnM34dxlB
        m7/MOvXV7/+a+6Xhy/HWmQ0y9JuqbxmYGeXSZnMYIiESHcmwIC/wANX3Yf3awKNT
        6hBfbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=dI0JUdVCIUP5DqwgmZ2MnGq8Kg/tnFhpqNTXc4/jo
        s8=; b=qOlIRS5LwmtXkL2hBNCR0TuH2+9wdZ8jU3DSaD/wEi5RJASOzl06e662i
        xlE4ONapv1DLtzri1KpWzc1pwLNmQlC3nah8546byBf5Bcp5AU5ImTEyIIYks0+N
        Exrm5hQE4KUAGNOcvLb6Zzyn6c8cTGkS1MQTRJ6gOJGkaD/rXMRAE/mT0IDEfozC
        EO2t3o5/yaSh7sP5HMNfWLgLiX2w6tYucpDbSuEcz3JCI3lRjTLVam5cafc3o+up
        w9XOOOnbOtdccXqbn0Im59tMzsPlBqc33BFxWhzYtWfrdal34b84cd15bwyv+XCR
        cHUHKfaWvMdRSSeKyLDFtWr4vWbKQ==
In-Reply-To: <001f01d611ad$f1f44420$d5dccc60$@turelinckx.be>
Content-Language: en-gb
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org

I wrote:

> I have no idea how to fix this, but the following gdb backtrace (from =
v1.6.0) may help someone else:

With -O0:

Reading symbols from dtc...
(gdb) r -I dts -O dts -o tests/type-preservation.dts.test.dts =
tests/type-preservation.dts
Starting program: /build/device-tree-compiler-1.6.0/dtc -I dts -O dts -o =
tests/type-preservation.dts.test.dts tests/type-preservation.dts

Program received signal SIGBUS, Bus error.
0x0000010000017f2c in write_propval_int (f=3D0x1000012e300, =
p=3D0x100001348af "", len=3D4, width=3D4) at treesource.c:116
116                             fprintf(f, "0x%02"PRIx32, =
fdt32_to_cpu(*(const fdt32_t*)p));
(gdb) bt
#0  0x0000010000017f2c in write_propval_int (f=3D0x1000012e300, =
p=3D0x100001348af "", len=3D4, width=3D4) at treesource.c:116
#1  0x0000010000018704 in write_propval (f=3D0x1000012e300, =
prop=3D0x100001348e0) at treesource.c:251
#2  0x0000010000018b8c in write_tree_source_node (f=3D0x1000012e300, =
tree=3D0x10000134960, level=3D3) at treesource.c:310
#3  0x0000010000018c04 in write_tree_source_node (f=3D0x1000012e300, =
tree=3D0x10000134a30, level=3D2) at treesource.c:314
#4  0x0000010000018c04 in write_tree_source_node (f=3D0x1000012e300, =
tree=3D0x10000134b20, level=3D1) at treesource.c:314
#5  0x0000010000018c04 in write_tree_source_node (f=3D0x1000012e300, =
tree=3D0x10000134c10, level=3D0) at treesource.c:314
#6  0x0000010000018e28 in dt_to_source (f=3D0x1000012e300, =
dti=3D0x100001325c0) at treesource.c:344
#7  0x0000010000005f1c in main (argc=3D8, argv=3D0x7fefffff528) at =
dtc.c:351

Tom


