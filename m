Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1402F3C18
	for <devicetree-compiler@vger.kernel.org>; Tue,  1 Sep 2026 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269807; cv=none; b=m3hnq1jloC2ZL6m9KOAKh+iMGWvweIYSMgPiL93J7kRQ/C/agnKcwJm2sAqqatPHpDVexqLm6BIEXnoGc+FNjAXjkJo6DFltbBkXziUmeNkUpArbFEY/TYEe/IcYfHxq7Zg04OqoJ+guAnKihRbjtxjV6PH27kDPofUNzYixR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269807; c=relaxed/simple;
	bh=bCa/+ioSd391ansot8wasyv5SfvIWPFZ8hB1i2B1cEg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csJlOPn+TdEdnT1mUQIb1vdUk1ujPAWmFj42OlM6kW2yyn2H/sCtbQvA9O+dj4s/8y53KJkUghk2YTJ3TXgY1uUHzAejXvkzRidm/J/sQiUA/nzy+ARmN2uC2TQ0IeKyMTDSvK2ffuj0LGfsGdJw5tAc4B9Hq+U//AN+MygUkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hk68tnfl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hk68tnfl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A90324E414A0;
	Tue,  1 Sep 2026 13:36:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7041A6053C;
	Tue,  1 Sep 2026 13:36:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBD1411C79281;
	Tue,  1 Sep 2026 15:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788269796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ebsqMy2EnVHY9plN/hZxJMwt48+kiHKpI9Ca6hUAEeQ=;
	b=Hk68tnflvw1ZZQ6K/uKMjvMzk4RU+XfRXIYQhvZO2IcC+rhCrEd/D9hbnhKptQVnkZRV8Q
	ntBPALWbYubzYp10NjU2ModBchlDLN+uIe3BDWwufWUvGpMFRO1iua7/zoMjb4Ld4HPPr3
	kripHYEFzY0OlsEi+mUdVIxOnc9nZn/6rQvfCQwtk/5hqiMyGyB6pgilCaXdFRs81n784K
	ZaD6R7uZHHACHnU8HpEXE38y0n0vIMi2NX7ukpTlpnVIoUvY55XfjTf6TyU02SEeiU4GOA
	SO16em9npMcOjpj6FF+I3IVD3Q1IRr0uJIJxBovyFuGxPdV3b1WZCKvtUfYQEg==
Date: Tue, 1 Sep 2026 15:36:26 +0200
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
Subject: Re: [PATCH v3 03/15] tests: Don't assume the root node is available
 at offset 0
Message-ID: <20260901153626.7f0e0813@bootlin.com>
In-Reply-To: <apaGr_i-s4DAZ-Ul@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-4-herve.codina@bootlin.com>
	<apaGr_i-s4DAZ-Ul@gractus.seuss>
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

On Tue, 1 Sep 2026 18:03:09 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:34AM +0200, Herve Codina wrote:
> > Several tests uses offset 0 as the offset of the root node. Either to
> > check the offset returned by tested functions or to directly manipulate
> > the root node retrieved using fdt_offset_ptr(fdt, 0, ...).
> > 
> > The root node is not always at offset 0. Indeed, a FDT_NOP tag can be
> > present at offset 0. fdt_root_offset() returns the offset of the root
> > node taking care of possible FDT_NOP tag.
> > 
> > Use fdt_root_offset() to get the offset of the root node and use this
> > value whenever the offset of the root node is expected.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  tests/node_offset_by_compatible.c |  4 +++-
> >  tests/node_offset_by_prop_value.c | 11 +++++++----
> >  tests/path_offset.c               | 13 +++++++++----
> >  tests/root_node.c                 |  6 +++++-
> >  4 files changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tests/node_offset_by_compatible.c b/tests/node_offset_by_compatible.c
> > index a9e67835..1278a562 100644
> > --- a/tests/node_offset_by_compatible.c
> > +++ b/tests/node_offset_by_compatible.c
> > @@ -39,12 +39,14 @@ static void check_search(void *fdt, const char *compat, ...)
> >  int main(int argc, char *argv[])
> >  {
> >  	void *fdt;
> > +	int root_offset;
> >  	int subnode1_offset, subnode2_offset;
> >  	int subsubnode1_offset, subsubnode2_offset;
> >  
> >  	test_init(argc, argv);
> >  	fdt = load_blob_arg(argc, argv);
> >  
> > +	root_offset = fdt_root_offset(fdt);
> >  	subnode1_offset = fdt_path_offset(fdt, "/subnode@1");
> >  	subnode2_offset = fdt_path_offset(fdt, "/subnode@2");
> >  	subsubnode1_offset = fdt_path_offset(fdt, "/subnode@1/subsubnode");
> > @@ -54,7 +56,7 @@ int main(int argc, char *argv[])
> >  	    || (subsubnode1_offset < 0) || (subsubnode2_offset < 0))
> >  		FAIL("Can't find required nodes");
> >  
> > -	check_search(fdt, "test_tree1", 0, -FDT_ERR_NOTFOUND);
> > +	check_search(fdt, "test_tree1", root_offset, -FDT_ERR_NOTFOUND);  
> 
> This does highlight that even with the compatibility changes
> introduced here, allowing NOPs before the root node can potentially
> break things.  We now handle _passing_ 0 to any of the functions as a
> node offset, but anything that expects a _returned_ offset to be 0 if
> it's the root node will break.
> 
> I think that's probably an acceptable breakage, but it's something to
> be aware of.

