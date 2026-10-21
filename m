Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596061;
	b=s/IHuJNDM2FGv1oGvyeXFgGVMxIlc845u4unvj3CBLtqTLg3sygjoRPizXDKKsMdly5m
	 dVNZhmgx18FXXnSEJEUrbvGpa9HpcZXhICbS0aYIGCR2Kt/F+z9TDYpRyVDUSMwMwyLPv
	 +lAc2rLpyb6ctEg/DBVEyttJt/9zdV6RzNAyEGAiaCGFpgERfWSnTc7KesbtBns+zNnMi
	 qhd3UAOUOqG8eS8WLl3zKG8+68zBhPgQ2Buplh9lovlT7AH7Qp8NxHOwY9Q4wW6LyD+JL
	 0IJ1ONIiTsO9xZYkmQtTGiAP+ekAOBYPPXHukCxHgzqhSJqDOu2nw90RREZG8qQLJaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596061;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=qeUUc49iTPJXteXkFNDg1w8nSyOVubqVZaI+JbWQCK0=;
	b=lgmVgb7LjURAjzdtbQ7y1XN6OVlLUoPlzjBIzNHneYwl5eX7Xo68AIQZICxdzAWj2jUO
	 qF+MHMlaDtUuLKElWzUs6OlYayWDSSV3/zBgzYlyy/6v++74nNAYB5knWW5mItB7aY/UF
	 rt7vojsZV07sTwZv2VgL6iY938WuiK200uqSyDpcp/A0QGI3oQNx4P7VdOiZZEUUdfwSx
	 GThR0ickbkIQ7j5fqcsi/+07JL6tNLA8R7N4kYWGQnpMrkWsbM1wT5DErQOYxs/vucRbN
	 ZXydFMbO2VwEs6+RdCPOVNYQrbpHtswT6mE3pmm/xpvnM6Y3dC5RpQsutZjpVrsCIfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ygmG22N1;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B819606A31B;
	Wed, 21 Oct 2026 15:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B819606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ygmG22N1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71753C5CD75;
	Wed, 21 Oct 2026 15:21:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CE52606E3;
	Wed, 21 Oct 2026 15:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E12A7103289F5;
	Wed, 21 Oct 2026 17:20:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792596053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qeUUc49iTPJXteXkFNDg1w8nSyOVubqVZaI+JbWQCK0=;
	b=ygmG22N15GDQBbf7ScDnThNACy3au6xZ/o6vXJyjlJhHpaJZ0FHxcClNQLoXRi4ozLpOkj
	INbqTMFPHEXjYdpDZU7dTFnXscTiUW8wxIaW77op9iHSsCPG7Lpu38rpQcMLTONQtjrjCK
	9CvcGNtJmoIpN+u5PoCyp2uEJ3olaCQXXu1EYhLrUTGzcJirpy/MXIm5EYATdBzpnQh+fM
	etHgCaRuwiiL4RhP2JuTSFQSFijVdCBz0846nwvXKyHG/lZLQYEAQRAXYDQ3DliSaIt0yw
	0fzFdScFzvtKxt5oNSSYegkA1f5bvO0XqxG5yrs/V0BGIzWaT+qrLW+nA3Wn9Q==
Date: Wed, 21 Oct 2026 17:20:43 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <20261021172043.4bbd2bc5@bootlin.com>
In-Reply-To: <atgi4rMsw5W6kKkS@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss>
	<20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss>
	<20261013190347.4f1d9b9d@bootlin.com>
	<atGzdxETQZ9ovJFh@gractus.seuss>
	<20261019151121.26d99f30@bootlin.com>
	<atgi4rMsw5W6kKkS@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Wed, 21 Oct 2026 13:26:49 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> > 
> > Ok, my proposal seems to be a no-go and so I will follow your proposal given
> > above.  
> 
> To be clear, I'm rejecting the original proposal because I think it's
> internally inconsistent (if you follow the consequences of decisions
> far enough).  I'm not necessarily opposed to something other than the
> above, as long as the rules for when unknown tags must be invalidated
> (and what that does to the version) are made very clear in the
> structured tag spec.  e.g. see an alternative proposal below.

No problem, I understand your point.

...

> 
> Essentially the theory of the proposal above is to be maximally
> conservative: any write (adding, removing, changing, in-place,
> whatever) will invalidate all unknown tags and downgrade the version.
> 
> 
> But, here's an alternative proposal for invalidation/version semantics
> that I think is consistent, while being a bit closer to your original
> proposal.
> 
> 1. version and last_comp_version retain their meanings.  No new header
>    version.

Ok

> 2. If version >= 18 the tree may include any structured tags, even if
>    they weren't defined as of v18.

Ok

> 3. Some future version might _require_ certain structured tags to be
>    present.  But a client must only rely on those tags if the version
>    indicates it can.
>      - e.g. suppose FDT_FOO tag is introduced in v20.  A client
>        reading a v19 tree _might_ see some FDT_FOO tags (because of
>        (2)), but cannot rely on them being present in all the places
>        they should be.

Ok, kind of degraded mode. Whether or not a v20 compatible client can continue
or not will depend of each tags known by this v20 client. For some tags, having
them removed will not be a problem whereas it will be a problem for some other.

Makes sense.

> 4. Any write to a property (including in place) invalidates all
>    unknown tags on that property (they must be stripped)

Ok

> 5. Any write to a property invalidates all unknown tags on that
>    property's node

Will see in the implementation. The offset of the written property will be
incorrect after the write. Indeed, some tags (tags related to the node)
available before the property can be removed. With splices instead of
FDT_NOP, offsets change.

This also brings a question. Are API functions such as fdt_get_property_by_offset_w()
need to be deprecated?

Those kind of functions return a pointer to the data of a property for modification
by the caller. We don't know if the caller will modify or not the property.

Without deprecated it we can change the function to
---- 8< ----
struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
						  int offset,
						  int *lenp)
{
	int new_offset;

        /*
         * The modification is goind to be done out of libfdt.
         * Unknown tags are removed (rules for modification when unknown tags
         * are involved) but also known tags. Indeed, we cannot know if the
         * modification will have impacts on known tags
         */
	new_offset = fdt_remove_all_tags_due_to_property_modification(fdt, offset);

	return (struct fdt_property *)(uintptr_t)
		fdt_get_property_by_offset(fdt, new_offset, lenp);
}
---- 8< ----

The idea is to be conservative here also and consider that property data retrieved
for writing will be modified by the caller.

Also, the offset used as parameter of fdt_get_property_by_offset_w() is no more
valid after the call.

Last point to have in mind, getting the node offset from the property offset will
need to walk the tree from the beginning. It can be costly.

> 6. Adding or deleting a property on a node invalidates all unknown tags
>    on the node

Ok.

> 7. Adding or deleting a subnode invalidates all unknown tags on the
>    node

Ok.

> 8. Whenever a tag is invalidated and stripped, the overall version
>    must be downgraded (to let clients know they can't count on tags
>    being present)

Ok.

> 
> Points (4)-(7) are all somewhat negotiable.  In particular, I'm not
> sure how feasible (6) is to implement.

Well, this new proposal is more complex to implement than your first
proposal but it has a finer grain to handle unknown tags on modification.

I can try to implement something based on this new proposal.

> 
> Note that because writes don't invalidate tags on ancestor nodes
> beyond one level, this proposal doesn't permit tags to contain summary
> information about an entire subtree that could be invalidated by
> writes further down in that tree.
> 

Well this doesn't look like an issue on my side. At some point if such tags
are added, we can avoid any modification using the last_comp_version field.

Best regards,
Hervé
