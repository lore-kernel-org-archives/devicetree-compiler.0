From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 2/3] dtc: dts source location annotation
Date: Tue, 06 Oct 2015 00:45:34 -0700
Message-ID: <56137C1E.8060005@gmail.com>
References: <560F5D15.9060606@gmail.com> <560F5F20.30709@gmail.com> <20151006045607.GK3861@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1GXI9JWSXr2jdVdymPrV0WzUHQJaFATCfeMTUSAe1XM=;
        b=tMEdVnRLIullmMaWwJXEevu0IWIg9Itzc2bznGfLo0bG7haLLdnZuj2qkdkxFP59IH
         iKLNbppZ5xf77ful0E9Ng20vyhL4hh6bJb5VrISXDcRM+PzWcdqG/jTG1hrK1nQrKW6+
         W4GzTvNNg5HLGhrj/BCW8OsjbW6Z1JS7PFPZvjzywv9mnvhr9WCiCFh8sM7XDXYKkvVf
         gWzMBa4nBixD3lASLw+64PzTYGBO+Caqkmzw6PnKkrOnNNVXAef9FJQz4okHO3I0Lh83
         z5f2Jj5ESEsdgI5rT3COGAaFq17fn020HipBs2vMX3i7fWVNo7rBZTytDBEqNgwIvpV+
         VfeQ==
In-Reply-To: <20151006045607.GK3861-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/5/2015 9:56 PM, David Gibson wrote:
> On Fri, Oct 02, 2015 at 09:52:48PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Proof of concept patch.
>>
>> Annotates input source file and line number of nodes and properties
>> as comments in output .dts file when --annotate flag is supplied.

< snip >


>> Index: b/srcpos.c
>> ===================================================================
>> --- a/srcpos.c
>> +++ b/srcpos.c
>> @@ -246,6 +246,41 @@ srcpos_copy(struct srcpos *pos)
>>  	return pos_new;
>>  }
>>  
>> +struct srcpos *
>> +srcpos_copy_all(struct srcpos *pos)
>> +{
>> +	struct srcpos *pos_new;
>> +	struct srcfile_state *srcfile_state;
>> +
>> +	if (!pos)
>> +		return NULL;
>> +
>> +	pos_new = srcpos_copy(pos);
>> +
>> +	if (pos_new) {
>> +		/* allocate without free */
>> +		srcfile_state = xmalloc(sizeof(struct srcfile_state));
>> +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
>> +
>> +		pos_new->file = srcfile_state;
>> +	}
>> +
>> +	return pos_new;
>> +}
> 
> You still don't need this function.  srcfile_states have unlimited
> lifetime.

My observation about this is buried in a late reply to v5, so
copying here:

   If I don't allocate a new copy of pos->file, then the file names are
   incorrect.  I'm not sure why.  I can dig into this deeper to try to
   understand what is going on if you want me to.

It sounds like I do need to debug this.

-Frank
