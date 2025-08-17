Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808827FB2D
	for <devicetree-compiler@vger.kernel.org>; Sun, 17 Aug 2025 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755427270; cv=none; b=Dj9XCVuu4Ank9ZbEQ7kQoJP389ovnDDqIxiIWqfiS8fEHlkIaEBdxzVmJL8yy7SzGaLFaG6J+t0wIxukBEvmgJORq6EQOMjJRWHsOxGpv7Ba3ouuWt/aDx/H1wxTbYr9MxuCahCMgzUYaN/RKwRiP2eIUxe8hMo1kSyydPBHdOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755427270; c=relaxed/simple;
	bh=ZpKuBIdveMNFMTmhFxX92e9il2p4pvhleMZ2l8og0BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS48HqV3OPgD6st0GIbI4+h5hGZdY4ATB8eR/ZKGUNbEgV21mhWpZezd0y1U+xmM9eREHmJaPdARHcLcvGVnGwYtiH6NsbnB8nj0J4TZwmZjA9bYYdO/+Jvo8FSZJi07HHIVt19GfvkC2l5J/0nTu6C/ZHu0GBNAdHriO/sTdDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DVB2rbE6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DVB2rbE6"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb78c77ebso521031766b.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 17 Aug 2025 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755427263; x=1756032063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2pFN2GNMyMCMFzT8pumrAoVLngUQFNt3YmT2u8isq8=;
        b=DVB2rbE6UzYclyqkUiw8UqIwynZnX/xF79Jy4JGO6LlIkjYwRwFHQdgZDp5XTB/qUY
         aeD5IlwtB0+V58xlrISQcslaxuqXDdJbGxyTG/InsupbOIl8zZGE1l7p3DZ5HJ/gGatB
         dz6zunxL5G0nTwZnRTpF+uDT3elHsS4/yC+Pykg151WOiqOLinOIs9vcSLSNAiRZ++zN
         CypVUUwMrSpfUouyeYflalCGcJfZacUu6tdJ4dXwM1hrifG7rwfqF/csJCGLfoZUADs9
         OtkxIEYwjlXjCM1XP+UlHwFWf1PL1MCWFCiqT7reNST/1fPNGYYsCpNmxVMQY3f5fIwa
         0CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755427263; x=1756032063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2pFN2GNMyMCMFzT8pumrAoVLngUQFNt3YmT2u8isq8=;
        b=s54bw3T+stU5vOBZPnRDv9A2ldffYTJdTWT2C5Fx29AUfU3Bg9CrawRLOVKCjTM0bR
         eMff1gkIeB/oXg8cx6cGMk/c6uzg5CewX8eR7PcGjvyblC5MKoppUk6V4WUkvLKaHWWu
         jYrTzTi7ILGcoB+bVsOr2jfXM1spglhwp//aaBguIDlL9ZUolRjUJnWNaL+phW+o+heh
         Y/kWPkk6IPMaAhYRy8bG8mPHnTcg77oibegKjq8g9sIH2svVLM/DAYvMEMDVrQ9hSCP3
         JLEPcW8CVu2sjo0TBPgGQPVVXNsFRpVsvKZnImhCmmOtPjRR5D9xykC6mvya1RUcgGcr
         vIUQ==
X-Gm-Message-State: AOJu0YzCb9J1F6zprW9yX1iO2rs0O1wqslbkm5GPWUc0l+cwBkzY/qZ4
	YvMPU9XLkLh+VNpXozfVY6jobVn9+qbtfAB+H+PnCAZi+o2D4IkmadcjQrv2PHvLOifLEqcsfnm
	r5V1h
X-Gm-Gg: ASbGncuB3QcZM2JXumQCso5Is8s0Cl0cx5/lmEmaWOvT66ypJxkUf7BhQFEftnLZ8/J
	hcy7dZw5qJOnfje756dCDXRhr12Kprm9FW/HgUHnpGb252x1RsZ3YpQb5C+2grm9AOf2zUUpOCH
	T1w0wSIe3Yk7eUdSdsah4i6Dk/K+PDie/f7m6qnX3N8w7Al0ViyAT2wU22e7pFyVLlI9u1WK8jF
	p0lt2DBsM1j2/VAMLp3d9YynQV5ITMjPIC0b05wRMuD3E9YLt50mSLMAmMd1kQUrkPOcYMwWdKC
	v6+LKWQ5R5OlsT2EfZOwcje1P4ofQ20M+k1y+1eBoVHZ2U4DIxI4hc1uXxK2MjP41rt30frmuSo
	vHmb5tCxOJrHtNwToZhrnOjGSeAI=
