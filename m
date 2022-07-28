From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 0/4] Updates to README file
Date: Thu, 28 Jul 2022 17:53:44 +1000
Message-ID: <20220728075348.174412-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658994830;
        bh=shqEWAtrLbAMAbELTt5tnZdNMbzSBIKDOLwH82lNitc=;
        h=From:To:Cc:Subject:Date:From;
        b=ATNWSNKKW6MCnoDJw+jxY/c5Qq+q30L+eIl1cgzagO2cxk1lVjQv/Bm86dH4+wJmM
         SJAaLSBnFCYWDsKCO2w5rJqz3so8GRhwZGDlRRzMm0+TG/antgKo34S74rLwxSEVYk
         FNd3IEQyuOPCLf68ahKzq0nR/hyTnkzQxah3SZJU=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

The README for dtc and libfdt is fairly overdue for an update.
Reformat it in a more modern way, and add some important information
to it.

David Gibson (4):
  Convert README to README.md
  Remove Jon Loeliger from maintainers list
  Split out information for contributors to CONTRIBUTING.md
  Add description of Signed-off-by lines

 CONTRIBUTING.md |  79 ++++++++++++++++++++++++++++++++++++
 README          | 106 ------------------------------------------------
 README.md       | 100 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 179 insertions(+), 106 deletions(-)
 create mode 100644 CONTRIBUTING.md
 delete mode 100644 README
 create mode 100644 README.md

-- 
2.37.1

