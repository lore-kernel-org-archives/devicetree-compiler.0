Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AED368272;
	Mon, 19 Jan 2026 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828778; cv=none; b=hEFTXSmie9CBIL5+lkbI5xO25vpmZ24zhKTUoBEF2X7RUtl/jlyz4Aii8M55//wbOWnNE3+0dRASMCp4PtSqo3op98gza3voKmCWefg0HXDG1BHFUvQTgNZcDWMdlVEKAfgeVq+W6x5moNCf6hD4rjdIX2KZtUoo2+Y+4MGSs4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828778; c=relaxed/simple;
	bh=hVyhXNosNnDhvebEHuZ5COd8S04rmhME8qqCEbWcPy4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H5fonEoPpxsCcGNl+SZHunNJERyxRS6bdB/N7hHC+8xjGOA79CM2zmvkW7VSeeNeP/iGWbaRozqC1YE8fmxy92nvS7Zm4AzVKVMfhfqGb1zdsENxfCl3ovcpQOxRSbNlrz2M80MtLQMq8azEpvfLN+Re0Dsr18gCf1zqfG1Oe0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1xmESwrd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1xmESwrd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C902C214CA;
	Mon, 19 Jan 2026 13:19:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 595C460731;
	Mon, 19 Jan 2026 13:19:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91A9410B6AFE6;
	Mon, 19 Jan 2026 14:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768828772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2hPSrDYcpwfIma6Sp8ceSlc3mc+z5ddj63H/m5AzraU=;
	b=1xmESwrdHPC6lPqp3MPh0Hd2QjO4pbMv02txnL/DblMTRsgv04fsMAib5hxHqWRej0+/ZF
	rxbwOipy7P2E9aVekxo+v3Y9UdSGjgcCCnKPb0+WoSCc8UZH9F3fdL20u7z5M7yoSNSiur
	xpkCKIFziiAiVrW4RNoZKBmxp0iA8/KAB4bcVJS/IVG0sShTvHEPp7+5/ezoInKXtS8kC6
	zJ9i35sRXCQeevm+Iu0Rh/e7RIerBlPro4gowZ5UgJOvPV1vVZgTaCYAXiqJVDomOPCM63
	QKDHkuBJdGrGeFUu5FonWI0ZvtjqCYvH8PdTGxFhu6EMOvl4tbgChF4+1WP0Lg==
Date: Mon, 19 Jan 2026 14:19:24 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 11/77] Add support for FDT_REF_PHANDLE dtb tag
Message-ID: <20260119141924.0b6a578b@bootlin.com>
In-Reply-To: <aW3DvDooCXxw83Av@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-12-herve.codina@bootlin.com>
	<aWhB4fYnXCD2f6Uq@zatzit>
	<20260116161727.7fe14658@bootlin.com>
	<aW3DvDooCXxw83Av@zatzit>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Mon, 19 Jan 2026 16:40:12 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 16, 2026 at 04:17:27PM +0100, Herve Codina wrote:
> > Hi David,
> >=20
> > On Thu, 15 Jan 2026 12:24:49 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >  =20
> > > On Mon, Jan 12, 2026 at 03:19:01PM +0100, Herve Codina wrote: =20
> > > > The FDT_REF_PHANDLE dtb tag is similar to the FDT_REF_LOCAL tag exc=
ept
> > > > that it identifies a reference to an external phandle. The node
> > > > referenced by the phandle is not present in the device-tree blob.  =
 =20
> > >=20
> > > The names FDT_REF_PHANDLE and FDT_REF_LOCAL are perhaps a little
> > > misleading - both are marking a phandle, the difference is in the form
> > > of reference.  That's quite difference from the distinction between
> > > the REF_PHANDLE and REF_PATH marker types, where the difference is in
> > > what the reference expands to in the property. =20
> >=20
> > I am agree.
> >=20
> > FDT_PHANDLE: A local phandle with the value known.
> > FDT_PHANDLE_REF: An external phandle, its value need to be resolved ? =
=20
>=20
> Yeah, I think that works.
>=20
> > This is aligned with FDT_EXPORT_SYM / FDT_EXPORT_SYM_REF.
> >=20
> > Or maybe:
> > FDT_TYPE_PHANDLE
> > FDT_TYPE_PHANDLE_REF
> >=20
> > "TYPE" has been mentioned by Rob in the "FDT_TYPE_U32" context. =20
>=20
> I don't especially like this.  phandles do have a bearing on types.
> But as I said to Rob, I think they're a sufficiently special case,
> that I'd prefer not to handle them as just an aspect of a more general
> "types" system.

