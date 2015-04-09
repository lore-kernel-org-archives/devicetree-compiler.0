From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt/tests: Add fdt_path_offset_namelen() test
Date: Thu, 9 Apr 2015 11:25:02 +1000
Message-ID: <20150409012502.GL28909@voom.redhat.com>
References: <1428206756-27160-1-git-send-email-peter@hurleysoftware.com>
 <20150407044942.GC3476@voom.fritz.box>
 <5523BBA7.8090504@hurleysoftware.com>
 <5523C326.7010603@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EEx6GiKZGZ1wKUra"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5523C326.7010603-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--EEx6GiKZGZ1wKUra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2015 at 07:44:38AM -0400, Peter Hurley wrote:
> On 04/07/2015 07:12 AM, Peter Hurley wrote:
> > On 04/07/2015 12:49 AM, David Gibson wrote:
> >> I did spot a case where the existing code is arguably incorrect: using
> >> fdt_path_offset_namelen(fdt, "/somenode\0foo", 13) will return the
> >> same as fdt_path_offset(fdt, "/somenode"), although I think ideally it
> >> should always return -FDT_ERR_NOTFOUND, or some other error, since
> >> node names can never include \0.
> >=20
> > Ok, I'll fix that.
>=20
> I think your memchr() is broken.
>=20
> Patch below passes with the following output:
> ....
> Checking offset of "/subnode@2/subsubnode@0/more" [first 24 characters] i=
s 380...
> Checking offset of "/subnode@2/subsubnode@0/more" [first 25 characters] i=
s -1...
> Checking offset of "/subnode@1" [first 14 characters] is -1...
> PASS

Huh, weird.  I had a similar test to this, but not identical and the
other day it failed.  Today, your test passes for me, and I can't
remember what my test was or otherwise trigger a problem.

Oh well, I guess we just leave it for now, and debug if it ever
appears again.

>=20
> Regards,
> Peter Hurley
>=20
> --- >% ---
> diff --git a/tests/path_offset.c b/tests/path_offset.c
> index bfebe9f..2788957 100644
> --- a/tests/path_offset.c
> +++ b/tests/path_offset.c
> @@ -133,5 +133,7 @@ int main(int argc, char *argv[])
>  	check_path_offset_namelen(fdt, "/subnode@2/subsubnode@0/more", 24, subs=
ubnode2_offset2);
>  	check_path_offset_namelen(fdt, "/subnode@2/subsubnode@0/more", 25, -FDT=
_ERR_NOTFOUND);
> =20
> +	check_path_offset_namelen(fdt, "/subnode@1\0foo", 14, -FDT_ERR_NOTFOUND=
);
> +
>  	PASS();
>  }
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EEx6GiKZGZ1wKUra
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVJdTuAAoJEGw4ysog2bOS0KkP/3cPRK08SW3IgcI393tHPrIB
Wfmk/cr6c5aWGBVYdsEHOtgVJSm5YXJ/2VlEkz3KNjJ699pZ7LJ04yaGsDpUymJs
FfVP4vGL268ahstbSmvwBr97FJIM6b7TX99F+1eoCZQvogCBUSdZ6LG2hVK95ao1
a+YBSXf7RmnvvUU5CDNWJAevpm1sc5N0cJQVADxgNWuRiauAoib2R0REaXUn6dfg
A9oA0fM0AiReZyuyZ/gPcsqH41bUkTMTvefj6B+66iFreFlEjoL9jtG76Huhr5B6
mW6TSJMKvQ1or7ppqDDLwmXxBiybj3foCjyyBL+993USIaFzPJDSya6RCxIdJW0y
SlBNhcvWoIv6aFs+er8lqyew2/WL7EXv9igvUpdIifa7guuUR8X9Q30KrtcyR78d
kRGjSjLN50FWrYYmoJPUsqlpwFhuemxH44KjHnhJTJazuXTzfo6C53TDgM+eZPAQ
V5mjJ3nGWd45yxsJmrrLFJDueG8f4Rm16lggMwHL+Z05UA4zASeQXt3askdjGxZJ
r6vcrqVIbOMJ+NVZeYr4OA0W83ZG7o9HJPPmc/QhzKxtbfeY4yx/uOUvH6X08sIX
2KtPMIAjQZtWN9ZwXryXGYy/XotbP7Pkx7GuhpTh44qy1qGTaxhXY7AIVDlEJSVN
YGWyDtSm/mB8TWLFHln4
=ipWz
-----END PGP SIGNATURE-----

--EEx6GiKZGZ1wKUra--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
