From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: pylibfdt breakage
Date: Thu, 2 Feb 2023 09:00:05 -0600
Message-ID: <CAL_Jsq+5ZrjQ5zVjjdmprW1+8nyTewXMb+0R+iyPG3J4xjkKPA@mail.gmail.com>
References: <Y0+wvwJX9Cj3qj1q@yekko> <CAL_Jsq+Lmkw51EAtBb62ET4xzChmTf6MGVq=pBjRoYY6Z+vQ6g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675350017;
        bh=6slTEJsBYQy1CzPkrYFsm4C/H8PsMv8B1ikjRPhzwJY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LxUQi9cq/rY9h+mwEte+Lgt3oFZyD8Tgd4LK1T0AhqUcsnO7M+dDUtRG0NfeUIi8o
         Xgrib5UIVCNLoVFdHtjmpV4OkeiOpLEAmFlralEbdFbQOgIMheZmOPeuj2Kgh8+tAK
         buY3OlAZP8HfLDGw2kRSqp4SjnNUwLiBRkyi+3p5F9OExrtFZ/UQigElou5tGcvaU/
         0Kr82E7h1uvvIYONNA1Y5sO8oDixfkZJjruPkg/a2yTjQFemRTGD7IzTtUjsrygvuG
         5M+iNvkbHkMJ4qC3Kk0A3R0Gl2xVg8IwA8v/RnAdMvhGWpmGRkOucsnSAqhmjXNCro
         L44836oslA1aA==
In-Reply-To: <CAL_Jsq+Lmkw51EAtBb62ET4xzChmTf6MGVq=pBjRoYY6Z+vQ6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Feb 2, 2023 at 8:15 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Wed, Oct 19, 2022 at 3:09 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > Hi Simon,
> >
> > I probably should have contacted you sooner about this.  For some
> > time, I've been unable to compile and test the pylibfdt components on
> > my system (Fedora 36).  I get this error:
> >
> > $ make
> >         CHK version_gen.h
> > make[1]: Entering directory '/home/dwg/src/dtc'
> >         CHK version_gen.h
> >          PYMOD pylibfdt/_libfdt.so
> > /usr/lib/python3.10/site-packages/setuptools/installer.py:27: SetuptoolsDeprecationWarning: setuptools.installer is deprecated. Requirements should be satisfied by a PEP 517 installer.
> >   warnings.warn(
> > /home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/version.py:84: UserWarning: tag 'path-ref-fixup-staging' no version found
>
> I think the problem is you have a git tag 'path-ref-fixup-staging'
> which doesn't match any version pattern (e.g. v1.0.0). The default
> pattern is:
>
> DEFAULT_TAG_REGEX =
> r"^(?:[\w-]+-)?(?P<version>[vV]?\d+(?:\.\d+){0,2}[^\+]*)(?:\+.*)?$"
>
> https://github.com/pypa/setuptools_scm/blob/main/src/setuptools_scm/config.py#L28

I tried adding non-version tags and still don't reproduce this.

What does this give you: python setup.py --version

Can you run the build with "SETUPTOOLS_SCM_DEBUG=1".

Rob
