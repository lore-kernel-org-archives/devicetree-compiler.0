From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 2/3] dtc: make check test for dtc --annotate
Date: Tue, 22 Sep 2015 10:21:55 -0700
Message-ID: <56018E33.5090708@gmail.com>
References: <5600E191.9020903@gmail.com> <5600E953.40308@gmail.com> <20150922103907.GP20331@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ZLLgiQmBLBHmuWBB+2ewz/Qun8GecBdSSz1ZZoe8xbg=;
        b=CG7jQedP4Ey8PQVaeSsoX4tuuQp4HVlcVo1mEbIRJQPEInLG7pN9RqN4U/2FW9eKUt
         pFZDhyHMuGrO9ZM5IVt23a4/9zlPp3IKpkuCKUMqLRpV4CjQ47BtLPyaOCWpxOXEb1Db
         Ga1HDZnVYg/hygps6TNaWPrUCMxcb4CZPp1P5KKxGVrA7PMzHbs5R1rk2mORnfVnigGA
         n9zSYe7L19oPbzX39hxtdqFpqSRBl95F9DnxJyNXduI7s1TvoXRlD9new93UQ6uLn9+s
         n4RTeFS0oiMeS8oAiI1Ge8PPWSpde9/MofgMEqGt1rX5QcTZm0cvrhEAycvQeilw+44D
         vYEQ==
In-Reply-To: <20150922103907.GP20331-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 9/22/2015 3:39 AM, David Gibson wrote:
> On Mon, Sep 21, 2015 at 10:38:27PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Add dtc tests.
>>
>>   - dtc --annotate to create a .dts with annotations
>>   - compile the annotated .dts
>>   - compare the .dts created from include0.dts to the .dts created
>>     by first compiling include0.dts with annotations, then compiling
>>     the resulting .dts without --annotations to strip the annotation
> 
> My brain hurts trying to follow that.
> 
>> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>> ---
>>  tests/run_tests.sh |   10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> Index: b/tests/run_tests.sh
>> ===================================================================
>> --- a/tests/run_tests.sh
>> +++ b/tests/run_tests.sh
>> @@ -276,6 +276,16 @@ libfdt_tests () {
>>      run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceoutput.test.dts
>>      run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.test.dts.test.dtb
>>  
>> +    # verify annotated .dts can be compiled
>> +    run_dtc_test --annotate -o sourceoutput.test.annotate.dts sourceoutput.dts
> 
> 1) Looks like you forgot to git add sourceoutput.dts

sourceoutput.dts is an existing .dts that I used again.  But it looks like a bad
choice - I think I should just use include0.dts, as you suggested.

> 2) All your generated files should be named *.test.dts, so that make
> clean will get rid of them.

Will fix.


> 
>> +    run_dtc_test -o sourceoutput.test.annotate.dts.test.dts sourceoutput.test.annotate.dts
>> +
>> +    # verify annotated .dts can be stripped to match non-annotated
>> +    run_dtc_test -o includes.dts include0.dts
>> +    run_dtc_test --annotate -o includes.annotate.dts include0.dts
>> +    run_dtc_test -o includes.annotate_undo.dts includes.annotate.dts
>> +    run_wrap_test cmp includes.dts includes.annotate_undo.dts
> 
> So, this checks that annotate doesn't break the semantic parts of the
> tree, which is a good test.
> 
> But I was suggesting a canned example, including the annotations to
> check for regressions in the annotation generation itself.

OK, I think I understand now.  Add a test to make sure that the annotation is
correct.  This will be interesting because the source path in the annotation
is an absolute path, including the location of the dtc git repository.  The
way that I strip off the location of the dtc git repository in my personal
world is a bit ugly.  I'll think about how to do this.


> 
>>      run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
>>      run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb embedded_nul_equiv.dts
>>      run_test dtbs_equal_ordered embedded_nul.test.dtb embedded_nul_equiv.test.dtb
> 
