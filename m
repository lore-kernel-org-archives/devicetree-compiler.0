Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9102EA742
	for <devicetree-compiler@vger.kernel.org>; Thu, 14 Aug 2025 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163692; cv=none; b=DGNw5ut9rDYjEiUCisiJVhbVCcPTy0vEL9wAIkx19flrNSMwhDT9Y3E+boQjSNyC8Xu9x48S0aA3e28HJZ3HPbXiKZBEggWBLGs3pr5wBYE4Kd5tSF/OP1axdceflzFzlaoLvxQn8lEz9O38vjkI+xDrIWC2I8OxMaR5tOdwFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163692; c=relaxed/simple;
	bh=J5JdpZTVTsQwjso+capu5l6j07iWn5jRBwnPy8RGLDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH2ZKbfisW5e9aDDvGVJzLCaczhD4EUH99ndP6SvyLJv5h110fprmbPkhc/Xu2QJqRKtfzMBOzHUwQXjZNatQoM0Xq7lHLD55MPsSgRE4G5GPN8BBHDyep9crSMtarG4ojqHE7Tn734lQOHmz1deNxfoy2csKlbfmbYPY5WpHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JndVmXt9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JndVmXt9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9e414ef53so576211f8f.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 14 Aug 2025 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755163687; x=1755768487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yz2Xm+Pwujw/GsCOZWCA24+6tfKCH00TxRVwLZFZqKU=;
        b=JndVmXt99cpSuXNXjLOaOdssRtIg7tHY7O7GLqeXysUrH1INTKva0IAJjR1E3IWHkO
         XzI0q7nbzFgNpnmJewdw9VJvpo/ke7bK1ZDAUq/RFZuqx9DPH7WTM+25WNISd5G6bUoU
         gcrHQhZWmmaAIWmiIgMlVTncX8QrnWzh4iiXSjB72aU9JNmy7ObvWySHS7rCjGYXw3E9
         EoKV/Nl79lTHKOsdHQSOSQiCI1FanK7APJcgcSivcLA5fSo9DaSDLD6SjlmHzdrIGm0x
         iKMgVsRiNHFTzYwuGMFgta886/XsgxO8dWqyEmoxD2W9WXUdOA8Ht9XsGY9+CzLZjBIC
         KR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163687; x=1755768487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yz2Xm+Pwujw/GsCOZWCA24+6tfKCH00TxRVwLZFZqKU=;
        b=A60hLK/EiRW1NHF6t+Jj3QD3sBKXhDk4+ydnrDx0m2lJ+sG2mKIg22nKfcJphjBI8v
         L7GHw2xj5kH3IW5jR6ckpsSj1s9NK/Vk7hPmnfj8ave0bxYV1w/HaUYjEYfOLZMu6px/
         H+dx5lQinPBSozXuzcf1GQ1aAbYf3vgt3CW8ReL93AHS+EcSgPi+2H0dRBGn8+b10ubp
         zW8MFUNXAXQEeZUqdxCrqXgSVPH3p9oue4KoRYrCSWqohHBfBFcNf2LB6yc0aEOx/7UV
         aNlH3HHeBwcRmjHI0ZFnOY3A24Jxv/WQRQrUBDcFhvSd6GlLnWRXSOluvzvNt59f35OE
         B4gA==
X-Gm-Message-State: AOJu0YzmG/CU65r6dGvDbI2MJmoX0fVqcyO8cQZHt3oK/8Sa5T2EqJjh
	aaydBvfp+iMTSF2ObQ0Yld4PNjhQeESBDzMc61ImqRP+KuQSQhAL68AAVTg4k8rGh03LatWjzX4
	M1gx4
X-Gm-Gg: ASbGncuERItY9N3NDB8y68sXbAGshb7MGrAcnbDxgV+7/7nK0oP3lMsixfOONCkXML+
	Y5B24KvIRmJMJybGeXkbHhkvseRbdmYvOmtHFEZM06wo3JtZY/FX3TWiQJQTgoCHR2WzQiPJS52
	eU/R04L4c3aj4EjrTw9mxInZ5YA+hsqMzUY2uhmBHDB/hJ+VT/WZyiL02usQckzSKbMuJyxSIrJ
	/nMphaT6SrciBuW3ag9oKQ19dsP0/q/kMvnu9nOa4VZEgJeMJDA3wpeShKHHBWdzEGUtRjnnoh4
	akyJ2M5R54pPS6S+/Nd/t6aVIE0L+QD+ORI4/B2vIBXTDIuO4jgyS0aT65v1YiM92sJ8DrFHOPv
	l/tXAm+xXXgnyELFnwPMKpobATm61m+6zHQHRS3+wCiv3eg4gqLMFnh2rr9/fAMA0
X-Google-Smtp-Source: AGHT+IHMKqLuN5V5npDHDHKT2KpG59xQFGRkXri7rdVBzmXo2vGEnvhNYGX9TRlflbXlq14fqwDuEw==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3b9edf45fc3mr1919297f8f.49.1755163686759;
        Thu, 14 Aug 2025 02:28:06 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm50189567f8f.47.2025.08.14.02.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:28:06 -0700 (PDT)
Date: Thu, 14 Aug 2025 11:28:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] livetree: Add only new data to fixup nodes instead of
 complete regeneration
Message-ID: <5dq25ou33jmacamic4k4w627r4mi574pd6gc25t4yztakawfrw@77qx576xdo7y>
References: <20250801160031.624886-2-u.kleine-koenig@baylibre.com>
 <aJ2R6LDucXrOFgZW@zatzit>
 <eoqc474y7alu7bbofhkilh2urifqjzj2bimtmetctqcho3usxe@ncwxjr6v2mps>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5afjnfh3tijrb4yy"
