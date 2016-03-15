From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt: Try to read #address-cells/size-cells from parent
Date: Tue, 15 Mar 2016 11:27:43 +1100
Message-ID: <20160315002743.GC15272@voom.fritz.box>
References: <5b7c7b1b2f6a81b2f97f1496558b9d03a59d0288.1455105881.git.michal.simek@xilinx.com>
 <56C1A148.70905@xilinx.com>
 <CAPnjgZ3kv2gdzmktbqBApnxnH_pm3ZmXcZCgd2dpE8VhxbZ-hg@mail.gmail.com>
 <56C349E8.9030808@xilinx.com>
 <CAPnjgZ2ZWhdcQgdefoH9rzvHDLBo58i6-pnJnn2NEzpPMbMRrQ@mail.gmail.com>
 <56E728E2.5050905@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1458002315;
	bh=WVpW0FCSsDJ7+I1W/61ZCN5os6sJ8YNBioBqdrW9H1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O4KhsB93Csd66BEwaBcuYkv9foRMb8M43VWXfF0GHrBlHGqg8PZXCukAdmdGkJRyb
	 oG6M2G4bh3lx0iJ+eyEzuiK2aafW/2AM7dNPjk/b2KufLWoRL7bWio91thLDcpEnEo
	 yiUMMYVVHE3x3VCkKeCGRWWDQu/aBP6VA9TDmS7k=
Content-Disposition: inline
In-Reply-To: <56E728E2.5050905-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 10:10:58PM +0100, Michal Simek wrote:
> On 13.3.2016 02:54, Simon Glass wrote:
> > Hi Michal,
> >=20
> > On 16 February 2016 at 09:10, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wr=
ote:
> >> Hi Simon,
> >>
> >> On 16.2.2016 17:00, Simon Glass wrote:
> >>> Hi Michal,
> >>>
> >>> On 15 February 2016 at 02:58, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> =
wrote:
> >>>> Hi Simon,
> >>>>
> >>>> On 10.2.2016 13:04, Michal Simek wrote:
> >>>>> Read #address-cells and #size-cells from parent if they are not pre=
sent in
> >>>>> current node.
> >>>>>
> >>>>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >>>>> ---
> >>>>>
> >>>>> I have code which read information about memory for zynqmp but memo=
ry
> >>>>> node most of the time doesn't contain #address/size-cells which are
> >>>>> present in parent node.
> >>>>> That's why let's try to read it from parent.
> >>>>>
> >>>>> Also I think that we shouldn't return 2 if property is not found be=
cause
> >>>>> it has side effect on 32bit systems with #address/size-cells =3D <1=
>;
> >>>>>
> >>>>> ---
> >>>>>  lib/libfdt/fdt_addresses.c | 18 ++++++++++++++----
> >>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/lib/libfdt/fdt_addresses.c b/lib/libfdt/fdt_addresses.c
> >>>>> index 76054d98e5fd..b164d0988079 100644
> >>>>> --- a/lib/libfdt/fdt_addresses.c
> >>>>> +++ b/lib/libfdt/fdt_addresses.c
> >>>>> @@ -19,10 +19,15 @@ int fdt_address_cells(const void *fdt, int node=
offset)
> >>>>>       const fdt32_t *ac;
> >>>>>       int val;
> >>>>>       int len;
> >>>>> +     int parent;
> >>>>>
> >>>>>       ac =3D fdt_getprop(fdt, nodeoffset, "#address-cells", &len);
> >>>>> -     if (!ac)
> >>>>> -             return 2;
> >>>>> +     if (!ac) {
> >>>>> +             parent =3D fdt_parent_offset(fdt, nodeoffset);
> >>>>> +             ac =3D fdt_getprop(fdt, parent, "#address-cells", &le=
n);
> >>>>> +             if (!ac)
> >>>>> +                     return 2;
> >>>>> +     }
> >>>>>
> >>>>>       if (len !=3D sizeof(*ac))
> >>>>>               return -FDT_ERR_BADNCELLS;
> >>>>> @@ -39,10 +44,15 @@ int fdt_size_cells(const void *fdt, int nodeoff=
set)
> >>>>>       const fdt32_t *sc;
> >>>>>       int val;
> >>>>>       int len;
> >>>>> +     int parent;
> >>>>>
> >>>>>       sc =3D fdt_getprop(fdt, nodeoffset, "#size-cells", &len);
> >>>>> -     if (!sc)
> >>>>> -             return 2;
> >>>>> +     if (!sc) {
> >>>>> +             parent =3D fdt_parent_offset(fdt, nodeoffset);
> >>>>> +             sc =3D fdt_getprop(fdt, parent, "#size-cells", &len);
> >>>>> +             if (!sc)
> >>>>> +                     return 2;
> >>>>> +     }
> >>>>>
> >>>>>       if (len !=3D sizeof(*sc))
> >>>>>               return -FDT_ERR_BADNCELLS;
> >>>>>
> >>>>
> >>>> Simon: Any comment?
> >>>
> >>> It seems risky to change the behaviour here. Also fdt_parent_offset()=
 is slow.
