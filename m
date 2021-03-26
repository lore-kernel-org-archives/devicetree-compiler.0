From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 1/6] libfdt: Tidy up pylibfdt build rule
Date: Fri, 26 Mar 2021 19:08:07 +1300
Message-ID: <CAPnjgZ14BLLoKfdcETcpyahwBwBs_Z7MUG17cOyb15Nzkmcb7w@mail.gmail.com>
References: <20210326040208.878820-2-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IUGjydOvMQgir72i3oqN+85EyNP3IpXR3T6+yGlq2zU=;
 b=k4gbhnyGGJ/JH1e1xcIxq3gvx1HszG0i9uOHLxyTKNdS/AoFQq2EzrHQiG1+GVAllz
 Ng8J/eia2s/AY7NC3bbO2vgCtA5k9QhauZjWFg+D0gId6TDkX83hDGa9Xzc3VfRFLNO8
 JZHU0ncgXJQ2MVO3ehtftSrbYX+N8g4yRogzw=
In-Reply-To: <20210326040208.878820-2-sjg@chromium.org>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <https://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Tom Rini <trini@konsulko.com>, Bin Meng <bmeng.cn@gmail.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

On Fri, 26 Mar 2021 at 17:02, Simon Glass <sjg@chromium.org> wrote:
>
> At present the build rule for pylibfdt depends on _libfdt.so but modern
> Python versions add a different suffix to the output file, resulting in
> something like _libfdt.cpython-38-x86_64-linux-gnu.so
>
> The result is that pylibfdt is rebuilt every time.
>
> Rename the file the standard name so that the rule works correctly. Also
> add libfdt.py to the dependencies, so that file is always created if
> missing.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> Changes in v3:
> - Make the rm silent
> - Use a single build rule to avoid building two pylibfdts in parallel
>
> Changes in v2:
> - Adjust tag so this patch doesn't got to dtc list
>
>  scripts/dtc/pylibfdt/Makefile | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied to u-boot-dm/next
(replacing v2)
