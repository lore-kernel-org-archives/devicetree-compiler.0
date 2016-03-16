From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt: Try to read #address-cells/size-cells from parent
Date: Thu, 17 Mar 2016 09:47:27 +1100
Message-ID: <20160316224727.GJ9032@voom>
References: <5b7c7b1b2f6a81b2f97f1496558b9d03a59d0288.1455105881.git.michal.simek@xilinx.com>
 <56C1A148.70905@xilinx.com>
 <CAPnjgZ3kv2gdzmktbqBApnxnH_pm3ZmXcZCgd2dpE8VhxbZ-hg@mail.gmail.com>
 <56C349E8.9030808@xilinx.com>
 <CAPnjgZ2ZWhdcQgdefoH9rzvHDLBo58i6-pnJnn2NEzpPMbMRrQ@mail.gmail.com>
 <56E728E2.5050905@xilinx.com>
 <20160315002743.GC15272@voom.fritz.box>
 <56E98751.4060007@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8BaRf9C5c8wiXWYy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1458168724;
	bh=0XUoZDqoJzS3dM78M+ZhawFxFn60IFN/D2g++V5uNC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8sqIMburWlDBpc+UlDJyCpRb0cYpWhk/vJE5kQda65O1jnKkt6mpvzdWDw04VC/x
	 JNwk2XjYD3/PK56XuNvFBFsYBQv2yChAAgfuNxwukAWDnTesbLyljHM6MDJM6xyQjq
	 rMi/ipRDukSzz+K8iKX+Cqfer8UGa1laMVozL1wQ=
Content-Disposition: inline
In-Reply-To: <56E98751.4060007-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--8BaRf9C5c8wiXWYy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2016 at 05:18:25PM +0100, Michal Simek wrote:
> Hi David,
>=20
> On 15.3.2016 01:27, David Gibson wrote:
> > On Mon, Mar 14, 2016 at 10:10:58PM +0100, Michal Simek wrote:
> >> On 13.3.2016 02:54, Simon Glass wrote:
> >>> Hi Michal,
> >>>
> >>> On 16 February 2016 at 09:10, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> =
wrote:
> >>>> Hi Simon,
> >>>>
> >>>> On 16.2.2016 17:00, Simon Glass wrote:
> >>>>> Hi Michal,
> >>>>>
> >>>>> On 15 February 2016 at 02:58, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org=
> wrote:
> >>>>>> Hi Simon,
> >>>>>>
> >>>>>> On 10.2.2016 13:04, Michal Simek wrote:
> >>>>>>> Read #address-cells and #size-cells from parent if they are not p=
resent in
> >>>>>>> current node.
> >>>>>>>
> >>>>>>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >>>>>>> ---
> >>>>>>>
> >>>>>>> I have code which read information about memory for zynqmp but me=
mory
> >>>>>>> node most of the time doesn't contain #address/size-cells which a=
re
> >>>>>>> present in parent node.
> >>>>>>> That's why let's try to read it from parent.
> >>>>>>>
> >>>>>>> Also I think that we shouldn't return 2 if property is not found =
because
> >>>>>>> it has side effect on 32bit systems with #address/size-cells =3D =
<1>;
> >>>>>>>
> >>>>>>> ---
> >>>>>>>  lib/libfdt/fdt_addresses.c | 18 ++++++++++++++----
> >>>>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/lib/libfdt/fdt_addresses.c b/lib/libfdt/fdt_addresse=
s.c
> >>>>>>> index 76054d98e5fd..b164d0988079 100644
> >>>>>>> --- a/lib/libfdt/fdt_addresses.c
> >>>>>>> +++ b/lib/libfdt/fdt_addresses.c
> >>>>>>> @@ -19,10 +19,15 @@ int fdt_address_cells(const void *fdt, int no=
deoffset)
> >>>>>>>       const fdt32_t *ac;
> >>>>>>>       int val;
> >>>>>>>       int len;
> >>>>>>> +     int parent;
> >>>>>>>
> >>>>>>>       ac =3D fdt_getprop(fdt, nodeoffset, "#address-cells", &len);
> >>>>>>> -     if (!ac)
> >>>>>>> -             return 2;
> >>>>>>> +     if (!ac) {
> >>>>>>> +             parent =3D fdt_parent_offset(fdt, nodeoffset);
> >>>>>>> +             ac =3D fdt_getprop(fdt, parent, "#address-cells", &=
len);
> >>>>>>> +             if (!ac)
> >>>>>>> +                     return 2;
> >>>>>>> +     }
> >>>>>>>
> >>>>>>>       if (len !=3D sizeof(*ac))
> >>>>>>>               return -FDT_ERR_BADNCELLS;
> >>>>>>> @@ -39,10 +44,15 @@ int fdt_size_cells(const void *fdt, int nodeo=
ffset)
> >>>>>>>       const fdt32_t *sc;
> >>>>>>>       int val;
> >>>>>>>       int len;
> >>>>>>> +     int parent;
> >>>>>>>
> >>>>>>>       sc =3D fdt_getprop(fdt, nodeoffset, "#size-cells", &len);
> >>>>>>> -     if (!sc)
> >>>>>>> -             return 2;
> >>>>>>> +     if (!sc) {
> >>>>>>> +             parent =3D fdt_parent_offset(fdt, nodeoffset);
> >>>>>>> +             sc =3D fdt_getprop(fdt, parent, "#size-cells", &len=
);
> >>>>>>> +             if (!sc)
> >>>>>>> +                     return 2;
> >>>>>>> +     }
> >>>>>>>
> >>>>>>>       if (len !=3D sizeof(*sc))
> >>>>>>>               return -FDT_ERR_BADNCELLS;
> >>>>>>>
> >>>>>>
> >>>>>> Simon: Any comment?
> >>>>>
> >>>>> It seems risky to change the behaviour here. Also fdt_parent_offset=
() is slow.
> >>>>>
> >>>>> Can you point me to the binding / example DT that you are trying to=
 parse?
