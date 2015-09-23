From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/3] dtc: dts source location annotation
Date: Wed, 23 Sep 2015 10:11:21 +1000
Message-ID: <20150923001121.GR20331@voom.fritz.box>
References: <5600E191.9020903@gmail.com>
 <5600E8EF.6020107@gmail.com>
 <20150922103251.GO20331@voom.fritz.box>
 <56018B92.90305@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jcwRHPSxFqmwpRFb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56018B92.90305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--jcwRHPSxFqmwpRFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 10:10:42AM -0700, Frank Rowand wrote:
> On 9/22/2015 3:32 AM, David Gibson wrote:
> > On Mon, Sep 21, 2015 at 10:36:47PM -0700, Frank Rowand wrote:
> >> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
[snip]

> >> @@ -71,6 +72,7 @@ static struct option const usage_long_op
> >>  	{"error",             a_argument, NULL, 'E'},
> >>  	{"help",             no_argument, NULL, 'h'},
> >>  	{"version",          no_argument, NULL, 'v'},
> >> +	{"annotate",         no_argument, NULL, 'a'},
> >=20
> > I'm slightly dubious about the short form name here, since -a means
> > "--all" in so many programs.
>=20
> OK.  Would -A be good?

Works for me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jcwRHPSxFqmwpRFb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWAe4pAAoJEGw4ysog2bOSvloP/3iXSJ54u3sXEyS6fBAIAaQo
ytEDjr53sqxZYYkSxa2CF7hQl5c2YPJSLrGkQfJko9zr8fS2Z4y+tuOI4W8kzotC
SIN9aek4kLojemjkQZdtgV2drLlpC7veCo4qtFuRAXDZOdFWi7UDNLJKUgwXK+8F
5MQmDvD8WbhLCkRLcKJg5bSzcJ7j6QbgfUdgzBHng1a0NA6JPGja40kMUfuM+pt5
puXBGJ59kYR/MqhH+pMjWuIUWNU7iWuM1ynjqXjvCWPJ6Q7KP4yZwpVZYpjZPkGq
csKnfig4FGqUfRZqlL1sDjaMobOGwy3HSt150YR9gbaVxub5A1G9ByYtmECqsnD+
awsurXVn2AkPqEAn5avtUVFAvltK0NPW6VDFUTcmaLzNW23NCdniP5T0yBwnsbwo
YRshwJfQXtI/oGkALzm6TsOoMeFxyj5dvx23nGdM/mm9wX8+nNqV3V/1aFbLU+kO
Xzl3Lc8BdQxK0cp7jCPFYx07fXHwru97YFiJ46I1umgDEcH2LEbou/CA4cPlv1Uq
1WlgJisF7SuTn0JY0ngmtsxJR6vLGp3EoMMIN8uvgCwQgW6UILESPoRT2moUN7zy
qDK36dVMC+VewljoYUITE5biPIrP9CfazBIuOGmN9adas85FcQlyQzs5w0HAxMQ2
Ed/FwyxR6xc0yLTSufAV
=ifEw
-----END PGP SIGNATURE-----

--jcwRHPSxFqmwpRFb--
