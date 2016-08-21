From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,05/13] libfdt: Add iterator over properties
Date: Sun, 21 Aug 2016 11:07:12 -0400
Message-ID: <20160821150712.GX5342@bill-the-cat>
References: <20160705082646.25044-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="m5R8f+g8StfRwQ/I"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j+s06g6INMqLpnuzyOYQt6eKM8/2TYit2sOR9lfnwT4=;
        b=ech1moO/JTqiUfbulYCJwyaY1BdaufX+ebOhbE890EGpdMOzfsJZ72FMLblndQnWSa
         jxsc/lkrkIczbEXEgvY3cMg/EvvKdCm9nQff6PGavfDcA5Z6zobx3tu+rXNkeIBsOH4F
         tq/N9hXh6Vkseu99aoRbXRSvLtcIbQaIgDisQ=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-6-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--m5R8f+g8StfRwQ/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:38AM +0200, Maxime Ripard wrote:

> Implement a macro based on fdt_first_property_offset and
> fdt_next_property_offset that provides a convenience to iterate over all
> the properties of a given node.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--m5R8f+g8StfRwQ/I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOgAAoJEIf59jXTHXZSiUoQAIAWP/GjYLYbpvOhTg3s6j4e
P3yy+NsZJyTBxwOi4yTTPdvd4GWEsVITSdsyY9+XFf1+eV9K8LW3S6hqXjAuEAcx
Laup/NFFyOgfZmvpV97Xz4bx6iTMHlea2q0lCYtxVqgW6b/F87ZAebgq8do1Uy+u
iTyB5Yd5nWkFXSM/1yhwAdRz4Fo2NiEy4rL9AC1jvpjFS/dH/7HKVr8BnWp9jo+7
oaFNzno7CMoiHYcAc9wYowVuxOdtr7f1+GvICC7Bum1O3om7VurIaZLIB8U+jXGC
zxZ4uECilcbt8H5sHAzhve6owQanUFUbTpx6fYsasm7M9WnDVZCUTDr8uzrhC3Z+
1n+vy7dfS96izmG1UxtJPbEQbENFlUttPsPUVEZ/VEl+1f1ofEGsp9IOpT1vQuyo
hWRRHQtwamGbyfHYUjjcAOKB9sWOZPkuTvlfqxSQLd3Dw2BILxB7A3XgsbW2rTPG
atrXa1lXZUdjzDrpBJjhupkcFPAp1Lf8l5/rCiPunUIn1cxmxA5nSPg3RqtphE3u
5t/KqEQF7EQuWBJjqpaKILMQo+LCKQhJ7JggjTyN0qvKHgYI8EBYC5pmFf823uUQ
ZmonxHqc+xIs37V6/MyCA8t+eq8UKexDYWkb/g0/fA321XPvb1ruSD56b8aHwehF
nrSvwB32oNOO/9yXce2n
=pv00
-----END PGP SIGNATURE-----

--m5R8f+g8StfRwQ/I--
