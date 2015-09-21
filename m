From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] dtc: make check test for dtc --annotate
Date: Mon, 21 Sep 2015 10:55:28 -0700
Message-ID: <56004490.9090007@gmail.com>
References: <55F8EB35.5010601@gmail.com> <55F8EF1B.1040003@gmail.com> <20150921063336.GM20331@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=uH/aoDhrjBBiSln8QOIHKy2YuI9aN84bizOQMo72zVo=;
        b=klZ7ZhJJMiy17RykW2Jp+azq1yPV6ooSO5a9G2hb+6IOa7EtyB2AcmKc1zHHISDYOI
         Yjtu9F6H/pHqMcbz+F5GMNs2laa2OTDvfO/Lo4reeQZCF5spu1n8dF0TJdCda4T5Fi6i
         I2AdAjI+ejdDjiIQQdi/eAvHvh119iHQnmiEdePKGcCwLYeyLLVWpfRs9zLh+GloP/E6
         XfrnPQWG7W4AUxP+MyoJeM2Fk4hZy7zusdgoj0UDrvhmt1yvTyz1Sr63Gf2nBD0BmxvS
         lHNdHMW2zTc6MgJNqLtvCW34MKPDMNMp2OIrO7u+440RqYsaoePSNApKZ/+ud0AtOWTf
         5BtQ==
In-Reply-To: <20150921063336.GM20331-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/20/2015 11:33 PM, David Gibson wrote:
> On Tue, Sep 15, 2015 at 09:24:59PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Add dtc tests.
>>
>>   - dtc --annotate to create a .dts with annotations
>>   - compile the annotated .dts
>>
>> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> It'd be nice to make this test a bit less trivial by actually
> comparing the output against a sample.  Maybe for tests/include0.dts
> to give it a real workout.

I'll add a comparison test.


> 
>> ---
>>  tests/run_tests.sh |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> Index: b/tests/run_tests.sh
>> ===================================================================
>> --- a/tests/run_tests.sh
>> +++ b/tests/run_tests.sh
>> @@ -276,6 +276,9 @@ libfdt_tests () {
>>      run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceoutput.test.dts
>>      run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.test.dts.test.dtb
>>  
>> +    run_dtc_test --annotate -o sourceoutput.test.annotate.dts sourceoutput.dts
>> +    run_dtc_test -o sourceoutput.test.annotate.dts.test.dts sourceoutput.test.annotate.dts
>> +
>>      run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
>>      run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb embedded_nul_equiv.dts
>>      run_test dtbs_equal_ordered embedded_nul.test.dtb embedded_nul_equiv.test.dtb
> 
