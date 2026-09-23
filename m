Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA7C3ED3C9
	for <devicetree-compiler@vger.kernel.org>; Wed, 23 Sep 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185877; cv=none; b=nYOSls2p60fEiksef/bE2qTzBIqrY5XiqKEOO0k3T4eeeKbkJ80Tsv8TRUuxA0H2hWcdsFdTlw/QA5uEQud7v2My5jjqfKj7QB1bwio4sTe0cV7w+Rv+QOwrY9ErDPaHvAljwqLcvwCo28JQgNj8QNIEYgwSbLNQKuKFXz0WIJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185877; c=relaxed/simple;
	bh=g5GaO/pWQMPbYlGQR0j8fmZ67K9gT8pXwRq5zKjKbSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SjXJUUWz5kj0agRuV9F7BDov/hLpJebwsddafO7kdJEdVRkwx3ZiK5rfamTjEIf8zutZhZ7bOz8Mn8HjkcWQCMTxlCMyMJolt7RF/4lrvPq7elYACWzK2oMEXf7iyCFNam14YzJ/5f71eSac6rVvQZHZqznWCDFE0fMxfU3mbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzB8J30L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcJuX+qw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzB8J30L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcJuX+qw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGU3CP3106209
	for <devicetree-compiler@vger.kernel.org>; Wed, 23 Sep 2026 17:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0q0Z/hfaaYX90RIzSF2HhD
	quwkOGcl69xuxjB4YRccQ=; b=NzB8J30LjOQE7E0UAoiIvkYESmPNB/Vgs3nuGO
	0q4C3v+JNXuJuCdqSaJYQuzOQLvTHindns0Onm3WoTtCGWbhXGmZNu65HykS7Y41
	59fRdVvknArpxxe54yKZAEyy2Ne9B9mRbPzrePDDuKfoQyCKk90SOacZqhW57m3C
	4JBYAH+tDzSiKyJrtHCDR7IOo0K7YTgbKLU9AAuy7FzqSo/NTJHsYCZFbHRl14eW
	LmRBdV5zgR5hLIj4Q4biV/p2ZJwXD+ZDeaUKp47Msp/cFSkKx+OTXoHRGEQQdPac
	kqEXs+GvJBzWsP5WjzG8oWrQY2mc/JHFV5WuK0EXyCO9vEbA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwh6gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Wed, 23 Sep 2026 17:51:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1028775a91.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 23 Sep 2026 10:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790185825; x=1790790625; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0q0Z/hfaaYX90RIzSF2HhDquwkOGcl69xuxjB4YRccQ=;
        b=hcJuX+qwm5J8o8Iccei8IU5oSxhuJqeOqlWQ0rkG3rBl1KyaMg9b+0LbsuxGdqpKYW
         mfydsiZG4ZWaC5sdd9HssBuZRUnqAJweLmGqfZczzcfZghpBqjv6vycPKiswqRxTNhqh
         p4whnXwoeqILUcwq0mn9JmBYDvlSuuhktbFWiWlNMrbNnedRrM9GbJiNoHVTbHTEfr20
         QoD+Mad2G3GQCrEmJWgogXKzLJ7JzTwvV4lEO9zuqWpy8rmEkcVGbRr1m3+eSV/WSlqU
         GyhjhAjt/Pnp0ZGSwRVYl0KExrZvg5jJobbXS2EGzox0psERXakguNN70YkYREswUpiX
         NvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185825; x=1790790625;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0q0Z/hfaaYX90RIzSF2HhDquwkOGcl69xuxjB4YRccQ=;
        b=Du2P60z7XLlJqOmpYdPt193Wu13BPCnV/VOqhalT4K7yndkhJf8cmxfVuaj9ASaAsm
         zYk1+KK4TClSvc6OY6TmFVHdsSXHcEIsFvJhdXqc4cA2GVnGTm+nC84XmurKRLQztv9A
         sOlM5RIWXxS6DmqLEsMBRrtgQcqF7gCZuwRoaSdplvNW9lDl/tdheJxC0hrcfQGZmFTp
         A10pEJ/Paf5xFPTBAOop/sTg/5Eb7swPLuVYhx1kDY0tLn8tbU66+aqsd4elRqUkTWr3
         ZmxXE1YkVWW3ke8krWj3TLcWtr0DQ/rPORfm06E0cZ+LiVTLYATV46wv07x3mtbqPLmG
         y8KA==
