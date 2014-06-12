From: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] Properly handle \0 delimited string lists
Date: Thu, 12 Jun 2014 17:47:28 -0500
Message-ID: <20140612224728.GA17938@toadite.austin.ibm.com>
References: <1402430256-8359-1-git-send-email-jack@codezen.org>
 <20140611131039.GA29130@voom>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=yUN8QSxbdSM76WGdgwF9fjgtAEj5+LmRHHtV3OrWIH0=;
        b=BWtTTuPMI0fhWESW7xD1sJwx4ta6n7thbWHbbSGMCvl7T+PyyYFQ0QWQCyf2e2yyoF
         ZvT+x2S/L3bn98/rG9n4aTlLsEZmKPbXea7nTx+vz+N8Z9JXDWHweXf3yEBWllMKEFsL
         xzoZpdU8cVxTlwHtD/EgmtXZJOdNCOERSSKG+Gz5iMZGToRFA8DcU1/Y6J+hAUKEP5aL
         QZ5kNjbVo/n+EHH+u3aW53Br1Cjiw57/mM9fxXhzpjY/Z5QYMSwMrhd+0dlf+hkefxMz
         OKWEuyRP6q25EPG1HcdlvDiGQS4P3pJWli5JnZ+Qk2AWr7WcxRGpXGD1PiRUZ5qWumqx
         DscA==
Content-Disposition: inline
In-Reply-To: <20140611131039.GA29130@voom>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jun 11, 2014 at 11:10:39PM +1000, David Gibson wrote:
> Hi Jack,
> 
> Long time no see :).

Yeah, I was pretty pleased to have an excuse to send something your way =)

> 
> On Tue, Jun 10, 2014 at 02:57:36PM -0500, Jack Miller wrote:
> > reserved-names="res1\0res2\0res3";
> > 
> > Is valid DTS. This one-liner expands data based on the len given by the lexer
> > instead of strlen.
> > 
> > Without this patch, realloc gets confused and hangs. For example:
> > 
> > *** Error in `./dtc': realloc(): invalid next size: 0x0000000001961670
> > ***
> 
> So.. the patch certainly isn't wrong, and is arguably safer than the
> current version.
> 
> But.. I haven't been able to reproduce the problem, and I don't really
> see how it would occur in the first place.
> 
> The thing we're taking a strlen of is the input with it's escapes, so
> it won't have NULs, just backslashes and 0 digits.
> 
> Or am I missing something?

Sorry, I was unclear. The \0 was my short hand for a real embedded NULL
character, which may be intentionally wrong-headed, but I don't think it's
invalid (or if it is invalid, should at least not cause the compiler to do
bad things).

In refining my testcase I realized that it doesn't fail on realloc with all
bad input, but it does generate mangled output otherwise.

I've uploaded two short .dts snippets just because pasting NULLs into an
email seems like a bad idea:

http://codezen.org/static/broken-dts.tar.gz

One causes the realloc, the other causes the mangled output on git HEAD. Both
are working properly with my patch.

- Jack
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
