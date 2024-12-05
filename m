Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7E114A90
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Dec 2024 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733374281; cv=none; b=BuvH5F74z2zBBsNvuB/Vk7iNC+yGrQBINbQA3fq5zJKk5jfxKhSR8cl6jsJIIBh+yYuend6gwhl+VW7idb9KOhm9uvqJlUooXU1TSOpR5P91BfV6FiVW7iIY9FFU5PAN65viRt7TxkPt7OIs6FXUS9CTJ2XQPvhJm5RaxWyIQNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733374281; c=relaxed/simple;
	bh=pCztPtgVVwR7Ro7JcuVMz1pFhPB581nSDz+ETtmrtEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=utVfdhhevmvhxakcsdv9tfqVE7UNj0vxeFReIs86dZvXco7Jw9/CvGYmlx58fOxQg2VyXJGYX9xme5gFhcwaUuJtoT+bjA32LlteyHXKcy/g6brD8ys4klNi6O3b3jLUtdIPgfNWM3v6pPQuP+8k31FjAGNOsPx1v7BVHEtfpCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=ov75PKs5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="ov75PKs5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-215b13e9ccbso4686215ad.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Dec 2024 20:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733374279; x=1733979079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eP0/yEbfx6n+WwAiw9C4NTboYOyNkzzYlEznlkjNi7w=;
        b=ov75PKs5UYQnf295/AA6+r3WTZH7ikUVWpsxczu4pbIaKND2p2/mJRLOqYMEJVdEJb
         oDFAdaf8M8E8RcIGwiR6Vvqt4Ab81r7AkdZGBH4T/IjNVQ5NNz/k8nHfQyToq3lxE3OG
         fqoKqVKDTeuZK5PN5jG6a/q9Cdkp3gbe5X/+5QAu3KS7aG1gP7SLjZY1paVbF8hcgyx/
         ghW7UQTxCatjImXYXR7vDZWYmIezkn7DPZqWXuDGN5qoAra/+uV300G7rT24B1/wz/+o
         ORWhkoVe+GPqQlh1+OYVhkOyHe2sZCrVBvaLhXBzdhgFu9V/LTC+ClmIyUxcc/+86ExF
         tHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733374279; x=1733979079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eP0/yEbfx6n+WwAiw9C4NTboYOyNkzzYlEznlkjNi7w=;
        b=jU2L/OlbGlvKSS4yiFK5pNA7zquCx6b2bHS/uKvTpNjIPZq4l1vnhakrc9C0UDFp3q
         x0jiXVn0L4AoulY154kZZ9k96paiIOaY3oqta9BYesWb2FScWWa9Xdck4EYTjYHHgzvq
         ZhtIJUKuUURN5WCmRdno7aZPTDH/UxNyd1R8G94MxUyxMSQjNiU5ULhJqdx4+cZPhM3/
         w4XIJrd78He6Ptr+Suedr37tcW7uwcyT/OAd++XeWpvpvrr6cbCuXnDLXg/E4G/3zHAM
         zMBuAx6/5yLB1LpOE+4vTBi2NfvV6RaA3S56b+fHB6yPUiC2u+BsSGyME6vYWs03tX/3
         O7IQ==
X-Gm-Message-State: AOJu0Yws2uLgMNfXSNo1pRomRROvOzRx/y8cG0eqMQymPnc/qj+h+gxU
	IE2qzL0wFWAhekKfPLp2Rq7OTrMB2oxmz97aJKPTlK/CmHPMfhANA5gdO+oUkrNoa/Lkwlxc+df
	5ZINj1Ug=
X-Gm-Gg: ASbGncsDxfL3yjg3L3qZUWO4aHP1bDxSpBDDVJqBd/rITpeMPnpcusLOSScxTpxBtKN
	DMVq6JxxPwe98GUvV/DVuCTQuZ362W70WO2gDJbhkeSrTNileiDJAuKMwxbyg+nuzTZ2sNmvwTe
	QFKiXxdMHd3GhSrsR53MKWTUD7eoWRuYUvpjzzP8LTH6TortKeYdRDHLi4N8/eSZcnep9R+d4Es
	DZU6vFXAIYBP8YRhTybPev1OJyoYHJ1Msaq5Hrn8UXBVigq0A0IurUO
