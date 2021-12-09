From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V3] Support 'r' format for printing raw bytes with fdtget
Date: Thu, 9 Dec 2021 17:23:33 +1100
Message-ID: <YbGg5dZQ/U1HrACx@yekko>
References: <20211208170055.13811-1-zajec5@gmail.com>
 <20211209053041.17984-1-zajec5@gmail.com>
 <YbGZlK/vOFaXtb21@yekko>
 <c59e41fd-bdfc-c419-e68f-0f6086c9b61e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Mb75oF894V+AEvOD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1639031030;
        bh=vePi0NEO2HJ0XwDAuMhYJ/TPU05cTige5dhOLXa9wg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ADPOFkj7dU7l/ud3tjR0BKfudUo/8w82iEQUzj4TynPFNhUuUjhHI+Le1sjb1eoTa
         w0vdBeX+UtoCR+01yKtg+kCP1J3UxFNAb+WbIHDLVF2RuwEtszTC3lN0hDX8kKjIlU
         jFDHYUNQ3Xa8Xs8YKDAYxxOLZgy3ifnxXyk4qPQw=
Content-Disposition: inline
In-Reply-To: <c59e41fd-bdfc-c419-e68f-0f6086c9b61e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>


--Mb75oF894V+AEvOD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 07:06:52AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 09.12.2021 06:52, David Gibson wrote:
> > > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > > index d100d5a..11068e1 100755
> > > --- a/tests/run_tests.sh
> > > +++ b/tests/run_tests.sh
> > > @@ -855,6 +855,8 @@ fdtget_tests () {
> > >       run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
> > >       run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
> > >       run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode =
blob
> > > +    run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tr $dtb / co=
mpatible
> > > +    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tr $dtb =
/randomnode blob
> >=20
> > I think using \ escapes in strings will be shell dependent behaviour.
> > Have you tested this in shells other than bash?
>=20
> It isn't back dependent but printf dependent. See fdtget-runtest.sh :
> printf '%b\n' "$expect" > $EXPECT
>=20
> It seems even busybox's printf supports %b:
> # printf "%b" "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" | hexdump -C
> 00000000  0a 0b 0c 0d de ea ad be  ef                       |.........|
> 00000009

Ah, sorry, I'd forgotten that fdtget-runtest.sh invoked printf.  In
that case, it should be fine.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Mb75oF894V+AEvOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGxoOMACgkQbDjKyiDZ
s5Ii/Q//S7BCzXrl9Ny613yPPelBDmV69eEji6V2Q/UMlpvBHt4GVfUEHqFuw6fQ
uFpKaPDUp76ywOra4nFRx1F1OwmlH2kppKOP8df95SqQd91BDmoR/jTnCibIk8AJ
TcB5Xvs1r3nDC1Fw/ZgxJ7/0nQzmBKpAYkUc8CYjXVAvFA4CN5GjxZErwUfTifEg
Kewzlqpd+ysmouZCVSKpnBltmHmk6xGISrcghFCA71JBBr+4tK6MReu7VAffMLXY
I9fCQrRXQQuTVSl5Ra5+KJ0JmBtFA5ZAmO65zlZJYAuyfv8rkobcCCDm2LkV5IVp
iODgylIBepxRm8i5G27o1J6XPQ/piFN8evibzyxah+w+XXE6HjoZSgdCrfvkPhhj
PM68vtDF2cKGJjiW4mPDuukwpPOq5gkkN8JTScKR0sLe14Gl9aTPuUvwue+MleCG
QcjJZyzJDnBrmc6KHrXc3mL8R6ngHMFXLIi4UXWIjdTtPKdDxGROIbdwqL7xyZz7
/j6yoXwkDD0omeqSTVBxREKfgh1TM1TxWFJOeDJ8BHU1ry4GyimZikqtLxdrUft4
miwmMDLtbNwwbXGE+1l2KwHldTshqziTK7y5SQD4kolWQ/gdfFIyC/el66d6TVdN
AmPjg19Ch6GO72pPdRGIIVUyCaAFbVt5qZY9m4HGCnh5D4Jy9t4=
=FW94
-----END PGP SIGNATURE-----

--Mb75oF894V+AEvOD--
