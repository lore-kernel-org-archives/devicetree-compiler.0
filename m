From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: labels within a property value
Date: Mon, 12 Dec 2016 14:23:28 +1100
Message-ID: <20161212032328.GA31441@umbus.fritz.box>
References: <584DFCB6.1070403@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1481513015;
        bh=BTCWp8pOscMB/bNt7cHfLAWxLbzXbz/VpOAjyMA/5CE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OdePpP6JGNoYFJ5dvS3yfFfpDN6lZfucXyrbmWFPqu+SqtQ607qQz7PzBpZc9croK
         eFpfiUdKlEQBmbdYIwFX6+1QmVStOEqw2sDxjqSPTEJZkVDa9bxkUTZcp95eW3+hIY
         vripf7LVUDtalEVAgqGv9ESc/U7DAgM7DRr8vpeE=
Content-Disposition: inline
In-Reply-To: <584DFCB6.1070403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 11, 2016 at 05:26:14PM -0800, Frank Rowand wrote:
> Hi David,
>=20
> The ePAPR in Appendix A (page 96) says:
>=20
>=20
>   Labels may also appear before or after any component of a property valu=
e, or between cells of
>   a cell array, or between bytes of a bytestring. Examples:
>   reg =3D reglabel: <0 sizelabel: 0x1000000>;
>   prop =3D [ab cd ef byte4: 00 ff fe];
>   str =3D start: "string value" end: ;
>=20
>=20
> The dtc compiler indeed allows placing a label inside a property value.
> But when I try to use that label I get the error:
>=20
>    ERROR (phandle_references): Reference to non-existent node or label "D=
ATA_1"
> or
>=20
>    ERROR (path_references): Reference to non-existent node or label "DATA=
_1"
>=20
> The three test dts files are below.
> test_label_b.dts has the usage of the label commented out (compiles ok).
> test_label_c.dts tries to use the data label as a phandle (gets first err=
or).
> test_label_d.dts tries to use the data label as a path (gets second error=
).
>=20
> I am trying to figure out how a data label could be used in a
> reasonable manner.  Is this maybe a construct left over from
> open firmware?

No.  OF has no notion of labels whatsoever.

> Or am I trying to use it incorrectly?  If there
> is a valid use, can you provide an example?

So, the way to understand this is that of themselves, labels are
entirely abstract.  They can be put on nodes, properties, or inside
properties.

But a reference to a label is not abstract - it needs to be expanded
to something concrete.  For a node label, it expands to either a
phandle or a path, depending on context.  For property or
within-property labels, there's nothing defined for it to expand to,
at least not yet.

So while labels are valid in lots of places, references are only valid
if they reference a node label.  Admittedly the error message for that
case is pretty misleading. [Aside: that in turn is basically because
we don't actually have a symbol table for labels and instead just
attach them to the labelled object.  That's kind of bodgy but there's
never been quite enough impetus to clean it up].

So, what use are property or within-property labels?  The only use -
so far at least - is when using -Oasm output mode.  In that mode, all
dts labels are translated into assembler labels appearing at the point
in the output corresponding to the node structure, property structure,
or within the property data.

The idea here was for making really minimal bootloaders for embedded
machines.  Specifically ones where the hardware is fixed enough that
the only dts changes necessary are in-place alterations of a few
properties (no adding/removing nodes or resizing properties).  In that
case you can use -Oasm to link the dtb directly into the bootloader
image, and you can use labels to allow the bootloader to update the
properties it needs to without any dtb parsing.

In practice of course, I don't think anyone's doing that, but it
seemed like a plausible use case when dtc was written.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYThgtAAoJEGw4ysog2bOSccYP/A38hjijBLCGteabc/bIDH64
vjsd0YyLIuz1x9BXiPWwqI1M5kPcrwMEjle/Y5JFrtuqCq10tWdasKfvT4Xz8gcW
odBodSKF2QNpwgR3bGXDipdAwnSwGfphv+vUji1u/VMPJ7Uye4+rfscVVcd13xsX
Dp1VOT3cSDHZNuK6k8Q3CjlZcvxTzxrpqeCl+EkIFauFgJZFGwTiMs6huVaSwQCP
rUS2vMdSs91ivE8WB9Js9GDAISlunX8rwcnbSeSbMx0gryM6eDo6BfUrwCz3NCA3
icLWtQig+qWPUgHKzpApPVwhiGo/5NLzmvYXW/z1QLlAtZoiZQZO0jNFd/2od7jt
/zL+iOFyspi1HHQGOxKpY0aioFd1XdW4YfoOu/7S9dBSJyoBrNzezthZ6nJAPjIo
6NntLFBDkdpmJGDebLlYv+lz5WMRnyfUdXw4V6PeVqsmj/hHbM+Bywff0Tuvs785
+IlP5GKRE3FqV78IR5//OjOvtjtftQLulK9/bRVpFwL69YQUYNEl7dVMxkTM6zrL
cTEa7web2z7ocbyZHW4RM1JqtMQr4+5P/+z0ekQqFjFywLP/5k283H315ArSLtOh
mp9GxIVYQgp6tP5Z5FSaFT4wvxPOG5E7oobuHPPHM+VuswYVeKBa/yjVWqWPbcie
0fwc/GcJBm8z0/USI8gI
=74Mb
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
