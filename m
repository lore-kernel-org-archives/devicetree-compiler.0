Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690796;
	b=S6BaY6v6j1ZSsov+xDlzqGZVPVY2XCy6Y5DEf3mjkkbCnpDWw6KopUcDkBqEK1//B0S7
	 OFJbsXOvqGJrXkLEmcy5RSQpLBpHokZ2wo7PNx/5LaaeUhfI5C2pkiiSHaqCZZteKJFv1
	 T7smmyxOaeZ5jZi+lwM4FHleyDHYhnhT8W5cRfCwa1bQTA4hKeMYAjTt4JK9FDtt/YOkq
	 zXUqDDMAHu3tL6+Bx5jm/FoSAtNHNSbbU7FAx8UQkaHc3BSj0om3vjArbJE3hw6TbKArR
	 llONtm3qwJCKBlhMEYU5YBP7yKProIVXZ8CUtMbW2FbErsFPW6QUyCt9nmWrAI0o+0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690796;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=jhI6FXwYpx47+zwqAND4mqOUH+7Ds+/TzFfIS6JU1MI=;
	b=f0eWHctM+QHEpowx+d0xIeVpuAJ9YAmKmPSn7b1yGQaaEj8Dz0xGLYYn4zaLZP6bUrtY
	 cFWkkxJnRIirS6ySYze0H76uCLsf/EneMuCE2SwU2VSklMQn9UP9Qg3yRMHV1VRhE2roL
	 MVho5Ll/jz2rdqL9iE+fEBB6jnojLA0tPf6hDx6iDgmT/MKEzcm7+ZpcOrOzOxVEFycRm
	 epWy27acS4npsPj6Bc+UjbRRGuIi4snnLGBKbsbwydNxAk0em50SFYv4R8cQiaqAsCu8B
	 +VkVP6ajIMS8yqRS/1bFXLvPy1y+u79hX/fN7JPvYXHm/jRr2VCME/Rk0Yuk5YRzhpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGlKoUMy;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B77D606A324;
	Tue,  3 Nov 2026 07:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B77D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UGlKoUMy
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 316524E408FC;
	Tue,  3 Nov 2026 07:26:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E54DA6046C;
	Tue,  3 Nov 2026 07:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B08D10328267;
	Tue,  3 Nov 2026 08:26:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793690790; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jhI6FXwYpx47+zwqAND4mqOUH+7Ds+/TzFfIS6JU1MI=;
	b=UGlKoUMyhmxd0IApOHoj7n185Nu1LOmEwT+ktbsv2ML6sk0pxl2vskBdoPin+FQ7FGBMyI
	SZ8gLVaoUOqPpI0mpyFepLVTO9b5+g2OhSgO/ufz4l+peArZXGUt/bxCehu/Sc4n/4/lLX
	Was6OH5y68zduHCVjeZFWOhZKSCcEKSboPmEk0mCPNznJ4e66gWmYeCaco3JbiO6Eqbm5n
	JAzodUZeROiP7lQHyQ2BEQpnj2I6NZbMwy9+6KHR/K3gAMctZgXYKBjpPQme+Basd3TXln
	9lcHNaaCDea2UGSanNBJfX95NSYKybRbEMg6rHIshf9SmbkxNwix1iE/JBvViQ==
Date: Tue, 3 Nov 2026 08:26:24 +0100
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 10/74] tests: Add basic metadata tests
Message-ID: <20261103082624.01855353@bootlin.com>
In-Reply-To: <auVdylQ7ny1FvL-5@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-11-herve.codina@bootlin.com>
	<auQqI8WEOVeDRZM_@gractus.seuss>
	<20261030120117.24afadf7@bootlin.com>
	<auVdylQ7ny1FvL-5@gractus.seuss>
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

On Sat, 31 Oct 2026 14:17:47 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Oct 30, 2026 at 12:01:17PM +0100, Herve Codina wrote:
> > On Fri, 30 Oct 2026 16:24:52 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 11:48:39AM +0200, Herve Codina wrote:  
> > > > This first test is related to local phandle references used in
> > > > properties (FDT_PROPDATA_PHANDLE dtb tag).
> > > > 
> > > > The test pattern used is
> > > >   - Generate a dts (xxx.dts.dts) from an input dts
> > > >   - Check this generated dts against expected contents
> > > >   - Generate a dtb (xxx.dtb) from the same input dts
> > > >   - Check this generated dtb against expected contents
> > > >   - Generate a dts (xxx.dtb.dts) from the generated dtb
> > > >   - Check this generated dts against expected contents
> > > >   - Generate a dtb (xxx.dtb.dts.dtb) from the generated dts
> > > >   - Check this generated dtb, expect the same contents as for xxx.dtb
> > > > 
> > > > Even if only one meta-data feature is currently tested in this tests
> > > > introduction, use a loop in order to ease future addition consisting in
> > > > adding new input dts as soon as new meta-data feature are supported.
> > > > 
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>    
> > > 
> > > As noted elsewhere, I'd prefer to see new helper tools for comparing
> > > metadata in binary rather than using text comparisons.  
> > 
> > Right, be ready to see treegen.c growing a lot.
> > 
> > Indeed, to compare in binary, I need to generate the expected binary (I don't
> > want to store it directly in git).  
> 
> Sure.
> 
> > I already plan to split the treegen.c file in several files. Indeed, with
> > unknown "structured" tags, a bunch of expected dtbs (instead to text files)
> > are going to be generated.
> > 
> > The plan is then to have one .c files per expected dtbs set and so the
> > concept of dtbs harnesses.
> > 
> > The problem I see here with known meta-data, is that we:
> >   1) Need to keep consistency between the dts file (input source use in test)
> >      and the treegen source file (which generate the expected dtb).
> > 
> >   2) If new meta-data tags are added in the future, treegen source files
> >      will need an update. This update will be more complex than looking at
> >      expected text files (fdtdump or other), and commiting the new expected
> >      files if the diff is explained.  
> 
> Hm, only when/if the new tags are required / automatic.
> 
> > I've proposed 'fdtanalyze' as a new tool [1] to convert a dtb to a "friendly"
> > text file. The output of 'fdtanalyze' could be something like that:
> > --- 8< ---
> >   (0x1-FDT_BEGIN_NODE): "my_node"
> >     (0x3-FDT_PROP): ...
> >     (0x3-FDT_PROP): ...
> >   (0x2-FDT_END_NODE)
> >   ...
> >   (0x9-FDT_END)
> > --- 8< ---
> > 
> > No complex analysis but you don't seem to like it neither.  
> 
> It's better than relying on fdtdump, but at this point it's just
> making a text format that's isomorphic to the binary and I don't see a
> lot of point.

During test implementation:
- Create an empty expected text file
- Run the test. The comparison an test generated text against expected test fails
- Look at the diff. If it is ok, copy the generated text file to the expected test
  file.

Maintenance in the future:
- You've done some modification and the test fails
- Look at the text file diff. If the failure is a false failure due to modification,
  just copy the generated text file to the expected test file.

With treegen dtb, the process is quite similar but not so obvious. You need
to modified the source file that generated the expected dtb. You cannot update
the dtb directly. Indeed, you can adjust the source which generates the dtb, not
the dtb itself.

Depending on the complexity of the source file to generate the dtb, updating this
source file is more or less easy.

In the next iteration of the structured tag series, a treegen source will be
available to generate dtbs related to test modification when unknown tags are
present.

With this treegen source, we will see if using generated dtbs for expected dtbs
is ok or not. You will judge.

Best regards,
Hervé