> >>>
> >>> Can you point me to the binding / example DT that you are trying to p=
arse?
> >>
> >> Look at dram_init(), etc.
> >> https://github.com/Xilinx/u-boot-xlnx/blob/master/board/xilinx/zynqmp/=
zynqmp.c
> >>
> >> fdt_get_reg() is calling fdt_size_cells()
> >>
> >>
> >> And this is DTS fragment.
> >>         #address-cells =3D <2>;
> >>         #size-cells =3D <1>;
> >>
> >>         memory {
> >>                 device_type =3D "memory";
> >>                 reg =3D <0x0 0x0 0x80000000>, <0x8 0x00000000 0x800000=
00>;
> >>         };
> >>
> >> Code is in memory node I need to work with and asking for size-cells.
> >> Current code returns 2 instead of error and the rest of code just works
> >> with size =3D 2 which is incorrect for this setup.
> >>
> >> I have already changed size-cells =3D 2 in our repo because I need to
> >> support for more than 4GB memory anyway but this should point to the
> >> problem in that generic functions.
> >=20
> > I think this should go in a higher-level function. I very much doubt
> > that this patch would be accepted upstream.
> >=20
> > Can you find the caller and make it call this function again (for the
> > parent) when no nothing is found on the first call? Hopefully this
> > caller will have access to the parent node and will not need to call
> > fdt_parent_offset().
>=20
> The funny part is that nothing is found means return 2. If this returns
> something <0 then there is not a problem to try it with parents.

I don't have the full context of this thread, so it's a bit hard to be
sure, but this doesn't look right from what I can see.  Two things to
remember here:

  * #address-cells and #size-cells describe the format of addresses
    for children of this node, not this node itself.  So if you're
    looking to parse 'reg' for this node, you *always* need to look at
    the parent, not just as a fallback.

  * #address-cells and #size-cells are *not* inherited.  If they're
    missing in a node, then the format for its children's addresses is
    2 cell addresses and 2 cell sizes, it is *not* correct to look at
    the next parent up for these properties.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW51b/AAoJEGw4ysog2bOSHWIP/i/MSgNCsHxYiC6jB/sTozhU
fK6pcQmSqK3ntguY9s5+LxdbFrzcFPUXNjUq0qgkBA02CGBMIHk9RzQpkmRWk7fU
wwEsbJsxX0PSNKNf2+WBZPVMnifvRwxz1Dx6mqkuyureBqtPLNE3jrfxq5JS5WY0
Tb8vBE0tlNZg0K2AaSVSpp9JyZFaaF+PEvv8ysx8CQUqfqEV48YWiN0PjwNdq7QV
M4OmDeLcJ2BeHW42bMs58lot0nVH9pUx8/w3RIYA3KnXPJi4hFIQkfI8epuw4Wog
A33wDeuLjlQ9T3cCXYlKJ9jvKhpqrhJSNpkGsbiyaqQtDibhST3hOjMeo/RA5Q85
TiZ3VqLK5/kjxaARAQ+yM4kIA5RteUYyn6x7Stv1q+/j/WX+sOEOIzLJwbXI430U
jeeIlk2Qdx024YXLQAjSQNt1QyfJ6Jlrxw1/4cId/Ly/fUD7Ay5XLFQNLg3pLvwQ
NzyIOmeFg5RsYLY7UOilQw2msLGT9EHmaM0V71NgnxgXvtLC8xS0AFcfOajApUOJ
gRs1kkArwhGmWcyDR2f7yIx43KwEnNF7Jx1L8AUWtd46FqAyouBQ8Y/UT31Qd+Ab
8sfU9S79Gb80z37X+sia7hC9buXIMaS4AIV3oJJZSBvq9/ObqekS4O+jy3Zf1+ud
Fid3mzpcIIKW5HSUQuja
=CH31
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
