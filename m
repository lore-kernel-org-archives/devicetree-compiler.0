From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: pylibfdt breakage
Date: Sat, 29 Oct 2022 19:44:04 -0600
Message-ID: <CAPnjgZ1SfQaBSmn-P6aGTNh0B1R2R4CbRXsRS9H4sF3VW4D=kQ@mail.gmail.com>
References: <Y0+wvwJX9Cj3qj1q@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ugcJ7apBpqCAz12kBCQB04k7mNyZ87DxiKTO/FjWdV4=;
        b=YEx5ORLJAqnsp1DgoygN6VeA5c69wVPW0jZ1K5yt0fZYLMAuq0qIyy6GzUNq32szIH
         mPmZHDEY8Fmy+jkUv4BXyNuHQnHQyyLRwBz9cNUfjMi+bdW+dLNQEoM2xieri4Ho22Zw
         XWzyumhFLq7MstBHs7H3h+uuUPgydRove9rnA=
In-Reply-To: <Y0+wvwJX9Cj3qj1q@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

 Hi David,

On Wed, 19 Oct 2022 at 02:09, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
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
>   warnings.warn(f"tag {tag!r} no version found")
> Traceback (most recent call last):
>   File "/home/dwg/src/dtc/./setup.py", line 50, in <module>
>     setup(
>   File "/usr/lib/python3.10/site-packages/setuptools/__init__.py", line 153, in setup
>     return distutils.core.setup(**attrs)
>   File "/usr/lib64/python3.10/distutils/core.py", line 108, in setup
>     _setup_distribution = dist = klass(attrs)
>   File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 459, in __init__
>     _Distribution.__init__(
>   File "/usr/lib64/python3.10/distutils/dist.py", line 292, in __init__
>     self.finalize_options()
>   File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 837, in finalize_options
>     ep(self)
>   File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 858, in _finalize_setup_keywords
>     ep.load()(self, ep.name, value)
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/integration.py", line 90, in version_keyword
>     _assign_version(dist, config)
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/integration.py", line 59, in _assign_version
>     maybe_version = _get_version(config)
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/__init__.py", line 154, in _get_version
>     parsed_version = _do_parse(config)
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/__init__.py", line 101, in _do_parse
>     version = _version_from_entrypoints(config) or _version_from_entrypoints(
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/_entrypoints.py", line 66, in _version_from_entrypoints
>     version: ScmVersion | None = _call_entrypoint_fn(root, config, ep.load())
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/_entrypoints.py", line 40, in _call_entrypoint_fn
>     return fn(root, config=config)
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/git.py", line 181, in parse
>     return _git_parse_inner(
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/git.py", line 224, in _git_parse_inner
>     return meta(
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/version.py", line 226, in meta
>     parsed_version = _parse_tag(tag, preformatted, config)
>   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/version.py", line 203, in _parse_tag
>     assert version is not None
> AssertionError
> make[1]: *** [pylibfdt/Makefile.pylibfdt:20: pylibfdt/_libfdt.so] Error 1
> make[1]: Leaving directory '/home/dwg/src/dtc'
> make: *** [Makefile:172: maybe_pylibfdt] Error 2
>
> Seems like the packaging stuff needs work, but it's not obvious to me
> exactly what needs to be done.  Is this something you can address?

I am not sure what is going on but perhaps we could drop
setuptools_scm? I'm assuming it is for getting the version, but we
have that in Makefile, so could perhaps parse it?

I actually have the same version of setuptools_scm here

python3-setuptools-scm (7.0.5-1)

but I cannot see the error. I found this:

https://github.com/pypa/setuptools_scm

For me:

sjg@sjg1:~/c/dtc$ pe
55778a0 (HEAD, us/master, us/main) libfdt: tests: add
get_next_tag_invalid_prop_len
7359034 libfdt: prevent integer overflow in fdt_next_tag
035fb90 libfdt: add fdt_get_property_by_offset_w helper
98a0700 Makefile: fix infinite recursion by dropping non-existent `%.output`

$ python setup.py --version
1.6.2.dev63+g55778a0

Regards,
Simon
