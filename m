Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140004E80D7;
	Wed, 16 Sep 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555359; cv=none; b=PNdHOV1h7f19EALW1e2IdxF0Dl+t4hloxr/AB1uOOXuV00rPgRWnVdAYxLZJ4+21nO4EOxql0uW+9C3al4iQZE9rflHoziX0aFlElIP6GN7yMAwFQ4NAJlaMD77BxHjiNU6gdHSIkraZEsQezN/tS03H7Ws8kpVJqVZV6MmB2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555359; c=relaxed/simple;
	bh=72bw0BcMUCVvCQ7vf4mFDz8HuMiUwHA3B8eOOm++j/M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=li+QNi6EmCvlkL81msKOGweTPhPoYqTKXHg+G70JSpvX2OmUcvH8so/AZsX79FqNtDeK44lsjfXIP/K3m0j0POcmQ3TmdoLqrViV/DqhEdVjQ1+Qpc4uvVe9s+R7LX4TE+pesJ59vhybhxbqMyRm/rMVVzr0n68aD0DYn9jEMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x0K/ozyR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x0K/ozyR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51A2A1A088E;
	Wed, 16 Sep 2026 10:42:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F2C160337;
	Wed, 16 Sep 2026 10:42:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C76A411C7B01B;
	Wed, 16 Sep 2026 12:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789555338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P955IYJPq3OLonmhBqM0xlbQIrEV7AwZGdAdJtSEJVc=;
	b=x0K/ozyRjkiZsYw2rrn3wdJNvIYGvo4NBkQWaps6rDi4s8iqrIZEutT0GjZC//acBLo09x
	JVTjafMhnrXKWEZuPSmtzqJytXe+zzNPyExy6KvQKjZ0VrlVvHB4EhxQkBUwA9QCGTw5az
	FIMc9A2LHWteiAWYAxP5JZzvsO1L2V/CuHi/Yg0zUlBdNRTmLhPnEA2e2U+u/eD84JI9S9
	rlpggL1sVxDVaTlVe0cx9Rl3iJN3cTL6zt4pbaF+kYgSr7DIhEdSh+RtbBK1j7Od03bAvB
	h4hUzkjFi861VOLiR+Rtjsr7/fpNs19zxCFmbV2JzWq90V+cEt2OW2ZPNZqnzw==
Date: Wed, 16 Sep 2026 12:42:05 +0200
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
Subject: Re: [PATCH v3 11/15] libfdt: Introduce fdt_getprop_by_offset_w()
Message-ID: <20260916124205.28a71859@bootlin.com>
In-Reply-To: <aqpnzXyR_k4fs7Jk@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-12-herve.codina@bootlin.com>
	<aqpnzXyR_k4fs7Jk@gractus.seuss>
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

On Wed, 16 Sep 2026 19:56:46 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:42AM +0200, Herve Codina wrote:
> > Future operations, such as handling unknown tags on dtb modifications,
> > need to modify properties retrieved by their offset.
> > 
> > fdt_getprop_by_offset() already exists to get a preperty by its offset
> > but the property returned is read-only. A writable returned property is
> > needed.  
> 
> Since we already have fdt_get_property_by_offset_w() this is an
> obvious gap and I'd be happy in principle to apply this independent of
> the rest of the series.

Nice :)

