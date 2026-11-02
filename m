Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613322;
	b=ttTCcbiNpF6yRiz8MKDaVNPqqnUsj+/wz1DU6xykQBZsaGjlBLOHIPlGkntjzMMrrQbz
	 FAuDWmpcKGXl3rmSTa314de+3f1zfCRXK+NjzpIi5NalKIKvIOaA9lpHc8cga0GAJRkZW
	 1Cr6u7mAmwLscK3hHHegW/xzSU/q5y2DHdk3DYHos5e7ZEdot7I4NS/6z3/BYdE8PNgrm
	 Hd2vo+0/xBOrhCxc1yahoI0RL7IXdFZuK+2kwrP8UuJPDBS42ZwWfrRzwSlpgLcOhSeFT
	 Krmh/Uq4YA/ZyvgmBAEMYz8akx6Tm9N9f4+XSzSOtk6CDzpaG0x0phcUG6pfSpsjGmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613322;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=sL0FE3B0I41tIk2gOuyIi0jhUKFox3aoPBdj1VQJ/0Y=;
	b=WdLiMFZLBTOQZ42jWvZNAqNor1oMiq0G3Dew4QuH0gBMazpxQTaFt+axhTQqwFJz02DG
	 AP9ovtaynFauXtJAG7g6rxOJhFP74VL9MWSyPh7x+nir5BobzzOlnN7an7/LDv+v0bPCj
	 hkJDkYHDBdly8taEmUHEKY3YUiuz1PvZR0uTuDeHQr/KmcAA3Ik7tNdQtekv1Cqd76vjc
	 MzILhuVw+4bDrSX3jpPImFDNPqFo4z2CWAB8I62+7b1nW/6ayd88M4AsV16pIPr86GKFo
	 owGB5OEN4ntgoypQxrO1a0ag9tBkGqSpcjJ0DQmen4iUfmJugClIZQsFCEydGaf1lsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Ei6L1gPE;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CB8606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 09:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18CB8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Ei6L1gPE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793613318;
	bh=sL0FE3B0I41tIk2gOuyIi0jhUKFox3aoPBdj1VQJ/0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ei6L1gPEBlqO3yO6kLzLA44pv9anJlD77cFQBBCvwSXUGC1/2t84Am7z+4TLZ13sl
	 XbfCFIpLguicaEIkCfO75EhKAVFcXO9CQXOs7zQ5wkJgbvlEBkeFLXQR9LpkQOaqos
	 p3UCMM87AbTD6crEN3A8JUYabAmyyuLukdZpqaKe0Cx7Sr5BWhG3Qobh81zHaGhTHc
	 tOmH+ix+MTOeaUY/6LaXlhLxAriidMohP4A5ZTz8q6YaRblfyTc6OeuN+Ggv75LizM
	 NqDtziLjIS0OKys6vjclGQq00nxy2Dew/9W2R2IcT6Bgg3RsAjUW3mbCXEFxVVm19+
	 BsQEDs7/4wTBA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ6Wp22drz4w1V; Mon, 02 Nov 2026 20:55:18 +1100 (AEDT)
Date: Mon, 2 Nov 2026 20:55:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 03/13] dtc: Move the /delete-node/ handling out of the
 grammar
Message-ID: <auhd5cz1fRNAtyak@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-4-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="sfFUqQ5lMOx84MNC"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-4-sjg@chromium.org>

--sfFUqQ5lMOx84MNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:36:57AM -0700, Simon Glass wrote:
> The grammar actions merge each top-level fragment of a dts file into the
> tree as it is parsed, so the merge logic is spread over the rules for
> each kind of fragment. This makes it hard to follow and to change.
>=20
> As a first step towards moving this logic into livetree.c, move the
> action for a top-level /delete-node/ into a new merge_delete_node(),
> passing it a struct fragment for the reference. Add a fragment_ref rule
> to build this.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  dtc-parser.y | 26 +++++++++++++++++---------
>  dtc.h        |  1 +
>  livetree.c   | 19 +++++++++++++++++++
>  3 files changed, 37 insertions(+), 9 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index e47f80d..61301a6 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -47,6 +47,7 @@ static bool is_ref_relative(const char *ref)
>  	struct node *node;
>  	struct node *nodelist;
>  	struct reserve_info *re;
> +	struct fragment *fragment;
>  	uint64_t integer;
>  	unsigned int flags;
>  }
> @@ -80,6 +81,7 @@ static bool is_ref_relative(const char *ref)
>  %type <prop> propdef
>  %type <proplist> proplist
>  %type <labelref> dt_ref
> +%type <fragment> fragment_ref
> =20
>  %type <node> devicetree
>  %type <node> nodedef
> @@ -157,6 +159,17 @@ memreserve:
> =20
>  dt_ref: DT_LABEL_REF | DT_PATH_REF;
> =20
> +fragment_ref:
> +	  DT_LABEL_REF
> +		{
> +			$$ =3D build_fragment_ref($1, false, &@$);
> +		}
> +	| DT_PATH_REF
> +		{
> +			$$ =3D build_fragment_ref($1, true, &@$);
> +		}
> +	;
> +

