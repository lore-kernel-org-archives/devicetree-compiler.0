From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,04/13] libfdt: Add new headers and defines
Date: Sun, 21 Aug 2016 11:07:06 -0400
Message-ID: <20160821150706.GW5342@bill-the-cat>
References: <20160705082646.25044-5-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XUmrTyVHrg2/ImRG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FAZO19xyA1U/HOac6e7If85Dae/nRvKKN73dis2BkPs=;
        b=F2Nk8MWyiUn/rwAziJ6SpL5TpT/A9uBtplKUpa6ZIIZV9eLZeZjdb87PPKF0bly3pN
         SfT7vZnB0N4+v/xGIFhxZwWOr2z1xlJygJieotcPuapUxibEB4ydjc/OhHkhGvdmTBii
         /woNREwQ8P3+97YcM8h/SYomfmXGaDiYFSsMk=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-5-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--XUmrTyVHrg2/ImRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:37AM +0200, Maxime Ripard wrote:

> The libfdt overlay support introduces a bunch of new includes and
> functions.
>=20
> Make sure we are able to build it by adding the needed glue.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--XUmrTyVHrg2/ImRG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOaAAoJEIf59jXTHXZSw+4QAIuDPXU5+C/U2j5BGLazvHsB
FkNj0ktnYwIJL6CvYaPv9zfRMDCNDgy+v303ZxSkxpEaSEnj83UgtRO22BuweR5w
EPgkxJgHVzwZo8b3rYJwQBw62uJ+yTkIlsu1/+SMVaGaXaPCpnwZRdDFrARtYRUl
LrBHbQy74B5u2sA2VoB8QFxcxRmCgjicVMcWq0E7WjdJaLn2Q0jJoHEPmmKkvAfp
CeKK3OrlbPnVNGtE8+9C2fIyMVwXGVi/GBzGkzh3Bqi57jNRkhdXWFdMbC1ldQNP
XZXwPDJmUp8+HBjrvHjHK5j4OBHIeq92VBwQrFGwduXooWhccsYpPkmQPElOZh1v
J5DO4CY+Oux2XWonuBA96fXKi02r5HhyqEU+4ArvlK8DUo6TcRsTOZvICvHqmGrh
mG8Pezh5srUziOIOsv3sdQn93om5fuAOcijDrAgqdeOBJAOV5lXo+lDnSpX+q6go
4RDFMhwnJTKWivMU4IabhfTb2XXNlXkPnz/qEqjgwSl6KID3IEaCPm57JQp8hDK+
UkqzJBFpE1oZouu0SRmw5rgtQJ0t2DTWffpmxfrhPs6n5t6zvGXzFy9Kt6FBgarv
biThoeUWvoa7odgtOQVUdcR1ftNi1N0oqhKu2UvKDDZ0GmXDNP/wqKy7ad/V2ZYB
aaxoYVkV7OtOA/4Lb9/J
=jY8r
-----END PGP SIGNATURE-----

--XUmrTyVHrg2/ImRG--
