From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 3/3] travis: test meson build
Date: Wed, 21 Oct 2020 10:57:11 +0400
Message-ID: <CAMxuvay-7LtV71uAbGzEnCFhzG-sG+7yPoC93vhXPtJEPm9h1w@mail.gmail.com>
References: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
 <20201012073405.1682782-4-marcandre.lureau@redhat.com> <20201021035800.GE95552@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603263449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VzC61HebHHdms660x43m3danRx0Gt971OpUKDwbFk4k=;
        b=NfolwW9ZBgZYyyu/Nq5jR400P/1j19Zhq+uJYJKFUL6Dqvgv3pqMF1B/OWHHWt1LkDQ2AD
        xy2UJ3aZpHJkQJDbMZtjk1ImgBlHmcn/qZFAuF7rNPK7bzV3SRDYQx8v7Qbyita5TDoNis
        nOHS3aZvxAVZArS7Flgc6LDLRZDpviY=
In-Reply-To: <20201021035800.GE95552-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On Wed, Oct 21, 2020 at 7:58 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Oct 12, 2020 at 11:34:05AM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .travis.yml | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/.travis.yml b/.travis.yml
> > index a5163de..e2d74a4 100644
> > --- a/.travis.yml
> > +++ b/.travis.yml
> > @@ -6,6 +6,12 @@ env:
> >    # COVERITY_SCAN_TOKEN (dgibson/dtc)
> >    - secure: "vlHvXe618//IM9LQaKzqsrUbjs7ng0L9UCST4kJbJnFQDXvVe5JiSmJGd=
4ef7mm0NUv5bMRl2W3xCiu6BYAu/NvU3tMNHoLG+JgCJs0+wLJXbWOwji/NmH7olqgJG+CmpaCM=
XjARF6+nrTnBYHJL6cYyf4KVoV4B0I/hLUW91+s=3D"
> >
> > +before_install:
> > +  - '[ $TRAVIS_CPU_ARCH =3D amd64 ] && sudo add-apt-repository -y "deb=
 http://archive.ubuntu.com/ubuntu xenial-backports main universe" || sudo a=
dd-apt-repository -y "deb http://ports.ubuntu.com xenial-backports main uni=
verse"'
> > +  - sudo apt-get -q update
> > +  - sudo apt-get -t xenial-backports install -y python3 python3-setupt=
ools python3-pip ninja-build
> > +  - sudo pip3 install meson
> > +
> >  matrix:
> >    include:
> >      - addons:
> > @@ -25,12 +31,16 @@ matrix:
> >        script:
> >          - make
> >          - make check && make checkm
> > +        - meson build
> > +        - ninja -C build test
>
> I'd prefer that the meson builds be done as separate travis subjobs.
> That way we can be confident that both the legacy-make and meson
> builds work, without subtle requirements on having run the other one
> first.
>

Tbh, I don't know how to do that. Each .travis-ci file I look at is so
different, and testing them is a pain (push to git, check the
webpage..). Any idea?

> >
> >      # Check it builds properly without optional packages:
> >      #     python, valgrind, libyaml
> >      - script:
> >          - make
> >          - make check
> > +        - meson build
> > +        - ninja -C build test
> >
> >      - arch: arm64
> >        addons:
> > @@ -42,6 +52,8 @@ matrix:
> >        script:
> >          - make
> >          - make check checkm
> > +        - meson build
> > +        - ninja -C build test
> >
> >      - arch: ppc64le
> >        addons:
> > @@ -52,6 +64,8 @@ matrix:
> >        script:
> >          - make
> >          - make check
> > +        - meson build
> > +        - ninja -C build test
> >
> >      - arch: s390x
> >        addons:
> > @@ -63,3 +77,5 @@ matrix:
> >        script:
> >          - make
> >          - make check checkm
> > +        - meson build
> > +        - ninja -C build test
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _othe=
r_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson

