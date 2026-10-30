Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793383064;
	b=FNZ3z8U/4Q0w7aanoXYkp3dPu8i9pjCehi3eGZTLuBlBarRYyP9qXQq0IkxPo9HdgvR0
	 hXQyVCXziBvGyuaf9gPRPCI3vXrtW8uwd4gJSSInOi82TVjAikCtY1vuQiQp589iMM0Eq
	 E4q1LYRc0fXJ2uVSNiACzTWdrFYdNvmxhh4wEfq/lVidRyBJFMxuZ9rcImJ1i912FTzuZ
	 ToLGKAFBsh8mmiayGq3IMpWCwtrNYzb6UXRyUB/6vD3Do7h6lRfaN9hUpvYcRWNbR+2il
	 tDcPcKC+ivXWQh8ASTDzvzqMjYzG/6VwTrw25VC1IZJowkcTBe1uRvihchNC7sUrPew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=9ceBi54qLEi2XeG7ML6sTymqqL7ro+wUgKolEPta8pU=;
	b=ZEMMqDQXlqsuC4GJyE1YyJhqn8RHrJtii7/sJYofNFOXWfhfBCAdMuDTpzVyXt+cRPPN
	 5pwyCHY4RwDbTejgiZ+QVPEb3FFTsTicj39g1UOHNT/OuXsi+y2YuM7uYvQabH0wp0GUn
	 3EqOwx2q+K8qYw7LP8ijuQQVm320D7kfyOwj1PBYjSjxWO1qLZk/eWmLH52PgWB9aMLfq
	 2NALMFGny/pS1efgqx7lQP/pkmSCDmj4trL4FcnFbp+6Sx03KDn1Zo5PNZw4EH2DVr+Zp
	 UZZ4Y526SVt6dFRysaJFy6nP9SMREKU3klSHjmtB8gzffmfyBOXri9VkoB+4Hn0B5XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ixU0bcLk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183C60A2601
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 17:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5183C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ixU0bcLk
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1279575a12.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 10:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383062; cv=none;
        d=google.com; s=arc-20260327;
        b=emmQ5Ut6go4Be8XtkfkD2Dabq02EYUvQa3iz+n9q2Lt4fd9YNHenjXPBPoPlgWULEx
         UV6/7F2RJMfyGd2Gx79RkK7C8GxGXxw36LhzHkTEpjwMuyUdsWkfr1b3ZXuNPHPvSnVn
         UcaMHwJfGonX5CUzadgN6rnTp1UliyTNYrZSNVBoR1E709DheSMR1fGfKMt0250HU2yV
         LUxOJEcuAS3Rd8qrina/N8hToLTB2GEpP2J+7xzBrjk1tEFwyVxiXFln16cAdjyCLmwc
         74OeEIwEsO7sEDmqx1CAC1uS85Ol521YaueHdY/wDSwopEr5sve4mvrMfv0zmmvde+Bj
         R86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ceBi54qLEi2XeG7ML6sTymqqL7ro+wUgKolEPta8pU=;
        fh=arriF4o2yiPrGChz08bUEljpL7XipURYD/zzcu+j4ug=;
        b=YR09w2ezDSxIBGvX1nMwYpcE3l1lVrB0hyHWmk3GG054JcpusOR3C6Cs3t+adAUJ2t
         uyJZWNeKBpJKBwvZ8ipL7tPquuz3WitZAJ7czZJLD5up0CzO8qqOLYkw/7VHJ7ik8u1N
         1FDhB+UPniwHjcm/CaAFmfDb59btK10j0/LOQmckCJFmboVlK09BVgx74WBcIUhIPy9h
         Ae8cQSctjIaD3ooZWmMVioMgvV4Z71u3aHp94NYNXOPhTKF+wmMaV+D0G7F2YlR5sTwz
         I0lHrtQHwL5LeB/in0iufGXKF7sPVqyeoMESvBrTVAAEM+lzv66r1p2fDR693ZNi3Oh5
         n7EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793383062; x=1793987862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ceBi54qLEi2XeG7ML6sTymqqL7ro+wUgKolEPta8pU=;
        b=ixU0bcLke2zC0vP7l/RDNHNb+d2E3Y7UctuM0pIOgW9GHwHTKU/J4Ng6DD4G6swvof
         +sY7ub0n5EdGM4r59NbmocwBekSUfp4TSSZtZnSnELbkMS8PRa7qwibCYgevtGN/XpZt
         pc8OT8FKPXRKY4jmHO5Lugz1mvPEtjDlhlTL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383062; x=1793987862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ceBi54qLEi2XeG7ML6sTymqqL7ro+wUgKolEPta8pU=;
        b=aiNJ/S1tluKCscY2EPt6MWD3JRZk/u0WuTiI+GnXE6ukkY5hrNkVJln8s+7l1+iP0Z
         TFhbPpBZl+sDZYWUZzSAmkFjJykjhyqR49YzkKN6Eu7M0uVJ5k0DVqouLQRHHYr2veMU
         bYVJf2pzDVplA25VdASSL7fNyR+j2PtvHj8+Pe0C+SoYHaj2dCQ6bOc3hWlgOFz2yVpm
         w/syQ2KPvMkjR5x/hFbRVyhLiukNE5NhUxXLNK3iCAJlkztzQCfTa2b53Cykia9fJn5c
         KteUVAgtli63A4dbpK6cFrpkG0ky1Qp4kMikvbd531P/0ZRErSg/h2nJImSKKumSpz/q
         hl0w==
