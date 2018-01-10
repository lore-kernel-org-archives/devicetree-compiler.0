From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] annotations: Check for NULL pos
Date: Tue, 9 Jan 2018 22:08:55 -0800
Message-ID: <d7cae26a-a92f-6a39-61ca-05fee9509722@gmail.com>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-2-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=M8EXo2BTvcqHF2/yMHw44M/tvNDP0kxUzaTJSJJ3jpo=;
        b=E1U7OtedwC0oLWKIEV5w8+3/cimejWE0MnWvatienxnbBm6Rc8jlmfKm5BlOh3Dewo
         cDWpzSXpO568C8xOapBd4/x1pxbM3/8sktbokkM51fdUyo1NPTewV0pRdKsd1bFk1ykX
         wLRAZpqRbRHutGTGYQ2CNN6sN93QrkEnd/07uUcvmC6iosphap2BEt6jBTPwuzD/JqUU
         4mc1M2SobDb82JXgTIqlyN/BRXkUjhA9ZQSrjrFSDNv1Ptj9hyn+0Q/8gdaEdkAUk4WP
         1kZj9YCVzz/Ncmx/ZRe5QyT20Rn6vCi8jl8t3Z8gcMyeSVlIDXY/jkXquTwqfixtXKmi
         NqXg==
In-Reply-To: <1515418607-26764-2-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 01/08/18 05:36, Julia Lawall wrote:
> Check for NULL position and file name.  Check for xasprintf failure.
> Builds on a patch proposed by Frank Rowand:
> 
> https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00377.html
> 
> Annotation extension will introduce the possibility of the position
> being NULL.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>  srcpos.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/srcpos.c b/srcpos.c
> index 9d38459..7f2626c 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -249,24 +249,35 @@ srcpos_copy(struct srcpos *pos)
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> -	const char *fname = "<no-file>";
> +	const char *fname;
>  	char *pos_str;
> -
> -	if (pos->file && pos->file->name)
> +	int rc;
> +
> +	if (!pos) {
> +		rc = asprintf(&pos_str, "%s:<no-line>", fname);
> +		goto out;
> +        } else if (!pos->file)
   ^^^^^^^^
    spaces instead of a tab

-Frank

> +		fname = "<no-file>";
> +	else if (!pos->file->name)
> +		fname = "<no-filename>";
> +	else
>  		fname = pos->file->name;
>  
> -
>  	if (pos->first_line != pos->last_line)
> -		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> -			  pos->first_line, pos->first_column,
> -			  pos->last_line, pos->last_column);
> +		rc = xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> +			       pos->first_line, pos->first_column,
> +			       pos->last_line, pos->last_column);
>  	else if (pos->first_column != pos->last_column)
> -		xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> -			  pos->first_line, pos->first_column,
> -			  pos->last_column);
> +		rc = xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> +			       pos->first_line, pos->first_column,
> +			       pos->last_column);
>  	else
> -		xasprintf(&pos_str, "%s:%d.%d", fname,
> -			  pos->first_line, pos->first_column);
> +		rc = xasprintf(&pos_str, "%s:%d.%d", fname,
> +			       pos->first_line, pos->first_column);
> +
> +out:
> +	if (rc == -1)
> +		die("Couldn't allocate in srcpos string");
>  
>  	return pos_str;
>  }
> 
