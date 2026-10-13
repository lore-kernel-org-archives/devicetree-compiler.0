Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784A52123E
	for <devicetree-compiler@vger.kernel.org>; Tue, 13 Oct 2026 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911108; cv=none; b=bi8dXPj4SuQ+DLgIxVvYpfjxX8Maq5XLa6mEmcAqkQa4GgZzcUqPBXHJvvDKYnBfoF2cgByXXPjuXj2zxElgznLWq+HIrq6yvMpQo+ZaKK2p5fo1v0Ev69sdrFQZheat1rdbhQ/4Ecv3DoH9aWGzb+Nbv7thuuAjLRCIruseCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911108; c=relaxed/simple;
	bh=2QlKdhqLjOY5e3Bdkpg6nTgY/XoA5wIjighrEK3eFYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dk5TPaaF4/24m4e90866AQo6HXi932EBopyFzF4y7OTIs7/+Z5LAP3w2iSuVNz6x7o+rHV61EfaWcuIljH7/UILwcJTNGrmPmcBQIMlf6UM5II3BF40ffGKUSdMI1p4hhkZjP4PLxKwq0XOmmNKbtpaB58CB9ZqKd1AepvUIk2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=dI8x3VSt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="dI8x3VSt"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso1111766a12.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 13 Oct 2026 10:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1791911106; x=1792515906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CwU5LaJ8KTA2IGMIL390JbjNAV+cV5JYFFixG+zisXw=;
        b=dI8x3VStpoT4IYd3lebvRxmq3GRz0RNa/rCL5ppyDznT/aNACXIN+TSPIAcPrw8MP+
         cWfczgXhBkQqiEeCa71zRpBq8U0KWcuu4+MJjDEXFaCYfXNrmqsSj+ZD6pGrsl3txqPG
         LGqwIYKnfl3oAAQ3wiSJIVGjBMEY6IL2As3FjDeWPappfgBwyqubPH8fOKTGc6hlMW8y
         mXJYpcP0KsrdPdxU6O2UIlcfjxF0ezlQV3pWAdgokdF7Sh9OZHZbClK+Vp6SZrHSvWWd
         CcNamPbujBsVSa7HavvfkDJjAghe7yMEi8spYtSmwzG6ewcC7wA87NBKsYf8JshmT8fK
         EhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911106; x=1792515906;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwU5LaJ8KTA2IGMIL390JbjNAV+cV5JYFFixG+zisXw=;
        b=F5OQQHAcxR5RpCcbb0RJu5OL3aYlKIrzo1VYobUDy1nQXN3+ti2H0VoduMeTmfnI/h
         NfOblYeyP35i6Yzmk4sXqTx2MzNlUqH6PPr9crWJXYJze/1Ldesa7xo7q/J9RyZJqxT7
         s+qACDg9W5BzrHETodqfjTIbHk+GeVJ+Fwj2+YY1j0uQmXHuBmL+2uiSOxY0QHu2oaM2
         LU6NwKJNbo2qUoW/ZYgjrH5Aj8ICLgPN/UzV8pNtcPACf6ykC1F6lhOuKK4/1kzSJOlu
         HqKLlYW7BYssuDLOhQFrl3Gcnzq1aoGPBnr8gvvOec2oWYKTobfHn1zkxOUuRdDT4w5I
         txGg==
X-Forwarded-Encrypted: i=1; AKwUvBxS8R8AVPWbgBKdaTe48dDUop7eLmOa484Go8mptaIxRV0a+nvlIoNAIkLr1iuupyAdUclDWG75HGuVxUVznsVakEdQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJEDuLo8eqOcgaP0L6mQUWEaZEoso+Wlt2vHW2UdTfqQX//uomR
	/d0zQEPjsNf/o/b16/ZctklnS/JVeDgGyMKmjqIgWJlyhKd1GfIc8Iyq7luVhzUHzA==
