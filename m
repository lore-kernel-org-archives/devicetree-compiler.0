Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224678;
	b=KGCYmSJ70ek8CnNF46mYAh+PUEDmiW+XnNm6SakPfa+h2Hl9Y0bEz1PqEh8+D4M1Kl1U
	 +fY5yLp8tSlo1OKUm/edgW9SMUvtNncsLVXnNpwV4J38kv+EPb/h8GIdiVWLKH8SYchli
	 OFfuiFqZPexUGZ3Z3ezQAWfXNMl50ezJyhtGmVyT5aoP1OdFMHgWmz91p6HxS+dyKxPQH
	 UHO4f8uN4OGjwaaluSLAgp4ooWfaQdMyY3+PJaDhpK3F5Fi8mlfejWxwNo0ThC8nAjN7/
	 xOOyU/2zfiI9LJ/BgsI3IRPJS56ik8ZcWG4V795oYLVJqQEQSd3+RUQoh54zwFzqvMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
	b=iapE6dEkKbrITZydTykbFqSiDLys3MmQL3rpqAbdNnrxb1tHRwwcCJ15rFWfdDzoiJWr
	 k7UcZeUJZ7doU9oetXin3ycZ0yVR+KKhhhWDoFzvc6B/H+R0hVncD333bVQw+WM+dFAye
	 MeoANi1ECKyHrijASqSwFaoXU7qLTDAVOj2Hb5CsLxf5O7WDYxJnHfGKzjug9Q1QKHqfo
	 GHf2ilP4Bw7niXEMhGGuzP/pd19woargWS9N0Qkn4s4B2gXxphsH2gESpFth8N2m8okq/
	 dU1H1QXhl63Now8rjipbeWrS4HPfTGzvaVODxcURdLZ0OWt3uybugU8XDIbESlmNv7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FuydJNjP;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB2C606A31A
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FuydJNjP
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2270796a12.1
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224677; x=1793829477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
        b=FuydJNjPXgDLn846/Ln1QNraCLJV6EcZkBW3YD4rxI/oRb9x7KW5MoXnCuKm1YdmLT
         Gp9iEaheVPftOkNgnTSsV/GWvW048xnIRSJ1xlrgESM2Oa+qgLrbcqUgpOx3EQ8AsCjU
         9bR6Vbrhhd5ehcQeuNqwLS75b2CiyIH9OsVOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224677; x=1793829477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
        b=j4AM9jCmxT13Sm6zUu1Yf14oSEc0wUDqTfPxd78twt/Gqvw2xDhvRyF234k9mjg2AU
         PbDCXwrfmQ2cdgUXUgWh5R22LNLvcGK0wjkXMgLzRBxfGkieo7AyIJqT6VUi10AOj3t4
         md/nozckBffSPdZ4Fk2dr4H7BC0Wg4ot7LxSLgfF+i2PO9eRN5EM90E596jxGBQ2R3sU
         r+gM+h/OOTSrHNZuo1W8MizV4Yezxe3EKlN1vXf5khMqn3ns3fPyn8YsR3tqsHI5UBdk
         GNRMRKVf0ZEyarXAgU7SBdvXR8ligT/8me8FyvBUW3a/82h1RcBgY/8xL9VTG1nMU7tv
         mUmw==
X-Gm-Message-State: AFq9FYI5b1xVgR+Q3DAkIfow7MLENT8lbARHXU535V5AEdRmMsv7J4CB
	CFvEhu9WvLxptvbfVko2bPa4UDvPJ2g2e+wLri6/8Bw3soD0+p+5S7S0NLfQXvejfUC+uxyeoSR
	iYlsoCo/Y
