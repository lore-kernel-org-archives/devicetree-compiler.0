From: Sebastian Huber <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Subject: fdtdump.c: Compile error with GCC 11
Date: Mon, 4 Jan 2021 09:39:00 +0100
Message-ID: <db5d86de-fa1b-9d44-1188-edb81578bc00@embedded-brains.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

I get a compile error with GCC 11 in fdtdump.c:

In file included from fdtdump.c:14:
fdtdump.c: In function ‘main’:
libfdt/libfdt.h:256:28: error: array subscript ‘struct fdt_header[0]’ is 
partly outside array bounds of ‘unsigned char[4]’ [-Werror=array-bounds]
   256 |                 fdth->name = cpu_to_fdt32(val); \
       |                 ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
libfdt/libfdt.h:258:1: note: in expansion of macro ‘fdt_set_hdr_’
   258 | fdt_set_hdr_(magic);
       | ^~~~~~~~~~~~
fdtdump.c:216:31: note: while referencing ‘smagic’
   216 |                 unsigned char smagic[FDT_MAGIC_SIZE];
       |                               ^~~~~~
cc1: all warnings being treated as errors

-- 
embedded brains GmbH
Herr Sebastian HUBER
Dornierstr. 4
82178 Puchheim
Germany
email: sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org
phone: +49-89-18 94 741 - 16
fax:   +49-89-18 94 741 - 08

Registergericht: Amtsgericht München
Registernummer: HRB 157899
Vertretungsberechtigte Geschäftsführer: Peter Rasmussen, Thomas Dörfler
Unsere Datenschutzerklärung finden Sie hier:
https://embedded-brains.de/datenschutzerklaerung/

