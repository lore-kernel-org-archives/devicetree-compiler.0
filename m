From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] tests: add -a option cases
Date: Fri, 15 Jul 2016 12:13:14 +1000
Message-ID: <20160715021314.GS14615@voom.fritz.box>
References: <1468409701-3310-1-git-send-email-timwang@asrmicro.com>
 <20160714092721.GP14615@voom.fritz.box>
 <0524d71d69d240c39c0337ea08a55d5e@mail2012.asrmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="magLDk5D4XGaUXcd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468549664;
	bh=ak5z0YDe+fKxdD/Aplb2EwxH92Jmmp5hzPgKTIF8ewg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMUYQeMB6Gd0Uboh+MPSeFeD8tAf03LTE9EtF64p/1rttUCU7WHM28nLjhfCrtyB6
	 qd9g87KphQkCQcHBQk6AK5hwp6MDy7Qo9F1r8ReXAjXQCEOy84PuBn/91CH36x02j+
	 9Jxu4+IAvx6QGO5JOV+BfUWn/gYxSwPSi+oy9s+g=
Content-Disposition: inline
In-Reply-To: <0524d71d69d240c39c0337ea08a55d5e-w/Y+SVW4SlHx9BLjpE4ezaBKnGwkPULj@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Wang =?utf-8?B?VGlt77yI546L6ImH6ImH77yJ?= <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "wtt_usst-9Onoh4P/yGk@public.gmane.org" <wtt_usst-9Onoh4P/yGk@public.gmane.org>


--magLDk5D4XGaUXcd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2016 at 10:02:31AM +0000, Wang Tim=EF=BC=88=E7=8E=8B=E8=89=
=87=E8=89=87=EF=BC=89 wrote:
> Hi David,
> Thanks for your review!
>=20
> I'll add the "actually check" code about the new dtb file with alignment =
option.
> And add more case which combine with other options.
>=20
> BTW, do I need combine the test patch and "-a option" into one
> patch?

Either way is ok.  Since they're both fairly small, it's probably
simpler to combine them.

>=20
> Best Regards
> Tim Wang(=E7=8E=8B=E8=89=87=E8=89=87)
>=20
>=20
> -----Original Message-----
> From: David Gibson [mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org]=20
> Sent: Thursday, July 14, 2016 5:27 PM
> To: Wang Tim=EF=BC=88=E7=8E=8B=E8=89=87=E8=89=87=EF=BC=89
> Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; wtt_usst-9Onoh4P/yGk@public.gmane.org
> Subject: Re: [PATCH] tests: add -a option cases
>=20
> On Wed, Jul 13, 2016 at 07:35:01PM +0800, Tim Wang wrote:
> > Signed-off-by: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
>=20
> This is a good start.  However it needs some more.
>=20
> First, you should have some tests which actually check that the generated=
 blobs have the correct alignment.
>=20
> Second, you should check more than just one alignment.
>=20
> > ---
> >  tests/run_tests.sh | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh index=20
> > 7eb9b3d..6aed6d6 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -579,9 +579,10 @@ fdtput_tests () {
> >      dts=3Dlabel01.dts
> >      dtb=3D$dts.fdtput.test.dtb
> >      text=3Dlorem.txt
> > +    align=3D64
> > =20
> >      # Allow just enough space for $text
> > -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> > +    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
> > =20
> >      # run_fdtput_test <expected-result> <file> <node> <property> <flag=
s> <value>
> >      run_fdtput_test "a_model" $dtb / model -ts "a_model"
> > @@ -600,7 +601,7 @@ fdtput_tests () {
> >      run_fdtput_test "$(cat $text $text)" $dtb /randomnode blob -ts "$(=
cat $text $text)"
> > =20
> >      # Start again with a fresh dtb
> > -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> > +    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
> > =20
> >      # Node creation
> >      run_wrap_error_test $DTPUT $dtb -c /baldrick sod @@ -628,7 +629,7=
=20
> > @@ fdtput_tests () {
> >      run_wrap_test $DTPUT $dtb -cp /chosen/son
> > =20
> >      # Start again with a fresh dtb
> > -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> > +    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
> > =20
> >      # Node delete
> >      run_wrap_test $DTPUT $dtb -c /chosen/node1 /chosen/node2=20
> > /chosen/node3
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--magLDk5D4XGaUXcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXiEa6AAoJEGw4ysog2bOSUlwP/0BsGAzm9HwOde77WxL/pQax
7TFLC+zbpAY6sYA2sjEjQMINB9iBW0Pw702eDW3fO8rK9KsJyF14eLlXge2vTZxO
7rjPdehp4ee9u6zynqWqwRBrpK61wtDvnV+auc1d99ilWhea61XCR+uxsJAbU1OW
ApYK2D0jjtViBcUPPRjqFZWuQK3fFe+sGPjPoqQ6t54X9ZhQrhnVTwTuZE+8SqBS
5I7/9HiNHY0lMhlpHMh08EBb6ZsA5VT3qF0nXswsw75SJs+gg+ajLZRu89dMcWpF
wZY6W4+s58iKQbXLaT7V8GixGOYV6vG9VvPHRJ9Y9SUdrvbZDKOLCf9p5x+Hfa86
8DZCuzMu5uDonAdsaRt4gZE6P/jzxU6+BQsAY0lSfFPx6USaJDQC2BiUgxo58DsZ
zDP2EVnJsRF8ZwCY/PjDzMUiZriJ2Gs0oSStQlUR1t0zQvQZhjnHDLMb83cic28E
lHHvdXth5EXcrMcNaBfXZ+WkqpUWpQ2i2vikNE7DAoedev7yFiKlbjSOKWSvTJ7v
zuEdrYxV9XQOTDkMiEHC3RsprLEzFnOf3ziM2o/6V7j9publrXEMi1oIIouSJ4LG
PS/AePpFa5F5uqJLuCL+w80+/tvvxlu8nBXw5LErV7duj21EhI2sWYBFeJYPVYtb
IMzH7bQK3CxLE2xFbU5T
=DUdz
-----END PGP SIGNATURE-----

--magLDk5D4XGaUXcd--
