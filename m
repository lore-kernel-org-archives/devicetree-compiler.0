Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A116F27E
	for <devicetree-compiler@vger.kernel.org>; Mon,  5 Aug 2024 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722898778; cv=none; b=H/tMSsQbszv+6DXJROGCn/+lgHWCpW2dkh7FcgXw208hFpxcjgnFQVzlRmCJiH5f32hwFoJK/dBaxqwE4w6m4LJ0iucK66n/kUMUvdKJPBuKZZj3A1i/BqkwmtcIw36bRlmJCjHdc72uez+3yTY2lNIbax+SxZWRpmRl6E2LLTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722898778; c=relaxed/simple;
	bh=ABVvhFFs0IIqNm5Nek2gAMxsE+8nHtZB9ZKZj2nwffM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlYZLbGeKbWQDOLhggy2nNOprS2Bp54OhjfPQjxr0CmblLcWb4R1nH6H0CQaSvWx0SF5PVHdVEHq/HNwI+Y0W/mU7gFizbTR5ouZXcacWvR7LPZlacxFuZE18jL9xwTDBwnVz6bWXIiKQzZ5dGrABJtd7FaD/nJAeU1nuMsPNWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVLj26Qd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVLj26Qd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A474C32782;
	Mon,  5 Aug 2024 22:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722898777;
	bh=ABVvhFFs0IIqNm5Nek2gAMxsE+8nHtZB9ZKZj2nwffM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVLj26QdsFfgmW06x/lRYc7cAhlgBdRPuoouYwRSnIsVvcZ314RzZl4NOegNwxsB1
	 Ts2Sa0cBXwlJylynZ8eRp1lphPyGXpcYKxZm1dZSZOCiF5ZvKWtgbNgxDmXZ8VqcWf
	 3daCgXosRLjvc3MrYwWJDXy1l6dhZ4H/Y1Hiv7jFrvGvwMvjaFToA4ofwKPRnRFgkS
	 B6hyE8jGScU0ldAEPnXde/DCiS0+0AXTb07DpJZnYJS0QzSwqQElR48dFOtyp3+0Gd
	 EHXrw+d+b4nNkjfKJ2CN3SqVNc1k7fbOD+p/pLcgYNRgSh6CZOUDGW4rpkI8asiNjc
	 fsq/OWWLCfMVw==
Date: Mon, 5 Aug 2024 16:59:35 -0600
From: Rob Herring <robh@kernel.org>
To: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: Array manipulation revisit
Message-ID: <20240805225935.GA3452523-robh@kernel.org>
References: <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <Zq3QIVrmUTTc4gjC@zatzit>
 <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>

On Mon, Aug 05, 2024 at 04:35:14PM +0000, Hoover, Erich (Orion) wrote:
> > From: David Gibson
> > Sent: Saturday, August 3, 2024 12:37 AM
> > ...

Please wrap quoted lines...

> > dtb overlays are kind of a hack layered on top of dtb, and don't 
> > have a way to represent things at a granularity less than a whole 
> > property (except for special handling of phandles).
> 
> I'm going to say that they seem to be a _very_ useful hack.
> 
> > Introducing new syntax to dts always requires care to not break 
> > compatibility, but that's really the least of the problems here.  
> > To implement this you'd need to invent a way of encoding partial 
> > property updates into dtb, which would be an incompatible 
> > extension.  It would need to cover ways of describing the part of 
> > the property to be replaced more complex than fixed byte offsets to 
> > handle the string list case here.
> 
> Maybe I'm being naive, but I think that this syntax could be very 
> simple.  It looks to me like the current implementation disallows 
> properties with brackets in the name, so I would propose taking 
> advantage of that to create an invalid property name:
>     PROPERTY[S*INDEX] = /bits/ BITS VALUE;
> where S (single byte element size) is one of 1,2,4,8 or s (string 
> array).  I could see "S*" being filled in automatically from the RHS 
> data type (but override-able if you need to do something special).  
> So, in our string array case that means:
>     PROPERTY[INDEX] = "string";
> becomes a property named "PROPERTY[s*INDEX]" with the value "string" 
> when stored in the dtbo.

The above doesn't work because existing software can't parse it if it 
is invalid.

This just continues the hack that is overlays. The hack is putting 
information which should be in the format itself (DTB) into the contents 
instead. The lack of type information is a major root issue. That's why 
__fixups__ and __local_fixups__ nodes exist. They store phandle 
locations with properties.

I think the major mistake we made with overlays was trying to preserve 
DTB format. That's ended up being pretty pointless because we have to 
update software applying overlays anyways. So why not just make the 
updated s/w understand a new DTB format. We could have required applying 
an overlay required a DTB in the new format (you need a rebuilt DTB 
anyways to add the symbols to it). Backwards compatibility could have 
been maintained by outputing the old format before passing to the OS. 

The other issue is when a new DTB format is proposed, it becomes a 
laundry list[1] of changes that goes nowhere.

What I think we should do is first rev the DTB format to allow for 
unknown tags so we can add additional, optional data which software can 
safely ignore. That would be an incompatible change. After that, we can 
add new tags in a backwards compatible way. Roughly what's needed is the 
same information stored in dtc's "marker" data: types and offsets.

> > It would need to cover ways of describing the part of the property 
> > to be replaced more complex than fixed byte offsets to handle the 
> > string list case here.
> 
> It seems like string arrays are the only complicated case, and by 
> knowing that it's a string array (like with the above "s" size byte) 
> the implementation can count NULL bytes to find the correct element to replace.

prop = "foo\0bar", "baz";

How many strings in "prop"? :)

Strings are actually the easy case IME as the heuristics to determine 
if a property is a string works pretty well (minus the above which is a 
test case in dtc, but not something I've seen in practice). It's 
determining the size of integer arrays I have problems with (in context 
of schema validation).

> > Finally you'd need to update libfdt (and any other overlay 
> > implementation out there) to process this new fixup information.
> > 
> > So, yeah, it's not going to happen.

Why not? Yeah, updating stuff is painful, but so is not fixing some of 
these problems. Are we just going to live with them forever? I think the 
reality is most things use libfdt (probably everything that cares about 
overlays) and they update libfdt at some frequency. And how old of a 
component do we really need to worry about compatibility with? 

This reminds me of the saying about planting trees. When is the best 
time to break compatibility? 15 years ago. When is the 2nd best time? 
Now. 

Rob

[1] https://elinux.org/New_FDT_format
