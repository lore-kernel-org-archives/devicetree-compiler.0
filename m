Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9797F6
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Aug 2024 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724980003; cv=none; b=Panq7UnuMR5o2/avEh1lPFg7xCqZQrJHH+yWjlvkahJqCHQzAQMEQnt8Ev6+nt+ecISQzn0GrGwCFM/f7CJ8/+ESMTYKnmnKEPgAW66ABjRnypVwBfNGxKjHSO3pAcGkmToRK9CLYqoRsfEwaxJSRbJYIyKWINDtchfjOcQ6FiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724980003; c=relaxed/simple;
	bh=yMjU/ZMpAFub38jyK4Drw3aFxS6KOKRlWspTVPV+Om4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeSRjq9iW0PZRFeh2VKjU1kHyCmEaz1CXaTgSi61DKT6A70PFR3nKogVJg0alQSBxMt+bA6SP+TJQIn9G02CNxt4Uhe9rE2nY96rGgyKRlvIZQ98UBw7IGNkf1gj6xsr4UHDl63ZF2BRqCQ3nj4YCsa2UgWkQLkqfdZHQE46dc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d7gd7Qo1; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d7gd7Qo1"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e1a7c25e350so111156276.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724980000; x=1725584800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xcodrAfsvMoUK8oLxAt+zjXU+xF2e+gvDrkgXfGMwhU=;
        b=d7gd7Qo1G7/tgLfl6BUV5CNBopXda9M6zNPGvbeqK7F7PFTcrhADtIP+yO+A1Fmxhm
         /d7vmDSbWm3HpejdCOQJf1mTLFE6SP4lUuGQ38p3pTVpjrsWF3x8psKKY70AMAHveZZh
         hpEZSZ4xq9WLHrVp50njuFyvzSMw9V6utxUBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980000; x=1725584800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcodrAfsvMoUK8oLxAt+zjXU+xF2e+gvDrkgXfGMwhU=;
        b=R1+llUbkaHjLLpWMbG5bxewjTgFTdyaIXgX+IZcL9WkZ0WhybaFm8FkkbU8HOWSjkx
         /mJgW9LCm0+DaP1k1fiJnJoAX21ZY+iIACLQDiRNiNLIxfUQbodrYxHsoeuCz1DbNUGR
         WB324LdDl1UmbKI1Gpo96G9yvkSq4iIjWILAuJ/m5CjybfBIYcrncsr0bQ9TYRp5pjbx
         dflFva8qZ7nGS/NO8PPTf8ZimiQoubZ5sqJRV34lP9kB8fH2sBkUXFKEWBlaesCz9U/2
         bsM4VzbaLkDSO0rxEcsJ0Z2kgl7YccruZ2DR7aCX8XhjwzlnrciL1vJ17uVXL5acwlJD
         G3cA==
X-Forwarded-Encrypted: i=1; AJvYcCU+BP7Fyy/CTX4mdhadK+6ZRap7L5UrWJ1M5l9dK6xxmGr0F6mXDZlubrqfSkAR/efc6q05fwK2q2EHgvn7xtU82PGh@vger.kernel.org
X-Gm-Message-State: AOJu0YxPKOrvIvBk9oc9DzMn+K0ptLI6AaajIpj3dIkholLjJpisP0VI
	BNnpPniLXSiBzQtJUaE96xOBFgpJSCsgjea1nj3uwF+q5mailcHf+hkMA8nzQednLDLwkYyP8AJ
	fQif9SV/pZUrja7wkaIQBrR0BTzf9R7N4sNyn
X-Google-Smtp-Source: AGHT+IE7wWGbfIyg0YdO07P6u8uJLZpgSxxLhLsrHkYASRFYU4r7sYgKlvP0aI+kcCp4jxSrdnaVR54CkTgmBnT9pQY=
X-Received: by 2002:a05:6902:1504:b0:e1a:769c:61a9 with SMTP id
 3f1490d57ef6-e1a7a1c8ec6mr612252276.55.1724979998688; Thu, 29 Aug 2024
 18:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org> <20240830-append-v2-2-ec1e03f110ad@beagleboard.org>
In-Reply-To: <20240830-append-v2-2-ec1e03f110ad@beagleboard.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Aug 2024 19:06:28 -0600
Message-ID: <CAFLszTiTR4-WLoVP7NDAWtVHYsFeVNaT84k3MLUDMYYpF7CvSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests: Add test for append-property
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
	Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ayush,

On Thu, 29 Aug 2024 at 14:04, Ayush Singh <ayush@beagleboard.org> wrote:
>
> - Test /append-property/ on a string and int array.
> - Also test on subnode property.
>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  tests/append_prop.dts | 21 +++++++++++++++++++++
>  tests/run_tests.sh    |  7 +++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/tests/append_prop.dts b/tests/append_prop.dts
> new file mode 100644
> index 0000000..248d4ed
> --- /dev/null
> +++ b/tests/append_prop.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +
> +/ {
> +       str-prop = "0";
> +       num-prop = <2>;
> +
> +       subnode{
> +               str-prop = "0";
> +               num-prop = <2>;
> +       };
> +};
> +
> +/ {
> +       /append-property/ str-prop = "1";
> +       /append-property/ num-prop = <1>;
> +
> +       subnode{
> +               /append-property/ str-prop = "1";
> +               /append-property/ num-prop = <1>;
> +       };
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 937b128..571980a 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -708,6 +708,13 @@ dtc_tests () {
>      run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
>      tree1_tests dtc_tree1_delete.test.dtb
>
> +    # Check prop append functionality
> +    run_dtc_test -I dts -O dtb -o append_prop.test.dtb "$SRCDIR/append_prop.dts"
> +    run_fdtget_test "0 1" append_prop.test.dtb "/" "str-prop"
> +    run_fdtget_test "2 1" append_prop.test.dtb "/" "num-prop"
> +    run_fdtget_test "0 1" append_prop.test.dtb "/subnode" "str-prop"
> +    run_fdtget_test "2 1" append_prop.test.dtb "/subnode" "num-prop"
> +
>      # Check omit-if-no-ref functionality
>      run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-ref.dts"
>      run_test check_path omit-no-ref.test.dtb not-exists "/node1"

I wonder what happens when you try to append but there is no existing
property? Or when you append something empty?

Regards,
Simon
