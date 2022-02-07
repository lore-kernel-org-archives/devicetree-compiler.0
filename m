From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Mon, 7 Feb 2022 15:09:56 +1100
Message-ID: <YgCblAa5Hxw33OXV@yekko>
References: <20211107224346.3181320-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MR0DB56VNvVpHo1b"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1644207004;
        bh=sDlYI+o64m7q6gUxmt//IGuRl0+fcBhvoY6OiciFoDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ly2FHfita1dcUTnaDuycpdvWJULkHpqMgwEMHTFRdehNyJdmCUWP/0NBcok4F7rW6
         kOZdvWRyUwZnY17FmLXnbkQ57TyxcpYhL2xrLSPbl30VPsyEWVwsvC6zWpCT+vGbfg
         NZICwNL47gjYZhk5ZeR+l/wfnki5NK+TS1GlqprI=
Content-Disposition: inline
In-Reply-To: <20211107224346.3181320-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--MR0DB56VNvVpHo1b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 07, 2021 at 03:43:42PM -0700, Simon Glass wrote:
> Note: This was last sent 6 years ago. It really belongs upstream and I
> believe it is useful functionality for libfdt, so I am trying again.
> Please take a fresh look at this. It is cut back from the previous series.
> If accepted we can expand the feature set piece by piece from here.

Sorry it's taken me so long to look at this.  Again.  I can't dispute
that it's useful for certain use cases.  But as for belonging
upstream...

This series adds quite a lot of conceptual complexity.  It introduces
a new data structure, new state structures, a entirely new mode of
working with a tree and a bunch of configuration parameter types on
top of the new entry points and new tool.  I still find the semantics
of the different criteria for inclusion/exclusion from a region pretty
bewildering.

That makes me pretty disinclined to add this to the scope of
maintenance for libfdt.  As you've probably noticed, I'm already
struggling to keep on top of maintenance for the existing libfdt
interfaces.  AFAICT everything here can be implemented fairly
naturally in terms of libfdt's existing public interface. so I'm not
really seeing a compelling reason for this to be merged into libfdt,
rather than being its own separate library that depends on libfdt.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MR0DB56VNvVpHo1b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIAm40ACgkQgypY4gEw
YSL1xw/+NX6FjKtGQMrEzRSoV9de5P7rZiR7iIZXguHDw+VT0Pb2qV2fuNtUTnyb
MMyS3NxCXO+NlmEvcDibL8xBESinj0fhgcYrxSo9Pnp4AhY6vKV+oyM+yGdjxRhe
WCNjS9jkOx6zOPsUuDuYKgZkfND4454C1X+uQZfcmt5CsIFKt/9cKn8Xh999sA0+
z2Lq5Wgi2BnMR9ZKsuSdnGYXoxjFuAg2NdkZ8CftosI+Q2SFSTvyD89tM/PZPU+E
SEHvyxhMaOKzccgaTzrpN1izAD+acMD8gk8zpMytWHOO4mTnmIZI4yqzwyqgUm61
vt7VCENMyMoivzP/lYqph7WkumUote93wb4u2fev5zKZNejhl8r3mzW2tehEEd0G
epDgjfglYqorBtBrgGg76Oeq5xz6kFdsIYfR4ydgQ3UbTlnyZshAboEwu/Whm14o
y9AWhAO+1rSaRBnMEqCM2WKDMROeouheHhGQBS0N0jObpcIJ2gig0ZMBMtEGEQJo
54ShgXRxidNnlz76js4ew4rpDaFiymCKbCB8SBhT5Ucx54iyjR3DNNtETIFkXahC
B82WeP9j58K0Kv1wSigovOiSk5pU8mu7ZCQjHYCzEiZcLD2Ufga0XiRiYJyshv7A
qUyyWrzrXZQwfrHq5c0kxYRY74uQEK1qfj8bLnn2W2DJGqa3vO0=
=cJnE
-----END PGP SIGNATURE-----

--MR0DB56VNvVpHo1b--
