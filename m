From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 2/3] dtc: dts source location annotation
Date: Tue, 06 Oct 2015 23:58:22 -0700
Message-ID: <5614C28E.9080708@gmail.com>
References: <560F5D15.9060606@gmail.com> <560F5F20.30709@gmail.com> <20151006045607.GK3861@voom.fritz.box> <56137C1E.8060005@gmail.com> <20151007053246.GS3861@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=xblSrIc20smWCXU1g8spBNUQbQ7MLSWQN/7315fBM7E=;
        b=j/IQ3UNVk6NRchTBaBK3WpyADRLrofXYEEImZcP3VF1kHjnu9ZWFKVecB7UKrzCRWJ
         8ygm1vO/kR7EfetZCbEBIGBDpCWnNkazP7qQjQs/5krqkqrcaD6s7u3p/P/j8xVDS9wm
         tsfj34Jei9+hl15JsP57IQ15PZnwiQ/utt2OnfCVxEdpwzg3fb99DXkpGnqIDzQscKpB
         hgf7d56GxDX5kUrjvSLYHj16uqmVoKeRTzprB51aqzEP21u8Ef8Im9kMqbm+E0+jKzUs
         UQluX+tLRPya3cdC5jU+YijxkXnDCoGVYmOryBkA3Emvm06nFCHIq+eSR1i53aWAmCSw
         awmQ==
In-Reply-To: <20151007053246.GS3861-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/6/2015 10:32 PM, David Gibson wrote:
> On Tue, Oct 06, 2015 at 12:45:34AM -0700, Frank Rowand wrote:
>> On 10/5/2015 9:56 PM, David Gibson wrote:
>>> On Fri, Oct 02, 2015 at 09:52:48PM -0700, Frank Rowand wrote:
>>>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>>>
>>>> Proof of concept patch.
>>>>
>>>> Annotates input source file and line number of nodes and properties
>>>> as comments in output .dts file when --annotate flag is supplied.
>>
>> < snip >
>>
>>
>>>> Index: b/srcpos.c
>>>> ===================================================================
>>>> --- a/srcpos.c
>>>> +++ b/srcpos.c
>>>> @@ -246,6 +246,41 @@ srcpos_copy(struct srcpos *pos)
>>>>  	return pos_new;
>>>>  }
>>>>  
>>>> +struct srcpos *
>>>> +srcpos_copy_all(struct srcpos *pos)
>>>> +{
>>>> +	struct srcpos *pos_new;
>>>> +	struct srcfile_state *srcfile_state;
>>>> +
>>>> +	if (!pos)
>>>> +		return NULL;
>>>> +
>>>> +	pos_new = srcpos_copy(pos);
>>>> +
>>>> +	if (pos_new) {
>>>> +		/* allocate without free */
>>>> +		srcfile_state = xmalloc(sizeof(struct srcfile_state));
>>>> +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
>>>> +
>>>> +		pos_new->file = srcfile_state;
>>>> +	}
>>>> +
>>>> +	return pos_new;
>>>> +}
>>>
>>> You still don't need this function.  srcfile_states have unlimited
>>> lifetime.
>>
>> My observation about this is buried in a late reply to v5, so
>> copying here:
>>
>>    If I don't allocate a new copy of pos->file, then the file names are
>>    incorrect.  I'm not sure why.  I can dig into this deeper to try to
>>    understand what is going on if you want me to.
>>
>> It sounds like I do need to debug this.
> 
> That's weird.  Yeah, we need to debug this.

OK, I will dig into this.


> Btw, I was thinking about the filenames - in particular the way the
> current draft will give you very unwield full paths.  I was thinking
> about a different approach which should shorten those without
> requiring different invocation or hand hacking:
>    * For the "base" dts file (the one passed on the command line),
>      always use just the basename (i.e. final piece of the file path)
>    * For all other files, print the relative path from the directory
>      of the base file
> 
> /include/ directives already open files relative to the directory of
> the file including the /include/ so we have some of the mechanisms for
> this already.
> 
> I think this will require a moderate amount of extra work, so I
> wouldn't suggest it for the first cut, but does it sound like a good
> approach in principle to you?

Yes, I think that is a great way to approach it.  I'll take a look at
how much work this is, and if small enough I will add another patch
to the end of the series to do this.

-Frank
