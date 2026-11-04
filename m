Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798607;
	b=AF90QTgTQxRWSFO4siMXcTbLYOemQrIvjxgDRXOuAhVIq/nXBwnkgdn8FN3FMIjB9wWq
	 zZ2Vds++/x9/3wxjPblCzN8+sK8W0Y7KeSqvkpNPi7Jg996ILYq29qoLOjd4KSsJV1fp3
	 SAuio2upa7HX4esMBHr4SIDFNIJhFT4x2jovQsByJR7X04aLmDCXTgj6jZ2Gcr+PU0awr
	 RyHI3Izjm/6lsOs4GOp2un1Pr/8Mm+vrg6kUzba7vizzXVwZgwXma1zeE4NCRlNZooptZ
	 hfgc0mt1msDpSUIFXOD25yYzcfr4VquR0U+dx5zmJSBUrd2ZkSe3A+QdBZJHvYQ4Y0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798607;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=IEOyzuDlm4eIslXCKUFieVe1XoxuhCq8QoQI4IZ1a3s=;
	b=GG87SwnfrQWYHSHgj1XKVtVpHrkMZBD6rZyzeI9NF/UM0prh+X8+T3pKUovGRio9gCDa
	 tEbUACBTFbBbObkHaa55jwy6FY0UMpkoEuluvy9zCA1JKEVi9zh+l05nq1D4LMGvXfLkR
	 pMKhPf8g4KN0P2uEvRKoy67JMAPXbNohFAU+E++Uaqkzb5eJ9y3wKOO5TD0Eu1QrFAiDY
	 xxw950c5tkadW4qK7y0KK2nMHyVF7QaML++Zxq+G33ISz4eSq0c2MBKnFTCCrD0sBjwbU
	 UMJEma2uDbS7ooBZO/8nkeH6sL4Rq55LpS/G1SqZ0FgvM3wynyvc9gcUZt5RHwKzqSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MsJzNQ7B;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C64D606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 13:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C64D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MsJzNQ7B
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB72EC8F46F
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 13:24:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7E5E60770;
	Wed,  4 Nov 2026 13:23:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BFC6103291D1;
	Wed,  4 Nov 2026 14:23:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793798603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IEOyzuDlm4eIslXCKUFieVe1XoxuhCq8QoQI4IZ1a3s=;
	b=MsJzNQ7BMONLpAK0Hq/+Eu5UDzrNDkv82skji/NsWXeBLo7H0CDjN32//6roSBnQUZ8Kru
	YVpxtkyova3eDLgoS8h8QJnrBV1LJhTASEKJcyP2nj98v8qgoEbqUXUJegza6cCeBR7WD1
	HWTJRqtXvbWjfj1hfqHjCm1yBFRY1Uw/J/YTisB0Ybi+qa8wSmY8Zu2pg4bW4TgrkrLTlg
	ucAvnOGusqhnD0SH+Sf5YVvoOMQFhQmBTjcqS9lfb/bwmtCd9xRqkg0k19eyj81BKr8jU4
	0aVolpVRVxPBu31nvPpOQ4ZYxD8F1iR/TtISMQ0rSs/N7Tsy4lcIVFFcSkJetw==
Date: Wed, 4 Nov 2026 14:23:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 13/13] dtc: Merge the fragments of a dts file in main()
Message-ID: <20261104142318.5af52bff@bootlin.com>
In-Reply-To: <aur_KYarRUgenElv@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-14-sjg@chromium.org>
	<20261103180803.416e25c7@bootlin.com>
	<aurV_EO8OpYad26x@gractus.seuss>
	<20261104094055.2ca24664@bootlin.com>
	<aur_KYarRUgenElv@gractus.seuss>
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

On Wed, 4 Nov 2026 20:47:45 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Nov 04, 2026 at 09:40:55AM +0100, Herve Codina wrote:
> > Hi David,
> > 
> > On Wed, 4 Nov 2026 17:51:41 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Tue, Nov 03, 2026 at 06:08:03PM +0100, Herve Codina wrote:  
> > > > On Sun,  1 Nov 2026 09:37:07 -0700
> > > > Simon Glass <sjg@chromium.org> wrote:
> > > >     
> > > > > We would like to run checks on each fragment of a dts file before it is
> > > > > merged, but that requires dt_from_source() to return the fragments
> > > > > unmerged, so that main() can decide what to do with them. At present
> > > > > they are merged at the end of the parse.    
> > > > 
> > > > Why running checks on each fragment instead of the dt where fragments are
> > > > merged ?    
> > > 
> > > This is part of the aim of the series.  Some checks make sense on an
> > > individual fragment, others don't.  Allowing both kinds lets us
> > > address several longstanding problems.
> > >   
> > 
> > To clarify this point, what kind of checks for individual fragment?  
> 
> As many as we can, eventually.  Anything that doesn't rely on whole
> tree context is a candidate.  This means
>   a) they'll be checked sensibly for dtbo output where we don't have
>      all the information to perform checks that rely on the broader
>      tree context
>   b) they'll catch logically incorrect things, even if they're later
>      overwritten by something
> 
> Initially the most important ones to run before merge are the
> structural ones like duplicate_*_names, node_name_not_empty,
> node_name_format.  The duplicate ones in particular means we enable
> consistent behaviour w.r.t. overwriting nodes between the first
> fragment and later fragments in the file.
> 
> 
> In fact, thinking about it, before the merge should eventually be the
> default place to run tests.  So the question is more, which checks
> should be deferred until after the merge (and therefore not be run at
> all for dtbo output).  Obviously anything that needs to look up an
> absolute path has to go after the merge.  Things that look up phanles
> are a tricky intermediate case.  Potentially those can work before
> merge, but only if they search for labels rather than actual phandles.
> 
> > What kind of longstanding problems?  
> 
> The biggest one, that I'm hoping this series will address is the fact
> that we don't have consistent behaviour if a node or property name is
> repeated between the first fragment (it generates a check failure) and
> later fragments (it silently overwrites).  But there have also been
> various reports about false positives from checks when they run on
> /plugin/ files, because the partial tree just doesn't have the
> information needed to properly complete the check.  Having different
> sets of checks before and after merge is the clearerst way I can see
> to properly handle those false positives, while still checking as much
> as we can for a dtbo.
>  
> > Can you give me details about them?
> > 
> > Maybe I've faced some of them in the support for addons implementation.  
> 
> That's possible, yes.  Or you might yet face them in addons.
> 

Hum, I see. I think the problem is not before / after merge for checks but
with / without orphans.

In a dts, we can have:
--- 8< ---
/ {
	node: node-a {
		prop1;
	};
};

&node {
	prop2;
	subnode: subnode {
		prop1;
	}
};

&node {
	prop3;
}

&subnode {
	prop2;
};
--- 8< --

In the end no orphans are present. Everything is merged in the root node.

In a dtso we can have:
--- 8< ---
&node {
	prop2;
	subnode: subnode {
		prop1;
	}
};

&node {
	prop3;
}

&subnode {
	prop2;
};
--- 8< ---

In this case, everything is merged to the orphan node &node.
This merged orphan node has to be checked.

I make a distinction between merge and format conversion performed for orphan
handling in dtso.

For dtso, the orphan node &node will be converted (format conversion) to
--- 8< ---
/ {
	fragment@0 {
		target = <&node>;
		__overlay__ {
			...
		};
	};

	__fixup__ {
		node = "/fragment@0:target:0";
	};
};
--- 8< ---

Best regards,
Hervé
