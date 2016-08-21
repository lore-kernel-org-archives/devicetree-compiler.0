From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,01/13] cmd: fdt: Narrow the check for fdt addr
Date: Sun, 21 Aug 2016 11:06:49 -0400
Message-ID: <20160821150649.GT5342@bill-the-cat>
References: <20160705082646.25044-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UuuTb5hZdWr4w/Ub"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TU6FiUGduuWhF9co5S3LUmKSHgafzMrOcCBW5uHLVm8=;
        b=QtPxFHPDFPnl74H2TejDZImafze0S7TSzgNrIEdoCNntCYlwNWUSIwEjoy3pUnEhea
         /tH/h+rTeyRyaqy2DyS9d0GDrFvlFZH8Ht63rOi4eiw9LaVdnwn5EnJZs7ofOkBxDF34
         AieKGOLqs9UDPinUvT1Jq1gAselvI+yk7aXGY=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-2-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--UuuTb5hZdWr4w/Ub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:34AM +0200, Maxime Ripard wrote:

> The current code only checks if the fdt subcommand is fdt addr by checking
> whether it starts with 'a'.
>=20
> Since this is a pretty widely used letter, narrow down that check a bit.
>=20
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--UuuTb5hZdWr4w/Ub
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucOJAAoJEIf59jXTHXZSLs8QAIobuksk10TzbRCbhymbeg6A
cYBy6nn/YT9HTEvY6scNZo4o386xhzhNZHUUxfZ5jhX7grNJtqU3xlwO4NZjEe9Y
E1IdN547GLWlUru27oNK+nI5Z/WDUP9ctL1neMCE2nh8mCHP7FUluecVWsszEfqp
z9jhLyPSQKUkGXpAab0580+lFE5AcEXcUejcowoj1jhZ/Bk12QSV0HwpLDd4XemB
kkMXTgIxcvEOkqicOxLBXCn9ru2pqcc2bRn8uB2t3Ef3lnoC6f1aVOZsq54iJZdE
oid/k6xf7y95h9LhZxikwfMGiJHKWYsWBpy4hcgLXRK4wySD4GnJW74ArjFqghdV
EkT/pY4Q7qRRlrQ/PURy9QqYO/1ICwBW7RJAd4IxGfSWiE+p8k2T3Pt1DFgFnP8q
6XYd77h0vb90cn+o8asrYYHXfJRY+EcSaHi9zfBOHXBXlJhjYTXcANyuRorixswf
i/aS2q5Dco3vDnv7eZ+gvavYMbbWsvufQ6/5pVpghg4VVgf+TDYcB9T+lZqggtU9
7a5PuOWnsxXeSV+IbNu5k0TWrfa7TC3YL4bytR+tiepbR9uFdYE2RrX/2TLGV6lQ
+JFFfBbi9xzFFngIfwobuNbj7lIXcx7x0hILwyDsPHN2Ojvl451NmNXKMlwWA4+q
YcooIF435lhffSqjcLhs
=IqnA
-----END PGP SIGNATURE-----

--UuuTb5hZdWr4w/Ub--
