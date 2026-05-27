Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB262229B38
	for <devicetree-compiler@vger.kernel.org>; Wed, 27 May 2026 04:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779856745; cv=none; b=A+sZzBhGZM4rch34pIO4+98wsmRmHQeb8LPCoDm0XMKtDctITo7A7eLAikx1Jx8MFw6IxECMyIvar191Bp1LUdMMVK8l/TM3bO8C9imdWWFSMq4PG/oKhk+or/jaxca3HBVvgmnDY33RQTkWKHIh/VykEWqx/oz+u+hq/fn6kDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779856745; c=relaxed/simple;
	bh=WM3YVH02HqEbzRdd3ziQx955XrJS2UCWqJZReSjAf08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr7ng7yqVSuY2wCloWsYzXDfHUak9xwllTL8JacZmg9tRxrVPpSUESXnAlDE2lP3poL6pIyGEM4MKaRjzKiqoXTO9o5EVTh9E1xbLVxwE2jgdgaPQ+tvK24Ckz2o2PxvN3BPADkGZx6ODOK6WeIBjRHT67heAPycgoZGrfDgwtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=cZPt8jD1; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="cZPt8jD1"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-43acb9730f4so7013846fac.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 26 May 2026 21:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1779856743; x=1780461543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K+IUOxWIACVx2PFBhSwPMCDVQfK423XMOJocqyTIVV4=;
        b=cZPt8jD14WPKMXrrH4SY+GV9VATi39hTRxEfhhJgxmI0yTFvzmTPSISIbyBzar9BDm
         38Urg+fbpN54OcGtHCFwlDoUu59kqMh9wBg44M74EFO8zZQveph/zqgwUAhlhkhMgRDK
         a2f5zGS3g+E2SyU8lR+A+dROS7jxM5sp+x2JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779856743; x=1780461543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+IUOxWIACVx2PFBhSwPMCDVQfK423XMOJocqyTIVV4=;
        b=B/FSINsrfQfKOWGAQDvMKOivEtik5u21qX9R2DwlU77xFb9vcja71Yq53l7AH0oRYf
         pHflwliG1CyBFGAVh7H9d1MfCOaRCBT6cnNxnCqbXa/MgEQGyouzPsJBFxw2RFQoDI95
         kx91GZjbyMggZVdpsK2oHjAWdXevCvPt2xEajoN4qZmx2hgUibA3+FI15f4+9umrX4gE
         uL35qKOUnOi9zGCouMkKe00OMiZTW66LrBc8VchiSXvjNrSNCl66qmEzHqXRIJihofR9
         7wItoQeMR69Let5IixLFceoCvCoTJCB/itKGA2jJF5OJRro18q4WOscwur9xkspNupk2
         ZlaQ==
X-Gm-Message-State: AOJu0YyN6fkwF/ZwnXdlP3p3LeTdMtjxPb3dSnea5UsMbwhR4+HKF98u
	/XdlbyrhnoNR+EXfax2V1XzwsPqqQx877BWkplRJt5/up2eUogxFochuRtw3wD6N4qRBzvhrHZu
	UXJRZ47g=
X-Gm-Gg: Acq92OHbbHDvj6DFcP2WffCuQBOn6rxViN1NhHPCnGpTCG3Vq+tkeaoN2GjaNFXd+Ts
	WwzmNU2afu8pwHMqdvlooCzZwXjeEL35ZMf50myVclVosZXrtxshCCb6pxs3XZZZmUEX+98Vz35
	ngUupPbYM7K5zK9l8VKUbpJjJItW6b1H38MOB7dM0u0XCcZJaP8xnkatdimojfzyd+vHo6GZkJk
	kGYV6aiaKGbMBuM/Khy3VHjQz7QnFw33WDvO0PXbwx61bAlUjmrd/l584uWOdyI6vtVFyefieYA
	nZAbgE+vh1vd0dy3WeDC8fvBBVdeIg81pzRGuyE8nJf3mu6hymrIrnHxh70RGXDp6dVJaa0wxyh
	m9yXGQjUNOzk+9qsKk+vcbTtLGjMjcYHrs6IMfeqeE/K1E9dN7EHWFViJTOugmQ6fvoRPVLIK8F
	W3EI132xkyxwxPSz8p/yvRcL5r05osT5iVTeTmqmkIRAI1l1LpxO38nNEVADQCu2sVkA2wPMsBq
	NZMi25z9BYTOJ4SuEiYFZrcat0DAICLnmBMNQQwUOjk1g==
