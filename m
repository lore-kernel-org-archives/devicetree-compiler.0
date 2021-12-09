From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] Support 'r' format for printing raw bytes with fdtget
Date: Thu, 9 Dec 2021 07:17:32 +0100
Message-ID: <923e8f19-48e8-8cbc-5bbb-fbc714517a80@gmail.com>
References: <20211208170055.13811-1-zajec5@gmail.com>
 <20211209053041.17984-1-zajec5@gmail.com> <YbGZlK/vOFaXtb21@yekko>
 <c59e41fd-bdfc-c419-e68f-0f6086c9b61e@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=eStX/DyP/CpE2OtJY6W959hxtkjzKzJ6Wr91Jg+MhN0=;
        b=HhmCxdrf0WaYphrAW2YlAW8CWkOBeASzCJxiAwTGNjJ9NYHR+wM3WcyzW+hVJoM3xw
         qmkvbtOjcpbWj74sPvjYj2G5sJuXrkqLtVambeqaWjIRrEKeT9p4GP7O3b8AyAnvGS/G
         wzn8onVPseMYgL1ttKWkmdlH1Cf0qN5TbCWZFgV6t4r8oH6vKBeYuFkkY0Uc16E+FePT
         PaAvQHXbAuTdvZ7aqsaBZqXUjYmGuTMfeoimAGQeVEMOK1WdlIBk6N7WY6fBWr1oeLDn
         3W0fhDEHsg+8lQkUFCeJg3+A+OeHSVRHNgdJDRL8JRgunUHLzFJJACIGPB40PJs3IqvR
         zsDg==
In-Reply-To: <c59e41fd-bdfc-c419-e68f-0f6086c9b61e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

On 09.12.2021 07:06, Rafał Miłecki wrote:
> On 09.12.2021 06:52, David Gibson wrote:
>>> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
>>> index d100d5a..11068e1 100755
>>> --- a/tests/run_tests.sh
>>> +++ b/tests/run_tests.sh
>>> @@ -855,6 +855,8 @@ fdtget_tests () {
>>>       run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
>>>       run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
>>>       run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode blob
>>> +    run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tr $dtb / compatible
>>> +    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tr $dtb /randomnode blob
>>
>> I think using \ escapes in strings will be shell dependent behaviour.
>> Have you tested this in shells other than bash?
> 
> It isn't back dependent but printf dependent. See fdtget-runtest.sh :
> printf '%b\n' "$expect" > $EXPECT
> 
> It seems even busybox's printf supports %b:
> # printf "%b" "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" | hexdump -C
> 00000000  0a 0b 0c 0d de ea ad be  ef                       |.........|
> 00000009

busybox proof:

# busybox printf 2>&1 | head -n 1
BusyBox v1.30.1 () multi-call binary.

# busybox printf "%b" "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" | hexdump -C
00000000  0a 0b 0c 0d de ea ad be  ef                       |.........|
00000009