X-Gm-Message-State: AFuF++k5lUlGk+LhvXR3nUjObh+SUsGt09Lrtw8hGgakV/0ukFYH8ls+
	Un8K3iRfQGScp8q8afHFEcgtyk/VC4Ke18SXY+KJEX4APNpjwMldU0gsrJSH7ERQRz7iW7+Zu+C
	Uo6xsK7lzc3KWD2ZNR6/l+xv/VPUzpbF6oMrJ+jAmNMKIlvy7bX8BY0+6Aw3kHrye1iQ+FPEZHp
	QLiL9Yri0i
X-Gm-Gg: AYBFou0t7AtJ0MlpdKtB7j/6z59/UpfrkdV09b+GOI6CS3srKwkRrjnmh6xC6JpLAEa
	5h5QgYf8zPaAJgQhaDKhXhVsQIOS2C/lKc8JtYZ7Y7xcd07hpmvHGXnZ9t4JlYM4VwRfloCWye0
	NFIVIqZPAGT42hQAxxR731UynFBLQdyzl8XFb5dUSPxbd3OanbtNxTnkEQWBQpdxcQH+PW6BgWx
	YXVy+0MjD4AdwNOmfiMny3CpMxE0kJqcNAxTPU8X22Ou85uhDcjKTzKWLG1vJ41AHbKfynbPkmf
	Zb9DH0QeJzvlnryg1DuzSlFdDp9eIjtVqbO+TEAX+VtC/wrZ4cI9JkDAUSs0Yv4RW8lPGPJ2IDv
	dF43YQfoFs++ztazRCg/EGZ5s2NcIbDulLQyxa2Gu21OpcvMQfCY=
X-Received: by 2002:a17:90b:4b82:b0:39e:93f8:eb07 with SMTP id 98e67ed59e1d1-3a07e614380mr3113325a91.40.1790185824292;
        Wed, 23 Sep 2026 10:50:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4b82:b0:39e:93f8:eb07 with SMTP id 98e67ed59e1d1-3a07e614380mr3113301a91.40.1790185823724;
        Wed, 23 Sep 2026 10:50:23 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fdbsm205951a91.10.2026.09.23.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:50:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:50:18 +0000
Subject: [PATCH] checks: Warn about overlapping reserved-memory ranges
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrm0CFUn0KsbFWH6kaoB0cGJCu
 DuDLr/FewtFuCHSpVjIkSzaOGRUh4K0D8MDbG02SSlNeZYjaw99sSN3CS2PCf4OEzd66lSkqhF
 qyvHk6Oz7G19vf8fP/Qmd9xut6wa43/+WegAAAA==
X-Change-ID: 20260923-check-reserved-overlap-6c5fc2214ea4
To: devicetree-compiler@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790185822; l=7314;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=g5GaO/pWQMPbYlGQR0j8fmZ67K9gT8pXwRq5zKjKbSI=;
 b=6ilEtEognOuTKIgke89R5NrnSVrihg7YgjZgNABsytcOnIZ30QNb92UhtBkcQIxlzBXcckA3T
 40vz3R+20q9D5ULEuX7PViX8Frd85+KFfpeuNXbQ440ZsUGkMsyM3Ci
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3MSBTYWx0ZWRfXzm6D8WD9K9Hr
 UB2x2qJHTL9Ez5TvruFYJQm7yfwdOKY3bCIY9tx9iii5nzxan2xp1HB65P2/JtMm9eLh+/MBB1n
 kV2HvJHhbD3ya8T+zE8zFpB0StPGVGNetD1kW0G9zJ27nQun7kXaiWHGSlR/V5uFJFaR1S00m+Z
 N9ckdl6UAkPmwuCIZevjqQPL1PaAtwy/4VrD5Z77CEwp6lPaAizhDa5D0968YGuH4rdyYhSvfVZ
 nPI5jqCEexkMq2pMXRijM4H2sTXggSyBNgOpUo8ItkugnEqD4Znj/OdzIIeRBf/3oYxPcdlh+Xb
 oq5AxsD3qkD890gGazLHpeKp0eQ6hBjAC/YRmg5kQrw4MngxOuTThwF8GlWzLKsk9dD0CwX4xh5
 8TXxpiOj7+WKEIWYosUaTNIwFQX5utQ4uHWDLgIHZf632VP/DQdXg8GLgU8XIzwl9gWVysY7zxw
 xHi1BsTragKREo1MK3w==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab41190 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QLf2zNnw-oeEEYjaeMwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3MSBTYWx0ZWRfXz8eROAA2d4AK
 l5ACDKR7nt+6jxOir8N00v0+Yo+OsXDALR7yuVeCW3RkFzqEW2nxm0OCKNl4a0eg7HKLremBexp
 eI8PEN6x3I94lXkvfnJ4uRSp0xeecvU=
