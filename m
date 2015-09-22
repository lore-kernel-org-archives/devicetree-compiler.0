From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/3] dtc: linux kernel build process to create
 annotated .dts
Date: Tue, 22 Sep 2015 10:24:38 -0700
Message-ID: <56018ED6.4090601@gmail.com>
References: <5600E191.9020903@gmail.com> <5600E9A2.5050000@gmail.com> <20150922104013.GQ20331@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ezW9kAoqkE/WSSQ4k1JTLDQJA8SlrHV/TkeA57CzKsQ=;
        b=AgOVqC+sticJNHbUN7JToW2VB8LjEZBrHyR1ZJPZmhxqJJC3CHe9tVNtpvEybPMbZq
         h8yr5PxYlAfsMbQOUYdkPh4kEAH21qZGYGJyaSFMXDT9byBalqicLu3q58NQu6RAccWP
         V+HNSddKJ5WzC1FBUuNWe7c8cWoZpZTMTUD/AHTzCciaZTY4qLgHn2k6EIbHBYlI0Qrj
         OEAh0mKN+kMHpzrWhZ8NofENfHHYmEKXhsMiJEEAZ1Ej8UggJAnEEsDAwCi/19vN1jcu
         tFWuSJ/tkhC0KsJaK4PVSa2KIfAenBcPKO67UJwwliuxfPch7DA47ZkWIgpytNQSLRIB
         asxg==
In-Reply-To: <20150922104013.GQ20331-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/22/2015 3:40 AM, David Gibson wrote:
> On Mon, Sep 21, 2015 at 10:39:46PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Add a new temp file in the build directory arch/${arch}/boot/dts/
>> that contains the expanded device tree source with source file locations.
>>
>> Requires a new version of the dtc compiler that understands the
>> --annotate flag.
>>
>> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> Bit weird having a patch against an entirely different project / tree
> in the same series, but the patch itself looks file.

Yes! :-)  Just here for the convenience of anyone who wants to test
the earlier patches.

I will stop including this patch when I drop the "RFC" from the title.


> 
>> ---
>>  scripts/Makefile.lib |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> Index: b/scripts/Makefile.lib
>> ===================================================================
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -287,12 +287,15 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>>  	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
>>  		-i $(dir $<) $(DTC_FLAGS) \
>>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
>> +	$(objtree)/scripts/dtc/dtc --annotate -O dts -o $(dtc-annotate-tmp) \
>> +		 $(dtc-tmp) ; \
>>  	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>>  
>>  $(obj)/%.dtb: $(src)/%.dts FORCE
>>  	$(call if_changed_dep,dtc)
>>  
>>  dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
>> +dtc-annotate-tmp = $(subst $(comma),_,$(dot-target).annotate.dts.tmp)
>>  
>>  # Bzip2
>>  # ---------------------------------------------------------------------------
> 
