Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B347640B6E7;
	Wed, 21 Jan 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013025; cv=none; b=Z1U6Eyxs0if0X0MMR7KGNqPWp1PtBiVWMi6VCk4LPaHh3YHJElf7pFi9riHHYRMXgjWI6Fm2u6HW2dnaNxQd/IwT4vwVENQ6PZXjBwKBJGSNMJaek31c5JTg46GQ9cZ1QR4hBiTTjeORHLgBrJHjKxKKd+sXQ/muEYaDPcEflZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013025; c=relaxed/simple;
	bh=3gK+KpuI1tPzrSDmHLGjTRi81x4ALcjBd51hKhdhsDg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUTHWG3kviGs1kiEbA0QXx5W2x9FAgm5uSEpXOcZVFdwepXTzfpEevykgOvATctJn67FeF9ynQC3BdW47yFGGFMNOUTHykiBNUFxOTxPe686hxfPC86Vuj7wlnf3T8SlCD+m079f+cgG4Owd4I/E2AAeo16VOkGjIh8A1R7GJck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZR2UMH0r; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZR2UMH0r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2BA904E421C4;
	Wed, 21 Jan 2026 16:30:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEAF46070A;
	Wed, 21 Jan 2026 16:30:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8267D119B17C2;
	Wed, 21 Jan 2026 17:30:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769013020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mMiNg/ArvsdTwMqlRpgAOhcnS9HPBxUnzhiFFx2sE0o=;
	b=ZR2UMH0rF0YSR9dq7LE4r4RQM7y/HcUhjdNZkjrKmF51zsu0RUIegXpFHlaMglKqhXnKDM
	o+yyFaQ/t1K6A23pytJmLMiF/chnD8llFXxf1kB/6t//zZN6eYNYXx5u9Y0h2IskJwQ8ZV
	2C2qpmX5IoxXQ7UhWuhIXHQto8vaHvzdgZBJJCX8sm09pQPta73WTu34S1CvHM1N9F0SpP
	vt5NSJ+n3S1/x+5JJG4hwVo8B7h+y3H1cy5fyLTL210pFHJ+kvAl1nJdxrpxfpvU8nZmiD
	l0L9G+l8Y2UZhaGPV7LxEjtbFGLdbJNROcTPLC7PsOKTjkC4+RiuJBF8eQufhw==
Date: Wed, 21 Jan 2026 17:30:12 +0100
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
Subject: Re: [RFC PATCH 64/77] dtc: Add support for references by path
 involving orphan nodes
Message-ID: <20260121173012.2a087367@bootlin.com>
In-Reply-To: <aXCXAwm34LobcW1h@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-65-herve.codina@bootlin.com>
	<aWiQ05zlfPfcIaZk@zatzit>
	<20260119173831.3341e827@bootlin.com>
	<aXCXAwm34LobcW1h@zatzit>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Wed, 21 Jan 2026 20:06:11 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 19, 2026 at 05:38:31PM +0100, Herve Codina wrote:
> > On Thu, 15 Jan 2026 18:01:39 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Mon, Jan 12, 2026 at 03:19:54PM +0100, Herve Codina wrote:  
> > > > Referencing a sub-node from an orphan node using a path is needed.
> > > > 
> > > > Indeed, using the following snippet:
> > > > --- 8< ---
> > > > /addon/;
> > > > 
> > > > &node1 {
> > > > 	subnode {
> > > > 		foo-phandle = <&foo_label>;
> > > > 	};
> > > > };
> > > > 
> > > > &node2 {
> > > > 	foo_label: foo {
> > > > 		prop = <1>;
> > > > 	};
> > > > };
> > > > --- 8< ---
> > > > 
> > > > Even if node2 is an orphan node, foo is a local node. foo-phandle
> > > > references the foo node using a label.    
> > > 
> > > Another option would be to eliminate the idea of local references, and
> > > require a symbol be attached to things that you want to reference by
> > > label.  
> > 
> > Hum, new kind of references.  
> 
> No, I'm trying to remove a type of reference: I'm suggesting using the
> same format as for external references on local references as well.
> That might mean things referenced need to be both exported and
> imported by the tree creating them.  That might be worth it to reduce
> the number of cases.