X-Proofpoint-ORIG-GUID: rqqbmbA7z64WRPv4ri5eBrf7aF-S4sOO
X-Proofpoint-GUID: rqqbmbA7z64WRPv4ri5eBrf7aF-S4sOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230071

Static /reserved-memory entries associate physical address ranges with
particular purposes and properties. While not explicitly prohibited,
overlapping ranges commonly indicate an incorrect address or size and
may assign the same memory conflicting attributes. Dtc currently
provides no diagnostic for this type of mistake.

Check every non-empty reg range under available reserved-memory children
and report overlaps. Add tests covering overlapping and adjacent ranges,
as well as unavailable, zero-sized, and dynamically allocated regions.

Assisted-by: pi:gpt-5.6-sol
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 checks.c                             | 131 +++++++++++++++++++++++++++++++++++
 tests/reserved-memory-no-overlap.dts |  43 ++++++++++++
 tests/reserved-memory-overlap.dts    |  21 ++++++
 tests/run_tests.sh                   |   2 +
 4 files changed, 197 insertions(+)

diff --git a/checks.c b/checks.c
index a6037ed08000..baa0914e37a5 100644
--- a/checks.c
+++ b/checks.c
@@ -1266,6 +1266,136 @@ static bool node_is_disabled(struct node *node)
 	return false;
 }
 
