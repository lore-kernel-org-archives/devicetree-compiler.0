From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] annotations: short annotations
Date: Tue, 9 Jan 2018 13:01:52 -0800
Message-ID: <57b60447-2ae9-7caa-6522-67e5c8663401@gmail.com>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-4-git-send-email-Julia.Lawall@lip6.fr>
 <20180109112130.GM2131@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oYyWrj4MlbPPizmFcxsu2/sWuwRoV3o7teJk65g/5Vg=;
        b=NEig/BHMHwR68si1q9Dud4zbcRf034qfG9aKhoHNu7u+0eqrygzogFQop5bZo9ICAW
         2gC4rrg3wEdsGUBDBe2sfeL/8mwRjwOGvM34grGC5+14mfslTdh+tAFphWBG5P3EK0Mf
         K8k7r3bJ81d4uWfsVMCU770gXU6uMP+CPrrmXZ02jnl95wSFo6utFA0C+79cbiYCeDuj
         jRkiyfp7EueVosC8QKtau0zFhnyBFvdrjcf8EdFmpszeaT3CAHrtuXL5LdD9p3EDwj/9
         oO6J6QqTJwA4JoKiN87uy2Xfdd8PnM+kxu1Z9bs2sx8cniJWYldXg1UVgMgWjHm/Yr7V
         p+jQ==
In-Reply-To: <20180109112130.GM2131-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

On 01/09/18 03:21, David Gibson wrote:
> On Mon, Jan 08, 2018 at 02:36:45PM +0100, Julia Lawall wrote:
>> Based on the following patch by Frank Rowand (no changes):
>>
>>
>> https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00378.html
> 
> If there are no changes, then it should definitely have Frank's S-o-b.
> 
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
>> ---

< snip >

In the context of the S-o-b questions, I was referencing the Linux kernel
documentation for the meaning of S-o-b.  I realized that I should check
that the same (or similar) definitions existed in the dtc project, but
have not found that definition.  Should that definition be added to
file README.license?

I think the appropriate portion of the Linux kernel file
Documentation/process/submitting-patches.rst (which to the best of my
understanding is GPL v2) is a portion of section "11) Sign your
work - the Developer's Certificate of Origin":


The sign-off is a simple line at the end of the explanation for the
patch, which certifies that you wrote it or otherwise have the right to
pass it on as an open-source patch.  The rules are pretty simple: if you
can certify the below:

Developer's Certificate of Origin 1.1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) is
            maintained indefinitely and may be redistributed consistent with
            this project or the open source license(s) involved.

then you just add a line saying::

        Signed-off-by: Random J Developer <random-ld4jwAGwUXQYGaZWVHDzw80vGNN6ct63@public.gmane.org>

using your real name (sorry, no pseudonyms or anonymous contributions.)
