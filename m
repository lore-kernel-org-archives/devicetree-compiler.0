From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: fdt_setprop comma-separated cells
Date: Wed, 28 Sep 2022 15:35:31 +1000
Message-ID: <YzPdI5iS11r+9Fsy@yekko>
References: <CA+Nonppng=cKrpwqz6YxiVLikvgZGeuYBfdEn3jH8fW49070Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ltT9HZ5Nxnk81jYd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1664346354;
        bh=n5qvYN7cnc7GN8zgyH3ynj+AWC6FRixVNdZFjWyKqNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lCmfhJa9b7KdRl+aPFQgviLTI0PqVF06ywJYU607/BIRWySKj2GU8RwkQit/0DM2l
         4D2JCgy66VooZXjuVSWANy5Ir0+nrBz1cq2pETGfEmK0c5bQQo1qES3PX6nlRDPR0e
         Npb86jLwKjEGQyq+QJ+KLjdRzfeNEnVetOrA6/EQ=
Content-Disposition: inline
In-Reply-To: <CA+Nonppng=cKrpwqz6YxiVLikvgZGeuYBfdEn3jH8fW49070Xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Radha Mohan Chintakuntla <radhamohan.cta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ltT9HZ5Nxnk81jYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 05:35:19PM -0700, Radha Mohan Chintakuntla wrote:
> Hi,
> Not sure if this right forum to discuss this issue.
> I have a requirement where I have to update the device tree property
> with comma-separated values. If I use fdt_setprop() and pass a
> 2-dimensional array then it is not creating the property with comma
> separation. Instead I get all the values in same cell separated by
> space.
>=20
> Is there any other way this should be done?
> I have referred to some uboot code that used libfdt and does same way
> as me but even that has the same problem.
>=20
> Any suggestions please?

I'm afraid it looks like you have a miunderstanding about the
flattened tree format (a very common one, alas).

In the dtb, properties are simply bytestrings, there is no type
information.  You can only separate them into typed values by knowing
the binding which describes the format.  In other words, in the dtb
there is no such thing as "comma separation".  Commas in dts are
simply a way to notate concatenating bytestrings which can be
generated from integers, strings or whatever.

When using dtc in dtb -> dts mode, it applies some heuristics to guess
the right format to display things in.  However it does not - and
cannot - get this right all the time.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ltT9HZ5Nxnk81jYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMz3RwACgkQgypY4gEw
YSK46w//Zlc0QZo/Iv5alNTY2RmptevaJppxBVxJDexSIGcH6QBh+hpHk0HUxD2T
p3k44Buaw29dT8UrwbwwZ3CQcGROFJehKaGoHnlb0B8YSWrWbxFwSWrAP52ArzRj
3fGCGjaC7ny/BRkq09jcQJGPCovaGMoIu7qKYO21uCT7fNeBrix2HZkFMqeT+JbY
2FAA2cpjo55x1zOyehOkDj7FKhu5M+ltUdgHB9fscwHp1Gdl9ZTX9YhXmziJzGF3
c/wwwQ4qV9olJFgEHeM4aNatBZtWBuuiOtGABC70oQfLSHQ01ft9quDoCX/xozuE
+3K1nHt/315/yUVvLerNwxmOQ8rUGSjBVfzvjPVmotaZ8J/PcNqD+5ro8DjUroRD
MxLq9vvkkXfBFmMUj9zZS0C0FnleG6Klgc4TbS8tVCzv/v3kVJB1f+G30cgf7oEz
WF4aCwH/+p0f3Lo4j9m3mECRnZYFftZybYtaV8pnOGoAO2caZVTZizwJ7oMIrXKp
yJc5d/tIioLOXXMB1hvdYzOw9ud7qfE1Hv0AcAhN/mkMZ3xZHHGOEgEqUFZp5zqJ
FNAxhySYRPS7NEdZUAmzK1a1C6+M6M7OpJuxJXtcUe+uLE+cjhg4ERKqooU/O211
uWrfkRxjKdJ6zd+pukw0gyZX17ZUmgGEzfwiBpoSaJQz2/Buhzc=
=TAmm
-----END PGP SIGNATURE-----

--ltT9HZ5Nxnk81jYd--
