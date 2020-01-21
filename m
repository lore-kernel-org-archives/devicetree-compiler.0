From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Mon, 20 Jan 2020 21:39:28 -0600
Message-ID: <e8cdbcaa-800b-18db-11ec-3d8df9da68b5@gmail.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
 <220e3aea-b273-417a-69c9-059236c888af@st.com>
 <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
 <20200120182837.GO3697@linaro.org>
 <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zdgsz84FvwJzIN/En/yZAdV4WDABHd4kiHJoyghAqMA=;
        b=E0rGhZJTc7LrntC7wA6B/ETc1nRH8YtUrXlz+Pgq0AHx/c9KXbI4UCuv5Cxtxo0IYP
         04KOPPEaVLUD4VgkLT2R5TUn4Nn2eXygh/WPH0fIhFtQpmcQ6ZsCtKqAIe2KHUllEpx1
         FQIwhUmuUiA3uxr7eQwyevTVy5fDFV3kfx/JuQ+Wj8n7N/8rWv2qupGBqnrsMoa0E0+a
         G/yYs9DiMOZwZFDdfMnSI6CweIQxxrPl73jZEgg9IYLTR43pgFBTLMwbkBNmBhFsnVOC
         TKRylTPKHDXRz6Dh2MIhFRj0oBRMsb7edt4B2VYYzsLv2Js69qqDeN2WMzwQXI9ROUN4
         jhXw==
In-Reply-To: <f09ce50c-6721-c9d3-4f27-3f98a2d0b183-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 1/20/20 9:20 PM, Frank Rowand wrote:
> On 1/20/20 12:28 PM, Steve McIntyre wrote:
>> Hi Frank!
>>
>> Thanks for the link back to the previous discussion, it's very
>> helpful.
>>
>> On Mon, Jan 20, 2020 at 10:14:22AM -0600, Frank Rowand wrote:
>>> On 1/20/20 4:56 AM, Alexandre Torgue wrote:
>>
>> ...
>>
>>>> and the date). There are no "dtb versions", and "absolute/relative"
>>>> path which created concerns. One remaining concern is "reproducible
>>>
>>> Here is an example of the info from one of my builds:
>>>
>>>   From Linux 5.5.0-rc2-dirty by frowand the Mon Jan 20 09:50:58 CST 2020.
>>>
>>> The information 'Linux 5.5.0-rc2-dirty' is precisely what was most objected
>>> to in my proposal.
>>
>> ACK. :-( I'm surprised to see so much push-back on what looks like a
>> simple piece of information here.
> 
> Me too.
> 
> 
>>
>> I've had users *specifically* asking for this kind of identification
>> so that they can verify the version of the DTB they're using at
>> runtime. Right now it can be a guessing game, which does not help
>> people trying to debug problems.
>>
>> Cheers,
>>
> 
> If the information was reported as debug information via pr_debug(),
> would that work for your use case?  Or would the users' kernels
> not have debug enabled in the configuration?

And even pr_debug() might not be sufficient since the property
value is available via /proc/device-tree if the proc file
system is enabled.
