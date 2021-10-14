From: Richard Purdie <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Thu, 14 Oct 2021 23:00:54 +0100
Message-ID: <e1b3411698cd27341a477150bbef2185ec00bdf9.camel@linuxfoundation.org>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
         <20200820102734.GR271315@yekko.fritz.box>
         <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com>
         <YL7vh7JkjymjKsQD@yekko>
         <3f28c86d-064d-ec68-e8de-f1dcd38c08ca@fastree3d.com>
         <f6ac309b-c3af-583e-1bce-e869fa129b3f@fastree3d.com>
         <CAL_JsqK52nM1LwjBYJ+iEWYEipimaJ=8vA-Nw5SSJ7x+OAxGXg@mail.gmail.com>
         <c28927c6-4fd1-f047-7c04-d54af609e699@fastree3d.com>
         <CAL_Jsq+q-vNyUok3O7To0KCSG=hcGzHnf4k7tTr=0J3VFUSVjg@mail.gmail.com>
         <84be5fc0-0199-aec5-e739-610ba6cf0409@fastree3d.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5BdeNI9fI/oVAD8ZHg3e4VPx+sdMbk5HZrzS71i1EAw=;
        b=E6BnFUAjy/k7hiVu4wDveWn/Uv4c8Mfy1ARZWsJdmY2EMotz5oDzYj9IQw+Oeicttk
         pk40BcFq1XG4NjB5qen/XYbkgGlCW1+TgkQ9/GS6RUBRgk8/8iCmLgV7LHPuJHKeX01W
         LKusZ6/HTXx0hmXR3d1QVCJsOaHyOy0Iz+1D0=
In-Reply-To: <84be5fc0-0199-aec5-e739-610ba6cf0409-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, wenzong.fan-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, 2021-10-14 at 11:39 +0200, Adrian Fiergolski wrote:
>=20
> On 12.10.2021=C2=A018:50, Rob Herring wrote:
> > On Tue, Oct 12, 2021 at 9:47 AM Adrian Fiergolski
> > <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
> > > On 12.10.2021 15:38, Rob Herring wrote:
> > > > On Tue, Oct 12, 2021 at 8:16 AM Adrian Fiergolski
> > > > <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org> wrote:
> > > > > Hi David,
> > > > >=20
> > > > > I am being hit by this problem again. This time on Ubuntu 20.04 L=
TS with
> > > > > gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04), yocto (hardknot=
t) and
> > > > > kernel v5.10.
> > > > >=20
> > > > > As it's standard kernel built, I am using scripts/Makefile.lib fr=
om
> > > > > kernel sources. This line [1] causes the problem. As you indicate=
d, it
> > > > > calls the preprocessor and afterwards dtc.
> > > > How is '-g3' getting introduced here? You are externally overriding
> > > > HOSTCC with 'gcc -g3' or something like that?
> > > Yes, that's the way yocto introduces kernel build flags [1].
> > HOSTCC is supposed to be set to just the compiler. HOSTCFLAGS and
> > others should be used to set the flags.
> >=20
> > Rob
> >=20
> > > [1]
> > > https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/ker=
nel.bbclass#n229
> > >=20
> > > Adrian
> > >=20
>=20
> I let myself add to this thread Wenzong, author of the change in the
> yocto class using HOSTCC, and Ross and Richard who signed off the change.
>=20
> Wenzong, Ross and Richard, there is a problem in the way you use HOSTCC,
> once one adds '-g3' debug flag and DTS compiler. All the details
> regarding the problem can be found in the archives [1].
>=20
>=20
> [1] https://www.spinics.net/lists/devicetree-compiler/index.html#03281

This isn't my area of expertise but I took a look and discussed it with our
kernel people and we agree this doesn't look right. I've queued a change for
testing which makes this look like:

EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}" HO=
ST_LDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}""
EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXXFLA=
GS}""
=20
which I think is what you're asking for. Whether this breaks things, we'll =
see.

Cheers,

Richard


