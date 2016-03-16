From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] fdt: Try to read #address-cells/size-cells
	from parent
Date: Thu, 17 Mar 2016 00:21:44 +0100
Message-ID: <56E9EA88.8070407@xilinx.com>
References: <5b7c7b1b2f6a81b2f97f1496558b9d03a59d0288.1455105881.git.michal.simek@xilinx.com>
 <56C1A148.70905@xilinx.com>
 <CAPnjgZ3kv2gdzmktbqBApnxnH_pm3ZmXcZCgd2dpE8VhxbZ-hg@mail.gmail.com>
 <56C349E8.9030808@xilinx.com>
 <CAPnjgZ2ZWhdcQgdefoH9rzvHDLBo58i6-pnJnn2NEzpPMbMRrQ@mail.gmail.com>
 <56E728E2.5050905@xilinx.com> <20160315002743.GC15272@voom.fritz.box>
 <56E98751.4060007@xilinx.com> <20160316224727.GJ9032@voom>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20160316224727.GJ9032@voom>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: David Gibson <david@gibson.dropbear.id.au>, Michal Simek <michal.simek@xilinx.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

On 16.3.2016 23:47, David Gibson wrote:
> On Wed, Mar 16, 2016 at 05:18:25PM +0100, Michal Simek wrote:
>> Hi David,
>>
>> On 15.3.2016 01:27, David Gibson wrote:
>>> On Mon, Mar 14, 2016 at 10:10:58PM +0100, Michal Simek wrote:
>>>> On 13.3.2016 02:54, Simon Glass wrote:
>>>>> Hi Michal,
>>>>>
>>>>> On 16 February 2016 at 09:10, Michal Simek <michal.simek@xilinx.com> wrote:
>>>>>> Hi Simon,
>>>>>>
>>>>>> On 16.2.2016 17:00, Simon Glass wrote:
>>>>>>> Hi Michal,
>>>>>>>
>>>>>>> On 15 February 2016 at 02:58, Michal Simek <michal.simek@xilinx.com> wrote:
>>>>>>>> Hi Simon,
>>>>>>>>
>>>>>>>> On 10.2.2016 13:04, Michal Simek wrote:
>>>>>>>>> Read #address-cells and #size-cells from parent if they are not present in
>>>>>>>>> current node.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> I have code which read information about memory for zynqmp but memory
>>>>>>>>> node most of the time doesn't contain #address/size-cells which are
>>>>>>>>> present in parent node.
>>>>>>>>> That's why let's try to read it from parent.
>>>>>>>>>
>>>>>>>>> Also I think that we shouldn't return 2 if property is not found because
>>>>>>>>> it has side effect on 32bit systems with #address/size-cells = <1>;
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>  lib/libfdt/fdt_addresses.c | 18 ++++++++++++++----
>>>>>>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/lib/libfdt/fdt_addresses.c b/lib/libfdt/fdt_addresses.c
>>>>>>>>> index 76054d98e5fd..b164d0988079 100644
>>>>>>>>> --- a/lib/libfdt/fdt_addresses.c
>>>>>>>>> +++ b/lib/libfdt/fdt_addresses.c
>>>>>>>>> @@ -19,10 +19,15 @@ int fdt_address_cells(const void *fdt, int nodeoffset)
>>>>>>>>>       const fdt32_t *ac;
>>>>>>>>>       int val;
>>>>>>>>>       int len;
>>>>>>>>> +     int parent;
>>>>>>>>>
>>>>>>>>>       ac = fdt_getprop(fdt, nodeoffset, "#address-cells", &len);
>>>>>>>>> -     if (!ac)
>>>>>>>>> -             return 2;
>>>>>>>>> +     if (!ac) {
>>>>>>>>> +             parent = fdt_parent_offset(fdt, nodeoffset);
>>>>>>>>> +             ac = fdt_getprop(fdt, parent, "#address-cells", &len);
>>>>>>>>> +             if (!ac)
>>>>>>>>> +                     return 2;
>>>>>>>>> +     }
>>>>>>>>>
>>>>>>>>>       if (len != sizeof(*ac))
>>>>>>>>>               return -FDT_ERR_BADNCELLS;
>>>>>>>>> @@ -39,10 +44,15 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
>>>>>>>>>       const fdt32_t *sc;
>>>>>>>>>       int val;
>>>>>>>>>       int len;
>>>>>>>>> +     int parent;
>>>>>>>>>
>>>>>>>>>       sc = fdt_getprop(fdt, nodeoffset, "#size-cells", &len);
>>>>>>>>> -     if (!sc)
>>>>>>>>> -             return 2;
>>>>>>>>> +     if (!sc) {
>>>>>>>>> +             parent = fdt_parent_offset(fdt, nodeoffset);
>>>>>>>>> +             sc = fdt_getprop(fdt, parent, "#size-cells", &len);
>>>>>>>>> +             if (!sc)
>>>>>>>>> +                     return 2;
>>>>>>>>> +     }
>>>>>>>>>
>>>>>>>>>       if (len != sizeof(*sc))
>>>>>>>>>               return -FDT_ERR_BADNCELLS;
>>>>>>>>>
>>>>>>>>
>>>>>>>> Simon: Any comment?
>>>>>>>
>>>>>>> It seems risky to change the behaviour here. Also fdt_parent_offset() is slow.
>>>>>>>
>>>>>>> Can you point me to the binding / example DT that you are trying to parse?
>>>>>>
>>>>>> Look at dram_init(), etc.
>>>>>> https://github.com/Xilinx/u-boot-xlnx/blob/master/board/xilinx/zynqmp/zynqmp.c
>>>>>>
>>>>>> fdt_get_reg() is calling fdt_size_cells()
>>>>>>
>>>>>>
>>>>>> And this is DTS fragment.
>>>>>>         #address-cells = <2>;
>>>>>>         #size-cells = <1>;
>>>>>>
>>>>>>         memory {
>>>>>>                 device_type = "memory";
>>>>>>                 reg = <0x0 0x0 0x80000000>, <0x8 0x00000000 0x80000000>;
>>>>>>         };
>>>>>>
>>>>>> Code is in memory node I need to work with and asking for size-cells.
>>>>>> Current code returns 2 instead of error and the rest of code just works
>>>>>> with size = 2 which is incorrect for this setup.
>>>>>>
>>>>>> I have already changed size-cells = 2 in our repo because I need to
>>>>>> support for more than 4GB memory anyway but this should point to the
>>>>>> problem in that generic functions.
>>>>>
>>>>> I think this should go in a higher-level function. I very much doubt
>>>>> that this patch would be accepted upstream.
>>>>>
>>>>> Can you find the caller and make it call this function again (for the
>>>>> parent) when no nothing is found on the first call? Hopefully this
>>>>> caller will have access to the parent node and will not need to call
>>>>> fdt_parent_offset().
>>>>
>>>> The funny part is that nothing is found means return 2. If this returns
>>>> something <0 then there is not a problem to try it with parents.
>>>
>>> I don't have the full context of this thread, so it's a bit hard to be
>>> sure, but this doesn't look right from what I can see.  Two things to
>>> remember here:
>>>
>>>   * #address-cells and #size-cells describe the format of addresses
>>>     for children of this node, not this node itself.  So if you're
>>>     looking to parse 'reg' for this node, you *always* need to look at
>>>     the parent, not just as a fallback.
>>
>> ok that means that I should fix my code to find parent of current node
>> and then read address and size cells.
>>
>> fdt - actual memory node
>> parent = fdt_parent_offset(fdt, nodeoffset);
>> address_cells = fdt_address_cells(parent, nodeoffset);
>> size_cells = fdt_size_cells(parent, nodeoffset);
> 
> That's correct.  One way to look at it that #address-cells and
> #size-cells are properties of the bus anchored at this node, rather
> than properties of the node itself.
> 
>>>   * #address-cells and #size-cells are *not* inherited.  If they're
>>>     missing in a node, then the format for its children's addresses is
>>>     2 cell addresses and 2 cell sizes, it is *not* correct to look at
>>>     the next parent up for these properties.
>>>
>>
>> ok. And I expect that this is in spec.
> 
> Yes.  Actually relying on the default values is discouraged, of
> course: you should include #address-cells and #size-cells for any node
> with children.

Good thanks. I will test it when I have direct access to the board but I
can't see any problem if this is in spec.

Thanks,
Michal
