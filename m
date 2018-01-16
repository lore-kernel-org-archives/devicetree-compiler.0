From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] srcpos: correct column numbers
Date: Mon, 15 Jan 2018 16:20:05 -0800
Message-ID: <4eec9dbb-c047-86ae-e4b2-08de9f0499fe@gmail.com>
References: <alpine.DEB.2.20.1801151932100.25462@hadrien>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=CHAhZDUBjLH1TG85qi9Hzi6MA7jVxjNbt107Uakq6oM=;
        b=e+6CJGP3/bDKAvgZrMgQCCTEhXIVI5kNLj1Fc0ByqiKvckQjJd4uoAilSsayMMaFYz
         VSYAEnswe5BwhstJfPXhM8SaT4V0kk20H44lFTTFDFrq+FkQoJ453KlnmQmdfM0tx1+H
         ermwgX4n0PPhlQnRzCc4BXn+0/f4PKdCfuexbm72fR6NRGYIZCyCe2svzzWBUcgLArUV
         /INrdFvtyx0C67LHAmhqS+SEYUDP4awnq7F434kG9WiLV5azLJdSSzpQIYRTON4J07Hd
         3hOB4NBVmVo0HDkKXiFh16bPjfSP4ujXQ0vOh7XlzJmfPop+HvgOg9tZMnymyWQBR2t+
         7ttA==
In-Reply-To: <alpine.DEB.2.20.1801151932100.25462@hadrien>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 01/15/18 10:33, Julia Lawall wrote:
> The start of a line is column 0, at least according to emacs.

According to vim, the first character of a line is column 1.  I don't know
if it has a concept of column 0, to the left of that character.

$ vim --version
VIM - Vi IMproved 7.4

Let the editor wars begin.... :-)

Personally, I use vim, but if the dtc column numbers match emac's world view
instead of vim's, that is fine with me.

-Frank

> 
> Every character counts, so need to increment by 1 before adjusting for tab.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>  srcpos.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/srcpos.c b/srcpos.c
> index 9d38459..e8fced9 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -154,7 +154,7 @@ void srcfile_push(const char *fname)
>  	srcfile->prev = current_srcfile;
> 
>  	srcfile->lineno = 1;
> -	srcfile->colno = 1;
> +	srcfile->colno = 0;
> 
>  	current_srcfile = srcfile;
>  }
> @@ -223,8 +223,9 @@ void srcpos_update(struct srcpos *pos, const char *text, int len)
>  	for (i = 0; i < len; i++)
>  		if (text[i] == '\n') {
>  			current_srcfile->lineno++;
> -			current_srcfile->colno = 1;
> +			current_srcfile->colno = 0;
>  		} else if (text[i] == '\t') {
> +			current_srcfile->colno++;
>  			current_srcfile->colno =
>  				ALIGN(current_srcfile->colno, TAB_SIZE);
>  		} else {
> 