X-Gm-Gg: AYBFou3Csqr9aG0wzuWf1cT3vp685VcKug15uEY3v7i3AdOEy9m1L1Yr8rczVAiUxpC
	AqE0L/K3xd+6p4YgUMhK7AJeDzGdtIwck3KXoA9AwC0C4YJbvwbrc2nxwU2UajpwNjnvA0o8wRy
	+xFdC67uv/kyazTfXnNc6Q0wt74T3DDHkSjmugzN0Smhbi/uh/noNl0282sQ4DPs+ElFJrS8H6f
	hoUNiBw1Y+HMTfIfCGdHLYLO7cX94nCzJO336gODP1niA3+YB+XRdBq6AnJ/gmMr5d5mSPdPs/J
	lSPAjjqKyRskNMCMP9TeM0sWS9Vkmqh4+lNf6VlJ4y6Tg5A2Qe6AGIVpGALcHbzboC7iRyu7toU
	p0AC75yURx8VLT1CkmxZVdffJ0DPOTD0KnJQX7Cfonc+mVUAQyDNbkI3tjkl7HsaE0ZqYfUmWis
	Hwb6fHco70iwW1RMRdOh+JFz2ccJMybHukWVROhOHAt9+5thDtqlteL2bzAL3dOxTQ0TAihNG9c
	w==
X-Received: by 2002:a17:90b:524f:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3ab3a239c16mr10909223a91.5.1791911106085;
        Tue, 13 Oct 2026 10:05:06 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac60e83ccdsm385592a91.15.2026.10.13.10.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:05:05 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Herve Codina <herve.codina@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  David Lechner
 <dlechner@baylibre.com>,  Ayush Singh <ayush@beagleboard.org>,  Geert
 Uytterhoeven <geert@linux-m68k.org>,  devicetree-compiler@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  devicetree-spec@vger.kernel.org,  Hui Pu <hui.pu@gehealthcare.com>,  Ian
 Ray <ian.ray@gehealthcare.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