X-Google-Smtp-Source: AGHT+IHpGMYwPf76wMtQ/b7rmC1W8JchlQ2toe015naQ8oYkC8MDW0QzGrccXRxmspqEmzxzxmzVXg==
X-Received: by 2002:a17:902:e841:b0:215:734f:ffd5 with SMTP id d9443c01a7336-215bcfbc58bmr124168395ad.11.1733374279031;
        Wed, 04 Dec 2024 20:51:19 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa47esm3801015ad.153.2024.12.04.20.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:51:18 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v2 0/4] libfdt: Add namelen variants for setprop
Date: Thu, 05 Dec 2024 10:21:02 +0530
Message-Id: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYxUWcC/3WNyw6CMBBFf4XM2po+UKIr/8OwGNppaYItmRKiI
 fy7lb3Lc5J77gaFOFKBe7MB0xpLzKmCPjVgR0yBRHSVQUvdKi2NKLTMnGeR8EUTJYG31ndeXjq
 0HupqZvLxfRSffeUxliXz5zhY1c/+b61KSOEUoTHGD+5qHwNhmGjIyO6cOUC/7/sXgzTcH7QAA
 AA=
X-Change-ID: 20241203-setprop-namelen-a94f7f057acf
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=pCztPtgVVwR7Ro7JcuVMz1pFhPB581nSDz+ETtmrtEA=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnUTE7TKZGERNi0TIrpwp+pA5c6LvrEZhM9BZzJ
 pWaNCwqIE2JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ1ExOwAKCRAFzvXHieVa
 dEc6D/97KQbQfSWP59FIfv87FjjEqEltsvtpIyW21FZH5CAP3DlG/zaTO431odYx9qT01AQ+bT6
 9TPOm9aSaxJkxKQLgcw9FVGcQqDA950gDhx1J7DTPGSLC3OlCm07ByPqavZ/tdrSCeq/xkAdnxd
 iG/s8kPoRKiu5tKVQl1qHWYCdwaXgxfF+cnxk7DkyV18gI58n9NpQ5Jdwt/iWJpAHeZRsPLiQl2
 uNmDYC7fdA6wG/LWEiVi8UYhmRW6rEzKsMDkzneZtB6xDZnkiZAtTChyQ2zFJiek/Srhx5Gq2WI
 vXcHJkEZiOucrf5S//U/TCpgiQSxaieBKPTGNnSLj6/uCsOjTHTU87gSks1zeacqv0lnAvDNPRx
 sIh9Dxc+iuPcKRP23yZZp+VROyyCnPcilvg3y77uJEIlCRe7xaUfyp4KJdo7aJAFgz5bpo5nHYv
 Pt0BDFS+WRqYRmA58/K4GeLZv4jcxe/lqPmdQ9m6vswGx/xGk458WJIID/Vw+iyswVr+CCHybJ0
 IYsSndGSYtLR34jKFJnqYcdBlLgMPRY2Qih3b8n1oQBmIy8nvn6NGHgg5lwaiECRnIjBBBfe2GX
 SwOrcpU/XD1YVn+P33UPuJk8OlENjzB8+c5WePIHf8A2h3gNr0RU62J2k1YwPzL4V7AX5e5ay4r
 uUAWuprMXMR7e2A==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Helper functions to setproperty with length of property name similar to
getprop_namelen variants.

This patch series was originally part of overlay-path patch series [0].

[0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#t

Signed-off-by: Ayush Singh <ayush@beagleboard.org>

---
Changes in v2:
- Rename fdt_setprop_namelen_placeholder() to
  fdt_setprop_placeholder_namelen().
- Some formatting changes in fdt_resize_property_().
- Add trailers.
- Link to v1: https://lore.kernel.org/r/20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org

---
Ayush Singh (4):
      libfdt: add fdt_get_property_namelen_w()
      libfdt_internal: fdt_find_string_len_()
      libfdt: Add fdt_setprop_namelen()
      libfdt: Add fdt_setprop_namelen_string()

 libfdt/fdt.c             |   8 ++--
 libfdt/fdt_rw.c          |  41 +++++++++-------
 libfdt/libfdt.h          | 120 +++++++++++++++++++++++++++++++++++++++++++++--
 libfdt/libfdt_internal.h |  11 ++++-
 libfdt/version.lds       |   2 +
 5 files changed, 156 insertions(+), 26 deletions(-)
---
base-commit: 6f183c7d9246bde8f05d2edbc31fdd497c4a8702
change-id: 20241203-setprop-namelen-a94f7f057acf

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

