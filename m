Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736A4E06C3
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 Oct 2026 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415499; cv=none; b=iGXN+fc1uFqrE3us+ZtK9t/bU6BlukSyi+KmHCJTuC/MZQtIHG/oZVGzBKYtSGrBTkKysp2nPcU0PsUEoUo35wKxfdDLdahASYxWQrw8jfiv5xkcZKKiMUWmTX/M46JxxLHRPmOj1Ma+yCkcPO00FPPLBjyAiAMJvTYUBbot74s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415499; c=relaxed/simple;
	bh=WKHIA/XCISOWTirYB6IJyHF9xGI+WuPgFfDBArGIfPY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctGCgldPk+siixyVY5xnAioiDKqK0ey0kvr+tLQTj/br08r0RSOMaMe4Xw0A68SMjOK0jwSV336Z8fDbOPTVqDRP2CFgaevpofOy8FEWoeAXZcI5KIUx2+Qd56nyW60II63xfXDZs35GWIhXlTsDXtZ2kk/vWQZlHkDjrzNybM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w9UxCCeW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w9UxCCeW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 92CBFC653EB;
	Mon, 19 Oct 2026 13:12:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A9DC60582;
	Mon, 19 Oct 2026 13:11:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DBD210328D3A;
	Mon, 19 Oct 2026 15:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792415489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nU7hZ97OV3S/atwzNuXyqQdF0cUqofPApdIkAym7Ebw=;
	b=w9UxCCeW3G6PvUJmseDVj+OLhTgVNrSauiag5KAVD8oJdT1IM1yvZiMD17gGd77XycxD+N
	HBnRrF9hul6gVPnBc8DKnk0q5yzTIIE0aSJ30mmx+h3FLCtUjuVDOwqrvJU4RV2RVTqTxB
	mFErQkU8VDokTwQowXHxA2ywAMPSCXlFA0xV71ab6XEOyrhXCuHX1BK7EKCP7XH88i2Ena
	01wwKa6aw+0yncuvXSCPYwOc/8Nlz2AE/pkb9Ni/Zn4kQOXqhRCxLo+a7+K2Dk5q55vVXR
	RcrBQuAyh9IEuOTFthjgFIDP6XOkBS5FhiTZQz6L9PFYeV9MuVhcptbHVQtgTA==
Date: Mon, 19 Oct 2026 15:11:21 +0200
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
Message-ID: <20261019151121.26d99f30@bootlin.com>
In-Reply-To: <atGzdxETQZ9ovJFh@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss>
	<20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss>
	<20261013190347.4f1d9b9d@bootlin.com>
	<atGzdxETQZ9ovJFh@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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

