From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: test: make the test output more friendly
Date: Fri, 24 Oct 2014 12:14:30 +0200
Message-ID: <20141024101430.GB4794@voom>
References: <1414120757-17288-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414120757-17288-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2014 at 03:19:17AM +0000, Wang Long wrote:
> when run the command 'make check', the format of the output as the follow:
>=20
> ../fdtput label01.dts.fdtput.test.dtb -p /you/are/drunk/sir/winston slurp=
 -ts twice:	PASS
> ../fdtput label01.dts.fdtput.test.dtb -cp "Lorem ipsum dolor sit amet, co=
ns"...<4119 bytes>PASS
> ../fdtput label01.dts.fdtput.test.dtb -cp /chosen:	PASS
> ../fdtput label01.dts.fdtput.test.dtb -cp /chosen/son:	PASS
>=20
> this patch make the format of the output more firendly to developer, as t=
he follow:
>=20
> ../fdtput label01.dts.fdtput.test.dtb -p /you/are/drunk/sir/winston slurp=
 -ts twice:           [ PASS ]
> ../fdtput label01.dts.fdtput.test.dtb -cp "Lorem ipsum dolor sit amet, co=
ns"...<4119 bytes>    [ PASS ]
> ../fdtput label01.dts.fdtput.test.dtb -cp /chosen:                       =
                      [ PASS ]
> ../fdtput label01.dts.fdtput.test.dtb -cp /chosen/son:                   =
                      [ PASS ]
>=20
> The test result print ooutput at the right side of the terminal.
> The "PASS" word  printed in green color and the "FAILED" word
> printed in red color, which are more friendly to
> developer.

Sorry, I'm not inclined to accept this in the current form.

This approach assumes a particular type of ansi compatible terminal
which I'd prefer not to do.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUSiaGAAoJEGw4ysog2bOSwPQQAJa37D0N/kSeWM1wZEEjnA16
z1yYQSveS7YspkHeI0QtSITfOLcWsC4E2uiS/tx4m6YC8lfaaKXmmqPwIg0K0g6M
2FmvlJiAl7/n5Piu9xOPiT4Gc2zVbZuCOlSRkhjEDNuBTeO4RzIgNaKf6XCn6v8T
1po4yyld6V8h9dttdofGFwQ8NtwR/ZAFKIA1TBclermh1RQQ79tBCcnK5+4zdJkK
hMI7LrwQwwJf5oDtbDcUbIWSgRcLxVnaoD/jjtFAmrsOVJ036oIu3vX/v+HNabiK
D7tCE/tyN5SXbkTC0tf9Xym0RST/N6DkbgiNnBNPUTST6KVTSVzO5dJTDa0kMIfU
oSxD1pevXJfAfGVr9Ed5klQhNEpy/0digyCJDEQKFg6E1DagJbVGvneqBPbBrN1d
saFXcVNwa+w53evW8ANiz/pbtnQ2EXaF5NmrizupH7k03TZzNjuM8OS2g5zxUGHq
S25OWGX8jx07c5yEl8dMlqsYCS0+z9Ff6g4/aDDtYK4jLOJOfs0Qx6zzp/PyhF8r
oL1yLX2JZhtSCVyLr/JdMUBo1SU1Q8hDegxKLENGSwrJkQn746sSuDkwYkuYWHP3
TfKymGBa0eg3yyAhwy0daGfnUqj7H6rOdlcmQzXl+Y+MHVbH6qFFaM/36Ex8zI3O
XZUxAd2T4Yq59MXo1yfG
=cufJ
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
