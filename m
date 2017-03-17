From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v9 0/5] Introduce Python bindings for libfdt
Date: Fri, 17 Mar 2017 16:12:32 -0600
Message-ID: <CAPnjgZ0Czzso4Jr3e5do5SP8QN_3quxraT56jNU-AdAcVNudcg@mail.gmail.com>
References: <20170304235229.5343-1-sjg@chromium.org> <CAPnjgZ1pdbNMCdGbSZQ9aE=rGR0XZyJ-e9Fqsj2v0ThEuk6SiQ@mail.gmail.com>
 <20170317040758.GN12402@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4AFygrKGPSMhrH3jeQYcsrnGvO1C5DXVKrMXgGh3BIk=;
        b=Dm4yo7b+J7Cu6kqlaaiW6oOWcgTXYwZeYjU9VMMNNT8fiGXYzehQsRONtfC7Vu7Dlb
         pI/HG1vQ4a/8TpX+WRhayU7HBQLjmid0x/6jAICK9CUXkK9QCrHYUzSm7bUDpdpgzzI0
         KGfOG3RZNYGGERC5x5gFXqwbBMakayvM//9v7OeYMBCiF8U9e7z13Z/sTjoa0BNE3EZC
         c7RvPD5+rQqLVLy4XtVosBfhlYsVudmdFWjYnVkpRf5x1U27cvuLVVztnBgPzdniuiep
         oK+OF7aTfsRVzOgL3iThiE5DsOk/RZTub0wBrOOCButgs3fescvyMoV7N8JA2DZB3LCE
         tRjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4AFygrKGPSMhrH3jeQYcsrnGvO1C5DXVKrMXgGh3BIk=;
        b=YXvnumRmBBT8T3/+0uyjHkz49OXSH6/NMy8tLSMmfHrI0ekuZO1n+RpnvsydzpegSx
         Jkqit9byvHpecrxPTAGwDcsb5N7rlWTdo/IJTeW+GsB+yuV7LyO+TjD5SgZmZFAwrEe2
         aH/MV47EY2+psQn9jvvhOvTIetxfBYH57yhiY=
In-Reply-To: <20170317040758.GN12402-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 16 March 2017 at 22:07, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Mar 14, 2017 at 08:20:53AM -0600, Simon Glass wrote:
>> Hi David,
>>
>> On 4 March 2017 at 16:52, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> >
>> > At present libfdt consists of only a C implementation. Many scripts are
>> > written using Python so it useful to have Python bindings for libfdt.
>> > Apparently this has never been attempted before, or if so I cannot find a
>> > reference.
>> >
>> > This series starts the process of adding this support, with just a
>> > bare-bones set of methods.
>> >
>> > The v8 series provides binding that can be used like this:
>> >
>> >     fdt = libfdt.Fdt(open(fname).read())
>> >     node = fdt.path_offset('/subnode@1')
>> >     print fdt.get_prop(node, 'compatible')
>> >     subnode = fdt.first_subnode(node, quiet=[libfdt.NOTFOUND])
>> >     while subnode > 0:
>> >         print fdt.get_name(subnode)
>> >         subnode = fdt.next_subnode(subnode, quiet=[libfdt.NOTFOUND])
>>
>> Just checking in to see how this looks now? I sent one v10 patch but
>> the rest is as is. Let me know if you'd like me to send the whole
>> thing again.
>
> Sorry, my day job has been kind of hectic lately.
>
> So, for one thing, yes, I'd like a repost of the whole set - I didn't
> keep the last spin ready to hand.
>
> But I'm also still not thrilled with the behaviour in the v10 patch
> you posted. It prints information _only_ if there are failures, which
> makes it a drag to check, and confusing since the tests show up in the
> final numbers but have no other visibility.
>
> I think this can go one of two ways:
>    - Give the Python tests close to the existing testcases.  I realize
>      that's awkward since they use python unittest not the existing
>      home-rolled framework, but do what you can.
>
> or
>    - Don't integrate the python tests at all.  Have make check run the
>      existing testsuite, then the python test suite (if python is
>      available).  This should produce *some* output for both parts in
>      all cases (so you know it has run), even if it's just a minimal
>      summary for the unittest part.  Don't include the python tests in
>      the totals for the other part.

It's pretty easy to just always print the output. I'll send that as
v11 and see what you think.

Regards.
Simon
