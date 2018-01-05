From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Fri, 5 Jan 2018 14:53:17 +1100
Message-ID: <20180105035317.GJ24581@umbus.fritz.box>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
 <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <1515103688.1759.29.camel@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hMSfLvDvQX5ATYp5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515124743;
        bh=Ahw8MJzsCUH2Y874R9WrP5IxnJ65Ovjwbkht0WDbFuA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gqsGKBSOYB7lFUiuCc6vLvP+tiM5pSnhPbE6q7hKM9B3cEhLe3IpOmzUcaZtptJZE
         Hkiz1mhdZeElVR+fwRwqD9Fv5ZDHxNtuF+cYwuSOWfl3R60XNGSOn8S/77Bojzp1rC
         D3m51ei9ygGx49X4O90BVY7sylWAQxhmMYVhLAoU=
Content-Disposition: inline
In-Reply-To: <1515103688.1759.29.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hMSfLvDvQX5ATYp5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 03:08:08PM -0700, Ian Lepore wrote:
> On Thu, 2018-01-04 at 15:47 -0600, Kyle Evans wrote:
> > On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> > >=20
> > > On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> > > >=20
> > > > On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand  wrote:
> > > > >=20
> > > > > [... snip ...]
> > > > >=20
> > > > > Does this remove the need for the proposed patch, or am I still
> > > > > missing something?
> > > > ... nope. Apparently I never tested this with this particular dtc(1)
> > > > and instead just assumed it did the same as ours- allocate phandle
> > > > sparsely, even with -@. That certainly removes the need for this
> > > > patch, and I'm somewhat upset that I hadn't previously considered
> > > > this.
> > > >=20
> > > > @David, Jon: Please disregard all of the patches along these lines.=
=2E.
> > > > I'll fix this in our dtc, where it should be fixed.
> > > >=20
> > > > Thanks, Frank!
> > > Actually, I'm kind of torn on whether this is useful or not. With
> > > being able to have EFI-provided FDT, it's hard to guarantee whether
> > > the FDT we're provided has been compiled with GPL dtc(1) and -@. The
> > > above solves this problem for most of my personal use-cases , though,
> > > since I can guarantee that our FDT and U-Boot provided FDT is compiled
> > > properly.
> > Apologies for the triple post; I realized that this argument is
> > inherently wrong, since we can't reference the node if there's no
> > symbol anyways.
> >=20
> > The only way this might still be a good idea is to support more
> > minimal cases where an implementation might prefer to not create a
> > phandle for nodes that haven't been referenced.
> >=20
> > In our case, we have a function [1] that walks the tree and generates
> > metadata on nodes that have phandles, under the assumption that these
> > have been referenced somewhere and provides a way to more quickly
> > reference these specifically through a separate linked link.
> > Allocating phandles for everything as GPL dtc does adds quite a bit
> > more overhead to this.
> >=20
> > [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfir=
m.c#119
>=20
> In particular, it makes lookups more expensive as it now must traverse
> a list that includes every node in the dtb, rather than just nodes that
> are actually referenced. =A0(It also increases the amount of storage, but
> at 20-ish bytes per node, that's not a big deal.)

Lookups of what exactly?  Aren't you unflattening the tree after you
read it in?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hMSfLvDvQX5ATYp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpO9q0ACgkQbDjKyiDZ
s5LfKBAAxvYVRXqzsMtlDft8kdnYfd7Tt566H9D3/3uTfLVXVrORogyZBMtX7zwI
v65ygEuOet/4d24SGTRpgeLoDp07r+q7maL2SMBMbdbYlvG15ndzhgzhADNct5du
0kRPXfL9eRYICMOOc9yIcQuC3zsAR1aZKYnLXEyk7QbTCl04jniUnHkPLyZcd8+3
TPaUlycE1i/YH8APk3HdRErdVnrpQdh1Ywv1Ru6P58kJp3G86nWiWRzDbgxDdYiY
3x5KpFvOJsN8/lw7TwyrLyxmYDhUJbSV7Z3ISZ9ujDi6Df43KWEwymI0joLMV5mK
wjlU4xC/48RlGVApqaPjM1pA++nr1H6QnABuYA0/wqezauDSD6fBg+1PlY9hb4rQ
3PNKcxf9URR+aE+Kz84/6aG6gpDiOMFpe6etTYNl/paDkje26BXPwGDYaRFCEGnz
GSv7aIsbLwQ3oYo2MgAPeA9iApkEnNrRmCvHEgPZe9jT0RS2SjmG8zZRKrZXDXRb
yt0MV7nxYE3COtjCXueT1ixcWLG7j0ejpcODUEfxdGyA161gJiLts/0C3ykttsnR
aupeYvswQtHwc3tPxGKw9EfMnlav6NrFw8ZPVIlOrKX3cUA2a0jG94zSb1UF+3Sf
ahLVgbJ4sp6jG9OwN5tzRvBqC0FcuNPpfqBlI48RJPA8n8XSHBg=
=CE3y
-----END PGP SIGNATURE-----

--hMSfLvDvQX5ATYp5--
