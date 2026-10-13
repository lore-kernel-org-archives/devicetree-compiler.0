Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0814FD78D;
	Tue, 13 Oct 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911047; cv=none; b=sy6+iBPkxRfU/Jx/qkQh0nWzt8hg3c2BfgmMyQqI6Jl4NNezQaC4cW6bRhteNPFvqOGX1TOGSXpkXG1XcK7MhTpNDXCAne8IeOzU6pdTQuQTlqeolZRiJYt6StXvdPaBJ48iMWyCWUbTWT0n8IgxMAseZwyOPXS4HQh6ZSfhISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911047; c=relaxed/simple;
	bh=x0tlcIF2lObPCdrx3V3Hg3SZs1jyCigLQXwl1Sc4VK0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0q0f8uziuYlCoL2jDtKESmmeui3ZgzCIutVTOe7gya/BhIVcYxfnkG171jp/Fk9L+7v8NuJ+3DaF5shzHmm0DtKT8wW8fc5OqOUxY+AOM076DTaahg6YfOB6YQRWJ1g8/ChvdNjYJEOjX8f8ukU7GwbuRFSCVzF9ePgXFlsl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iMwrHCj5; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iMwrHCj5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FB6E4E4120E;
	Tue, 13 Oct 2026 17:04:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC78E60362;
	Tue, 13 Oct 2026 17:04:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06E2611D71770;
	Tue, 13 Oct 2026 19:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791911037; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K5KzQ9Q3OfGaPYx8IICSG1GMcopMbejHgte/43UVeBk=;
	b=iMwrHCj5Q9XMd1RPed6KNzyVpgWx/Xr1MJr1N4qJrvg8QjCbEY6dsx8KfVQiBv0NzEudfJ
	FzDBFLA7C7AN736GVEVy1RQYHgHKAQCaM4t0dWdGOcWza3+uEGduASQhq6yTvxXrbiirKg
	ee4clz97AfKwB31k3wp23dmRj+3v2P5fSzIGstqzzNeAhKxyxWGkH3zftEonto5KhMXkVk
	UitekmJ/shqG+9BGYxY3EJcmHeJnLR3jXb2qTyW5NByioSu27OaRVBH2yx4mm/h1TpEa/f
	rMCSDmkeef9NURIERhwaYslWq02vuvHoypPErKzs060Cl18PKteNXdgSQpPrfA==
Date: Tue, 13 Oct 2026 19:03:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>, Rob Herring
 <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <20261013190347.4f1d9b9d@bootlin.com>
In-Reply-To: <as3ZWBr3wRonkxXF@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-16-herve.codina@bootlin.com>
 <arDMhoNNXcPi81sR@gractus.seuss>
 <20260925152157.511dc65c@bootlin.com>
 <as3ZWBr3wRonkxXF@gractus.seuss>
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

Hi David, Rob,

