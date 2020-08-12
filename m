From: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Subject: libfdt / fdt_check_node_offset_ with VALID_INPUT
Date: Wed, 12 Aug 2020 17:48:56 +0200
Message-ID: <34725235.0rVAnNm8GT@noys4>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi all,

I'm not sure if I found a bug or if I mis-use libfdt.

I have a valid Linux device tree in memory and want to recursively scan
thru it. The device tree contains a root node and several subnodes.

First, I start with the root node:

  int root = fdt_next_node(fdt, -1, NULL);

Here, root is set to 0. Now I determine the offset of the first sub node:

  int subnode = fdt_first_subnode(fdt, root);

Here, subnode is either 0 if FDT_ASSUME_MASK contains ASSUME_VALID_INPUT
or 164 (in my case) if FDT_ASSUME_MASK does not contain ASSUME_VALID_INPUT.

As far as I understand, fdt_first_subnode() should not return the node
offset of the current node if there are subnodes available.

I think the problem origins at fdt_check_node_offset_() in fdt.c: If
VALID_INPUT is set, the whole code in that function is skipped. If that
flag is not set then fdt_next_tag(fdt, offset, &offset) is called and
the resulting 'offset' is returned.

In other words, fdt_check_node_offset_() has a side effect which depends
on the VALID_INPUT flag.

Thanks!

Frank


