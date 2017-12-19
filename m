From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] checks: add graph binding checks
Date: Tue, 19 Dec 2017 12:36:48 -0600
Message-ID: <CAL_Jsq+3AiKuBj5kRA+EDpGSBBYJ-J4ZRCf0Yuk_XF9eMKb18w@mail.gmail.com>
References: <20171215031853.8229-1-robh@kernel.org> <20171219050400.GN4786@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171219050400.GN4786-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Dec 18, 2017 at 11:04 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Dec 14, 2017 at 09:18:53PM -0600, Rob Herring wrote:
>> Add checks for DT graph bindings. These checks check node names,
>> unit-addresses and link connections on ports, port, and endpoint nodes.
>>
>> The graph nodes are matched by finding nodes named 'endpoint' or with a
>> 'remote-endpoint' property. We can't match on 'ports' or 'port' nodes
>> because those names are used for non-graph nodes. While the graph nodes
>> aren't really buses, using the bus pointer to tag matched nodes is
>> convenient.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Could you give me a reference to somewhere these graph nodes are
> described?  It' a type I wasn't even vaguely aware of up until now.

It is newish:

https://www.kernel.org/doc/Documentation/devicetree/bindings/graph.txt

Rob