X-Gm-Gg: AYBFou17E+NqM7Ouf/5x6KOGYaH0tbiM8LAu1p9ydbEKv40hhrMwCFg8MBD1bbpMmNF
	Pvu4BG1ylxaTFOCWPm5jMhR33d3PJfebro0ZW9WgW/ZaF6j4BP4Rw7BNFWfWPBaRi7QTB5UX/vj
	aQZCIGjBT8PyqtsD4vFmgQw3xvKtknFbWoqPvq2d7V7n/nB6Eq30f5n4OnmOapOgexySZ6nqq/r
	XoenEc7eGoQV25jwmXAGQYk714jKLmOJuo7nB6aN/ro79/kWs7keoU14mZnbYemRwTAPQNS8R53
	Cr+NEKpl+u4fNwAULJDVTOEq8xRiOwbJxSKbsl3TvgcYKEetqPAHMMdwqUdAn4buhb/sKAYrkfJ
	/skDEVYTvGTii4QPppZ8O1h5B0GORSYz/iFntlzd/oUD2hwBk17YAi+WNGAHvnEP1abRQI+jOfa
	aytwaeMU7LE3BTJbv6wb4+5QHetnj6NulBUQHewBgTEnUpxQ02G++w4hFnqvZh3dRwSDH793fUN
	pfZ3E/6Kojpa98HgNs6kHfTnj6GySM8AyTUUKFnbucJ7BVgSKCopjp2gNRLMYNUwA+KZDThd8tL
	gE8xMytCe9RnEjAo6yqFU2vwZcyna3i5sCobCzonzbIkqMSWeDyffXbZbcqDq0g65CuA
X-Received: by 2002:a17:907:3ea0:b0:c2e:2d8c:4585 with SMTP id a640c23a62f3a-c49bdf953ebmr315196666b.36.1793224676926;
        Wed, 28 Oct 2026 14:57:56 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e2401bsm339384966b.84.2026.10.28.14.57.55
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:55 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so1005957f8f.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:55 -0700 (PDT)
X-Received: by 2002:a05:6000:438a:b0:48e:5d63:a4e5 with SMTP id
 ffacd0b85a97d-48e5d63a673mr7516209f8f.0.1793224674740; Wed, 28 Oct 2026
 14:57:54 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
In-Reply-To: <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQcsTe1jS4FakyFGwPLpxXxwXbNzsHxOsZqHOa_HqwPQ@mail.gmail.com>
X-Gm-Features: AclHuK9SPdgtx9SZKlcuIND28eXBX-71-arKGnifL9h09UJM3B-5CnKYQnrW6-4
Message-ID: <CAD=FV=XQcsTe1jS4FakyFGwPLpxXxwXbNzsHxOsZqHOa_HqwPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -11,31 +11,195 @@ original device tree.
> > +    if comp =3D=3D 'xz':
> > +        return lzma.compress(raw_bytes, format=3Dlzma.FORMAT_XZ)
>
> Python's default integrity check for FORMAT_XZ is CRC64, but embedded
> xz decoders often support only CRC32. The kernel's lib/xz is one of
> them, which is why scripts/xz_wrap.sh passes --check=3Dcrc32 to xz. So a
> firmware-friendly .dtb.xz input could produce a .dtbo.xz that the same
> firmware cannot read. Please can you pass check=3Dlzma.CHECK_CRC32 here?

Done. compress_blob() now passes check=3Dlzma.CHECK_CRC32 for FORMAT_XZ.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1167,20 +1349,24 @@ def factor_dtb_files(args):
> >                  d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
> >              )
> >
> > +    base_dtb_file_bytes =3D compress_blob(base_dtb_blob, base_dtb_comp=
)
>
> If you keep --verify in the tool (David suggests it belongs in the
> test suite), it would be worth running the compressed bytes back
> through decompress_blob() and comparing them, since at present only
> the uncompressed blobs are checked. That is cheap and would catch a
> problem with the lz4 command or the compression options.

I removed the --verify and made sure things were well-tested in
the test suites.


> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > @@ -1147,6 +1147,36 @@ fdtoverlay_tests() {
> > +         run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
> > +             -b "fdtfactor_base.test.dtb.$ext" \
>
> In these tests the base output always uses the same compression as the
> inputs, and the input extension always matches the file contents. Two
> extra cases would be good, perhaps as a follow-up: a compressed blob
> in a plain '.dtb' file (to exercise the magic-byte detection) and, if
> -b stays, an uncompressed -b alongside compressed inputs.

Done. Added a test case in tests/run_tests.sh that passes a gzip-compressed
blob with a plain '.dtb' extension alongside '.dtb.gz' inputs and writes an
uncompressed '-b' output (plus another test exercising --base-compression).
