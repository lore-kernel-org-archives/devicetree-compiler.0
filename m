From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Mon, 20 Jan 2020 21:20:55 -0600
Message-ID: <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
 <220e3aea-b273-417a-69c9-059236c888af@st.com>
 <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
 <20200120182837.GO3697@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZaIHc6pqnmPWDx7qq975a0b91T6rwGOHbUAFNlb8Q2w=;
        b=tDAWKBVtK8elIgEhFfQUp6MqFnZDP/ZlYN/O6u1MhHhJ42hzW5+gupCqR/Q8gjdAlK
         tMAWjrNdHg9C31RwDQHYKKGHBogXttELnSM7oDZtPdPUsLtFokmCb+mCsG+fUqeQb1HH
         gtmQjNu0S8i2kFJGBajkbAWtB1UAc/wud5XyNmxxBQ3QVfAF4w07/IWUtGAzy2fFtTCX
         CIohi5hWheiH5SOYQ/44lgWMl4sAl5miBhxf8cw3Fjo0Q8qb5pIV84emuNMulwqTTx3f
         wiJLIFQ2Ryyb9/EgUIJ+2jzbN7FTLQebo/fODbq9YHao7tE3d2k4wsi629e3pEH3yiT3
         Swww==
In-Reply-To: <20200120182837.GO3697@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve McIntyre <steve.mcintyre@linaro.org>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

On 1/20/20 12:28 PM, Steve McIntyre wrote:
> Hi Frank!
> 
> Thanks for the link back to the previous discussion, it's very
> helpful.
> 
> On Mon, Jan 20, 2020 at 10:14:22AM -0600, Frank Rowand wrote:
>> On 1/20/20 4:56 AM, Alexandre Torgue wrote:
> 
> ...
> 
>>> and the date). There are no "dtb versions", and "absolute/relative"
>>> path which created concerns. One remaining concern is "reproducible
>>
>> Here is an example of the info from one of my builds:
>>
>>   From Linux 5.5.0-rc2-dirty by frowand the Mon Jan 20 09:50:58 CST 2020.
>>
>> The information 'Linux 5.5.0-rc2-dirty' is precisely what was most objected
>> to in my proposal.
> 
> ACK. :-( I'm surprised to see so much push-back on what looks like a
> simple piece of information here.

Me too.


> 
> I've had users *specifically* asking for this kind of identification
> so that they can verify the version of the DTB they're using at
> runtime. Right now it can be a guessing game, which does not help
> people trying to debug problems.
> 
> Cheers,
> 

If the information was reported as debug information via pr_debug(),
would that work for your use case?  Or would the users' kernels
not have debug enabled in the configuration?

-Frank
