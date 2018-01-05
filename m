From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base
 fdt
Date: Thu, 4 Jan 2018 17:55:31 -0800
Message-ID: <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
 <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7bKKGneYFZzGutajjj/N0OUlwmal2zPBRFeEDr6/Y4g=;
        b=ZWv3cOh0xAp96IdLdm0cHGbJuo02n3iqj/XJCpkrXhp5dFoEg62I9jjAOvQfDS2/rU
         ZSTHWUOen0JNVY4IqgETNv/YxrKQ8YoSANO2G99aIrL6Qp93pWIzKCcfPKXvERm14U7u
         86IaLbvGP4Yq7mxZDc3D/fxsrVEOP7MQAVzXGllRgG+ohE6Bu2NTbGH4DM6iYbCQz6Kh
         wE/lgg7AUlBhDMMupz5oZ1EzvB4EFHTkYW+YAim8upSvUG/TPI3hGilP3o2tZ8LjzuN1
         qptvA9bETwClWQdpJR8pWtNg6ybQ4YIxwByzFmY2MAAFD5an9/1GDoHcONkojixmMgjJ
         Ewqg==
In-Reply-To: <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 01/04/18 13:47, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> [... snip ...]
>>>>
>>>> Does this remove the need for the proposed patch, or am I still
>>>> missing something?
>>>
>>> ... nope. Apparently I never tested this with this particular dtc(1)
>>> and instead just assumed it did the same as ours- allocate phandle
>>> sparsely, even with -@. That certainly removes the need for this
>>> patch, and I'm somewhat upset that I hadn't previously considered
>>> this.
>>>
>>> @David, Jon: Please disregard all of the patches along these lines...
>>> I'll fix this in our dtc, where it should be fixed.
>>>
>>> Thanks, Frank!
>>
>> Actually, I'm kind of torn on whether this is useful or not. With
>> being able to have EFI-provided FDT, it's hard to guarantee whether
>> the FDT we're provided has been compiled with GPL dtc(1) and -@. The
>> above solves this problem for most of my personal use-cases , though,
>> since I can guarantee that our FDT and U-Boot provided FDT is compiled
>> properly.
> 
> Apologies for the triple post; I realized that this argument is
> inherently wrong, since we can't reference the node if there's no
> symbol anyways.
> 
> The only way this might still be a good idea is to support more
> minimal cases where an implementation might prefer to not create a
> phandle for nodes that haven't been referenced.
> 
> In our case, we have a function [1] that walks the tree and generates
> metadata on nodes that have phandles, under the assumption that these
> have been referenced somewhere and provides a way to more quickly
> reference these specifically through a separate linked link.
> Allocating phandles for everything as GPL dtc does adds quite a bit
> more overhead to this.
> 
> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfirm.c#119

The "-@" option does not add a phandle to _every_ node, just to nodes
that have a label:

$ cat overlay_base_manual_symbols_auto_phandle--no__symbols__add_a_node.dts
/*
 * Copyright (c) 2016 NextThing Co
 * Copyright (c) 2016 Free Electrons
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

/dts-v1/;

/ {
	test: test-node {
		test-int-property = <42>;
		test-str-property = "foo";

		subtest: sub-test-node {
			sub-test-property;
		};

		sub-test-node-2 {
			sub-test-property;
		};

		sub-test-node-3 {
			sub-test-property;
		};
	};
};


$ dtc -@ -O dts overlay_base_manual_symbols_auto_phandle--no__symbols__add_a_node.dts
/dts-v1/;

/ {

	test: test-node {
		test-int-property = <0x2a>;
		test-str-property = "foo";
		phandle = <0x1>;

		subtest: sub-test-node {
			sub-test-property;
			phandle = <0x2>;
		};

		sub-test-node-2 {
			sub-test-property;
		};

		sub-test-node-3 {
			sub-test-property;
		};
	};

	__symbols__ {
		test = "/test-node";
		subtest = "/test-node/sub-test-node";
	};
};

