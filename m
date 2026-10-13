Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706315293E2;
	Tue, 13 Oct 2026 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912238; cv=none; b=OVjmBzVWodqXpbZccHk7GPgVEvi5HouvBPYafoTg11+EhAr6t9ajOqKSxdafIL5bydcAQGEe+c+/nUYCgfe3THW6r0x83x4ZvI440+z4CbWjQu4Vfrh7isnzNH5fcXlguAGrrRhFei3ab6e8xlkg0nl1xpIcIX/+jpQLA8XN0so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912238; c=relaxed/simple;
	bh=tK2OGl3xeNMgKZVkLjUbZxnfRXKUj9NbM/tn9N/vSuA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8ERQUaWNxrJvSkCoOE5JLQpO/EFRMFhMuICzxUinCxOpro4rysWr8dHZ++CAEqG0istxHXt69Cjfu1P8g1Ccf3cHtKxAPF1UIYJPHI3V/cs+CqX46KKGmB+BBYya0dyKZ+CPmmRS65uyDLnGRM/7/RGG/OGLV1SECROSWxOsSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E4XZH0iY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E4XZH0iY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23920C653F4;
	Tue, 13 Oct 2026 17:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50B8C60362;
	Tue, 13 Oct 2026 17:23:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5332411D717E5;
	Tue, 13 Oct 2026 19:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791912228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FBCU3cnsQNTB/upJFEC51yCJG78geiS2NW/P2INPGOA=;
	b=E4XZH0iYJAAyOMdvl3v1KvL0+YIVBzoqcS6hwt7REAmzryrf95QpRY3fs1ZAf8/ZfBMAaX
	Ndb86G/KMViHNHcklE+A/7MguLJMbGwQetjPGXeJJ7SiW3V6mkEeFTR9Se6THB/REiIb9i
	vRs7VNN3AXMiCDtwbVnPkL/lZswaX0Xq0G0gzXhbBYAkouwTpZmbnHVteWKSLsIDZ6bH9d
	Kh91QBh2Sh5rO/aWOMv/xmpWT0g2s/w3s0lIh8Vnij7+1g5wNVzgMK4ejE9wWHqZbMO0w+
	au96yPsPyBhfEQV4GHvFvX5aCMDNIIy9Tnkq9hBZ3CPSBDo2GzYQAlsgOGPvSQ==
Date: Tue, 13 Oct 2026 19:23:42 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <20261013192342.149768ed@bootlin.com>
In-Reply-To: <87pkxd4jly.fsf@beagleboard.org>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss>
	<20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss>
	<87pkxd4jly.fsf@beagleboard.org>
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

Hi Ajush,

On Tue, 13 Oct 2026 22:34:57 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> David Gibson <david@gibson.dropbear.id.au> writes:
> 
> > On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:  
> >> Hi David,
> >> 
> >> On Mon, 21 Sep 2026 16:20:02 +1000
> >> David Gibson <david@gibson.dropbear.id.au> wrote:
> >>   
> >> > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:  
> >> > > This v18 version will add support for
> >> > >   - Structured tags.
> >> > >     Those tags value definition will allow "old" libfdt, dtc and other
> >> > >     tools to skip unknown tags if encountered in future dtb version.
> >> > > 
> >> > >     libfdt, dtc and other tools implementing version v18 will be able to
> >> > >     skip unknown tags available in dtbd generated with later version of
> >> > >     dtc.
> >> > > 
> >> > >   - dt_flags header field.
> >> > >     For now this flag field is set to 0. It is a placeholder for future
> >> > >     dtb version and could be used to store some dtb related information
> >> > >     such as the kind of dtb. For instance, the future addons format will
> >> > >     use this field to clearly identify that the dtb is an addon dtb.
> >> > > 
> >> > >   - last_comp_version_w header field.
> >> > >     This field is similar to last_comp_version but for writing.
> >> > >     It contains the lowest version of the devicetree data structure with
> >> > >     which the version used can safely perform modifications (taking into
> >> > >     account following rules related to unknown tags).
> >> > >     If this lowest version is greater than the last known supported
> >> > >     version, modification are simply forbidden and lead to a
> >> > >     FDT_ERR_BADVERSION error.
> >> > > 
> >> > > For modification, when an unknown tag that can be skipped is involved
> >> > > and last_comp_version_w allows modifications, the following rules
> >> > > apply:    
> >> > 
> >> > "last_comp_version_w allows modifications" is a bit hard to
> >> > understand.  What exactly is the version number against which we're
> >> > comparing that value?  
> >> 
> >> We had one last_comp_version.
> >> 
> >> Now we have two last_comp_version, one for reading and one for writing.
> >> We compare again the dtb version supported by our libfdt version.
> >> 
> >> This comes from the discussion [1]
> >> 
> >> [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com/  
> >
> > Ok, I now see that the logic is you simply fail to proceed with writes
> > if the library's latest understood version is < last_comp_version_w.
> >
> > As I said elsewhere, this approach doesn't particularly make sense to
> > me.  If lib_version >= last_comp_version you *can* write, even if it
> > means stripping everything that's not understood at lib_version.
> >
> > So the real question here is how do we know, for any given structured
> > tag, what write operations require the version to be downgraded (which
> > might in turn require this and/or other structured tags to be stripped
> > entirely).
> >
> > This is related to (though not the same as) the question of whether
> > introducing a new structured tags requires a bump to the dtb version
> > (though not to last_comp_version, of course).
> >
> > Here's the simplest model I can think of.  It's what I'd suggest,
> > unless one of it's limitations is a showstopper for what you have in mind:
> >
> >  - version and last_comp_version retain their meanings.  No new header
> >    version.
> >  - New structured tags *do* require a new version.  If a dtb wants to
> >    include a specific tag, it must label itself with a version that
> >    defines that tag.  To enforce that:
> >     - For read operations, if we encounter a (known) tag that
> >       doesn't belong in the header version, we throw an error (either
> >       BADSTRUCTURE, or a new error for the purpose).
> >        - If version <= FDT_LAST_SUPPORTED_VERSION and we encounter an
> >          unknown tag that also trips the error (since if it was
> > 	 defined in this version, we should know about it).
> >     - For write operations (including in-place), we always error if
> >       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
> >     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_VERSION.
> >       It will strip all unknown structured tags from the entire tree
> >       and downgrade the version to FDT_LAST_SUPPORTED_VERSION.
> >
> > This does mean that every new tag does require a new version, which
> > may make experimenting with new tags more awkward.  More
> > significantly, it also means that any change requires a version
> > downgrade, even if it's just updating a handful of properties.
> >
> > On the plus side, it's fairly simple, retains as much as possible
> > current version semantics.  Most especially there's no tricky
> > questions about what sorts of writes might invalidate an unknown tag
> > (they'll all be stripped by the time we permit a write operation).
> >
> > If those limitations really are a showstopper, I do have a few other
> > models that might work, though.  
> 
> The limitations do not sound too bad. And it feels easier to implement than
> keeping track of read and write versions separately for each new tag.

But it doesn't handle the use case I mentioned in a previous reply :(

bootloader knows about version 2.0
kernel knowns about version 3.0

dtb 3.0 we want the bootloader to skip tags it doesn't know about but this same
bootloader has to handle 'unknown' tags on some modification. We want to have 
possibilities to let this bootloader perform those modifications (under precise
known rules) and pass this dtb to the kernel.

Best regards,
Hervé
