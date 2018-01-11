From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] checks: Use source position information for check failures
Date: Thu, 11 Jan 2018 10:19:06 -0600
Message-ID: <CAL_JsqJeh5GFsqjfVuQ-StiPGNzej6Su9k+DS+joPYRPqTB1Ww@mail.gmail.com>
References: <20180108224927.1016-1-robh@kernel.org> <20180110053020.GD19773@umbus.fritz.box>
 <CAL_Jsq+Brr4e1ZvPapnpRLb5hJPsyBjxoZAdDeaqsD2y0Ma6Jw@mail.gmail.com> <20180110234340.GD24770@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110234340.GD24770-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Wed, Jan 10, 2018 at 5:43 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Jan 10, 2018 at 10:41:54AM -0600, Rob Herring wrote:
>> On Tue, Jan 9, 2018 at 11:30 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Mon, Jan 08, 2018 at 04:49:27PM -0600, Rob Herring wrote:
>> >> Now that we retain source position information of nodes and properties,
>> >> make that the preferred file name (and position) to print out in check
>> >> failures. This will greatly simplify finding and fixing check errors
>> >> because most errors are in included source .dtsi files and they get
>> >> duplicated every time the source file is included.
>> >>
>> >> For now, only converting a few locations and using a new macro name. I
>> >> will convert all FAIL occurences once we agree on the new syntax. Also,
>> >> after this, some checks may need some rework to have more specific
>> >> line numbers of properties rather than nodes.

[...]

>> >> @@ -1049,7 +1065,7 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
>> >>       }
>> >>
>> >>       if (!has_reg)
>> >> -             FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
>> >> +             FAIL_POS(c, dti, node->srcpos, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
>> >>                    node->fullpath);
>> >
>> > Checks are already associated with a node, would it make more sense to
>> > print the position information from the general code?
>>
>> Not sure I follow the question. You mean pass in the struct node and
>> get the srcpos and fullpath inside check_msg?
>
> Basically, yes.

That would help getting the messages to be a more consistent form
like: 'source/file.dts:123: (ERROR|WARNING): /full/path/of/node: bad
news'

That had been something I wanted to do. The downside is it makes for
really long lines, but many messages already have the full path in
them. I guess we could go to 2 line messages where the 1st line is the
error and the 2nd line is the node path. The downside to that is I
typically do 'sort -u' (stripping the the dtb name) to de-duplicate
the errors as 10 boards including 1 SoC dtsi file gives me 10 of the
same error. Of course, printing the dts filename instead fixes that
problem.

It probably makes sense to do that in one step rather than reword
error messages twice.

>> While checks are associated with nodes, specific error messages may be
>> associated with properties. This is one example where we could make
>> the error message be the exact line (of the #address-cells or
>> #size-cells), but that would require re-working the check a bit to get
>> the property structs (and srcpos).
