From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] write_propval_string: Use a list of strings instead of
 "\0" in a string
Date: Mon, 1 May 2023 13:43:22 -0500
Message-ID: <CAL_JsqJ9QManUTkOpgaE85b-uVB_JQZGsLXdJCz7_5J_3Aqq2g@mail.gmail.com>
References: <20230428113217.744447-1-uwe@kleine-koenig.org> <ZEy5Xnh/DM/wzUWa@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682966614;
        bh=ECjayByaqJZdVaNnJUnABuQhj2b4Q9gPUPIuaIYVs/4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Iic1t9H0hHEcfReprLZNkKNvshowpVZAu/z6/xAGqMqxA/c7UlS9wh0xVS+ttVxNl
         RhVhb9jpTbBFts98yrbqlKy4GTyTfPfN+hBsdPWWoCHJHCkTkkzq72zY+jd8sHppV4
         b7qrR83cHwnNQPlCMo8deBx/uTlZN+azqXIz8djAO58xa8dNDFiwfd9znYMWWSI1Y8
         2d7O7gAF/11XsM0z/8Hh5j4P0Fxu9wC2MMdFEiU/yfH9hn/cGHdx50VetQXqAdKUsE
         tgAg5ZKd4d+aVQrUwek8yLFpKWticlQfsS3aFBORnuFgwh2PSf+85m+gb3M7u46Xfw
         7TA3xghUrO6Yw==
In-Reply-To: <ZEy5Xnh/DM/wzUWa@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

On Sat, Apr 29, 2023 at 1:52=E2=80=AFAM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Fri, Apr 28, 2023 at 01:32:17PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >
> > A string that contains '\0' can be written as a list of strings e.g.
> >
> >       clock-names =3D "di0_pll\0di1_pll\0di0_sel\0di1_sel\0di2_sel\0di3=
_sel\0di0\0di1";
> >
> > is equivalent to
> >
> >       clock-names =3D "di0_pll", "di1_pll", "di0_sel", "di1_sel", "di2_=
sel", "di3_sel", "di0", "di1";
> >
> > The latter is easier to read, to use this format instead.
> >
> > Two test files are adapted accordingly to keep the test suite happy.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > Changes since (implicit) v1, sent with Message-Id:
> > 20230426182405.572729-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org:
> >
> >  - Adapt the test suite
> >
> >  tests/type-preservation.dt.yaml | 2 +-
> >  tests/type-preservation.dts     | 2 +-
> >  treesource.c                    | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservation.=
dt.yaml
> > index a0cc64cc4b69..e238d395aa02 100644
> > --- a/tests/type-preservation.dt.yaml
> > +++ b/tests/type-preservation.dt.yaml
> > @@ -12,7 +12,7 @@
> >      int16-matrix: [!u16 [0x1234, 0x5678], [0x90ab, 0xcdef]]
> >      int64: [!u64 [0x200000000]]
> >      int64-array: [!u64 [0x100000000, 0x0]]
> > -    a-string-with-nulls: ["foo\0bar", "baz"]
> > +    a-string-array: ["foo", "bar", "baz"]
>
>
> Ah.  I was afraid of this.  So "fixing" the test highlights another
> problem.  It's pretty clear to me that the whole point of this test is
> to test the preservation of the internal \0, as distinct from the
> separate strings later in there.  So, this is exercising an edge case
> of the typing markers we now add.
>
> Now.. personally, I've never been particularly convinced that the type
> preservation stuff was a particularly good idea.  It will never be
> perfect, and it can give a misleading impression that information is
> preserved into the dtb which isn't.  But, it's pretty well established
> now, and I assume people had reasons for wanting it.

I don't really think so. It was a side effect of adding the yaml
support AFAICT. Before commit 32b9c6130762 ("Preserve datatype markers
when emitting dts format"), any '\0' was not maintained.

Speaking of the YAML output, at least for dtschema, it is no longer
being used with using dtb format directly for over a year now. Support
for yaml encoding in dtschema was removed completely in the January
release. Perhaps in dtc it should be deprecated for some time if not
just outright removed. I'm not aware of anyone else using it.

Rob
