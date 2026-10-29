Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239670;
	b=z9Hks4SgYBSra0ieOyvKHf7nWCKOD1awStTvpmzijTmbqCmqOcNbj1LFE5ePiUfKLBGh
	 IR+dhalzJKfDvC2KYAaJG8Tx/Q+8bCpFYFiMAZMe9EpNGV7JDD9EQYPq5Zy0hFPEsObxk
	 J5RcXrW2ppuu1oqgn5rpRCCF4GO2EFpgwWOZfLwH7/w6DovWOeznmm3MFH4RTs7k1Ys+H
	 znV9sGSdUHmKHg2bc3R7vW9IM49bEI66A9Dr1Lti+Z/F5V6YVi5q4G/AP8O2AWTyx8QoT
	 SHSuXCIxiVxSY25c5joEF0yYFae4OagSAhXwKpDx0s3zX3lq7GpaJpk3SoJKkksiw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239670;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=xsWO+UIxVVcl/FQ7fMcjCcETQwZjqKivGkGfVtnpq3g=;
	b=yELPOMxejGr3TNH6QcFz/RsKmOfMwH98f7s97/Yd3CUsmR+Eqb6VobaU40tcgeNU8fDa
	 o3OeotcBzNfXcQ9fbcyTLgRf4p0qVh1AGnE1Lo0ATkm3vPUWyRDV6YkmcD2dUlalU4VSK
	 Bbq9nh6CNUWqunkoCKPTD2ke9UwJOTZSosM1/bUT9XX6JAyDeHBURWquFHFySU/qM4Dcd
	 oHXFpyc9l4vmc/9OFTcu9V27Hhu6IEnL9TQd2ofSmLuD0yTKJVQwcBqP6QxgBzbkzMtG5
	 jKYy4PXoWvxhzmKRU1azB/taqTarJRFFWYX3HIAB2vq7mgytagY1TThyV6ySm5R7J3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=aFZol51k;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ABC606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0ABC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=aFZol51k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793239662;
	bh=xsWO+UIxVVcl/FQ7fMcjCcETQwZjqKivGkGfVtnpq3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFZol51kQBTEwGDDqMBODCSps4Q+dbqqX1mJeKFsbcV1bfZ+2nwskTzLs9SagY5FK
	 JCZwaLOSlPvAR5jORXNCWgOExO5hVsfJCb91klKqWmomSVB0wF8FMFHbB9QY86yecu
	 wheawTnhynNL69tXZhzEIM7lIE5iSn0rsOL3HIrg+yu3i1Z4ctQVRhNbhLao5X2UVC
	 FU1+A3vV0FaxBD/mKxP+C9makPoaMg+mrh3Mw1mE0Y0RSpSh7E5Jf+8n9HiRCYuI0W
	 dLbOf6Vp2ow9tpNGVOy/gZ0EJYIuSeM4wrbZW73+biBUB40lDJKlxQnQX/hBr5LwHb
	 xRe4IRkKo4SjA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFSL60yw2z4wV3; Thu, 29 Oct 2026 13:07:42 +1100 (AEDT)
Date: Thu, 29 Oct 2026 13:02:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] fdtput: Suggest -p when a node is missing
Message-ID: <auKpLvtbaWufFMSr@gractus.seuss>
References: <20261028073440.3327687-1-sjg@chromium.org>
 <20261028073440.3327687-4-sjg@chromium.org>
 <20261028220854.5f7edb4e@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X52aYPsJ9oA6S8nU"
Content-Disposition: inline
In-Reply-To: <20261028220854.5f7edb4e@bootlin.com>