Content-Disposition: inline
In-Reply-To: <eoqc474y7alu7bbofhkilh2urifqjzj2bimtmetctqcho3usxe@ncwxjr6v2mps>


--5afjnfh3tijrb4yy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] livetree: Add only new data to fixup nodes instead of
 complete regeneration
MIME-Version: 1.0

On Thu, Aug 14, 2025 at 11:05:02AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Thu, Aug 14, 2025 at 05:36:08PM +1000, David Gibson wrote:
> > On Fri, Aug 01, 2025 at 06:00:31PM +0200, Uwe Kleine-K=F6nig wrote:
> > >  livetree.c              | 75 +++++++++++++++++++++++++++++++--------=
--
> > >  tests/retain-fixups.dts | 29 ++++++++++++++++
> > >  tests/run_tests.sh      |  5 +++
> > >  3 files changed, 92 insertions(+), 17 deletions(-)
> > >  create mode 100644 tests/retain-fixups.dts
> > >=20
> > > diff --git a/livetree.c b/livetree.c
> > > index d51d05830b18..24f7c561d77e 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -356,6 +356,60 @@ void append_to_property(struct node *node,
> > >  	}
> > >  }
> > > =20
> > > +static void append_unique_str_to_property(struct node *node,
> > > +					  char *name, const char *data, int len)
> > > +{
> > > +	struct data d;
> > > +	struct property *p;
> > > +
> > > +	p =3D get_property(node, name);
> > > +	if (p) {
> > > +		const char *s;
> > > +
> > > +		for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr(s=
, '\0') + 1) {
> >=20
> > This isn't quite safe.  You check s is within bounds on each
> > iteration, but if the property is malformed and doesn't end with a \0,
> > the strchr() itself could read beyond the property's bounds.
> >=20
> > strnchr() could work, but is awkward: it would return NULL if there
> > are no further \0 within the property, and on most systems NULL <
> > p->val.val + p->val.len would return true, so you'd have to check for
> > that case separately.  You could use strnlen() instead, but that's
> > also a bit awkward - it doesn't include the \0, so you'd need to add
> > +1 - but in the malformed case that would put you one beyond the end
> > of the buffer.  That would probably work in practice, but creating
> > pointers beyond the buffer they're within is technically UB.
>=20
> fair, my approach would be to check p->val.val[p->val.len - 1] =3D=3D '\0'
> once before the loop.
>=20
> > > +			if (strcmp(data, s) =3D=3D 0)
> >=20
> > This also relies on the \0 being there.  Any fix for the above, will
> > probably result in being able to get the length of each string segment
> > fairly naturally, so it would make sense to use memcmp() instead.
> >=20
> > > +				/* data already contained in node.name */
> > > +				return;
> > > +		}
> > > +
> > > +		d =3D data_add_marker(p->val, TYPE_STRING, name);
> > > +		d =3D data_append_data(d, data, len);
> > > +		p->val =3D d;
> > > +	} else {
> > > +		d =3D data_add_marker(empty_data, TYPE_STRING, name);
> > > +		d =3D data_append_data(d, data, len);
> > > +		p =3D build_property(name, d, NULL);
> > > +		add_property(node, p);
> >=20
> > You can add the property first, then share the data_append_data()
> > logic with the previous case.
>=20
> This is mostly taken from append_to_property(), I will check if your
> suggested improvement will apply to that one, too.

I think that would be:

diff --git a/livetree.c b/livetree.c
index d51d05830b18..2ccdc9d9c2a7 100644
--- a/livetree.c
+++ b/livetree.c
@@ -344,16 +344,14 @@ void append_to_property(struct node *node,
 	struct property *p;
=20
 	p =3D get_property(node, name);
-	if (p) {
-		d =3D data_add_marker(p->val, type, name);
-		d =3D data_append_data(d, data, len);
-		p->val =3D d;
-	} else {
-		d =3D data_add_marker(empty_data, type, name);
-		d =3D data_append_data(d, data, len);
-		p =3D build_property(name, d, NULL);
+	if (!p) {
+		p =3D build_property(name, empty_data, NULL);
 		add_property(node, p);
 	}
+
+	d =3D data_add_marker(p->val, type, name);
+	d =3D data_append_data(d, data, len);
+	p->val =3D d;
 }
=20
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)

The test suite is happy with it. I will include that with the next
revision of my fix patch.

Best regards
Uwe

--5afjnfh3tijrb4yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmidrCIACgkQj4D7WH0S
/k7qZwf+NrKv/v0OSHXcIrdsqjDTXDZDrBY2I+w8e0G80zL/IIE7JW8qjDXycreJ
SG5F2zPPS0scJbOkJ8JcSUjawJUZbekQj4qYsndPYbVFoWRCQJJGXeFvgcaW09Rf
UdX46XZnMFyC8O/iFQ1Up1WZ+3D7suCbEkwXgYfUGDKr85On1qO/sQ30U6RNNI5P
xIcbsJl/OKurUp/DkSQ6OwKNBciO5CW35Q8H+b7kti749lP08YxyzltXq/d1v6f8
wPhA3IrYDazbSUPX2qyovae0lebHZmWuM8oRajKC4gL6SBmaB0lNLy1BqVlqAzFM
SuFC639tTonQb437MRl5KY5DIpsGDQ==
=c9jj
-----END PGP SIGNATURE-----

--5afjnfh3tijrb4yy--
