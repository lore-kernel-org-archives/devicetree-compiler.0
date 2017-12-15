From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] checks: add chosen node checks
Date: Thu, 14 Dec 2017 21:11:52 -0600
Message-ID: <CAL_Jsq+M2jjKAstCmS8zPSf-SfFtq+vtKGYJtWvbJL9355L8cA@mail.gmail.com>
References: <20171214224001.17298-1-robh@kernel.org> <20171215022754.GB7753@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215022754.GB7753-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Dec 14, 2017 at 8:27 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Dec 14, 2017 at 04:40:01PM -0600, Rob Herring wrote:
>> Add some checks for /chosen node. These check that chosen is located at
>> the root level and that bootargs and stdout-path properties are strings.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Applied, thanks.
>
> One possible follow-on...
>
> [snip]
>> +static void check_chosen_node_stdout_path(struct check *c, struct dt_info *dti,
>> +                                       struct node *node)
>> +{
>> +     struct property *prop;
>> +
>> +     if (!streq(node->name, "chosen"))
>> +             return;
>> +
>> +     prop = get_property(node, "stdout-path");
>> +     if (!prop) {
>> +             prop = get_property(node, "linux,stdout-path");
>> +             if (!prop)
>> +                     return;
>> +             FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout-path'");
>> +     }
>> +
>> +     c->data = prop->name;
>> +     check_is_string(c, dti, node);
>
> .. you could also check that it's actually a valid path to a node,
> couldn't you?

Yes I thought of that, but it's often an alias. I didn't look closely,
but I don't think that would work unless I add that additional lookup.

Rob
