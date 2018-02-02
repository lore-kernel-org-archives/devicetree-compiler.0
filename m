From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] libfdt: add helpers to read address and size from reg
Date: Thu, 1 Feb 2018 22:35:11 -0600
Message-ID: <CAL_JsqLJ=KK=PPnKBJBu1S5meTYRQxHyH5JFQGs2MLkm-ALuyA@mail.gmail.com>
References: <20180201230416.6641-1-afd@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180201230416.6641-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Feb 1, 2018 at 5:04 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
> From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
>
> This patch extends the capability of libfdt to parse the contents of device
> trees in a similar manner to fdt_address_cells and fdt_size_cells.
>
> It adds a helper function which reads the address and size of a device from
> the reg property and performs basic sanity checks.
>
> It does not perform translation to a physical address using the ranges
> properties of parents, but this enhancement may be added as a separate
> function in the future.

I'm concerned about merging this without translation support. First,
I'd question its usefulness without it. Second, it may encourage
people to write their DTs without any ranges just so this will work.

I tried to upstream the kernel and u-boot implementations to libfdt in
April 2014 (I couldn't find an archive). We've got to get it
relicensed and then David didn't like the implementation. He said he
was about to post his version, but then it derailed into PCI handling.
There's another implementation in the kernel powerpc boot code that
may be easier to re-license.

Rob
