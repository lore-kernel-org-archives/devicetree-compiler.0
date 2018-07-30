From: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v1] dtc: Add set-ldshared.patch
Date: Mon, 30 Jul 2018 07:46:08 -0700
Message-ID: <7dd4e047-43b8-8bfc-2710-9c804b09d003@infradead.org>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
 <f1e71e0d-6728-78d1-0431-c1e2846ab885@infradead.org>
 <20180728145647.70ac1d52@windsurf> <20180728154329.0bafffec@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <buildroot-bounces-9GAsQqxh4YTR7s880joybQ@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fxebhXdJ/gvtVijiXKO260vockX9xDmCPM6vFD8o7k=; b=egZkZpGFVIr5wojOVFJao9/WH
 RY6Q+njskEW0ybDMTxrVLSlTJWdSeuDY3Vef4LYy/fHUbjmcAXTeOe+JSjS70FSqmkeW3op31q/WD
 N+Juo1hmxb3hNl54GuwdWIYMC04zhs5aEybVh7nPDjO0m3wXEHIpX7GdeLfV1/OD6nwEpry6BW4z2
 nl08RwLacaNUVeFYyk/8xRg3oVvAAhzDlZu3E8y6qc5JUrTcuuEs9tluJ+dmg/iebM/7VWFWzfhDQ
 SxF1dr1y8NfpgZoGV9DvSyXDyPjE56td6SdKzz1ySljmVuMm0eLJvmNeeRJcIChfD8KvL/j6DYN/q
 S2v+ajY+g==;
In-Reply-To: <20180728154329.0bafffec@windsurf>
Content-Language: en-US
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request-9GAsQqxh4YTR7s880joybQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot-9GAsQqxh4YTR7s880joybQ@public.gmane.org>
List-Help: <mailto:buildroot-request-9GAsQqxh4YTR7s880joybQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request-9GAsQqxh4YTR7s880joybQ@public.gmane.org?subject=subscribe>
Errors-To: buildroot-bounces-9GAsQqxh4YTR7s880joybQ@public.gmane.org
Sender: "buildroot" <buildroot-bounces-9GAsQqxh4YTR7s880joybQ@public.gmane.org>
To: Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: buildroot-9GAsQqxh4YTR7s880joybQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 07/28/2018 06:43 AM, Thomas Petazzoni wrote:
> I applied a simpler fix: pass
> NO_PYTHON=1 so that we don't build the Python support, even if the
> necessary dependencies are found.

OK, great.  Thanks for looking into it.

-Geoff
