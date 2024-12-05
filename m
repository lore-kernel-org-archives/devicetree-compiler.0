Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322214A90
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Dec 2024 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733374286; cv=none; b=SyErOcNALoHsC+mHyPBns+o+LOrb26Uzi4vkspB5wjKKJ0EZEs2INmJiyxOtnkgmC1FU7K2cC7B9Hj45zD0XvNKtHp+YHRQQb/W0/y9WHrBsmOmt6ROG0J74hOeUJMpYF0JGeMpR5srWoc2P1VchqOgk37V1TKGAsP7TMzGvM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733374286; c=relaxed/simple;
	bh=3WF529yiIoatiPwUfxi7fEs1IIsnE+kUWj0gCYSRny4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhr3JDYbpHT7/AT0lyIzEmDlUBoka0ReOv+7e4WAZFMSN80gKly8ZEpyX4SyHacndf/3I1fagFBXU6in93fNTFT3Eg0KP9i+sa96Kq1r1UHYL5F3pqhoG/rOtZZQKTmtUfdjwZInZlftyXzqrHsxlW7q1k8ZIsXqujQ0ZwslNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=zwYyFmlG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="zwYyFmlG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21578cfad81so3977215ad.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Dec 2024 20:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733374284; x=1733979084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOkTR9abJCuYl2OVm6qvmoZEY+fGqD70pVf5hfogiYU=;
        b=zwYyFmlGftxg9PN5HXmVYVkcV3TXmEJ5bmfmmS5K4muJpvmPmFm7zHE0j7Jq41svk5
         OlGJma+owtryBKh9V99VNwZfxjbWFQAN7YcRZhf3rtST2edQLLoWTEc6+btD6zd9f4u9
         yeKr52NH3fXwEy4hBrA7rtSKFYu0sJ2a+remfHY00HHy/0byKdNrK1c5eM0b+ynBsMx3
         RqhVLhEKYLtWMl5MS9QTt1FwS3CMn/BM44x6oJZBvGt7bQChxdacoggij31o8wH3nb0s
         tE1fPVyrTM0GsA4p54jz39NptUYbuLTUID6HSK/Al8I+s01jhL5RVDxN+/TpIzJl8hX6
         Y6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733374284; x=1733979084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOkTR9abJCuYl2OVm6qvmoZEY+fGqD70pVf5hfogiYU=;
        b=pCAIk4ZSdAjTnZ1H/5CDdAE8Y236Rwz+Rmer4hprETaqEps3EfpiSf6tFA5koIS/KZ
         jHXElZw8CwAhaDzbNm2mpaLYO1QLzR+gFFLZCA6KKRRXvj6mSuEXXlrO2wy/n1XStrrx
         FsAOJlekS4k3E/9HBFDV38HSQMRy2etg3UQhIAMbAGVr/Q8J7RGQuyACA2dckktE+72Q
         31BTW8kL4EkB5tOl8QCAtL79eDWJr53GBH3FwTFdgMLxosQ9+TYYjSwjL8KgRm1vRtq3
         GgzUFPR2O//IvgkaeEqpVW6yF/Hgq77wQMEZ5NVjzUAko4pnyyGDHleRr/qgCF1bnZ+v
         Mabg==
X-Gm-Message-State: AOJu0YxT90hTHbdIahR5sfupS8F02RB5S0Cn+UO0JtS3J04MCyMcLcEZ
	p8tbMC4EI1hCMXpC9I4itXi3aNlOaSsGTro5anjWD8NrCUgv006QgEfAF/Arg3g8PxDLNAQ7KTy
	GpQ/zkTY=
