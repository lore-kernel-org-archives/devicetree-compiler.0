From: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 1/2] dtc: fix missing string in usage_opts_help
Date: Mon, 4 Sep 2023 10:20:45 -0400 (EDT)
Message-ID: <1807796864.143083.1693837245095.JavaMail.zimbra@savoirfairelinux.com>
References: <20230904020058.1935334-1-charles.perry@savoirfairelinux.com> <ZPVGJrsOKaKyOrmu@zatzit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 6EDBD9C28FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
        t=1693837245; bh=n6AF+mE20/q+l5d9xJSIs3YLM1fOLiuDVc4vVXLLOB0=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=kdPnUL1j67jMFRDRYwR6d2m6s1j62oflSWKChA05QFdFuW869jUpetD39V/ZtsRX8
         T7nV0yetVYMnm88jcfULnhAn6E4xra2D/5MMj7OWDYyeh3ZXQz0xC4X/6xhBZPZc+O
         VTWBX4EVdvZK8+ha1P7VJUC+r9Nm5loJNR1pdqg7w9W19ImiPViRLCGjVn6Jd9rX1b
         Cl4NrZDyPspjzoBjuHOSnU2A6LlRTnMy2hrxKi8bUtD6ps1eib0X+pNH89VT4HGwKl
         yc1TwdbjaHg1ErbMVeMAvfN1mUGpZF1Q4wNYQZnsytZ35vWWnT+m9jBs/bkOPzMKKO
         +4dS+v5Ga63hQ==
In-Reply-To: <ZPVGJrsOKaKyOrmu@zatzit>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


On Sep 3, 2023, at 7:51 PM, David Gibson david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org wrote:

> On Sun, Sep 03, 2023 at 07:00:57PM -0700, Charles Perry wrote:
>> This fixes the output of the `dtc --help` command as the last few
>> entries were offset by one.
>> 
>> Signed-off-by: Charles Perry <charles.perry-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> 
> Good catch, but when I apply this the descriptions still don't line up
> with the correct options.  I think the new entry has been added in the
> wrong order?
> 

Oops! you're right, let me resubmit that patch.

>> ---
>>  dtc.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/dtc.c b/dtc.c
>> index d2e4e2b..775d527 100644
>> --- a/dtc.c
>> +++ b/dtc.c
>> @@ -107,6 +107,7 @@ static const char * const usage_opts_help[] = {
>>  	"\n\tEnable generation of symbols",
>>  	"\n\tEnable auto-alias of labels",
>>  	"\n\tAnnotate output .dts with input source file and line (-T -T for more
>>  	details)",
>> +	"\n\tPossibly generates a __local_fixups__ and a __fixups__ node at the root
>> node",
>>  	"\n\tPrint this help and exit",
>>  	"\n\tPrint version and exit",
>>  	NULL,
> 
> --
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
>				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
