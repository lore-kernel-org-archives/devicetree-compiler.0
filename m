Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594DE5C5FB
	for <devicetree-compiler@vger.kernel.org>; Tue, 23 Jan 2024 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706021353; cv=none; b=N1VPY8EOLadfDXgQ6SxsUe65BzlPQUs5zb7gUobYNmRHQxJKCUWdVcMm8BCLRXSj/hW7Wocsu0Hon2T4zkdokCljEDom6n8ZvcXHzgNDzJwrvMOyP229IzQZy+bjttKRv0OwxTFyyaDqn6k1sp+qKCdMNFdkTqTFmCD8xMxlVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706021353; c=relaxed/simple;
	bh=La/krprfLB1iLp9D6feKHQG26ycjn49ElZD7M5o9XAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bp+MGCZ8HJMeN/YO+jFe77O0Jk21ET/J8mLUX0FvA7QlJPbKD6IaH6w2JI480ewT9GUXSxx2UmhkGzbNrx4MnDBHJs4C+vVGa/u1W7l80geQa0QacfUikfNQf8LAgiPXL2BMMhZ7D2BVoT95MsKbCZKg6BdCLPSWd7ZZ5vNOM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSDO8u3A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSDO8u3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807AEC433F1;
	Tue, 23 Jan 2024 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706021352;
	bh=La/krprfLB1iLp9D6feKHQG26ycjn49ElZD7M5o9XAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FSDO8u3ABPC/Zzgtvu+FhY7e8NyhnV10a65sqyyhGCDLNYCXh4Boh1ATrQwVVw/Bx
	 7Rnr0Qv6YXGIGPhbM7MNAo0pZ0LKO+GgW+tkX3kZQwD7TgSu7xNrkE1zIlUjlFqn2W
	 e94jzP6HF7VSqtuEhJ4oJJVpnP9c1/vwNei24zGvnfguz5f5aEtHgQBK91pdd39zox
	 wx6+SV4V5dDV+ptBXCZub7WZnCQrLUWWe8ZHGGJsWtD6j4Nzg++x19O0lontSzL9jd
	 3mR2mH2ntugctqANIL58uhLu0pOqQQbU/7Nm7h+e4jj4sw+L41xFP3txlL6ToEK9oq
	 iNHbKqY5Iyzag==
Message-ID: <ede817cf-5609-4241-8fc5-5d38c6e9e517@kernel.org>
Date: Tue, 23 Jan 2024 16:49:07 +0200
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] checks: Suppress warnings on overlay fragments
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: david@gibson.dropbear.id.au,
 =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?=
 <Qun-wei.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>,
 =?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?=
 <casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>,
 =?UTF-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?=
 <Kuan-Ying.Lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>,
 =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?=
 <chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>,
 =?UTF-8?B?SXZhbiBUc2VuZyAo5pu+5b+X6LuSKQ==?=
 <ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>,
 devicetree-compiler@vger.kernel.org, "Bajjuri, Praneeth" <praneeth@ti.com>
References: <20230308091539.11178-1-qun-wei.lin@mediatek.com>
 <CAL_JsqKTM=gaQGZhrBCRkBusYYMci0mJGAFf9RTvCx00G2OJzg@mail.gmail.com>
 <347151917fb777e66a54e983efbbe0303f63e01a.camel@mediatek.com>
 <CAL_Jsq+L50RZ-s55tncFMHA1AwL5An13n2OVPzknnpu=uOvzhQ@mail.gmail.com>
 <ZGCCxgVHQ3wJoXFt@yekko> <a1f53131-f436-4998-b370-4956557818fd@kernel.org>
 <20240122160133.GD601827-robh@kernel.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240122160133.GD601827-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/01/2024 18:01, Rob Herring wrote:
