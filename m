From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 1/3] dtc: protect against null pointer dereference
 in srcpos_string()
Date: Tue, 06 Oct 2015 00:32:20 -0700
Message-ID: <56137904.9080203@gmail.com>
References: <560F5D15.9060606@gmail.com> <560F5E44.9080006@gmail.com> <20151006041000.GI3861@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=/O3Dkrh55UZFweQNSEl1DouNeaJ8dY9c3RKszWJAK6U=;
        b=BpHSWb2adiBIDf5Xj3pZVtdPl9J1FUGj7rLm/F2CcPZmg5F8sYwu0oUvkSmZ1lX9as
         L9jNYoUidyUaBVdUriazxQSbMr3g1w2s6sreushG7vPPC29ueGx57p0A5TajztILhWTM
         798eaOtnTBRVUXbwfc5PK+fyVt/nQMI4dfqPNPaOY1YaXLevTmAtcEm/qqwZeia5QCUf
         MjUP/PIidv7it79QzDiccGMskXgyOMw92bCTkfBfxu2UMlanYFEeudY0OpWlI5tRyXiA
         YxCkWrMBap5qgPAwcoEiFIe82OTqN3Vz/UucHVVZgvubXAVHIlVqT+sGY41Wuebm+cgo
         DCEQ==
In-Reply-To: <20151006041000.GI3861-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/5/2015 9:10 PM, David Gibson wrote:
> On Fri, Oct 02, 2015 at 09:49:08PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>
>> Check for NULL pos before dereferencing it in srcpos_string().
>>
>> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>> ---
>>  srcpos.c |    6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> Index: b/srcpos.c
>> ===================================================================
>> --- a/srcpos.c
>> +++ b/srcpos.c
>> @@ -268,11 +268,13 @@ srcpos_string(struct srcpos *pos)
>>  	char *pos_str;
>>  	int rc;
>>  
>> -	if (pos)
>> +	if (pos && pos->file)
>>  		fname = pos->file->name;
>>  
>>  
>> -	if (pos->first_line != pos->last_line)
>> +	if (!pos)
>> +		rc = asprintf(&pos_str, "%s:<no-line>", fname);
>> +	else if (pos->first_line != pos->last_line)
> 
> This logic still seems backwards to me.  I'd really prefer the !pos
> check to go first, then !pos->file, then the normal case.
> 

Checking !pos first results in either an early return, a goto,
or more deeply nesting the

   if (pos->first_line != pos->last_line)
      asprintf(...)
   else if (...)
      asprintf(...)
   else
      rc = asprintf(...)

all of which seemed worse.  In the next version I'll change it to:

char *
srcpos_string(struct srcpos *pos)
{
        const char *fname = "<no-file>";
        char *pos_str;
        int rc;

        if (!pos) {
                rc = asprintf(&pos_str, "%s:<no-line>", fname);
                goto out;
        } else if (pos->file) {
                fname = pos->file->name;
        }

        if (pos->first_line != pos->last_line)
                rc = asprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
                              pos->first_line, pos->first_column,
                              pos->last_line, pos->last_column);
        else if (pos->first_column != pos->last_column)
                rc = asprintf(&pos_str, "%s:%d.%d-%d", fname,
                              pos->first_line, pos->first_column,
                              pos->last_column);
        else
                rc = asprintf(&pos_str, "%s:%d.%d", fname,
                              pos->first_line, pos->first_column);

out:
        if (rc == -1)
                die("Couldn't allocate in srcpos string");

        return pos_str;
}
