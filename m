From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: add phandle with arg property checks
Date: Tue, 21 Nov 2017 15:06:46 -0600
Message-ID: <CAL_JsqLEwYN9eto2PRiWG7aEzBOeNeADP0miOS_jgs5cifmvOA@mail.gmail.com>
References: <20170814214807.338-1-robh@kernel.org> <20170818043502.GQ5509@umbus.fritz.box>
 <CAL_Jsq+yA2W=SD9zSkWxw-R16uNELeqPqJK3fVMvi0_jhEbooQ@mail.gmail.com> <20170819073333.GA12356@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170819073333.GA12356-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sat, Aug 19, 2017 at 2:33 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Aug 18, 2017 at 11:02:01AM -0500, Rob Herring wrote:
>> On Thu, Aug 17, 2017 at 11:35 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Mon, Aug 14, 2017 at 04:48:06PM -0500, Rob Herring wrote:
>> >

[...]

>> > It does mean listing everything in the check_table which is a pain.  I
>> > would really like to change things so that a single macro can both
>> > declare the check and add it to the master list, but I haven't thought
>> > of a portable way to do that so far.
>>
>> This is done in the kernel frequently using linker sections. Each
>> check entry would get put into a specific section, then you just
>> iterate through the entries. Would that work? I could imagine that
>> linker magic may not be all the portable.
>
> Right.  Linker sections are the usual way to do this, but that
> requires lower level knowledge of how the toolchain works than I
> really want to put into dtc.  At heart dtc is really a very
> straightforward standard C program, so I don't want to introduce
> dependencies on a specific compiler.

To follow up on this, what about using dlopen/dlsym and having
libraries with checks? That should be fairly portable. dtc could load
checks libs from some known or env path. Each checks library would
provide some known entry point we can call for it to register its
checks.

Rob