> On Tue, Jan 16, 2024 at 02:54:23PM +0200, Roger Quadros wrote:
>> Hi David & Rob,
>>
>> On 14/05/2023 09:42, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org wrote:
>>> On Tue, Apr 18, 2023 at 12:33:26PM -0500, Rob Herring wrote:
>>>> On Thu, Apr 13, 2023 at 7:44 AM Qun-wei Lin (林群崴)
>>>> <Qun-wei.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>>>>
>>>>> On Thu, 2023-03-09 at 09:12 -0600, Rob Herring wrote:
>>>>>> On Wed, Mar 8, 2023 at 3:17 AM Qun-Wei Lin <qun-wei.lin@mediatek.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> The overlay fragment is a special case where some properties are
>>>>>>> not
>>>>>>> present in the overlay source file, but in the base file.
>>>>>>>
>>>>>>> example:
>>>>>>> +-----------------------------+--------------------+
>>>>>>>> base.dts                    | overlay.dts        |
>>>>>>>
>>>>>>> +-----------------------------+--------------------+
>>>>>>>> /dts-v1/;                   | /dts-v1/;          |
>>>>>>>>                             | /plugin/;          |
>>>>>>>> /{                          |                    |
>>>>>>>>   parent: test {            | &parent {          |
>>>>>>>>     #address-cells = <1>;   |   child@0 {        |
>>>>>>>>     #size-cells = <0>;      |     reg = <0x0>;   |
>>>>>>>>   };                        |   };               |
>>>>>>>> };                          | };                 |
>>>>>>>
>>>>>>> +-----------------------------+--------------------+
>>>>>>>
>>>>>>> It will cause the following false alarms when compiling the overlay
>>>>>>> dts.
>>>>>>>
>>>>>>> 1. /fragment@0/__overlay__: Character '_' not recommended in node
>>>>>>> name
>>>>>>> 2. /fragment@0/__overlay__: Relying on default #address-cells value
>>>>>>> 3. /fragment@0/__overlay__: Relying on default #size-cells value
>>>>>>> 4. /fragment@0/__overlay__:reg: property has invalid length (4
>>>>>>> bytes)
>>>>>>>    (#address-cells == 2, #size-cells == 1)
>>>>>>>
>>>>>>> This workaround will fix them by skip checking for node named
>>>>>>> __overlay__.
>>>>>>>
>>>>>>> Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>>>>>> ---
>>>>>>> V1 -> V2:
>>>>>>>  - Add is_overlay_node() helper
>>>>>>>  - Skip anything starting with "__" in
>>>>>>> check_node_name_chars_strict()
>>>>>>>
>>>>>>>  checks.c | 18 ++++++++++++++++++
>>>>>>>  1 file changed, 18 insertions(+)
>>>>>>
>>>>>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>>>
>>>>>> Though I do wonder if as a matter of policy on overlay structure, if
>>>>>> we should require an overlay to have the parent node with
>>>>>> #address-cells/#size-cells. In the end that would be duplicated data,
>>>>>> but without it there's no way to parse and validate reg/ranges in an
>>>>>> unapplied overlay. That's just one example issue in being able to
>>>>>> validate overlays.
>>>>>>
>>>>>> Rob
>>>>>
>>>>> Hi Rob,
>>>>>
>>>>> Thank you for your review.
>>>>>
>>>>> I think I've found another problem:
>>>>> +-------------------------+----------------+
>>>>> | base.dts                | overlay.dts    |
>>>>> +-------------------------+----------------+
>>>>> | /dts-v1/;               | /dts-v1/;      |
>>>>> | /{                      | /plugin/;      |
>>>>> |   #address-cells = <1>; |                |
>>>>> |   #size-cells = <0>;    | &test {        |
>>>>> |   test: example@0 {     |   reg = <0x1>; |
>>>>> |     reg = <0x0>;        | };             |
>>>>> |   };                    |                |
>>>>> | };                      |                |
>>>>> +-------------------------+----------------+
>>>>>
>>>>> The following error message is printed when compiling:
>>>>> Warning (reg_format): /fragment@0/__overlay__:reg: property has invalid
>>>>> length (4 bytes) (#address-cells == 2, #size-cells == 1)
>>>>> Warning (unit_address_vs_reg): /fragment@0/__overlay__: node has a reg
>>>>> or ranges property, but no unit name
>>>>> Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on
>>>>> default #address-cells value
>>>>> Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on
>>>>> default #size-cells value
>>>>>
>>>>> We can't get the #address-cells/#size-cells of the parent of the
>>>>> example node in the overlay structure.
>>>>> Do you think we should change it to is_overlay_node(node) instead of
>>>>> is_overlay_node(node->parent)?
>>>>> Or we just need to skip checking for node names starting with "__" in
>>>>> check_node_name_chars_strict()?
>>>>
>>>> I think this is the tip of the iceberg in terms of being able to
>>>> validate overlays. Turning off address checks just kicks the problem
>>>> to schema validation.  Perhaps the overlay should be structured to
>>>> include the parent bus node with #address-cells and #size-cells.
>>>
>>> Right.  So, I think to handle this properly we need to change the
>>> structure of dtc:
>>>
>>>   * Rather than applying source level overlays as we parse them, we
>>>     should parse them each separately into a structure, then
>>>     internally apply them
>>>
>>>   * Checks would then need to be divided into those (A) that can be
>>>     checked on any individual overlay fragment, and those (B) that can
>>>     only be checked on a complete tree
>>>
>>>   * We'd run the (A) checks before merging the overlays in dtc, and
>>>     the (B) checks only after doing so.
>>>
>>>   * For runtime overlays (/plugin/) we'd skip the (B) checks entirely,
>>>     which would accomplish what you're aiming for here.
>>>
>>> I had plans to make a restructure like this quite a while ago, but
>>> I've never had the time to go ahead with it.  If you want to give it a
>>> go, that would be great.
>>>
>>
>> FYI.
>> I'm facing a somewhat similar issue with this patch [1]
>> [1] https://lore.kernel.org/all/20230923080046.5373-2-rogerq@kernel.org/
>>
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtso:65.8-140.3: Warning (avoid_default_addr_size): /fragment@3/__overlay__: Relying on default #address-cells value
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtso:65.8-140.3: Warning (avoid_default_addr_size): /fragment@3/__overlay__: Relying on default #size-cells value
>>
>> To give some background:
>>
>> The GPMC block has separate address spaces per chip select.
>>
>>  From Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>>    ranges:
>>      minItems: 1
>>      description: |
>>        Must be set up to reflect the memory layout with four
>>        integer values for each chip-select line in use,
>>        <cs-number> 0 <physical address of mapping> <size>
>>
>> The ranges location in the device tree overlay is correct. The overlay is
>> obviously meaningless without the base tree. It depends on the #address-cells
>> and #size-cells defined in the base tree.
>>
>> Your proposal to fix this is valid but is definitely not trivial to fix
>> especially for someone who is not familiar with dtc internals. :P
>>
>> Is there something simpler we could do to resolve this issue for overlay nodes.
>> e.g. For overlay nodes we skip the "Relying on default address/size" check?
> 
> I think the overlay needs to define #address-cells/#size-cells because 
> otherwise the only way we can ever validate (not just with dtc, but any 
> tool) an overlay is by applying it. That of course means either you 
> have to change the overlay target to the parent node or allow something 
> like this to work:
> 
> #address-cells = <1>;
> #size-cells = <0>;
> 
> &test {
>   reg = <0x1234>;
> };
> 
> In this case, the sizes aren't really used, but serve as annotations for 
> the tools.

But one address/size-cells might not fit all cases in an overlay as the
nodes in the overlay may have parents with different address/size-cells.

-- 
cheers,
-roger
