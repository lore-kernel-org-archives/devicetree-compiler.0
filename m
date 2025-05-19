Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8A26A09A
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645856; cv=none; b=uL9cEhiL804rwobn0UWlJLsp9bGgR1wrS2ZukP13Kz49JhIEwhVszPJW7z3EBJXqX/wpkw0gguOLhb6g02wfUmNI0nScGnBTUZPivggg0re8w/XILU+QALDJwRH1Vc6pByrrQFCs/QyEdsrsNP7dIqPgo9hoBICRXIG6WbR5Fpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645856; c=relaxed/simple;
	bh=BYWK3idtC9GoeSJKEO0IQWeFMknh60pPCzpjgac6JIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=irrQBicEv55Uua67hFsRDdp1VDblECy5wxk/n3oYozYmI52NrLyH/nnx9sFfpkIi5OJw2wyXKizHZkb7oLhkETYGUTFrQT5c7LcRpBTcpw5dAAMwwMFCvNspBpCl5AXmOOIzaup2OPCo3PewinGMWEVivShzAwSfqskeiKP+gGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gz+cNALP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gz+cNALP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INSG5R020390
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wQ3hgxrvP5mew54vHWxYK+w7hpI9agxx9Iy
	z0/IjkGc=; b=gz+cNALPJ3PQHvZtYySIJLvp6aR6QVTKBklrkP7fhwejBiByCgm
	iGbF3iNudqpNgGuW43+JcybAdUPpIznFwg0d+jU6kB3RzYInC+mFHhXWDn8KCvUd
	6jaIaOSRBoJT86sO7aG32AUjbn+IuNznSuOE0KLvN0govYGLOsJxYCfQp79x8fma
	cxepGU57ugb82FUbs4cd9FPZwHQQlIOA+vYTuRHGGkpSRgmpWpF7HlxjJfusKHOb
	ExJ2J/X4eYHKyyeYPKr9c2gg1FGNiU+sgNwX5EPNAdxb+KlNbpW53B6ZeETUhysD
	rP9PLDkDBUYmHqGKVhpUiBHv3YEZz6V9CtQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7brd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:10:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Al6a018338
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:10:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhkw6df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:10:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54J9Al1t018319
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:10:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54J9AkAF018318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id CE5655AC; Mon, 19 May 2025 14:40:45 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: devicetree-compiler@vger.kernel.org
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of overlay blobs
Date: Mon, 19 May 2025 14:40:39 +0530
Message-ID: <20250519091043.621316-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682af59c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=k0acvNe8AdW_4PcSWToA:9
 a=Q1lU4rTVkePEluit:21 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: UI7SBEthDK6ZSFrIoEzG4mBUt7MdoEIz
X-Proofpoint-GUID: UI7SBEthDK6ZSFrIoEzG4mBUt7MdoEIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NiBTYWx0ZWRfX4Aps91XFiMAh
 Aub3ucXRCSew1+sDrr8WharkZjPhfCPYTzmuoT6z5+LS+VUKBGAZHGnq6F00+0sF4byTRC1fL6k
 wSI3SeP5FcBf9KHaIj1Hyd/JIci+L/M7Mmzr5cxKbx4r8zt4y/ZiQEvHWkSp4ypkFzctOgYEODy
 Z6iutfCdGlXa8kKVbq2TcV0Mf2LiMp61PuzzWWQpWM7ZL3GDiGpcXlA0Yozb0s39mB/72HFnVDH
 d4y+nD1ML9UA9BojEuwZBdAQTHiqPKSlJkPR+aHHNX4mN3HlyUzvaC7eM8GMuN5JBG8yQJsEM1w
 PYLIBXhjM1UxwQ5yvZ33qBMx7c5n5I8rLvvxZ2yiSa3heSgX/hQMo06hdgfjQcz6EN2iqs2coRm
 SDigHpbD1oGA/n0qv8QfGuxznoLq1YCG8CnHHZn/9CGJThPM/mbH4klMOPrbiSUWf1kZGOlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190086

Hello,

This is follow-up attempt for fdtoverlaymerge tool.

