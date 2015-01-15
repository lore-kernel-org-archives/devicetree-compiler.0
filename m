From: "long.wanglong" <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] fdtput: add delete node and property function
Date: Thu, 15 Jan 2015 12:11:18 +0800
Message-ID: <54B73DE6.5030108@huawei.com>
References: <1421207637-32690-1-git-send-email-long.wanglong@huawei.com> <CAPnjgZ32hrN9t3FUDtZzrbjTrq9UdC4wgK6J_Z2XUNWb47cyBA@mail.gmail.com> <20150115030816.GE5297@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150115030816.GE5297-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 2015/1/15 11:08, David Gibson wrote:
> On Tue, Jan 13, 2015 at 08:07:59PM -0800, Simon Glass wrote:
>> Hi Wang,
>>
>> On 13 January 2015 at 19:53, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>>> add the delete node and property function for fdtput.
>>>
>>> usage:
>>> 1) delete a node
>>>  # fdtput test.dtb -d node /chosen/son
>>> 2) delete a property
>>>  # fdtput test.dtb -d prop /chosen/ prop_name
>>
>> This is a great addition!
>>
>> I know David is keen on single character flags. But would it be better
>> to have a separate delete option, e.g.
> 
> Well.. it's not that I'm actually keen on them.  Just that I haven't
> thought the bother of another dependency adding a long options library
> was worth it so far.
> 
>> -r to remove a node
>> -d to delete a property
> 
> I like that suggestion better than "-d node" and "-d prop".
> 

ok.

> But I wonder if it might be even simpler to just base it on the number
> of arguments so:
> 
> $ fdtput foo.dtb -d /node@1234 some-property
> 
> will delete a single property, but
> 
> $ fdtput foo.dtb -d /node@1234
> 
> will delete the whole node.
> 

Hi David Gibson,

if we decide to delete node or property based on the number of the arguments.
we just delete a node or a property at once.

how about the following suggestion:

$ fdtput -r <options> <dt file> [<node>...]

will delete several nodes,

$ fdtput -d <options> <dt file> <node> [<property>...]

will delete several properties in a node.

the `fdtput` can create several nodes at once. so i think that it should to delete
several nodes at once.


Best Regards
Wang Long






--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
