From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v4] Add limited read-only support for older (V2 and V3)
 device tree to libfdt.
Date: Mon, 29 Jan 2018 17:05:48 -0800
Message-ID: <f84af8a8-b873-535a-e12f-7b275fce9cb6@freebsd.org>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
 <20180125051340.22391-1-nwhitehorn@freebsd.org> <20180127074638.GG2099@umbus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180127074638.GG2099@umbus>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 01/26/18 23:46, David Gibson wrote:
> On Thu, Jan 25, 2018 at 05:13:40AM +0000, nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org wrote:
>> From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
>>
>> This can be useful in particular in the kernel when booting on systems
>> with FDT-emitting firmware that is out of date. Releases of kexec-tools
>> on ppc64 prior to the end of 2014 are notable examples of such.
>>
>> Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> Applied, thanks.
>
> I have fixed up the whitespace in a couple of places that git am
> pointed out to me.
>
> Testcases for reading the old format trees would be a nice follow up.
>

Thanks much, and apologies for the long back-and-forth. I'll try to gin 
up some test cases now that the test framework works on FreeBSD.
-Nathan
