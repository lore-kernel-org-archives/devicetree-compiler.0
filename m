Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E12F6582
	for <devicetree-compiler@vger.kernel.org>; Thu, 14 Aug 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162307; cv=none; b=dnVKFNnsGO7qTxGT8d887l55rnZw/YR6gyhebHZNQ20gFTUXmzzdYvZbdvM0NHyvkoRXwrWVX5R7gSiFsjYzPliMU/qz3J1xrbht5XrWpp+QN0hKDuBN/NZmrNv7mamTNQ0OWTD69yQQc4Tw1zwLrqSh5TrPTnDmsQYm5xDz/sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162307; c=relaxed/simple;
	bh=dLl+UTtavGdFqvZPlksTOkJrwBRr0t9j7mfEcPQ7Byc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l638Fuj+WlQeU9OUtzIooNA7T/rWivshveTH/HDO+rKQiE0BAc/aKv1XCk6VmMReKkRaMZ84UcKxJyHmbiCEmycR/p+jLjGWBOxg9z49uNoo5ieYmk++6GclVwbycd0ngqcrjR0uSCSU8JXCutN9XaSnP9P7u7eyTNg8L6+G5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0mZxfXQQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0mZxfXQQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9d41c1964so363686f8f.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 14 Aug 2025 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755162302; x=1755767102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LbzGa3IKggqFbUkd/JjUjcB0jiq1FxTTQkuel1UW1Uc=;
        b=0mZxfXQQO/8te5wUT719fgaB1s+y8YE5rT9wjnPFqkgNSa6R0ulNsxrH8ebg5qBrLb
         gZLhjG2bxBuxCrjnjBfRMBHqCPS8WZSEkKk85WsPq0EPc+4EA07A697/4EQxucEiWGv2
         93rJ9TNKtsEcQgsBxoR03q6MeVDxbcMa1lO3CoJ5xkiwB+ndUT1M/KILZHDvAHmIw6+g
         1IfLtdofeIGRcjOhQI/6+hdJTrFr6ArLlWgGpaPiXO++SJTJZ1i/w5Pw1UTeDidLWg8t
         jPR/4xNxMX7AYXGSkSLATdeA+zMebjYaVkBpq0w9y9+hR3ZhCQjL7p+RT7FNZeux3lTX
         fhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755162302; x=1755767102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbzGa3IKggqFbUkd/JjUjcB0jiq1FxTTQkuel1UW1Uc=;
        b=c8Kxp8cCmpRe38FS/QCTQOzo/7b2MundCCwwfjyPY6c7drmaBQgaUHRnGoOKZD2KCE
         xWYw/XUHnoKY7t9CG56xOxj7GqR4wSG4fGAQrW4yQ8NhNdE5vBr6JQThjgFOkKzIKtSN
         /HdX8qaD0ZNCh7fAQcpp2k2GHw1jP37ggxUBK177fa1ngUdL+bozjCCLyXVpob8ncKfS
         +wpflJoY0s8vOrfJ9C3pwvWb6q2HMEB7A4NiP3iojspMI9ESKQ+cH9a1bxP8AoIi6DCM
         z+o5IAY99FB0zpbtwKM3ao5FFr82YlZrxCL6pGWVRyA0pNSefiz5AX5dZXBvRl14Mw7x
         MCjw==
X-Gm-Message-State: AOJu0Yy5yjDX1gCkPwjp5n8qREQzAgotOBKpTsc25kxHtzEW0XlZUkPD
	VQisYe3fNLWoKq+SfU3RwNewrrXuL4CImLWqDHH0ixm8ZTwbhq9KvQO/LLpnnKlkpb6UfiVEfYR
	YImI5
X-Gm-Gg: ASbGncvbdLRV+2Iz3veFA9ZtD/JYRYmwsZ8eKINxw5y4X1JYMNY6x+dLgGI3OEo7YDU
	gJ76dMHrMSAAPt9CpcUgnSoy4b6Wd2hD4qY6FXiZ7Kr7cQekJaDTENBAaO3BVE7bxUxIyE2n5eq
	5RwJiRoz27m4TKm1hEJI8juqpAAE+C5kjs8MOk6pAG97uldIizO0anbph0xLG3raeBcRFx4UB+2
	e1Spb/5SS6N3OFrRStyVrtjRKkBOpteOGSZ4YljlQFSIOWopZhxbxylahLVeFF8XvaKI3OmcUUq
	bvF8NP2RPGmcd+LDIYhgrRghyLzzJ2R3mXSGW4eDp+qQGmLv/V1nkih6hA2i3gPwr9cFOkc4iZd
	6ev53kYB3bPur4MURxc+wiz4KdL6IHb06Wnm1l9qanWA5cqXzyq/EPY4Mun1O9NOUgIm9DCQCaL
	U=
X-Google-Smtp-Source: AGHT+IGgOmUGMoJT+0j+2sy7bE64cA0YbtFD8IxYiKCSmEfqkIfI4yWyZpcqy6To52ZkiLUaGik8SQ==
X-Received: by 2002:a5d:64c3:0:b0:3b8:ef61:bab7 with SMTP id ffacd0b85a97d-3b9fc35955cmr2117463f8f.27.1755162301893;
        Thu, 14 Aug 2025 02:05:01 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ba50f369ecsm1533852f8f.48.2025.08.14.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:05:01 -0700 (PDT)
Date: Thu, 14 Aug 2025 11:05:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] livetree: Add only new data to fixup nodes instead of
 complete regeneration
