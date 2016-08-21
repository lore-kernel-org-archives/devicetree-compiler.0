From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,10/13] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Sun, 21 Aug 2016 11:07:48 -0400
Message-ID: <20160821150748.GC5342@bill-the-cat>
References: <20160705082646.25044-11-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="27E2kr7c9faIxYHh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mtanGBgXP/5HwVQ/mBDkncFihb3WrPpU3mGuck3PEAI=;
        b=M0YGs2kNd3HnwIHexuyvoMIhYAVDq/76zzR+MqfAAX7EdPALUThcX5xzY5gM2t9uov
         UBUhUW+ohAY6V+NuyGK9MbFhAG9qBQc2CsPzZRZZ/nU5ydtooXMpxKzPBzODJUA33Svk
         b1AaJmPYZBX4buwYikkM8yljTzLuli+csHnM4=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-11-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--27E2kr7c9faIxYHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:43AM +0200, Maxime Ripard wrote:

> Add a function to modify inplace only a portion of a property..
>=20
> This is especially useful when the property is an array of values, and you
> want to update one of them without changing the DT size.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--27E2kr7c9faIxYHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucPEAAoJEIf59jXTHXZSyXUP/A7+TWByscRQcDvDCaS8Hw1Y
+yzeWI2T5jHlJJEzCSLsFaGchTaPmGLjVdRv48ERoCNPCrgZqzrvjNEGNP3wo8Sz
1WJrI5w4kyhc4cZtW2Zt7muR8BhOWMRMaBMtRI/dDGKmhElsPnNWztbGOKwLqGeu
K/MD9u5ETWoSRNPWk3p1pOHfOXuEAGDlgJPFYz/DD0kyKk7nDWlgKHvzASx0G+cz
Iz0BE4F7DkGlzMrs8qfqPmxaqXkVGcRFHE6gCN1H/Wy3SF7JdDqszwjiVp8758ZT
Jv1TT19lVDKlv16g8elwK2l5FNFTuQTZJoZ7j+FRaHxD0EmNFnP9vqoQSBc/30pi
yEtcFGPTx4/1xyJ3PiFZaYaLA1FK58OzY0FfZB6dufw+DwIW7jagnaDRUWZc+Nh+
8mDI0TZoEeeKqwp377dhJH7vgyNnuVN7LeAMHGXXbiEi4ouNKfeDH/90F4Uhd6hQ
016M27dn4luPTuoDrdk0crEDq9NQK7N1RkecbiV2XlQr5UU3V9fRR6ienZd68pMW
I7B2GJ2bUC7O3J0C2ebNTdpDsjnOdhtXYi6B1BfL8HqiP7cQZrasdeDgEg6ELClq
keIqheZ9naZcSmRV7fGDh1dj/dQ7sLu0LqXlrIPhBCCoFGMer1H+O9Fb6f4F96f4
Z37hDtC0ogLkpKSQaYNI
=GGFU
-----END PGP SIGNATURE-----

--27E2kr7c9faIxYHh--