> 
> > Fill the lack and introduce fdt_getprop_by_offset_w(), the write enabled
> > variant of fdt_getprop_by_offset().
> > 
> > Add also its related test.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  libfdt/libfdt.h           |  6 +++
> >  tests/.gitignore          |  1 +
> >  tests/Makefile.tests      |  2 +-
> >  tests/get_prop_offset_w.c | 84 +++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build         |  1 +
> >  tests/run_tests.sh        |  1 +
> >  tests/tests.h             |  1 +
> >  tests/testutils.c         | 18 +++++++++
> >  8 files changed, 113 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/get_prop_offset_w.c
> > 
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index 7a1915a5..82965e32 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -856,6 +856,12 @@ static inline struct fdt_property *fdt_get_property_w(void *fdt, int nodeoffset,
> >  #ifndef SWIG /* This function is not useful in Python */
> >  const void *fdt_getprop_by_offset(const void *fdt, int offset,
> >  				  const char **namep, int *lenp);
> > +static inline void *fdt_getprop_by_offset_w(const void *fdt, int offset,
> > +					    const char **namep, int *lenp)
> > +{
> > +	return (void *)(uintptr_t)fdt_getprop_by_offset(fdt, offset, namep,
> > +							lenp);
> > +}
> >  #endif
> >  
> >  /**
> > diff --git a/tests/.gitignore b/tests/.gitignore
> > index 69693129..1091174a 100644
> > --- a/tests/.gitignore
> > +++ b/tests/.gitignore
> > @@ -30,6 +30,7 @@ tmp.*
> >  /get_phandle
> >  /getprop
> >  /get_prop_offset
> > +/get_prop_offset_w
> >  /incbin
> >  /integer-expressions
> >  /fs_tree1
> > diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> > index 63e201ae..0d4d399f 100644
> > --- a/tests/Makefile.tests
> > +++ b/tests/Makefile.tests
> > @@ -16,7 +16,7 @@ LIB_TESTS_L = get_mem_rsv \
> >  	sw_tree1 sw_states \
> >  	move_and_save mangle-layout nopulate \
> >  	open_pack rw_tree1 rw_oom set_name setprop del_property del_node \
> > -	appendprop1 appendprop2 propname_escapes \
> > +	appendprop1 appendprop2 propname_escapes get_prop_offset_w \
> >  	string_escapes references path-references phandle_format \
> >  	boot-cpuid incbin relref_merge \
> >  	extra-terminating-null \
> > diff --git a/tests/get_prop_offset_w.c b/tests/get_prop_offset_w.c
> > new file mode 100644
> > index 00000000..dbfa5dd7
> > --- /dev/null
> > +++ b/tests/get_prop_offset_w.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: LGPL-2.1-or-later
> > +/*
> > + * libfdt - Flat Device Tree manipulation
> > + *	Testcase for fdt_getprop_by_offset_w()
> > + * Copyright (C) 2026 Bootlin.
> > + */
> > +
> > +#include <stdlib.h>
> > +#include <stdio.h>
> > +#include <string.h>
> > +#include <stdint.h>
> > +
> > +#include <libfdt.h>
> > +
> > +#include "tests.h"
> > +#include "testdata.h"
> > +
> > +#define SPACE		65536
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	const void *exp_val;
> > +	const char *name;
> > +	char *modif_val;
> > +	void *propval;
> > +	int proplen;
> > +	int exp_len;
> > +	int poffset;
> > +	void *fdt;
> > +	void *buf;
> > +	int err;
> > +
> > +	test_init(argc, argv);
> > +	fdt = load_blob_arg(argc, argv);
> > +
> > +	buf = xmalloc(SPACE);
> > +
> > +	err = fdt_open_into(fdt, buf, SPACE);  
> 
> You shouldn't need an fdt_open_into().  You're modifying the contents
> of a single property, but not moving tags about or (specifically)
> expanding the tree as a whole.  This is a "write in place" operation
> rather than a "read/write" operation in libfdt terms.

Ok, I will update in the next iteration.

> 
> > +	if (err)
> > +		FAIL("fdt_open_into(): %s", fdt_strerror(err));
> > +
> > +	free(fdt);
> > +	fdt = buf;
> > +
> > +	/* Retrieve the offset of the 'prop-str' property */
> > +	poffset = get_poffset(fdt, 0, "prop-str");
> > +	if (poffset < 0)
> > +		FAIL("Property 'prop-str' not found")  
> 
> Introducing get_poffset() seems a bit awkward compared to using an
> fdt_for_each_property_offset() like get_prop_offset.c does.

Ok, will use fdt_for_each_property_offset() directly here and remove
get_poffset() in the next iteration.

> 
> > +
> > +	/* Get the property value for modification */
> > +	propval = fdt_getprop_by_offset_w(fdt, poffset, &name, &proplen);
> > +	if (!propval)
> > +		FAIL("fdt_getprop_by_offset_w(%d): %s", poffset,
> > +		     fdt_strerror(proplen));
> > +
> > +	/* Check original values */
> > +	if (strcmp(name, "prop-str"))
> > +		FAIL("Name mismatch : %s instead of prop-str", name);
> > +
> > +	exp_len = strlen(TEST_STRING_1) + 1;
> > +	if (proplen != exp_len)
> > +		FAIL("Original size mismatch on property \"%s\": %d instead of %d",
> > +		     name, proplen, exp_len);
> > +
> > +	exp_val = TEST_STRING_1;
> > +	if (memcmp(exp_val, propval, exp_len))
> > +		FAIL("Original data mismatch on property \"%s\"", name);
> > +  
> 
> You could re-use check_get_prop_offset() from testutils.c to perform
> these tests before invoking fdt_getprop_by_offset_w().

I wanted to test that the value returned by fdt_getprop_by_offset_w() is the
correct one. check_get_prop_offset() calls fdt_getprop_by_offset() and not
fdt_getprop_by_offset_w(). I know it doesn't matter with current implementation
of fdt_getprop_by_offset_w() but I am not supposed to know about this
implementation here in the test. Also, this implementation could change in the
future (not planned on my side).

> 
> > +	if (exp_len < 4)
> > +		CONFIG("Property \"%s\" should be at least 4 bytes", name);
> > +
> > +	/* Modify the property value */
> > +	modif_val = xmalloc(proplen);
> > +	memcpy(modif_val, propval, proplen);  
> 
> Why malloc() and memcpy()?  The whole point of
> fdt_getprop_by_offset_w() is that you get a writable pointer into the
> fdt which you can modify in place.

I want to keep the modified value for later comparison.

- modif_val : Current property val + modification.
- Update propval: Current property val.
- Check reading the property with check_get_prop_offset() that the
  property has been really updated.

If instead I use only propval, I use only one buffer and so
- propval = modified value
- check that get check_get_prop_offset() which will also return the 
  propval buffer matches the propval buffer.

In check_get_prop_offset();
--- 8< ---
const void *check_get_prop_offset(void *fdt, int poffset, const char *exp_name,
                                  int exp_len, const void *exp_val)
{
	const void *propval;
	...
	propval = fdt_getprop_by_offset(fdt, poffset, &name, &proplen);
	...
 	if (exp_len && memcmp(exp_val, propval, exp_len))
             FAIL("Data mismatch on property \"%s\"", name);
        ...
}

Using a pointer returned by fdt_getprop_by_offset_w() as exp_val parameter
leads to something like:
	memcmp(propval, propval, exp_len)

This is always successful even if the propval buffer doesn't contain the
data expected by the test. If for whatever reason the propval buffer is
wrongly modified by some internal libfdt function called by
check_get_prop_offset(), we cannot see it.

With the additional buffer (modif_val) which is never passed to libfdt,
and contains expected data, we can see any wrong proval modification.

> 
> > +	modif_val[1] = (modif_val[1] != 'A') ? 'A' : 'a';
> > +	modif_val[3] = (modif_val[3] != 'B') ? 'B' : 'b';
> > +	memcpy(propval, modif_val, exp_len);
> > +
> > +	/* Check that the modified value is taken into account */
> > +	if (!check_get_prop_offset(fdt, poffset, "prop-str", exp_len, modif_val))
> > +		FAIL("Modified property 'prop-str' not found");
> > +
> > +	PASS();
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 779e6bc7..dae6a941 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -50,6 +50,7 @@ tests = [
> >    'get_path',
> >    'get_phandle',
> >    'get_prop_offset',
> > +  'get_prop_offset_w',
> >    'get_next_tag_invalid_prop_len',
> >    'getprop',
> >    'incbin',
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index 225c22f8..419a24d8 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -419,6 +419,7 @@ tree1_tests_rw () {
> >      run_test setprop $TREE
> >      run_test del_property $TREE
> >      run_test del_node $TREE
> > +    run_test get_prop_offset_w $TREE  
> 
> This belongs with the other write-in-place tests in tree1_tests(), not
> as an rw test.

Ok, I will move it.

Best regards,
Hervé