In-Reply-To: <as3ZWBr3wRonkxXF@gractus.seuss> (David Gibson's message of "Tue,
	13 Oct 2026 18:10:39 +1100")
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss> <20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss>
Date: Tue, 13 Oct 2026 22:34:57 +0530
Message-ID: <87pkxd4jly.fsf@beagleboard.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David Gibson <david@gibson.dropbear.id.au> writes:

> On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:
>> Hi David,
>>=20
>> On Mon, 21 Sep 2026 16:20:02 +1000
>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>=20
>> > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:
>> > > This v18 version will add support for
>> > >   - Structured tags.
>> > >     Those tags value definition will allow "old" libfdt, dtc and oth=
er
>> > >     tools to skip unknown tags if encountered in future dtb version.
>> > >=20
>> > >     libfdt, dtc and other tools implementing version v18 will be abl=
e to
>> > >     skip unknown tags available in dtbd generated with later version=
 of
>> > >     dtc.
>> > >=20
>> > >   - dt_flags header field.
>> > >     For now this flag field is set to 0. It is a placeholder for fut=
ure
>> > >     dtb version and could be used to store some dtb related informat=
ion
>> > >     such as the kind of dtb. For instance, the future addons format =
will
>> > >     use this field to clearly identify that the dtb is an addon dtb.
>> > >=20
>> > >   - last_comp_version_w header field.
>> > >     This field is similar to last_comp_version but for writing.
>> > >     It contains the lowest version of the devicetree data structure =
with
>> > >     which the version used can safely perform modifications (taking =
into
>> > >     account following rules related to unknown tags).
>> > >     If this lowest version is greater than the last known supported
>> > >     version, modification are simply forbidden and lead to a
>> > >     FDT_ERR_BADVERSION error.
>> > >=20
>> > > For modification, when an unknown tag that can be skipped is involved
>> > > and last_comp_version_w allows modifications, the following rules
>> > > apply:=20=20
>> >=20
>> > "last_comp_version_w allows modifications" is a bit hard to
>> > understand.  What exactly is the version number against which we're
>> > comparing that value?
>>=20
>> We had one last_comp_version.
>>=20
>> Now we have two last_comp_version, one for reading and one for writing.
>> We compare again the dtb version supported by our libfdt version.
>>=20
>> This comes from the discussion [1]
>>=20
>> [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49o=
n8VfkP7CDvw@mail.gmail.com/
>
> Ok, I now see that the logic is you simply fail to proceed with writes
> if the library's latest understood version is < last_comp_version_w.
>
> As I said elsewhere, this approach doesn't particularly make sense to
> me.  If lib_version >=3D last_comp_version you *can* write, even if it
> means stripping everything that's not understood at lib_version.
>
> So the real question here is how do we know, for any given structured
> tag, what write operations require the version to be downgraded (which
> might in turn require this and/or other structured tags to be stripped
> entirely).
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
>        - If version <=3D FDT_LAST_SUPPORTED_VERSION and we encounter an
>          unknown tag that also trips the error (since if it was
> 	 defined in this version, we should know about it).
>     - For write operations (including in-place), we always error if
>       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
>     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_VERS=
ION.
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

The limitations do not sound too bad. And it feels easier to implement than
keeping track of read and write versions separately for each new tag.

>
>> > >   - When a property is modified, tags related to this property are
>> > >     removed and the dtb version is downgraded.=20=20
>> >=20
>> > We need a definition of what "related to" means somewhere.
>>=20
>> Yes a tag is said related to a property if it is available after its FDT=
_PROP and
>> before the next FDT_PROP (other proterty) of FDT_BEGIN_NODE (subnode) fo=
r FDT_NODE_END
>> (end of node).
>>=20
>> This is defined by "structured tag"
>>=20
>> Devicetree Specification will be updated to have all of this documentati=
on
>> available.
>
> Ok.
>
>> > >   - When a property is removed, tags related to this property are
>> > >     obviously removed. The dtb version is kept unchanged.
>> > >=20
>> > >   - When a property or a node is added, obviously no unknown tags are
>> > >     added and the dtb version is kept unchanged.=20=20
>> >=20
>> > Again, this rule doesn't make sense to me at the same time as the
>> > property modification rule.
>>=20
>> A current libfdt/dtc version cannot add tags which will be defined in the
>> future.
>
> Sure, but it can still add whole new nodes or properties.  The
> question is whether a version can mandate the presence of certain
> tags.  Dowgrading the version when we strip tags from a modified
> property suggests "yes", but _not_ downgrading the version when we
> add new property suggests "no".

Well, I could see version mandating the presence of certain tags for
devicetree overlays at least. Not quite sure if the same would apply for
new addon board overlays though.

>
>> > >   - When a node is removed, tags related to this node are obviously
>> > >     removed. The dtb version is kept unchanged.
>> > >=20
>> > >   - Adding, removing or modifying a property is not considered as a =
node
>> > >     modification and so, those operations have no impacts on unknown
>> > >     tags related to the node. Those node related tags are kept
>> > >     unchanged.
>> > >=20
>> > >   - The only modification considered as a node modification is setti=
ng
>> > >     its name. We consider that this operation has no impact on tags
>> > >     related to the node. Here also, those node related tags and the =
dtb
>> > >     version are kept unchanged.
>> > >=20
>> > >   - Global (dtb related) unknown tags are kept unchanged regardless =
the
>> > >     modification done.
>> > >=20
>> > > In all cases, if unknown tags are not involved in a modification, the
>> > > dtb version is not downgraded when the modification is made.
>> > >=20
>> > > It is worth noting that with this v18 version, the dtb version is not
>> > > downgraded for any modification but only when unknown tags are remov=
ed
>> > > due to a property modification. In v17 or older version any modifica=
tion
>> > > led to a dtb version downgrade.=20=20
>> >=20
>> > I don't think removing that behaviour is safe.  Even if the rules
>> > above make sense specifically for the metadata tags (which I'm not yet
>> > convinced of), that's not sufficient.  If nothing else, future
>> > versions could add extra header fields.  If we modify the tree, those
>> > header fields could be stale, or even removed.
>>=20
>> last_comp_version_w will be used by the future version to prevent this
>> kind of issue with old version.
>>=20
>> Best regards,
>> Herv=C3=A9
>>=20
>>=20


Best Regards,
Ayush Singh

--=20
BeagleBoard.org Foundation
https://www.beagleboard.org