+static bool node_is_available(struct node *node)
+{
+	struct property *prop;
+	const char *status;
+
+	prop = get_property(node, "status");
+	if (!prop)
+		return true;
+
+	if (!data_is_one_string(prop->val))
+		return false;
+
+	status = prop->val.val;
+	return streq(status, "okay") || streq(status, "ok");
+}
+
+static bool get_reg_value(struct property *reg, unsigned int cell,
+			  int cell_count, uint64_t *value)
+{
+	uint64_t val = 0;
+	int i;
+
+	if (cell_count < 0 || cell_count > 2)
+		return false;
+
+	for (i = 0; i < cell_count; i++)
+		val = (val << 32) | propval_cell_n(reg, cell + i);
+
+	*value = val;
+	return true;
+}
+
+static bool ranges_overlap(uint64_t addr_a, uint64_t size_a,
+			   uint64_t addr_b, uint64_t size_b)
+{
+	if (!size_a || !size_b)
+		return false;
+
+	if (addr_a <= addr_b)
+		return addr_b - addr_a < size_a;
+
+	return addr_a - addr_b < size_b;
+}
+
+static void format_range_end(char end_str[20], uint64_t addr, uint64_t size)
+{
+	uint64_t end = addr + size;
+
+	if (end < addr)
+		snprintf(end_str, 20, "0x1%016" PRIx64, end);
+	else
+		snprintf(end_str, 20, "0x%" PRIx64, end);
+}
+
+static void check_reserved_memory_overlap(struct check *c,
+					  struct dt_info *dti,
+					  struct node *node)
+{
+	struct reserve_range {
+		struct node *node;
+		uint64_t addr;
+		uint64_t size;
+	} *ranges = NULL;
+	struct node *child;
+	unsigned int range_count = 0;
+	int addr_cells, size_cells, entry_cells;
+
+	if (!streq(node->fullpath, "/reserved-memory"))
+		return;
+
+	addr_cells = node_addr_cells(node);
+	size_cells = node_size_cells(node);
+	entry_cells = addr_cells + size_cells;
+
+	/* Physical addresses and sizes wider than 64 bits cannot be compared. */
+	if (addr_cells > 2 || size_cells > 2 || entry_cells <= 0)
+		return;
+
+	for_each_child(node, child) {
+		struct property *reg;
+		unsigned int cell;
+
+		if (!node_is_available(child))
+			continue;
+
+		reg = get_property(child, "reg");
+		if (!reg)
+			continue;
+
+		for (cell = 0; cell < reg->val.len / sizeof(cell_t);
+		     cell += entry_cells) {
+			uint64_t addr, size;
+			unsigned int i;
+
+			if (!get_reg_value(reg, cell, addr_cells, &addr) ||
+			    !get_reg_value(reg, cell + addr_cells,
+					   size_cells, &size))
+				continue;
+
+			for (i = 0; i < range_count; i++) {
+				char end[20], other_end[20];
+
+				if (!ranges_overlap(addr, size, ranges[i].addr,
+						    ranges[i].size))
+					continue;
+
+				format_range_end(end, addr, size);
+				format_range_end(other_end, ranges[i].addr,
+						 ranges[i].size);
+				FAIL(c, dti, child,
+				     "reg range [0x%" PRIx64 ", %s) overlaps with %s "
+				     "[0x%" PRIx64 ", %s)",
+				     addr, end, ranges[i].node->fullpath,
+				     ranges[i].addr, other_end);
+			}
+
+			ranges = xrealloc(ranges,
+					  (range_count + 1) * sizeof(*ranges));
+			ranges[range_count].node = child;
+			ranges[range_count].addr = addr;
+			ranges[range_count].size = size;
+			range_count++;
+		}
+	}
+
+	free(ranges);
+}
+WARNING(reserved_memory_overlap, check_reserved_memory_overlap, NULL,
+	&addr_size_cells, &reg_format);
+
 static void check_unique_unit_address_common(struct check *c,
 						struct dt_info *dti,
 						struct node *node,
@@ -1945,6 +2075,7 @@ static struct check *check_table[] = {
 
 	&avoid_default_addr_size,
 	&avoid_unnecessary_addr_size,
+	&reserved_memory_overlap,
 	&unique_unit_address,
 	&unique_unit_address_if_enabled,
 	&obsolete_chosen_interrupt_controller,
diff --git a/tests/reserved-memory-no-overlap.dts b/tests/reserved-memory-no-overlap.dts
new file mode 100644
index 000000000000..0293986ef746
--- /dev/null
+++ b/tests/reserved-memory-no-overlap.dts
@@ -0,0 +1,43 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		first@100000000 {
+			reg = <0x1 0x00000000 0x0 0x00100000>;
+		};
+
+		adjacent@100100000 {
+			reg = <0x1 0x00100000 0x0 0x00100000>;
+		};
+
+		disabled@100020000 {
+			reg = <0x1 0x00020000 0x0 0x00100000>;
+			status = "disabled";
+		};
+
+		reserved@100040000 {
+			reg = <0x1 0x00040000 0x0 0x00100000>;
+			status = "reserved";
+		};
+
+		failed@100060000 {
+			reg = <0x1 0x00060000 0x0 0x00100000>;
+			status = "fail";
+		};
+
+		zero-size@100080000 {
+			reg = <0x1 0x00080000 0x0 0x0>;
+		};
+
+		dynamic {
+			size = <0x0 0x00100000>;
+		};
+	};
+};
diff --git a/tests/reserved-memory-overlap.dts b/tests/reserved-memory-overlap.dts
new file mode 100644
index 000000000000..fec7c3a33b1f
--- /dev/null
+++ b/tests/reserved-memory-overlap.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		first@100000000 {
+			reg = <0x1 0x00000000 0x0 0x00100000>,
+			      <0x2 0x00000000 0x0 0x00200000>;
+		};
+
+		second@200100000 {
+			reg = <0x2 0x00100000 0x0 0x00100000>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b543059bb..27c3ebfed338 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -746,6 +746,8 @@ dtc_tests () {
     check_tests "$SRCDIR/reg-ranges-root.dts" reg_format ranges_format
     check_tests "$SRCDIR/bad-dma-ranges.dts" dma_ranges_format
     check_tests "$SRCDIR/default-addr-size.dts" avoid_default_addr_size
+    check_tests "$SRCDIR/reserved-memory-overlap.dts" reserved_memory_overlap
+    check_tests "$SRCDIR/reserved-memory-no-overlap.dts" -n reserved_memory_overlap
     check_tests "$SRCDIR/obsolete-chosen-interrupt-controller.dts" obsolete_chosen_interrupt_controller
     check_tests "$SRCDIR/reg-without-unit-addr.dts" unit_address_vs_reg
     check_tests "$SRCDIR/unit-addr-without-reg.dts" unit_address_vs_reg

---
base-commit: 7a1e017926004ecff5fce62d62d42ce9f3e00082
change-id: 20260923-check-reserved-overlap-6c5fc2214ea4

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

