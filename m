From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot] libfdt: Drop -FDT_ERR_TOODEEP
Date: Mon, 10 Jul 2017 13:07:52 -0400
Message-ID: <20170710170752.GY22707@bill-the-cat>
References: <20170710033017.161092-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OUc6bbOH/2jyIdKU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1aXyobkNqsyuTexvS5Ufota1zWghdJRODg0fzjiJKSw=;
        b=DNnnuiAqCJbk0NHaWtbKalZDJGEGHYHoI3fs7pEYoDnVXXz40q5j3PUXiBOr7hs3s/
         vWgGrvZaZ7HCobyAeTuU+iCE0xjrJTsWU9Wn1Fb1o7JGpcz0Xy56cmKWWXbDBUyZHQpQ
         tfQRFJd8YH1Bp4fGlLRWnhqTC7CX5SN/TyGbQ=
Content-Disposition: inline
In-Reply-To: <20170710033017.161092-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--OUc6bbOH/2jyIdKU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 09, 2017 at 09:30:17PM -0600, Simon Glass wrote:

> This error code has not been upstreamed and is not really needed since it
> is unlikely to be triggered. Drop it to maintain compatability with
> upstream.
>=20
> Reported-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--OUc6bbOH/2jyIdKU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZY7RoAAoJEIf59jXTHXZSgd4P/2Ct1DKkySLE5VnkYVE0kCHD
3iZNdXF70RUlV+Ix9JvdSIxTdrbnPAaTB05E5G76JGDM63984jDWYbvQKl4mZAF3
hNAp6ctgb3rk67GVmvy8NIAohPUnGcYZeiq7/iWMyfgM5nvkxvlZt7dSoCiV1ptj
bV7XkZDhyOynn5mO4rAua0Go3eYf0/rUWGyO4Z6ue3VQqNkCOJ9TOYg4iGAoTupb
X9Ql+3DGtO082ufHJV/ASGXEKDovoMk8IMPJ1/WfcXI6HGvDFFMKfJ53vyUZKK5O
xStKbAMZmJP0jFwGy2GcuUNv/ZbGgLBu9ce8TNOfvSLBv5W2CKZS77qE+qGK4zal
8iDRZWaZzTAKdeM1/du+ufP3K66VTgzGopA3MosAQw6dtVrjGpMBLDE7YFyeVqUE
z9kUmZ648Lge0mxT0FvNyEXJS1AMX8DujlNKAMgK2Ppbh+hmY5nCnDhbDaa481hF
g96YTjIwFTzHrRG4pFk7rJhv3JhIAhEiL4C/pTK99xbl/FZNAVMQHSBnUsupJIHw
FxUZ6XIGF6dJhdaF7oYaQqUn418ulCIBJYsP1IBIrUjHo+619iQgCXcIIBBu1VMV
U3IzL1MPz7bfoP2JefXNbVUi1krp4CpoLn+hq0vO4vH5hxd8rq47hp+p87mXpTLM
29a6Ei6QmgxFjh383ujt
=GgI3
-----END PGP SIGNATURE-----

--OUc6bbOH/2jyIdKU--
