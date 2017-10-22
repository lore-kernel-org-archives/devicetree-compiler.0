From: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v2] implement strnlen for systems
 that need it
Date: Sun, 22 Oct 2017 13:06:12 -0600
Message-ID: <1508699172.7314.12.camel@freebsd.org>
References: <20171020175548.2566-1-programmingkidx@gmail.com>
         <f9bd98f1-d45c-6d3a-c35c-c67da67c881f@linaro.org>
         <20171022053315.GA15297@umbus>
         <82BA0070-FFBB-4868-AE48-D7A3671621C5@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82BA0070-FFBB-4868-AE48-D7A3671621C5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "list-l3A5Bk7waGM@public.gmane.org:PowerPC list:PowerPC" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org qemu-devel" <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

On Sun, 2017-10-22 at 10:41 -0400, Programmingkid wrote:
> >=20
> > On Oct 22, 2017, at 1:33 AM, David Gibson  wrote:
> >=20
> > On Fri, Oct 20, 2017 at 04:44:58PM -0700, Richard Henderson wrote:
> > >=20
> > > On 10/20/2017 10:55 AM, John Arbuckle wrote:
> > > >=20
> > > > +static inline size_t strnlen(const char *string, size_t max_count)
> > > > +{
> > > > +=A0=A0=A0=A0size_t count;
> > > > +=A0=A0=A0=A0for (count =3D 0; count < max_count; count++) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0if (string[count] =3D=3D '\0') {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0}
> > > > +=A0=A0=A0=A0}
> > > > +=A0=A0=A0=A0return count;
> > > Not to nitpick, but
> > >=20
> > > =A0const char *p =3D memchr(string, 0, max_count);
> > > =A0return p ? max_count : p - string;
> > Richard's right, that's definitely a better implementation.
> His implementation is smaller, but this one is even smaller. Plus it uses=
 the familiar strlen() function:
>=20
> size_t strnlen(const char *string, size_t max_count)
> {
> =A0=A0=A0=A0return strlen(string) < max_count ? strlen(string) : max_coun=
t;
> }

That is not a proper implementation of strnlen(), which is not supposed
to access any source-string bytes beyond max_count.

-- Ian
