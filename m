From: "Tom Turelinckx" <tom-HiypchcOusz53ZRCpReHOg@public.gmane.org>
Subject: Re: bus error on sparc64 running type-preservation test
Date: Tue, 14 Apr 2020 18:34:24 +0200
Message-ID: <4c0be4b4-7f6e-4612-af7b-dfffb400597a@www.fastmail.com>
References: <001f01d611ad$f1f44420$d5dccc60$@turelinckx.be>
 <002001d611b0$c2dd7d20$48987760$@turelinckx.be>
 <20200414062534.GL48061@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turelinckx.be;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=gtK6ernyf1pQfV8ulDVHY/LLKBb2
        R6B9liwfKmZClwQ=; b=I8ozt2qY/qgGu2sXog4Zd7fa6Wp51lw0mlP5rrfrnIAL
        csu8PixZG4l0kyvw92HLJB+RHSYuBDMjEThbYAjN1fERgMv2YVgnuEeBCUbvhkDn
        evhbiYGtiyGrlv/TdHztBHI+6f5fILciYWq1CDQilSMIYek0LuhMFGd7NgKMQWtd
        eVaQ73HVINVTWUF9x+Kl7cqPTG5adWMBBbqn1Q57FTPPSBksW+Gy/Otjte5Q3ZTs
        7BPmgnEr5angwW+k0J2X4mNEMG3zsom45UNqVK7hNnPer8lFU0DsGNc9qFA+r4Nz
        XWk+Oa/bZfQ4uUJ4667q750jPOHY3D4HH2gtp0ftxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gtK6er
        nyf1pQfV8ulDVHY/LLKBb2R6B9liwfKmZClwQ=; b=vNBUIHVn5pkfb+/ErYxljn
        ax/JGZhmJKGTbAvsZUk3IHFjuVgKfkBqPD8y6ttTDqvLdzq6q/i2e/RaPxkfC9Q7
        LUpzeWOYI0faoRMHPYeFt3a7ziExU0cMO5zDDlO/do/BtS4qDBV+XxtpuhFjjRh7
        dbvNS+Xk8C+OgByoM8pF1KQ2UgSsBjMxC7VQwX7y7A58Q7ZKYFDsBdSM6m8AVd6k
        3mZ4ev2Y2mTDz06b2AZmz39aOkALNV57ERPGFUqmlKGpp8keFd6fIphYwcfQ+Fe0
        7pXdJGiFy0HkYlASpBbBNHHf2j9/vgHFDaejhmLUukIJR28fW5Q8zRoZz/xsGDxw
        ==
In-Reply-To: <20200414062534.GL48061-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

On Tue, Apr 14, 2020, at 8:25 AM, David Gibson wrote:
> I've just merged and pushed a change which I think will fix this to
> the master branch. Could you build and test that please?

It seems to work, thanks!

I've verified on debian sparc64 that make and make check succeed when I checkout b28464a, while make check fails with bus error when I checkout 87a656a.

I've also verified that the debian src package version 1.6.0-1 builds successfully on sparc64 with patch b28464a applied locally, and that the same package with the same patch applied still builds successfully on amd64. Those are the only archs I have access to.

> If you can make a minimal testcase which triggers this problem and
> submit it as an addition to the dtc testsuite, that would be terrific.

I have limited experience with C development, and zero experience with alignment issues, DTC or its test suite, so I can't be of much help here...

Best regards,
Tom
