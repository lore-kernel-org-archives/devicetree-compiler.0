From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Thu, 20 Feb 2014 17:07:12 -0800
Message-ID: <5306A6C0.9000206@gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=KcBO2aww1dNetcopjP+XphwKKOL37wK+UBobn2MLK/o=;
        b=u7ldU6TDU9RkMFEbsYnrv2yD9kd+qF/aWXJxSCS7ULM1aEIhwICcgCJ/wlWvK7+SXI
         wQBUaAw6PESuzqRiNXg0obobBWWYv3wPgLwYcVoqfKlArX/NXiTOxF1m0MGG/w5NyJk7
         vWKzlfUy4ET7U6HbWlJOSdZtgdOR+2EJysS8OQ/W6NJJdRheyU6Y7/d3kz3uPNi6xWbw
         UUh/KKDxNsNmK1UpqI9Rc0NGilu9LipYYEUPHOttQb3XjOEVvXODm8dGgwXEQZmjTeAL
         nY7c5wh6n+NDtZOCuFeA1ea7IGWEtRNG933BzCnKHHHN+5tIP37fW+wpf2VhtrctYZa2
         YdRw==
In-Reply-To: <20140217180544.GU7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2/17/2014 10:05 AM, Jason Cooper wrote:
> All,
> 
> At last weeks devicetree irc meeting, I took on the task of writing this
> email.  I'm a bit behind.
> 
> One of the outcomes of the ARM/devicetree discussion at the 2013 Kernel
> Summit was that we were going to hold off on separating the devicetree
> from the Linux kernel tree.  The primary reason for this was to get
> through the backlog of patches.
> 
> It's been several months, and we're seeing evidence of other projects
> having difficulty keeping in sync with the kernel tree.  Specifically,
> barebox is having trouble syncing:
> 
>   http://list-archives.org/2014/02/07/barebox-lists-infradead-org/devicetree-maintenance-in-barebox/f/5820726136

< snip >

Sascha,

(Directing this to you, because the devicetree-maintenance-in-barebox thread
begins with an email from you.)

I have read through the referenced thread, but do not yet understand the cause
of the issues the barebox project is facing.  What I got from the thread is
that the barebox project maintains some devicetree changes in the project
repository, and it is difficult to manage these changes as the upstream
project (the Linux kernel) makes changes.

What are the barebox changes to dts files?

Why are the changes not submitted upstream?  (Or if they were submitted, why
were they not accepted?)

I'm not sure what else to ask to try to understand the issues for barebox.  Is
there anything else you can say to help me understand?

How would moving the devicetree files to another repository (also external to
the barebox project) resolve the issues for the barebox project?

Thanks,

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
