Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D61171B3
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BqXzgHT6"
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA46A93
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 02:26:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo512446a12.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696930008; x=1697534808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wsSFSiWU/9rdwOuNHVqEhjKHh+6XBdXjqSnjnvccqa0=;
        b=BqXzgHT6hvfH7z5/wAlgItduopNnbK/Kqhy6qv0VwI8yYic6BPFmC7dY0DVQU6IiFr
         sac09KHes53g/malVrGgAMouzc/jZroFdq0jfNnwL+tKgkqvGYt41acgrtF1qVuEJBj9
         DAtXj6q1/jpGsojCmpKrmcNFVfGAm+y2+KzZAqyv8ZeNosrBt4rGJaAr0F4QxymSht8E
         Hlmmx5DJtDLocWlHamiqnl0cQ/P3KxVjFU+kOwpUNTW1FYHzcMZfNcDs+BgQkiB3xKen
         9YIcWxaeJEH1EfXFftocqWZNFbzC2iti9mlVFkZzjmdxVYOOZN1AzJ4v+6sxNd0HXq/7
         ZRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930008; x=1697534808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsSFSiWU/9rdwOuNHVqEhjKHh+6XBdXjqSnjnvccqa0=;
        b=q50HeUpUGUNHvYUk6Vuh24rzBjj+OdIySESNWC05S0ZBn0ZCJXoDtU+fpsQtqUiEds
         zNpdN1oJkvhfs4PlQOUQ0RPKpaHLceG8bFE4q1PTWotfeZbPun2Sk72gKNv5tm3OIsZw
         /KKRPvwglXwNR2pQAHPbRPHCEDYiHPueL3JUfZKo8hgFabZKmp5SnUY6mS9wyqSH6Iiz
         z1x+CPGljHTIiu7XyDeK+y5xa4tadyw/d/BfpGS0FdlIsVceBB/lpHcZ9w3MFelVWqrw
         06gq+QJwpIp0aSd+c19EaLSpvm0wPOPhx0CTvN2WJvOXlwg7aR4LT20uf9KDzyqwg5RP
         W6HA==
X-Gm-Message-State: AOJu0Yyy6okKRm/5KvBF1UqTyeGTaikRwesXQt4blfU2EYMHKQUSkZzL
	vVrwDcPTG5w5IO2QrnTQ21EVxQ==
X-Google-Smtp-Source: AGHT+IHwITYzf3fUFv7Yyn5mz7IWTed8P7vF+VLM7Nc7bo2txKhn4iA2CG4RhCNDXKgwHryFVJ/fIQ==
X-Received: by 2002:a17:907:2e19:b0:9b2:c2a9:357a with SMTP id ig25-20020a1709072e1900b009b2c2a9357amr15281830ejc.68.1696930008059;
        Tue, 10 Oct 2023 02:26:48 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id re9-20020a170906d8c900b0099b8234a9fesm8132571ejb.1.2023.10.10.02.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:26:47 -0700 (PDT)
Date: Tue, 10 Oct 2023 10:26:43 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <20231010092643.z6okcdpvoj35gs2t@google.com>
References: <20231009142004.m4af5c2utpzoll2e@google.com>
 <ZSTZc6exEXIaVf3X@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSTZc6exEXIaVf3X@zatzit>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 03:56:19PM +1100, David Gibson wrote:
> On Mon, Oct 09, 2023 at 03:20:04PM +0100, Pierre-Clément Tosi wrote:
> > Ensure that the alias found matches the device tree specification v0.4:
> > 
> >     Each property of the /aliases node defines an alias. The property
> >     name specifies the alias name. The property value specifies the full
> >     path to a node in the devicetree.
> > 
> > This protects against a stack overflow caused by
> > 
> >     fdt_path_offset_namelen(fdt, path, namelen)
> > 
> > calling (if 'path' contains no '/')
> 
> Uh.. this still seems confusing, or at least misleadingly specific.
> Having a self-referential alias doesn't really have anything to do
> with whether the path has any '/' or not.

Because, even if fdt_path_offset() is called with a path containing one or more
'/', the recursion will result in a fdt_path_offset() call with a path that
doesn't have one, right? Good point, I've removed that condition from the commit
message in v3.

