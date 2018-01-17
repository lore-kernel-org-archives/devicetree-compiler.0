From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3 v2] annotations: add the annotation functionality
Date: Tue, 16 Jan 2018 20:17:43 -0800
Message-ID: <3ba34256-9442-5177-90db-0a180728e05b@gmail.com>
References: <1516040650-9848-1-git-send-email-Julia.Lawall@lip6.fr>
 <1516040650-9848-4-git-send-email-Julia.Lawall@lip6.fr>
 <20180117011322.GW30352@umbus.fritz.box>
 <4f3eda57-e50b-922b-0b02-d5859aedda71@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nu4RvO8mLURbnUX+lmXOiXWT2RYxsu6AkOHpUubU6q4=;
        b=hk8LFy1X5mFEBb1nr77LGG5j84+gpp/md91MCqwVDi3hIgaeYDuE1BxC4/xeRA0zbP
         2VLPjMLyS/9vSL9EXu5CFXIXEPWHeBybdRQffQ52pKa98nkFvB1MvrsY6xKTjBT15k+M
         qWU7ncN0G5lDiN+F3+b3gP/ssrdQH/8EwRhTI0rcR6q5gIYSHRyjPIo3I3xun5N/hHpp
         qzoMPDPcS+jsilHulR243LBz9BRpcY//wEWabPJLp6Cr5vFnK7AIdeWvphQB3KtIuiVo
         aZWT5d2lX0a1RLpUrVJbgAbElRhNtAC9gzvDsvR7ealw+vDp6VApg1BaNB1KNbj+ga19
         JSLQ==
In-Reply-To: <4f3eda57-e50b-922b-0b02-d5859aedda71-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Hi Julia,

When I was creating the sample output for this reply to David,
I noticed that the --annotate-full annotation for the dtc
generated content (eg the phandle properties) are reporting
"/* <no-file>:<no-line> */".  Did you intend to remove this,
as you did for the --annotate-full case?

-Frank


On 01/16/18 20:13, Frank Rowand wrote:
> On 01/16/18 17:13, David Gibson wrote:
>> On Mon, Jan 15, 2018 at 07:24:10PM +0100, Julia Lawall wrote:
>>> This commit provides two new command-line options:
>>>
>>> --annotate (abbreviated -T)
>>> --annotate-full (abbreviated -F)
>>
>> What's the rationale for having two different versions of the
>> annotations?
> 
> I'll put an example to try to explain, at the end of this email.
> 

< snip >
