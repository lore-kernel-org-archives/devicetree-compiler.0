From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: pylibfdt breakage
Date: Thu, 2 Feb 2023 08:15:15 -0600
Message-ID: <CAL_Jsq+Lmkw51EAtBb62ET4xzChmTf6MGVq=pBjRoYY6Z+vQ6g@mail.gmail.com>
References: <Y0+wvwJX9Cj3qj1q@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675347330;
        bh=uAzzwP07aci/YzVndW4PoS7rlMmB0C5D/8CBqK/7ZEE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ePOuabj/cvmln3AmImAKyNXJqylNK2ZmpnqeWUbXF2nHXeTT9bgjfwIsGZP0xnTbM
         Iac7m8Ag8vgtWfaRX3HRSvRLACA3F9DDQXh1dP91+05xnqvSlvuTqwsXZxS3VHFLMB
         xnY+Tgg17jiPQn1XorZLawtcIniFa8s+zWXcsmktgS5RFQlSg3LgutB4CUW+QOkWDX
         hqZ/GPzkM3Ngtgu7hc0B87sttyb8pb3y7YqGaxe2kb1mT2EA+H2nQyxiyDdlVow+/+
         /1bciTmHEy1vCoVj3gGCg5fVE1HtLaUrDVFXzkWS2aWlVHPOo+HCTZmTpDTP3f+MeQ
         VbCsO8zYCUy+A==
In-Reply-To: <Y0+wvwJX9Cj3qj1q@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Oct 19, 2022 at 3:09 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> Hi Simon,
>
> I probably should have contacted you sooner about this.  For some
> time, I've been unable to compile and test the pylibfdt components on
> my system (Fedora 36).  I get this error:
>
> $ make
>         CHK version_gen.h
> make[1]: Entering directory '/home/dwg/src/dtc'
>         CHK version_gen.h
>          PYMOD pylibfdt/_libfdt.so
> /usr/lib/python3.10/site-packages/setuptools/installer.py:27: SetuptoolsDeprecationWarning: setuptools.installer is deprecated. Requirements should be satisfied by a PEP 517 installer.
>   warnings.warn(
> /home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/version.py:84: UserWarning: tag 'path-ref-fixup-staging' no version found

I think the problem is you have a git tag 'path-ref-fixup-staging'
which doesn't match any version pattern (e.g. v1.0.0). The default
pattern is:

DEFAULT_TAG_REGEX =
r"^(?:[\w-]+-)?(?P<version>[vV]?\d+(?:\.\d+){0,2}[^\+]*)(?:\+.*)?$"

https://github.com/pypa/setuptools_scm/blob/main/src/setuptools_scm/config.py#L28

Rob
