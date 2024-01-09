Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA62912
	for <devicetree-compiler@vger.kernel.org>; Tue,  9 Jan 2024 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEBa6cf2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFE3C433C7
	for <devicetree-compiler@vger.kernel.org>; Tue,  9 Jan 2024 06:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704781249;
	bh=EzxTEqEuNkMhMYtKuDbKsSvfQldhFdhp/XJdggGQdPc=;
	h=From:Date:Subject:To:From;
	b=lEBa6cf2IoyU2+OFZ3diLbvZvCQ5npQcv6KtEAG1iREuY6d/pgonTsgqZIlAACKfI
	 sPGJzEfu/n615y1TQ0LSL6OcgcIIaELcRUEFy3hPQqdsiW0UkGzkwkpYF75epT0XFM
	 1sGTdjLJcFcG161sre1CIvA8Q0m24R4TM3sh/GOl1tap5F4VO5T5ltdB7/Q2VPZhf/
	 76ykarXsP1EH9HzZw3FmMVu3EcdNH0uSZ8wbsRXWkiObsnH+yqSjsdka1ntZwlUm5H
	 QCvPpM75j2girV7avW0Vjfyj8pLLGFDnJ5uL0PthSyYgw+FLTd8HvcqSytLwzH8xQW
	 nqk2JWsjTbQeg==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dddc655a60so584282a34.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 08 Jan 2024 22:20:49 -0800 (PST)
X-Gm-Message-State: AOJu0YzWy6OKjjfDuvSjAoYxsaHZ3bM/BxzAnuk7wUrKJPhCTOeJDek3
	b8nqIK10eZWPUqZqtUWkKsWetEVQI8WXTIea010=
X-Google-Smtp-Source: AGHT+IFcY04sM7SkifDjiegNW50fmN9ragXc+k0sOYo5RZgADbmvqfhv3o4t8CZPSaW9sDEBKxe8726UEBrNLBBUdsI=
X-Received: by 2002:a05:6870:dc4b:b0:203:d603:db7d with SMTP id
 nr11-20020a056870dc4b00b00203d603db7dmr6026521oab.83.1704781249064; Mon, 08
 Jan 2024 22:20:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 9 Jan 2024 15:20:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com>
Message-ID: <CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com>
Subject: Record of original components for fdtoverlay
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi.

Sorry for a stupid question.


When you get a DTB by using fdtoverlay, there is no way to
know how it was produced later. Correct?

For instance, this case:

 $ fdtoverlay --input base.dtb ovl.dtbo --output foo.dtb

Once you get foo.dtb, you will never know whether it was
assembled from base.dtb + ovl.dtbo, or it was directly
generated from a single source, foo.dts.

In my understanding, there is no room in DTB to record
such metadata, and it is impossible to disassemble foo.dtb
into the original components, base.dtb and ovl.dtbo.

Please let me confirm that I did not miss anything.


-- 
Best Regards
Masahiro Yamada
