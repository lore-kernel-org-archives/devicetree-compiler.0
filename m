From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot,v4,11/13] libfdt: Add overlay application function
Date: Sun, 21 Aug 2016 11:07:56 -0400
Message-ID: <20160821150756.GD5342@bill-the-cat>
References: <20160705082646.25044-12-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="039oG8jMepJcyEBX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BAZH7M9POeYg9UoWv2/zuNxaUPNXc2DmS3xpYl79rYA=;
        b=dBmp5Dk6b4WOphUikxs3UQgG6u0EGDocq7rphYBXhMuvWnlbX/L3W9/sgY7tQkUPwr
         0QR6Y98S57C7ZS6JRjZBTg3cUaoOCAHZHPsKoOzgt9KtqmNW0E7fiPV+YkqCS0Q1CNZG
         d2dMubcTnYAHe5tlGGDC4UNi0Me3W+/G/u8Mc=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-12-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--039oG8jMepJcyEBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:44AM +0200, Maxime Ripard wrote:

> The device tree overlays are a good way to deal with user-modifyable
> boards or boards with some kind of an expansion mechanism where we can
> easily plug new board in (like the BBB, the Raspberry Pi or the CHIP).
>=20
> Add a new function to merge overlays with a base device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied to u-boot/master, thanks!

--=20
Tom

--039oG8jMepJcyEBX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXucPMAAoJEIf59jXTHXZSNvgQALmQ7mJ14918TaYzL/u2hIMR
D8muHK8+t/B+MiwUr68GLXmWx6ZeBzX0HqE79h+N/JzZbQneFtr4fvGibtPWdXk8
rPYJdoa/NP3TjOK0N1DJe+O7E2aYW3G4in2ZZYu1nOJ5k7YOJBqWfkgmzEd0d0cD
2b1IqwrDhoBYEL0H+TSrZbG9rj5l9rHmsoWq9pWFJjslRWL/VTeaVaajtgFmsLEL
yIwXviMODxgQx3Q/c8zuMAkKh/XJ1bVdViESTU/0XvrXlFgQt+lhPoISfiY+JCmV
A5isFLrvMdf/GMKReWX8iLy4xknPqoc1Xp2bnW0WCJJAPMwiPgETfVR1us0YINq2
f+BC4rGdcy74kCVSOj75F9/2UiTK8vSf5pS/vdR+0zPapO/WebB9Q3Nwhco/xvVE
+BNiUH1sQJ2cpEdkWhic1LWWEw6XzewqwNHKTUsKViBn3+M8D3w4Q+9D0vr2FHyk
52CGHy0ilaB9a1Ki9JjMoNmuryvvvIEFavZ0awSafFHI1FehnBCePO3XzmirjlU1
BiTvwNLmYJaUQ7PhHcLrlUEdbScuuUXCsA98nLkqnHCoqkI/uTrXX43xP5+UNWDu
krhd8fG7PTLyEy6XTU0V6P2oXHWR3uD1XX2IcJ78vBSEU396G8tAxDx88OvGgHPC
ZBiCMWKquvF1m+r9M30b
=EeNZ
-----END PGP SIGNATURE-----

--039oG8jMepJcyEBX--
