From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 0/6] pylibfdt: Add installation support
Date: Wed, 29 Mar 2017 12:16:56 -0600
Message-ID: <CAPnjgZ2ytKVvSoKstJ-OrGpZdMniTOVz2uqDQt+Tu9KmmkVagA@mail.gmail.com>
References: <20170329181541.28856-1-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=aCglWtDETZiJlih/XRbUQxIiJz3mxZ/gz5Xf+ZutS/E=;
        b=kbfyhDlMQnn72vFlkw/wllhdm0dzIA+pSG3NHP703sCLEjhoHL4v7TXjvmdqf+ZjLs
         smCs+tffBjl2UeldKplwNcxUHKA4HKtt1pZ+IY1LeHcv9GCQJnhipsS/Og19tUmTc4Nr
         HAia1chv/TGygoTf+V1/einPDOJjUoH58owDdn5qLzXqCCcG/uWZ2U3DdtVghLZ26bCO
         Fc43c0an0w+zPRTsb85p0nRCjiDxlOAxDpOVbu5VJ9L6inEPEQkVBkgRApcpIYRLBgTT
         p4bHiCMMKVRRQaHyIYOfIqw9KK7GTcgQ2MtzJAHmTSa9iCLGFmn8ALWimCkaLvL9vxfS
         bEJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=aCglWtDETZiJlih/XRbUQxIiJz3mxZ/gz5Xf+ZutS/E=;
        b=Ort8AYqs3hN1uTN+3wA4eLVJGcaqfQ8RGvtoj8qjJRiaThZEnKki5NFGlkTqGfqe6h
         gDrOFY/fuZCs3+D+KUhDkba2Uz9m+scwAauJSa0w2TleR/UOeSOu58qqyAqgRRWGBQnm
         QMKoiC52FVfEi65Qz/GOro7zhk911UgzEVjhU=
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hi David,

On 29 March 2017 at 12:15, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> This series adds support for installation of the Pylib module. It adjusts
> the setup.py file to provide this functionality and the Makefile rules
> to call it correctly.
>
> It also adds a way to disable building the Python module. This is useful
> since some build systems want to use setup.py to do both the build and
> the install step. In this case the correct build commands would be:
>
>    make NO_PYTHON=1
>    make install_pylibfdt SETUP_PREFIX=/path/to/install_prefix
>
> Version 2 adds support for running setup.py stand-alone.
>
> Changes in v2:
> - Add a comment about the VERSION environment variable
> - Add new patch to rename libfdt.swig to libfdt.i
> - Add new patch to allow setup.py to operation stand-alone
> - Rebase to master
>
> Simon Glass (6):
>   pylibfdt: Allow building to be disabled
>   pylibfdt: Enable installation of Python module
>   pylibfdt: Use the correct libfdt version in the module
>   pylibfdt: Use the call function to simplify the Makefile
>   pylibfdt: Rename libfdt.swig to libfdt.i
>   pylibfdt: Allow setup.py to operation stand-alone
>
>  Makefile                           |  3 +-
>  README                             | 21 +++++++++
>  pylibfdt/Makefile.pylibfdt         | 21 +++++++--
>  pylibfdt/{libfdt.swig => libfdt.i} |  0
>  pylibfdt/setup.py                  | 97 ++++++++++++++++++++++++++++++++++++--
>  5 files changed, 133 insertions(+), 9 deletions(-)
>  rename pylibfdt/{libfdt.swig => libfdt.i} (100%)

Here's a newer version with an additional patch to support
installation bypassing the Makefile. I'll follow up if I have any
other ideas.

Regards,
Simon