This seems weird.  If the point is to allow either kind of ref, we
already have the dt_ref nonterminal for that.  If the point is to
build fragments, rather than just refs, then why do it here before you
have the information you need to properly build the fragment?

>  devicetree:
>  	  '/' nodedef
>  		{
> @@ -236,16 +249,11 @@ devicetree:
>  			}
>  			$$ =3D $1;
>  		}
> -	| devicetree DT_DEL_NODE dt_ref ';'
> +	| devicetree DT_DEL_NODE fragment_ref ';'
>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (target)
> -				delete_node(target);
> -			else
> -				ERROR(&@3, "Label or path %s not found", $3);
> -
> -
> +			$3->type =3D FRAGMENT_DELETE_NODE;
> +			if (merge_delete_node($1, $3))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_OMIT_NO_REF dt_ref ';'
> diff --git a/dtc.h b/dtc.h
> index c0d8e8f..9f9076d 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -368,6 +368,7 @@ struct fragment *build_fragment_ref(char *ref, bool p=
ath_ref,
>  				    struct srcpos *srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
> +bool merge_delete_node(struct node *dt, struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index 982f0a6..5c9ec48 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -542,6 +542,25 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	return dti;
>  }
> =20
> +/*
> + * Delete the node which a /delete-node/ fragment refers to
> + *
> + * Returns true if there is an error, which has been reported.
> + */
> +bool merge_delete_node(struct node *dt, struct fragment *f)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);

assert() that f->type =3D=3D DELETE_NODE, maybe?

> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return true;
> +	}
> +	delete_node(target);
> +
> +	return false;
> +}
> +
>  /*
>   * Tree accessor functions
>   */
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--sfFUqQ5lMOx84MNC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroXeUACgkQzQJF27ox
2Ge6mQ//UVPrREdYwaGXuM2rByPbS9R2tJZmi1v9mm1rLtfZly4Fjd9n7C3v7xqE
KlLoRBRWVfcl87IHyxlKzvK4tv/RNc42vdzFzacBfvJzXP5I36aFfCym2+6HpOiX
3Dpr+BOo4ycKnvwZXgt2BE5OuXRVMHmvmPlc8JRClWDcsb95etFOd5CTWSd2hxZV
UanN6PBCEi2ShSr/7OraQtid9TAvOYVlyXNsiru2fnVA9IVAdVoYO3kqDIFPZFMH
/VaNA2qT5llGUBLeret7AO/57c5LI3L3tRvLv5/pa612LN/PGhzOH3/yNWbVoNWj
ZfzXPXUZJ3clH1UzW5HMl3jWa8NqggnFAjTh8nD7t9v/BtYEfjEBa21JuG6FuS0o
xjovkR4oZyRDKdDO0vElSyMBaNZS3aMS2DNPghw+Nwg0dXCo58Q7q+tnBFj9g8uX
zSzoDMa+z+ahPSlYO8W0AoOZVWGA/rEFscyuSQzqPSfSR1GOx/u8euvuER+k5UkN
tmAA0HRlL6OF3PiJ38DdCvBb4oINAZSWEBnD4OLG/ZB9NQLpmMnsO8Uf7ZJwnsqj
Iqp3jwiirQBr9BIYf2guD26OZAM4sXP1HFznGpq4orvpy6P2i8nJgSqCrSOiJf9i
THs4z9X9pN996ncJ+0//PkDSuVhdv+jxxghW/swK6L24Aq0UklE=
=xnj/
-----END PGP SIGNATURE-----

--sfFUqQ5lMOx84MNC--
