From: "Tom Turelinckx" <tom-HiypchcOusz53ZRCpReHOg@public.gmane.org>
Subject: bus error on sparc64 running type-preservation test
Date: Mon, 13 Apr 2020 18:09:41 +0200
Message-ID: <001f01d611ad$f1f44420$d5dccc60$@turelinckx.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turelinckx.be;
         h=from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm2; bh=T1d+ImmTRc6u2rFm5IQvyDBl5o
        8W9xHBpKf354eNp74=; b=weAKngVHYyYgod2CnYtbNvgYTPJTZfuy7AhCGQSC4f
        RrNGVchC4g5xoG7fyI97J8mYkLJ+UZPkNNiDNd+SfHGXe10B28uQTeNH1mLyZicH
        YO8jsHEgrTtTbioP3iiEDwrS5VZ1oltbIPZbEVBSa2PFzGM1oK5qbkA88alusqZu
        U5MJA6wbvCfYT/92ZW+x3tPSDTwttczSCOLidRc0WYJ12/QWfyEJCRFkvzOwTpXD
        3oE8hYa62zwPjlptW6QiEp+NTbCzM1mHVe/Qs1mLZCCggycMd0wmpTpU3quRI2li
        K6xhxgHsG6D4OIzAZOEpnMltKC0t/UEuj0/RD9HDxiaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T1d+Im
        mTRc6u2rFm5IQvyDBl5o8W9xHBpKf354eNp74=; b=feUfgtgFcOb4w9hXoQYUWz
        2xiplFd1I9U7hLFC7jpA65/FaZrxa3I0dV572DvISBjoYEVKnqw8yxTAtAQrveRd
        8xNw/sZ9MaBoCbOxAfUgpw3JTAzbpkPaYZsKVhs1yTTOwmbw08h5whJ1TjQeozcM
        8L5ZdOiWrT31p+qfp0HI8yzwQAbROjcH/E+VfDWvwt5NE21vky79dsY/QQLSFG7a
        CHDOHFs1xvIT6dUh5DZ9HhtHdbSPnQWLnitUeQIBkKFjpRpPqwRWti/KkjXyYiJV
        oxbFumOiqS55plp28vRiQ3EStUgG3HO6xXE6LJKsToDoHZlDGXgmbJ70vcPzySvQ
        ==
Content-Language: en-gb
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org

Hi,

Since v1.4.7 DTC FTBFS on Debian sparc64 because of a bus error when =
running the type-preservation.dts test.

Build logs are available here:

https://buildd.debian.org/status/logs.php?pkg=3Ddevice-tree-compiler&arch=
=3Dsparc64

It may be an alignment issue introduced in this commit:

https://github.com/dgibson/dtc/commit/32b9c61307629ac76c6ac0bead6f926d579=
b3d2c

I have no idea how to fix this, but the following gdb backtrace (from =
v1.6.0) may help someone else:

Reading symbols from dtc...
(gdb) r -I dts -O dts -o tests/type-preservation.dts.test.dts =
tests/type-preservation.dts
Starting program: /build/device-tree-compiler-1.6.0/dtc -I dts -O dts -o =
tests/type-preservation.dts.test.dts tests/type-preservation.dts

Program received signal SIGBUS, Bus error.
0x0000010000010600 in write_propval_int (f=3D0x10000120300, =
p=3D0x100001268af "", len=3D<optimized out>, width=3D4)
    at treesource.c:108
108                     switch (width) {
(gdb) bt
#0  0x0000010000010600 in write_propval_int (f=3D0x10000120300, =
p=3D0x100001268af "", len=3D<optimized out>, width=3D4)
    at treesource.c:108
#1  0x0000010000010c6c in write_propval (prop=3D0x100001268e0, =
f=3D0x10000120300) at treesource.c:251
#2  write_tree_source_node (f=3D0x10000120300, tree=3D0x10000126960, =
level=3D<optimized out>) at treesource.c:310
#3  0x0000010000010c10 in write_tree_source_node (f=3D0x10000120300, =
tree=3D0x10000126a50, level=3D<optimized out>)
    at treesource.c:314
#4  0x0000010000010c10 in write_tree_source_node (f=3D0x10000120300, =
tree=3D0x10000126b40, level=3D<optimized out>)
    at treesource.c:314
#5  0x0000010000010c10 in write_tree_source_node (f=3D0x10000120300, =
tree=3D0x10000126c30, level=3D<optimized out>)
    at treesource.c:314
#6  0x00000100000054f4 in main (argc=3D<optimized out>, =
argv=3D<optimized out>) at dtc.c:351

If somebody has a suggestion for a patch, I can test it on Debian =
sparc64. I'm not subscribed to this list.

Best regards,
Tom Turelinckx