Ok, I will not use 'TYPE' in the name of those tags.

>=20
> Btw, since we're looking at dtb changes anyway, one possibility would
> be to no longer encode a node's phandle as a property, but include it
> as a new field in the FDT_BEGIN_NODE tag.  Putting it in a property
> was always a bit of a hack - in traditional OF, it was generally the
> node's address in memory, not something from a property.  Doing it
> that way might side step some messy edge cases like dealing with
> improperly encoded "linux,phandle" properties.
>=20
> > Any other ideas are welcome.
> >  =20
> > > > The FDT_REF_PHANDLE dtb tag is a meta-data tag attached to a proper=
ty.
> > > >=20
> > > > It indicates that the property defined before this tag (FDT_PROP) u=
ses a
> > > > phandle value and the node related to this phandle value is not loc=
al
> > > > node (i.e. the node is not present in the device-tree blob). This t=
ag
> > > > can be available only in overlay or addon device-tree blobs. The ph=
andle
> > > > value used in the property has to be resolved when the device-tree =
blob
> > > > is applied on top of a base device-tree.   =20
> > >=20
> > > This is kind of looking ahead, but does that imply that this tag is
> > > only valid in addon dtbs? =20
> >=20
> > addon dtbs for sure but also overlay (plugin) dtbs. =20
>=20
> I don't really understand how they would be used for plugins - I
> thought the idea was that addons would more or less obsolete plugins.

They won't be used in plugins. Other mechanism are available in plugind.
My idea was to to keep things consistent.

I mean, pluggin dtb can have metadata. Having metadata doesn't mean that
they must be used.

FDT_REF_PHANDLE (or other name) makes sense in plugin dtb.

Is FDT_REF_PHANDLE valid for plugin dtb, the answer is yes.

Will FDT_REF_PHANDLE be used for symbol resolution in the plugin case, the
answer is no, other mechanisme are used (__fixups__ node).

>=20
> > >  =20
> > > > It is followed by two values and a possible alignment padding:
> > > >  - offset (32bit):
> > > >      Offset in the property data where the phandle is available.
> > > >  - label (string including \0):
> > > >      The label to use to resolve the phandle value.   =20
> > >=20
> > > I expect it will become apparent later in the series, but it would be
> > > helpful to clarify what the scope of that label is.  A single node?
> > > The whole tree?  Across a tree and all its possible addons? =20
> >=20
> > This label is the unresolved reference. Its scope is the dtb. =20
>=20
> "the dtb" being a single addon, yes?  That could have several meanings
> in the base tree depending on where the addon is attached, yes?

yes, the addon dtb is for a single addon.

yes, depending on where the addon is attached, the symbol resolution can re=
ach
different nodes. Is that several "meanings", not sure.

=46rom the addon: prop =3D <&i2c>;

Depending on node the addon is applied this could be resolved to the node
i2c@xxxx or i2c@yyyy but for sure it will be resolved to a node describing
an i2c controller.

>=20
> > For instance, "prop =3D < 0 1 &foo>;" in a dts with the node referenced=
 by
> > &foo not present in this dts (possible for addons and plugins) will lead
> > to 'FDT_REF_PHANDLE 8 "foo"'
> >=20
> > The way "foo" is used when the dtb is applied is covered later in the
> > series.
> >=20
> > It will be resolved with import/export mechanism (when the addon is
> > applied).
> >=20
> > Also it can be a namespace label reference (see patch 66 for the defini=
tion
> > of namespace label reference) and here also it will be resolved thanks =
to
> > import/export mechanism. Namespace label references can only be present=
 in
> > addons.
> >=20

Best regards,
Herv=C3=A9