X-Google-Smtp-Source: AGHT+IGHX+IujRCHtUdJSiJPNGPGUv26CqR1BOCvaiIjx7Xdg9v1qv7GnX3FyF0hktLceXPXW62CoQ==
X-Received: by 2002:a17:907:6e8a:b0:af6:a10a:d795 with SMTP id a640c23a62f3a-afcdc3dd6e5mr799230866b.55.1755427263079;
        Sun, 17 Aug 2025 03:41:03 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afcdce72defsm577467966b.47.2025.08.17.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 03:41:02 -0700 (PDT)
Date: Sun, 17 Aug 2025 12:40:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 2/2] livetree: Add only new data to fixup nodes
 instead of complete regeneration
Message-ID: <2jywkljpilxb654diunhguk7apu5st2cotkgjjvyn25cpq6slx@e5ufgjcipzez>
References: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
 <68b0f2845c5b7b439c3d5decb518ec3e236c426c.1755264521.git.u.kleine-koenig@baylibre.com>
 <aKAPA4EAI_RAm64c@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jtlbjrphtjsnmfcb"
Content-Disposition: inline
In-Reply-To: <aKAPA4EAI_RAm64c@zatzit>


--jtlbjrphtjsnmfcb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] livetree: Add only new data to fixup nodes
 instead of complete regeneration
MIME-Version: 1.0

On Sat, Aug 16, 2025 at 02:54:27PM +1000, David Gibson wrote:
> On Fri, Aug 15, 2025 at 03:34:54PM +0200, Uwe Kleine-K=F6nig wrote:
> > Removing the complete __fixups__ and __local_fixups__ tree might delete
> > data that should better be retained. See the added test for a situation
> > that was broken before.
> >=20
> > Note that without removing /__fixups__ and /__local_fixups__ in
> > generate_fixups_tree() and generate_local_fixups_tree() respectively
> > calling build_and_name_child_node() isn't safe as the nodes might
> > already exist and then a duplicate would be added. So build_root_node()
> > has to be used which copes correctly here.
> >=20
> > Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups__ =
nodes")
> > Closes: https://github.com/dgibson/dtc/issues/170
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >  livetree.c              | 75 +++++++++++++++++++++++++++++++----------
> >  tests/retain-fixups.dts | 29 ++++++++++++++++
> >  tests/run_tests.sh      |  5 +++
> >  3 files changed, 92 insertions(+), 17 deletions(-)
> >  create mode 100644 tests/retain-fixups.dts
> >=20
> > diff --git a/livetree.c b/livetree.c
> > index 6127d604d528..f23988483b01 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -352,6 +352,60 @@ void append_to_property(struct node *node,
> >  	p->val =3D data_append_data(p->val, data, len);
> >  }
> > =20
> > +static void append_unique_str_to_property(struct node *node,
> > +					  char *name, const char *data, int len)
> > +{
> > +	struct property *p;
> > +
> > +	p =3D get_property(node, name);
> > +	if (p) {
> > +		if (p->val.val[p->val.len - 1] =3D=3D '\0') {
> > +			const char *s;
> > +
> > +			for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr(s,=
 '\0') + 1) {
> > +				if (strcmp(data, s) =3D=3D 0)
> > +					/* data already contained in node.name */
> > +					return;
> > +			}
> > +		} else {
> > +			fprintf(stderr, "Warning: appending string to non-string property %=
s/%s\n",
> > +				node->fullpath, name);
>=20
> I don't think carrying on with the operation when the original
> property is malformed is a good idea.  This message will also be
> pretty confusing in the one place it will occur.  I think it would be
> preferable to return an error code here.  The caller, which knows what
> the purpose is can then report that the relevant property is malformed
> - if that's the case, I think we can just give up on updating
> __fixups__ / __local_fixups__.

I picked that option to somewhat keep the behaviour of dtc as it was
before (which appended irrespective of the pre-existing content).

But I don't feel strong and can rework it accordingly to your comments.

Best regards
Uwe

--jtlbjrphtjsnmfcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmihsbgACgkQj4D7WH0S
/k5zJwf/cz2vhsvU0SYcAIGusapY7XzQtSytci2iS8FR4tCsWUpji2qydYApyoLY
Msy7vr6kGFTUECnOJWCFvKnN/WKHFfS7xssW9PnN7+xtzA6MmlNZIpo3GC94jsRw
7aSKn82RQ3Lm3IaJqwo/JcG/87GJaB+Ah/e/tMT8fblOKvG/66I2uJ4QCn7UUyQ6
F3O651eN9pDgpwB6qX/qaVUHxcbynqR11w2URJiAp8Va4ILXTFIgPUhQMCsb5N7M
c2fXpydGsXFAtVwQLGhZ0kJPyXldrpqsKQNqOCK5dOPorCQUxzZqYwZ9En3afDqI
fWL+CpMw6ee62fDEnPy9H4jJ0OwFuw==
=U68S
-----END PGP SIGNATURE-----

--jtlbjrphtjsnmfcb--