Message-ID: <eoqc474y7alu7bbofhkilh2urifqjzj2bimtmetctqcho3usxe@ncwxjr6v2mps>
References: <20250801160031.624886-2-u.kleine-koenig@baylibre.com>
 <aJ2R6LDucXrOFgZW@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogk5kdqiuvtudkod"
Content-Disposition: inline
In-Reply-To: <aJ2R6LDucXrOFgZW@zatzit>


--ogk5kdqiuvtudkod
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] livetree: Add only new data to fixup nodes instead of
 complete regeneration
MIME-Version: 1.0

Hello David,

On Thu, Aug 14, 2025 at 05:36:08PM +1000, David Gibson wrote:
> On Fri, Aug 01, 2025 at 06:00:31PM +0200, Uwe Kleine-K=F6nig wrote:
> >  livetree.c              | 75 +++++++++++++++++++++++++++++++----------
> >  tests/retain-fixups.dts | 29 ++++++++++++++++
> >  tests/run_tests.sh      |  5 +++
> >  3 files changed, 92 insertions(+), 17 deletions(-)
> >  create mode 100644 tests/retain-fixups.dts
> >=20
> > diff --git a/livetree.c b/livetree.c
> > index d51d05830b18..24f7c561d77e 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -356,6 +356,60 @@ void append_to_property(struct node *node,
> >  	}
> >  }
> > =20
> > +static void append_unique_str_to_property(struct node *node,
> > +					  char *name, const char *data, int len)
> > +{
> > +	struct data d;
> > +	struct property *p;
> > +
> > +	p =3D get_property(node, name);
> > +	if (p) {
> > +		const char *s;
> > +
> > +		for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr(s, =
'\0') + 1) {
>=20
> This isn't quite safe.  You check s is within bounds on each
> iteration, but if the property is malformed and doesn't end with a \0,
> the strchr() itself could read beyond the property's bounds.
>=20
> strnchr() could work, but is awkward: it would return NULL if there
> are no further \0 within the property, and on most systems NULL <
> p->val.val + p->val.len would return true, so you'd have to check for
> that case separately.  You could use strnlen() instead, but that's
> also a bit awkward - it doesn't include the \0, so you'd need to add
> +1 - but in the malformed case that would put you one beyond the end
> of the buffer.  That would probably work in practice, but creating
> pointers beyond the buffer they're within is technically UB.

fair, my approach would be to check p->val.val[p->val.len - 1] =3D=3D '\0'
once before the loop.

> > +			if (strcmp(data, s) =3D=3D 0)
>=20
> This also relies on the \0 being there.  Any fix for the above, will
> probably result in being able to get the length of each string segment
> fairly naturally, so it would make sense to use memcmp() instead.
>=20
> > +				/* data already contained in node.name */
> > +				return;
> > +		}
> > +
> > +		d =3D data_add_marker(p->val, TYPE_STRING, name);
> > +		d =3D data_append_data(d, data, len);
> > +		p->val =3D d;
> > +	} else {
> > +		d =3D data_add_marker(empty_data, TYPE_STRING, name);
> > +		d =3D data_append_data(d, data, len);
> > +		p =3D build_property(name, d, NULL);
> > +		add_property(node, p);
>=20
> You can add the property first, then share the data_append_data()
> logic with the previous case.

This is mostly taken from append_to_property(), I will check if your
suggested improvement will apply to that one, too.
=20
> > @@ -1056,29 +1110,16 @@ void generate_label_tree(struct dt_info *dti, c=
onst char *name, bool allocph)
> > =20
> >  void generate_fixups_tree(struct dt_info *dti, const char *name)
> >  {
> > -	struct node *n =3D get_subnode(dti->dt, name);
> > -
> > -	/* Start with an empty __fixups__ node to not get duplicates */
> > -	if (n)
> > -		n->deleted =3D true;
> > -
> >  	if (!any_fixup_tree(dti, dti->dt))
> >  		return;
> > -	generate_fixups_tree_internal(dti,
> > -				      build_and_name_child_node(dti->dt, name),
> > +	generate_fixups_tree_internal(dti, build_root_node(dti->dt, name),
> >  				      dti->dt);
>=20
> It's not obvious to me why this change follows from the rest.

The relevant difference here is that now it's unknown if the __fixups__
node already exists. build_and_name_child_node() only works if it
doesn't exist which isn't ensured now any more with the lines deleted
above.

This is a revert of 915daadbb62d.

Best regards
Uwe

--ogk5kdqiuvtudkod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmidprkACgkQj4D7WH0S
/k4yJQf+O8DKvh0STKde55yNmvJbhWoc6L/3LzT9LIkqBycskIK7ZqiYnNZ4LoJr
mz8eOGGtaczTaN5/iDrGfqS+fIWCng4xtWkD4GX8k9G9zqLAE/gIOMYALxm5LhdY
7mVRG4d/7DItQ+mqrKBbyQ6ODCa9DDTvknvNSZMD6+xVRb4If2m2+GT6Hw39z9oq
0j+50erPQVh1LRZagcllXF7xEbqReBBD3tzE9I3NEtLN9LUUa1NJ6atY5LdE/2VX
ymgftJcgCslUijRHIPJ2sMb9J+rfzvtyvUR18eY1YivWMxccsI+wFKy3WMBeu45w
Scr1ZGRhoHT/rXuCkJ3Y9TO7BcoJrA==
=HL7z
-----END PGP SIGNATURE-----

--ogk5kdqiuvtudkod--
