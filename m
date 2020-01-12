From: Paul Spooren <mail-5h8edhdOQ2pAfugRpC6u6w@public.gmane.org>
Subject: Re: dtc for .dts file linting
Date: Sun, 12 Jan 2020 12:08:37 -1000
Message-ID: <7ad93142-542f-a269-2e61-3d87f75900fb@aparcar.org>
References: <7fcc1540-0e42-381c-3cfa-b42f8639dcc9@aparcar.org>
 <4ff0fc0f-7b0d-b80d-831b-3e62f9070697@gmail.com>
 <CAL_JsqJT45tVCM4Y7LJt+T6kR27U1-0pxx+WLU4oBtmGOwd58A@mail.gmail.com>
 <7a87731d-03a2-726f-16c2-0f3877a113ae@gmail.com>
 <20190803013544.GA2096@umbus.fritz.box>
 <ec4f11a3-71e1-2d2a-fa71-6cd826dc5189@aparcar.org>
 <20190824093957.GJ3027@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190824093957.GJ3027-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>


On 8/23/19 11:39 PM, David Gibson wrote:
> On Sat, Aug 03, 2019 at 06:22:41PM +0200, Paul Spooren wrote:
>> On 03.08.19 03:35, David Gibson wrote:
>>> On Fri, Aug 02, 2019 at 01:02:47PM -0700, Frank Rowand wrote:
>>>> On 8/2/19 10:29 AM, Rob Herring wrote:
>>>>> On Thu, Aug 1, 2019 at 7:45 PM Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>> Hi Paul,
>>>>>>
>>>>>> On 7/31/19 7:46 AM, Paul Spooren wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I hope this mail reaches the correct people!
>>>>>>>
>>>>>>> At OpenWrt[0] there are sometimes badly styled .dts files which waste
>>>>>>> human time to comment and fix, it would be nice to have some automatic
>>>>>>> checks for that. Is there a tool like astyle or clang-format for device
>>>>>>> tree files?
>>>>>> The bindings documents are being converted into a json-schema vocabulary.
>>>>>> Once in this format, the bindings to be used to validate .dts files.
>>>>>> See section "##Testing" in the file Documentation/devicetree/writing-schema.md
>>>>>> which is in the Linux kernel source tree for information on the validation
>>>>>> tools.
>>>>>>
>>>>>> Also, dtc has been adding many checks.  See file checks.c in the dtc source
>>>>>> tree.
>>>>> Yes, but none of those concern formatting of dts files (e.g. 8
>>>>> character tabs, {} locations, spaces around '='). I think the dtc
>>>>> checks code is too late in the flow to check those things, but maybe
>>>>> it is possible now with the source annotations recently added now that
>>>>> I think about it? My original thought was adding something at the
>>>>> earlier stages with the bison/flex parsing (of which I really have no
>>>>> experience with).
>>>>>
>>>>> Rob
>>>>>
>>>> Good point, I mis-read Paul's email as a desire to catch errors instead
>>>> of style issues.
>>>>
>>>> One possible way to see formatting style issues uses the dtx_diff
>>>> script in the Linux kernel source tree:
>>>>
>>>>    scripts/dtc/dtx_diff original.dts > new.dts
>>>>    scripts/dtc/dtx_diff -f original.dts new.dts
>>>>
>>>> The first command will use dtc to reformat original.dts into new.dts.
>>>>
>>>> The second command will compare the original .dts to the reformatted
>>>> .dts.  Without the "-f", it may be difficult to determine which node
>>>> a changed property is in.
>>>>
>>>> Due to the includes, it may be difficult to determine exactly which
>>>> source file contains any given line.  The "-T" option will add file
>>>> and line information.  "-T" will be useless on the second command,
>>>> because the file reported for original.dts will be different for
>>>> every line from the file reported for new.dts, but could be
>>>> useful to find the source in the original .dts:
>>>>
>>>>    scripts/dtc/dtx_diff -T original.dts
>>>>
>>>> dtx_diff uses the dtc sort option by default.  If you want the diff
>>>> to be ordered more like the original.dts, use:
>>>>
>>>>    scripts/dtc/dtx_diff -u original.dts > new.dts
>>>>    scripts/dtc/dtx_diff -u -f original.dts new.dts
>>> Right.  More generally, dtc -I dts -O dts can kind of be used as a
>>> reformatting tool.  Now that we have type annotations it should no
>>> longer mangle decisions about how to encode information which it would
>>> have in the past.  It will still strip comments, however.
>> We came up with this idea before but comments are to important to drop
>> them.
> Right, it's not a solution as it stands, but it might be a starting
> point.
>
> I think it's probably not practical to try to preserve comments
> through the dtc run.  However, it might be reasonable to copy the dtc
> bison file and make a comment preserving indenting tool.  We did
> something somewhat similar for convert-dtsv0.
>
>> However it'd be a possibility to strip comments from the original
>> file, additionally convert the file back and forth and compare the
>> stripped original and the resulting file.
> Right, that could be done now.
>
>> This should at least be enough
>> for automatic testing, however a local script doing real linting would
>> be the only real solution...
>>> I do also wonder if the dts syntax is close enough to C that something
>>> like "indent" or "clang-format" would kind of work on it.
>> I played a bit with an online tool [0] for DTS, however I failed e.g. to
>> have lines starting with `#` correctly indented (is this an English
>> word?. Apart from that, clang-format did not complain about the file format.
> Ah, yeah leading # will be a problem here as it has in several other
> contexts dealing with cpps.
>
>> [0]: https://zed0.co.uk/clang-format-configurator/

I played a bit around with these tools but nothing really usable came 
out of it. Is there any chance this get dtc doing "style" checks or 
should I just train clang-format to ignore anything starting with a #?

Best,
Paul

