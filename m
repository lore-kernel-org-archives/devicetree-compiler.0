From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: __local_fixups__ format
Date: Tue, 2 Jan 2018 15:54:30 -0600
Message-ID: <CACNAnaHU2ETa4WryMHzyHH0br6BighhJzen3qqv0EL8u8-_1Kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I'm working on using libfdt's overlay support in bootloaders on
FreeBSD. I find that our BSD-licensed dtc(1) currently generates a
/__local_fixups__ node that matches the format (roughly, with some
slight bugs that I need to address) of /__fixups__; i.e. a bunch of
properties whose values are "path:name:offset".

I've not found any documentation on what is actually valid here, but I
do know that libfdt will not accept this. Is this completely invalid
and our BSD-licensed dtc(1) should write /__local_fixups__
differently? If not, Is it OK enough that a patch would be welcome to
support this in libfdt? I like the consistency myself, for what it's
worth.

Thanks,

Kyle Evans
