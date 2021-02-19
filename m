From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [DTC][RFC] dtc: Allow better error reporting
Date: Fri, 19 Feb 2021 11:07:53 +0530
Message-ID: <20210219053753.xtikm3ixfhq3bukr@vireshk-i7>
References: <3950d7da35130a850ba9217ac7bfef781fa850b2.1613042485.git.viresh.kumar@linaro.org>
 <YCyknRMDNA4+pd59@yekko.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D6z8WMDhJSCQVjJTW2F8knNb9jI6u5KG0UJ57gqaN8Y=;
        b=yQ2yMsprSfYCyDZBer8Y7BfwcectJtOf88W7hGROar9T0bZ9HkUyu3hiV1F/5jOCdd
         VKfdYtjLdZG0N2msAPxbNkio11vIC6c4QrbRYv7iIrjP7kIAwmtMem4TS/drM/O5KMX8
         5gzWTI5VxR9rmGOW8cwO20ZJBW9WLi0+2+I5MSajNE00DPqXtKmLLlO+bA5o0jzLaBDf
         /Kayje/sVMCudp7bCu52SdC+E66R9G2xOAfDi9moOWDLtkc9vsNam+AU0YmuvLSBJ+oy
         C7OkpqtkxdXHa55WHUMao0tzwM14JpFPlnXuKCSTDFPbqf8zPkwV+pNmGPj8KEtJFMhu
         NcWA==
Content-Disposition: inline
In-Reply-To: <YCyknRMDNA4+pd59-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 17-02-21, 16:07, David Gibson wrote:
> > diff --git a/dtc.h b/dtc.h
> > index d3e82fb8e3db..b8ffec155263 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -29,6 +29,12 @@
> >  #define debug(...)
> >  #endif
> >  
> > +#ifdef VERBOSE
> > +#define dtc_err(fmt, ...)	fprintf(stderr, "DTC: %s: %d: " fmt, __func__, __LINE__, ##__VA_ARGS__)
> > +#else
> > +#define dtc_err(fmt, ...)
> > +#endif
> 
> Actually, the natural way to handle this is to make dtc_err() -
> hrm... bad name, since this is libfdt - be something that must be
> provided by libfdt_env.h.  The default version would have it be a
> no-op, with a define that makes it use stdio.
> 
> This has the additional advantage that it would be relatively
> straightfoward to enable the rich reporting in a non-POSIXish
> environment (these should provide their own libfdt_env.h and it can
> implement the error reporting callback in a way that makes sense in
> that environment.

Okay, I will move it to libfdt_env.h. And using -DVERBOSE to enable
rich errors look fine to you, right ?

> You will also definitely need Makefile changes, because you'll need to
> make the fdtoverlay binary link to the verbose-compiled version of
> libfdt not the normal one.

Actually it worked for me because of how we compile this in kernel, we
don't link different libraries there.

libfdt-objs     := fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
libfdt          = $(addprefix libfdt/,$(libfdt-objs))
fdtoverlay-objs := $(libfdt) fdtoverlay.o util.o

HOST_EXTRACFLAGS := -DVERBOSE

> Except.... it might make more sense to do this in dtc rather than
> libfdt, more on that in different mails.

I am not sure about this comment, are you going to send more emails on
this ?

-- 
viresh
