From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base
 fdt
Date: Thu, 4 Jan 2018 12:33:26 -0800
Message-ID: <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xxe32LEeWUQ7BTxX+ysw+8gNeq23ep6qR5xjBXmX9jw=;
        b=s3lR1yROyl7l80uzY5evylN0GAppwh6DLfN3hpaADV/nMQ6wJAr5xDCsUZLK+bufuR
         hvyFktlhl5R5Un7JSzilxD+48mLKBFEBYzEoxYcTjotBccAUuZBa5Eno+Q7PazWG+9ix
         3JVbVFSS7kHbUIOee2ulfQQ7S9EjF8Ns1pFzIWAo1GT+YDX0Ui/k882YQvh318/ESNn3
         PtMQDL8dHTdc/kHE8rNGmUA0Rd+k2fQaZzJqbr/C4/qW4+mIkL0oPLdWKzlAfFdLG4qM
         8LTFA/OjYfv+I9Yw/BWE8VJgVNYbOvOKgRrabXXp1tk/CsXqoqhrFtJj6AIzoeoDOucs
         knBg==
In-Reply-To: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 01/04/18 12:15, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 2:11 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 12/31/17 22:59, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
>>> Currently, references cannot be made to nodes in the base that do not already
>>> have phandles, limiting us to nodes that have been referenced in the base fdt.
>>> Lift that restriction by allocating them on an as-needed basis.
>>
>> I am very confused.  If I understand correctly, the problem is:
>>
>>   A base devicetree contains a __symbols__ node, where one of the properties
>>   in that node has a value which is a path to a node, where that node does
>>   not have a phandle property.
>>
>> Is that correct?
> 
> This is correct. Currently, the overlay support resolves the path to
> the node just fine, but then dies when it doesn't have a phandle. This
> changes it to allocate that phandle so that it and any further
> overlays can properly reference that node.
> 

Then it appears that the base devicetree was not compiled with the
proper options.  Using the .dts from patch 2/2, I can cause the problem
with:

$ 
dtc -O dts overlay_base_manual_symbols_auto_phandle.dts 
/dts-v1/;

/ {

	test: test-node {
		test-int-property = <0x2a>;
		test-str-property = "foo";

		subtest: sub-test-node {
			sub-test-property;
		};
	};

	__symbols__ {
		test = "/test-node";
	};
};


But if I add the "-@" option, the phandle exists:

$ dtc -@ -O dts overlay_base_manual_symbols_auto_phandle.dts 
WARNING: label test already exists in /__symbols__/dts-v1/;

/ {

	test: test-node {
		test-int-property = <0x2a>;
		test-str-property = "foo";
		phandle = <0x1>;

		subtest: sub-test-node {
			sub-test-property;
			phandle = <0x2>;
		};
	};

	__symbols__ {
		test = "/test-node";
		subtest = "/test-node/sub-test-node";
	};
};


To go even further, there is no need to hand code a __symbols__
node with the current dtc:

$ cat overlay_base_manual_symbols_auto_phandle--no__symbols__.dts 
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
	};
};

$ dtc -@ -O dts overlay_base_manual_symbols_auto_phandle--no__symbols__.dts 
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
	};

	__symbols__ {
		test = "/test-node";
		subtest = "/test-node/sub-test-node";
	};
};


Does this remove the need for the proposed patch, or am I still
missing something?

-Frank
