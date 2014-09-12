From: Jay Bhukhanwala <jaybhukhanwala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: status property value
Date: Thu, 11 Sep 2014 23:25:10 -0700
Message-ID: <CAB8QsTAtWeQTc3p=G1aDCQtsBbydfX6_frr2K3PcOgo0aNaibA@mail.gmail.com>
References: <CAB8QsTACKQOttReMoAzCYdHN_o1BHD09ViJpTXh5zJUcJh0tdg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=qHR9ZVF2iBtu8s2OkWqf3MnthRrIYAVVfXj8/YlvjMQ=;
        b=TWus41Jnq/BCmkPPaekZKqBlTXgtkv8BSbjhf6VUrBQwNAEVrORy43wxBxDM0ARijG
         sLMjlHyCfI7Vj74zNK9oRRquH/ft6HuAKqruDVFrrcKu+JyoummL6+012bQ1yjAT8S0/
         lyyEzFuZ42FwkRZTSpsyg8EQS8i+ezp0bTIOuJFqrX0rpKGpI3wWMvYkpPVvB0j+lRN8
         twg2JtGUyRCQJPkgB9Sm6jTJ2+rzRNHEp7kWEmbzuxMr9ZMU0us8oubRRQkHMRcovv3T
         qDhBr1sgXvOopfu7PFv0p3vDKxSGEjZqdjW0Q2Y0A/b3HHMPKt2TjS+O+6Yqupvs278q
         XLHw==
In-Reply-To: <CAB8QsTACKQOttReMoAzCYdHN_o1BHD09ViJpTXh5zJUcJh0tdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Okay, I looked around in the kernel code a bit, and realize that only
is the status property is "okay" or "ok" will of_device_is_available
return true.
In any case, I dont think policy emails merit a place on this mailing
list. Sorry for the noise.

On Thu, Sep 11, 2014 at 10:11 PM, Jay Bhukhanwala
<jaybhukhanwala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Can we change the convention of the status property too ?
> I mean, since "okay" and "disabled" are different in length, making a
> node available (as kernel API calls it), or not available, changes the
> blob structure.
>
> Maybe status = "gone" would do it ?
>
> Then, we can change that property *inplace*.
>
> Thanks,
> Jay.
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
