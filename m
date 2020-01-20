From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Mon, 20 Jan 2020 18:28:46 +0000
Message-ID: <20200120182837.GO3697@linaro.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
 <220e3aea-b273-417a-69c9-059236c888af@st.com>
 <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yIHlrjvTOBvuMpFxI0UYD9+tFFNdXNguPvpgjUnqhD8=;
        b=rnCEvDwoDApbJGuPbGXHyTmTfCOAtLcbDINEzjIPsBiL0I6zRdXgOBRf/u65dYl0BH
         axtA40kBe/RmDUUzNbSTXzR2AdR8dIQbq29rU9iNmi39NtYEj7PBwxCMQLoUQtsLBlnu
         GwpWj8s5B+zNDXG3qIyjkteGklth5fmsS+e54J1EpMMZ8RXmSUso3bry7fXmU3ara/Oh
         +MOBBxJqON6SkNDK94PcyuUwFpNvMonXB8/5TF0OpHEH4TUHyxTRD5ryLQ6rbUqb76QV
         PUUcsplJUyih4E0D/3avUFNyrChquEIyy+KGcwz5bYspkTqaSNj2YL2jC7SIguuhvkDM
         Cr6g==
Content-Disposition: inline
In-Reply-To: <a1233cd8-e73a-82d7-74bf-69109d1a0a07-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Frank!

Thanks for the link back to the previous discussion, it's very
helpful.

On Mon, Jan 20, 2020 at 10:14:22AM -0600, Frank Rowand wrote:
>On 1/20/20 4:56 AM, Alexandre Torgue wrote:

...

>> and the date). There are no "dtb versions", and "absolute/relative"
>> path which created concerns. One remaining concern is "reproducible
>
>Here is an example of the info from one of my builds:
>
>   From Linux 5.5.0-rc2-dirty by frowand the Mon Jan 20 09:50:58 CST 2020.
>
>The information 'Linux 5.5.0-rc2-dirty' is precisely what was most objected
>to in my proposal.

ACK. :-( I'm surprised to see so much push-back on what looks like a
simple piece of information here.

I've had users *specifically* asking for this kind of identification
so that they can verify the version of the DTB they're using at
runtime. Right now it can be a guessing game, which does not help
people trying to debug problems.

Cheers,
-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

