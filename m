From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/2] Nul string list v2
Date: Wed, 18 Jun 2014 11:25:25 +1000
Message-ID: <20140618012525.GD29264@voom.redhat.com>
References: <1402936552-10249-1-git-send-email-jack@codezen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402936552-10249-1-git-send-email-jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2014 at 11:35:50AM -0500, Jack Miller wrote:
> - Tweaked patch description to make failing case clearer
> - Added test
>=20
> I decided to only test the mangled output since realloc was just a more s=
erious
> and obvious symptom of the same problem. I also verified that the pre-pat=
ch dtc
> does in fact fail the test.
>=20
> Let me know if there's anything else that needs to be done.

Sure, couple of nits to pick.

It's preferred to fold fix and testcase into the same patch -
particularly for small fixes like this.  Further comment against the
individual patches.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToOqFAAoJEGw4ysog2bOSvdAQAOGXu3tz0+86UJq3v6dnuBbx
FpIUGzrBGJU/uXgCxr3fNfHG8V4WRyRDhR88ZQxG0OM73h7A8s3G2rgtRW8mwGbb
bBlKHsu0yR8hfXnNxZ0uLjxpwBsgzixbFlp6Svd6KlPEuvi8a16WFXG33prX/S94
sNp85cc8tq4iSjOyfJLlvmeIq/yIi/fUfZaewQ2H5QkMkdiOepx0W6CQYB5km5Oe
pjMSBODYYFvkZeh+GtWSzM9bK/jIxLBAo1uYQif453sRMd0YDg22SmPuulW/nZ5d
vRyoRBKsH6rwh4ISYhfGUDllQWgHJPvLW1U39a8k8S/wlFaNtrGhpwhViXMXE11k
Fo469NkmqN4OD5+7YHtOFvKtH17ajba+1F4Nk5uTF4Kkpe5OvrwnF+O9hq/k4e0h
rWh5h+9LnjF1fbJNDgYTzFkuFtLFRiZ2wD4znRNSYmdI0g95PwTklBtGxNxbs+WN
wP08eLj8CqRPItNyQQ6KrcQ14jql7p543Xvzayo3S+MpZLPKw0DFbgPpwabYXIz/
o1y8z0FSebXuEScHTh8bjxuRk6ddXEBk5Pv8urDvx7/0Jlu5J+b1T+ewweUCeV22
qmGZbFu1W9dSd5dLFbAzNsBpv7O60Co+EyeDTlVR4Tnph76lsC85OVmIzE2/xiHJ
gaS/LHv19uY1GhaJTq0n
=Wo5K
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