X-Received: by 2002:a05:6870:8983:b0:43b:b395:f0a7 with SMTP id 586e51a60fabf-43bb396132fmr7668269fac.9.1779856742818;
        Tue, 26 May 2026 21:39:02 -0700 (PDT)
Received: from bill-the-cat (fixed-187-191-8-235.totalplay.net. [187.191.8.235])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b63a7cfe6sm14384178fac.17.2026.05.26.21.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 21:39:02 -0700 (PDT)
Date: Tue, 26 May 2026 22:38:59 -0600
From: Tom Rini <trini@konsulko.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
Message-ID: <20260527043859.GC1858239@bill-the-cat>
References: <20260526203022.4006434-1-trini@konsulko.com>
 <ahZxuCONf2JfMXU8@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TyBL2h1I8DdC0IMw"
Content-Disposition: inline
In-Reply-To: <ahZxuCONf2JfMXU8@zatzit>
X-Clacks-Overhead: GNU Terry Pratchett


--TyBL2h1I8DdC0IMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 02:23:20PM +1000, David Gibson wrote:
> On Tue, May 26, 2026 at 02:30:22PM -0600, Tom Rini wrote:
> > In this function from fdt_check.c we have (reasonably and as the name
> > implies) a number of checks on the DTB. However, there are cases where
> > we may wish to assume that we have been given a perfect DTB already and
> > do nothing here. Add a test for can_assume(PERFECT) as the first check
> > in this function and if true, perform no checks.
> >=20
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > Along the lines of the patches I posted back in December, in U-Boot SPL
> > we just don't have the space for this check much of the time and so have
> > always omitted it (going back to at least when Simon posted the initial
> > patch to make libfdt/fdt_check.c here). This is another case where it's
> > a noticeable size win for us. I had missed this change in particular
> > because we had in turn missed catching up on fdt_check_full being moved
> > out of fdt_ro.c and in to fdt_check.c.
>=20
> I'm not necessarily against this, but I have some misgivings.
>=20
> fdt_check_full() is (deliberately) not called from anywhere else in
> libfdt - it's intended to allow the user to explicitly do a full
> validity check on the tree.  Given that meaning, I'm not sure it's
> wise to turn it into a no-op based on the assume flags.
>=20
> Your comment seems to imply that the issue here is size - simply
> having this function compiled - rather than being too expensive when
> (explicitly) called.  That's a little surprising to me - it's in its
> own compilation unit, specifically so that the linker can omit it if
> it's not used.  Is there something unusual about your build
> environment that's not letting that happen?

So, we have code like this:
        /* Get the total space reserved for FDT in blob */
        live_fdt =3D bloblist_get_blob(BLOBLISTT_CONTROL_FDT, &blob_size);
        if (live_fdt !=3D gd->fdt_blob)
                return -ENOENT;

        ret =3D fdt_check_full(live_fdt, blob_size);
        if (ret)
                return fdtdec_ret_to_errno(ret);

And this is compiled on TPL, SPL and full U-Boot builds. On the first
two, we're just too space constrained to do this check. So it's not the
linker doing the right thing or not, it's avoiding having to #if the
code directly (or rather, CONFIG_VAL(...)). My line of thinking was that
since ASSUME_PERFECT is that everything is really perfect, this is the
way to go. Yes, it's a little odd to have both "call the validation
function" and "the validation function does not validate" but that's
just because in the second case, we explicitly configured ourself to not
validate anything.

And FWIW, that's really how we use the assume mask in U-Boot, either
0xff or 0x0. It's a case where we're either passing along the tree we
bundled with ourself (and so we can assume it's fine) or it's passed
along (and we verify).

--=20
Tom

--TyBL2h1I8DdC0IMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCahZ1XQAKCRAr4qD1Cr/k
CoDeAQCO9bSyqTi1SDHjR1cXnRetJBtGBuIHNEsfvA+D2kOTRAD+KHZggh+IuCNn
vMIbI4zaDyx8sd3j2+4KvtArtC4naQk=
=s0b5
-----END PGP SIGNATURE-----

--TyBL2h1I8DdC0IMw--
