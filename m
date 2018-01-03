From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: __local_fixups__ format
Date: Wed, 3 Jan 2018 11:03:23 +1100
Message-ID: <20180103000323.GC24581@umbus.fritz.box>
References: <CACNAnaHU2ETa4WryMHzyHH0br6BighhJzen3qqv0EL8u8-_1Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514937964;
        bh=0zw/IbRMVIou2hCEKRoAMQ4X2ew9SMDO7d3HECOtE6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ULWMoAxVAkyfgLgxnZ2yZR+AdsXo6LPn4h0zcUN2EiYvKRE3HIUlDQy786Avx5xwi
         R/c32IsDPuhQT+HVJRsgfq0or/HKHI5RtNvAgJXXadijYeorwY4dqkcM4xk64ce5Qf
         yUwbfjNuXLE6PjHj2pDklCUKLQqsyP/0H5ZsHw2M=
Content-Disposition: inline
In-Reply-To: <CACNAnaHU2ETa4WryMHzyHH0br6BighhJzen3qqv0EL8u8-_1Kw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 03:54:30PM -0600, Kyle Evans wrote:
> Hi,
>=20
> I'm working on using libfdt's overlay support in bootloaders on
> FreeBSD. I find that our BSD-licensed dtc(1) currently generates a
> /__local_fixups__ node that matches the format (roughly, with some
> slight bugs that I need to address) of /__fixups__; i.e. a bunch of
> properties whose values are "path:name:offset".
>=20
> I've not found any documentation on what is actually valid here, but I
> do know that libfdt will not accept this. Is this completely invalid
> and our BSD-licensed dtc(1) should write /__local_fixups__
> differently?

It's completely invalid and your dtc should write /__local_fixups__
differently.  As well as libfdt, the Linux kernel won't accept
overlays in this format, and there might be other tooling which is
also affected.

> If not, Is it OK enough that a patch would be welcome to
> support this in libfdt? I like the consistency myself, for what it's
> worth.

Join the club.  I complained about this inconsistency when the overlay
formats were proposed, but wasn't listened to.  Now it's deployed
pretty widely, so we're stuck with it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMHcgACgkQbDjKyiDZ
s5KQKg//ZGWbbw68enS9JnEsb8ko+FXYHRdfxr2U78NsOT2FB0gnaOAO2df5607F
q9wQdxlaofeQbao/Xzyq03r87ZjPm/jui6XM+LvhvWUqzosJSuc1XKWXoilVx4P9
aNaeoZt+gh965ZuENiGQiml880csLlGcKwU6uKEObStCz5rtNXiwcuQMIBGnPtrf
yS80Bu9IyVsAqKwGC63VljsN4KQRFP8mz3Z8kVt6ha8H78UoHHN1SgQXKMqdlQ1w
+v+v34F6tjLEnLbEtmBGVTGgIU+SUGriWdfgCzLuQHU/NnHsVC41HWXDxXHCF0X1
bHxL83doypHgSQwDa7ox/8NuwPCp0zwr4VWhuoN0j11jetXynDvmT/NepwbQ1NTf
SMU11KvKE2uK9KY5g+mGi6y+3+wS/DmqYhiHE2u1nEBD3Z0+ontgTW0239YKUlSG
8NdtLNiTVN3Iz/DhGGKcldIlhVAXkfgzE/+tqUVQz1FzQsQUqtuI7Rcx16tss0cV
RRS+TQslus9iF5EWPtK1yHn4EfVuBHecMFXvdMRxnFTCVmBy2/jt8ogdQ55ZHOG4
kf4eUJ81q3ldrplYpNblW8GTXvgUUKUSq8l9WLttIzexRhL/g63hW2ml85yDXpC+
05Mdy9u+lvOdplo14rxeo+Q/M6K0z+hzqrIQchwmJoXt1UsOcm8=
=T9m7
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
