From: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc 1.6.0 overlay full-path reference in array produces broken
 property names
Date: Tue, 28 Sep 2021 11:28:59 +0000
Message-ID: <20210928112859.79b55d5a@gmail.com>
References: <20210927140456.4e45f05b@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/KXcOC/DoBG60NPaZHVPHURdD9T7bh0MssYNDGQ/21k=;
        b=ZQwNsi8n/4yIxu1zHS6G0MYKuCRaeWJ/RKCzvhqjVC4sJT7ct3vcTBS96MrQVRm4CA
         vJs+DaO5gTfvITReByK1ILUlZHyF+0VneuLWM3YqMwLODaGFHLmUzhtLmYaxSmfMrIZi
         wgXjii8CqXJDx3U1tougISpdp0X9cCnIrhIZQ0dtgoMXTvErk1OS5EKQy2T5861sNP5C
         1MsnbzVufwQRyZaJfJ9rH4rvabEGyKSz5gZjuq3opcp8U6Wqg/yKaOADCEKrniqHjJR3
         iqgFn0NrPpTlaXNfoE5JV9iZoODKxwmd5ymWRgEQjO3Pp1ZZrKRVL7WNiCAZEikBJNeT
         L1WA==
In-Reply-To: <20210927140456.4e45f05b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, 27 Sep 2021 14:04:56 +0000, Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> (please keep me cc'ed in replies)
[...]
> This code builds fine:
>   $ dtc -I dts -O dtb -o test.dtbo test.dts
>   $
> But then when disassembling the output, I get:
>   $ dtc -I dtb -O dts test.dtbo
>   <stdout>: ERROR (property_name_chars): /__fixups__:/soc/gpio@7e200000: Bad character '/' in property name
>   ERROR: Input tree has errors, aborting (use -f to force output)

I just noticed 1.6.1 was released (but not packaged yet by my
distribution, it seems), so I reproduced from git master as of

  commit e33ce1d6a8c7e54e3ad12cff33690b6da0aee1dc (HEAD -> master, origin/master, origin/main, origin/HEAD)
  Author: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
  Date:   Fri Sep 24 23:39:56 2021 +1000

      flattree: Use '\n', not ';' to separate asm pseudo-ops

and I confirm the error is still present.

Regards,
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1