Yes, I know but I wouldn't say it is a breakage. NOPs are allowed by the
specification. In current version dtc/libfdt, having a NOP before the root
node is already broken.

I agree with you we need to be aware of.

...

> > diff --git a/tests/root_node.c b/tests/root_node.c
> > index 37e6f059..30903f2b 100644
> > --- a/tests/root_node.c
> > +++ b/tests/root_node.c
> > @@ -19,12 +19,16 @@ int main(int argc, char *argv[])
> >  {
> >  	void *fdt;
> >  	const struct fdt_node_header *nh;
> > +	int root_offset;
> >  
> >  	test_init(argc, argv);
> >  	fdt = load_blob_arg(argc, argv);
> >  
> > -	nh = fdt_offset_ptr(fdt, 0, sizeof(*nh));
> > +	root_offset = fdt_root_offset(fdt);
> > +	if (root_offset < 0)
> > +		FAIL("fdt_root_offset() returns %d", root_offset);  
> 
> Hm.  It's been a long time, but I suspect the purpose of this testcase
> was to be super low-level, checking the contents of the root node
> _without_ relying on iteration or lookup functions first.  Putting the
> lookup call here arguably defeats that purpose: certainly the test
> that nh->tag == FDT_BEGIN_NODE is no longer meaningful, since
> fdt_root_offset() will explicitly look for a location where that's
> true.
> 
> Or perhaps another way to look at it is that this test is explicitly
> verifying that the root node is at offset 0, so does it make snese for
> this test to even exist any more.  I guess the test for the name of
> the root node is still meaningful, if minor.
> 
> Nonetheless, to maintain as best we can this test's goal as working
> independent of lookup functions, I think it might be worth open coding
> something to skip FDT_NOP tags (not using fdt_next_tag(), even), then
> construct nh immediately after that.

Well "structured tags" are going to be introduced and so the open coding
here will need to take care of that. Later some new tags could be introduced
and could also have impacts on the test.

To be honest, I hesitated to just remove this root_node test.

I kept it because at least it checks that the offset returned by 
fdt_root_offset() looks like a root node (i.e tag BEGIN_NODE and empty name).

Adding an open coded loop here without fdt_next_tag() call will looks like
a copy/paste of the loop available in fdtdump.c. I am not sure that this is
what we want to see here.

The question is: How to be sure that the offset returned by fdt_root_offset()
is really the root node offset without having an open code loop here?

Maybe we can add a new test, root_offset, and build dtbs where we exactly
know where the root is (2 dtbs, with and without FDT_NOP). treegen could
build those dtbs.
---- 8< ----
/ {
    offset = <real_root_node_offset>;
};
---- 8< ----

The treegen tool should be able to add a property where the value is the offset
of the root node.

The new test could get the root node offset thanks to fdt_root_offset(), read the
'offset' property available at this root node offset and check that the property
value matches the root node offset returned by fdt_root_offset().

The root_node is kept as it is with this current patch applied:
- use fdt_root_offset()
- Check BEGIN_NODE
- Check empty name

What do you think about this solution ?

Should the 'root_offset' test need to be implemented or does it look over-engineered ?

Best regards,
Hervé
     
> 
> 
> >  
> > +	nh = fdt_offset_ptr(fdt, root_offset, sizeof(*nh));
> >  	if (! nh)
> >  		FAIL("NULL retrieving root node");
> >  

> > -- 
> > 2.55.0
> > 
> >   
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
