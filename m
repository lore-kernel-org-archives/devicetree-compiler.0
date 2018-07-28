From: Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v1] dtc: Add set-ldshared.patch
Date: Sat, 28 Jul 2018 15:43:29 +0200
Message-ID: <20180728154329.0bafffec@windsurf>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
 <f1e71e0d-6728-78d1-0431-c1e2846ab885@infradead.org>
 <20180728145647.70ac1d52@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <buildroot-bounces-9GAsQqxh4YTR7s880joybQ@public.gmane.org>
In-Reply-To: <20180728145647.70ac1d52@windsurf>
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
To: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: buildroot-9GAsQqxh4YTR7s880joybQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

On Sat, 28 Jul 2018 14:56:47 +0200, Thomas Petazzoni wrote:

> Are you sure your patch is fixing the host-dtc build issues ?
> 
> I am seeing two different build issues:
> 
>  - One for host-dtc, which looks like this:

[...]

>  - One for dtc, which looks like this:

Since all those problems are due to pylibfdt, which is new since 1.4.5,
and that we don't use in Buildroot, I applied a simpler fix: pass
NO_PYTHON=1 so that we don't build the Python support, even if the
necessary dependencies are found.

See:

  https://git.buildroot.org/buildroot/commit/?id=b50c95e914c6366e30145378fa82f286d4412c51

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
