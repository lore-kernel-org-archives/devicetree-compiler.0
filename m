From: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: Fix install location of libfdt.py
Date: Wed, 8 Nov 2017 11:42:56 +0200
Message-ID: <1510134176.18978.12.camel@tuxera.com>
References: <20171107141741.1733-1-tuomas@tuxera.com>
         <20171108025946.GA7732@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171108025946.GA7732-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On Wed, 2017-11-08 at 13:59 +1100, David Gibson wrote:
> On Tue, Nov 07, 2017 at 04:17:41PM +0200, Tuomas Tynkkynen wrote:
> > Currently 'make install' produces a directory tree like this
> > for the Python module:
> > 
> > $PREFIX
> > `-- lib
> >     `-- python2.7
> >         `-- site-packages
> >             |-- _libfdt.so
> >             |-- libfdt-1.4.5-py2.7.egg-info
> >             `-- pylibfdt
> >                 |-- libfdt.py
> >                 `-- libfdt.pyc
> > 
> > That is, libfdt.py is installed in an unexpected subdirectory
> > pylibfdt
> > so 'import libfdt' fails. Fix this by properly pointing package_dir
> > to
> > the root of the Python sources, producing the correct directory
> > tree:
> > 
> > $PREFIX
> > `-- lib
> >     `-- python2.7
> >         `-- site-packages
> >             |-- _libfdt.so
> >             |-- libfdt-1.4.5-py2.7.egg-info
> >             |-- libfdt.py
> >             `-- libfdt.pyc
> 
> This doesn't seem like the right fix.  Shouldn't all the files go
> into
> the pylibfdt subdirectory, rather than removing that subdirectory.
> 

AFAIK you can't add that subdirectory there without breaking 'import
libfdt' because the directory structure must match the module
structure.

I think it might be possible to achieve this though:

$PREFIX
`-- lib
    `-- python2.7
        `-- site-packages
            |-- libfdt-1.4.5-py2.7.egg-info
            `-- libfdt
                |-- _libfdt.so
                |-- __init__.py
                `-- __init__.pyc

... but I'm not sure that's idiomatic either because now the name of
the native module changes from '_libfdt' to 'libfdt._libfdt'. There are
already existing similar (as in one .py + one .so) packages with the
same directory structure as what I'm trying to achieve:

https://packages.debian.org/sid/amd64/python-gamin/filelist
