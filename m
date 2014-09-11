From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dtc: Update the usage helper message
Date: Thu, 11 Sep 2014 11:28:43 -0400
Message-ID: <6372622.6xdLIIUD1D@vapier>
References: <1410419797-93754-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart61343130.9oz1MsEanB"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410419797-93754-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--nextPart61343130.9oz1MsEanB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thu 11 Sep 2014 15:16:37 Wang Long wrote:
> if #define DEFAULT_FDT_VERSION     17
> The message
> =09Blob version to produce, defaults to %d (for dtb and asm output)
> should be
> =09Blob version to produce, defaults to 17 (for dtb and asm output)
>=20
> This patch fix it, and delete the redundant 't'.

Acked-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
=2Dmike
--nextPart61343130.9oz1MsEanB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABAgAGBQJUEb+rAAoJEEFjO5/oN/WBZnEQAOPtwuUpl7QKJ74mU0fKSKom
UDpY0EpiNh/qRJHJcuZEVMz9wnySToY9tz4R8/yvChKZmAIsTEU9C9NuQ1cWnGTb
lfACNPph7+CWWFe4p+0d5zPZZouq0t3yts+0FkW2b5BG97nrYKkRjYUQlfe5X9xw
r+uvhNdc93ZfR7UW5TNvzg5dCi167pAWqVKSSOPwIMTXHoqH2F5I1kfGYnCtHeir
iKPpLykNGJ7hnZ6WKH7Zv+BBJscCVvg2V1CpEhjl/eU8qKavj9kBCR3W8QmNf3uj
N9RpajB4Z5BURBpYPST3vDsbiBOEKj9TYEayiy0pcSMqmqPj7pnuxq5lkXuEYKWq
+fa9hxOGObiPXRci2G0SnRSsGB5jvoPROvFG2HD0tFzKz1nSLBWFuRn08ax6tXKg
B6leak34+uT8Us85aDtDfDZhzkm0zl8zBlgDGcaqPKY2zl5uS+Hv8EQ6ejY2ePFl
DGusxaF5bN52IDqcaTsq8PvxCVBuQAA1fXU4zkJQ+gAmF0kQm459S1v1J/94XGda
+L8ZxKZMAMOni2X80oLEQke4idw+vyS3lVVVCK/1BZIerTEc6JxQSDMKnbo7Ma5x
L0e4VZan2rIOvuVp5v1lfG2wZTWR6Fza3kLSleVYtPWq6QKsq1YLwTI18Qdc+q+O
1FMEZEUbtVipi+Co+QDv
=7nT9
-----END PGP SIGNATURE-----

--nextPart61343130.9oz1MsEanB--

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