X-Gm-Gg: ASbGncvnSm5/ytZk2kc3uOYNMkZ2h+Q5BkHq1QfLnj1oLyZ+ZhEIU+nQybBpDFJKQHW
	bH6MxZLLCedKexdVJ9z9TXmm2T+bs/5y91qpoIQjgsEOg6DU29dpgIDGcw+uhKZbWplte2HZreK
	76kfHRTlY4uWiUIsLoeromX1ZTyRYU6zec7FAJaPWB2AJ7L/6BEppogzkDWbFHVHcF+DQG9PYfn
	LCaaWdpS+c+V7qsR193dxDe93S4TpVaAQPfqR8llItJ3Ff1GsRUV4R3
X-Google-Smtp-Source: AGHT+IEim3WXXjyRq9FdJS4jqKe9zD3SRtwKJFdsZXKXxqJiHNN4y4tfUxjpxRtdhMzVmUeznQFyPQ==
X-Received: by 2002:a17:902:f78c:b0:215:5bd8:9f92 with SMTP id d9443c01a7336-215bd1b4763mr110208555ad.5.1733374283827;
        Wed, 04 Dec 2024 20:51:23 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa47esm3801015ad.153.2024.12.04.20.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:51:23 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Dec 2024 10:21:03 +0530
Subject: [PATCH v2 1/4] libfdt: add fdt_get_property_namelen_w()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-setprop-namelen-v2-1-0d85a3d2e7b1@beagleboard.org>
References: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
In-Reply-To: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=3WF529yiIoatiPwUfxi7fEs1IIsnE+kUWj0gCYSRny4=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnUTFBNWQTAgVeodI6XistxuIbzXrj7QOYO7kOh
 bbmpSPjOBaJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ1ExQQAKCRAFzvXHieVa
 dJegEACrZsVQSzRSYMV6ymQPZvK6FM1M83w6H+szDTZj9vTf9yDqpTinj3seqvVRXNg2SUdT9s4
 0HdH3GbzBOHLzfx7EqFOQiWE18QDLDwedaRHNJSdgXVQ9xtwQpanslh/hjnksJ0oFw0o+rUb7RQ
 f6z3z3f7QKfjA1IQYlDa1cu2pXBYrtpTNnkTIEURWV0lutsWJbYFtPVXpebIKJpdoS37p7YzKL+
 xV2SKZJhg1mwY5WlrVceP+MFukrt8eWhXrL4nXdQuidjlb6J5T3iVa9D0mFNGEiV9sNC86Zemoa
 8Ttg85jf7CdpeZKOnpM2kI79COU1iirzWXbV7Oxm5XGjnIGS2wd1enVvVXeWNWb2gvEg8A1yeH9
 U7WG5uLpZRcE81oKhgfcYxFOUffY5bN/+2lCo+VLdjke1XgluFyd396gOmcCt9ZuEKkGB54ku9I
 mraazwm2YBDDjLuN0nKHjCD4YIrlPl2NNFo8HrYWjNkoZpp3wYpd094Yc4MOLgHSb54Zf9PZ6kA
 lo6BfgQ5Ljc+da64mDzxf3HfGt2XWXUruhl6iAO2bACYDUG/g0YtypgHD1+X5B2/zEHFjmicU1/
 Sei5hA1H9NCo4vNZPn+a2YBoMeU0+7FQa/rxtXB/DmUlGPn+Z0psnWsFVeTCjuwRTq0tutZXBbr
 P/q56CHIfnXiXNw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Similar to the non-namelen variant, it is implemented in terms of
fdt_get_property_namelen()

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/libfdt.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 2e182ea3314d44f30e5362ad1ca62431c0bf663b..7d0c252a34970f4ca841935f8088410a3970127a 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -712,6 +712,13 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int nodeoffset,
 						    const char *name,
 						    int namelen, int *lenp);
+static inline struct fdt_property *
+fdt_get_property_namelen_w(void *fdt, int nodeoffset, const char *name,
+			   int namelen, int *lenp)
+{
+	return (struct fdt_property *)(uintptr_t)fdt_get_property_namelen(
+		fdt, nodeoffset, name, namelen, lenp);
+}
 #endif
 
 /**

-- 
2.47.1