Currently all the device-tree (DT) code for a given soc is maintained in a
common kernel repository. For example, this common DT code will have code for
audio, video, fingerprint, bluetooth etc. Further this, DT code is typically
split into a base (soc-common) code and board specific code, with the soc code
being compiled as soc.dtb and board specific code being compiled as respective
overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware configuration
of a given SOC while boardX.dtbo represents configuration of a board/platform
designed using that soc.soc.dtb and boardX.dtbo files are flashed separately on
target (besides improving the overall size of DT blobs flashed on target, Android
Treble also requires separation of soc and board DT bits). Bootloader will pick
one of the board overlay blobs and merge it with soc.dtb, before booting kernel
which is presented a unified DT blob (soc + board overlay).

For ease of code maintenance and better control over release management, we are
exploring allowing some of the tech teams (audio/fingerprint sensor etc) to
maintain their kernel code (including their DT code) outside a common kernel
repository. In our experience, this simplifies number of branches maintained in
core kernel repo. New/experimental features in fingerprint sensor driver for
example that needs to be on a separate branch will not result in unnecessary
branching in core kenrel repo, affecting all other drivers.

In addition to compiling DT code outside core kernel tree, we also want to merge
the blobs back to respective blobs found in kernel build tree at buildtime
(soc.dtb or boardX.dtbo), as otherwise relying on bootloader to do all the
overlay impacts boot-time.

This brings up the need to merge two overlay blobs (fingerprint-overlay.dtbo +
boardX.dtbo), which currently doesn't seem to be supported and which this patch
series aims to support.

fdt_overlay_apply() API currently allows for an overlay DT blob to be merged
with a base blob. It assumes that all external symbols specified in overlay
blob's __fixups__ section are found in base blob's __symbols__ section and
aborts on the first instance where a symbol could not be found in base blob.
This is mostly fine as the primary use of overlay is on a target for its
bootloader to merge various overlay blobs based on h/w configuration detected.
But when the number of overlays increased then bootloader takes lot of time to
apply the overlays on base DT.

So we need new API/tool to merge all the overlays into single overlay file
at host (build machine) side, so that on target side bootloader needs to only
apply merged-overlay-dt to its base-dt. This saves lot of time due to reduced
number file reading/loading & minimizing repeatative overlay apply.
In our test setup we see an improvement of ~60% while applying merged-overlay
at bootloader and the merged-overlay is product of 7 overlays.

To serve this overlay-merge feature we have introduce fdtoverlaymerge tool
which takes input as overlays and gives output to merged-overlay.
The tool uses fdt_overlay_merge() API introduced in libfdt to do the actual work.

Additional notes:
  If snprintf (in libc) may not available in some environments, then we will need
  to write our own snprintf() in libfdt.

---
Changelog:

v3:
- Update copy_node & add copy_fragment_to_base to incorporate two cases i.e
  - Case1: When target is available and we merge fragments
  - Case2: When target is not available and we add new fragments
- Change the logic to update fixups & local_fixups in case of overlay merge.
- Few patches are squashed, reduced to 4 patches.
- v2-link: https://lore.kernel.org/all/1599671882-310027-1-git-send-email-gurbaror@codeaurora.org/


Srivatsa Vaddagiri (4):
  libfdt: overlay_merge: Introduce fdt_overlay_merge()
  libfdt: overlay_merge: Rename & copy overlay fragments and their
    properties
  libfdt: overlay_merge: Update phandles, symbols, fixups & local_fixups
  fdtoverlaymerge: A tool that merges overlays

 .gitignore           |   1 +
 Makefile             |   4 +
 Makefile.utils       |   6 +
 fdtoverlaymerge.c    | 223 +++++++++++
 libfdt/fdt_overlay.c | 901 ++++++++++++++++++++++++++++++++++++++++++-
 libfdt/fdt_rw.c      |  14 +-
 libfdt/libfdt.h      |  18 +
 libfdt/version.lds   |   1 +
 meson.build          |   2 +-
 9 files changed, 1146 insertions(+), 24 deletions(-)
 create mode 100644 fdtoverlaymerge.c


base-commit: f4c53f4ebf7809a07666bf728c823005e1f1a612
--
2.49.0

