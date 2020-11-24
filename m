From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Check for 8-byte address alignment in
 fdt_ro_probe_()
Date: Tue, 24 Nov 2020 07:58:02 -0500
Message-ID: <20201124125802.GJ32272@bill-the-cat>
References: <20201104130605.28874-1-trini@konsulko.com>
 <20201124054259.GD521467@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FFpMipsYUdYbs4p3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H930ogS8CVmCO6mLkxHx+Ql3MdjvEPtGYNGedv+zZ7E=;
        b=Mg39e+n+PODXlUhDaEyzHsNKHFRnqkSvNDEodTfLiiaJjpRQKaUEeE7RH+AWtG+xjp
         7LNlYJ69MLC4kaBMjRpagBiVvc8heroaaBOb25C3bB8ccrbs01ahbcedIgvNYdO5j+kt
         /Ea64UIdkmglC1kEOZNZmlrT3RrRt2QTlvXkM=
Content-Disposition: inline
In-Reply-To: <20201124054259.GD521467-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--FFpMipsYUdYbs4p3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 04:42:59PM +1100, David Gibson wrote:
> On Wed, Nov 04, 2020 at 08:06:05AM -0500, Tom Rini wrote:
> > The device tree must be loaded in to memory at an 8-byte aligned
> > address.  Add a check for this condition in fdt_ro_probe_() and a new
> > error code to return if we are not.
> >=20
> > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>=20
> Applied, thanks, sorry it took so long.

Thanks.

> A testcase to make sure this fails on an unaligned blob would be a
> nice addition

I think I see how that might be done, I'll put it on the TODO list.

--=20
Tom

--FFpMipsYUdYbs4p3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+9A1cACgkQFHw5/5Y0
tyxj9Av9FBwqo3/Qwl1H2nNvcWSXeUdYH1b3py9yGoqg06PsIR5AhK7Ugwfn/Cmy
+qVPAPb17doZiGJ1nftI8eRo9ue/TKhnUr3d8Pg326wJq3KQDtUlhOv6Hdoxn4tp
LOwPFDwIuLKpI8+sakJPT5qUHWk7F6NjxOVQJ7uKqcC/ZNar/+gpFxbG6rN7ku1E
ZZg2AQBPu6DIIklD5cBgujBAbNALyxgPNaVmL6kWVVIgu3SrRxyfWmUVecF2knki
Om+PE0za0qYpxvDxbHejIm1KUKm0QL/JVYfsi23SUQ2MNsCXZsQjV+6mwVfs/3J7
Ni2KwLqoP4lF2Z0VJ1S2+xPrKov67ZzKAEXUnCZyrxQhjZuGSbtpXly0pmPtLyAS
YGidcwKksPsfjsd4BbAXqXcUBy+yRAxNrs5bVT/GixUybQSnX4r2ELpd6kagShVm
a/yBhHJaGiyN825gCuR5nq9O0PCqosiOgU9HrYxG/dafIMIZm7CxSLK2I0b6Q+H/
72RKkaKl
=guVF
-----END PGP SIGNATURE-----

--FFpMipsYUdYbs4p3--