On Tue, 13 Oct 2026 18:10:39 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Mon, 21 Sep 2026 16:20:02 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:  
> > > > This v18 version will add support for
> > > >   - Structured tags.
> > > >     Those tags value definition will allow "old" libfdt, dtc and other
> > > >     tools to skip unknown tags if encountered in future dtb version.
> > > > 
> > > >     libfdt, dtc and other tools implementing version v18 will be able to
> > > >     skip unknown tags available in dtbd generated with later version of
> > > >     dtc.
> > > > 
> > > >   - dt_flags header field.
> > > >     For now this flag field is set to 0. It is a placeholder for future
> > > >     dtb version and could be used to store some dtb related information
> > > >     such as the kind of dtb. For instance, the future addons format will
> > > >     use this field to clearly identify that the dtb is an addon dtb.
> > > > 
> > > >   - last_comp_version_w header field.
> > > >     This field is similar to last_comp_version but for writing.
> > > >     It contains the lowest version of the devicetree data structure with
> > > >     which the version used can safely perform modifications (taking into
> > > >     account following rules related to unknown tags).
> > > >     If this lowest version is greater than the last known supported
> > > >     version, modification are simply forbidden and lead to a
> > > >     FDT_ERR_BADVERSION error.
> > > > 
> > > > For modification, when an unknown tag that can be skipped is involved
> > > > and last_comp_version_w allows modifications, the following rules
> > > > apply:    
> > > 
> > > "last_comp_version_w allows modifications" is a bit hard to
> > > understand.  What exactly is the version number against which we're
> > > comparing that value?  
> > 
> > We had one last_comp_version.
> > 
> > Now we have two last_comp_version, one for reading and one for writing.
> > We compare again the dtb version supported by our libfdt version.
> > 
> > This comes from the discussion [1]
> > 
> > [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com/  
> 
> Ok, I now see that the logic is you simply fail to proceed with writes
> if the library's latest understood version is < last_comp_version_w.
> 
> As I said elsewhere, this approach doesn't particularly make sense to
> me.  If lib_version >= last_comp_version you *can* write, even if it
> means stripping everything that's not understood at lib_version.
> 
> So the real question here is how do we know, for any given structured
> tag, what write operations require the version to be downgraded (which
> might in turn require this and/or other structured tags to be stripped
> entirely).

The rules is well known. An old libfdt version will strip the tag and
downgrade the version. If, when we define a new tags this rules cannot be
follow by olf libfdt version, last_comp_version_w will be set to protect
against modification.

Maybe the problem is just downgrading the version.

Instead of downgrading it could be better if we mark the dtb "one or more
'unknown' tags have been removed due to a write by an old libfdt version" ?

We have a dt_flags header field. We can dedicate one bit for this marker.

Could it make sense ?

> 
> This is related to (though not the same as) the question of whether
> introducing a new structured tags requires a bump to the dtb version
> (though not to last_comp_version, of course).
> 
> Here's the simplest model I can think of.  It's what I'd suggest,
> unless one of it's limitations is a showstopper for what you have in mind:
> 
>  - version and last_comp_version retain their meanings.  No new header
>    version.
>  - New structured tags *do* require a new version.  If a dtb wants to
>    include a specific tag, it must label itself with a version that
>    defines that tag.  To enforce that:
>     - For read operations, if we encounter a (known) tag that
>       doesn't belong in the header version, we throw an error (either
>       BADSTRUCTURE, or a new error for the purpose).
>        - If version <= FDT_LAST_SUPPORTED_VERSION and we encounter an
>          unknown tag that also trips the error (since if it was
> 	 defined in this version, we should know about it).
>     - For write operations (including in-place), we always error if
>       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
>     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_VERSION.
>       It will strip all unknown structured tags from the entire tree
>       and downgrade the version to FDT_LAST_SUPPORTED_VERSION.
> 
> This does mean that every new tag does require a new version, which
> may make experimenting with new tags more awkward.  More
> significantly, it also means that any change requires a version
> downgrade, even if it's just updating a handful of properties.
> 
> On the plus side, it's fairly simple, retains as much as possible
> current version semantics.  Most especially there's no tricky
> questions about what sorts of writes might invalidate an unknown tag
> (they'll all be stripped by the time we permit a write operation).
> 
> If those limitations really are a showstopper, I do have a few other
> models that might work, though.

The use case we want to support (initially mentioned by Rob) can be summarize
in the following.

Assume:
 - bootloader: supported version 2.0
 - kernel: supported version 3.0
 - dtb version 3.0: New tags, skippable but unknown in version 2.0

The bootloader has to modify the dtb version 3.0. I has to add nodes such as
'choosen', 'memory', 'reserved-memory', plus probably modify some others
properties (usual fixup() stuff).

Then it passes this dtb to the kernel.

This bootloader (version 2.0) will encounter unknown tags. We don't want the
bootloader stops in that case and we just want him to do the best it can do
ending to pass the dtb to the kernel.

Indeed, if this bootloader writes a property with an unknown related tag, it
has to handle this unknwon related tag (rules already exposed).

When the dtb version 3.0 has defined new tags, the rules related to
modification performed are well known and several thinks can be done to avoid
the old bootloader applying modification rules.
- The tag is not skippable
  Game over for the old bootloader, an error is reported if the tag is found
- last_comp_version_w
  Game over for the old bootloader, modification not allowed.

In that case, the only solution is to bump the bootloader version.

> 
> > > >   - When a property is modified, tags related to this property are
> > > >     removed and the dtb version is downgraded.    
> > > 
> > > We need a definition of what "related to" means somewhere.  
> > 
> > Yes a tag is said related to a property if it is available after its FDT_PROP and
> > before the next FDT_PROP (other proterty) of FDT_BEGIN_NODE (subnode) for FDT_NODE_END
> > (end of node).
> > 
> > This is defined by "structured tag"
> > 
> > Devicetree Specification will be updated to have all of this documentation
> > available.  
> 
> Ok.
> 
> > > >   - When a property is removed, tags related to this property are
> > > >     obviously removed. The dtb version is kept unchanged.
> > > > 
> > > >   - When a property or a node is added, obviously no unknown tags are
> > > >     added and the dtb version is kept unchanged.    
> > > 
> > > Again, this rule doesn't make sense to me at the same time as the
> > > property modification rule.  
> > 
> > A current libfdt/dtc version cannot add tags which will be defined in the
> > future.  
> 
> Sure, but it can still add whole new nodes or properties.  The
> question is whether a version can mandate the presence of certain
> tags.  Dowgrading the version when we strip tags from a modified
> property suggests "yes", but _not_ downgrading the version when we
> add new property suggests "no".

If the version mandate some tags on nodes and properties, last_comp_version_w
will be used to block old bootloaders. They are not more allowed to modify the
dtb. They need to be bumped to newer versions.

> 
> > > >   - When a node is removed, tags related to this node are obviously
> > > >     removed. The dtb version is kept unchanged.
> > > > 
> > > >   - Adding, removing or modifying a property is not considered as a node
> > > >     modification and so, those operations have no impacts on unknown
> > > >     tags related to the node. Those node related tags are kept
> > > >     unchanged.
> > > > 
> > > >   - The only modification considered as a node modification is setting
> > > >     its name. We consider that this operation has no impact on tags
> > > >     related to the node. Here also, those node related tags and the dtb
> > > >     version are kept unchanged.
> > > > 
> > > >   - Global (dtb related) unknown tags are kept unchanged regardless the
> > > >     modification done.
> > > > 
> > > > In all cases, if unknown tags are not involved in a modification, the
> > > > dtb version is not downgraded when the modification is made.
> > > > 
> > > > It is worth noting that with this v18 version, the dtb version is not
> > > > downgraded for any modification but only when unknown tags are removed
> > > > due to a property modification. In v17 or older version any modification
> > > > led to a dtb version downgrade.    
> > > 
> > > I don't think removing that behaviour is safe.  Even if the rules
> > > above make sense specifically for the metadata tags (which I'm not yet
> > > convinced of), that's not sufficient.  If nothing else, future
> > > versions could add extra header fields.  If we modify the tree, those
> > > header fields could be stale, or even removed.  
> > 
> > last_comp_version_w will be used by the future version to prevent this
> > kind of issue with old version.
> > 

Best regards,
Hervé
