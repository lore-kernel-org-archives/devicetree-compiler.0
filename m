Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145D2741AC
	for <devicetree-compiler@vger.kernel.org>; Fri,  5 Dec 2025 22:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764973779; cv=none; b=f7uvBhNicY4I/plXX+bQ2XQjak9D6AGAJScDGJ05ceopFFRvHk8mcwyJTU4PLTfm8sxznPX/90Mf01dUHX2fWFiaB45I5e/SUBrbzmw557d8SbxyUUF+xIDoDm+hed5FdofNVHAOi6x+x5qztDPTFa/xRkrYW8JN8NuLh8LOAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764973779; c=relaxed/simple;
	bh=NWn+Fz4AJ1O1upphQNLDyJk3mDe/PDeRdxlRLH/JR3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtI509/2EhRjkhoZUmNtZxGsfeV1Sbta2BiX3RmdnYdMH/KsAPOxBn350EnaTmmWVsL+dRYmJmkt0gu58F3pYEhA9qYB/vOeF4SWOpfrcOTAyRxvdbJjjcznfEZUWGtppSkUFrgSFx8ElGgRsR4sAo/zIKqAqJ4+ojSzXvuqRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW6RAoqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW6RAoqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225A2C16AAE
	for <devicetree-compiler@vger.kernel.org>; Fri,  5 Dec 2025 22:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764973779;
	bh=NWn+Fz4AJ1O1upphQNLDyJk3mDe/PDeRdxlRLH/JR3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jW6RAoqizc0rO+qSO42wqyxD1tbhlyYh07OkQ8nNxYBbcHbfh6Q0d+bLgT/zOr4D3
	 fWn7L7OMNe6+6YRaIvMT776Vt3Nkhx1wfANuE7aePqkw9UUtQhJ2q4+4emdq6x3tsy
	 eUi5o39k46wn0jlKFViBzTl8y36u1ekIifOO5L9OW8Yu9O/gkkK+MPwbnXA54q/oBa
	 Fvqc1RvFWemGmCwQGTQSNhpn8luGpHktY9aBTtMrcAPEx4nyDVMaAuCe3msj60vHmi
	 1aCVurj8EcSD0TsXLF/mg/rnNrrLWXr4+57WtjIgWMxvtGGSSML87u0rhp+Gzyj+GV
	 WWeW0hsXUWf+g==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73875aa527so381639266b.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 05 Dec 2025 14:29:39 -0800 (PST)
X-Gm-Message-State: AOJu0Yw3n+Gph4IJDz7wY3tKhidGMoUCnnMXXIWSUewznV/SjfnkjG5g
	/fUlMw219v4TtZqSY14krVPVPX9VwPWtlq4LY/E4bGwLSn9FxKIUmXrT//Q8Fe8P0QKAhyryXqD
	AUFcdQXOPcCyDoMFldljmwoxkPI1gfA==
X-Google-Smtp-Source: AGHT+IFPz2OiXOao68KgRP2/aq/ae6SnJuHgu3GqWNUIBjUwhB8l/SRWJlHs2sBpYbWBGJusPu6YkXbyAodcHCuYvEQ=
X-Received: by 2002:a17:907:1b18:b0:b79:c233:c89d with SMTP id
 a640c23a62f3a-b7a2477ae85mr67011566b.57.1764973777660; Fri, 05 Dec 2025
 14:29:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFLszTgYUVScwyd3_SS+AR305XCUHbiQgCurQVtK3nYfSXe7dw@mail.gmail.com>
In-Reply-To: <CAFLszTgYUVScwyd3_SS+AR305XCUHbiQgCurQVtK3nYfSXe7dw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 Dec 2025 16:29:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK=hVka9Qc53T3mtkEpsa_z7mVb1x-fdMazayj3eCWAEQ@mail.gmail.com>
X-Gm-Features: AQt7F2oRor5_cu9UxLWAjjUMrTuVt7llv2Dw-lcVhr4P5JOdkkzRzxCZNdmbaDg
Message-ID: <CAL_JsqK=hVka9Qc53T3mtkEpsa_z7mVb1x-fdMazayj3eCWAEQ@mail.gmail.com>
Subject: Re: Rust library?
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 4:10=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi,
>
> Does anyone know of a good / official Rust library for libfdt?
>
> If not, this one[1] seems somewhat sane, although a bit limited. Would
> it make sense to try to create an 'official' version based on that? It
> would need quite a bit of work as it only supports reading.

No changes in 3 years, but 500k downloads. Seems like a lot.

> Any advice or thoughts are welcome!

You might check what the TF-A folks are doing. There's an effort to
re-write it in Rust and it depends on libfdt (I think).

Rob