> 
> >     fdt_path_offset(fdt, fdt_get_alias_namelen(fdt, path, namelen))
> > 
> > leading to infinite recursion on DTs with "circular" aliases.
> > 
> > This fix was originally written by Mike McTernan for Android in [1].
> 
> Urgh... I don't love the idea of merging something that doesn't have a
> Signed-off from the original author.  I guess it's probably ok with
> something this small.
> 
> > [1]: https://android.googlesource.com/platform/external/dtc/+/9308e7f9772bd226fea9925b1fc4d53c127ed4d5
> > 
> > Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
> > 
> > ---
> > v2
> >   - replace memchr('/') with check on last character
> >   - add test coverage of a self-referencing alias
> >   - drop redundant test case on alias to non-absolute path
> >   - reference the DT spec and AOSP patch in the commit message
> >   - rephrase the infinite recursion case in the commit message
> > ---
> >  libfdt/fdt_ro.c   | 11 ++++++++++-
> >  tests/aliases.dts |  4 ++++
> >  tests/get_alias.c | 14 +++++++++++++-
> >  3 files changed, 27 insertions(+), 2 deletions(-)
> > 
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index c4c520c..39b7c68 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -537,7 +537,16 @@ static const void *fdt_path_getprop_namelen(const void *fdt, const char *path,
> >  const char *fdt_get_alias_namelen(const void *fdt,
> >  				  const char *name, int namelen)
> >  {
> > -	return fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, NULL);
> > +	int len;
> > +	const char *alias;
> > +
> > +	alias = fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, &len);
> > +
> > +	if (!can_assume(VALID_DTB) &&
> > +	    !(len > 0 && alias && alias[len - 1] == '\0' && *alias == '/'))
> 
> I'd be more confortable with the alias test before the len > 0  test.
> It's probably fine either way: if !alias, then len should be an error
> code < 0.  However, the point is len has a different interpretation
> depending on whether alias is NULL or not-NULL, making (len > 0) a
> slightly ambiguous statement if we haven't already established which
> case we're in.

Makes sense, done.

> 
> > +		return NULL;
> > +
> > +	return alias;
> >  }
> >  
> >  const char *fdt_get_alias(const void *fdt, const char *name)
> > diff --git a/tests/aliases.dts b/tests/aliases.dts
> > index 853479a..b880176 100644
> > --- a/tests/aliases.dts
> > +++ b/tests/aliases.dts
> > @@ -5,6 +5,10 @@
> >  	#size-cells = <0>;
> >  
> >  	aliases {
> > +		empty = "";
> > +		loop = "loop";
> > +		nonull = [626164];
> > +		relative = "rel/at/ive";
> 
> Since you're only testing fdt_get_alias() here, rather than the full
> path_offset(), this is probably ok, but there is a bit of ambuguity
> here in what's wrong with this.  What you're testing here is that this
> is disallowed as an alias-to-an-alias.  But if you were resolving this
> with path_offset(), you'd expect NOTFOUND even if aliases-to-aliases
> were allowed, both since the alias it's relative to doesn't exist, and
> the rest of the path won't resolve anyway.
> 
> I think it would be clearer and more robust to use a case here where
> the *only* thing wrong with the alias is that it involves another
> alias.  e.g.
> 
> 		relative = "s1/subsubnode"
> 
> That would be an alias resolving to the same thing as 'ss1', if it
> were not for the alias-to-an-alias prohibition.

Thanks, that's a much better test case.

> 
> >  		s1 = &sub1;
> >  		ss1 = &subsub1;
> >  		sss1 = &subsubsub1;
> > diff --git a/tests/get_alias.c b/tests/get_alias.c
> > index fb2c38c..d2888d6 100644
> > --- a/tests/get_alias.c
> > +++ b/tests/get_alias.c
> > @@ -21,9 +21,16 @@ static void check_alias(void *fdt, const char *path, const char *alias)
> >  
> >  	aliaspath = fdt_get_alias(fdt, alias);
> >  
> > -	if (path && !aliaspath)
> > +	if (!path && !aliaspath)
> > +		return;
> > +
> > +	if (!aliaspath)
> >  		FAIL("fdt_get_alias(%s) failed\n", alias);
> >  
> > +	if (!path)
> > +		FAIL("fdt_get_alias(%s) returned %s instead of NULL",
> > +		     alias, aliaspath);
> > +
> >  	if (strcmp(aliaspath, path) != 0)
> >  		FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
> >  		     alias, aliaspath, path);
> > @@ -36,9 +43,14 @@ int main(int argc, char *argv[])
> >  	test_init(argc, argv);
> >  	fdt = load_blob_arg(argc, argv);
> >  
> > +	check_alias(fdt, NULL, "empty");
> > +	check_alias(fdt, NULL, "nonull");
> > +	check_alias(fdt, NULL, "relative");
> >  	check_alias(fdt, "/subnode@1", "s1");
> >  	check_alias(fdt, "/subnode@1/subsubnode", "ss1");
> >  	check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
> >  
> > +	check_alias(fdt, NULL, "loop"); // Might trigger a stack overflow
> > +
> >  	PASS();
> >  }
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson



-- 
Pierre