Hum, this means a new tags.

local references: ok, phandle to to local node.

external references: phandle to external node.
This has to be resolved based on exports available in the device-tree the
addon is applied to.

Here, the node is not external. It is available in the addon and so it is
a local node.

No import/export mechanism is needed to resolve the phandle. Indeed, this
phandle is already well defined (resolved) in the addon blob.

Having a kind of 'local' import/export to allow local cross-tree references
is going to add an extra complexity where it is not needed.

Look at the related test (patch 65).

In the tests/metadata_addon_references.dts, you can find:
--- 8< ---
&base1 {
	b1_addon: addon-node {
		prop = <2>;
	};
};

&base2 {
	addon-node1 {
		ref-base1-addon-node = <&b1_addon>;
	};
	...
};
--- 8< ---

Converted to dtb and analyzed by fdtdump, this leads to
(tests/metadata_addon_references.dtb.expect):
--- 8< ---
&base1 {
    addon-node {
        prop = <0x00000002>;
        phandle = <0x00000001>;
    };
};
&base2 {
    addon-node1 {
        ref-base1-addon-node = <0x00000001>;
        // [FDT_REF_LOCAL] ref-base1-addon-node[0]
    };
    ...
};
--- 8< ---

This dtb, as all dtbs, can be converted back to a dts.

Having a syntax to reference orphan node by path allows to use this
syntax in the 'ref-base1-addon-node' property. You can find it in
tests/metadata_addon_references.dtb.dts.expect
--- 8< ---
&base1 {

	addon-node {
		prop = <0x02>;
		phandle = <0x01>;
	};
};

&base2 {

	addon-node1 {
		ref-base1-addon-node = <&{$base1/addon-node}>;
	};
	...
};
--- 8< ---

We could only use the phandle value:
   ref-base1-addon-node = <0x01>;

Which is perfectly legit and fully matches what is encoded in the dtb.

But I think it was very interesting, thanks to meta-data, to identify that
this is a phandle and so use a reference instead of a integer (phandle).

No label are stored in the dtb and there is no need to store them. Further
more, a node, in a dts can have several label. Which one to store? The
first one, all, ...

Using export, lead to the node visible to any addon applied. That's not the
expectation.

Using import, means the symbol is external. That's not the case.

A local node exists in the dtb. We should be able to reference it by path.

/ {
    foo {
	bar {
	    ...
	};
    }
};

With the root tree, the 'bar' node, can be referenced by /foo/bar.

Now, with orphan:
&orphan {
    foo {
        bar {
	    ....
        };
    };
};

How to reference 'bar' by path?

We need to identify 'orphan' instead of root ('/') $orphan/foo/bar is the
syntax I propose to do that. Of course, this syntax can be discussed.

IMHO, I thing the feature consisting in referencing by path a node in an
orphan tree is needed and avoid extra complexity.

Best regards,
Hervé

> 
> > We have reference by phandle to local nodes. Reference by symbol for
> > external nodes (i.e. nodes not present in current dtb).
> > 
> > Now new kind of reference for node available in the current dtb but
> > in a different tree (orphan tree).
> > 
> > For that we need to:
> >   - Mark the phandle value in the property as a cross-tree phandle
> >     reference
> >   - Add the symbol label in the referenced node.
> > 
> > When the addon is applied, this new kind of reference need to be taken
> > into account in a new way:
> >   - The phandle value in the referenced node need to be updated in the
> >     same way as all other phandle value in nodes to avoid collisions.
> >   - The cross-tree reference needs to be resolved.
> > 
> > This adds an unneeded complexity.
> > 
> > IMHO, we shouldn't eliminate local references.
> > 
> > We need to reference all possible local nodes by path even if cross-tree
> > due to orphan tree is involved.
> > 
