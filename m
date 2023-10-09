Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA281774D
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fz63IDwF"
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC419B9
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 07:09:30 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c3c8adb27so775591066b.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 09 Oct 2023 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696860568; x=1697465368; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nEjsQ8MFAmd6RUIaCGlbKTpudQrCHVPYPvjVMeKRJZA=;
        b=fz63IDwFfMWgUhBGInVbn1kVleeZM02P+/MgqFpsKTiovdcPvy+FY4Mkp/X8z/oj1/
         pChx1rFauLVvjgpbkYRJLOPSse9RD9SNp7HWTxJnT13NsQbzrwp3uRufopqyzXHxoZ2A
         1KtX34Xk4ikT2KCAbj3sjNho+O3hmQRer25s/uWlqqXGaJdqvgztGzT7tAqeGdOHsTgB
         3Pfe3ODSVVqxtu+FFHIzfe/b6SH46Kr0Q0I/Km5D34VBBJitRj139KpUaW7Y4BTo5VZy
         HbrXam+169KlJpCGuovBqOBLjdaTxHwejBsQ2gxDe1S2XTq5RGQ6wWbaB/KpKEzL1Awj
         BvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860568; x=1697465368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEjsQ8MFAmd6RUIaCGlbKTpudQrCHVPYPvjVMeKRJZA=;
        b=cSNAFvVtvn81AqOVcotKIHNQIaNo/K3V9R0kyU8URSIWVo3921Jrx23OaVEX+fJsjM
         4rJHQSM/vzAQ7XS62vXT2G6BiZj7U7clGbqcYqPxaPudACRUi0Re8Dg4jVTJi3v5mGla
         jHw5QoAnYMNfgJLAA2YXIjtFc8FWrMFVlpPdYP3XGXezCMzTVgGtRPMQGpn6zcdHuaXu
         mHLsp82Kvzfyu73QLdmYf1d3c+Z0/mXR3AP7U7vDAyuP0cPup+jApEHfFKb2NH9n9Jw0
         CHvCmsVw1Wq7tqKyR7Itw9gUWuge5tb3FLIE8VbfDog+HOKrFhNWJhVkT41+YJlcbwqs
         0TWg==
X-Gm-Message-State: AOJu0YyCiCaxt3ZqX/hVYRcotqALdHTetaZOTYfUqMvNDJUUA11AUDKP
	nOo24HXTrF7l9yY3j4AO9cUAmXtyYuPE/iAHJp3mkA==
X-Google-Smtp-Source: AGHT+IH9RPfdzrwO5pgRZoC+ZfWwEgXg2+KtJVV3CFqkUGt/Y7ApxgTp7S+X+y+JRQnnxPHxCRylxA==
X-Received: by 2002:a17:906:104e:b0:99c:47a:8bcd with SMTP id j14-20020a170906104e00b0099c047a8bcdmr13583803ejj.67.1696860568239;
        Mon, 09 Oct 2023 07:09:28 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a6-20020a170906468600b009a5f7fb51dcsm6724121ejr.42.2023.10.09.07.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:09:27 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:09:23 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <20231009140923.xxhi2cdkemqod7j7@google.com>
References: <20231007110710.i2oj24oirdtyt5m4@google.com>
 <ZSJWkT3Kr3u5JWdy@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSJWkT3Kr3u5JWdy@zatzit>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi David,

On Sun, Oct 08, 2023 at 06:13:21PM +1100, David Gibson wrote:
> On Sat, Oct 07, 2023 at 12:07:10PM +0100, Pierre-Clément Tosi wrote:
> > Ensure that the alias found is valid i.e.
> > 
> >     An alias value is a device path and is encoded as a string.
> >     The value represents the full path to a node, ...
> 
> Where's that quote from?  That is typically the case, but I think that

See the DT specification (v0.4, 3.3 /aliases node):

    Each property of the /aliases node defines an alias.
    The property name specifies the alias name.
    The property value specifies the full path to a node in the devicetree.
    [...]
    An alias value is a device path and is encoded as a string.
    The value represents the full path to a node, [...]

> at least back in the old OF days, aliases referring to other aliases
> was allowed.  Even if it's not strictly correct in modern usage, I'd
> prefer to allow that usage if it's not too difficult to accomplish.

Compatibility with OF is great but checking that the result is a full path is
key to preventing recursion. Otherwise any DT with "circular" aliases can cause
the stack overflow I mention below. For example, calling

    fdt_path_offset(fdt, "loop")

on

    /{
        aliases {
            loop = "loop";
        };
    };