X-Gm-Message-State: AFq9FYLM6+sVoiNgpNFfUb1pokT72dCZUQvy/LNjis/y6/L/Sbje++WT
	HwLvhY4ZGV84MPlHyAf2EViPcJtbbuYMfLdp/hLQeeXqU9mvRD6u6I5uo376sZriuYxC1Y4E0nl
	Meh2X83DLp8hI7JQIssoWz1Q1xxiShZhupZcIRJ3S
X-Gm-Gg: AYBFou3JdLor+y0C/Dafl1lwDJlYFLtM7uRMqcTfNSawlKQ8FxOXhi5XHZdby88mpFp
	STirdYYpGcB5NtW3hVvSDVRi0UD0IPbqjI5kzBjhZDhBgQ0fopCmmKyVC3/9RGfKOTCBF9VZD3r
	zZpF6/RtTPs+fhfOsS1316+IxRk7P6Sp8IxK+j2gIj4lyVhTlX0rdJ17OEuqUInOWMGZonaRykY
	+SMLBNXLyIOW3y5wDEK3GditjPS+vZxE9SEyybQpKvKwtWcjBxFqm4o3B92usL80NDdG5DGWBW0
	QCUKVQ/eR9ZXGyOIquxOecqvZ0/NZTaHOiQm+ClbAYDx6Arr0moZbHMeP4NV1SgLhYzjskyvFA6
	rOguA54bLtl6mv1rznwdGcRtU0dZgXKeNU6Q+eLbglrwKwJW7zgBY5sXSpvZMblUsFyKhcTewkC
	FO1tbkKRgA+qsEo0QS
X-Received: by 2002:a05:6402:896:b0:6ac:686f:91db with SMTP id
 4fb4d7f45d1cf-6b4d428ffa1mr1617243a12.11.1793383061776; Fri, 30 Oct 2026
 10:57:41 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028112007.3980089-1-sjg@chromium.org> <20261028112007.3980089-2-sjg@chromium.org>
 <auKeowlno9ud_XEC@gractus.seuss>
In-Reply-To: <auKeowlno9ud_XEC@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 17:57:28 +0000
X-Gm-Features: AclHuK_eUA7eJcFvxRe0vOiv97hSYoZptZHdt0c1Qd6KT-QMBCBoLFbJuPjf3cU
Message-ID: <CAFLszTj-cwvYmUkbmhSWt8C2JwqJeot606fXJ0fbZw8RFwtpFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] README: Use meson in the Python section
To: sjg@chromium.org
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T11:20:02, Simon Glass <sjg@chromium.org> wrote:
> README: Use meson in the Python section
>
> The Python section of README.md assumes a make build. It installs with
> 'make install', disables the library with NO_PYTHON, and runs its
> examples from the source tree, where make puts the built module. With
> meson the module is in the build directory instead, so the help example
> quietly imports whatever libfdt is installed, and the coverage example
> fails.
>
> Use meson to install and to disable the Python library, and run the
> examples from the build directory.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>  README.md | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Applied to main.

[2/2] README: Use meson in the Python section
      c22868416b8d

Regards,
Simon