> >>>>
> >>>> Look at dram_init(), etc.
> >>>> https://github.com/Xilinx/u-boot-xlnx/blob/master/board/xilinx/zynqm=
p/zynqmp.c
> >>>>
> >>>> fdt_get_reg() is calling fdt_size_cells()
> >>>>
> >>>>
> >>>> And this is DTS fragment.
> >>>>         #address-cells =3D <2>;
> >>>>         #size-cells =3D <1>;
> >>>>
> >>>>         memory {
> >>>>                 device_type =3D "memory";
> >>>>                 reg =3D <0x0 0x0 0x80000000>, <0x8 0x00000000 0x8000=
0000>;
> >>>>         };
> >>>>
> >>>> Code is in memory node I need to work with and asking for size-cells.
> >>>> Current code returns 2 instead of error and the rest of code just wo=
rks
> >>>> with size =3D 2 which is incorrect for this setup.
> >>>>
> >>>> I have already changed size-cells =3D 2 in our repo because I need to
> >>>> support for more than 4GB memory anyway but this should point to the
> >>>> problem in that generic functions.
> >>>
> >>> I think this should go in a higher-level function. I very much doubt
> >>> that this patch would be accepted upstream.
> >>>
> >>> Can you find the caller and make it call this function again (for the
> >>> parent) when no nothing is found on the first call? Hopefully this
> >>> caller will have access to the parent node and will not need to call
> >>> fdt_parent_offset().
> >>
> >> The funny part is that nothing is found means return 2. If this returns
> >> something <0 then there is not a problem to try it with parents.
> >=20
> > I don't have the full context of this thread, so it's a bit hard to be
> > sure, but this doesn't look right from what I can see.  Two things to
> > remember here:
> >=20
> >   * #address-cells and #size-cells describe the format of addresses
> >     for children of this node, not this node itself.  So if you're
> >     looking to parse 'reg' for this node, you *always* need to look at
> >     the parent, not just as a fallback.
>=20
> ok that means that I should fix my code to find parent of current node
> and then read address and size cells.
>=20
> fdt - actual memory node
> parent =3D fdt_parent_offset(fdt, nodeoffset);
> address_cells =3D fdt_address_cells(parent, nodeoffset);
> size_cells =3D fdt_size_cells(parent, nodeoffset);

That's correct.  One way to look at it that #address-cells and
#size-cells are properties of the bus anchored at this node, rather
than properties of the node itself.

> >   * #address-cells and #size-cells are *not* inherited.  If they're
> >     missing in a node, then the format for its children's addresses is
> >     2 cell addresses and 2 cell sizes, it is *not* correct to look at
> >     the next parent up for these properties.
> >=20
>=20
> ok. And I expect that this is in spec.

Yes.  Actually relying on the default values is discouraged, of
course: you should include #address-cells and #size-cells for any node
with children.

> Definitely thank you for your input it was very helpful.
>=20
> Thanks,
> Michal
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8BaRf9C5c8wiXWYy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW6eJ/AAoJEGw4ysog2bOSFNAP/0F2h1fTKCFN4Gss/mT8ptig
vpwczizz8hDVbIAM9cM+8vfQcHtFAmW+GxhJZKavf6RPZK92FBJMTAhk+5fSKnMj
cWFqP2sYMorTpNX5VUHgOiMDXVw7iX+VTG8au0WPMv47aICKIgQGDW8CHgrnFxV7
B1Zjg8A/HaWtNWlu1fkT76i6azzekIDxGpu3rImEF7TnnphYGZh49R81fgwvFTG2
FtdjsXrnOFnsPswseyK2apLpBT4VMgV30EfnAjK8iSMVOS97E261dWkrDQbfB4ts
OKs94CExxCnIFpVcogPa/BysoTNLo6D26hraFM7HocCezVod3wX4E+5Fn+RchFsa
NSR8GxxDQG8nGadatYsG2G6dexmneqhG5DF5bscC6UKxJu/HhT0D0QiUHXhCHQE3
b45XRV+BwoqEa3FZe/E4viC6nNXHy5p40+ovVgR9bmn7gQlalOpA25jYPaEW3VcZ
OF2d3CUbuMIc61f3ihycbLa5rRliBCwugXVIe8IbStTOQ4tLJMSv8l+645mvC1Tp
xi5eoNXCXKDtg6S4dWAsapxfc9J9onTaL0dBXUg3qVQ4RHPjp9tKw3Nn+v8OG8ei
yzruRJfMUNAeqQfg1vZIaXjCOJ7eq36gwjGuFSowpWMWin2iNKiXEBdD9DIA+EhA
vQtfvpG34T/nl54eb76s
=uyqh
-----END PGP SIGNATURE-----

--8BaRf9C5c8wiXWYy--