--X52aYPsJ9oA6S8nU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:08:54PM +0100, Herve Codina wrote:
> Hi Simon,
>=20
> On Wed, 28 Oct 2026 01:34:19 -0600
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > When the node being written to does not exist, fdtput just prints
> > FDT_ERR_NOTFOUND - nothing points to -p, which creates missing nodes, so
> > it is easy to conclude that fdtput cannot add nodes at all.
> >=20
> > When creating a node with -c, the error also names the full path, even
> > though it is the parent which is missing.
> >=20
> > Add a hint to use -p when a node is missing, both when writing a
> > property and when creating a node. Report the parent path when it is
> > the parent which is missing.
> >=20
> > Add tests that writing a property or creating a node fails when a parent
> > node is missing and -p is not given, and that the error suggests -p.
> > Add a run_wrap_error_msg_test() helper for this, which checks the
> > output as well as the return code.
>=20
> Nice idea!
>=20
> >=20
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> > Changes in v2:
> > - Check that the error suggests -p, using a new helper
> > - Drop David's Reviewed-by, since the tests have changed
> >=20
> >  fdtput.c           | 20 ++++++++++++++++++--
> >  tests/run_tests.sh | 37 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 55 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/fdtput.c b/fdtput.c
> > index 3c6cc98..b8d5081 100644
> > --- a/fdtput.c
> > +++ b/fdtput.c
>=20
> ...
>=20
> I am ok with the implementation in fdtput.c.
>=20
>=20
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index b3d3f3a..cf978ee 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -181,6 +181,37 @@ run_wrap_error_test () {
> >      base_run_test wrap_error "$@"
> >  }
> > =20
> > +# Run a command, checking that it fails and that its output has $1 in =
it
> > +wrap_error_msg () {
> > +    (
> > +	msg=3D"$1"
> > +	shift
> > +	log=3Dtmp.log.$$
> > +	trap "rm -f $log" 0
> > +	verbose_run_log "$log" "$@"
> > +	ret=3D"$?"
> > +	FAIL_IF_SIGNAL $ret
> > +	if [ "$ret" -eq 0 ]; then
> > +	    FAIL "Expected non-zero return code"
> > +	fi
> > +	if ! grep -qF -- "$msg" "$log"; then
> > +	    FAIL "Expected message '$msg'"
> > +	fi
> > +	PASS
> > +    )
> > +}
> > +
> > +# Check that a command fails and prints a message
> > +# $1: message to look for in the output
> > +# $2...: command to run
> > +run_wrap_error_msg_test () {
> > +    msg=3D"$1"
> > +    shift
> > +    shorten_echo "$@"
> > +    printf " {!=3D 0, \"%s\"}:	" "$msg"
> > +    base_run_test wrap_error_msg "$msg" "$@"
> > +}
> > +
>=20
> Right, you introduce this wrapper and I think they can be useful for other
> cases.
>=20
> You also sent the series "dtc: Fix deletes within a section and before a
> redefinition" [1].
>=20
> The patch "tests: Allow dtc-fatal.sh to check the error message" [2]
> available in the series plays also with error messages, adding a "-m" opt=
ion
> to tests/dtc-fatal.sh.
>=20
> At some point, could all tests use the same uniform method (probably the
> wrappers added here)?
>=20
> Could dtc-fatal.sh script be replaced by an existing wrapper?
>=20
> Again, I think wrappers you added here are nice. I would like to have your
> opinion related to dtc-fatal.sh and a way to avoid the '-m' option in ord=
er
> to have uniform features.

Yes, it would be good to consolidate.  For now, this series is ready
and the other still needs review, so I think we make it adjust to the
changes from this one, rather than the other way around.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--X52aYPsJ9oA6S8nU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmriqS4ACgkQzQJF27ox
2GfuUhAAjB3gUv+0iUlXAMNV848VEQvrgNX4KlVmDMOobjt1y450pnrKJ9a9u6Ak
3uoRLukSNYmQAgKbx3Gv4QUi7ND00Q/RRdsfW/7nNMTsH60gtz4mRJPuR1HpadF1
qpkMHEgfzH8sVmVndSRa9JYALp1LOTIbPmKCbYADsRSuQ/AoLd5gWUxI1hoxSqqi
3ntvoVCGzO8/swG4R2lJGBSCiLS4ml1jwRtTWDYhgtVXEhU7QzxTuiQWFINKt1eJ
LToSz+CiwKzsuhwU7Fj0GjC0LV089DXQ7BDnniG9wMqvRqL1ojw1up7Mkwq0EEYB
IOZEaL9M67D7ryoQ5VoV3mre8qJsi2w93XlAaQYw5mebFin+c3KcBgZWi+mVOlSE
4pKINWACVik1F+ZJELoHmcZ+Qi+fnZIWUgeW1gZWMXVV5+neCjeYgxhGXWOVr9au
8w/ej4vaGqsRgcAtmqBzErrkQATeczZVQihaOnjPdrm/VlPRG/ubUvbpIJTgQ9sD
8mADIml7QPv1urzD6zbollLs67AartCAtHkeJg8sYUOq74Jxf7vekbcALpgf6NqU
MateS4fObvJjRnZfJF9XSV8+/4Nrzl8Vo+7VKtFhLBjFfz2WQjHPr+oMTaJK8m74
lcEPt5nZ/irnjxtH4nWwOypApY5kar06I2eSgnxfKamsyPjXdL8=
=evp1
-----END PGP SIGNATURE-----

--X52aYPsJ9oA6S8nU--
