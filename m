From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Improve portability
Date: Wed, 22 Oct 2014 14:01:06 +0200
Message-ID: <20141022120106.GG2880@voom>
References: <54462F50.4080706@raspberrypi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1EKig6ypoSyM7jaD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54462F50.4080706-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--1EKig6ypoSyM7jaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2014 at 11:02:56AM +0100, Phil Elwell wrote:
> 1) Remove the double parentheses around two comparisons in checks.c.
>    The OSX LLVM-based C compiler warns about them.

That seems a weird thing to warn for, but the result is cleaner
anyway, so I'm happy to apply it.

> 2) Put an explicit "=3D" in the TN() macro, in accordance with c99.

I'm slightly astonished that ever worked.

I need a Signed-off-by line, then I can apply.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1EKig6ypoSyM7jaD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUR5yCAAoJEGw4ysog2bOSFE0QAIl/prwsweW2Rtvq+N4+zvQw
unmcNB429OfJxcbsKxkfEZU6wHz2aeL5I+6pK5lY8qalK0HIZvtNFyeC6AFVQJJ4
tVcqoH75ZXDcdjQt/saWfBqi7mKxq9u1fk7Cis4jOoPOQC4ZXncB6t06SPMuczZB
f9KZvkISIsVQ22KLV1ACOh1SJIlpuePIY7zHguRAa7rLCvVcMB3rBu7lfMYDysHs
Ip0CMCE1j3cTKyBkKPOTnwVR+jMelbF/WbR64/P7OJq0zBheInUbuHuYcw68QPnB
Oz5u+iRX383d46L6l3S/GFyyAHGBKCon9k6aKpphiPCWfuUpQyZsyWaZw865JiTp
9F1wtsLxi5np0g07CCdayZJEjEwT9PCu3v2Ttx1rE+kkf6jzpbCWkTRTKK+aGcaS
/Tq8FQmB8e7wTDTR+orw6Iytgccl0iRKZCVwcu55FscsWC6rz/BVTXb8UjYnH6t5
NWiTHLG0t1+eIY3pyTfTsdqR0VUQjEHOFvQgLV1AdUCGSfxZ3uQV1B8idUkNhKGi
IA3NvL0CvIIDnBYcW/pVFxBj7XWMlgbovv5AWKBiVKR11jv05+dtZ9Ge7XZPpZXt
IAzo/UzKwZQiLSrHvFRs0b1zIdx/+m2Ct6dfgy8ex/NBSpEAIe6GV1T8EAsTbHhS
tF5cDQrYR2uu7j2SVM95
=zbjN
-----END PGP SIGNATURE-----

--1EKig6ypoSyM7jaD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
