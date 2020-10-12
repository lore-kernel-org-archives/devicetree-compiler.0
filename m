From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/4] pylibfdt: allow build out of tree
Date: Mon, 12 Oct 2020 11:15:53 +0400
Message-ID: <CAMxuvaw7Uv2NQQFfz_JNtTpVJLXYaY-zr=fQ7ccq=9ypwfa+yQ@mail.gmail.com>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
 <20201006082712.241224-3-marcandre.lureau@redhat.com> <20201012054319.GF4787@yekko.fritz.box>
 <20201012054918.GA71119@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602486968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5UXpaq230n6rf/IubGyZ1urMTHDA0Rpg+g7zIXu4bs4=;
        b=GQxWDg8O/ftPvtm5QUMNyQpvCMI36/XotxXtQ3LAxRgjr/EKHA2tGoe/7/1tnFxuqpL72p
        49Zd0oL9IrKP6+0hvKFn/96940OgyUjLrqlhHf/9V79/z41Kbew1f3OS2pws3Wl6Woidoq
        4OTl8PaBnVBjLIjMkAuYCeJ75BkBtHA=
In-Reply-To: <20201012054918.GA71119-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi


On Mon, Oct 12, 2020 at 9:49 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Oct 12, 2020 at 04:43:19PM +1100, David Gibson wrote:
> > On Tue, Oct 06, 2020 at 12:27:10PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org w=
rote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > With meson, we have to support out-of-tree build.
> > >
> > > Introduce a --top-builddir option, which will default to the current
> > > directory to lookup generated filed such as version_gen.h and output
> > > directories.
> > >
> > > Other source paths are derived from the location of the setup.py scri=
pt
> > > in the source tree.
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > Applied, thanks.
>
> Wait... no... unapplied.  This somehow breaks the auto-detection &
> build of pylibfdt.  After applying on a clean tree:
>
>     $ make check
>     [...]
>     ********** TEST SUMMARY
>     *     Total testcases:      2033
>     *                PASS:      2033
>     *                FAIL:      0
>     *   Bad configuration:      0
>     * Strange test result:      0
>     **********
>
> That number doesn't include the pylibfdt tests (it should be 2070
> including them).  Plus, the extension module doesn't appear to have
> been built in the expected place:
>
> $ ls pylibfdt/
> libfdt.i  Makefile.pylibfdt  setup.py*
>
> Explicitly running "make pylibfdt" works around it, but I'd rather not
> have to.

Ah, this is where the first patch actually comes in then. I don't
understand what's going on yet, but it's a part of the puzzle..

Sorry