On Fri, 16 Oct 2026 16:18:03 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Oct 13, 2026 at 07:03:47PM +0200, Herve Codina wrote:
> > Hi David, Rob,
> > 
> > On Tue, 13 Oct 2026 18:10:39 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:  
> > > > Hi David,
> > > > 
> > > > On Mon, 21 Sep 2026 16:20:02 +1000
> > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > >     
> > > > > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:    
> > > > > > This v18 version will add support for
> > > > > >   - Structured tags.
> > > > > >     Those tags value definition will allow "old" libfdt, dtc and other
> > > > > >     tools to skip unknown tags if encountered in future dtb version.
> > > > > > 
> > > > > >     libfdt, dtc and other tools implementing version v18 will be able to
> > > > > >     skip unknown tags available in dtbd generated with later version of
> > > > > >     dtc.
> > > > > > 
> > > > > >   - dt_flags header field.
> > > > > >     For now this flag field is set to 0. It is a placeholder for future
> > > > > >     dtb version and could be used to store some dtb related information
> > > > > >     such as the kind of dtb. For instance, the future addons format will
> > > > > >     use this field to clearly identify that the dtb is an addon dtb.
> > > > > > 
> > > > > >   - last_comp_version_w header field.
> > > > > >     This field is similar to last_comp_version but for writing.
> > > > > >     It contains the lowest version of the devicetree data structure with
> > > > > >     which the version used can safely perform modifications (taking into
> > > > > >     account following rules related to unknown tags).
> > > > > >     If this lowest version is greater than the last known supported
> > > > > >     version, modification are simply forbidden and lead to a
> > > > > >     FDT_ERR_BADVERSION error.
> > > > > > 
> > > > > > For modification, when an unknown tag that can be skipped is involved
> > > > > > and last_comp_version_w allows modifications, the following rules
> > > > > > apply:      
> > > > > 
> > > > > "last_comp_version_w allows modifications" is a bit hard to
> > > > > understand.  What exactly is the version number against which we're
> > > > > comparing that value?    
> > > > 
> > > > We had one last_comp_version.
> > > > 
> > > > Now we have two last_comp_version, one for reading and one for writing.
> > > > We compare again the dtb version supported by our libfdt version.
> > > > 
> > > > This comes from the discussion [1]
> > > > 
> > > > [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com/    
> > > 
> > > Ok, I now see that the logic is you simply fail to proceed with writes
> > > if the library's latest understood version is < last_comp_version_w.
> > > 
> > > As I said elsewhere, this approach doesn't particularly make sense to
> > > me.  If lib_version >= last_comp_version you *can* write, even if it
> > > means stripping everything that's not understood at lib_version.
> > > 
> > > So the real question here is how do we know, for any given structured
> > > tag, what write operations require the version to be downgraded (which
> > > might in turn require this and/or other structured tags to be stripped
> > > entirely).  
> > 
> > The rules is well known.  
> 
> I really don't think they are.  You've proposed one set of rules (as
> code) - although I don't think they quite make sense.  I've proposed
> another.  Other variants are possible.
> 
> > An old libfdt version will strip the tag and
> > downgrade the version. If, when we define a new tags this rules cannot be
> > follow by olf libfdt version, last_comp_version_w will be set to protect
> > against modification.
> > 
> > Maybe the problem is just downgrading the version.
> > 
> > Instead of downgrading it could be better if we mark the dtb "one or more
> > 'unknown' tags have been removed due to a write by an old libfdt version" ?
> > 
> > We have a dt_flags header field. We can dedicate one bit for this marker.
> > 
> > Could it make sense ?  
> 
> I really dislike this idea.  It means we effectively have at least two
> variants of every version which strikes me as pretty confusing.
> 
> > > This is related to (though not the same as) the question of whether
> > > introducing a new structured tags requires a bump to the dtb version
> > > (though not to last_comp_version, of course).
> > > 
> > > Here's the simplest model I can think of.  It's what I'd suggest,
> > > unless one of it's limitations is a showstopper for what you have in mind:
> > > 
> > >  - version and last_comp_version retain their meanings.  No new header
> > >    version.
> > >  - New structured tags *do* require a new version.  If a dtb wants to
> > >    include a specific tag, it must label itself with a version that
> > >    defines that tag.  To enforce that:
> > >     - For read operations, if we encounter a (known) tag that
> > >       doesn't belong in the header version, we throw an error (either
> > >       BADSTRUCTURE, or a new error for the purpose).
> > >        - If version <= FDT_LAST_SUPPORTED_VERSION and we encounter an
> > >          unknown tag that also trips the error (since if it was
> > > 	 defined in this version, we should know about it).
> > >     - For write operations (including in-place), we always error if
> > >       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
> > >     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_VERSION.
> > >       It will strip all unknown structured tags from the entire tree
> > >       and downgrade the version to FDT_LAST_SUPPORTED_VERSION.
> > > 

Ok, my proposal seems to be a no-go and so I will follow your proposal given
above.

Just to clarify, correct me if I am wrong.

When read if we encountered a skippable unknown tag (this is possible if
version > FDT_LAST_SUPPORTED_VERSION), we just skip the tag without any
error.

For write, "we always error if version > FDT_LAST_SUPPORTED_VERSION".
If fdt_open_into() has been called before the write operation, this will
not happen. Indeed, we have downgraded the version to FDT_LAST_SUPPORTED_VERSION
and removed all unknown skippable tags.

Also, during this downgrade process (downgrade version + remove skippable
unknown tags), if a unknown tag that cannot be skipped is found, the downgrade
process fails an return an error.

Best regards,
Hervé