(I've added this as a test case in v2)

> 
> > This protects against a stack overflow (fdt_path_offset_namelen() calls
> > fdt_get_alias_namelen() then fdt_path_offset(alias), ...) when /aliases
> > has an empty property with an empty name.
> 
> It would be helpful to spell out that bad situation a bit more
> precisely.  AFAICT the way we discover an alias at the beginning of a
> path, it would have to have at least one character, which means I'm
> confused as to how something with an empty name gets in here.

I've rephrased the recursion in a more concrete way in v2.

AFAICT, nothing currently checks that the "alias has at least one character"
and merging [1] will only cover the special "circular" alias of the empty string
being aliased to itself.

[1]: https://lore.kernel.org/devicetree-compiler/20231006124839.z7auhc3mk37gxios@google.com/

> 
> > Co-developed-by: Mike McTernan <mikemcternan@google.com>
> 
> I've never seen a "Co-developed-by" tag before, I'd suggest just
> putting that in the text.  However all developers of the patch should
> sign off on it, so I'd expect an S-o-b from both people.
> 

Okay, I now have a link to the original fix in the Android Open Source Project.

> > Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
> > ---
> >  libfdt/fdt_ro.c   | 11 ++++++++++-
> >  tests/aliases.dts |  3 +++
> >  tests/get_alias.c | 12 +++++++++++-
> >  3 files changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index c4c520c..bda5c0d 100644
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
> > +	    !(len > 0 && alias && memchr(alias, '\0', len) && *alias == '/'))
> 
> The first three conditions here look good to me.  You could even check
> alias[len - 1] == '\0' to avoid scanning the entire string - an alias
> should be one single string.
> 
> I'd prefer not to enforce that the alias in an absolute path (the last
> check), if we can avoid it, since, as above, I think historically
> aliases to aliases has been an allowed thing.

I've replaced the memchr() call in v2 but kept the absolute path check for the
reason mentioned above.

> 
> > +		return NULL;
> 
> Pity we can't return a more specific error here.  Oh well.

Want me to introduce fdt_find_alias{,_namelen}() wrapped as

    const char *fdt_get_alias_namelen(...)
    {
        const char *alias;
        int err = fdt_find_alias_namelen(fdt, name, namelen, &alias);
        return err ? NULL : alias;
    }

? :)

This would allow callers to handle FDT_ERR_NOTFOUND differently from other
(probably more serious) errors currently hidden behind a NULL return value and
would allow our check to be reported as FDT_ERR_BADVALUE.

> 
> > +
> > +	return alias;
> >  }
> >  
> >  const char *fdt_get_alias(const void *fdt, const char *name)
> > diff --git a/tests/aliases.dts b/tests/aliases.dts
> > index 853479a..8820974 100644
> > --- a/tests/aliases.dts
> > +++ b/tests/aliases.dts
> > @@ -8,6 +8,9 @@
> >  		s1 = &sub1;
> >  		ss1 = &subsub1;
> >  		sss1 = &subsubsub1;
> > +		badpath = "wrong";
> > +		badpathlong = "wrong/with/parts";
> 
> As well as exercising the absolute path test, which I'd prefer to
> avoid, there doesn't seem to me that these two cases exercise anything
> much different from each other.

Yes, the idea was that libfdt could get confused by the presence of separators
and consider 'badpathlong' valid even if it isn't absolute, hopefully increasing
coverage. I have instead merged these cases into a single "relative" test case.

> 
> > +		empty = "";
> 
> This one's a good test.  It would be good to test a non-terminated
> string too (e.g. nonull = [626164];

Done; do you know of a way to express a property with an empty name in DTS? Or
would covering that use-case require a handcrafted DTB?

> 
> 
> >  	};
> >  
> >  	sub1: subnode@1 {
> > diff --git a/tests/get_alias.c b/tests/get_alias.c
> > index fb2c38c..4f3f6fd 100644
> > --- a/tests/get_alias.c
> > +++ b/tests/get_alias.c
> > @@ -21,9 +21,16 @@ static void check_alias(void *fdt, const char *path, const char *alias)
> >  
> >  	aliaspath = fdt_get_alias(fdt, alias);
> >  
> > -	if (path && !aliaspath)
> > +	if (!path && !aliaspath)
> > +		return;
> 
> Not sure what this case is for - we never call this with both values
> NULL, right?  If we did seems like we shouldn't silently ignore it.

This returns early if fdt_get_alias() was expected to return NULL and did so.
Perhaps, are you confusing 'aliaspath' with 'alias'?

> 
> > +	if (!aliaspath)
> >  		FAIL("fdt_get_alias(%s) failed\n", alias);
> 
> Isn't aliaspath == NULL correct for some of these new test cases?

Only if 'path' was NULL; see above.

> You're failing unconditionally here.
> 
> > +	if (!path)
> > +		FAIL("fdt_get_alias(%s) returned %s instead of NULL",
> > +		     alias, aliaspath);
> > +
> >  	if (strcmp(aliaspath, path) != 0)
> >  		FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
> >  		     alias, aliaspath, path);
> > @@ -36,6 +43,9 @@ int main(int argc, char *argv[])
> >  	test_init(argc, argv);
> >  	fdt = load_blob_arg(argc, argv);
> >  
> > +	check_alias(fdt, NULL, "badpath");
> > +	check_alias(fdt, NULL, "badpathlong");
> > +	check_alias(fdt, NULL, "empty");
> >  	check_alias(fdt, "/subnode@1", "s1");
> >  	check_alias(fdt, "/subnode@1/subsubnode", "ss1");
> >  	check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson



-- 
Pierre
