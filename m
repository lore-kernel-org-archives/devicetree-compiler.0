From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Thu, 4 Jan 2018 14:15:09 -0600
Message-ID: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Jan 4, 2018 at 2:11 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/31/17 22:59, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
>> Currently, references cannot be made to nodes in the base that do not already
>> have phandles, limiting us to nodes that have been referenced in the base fdt.
>> Lift that restriction by allocating them on an as-needed basis.
>
> I am very confused.  If I understand correctly, the problem is:
>
>   A base devicetree contains a __symbols__ node, where one of the properties
>   in that node has a value which is a path to a node, where that node does
>   not have a phandle property.
>
> Is that correct?

This is correct. Currently, the overlay support resolves the path to
the node just fine, but then dies when it doesn't have a phandle. This
changes it to allocate that phandle so that it and any further
overlays can properly reference that node.
