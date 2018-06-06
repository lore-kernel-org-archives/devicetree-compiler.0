From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 08/29] libfdt: Fix the Python pack() function
Date: Tue,  5 Jun 2018 18:46:44 -0600
Message-ID: <20180606004705.79641-9-sjg@chromium.org>
References: <20180606004705.79641-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qxP5jQxheKZw6YyJApdTSgBZu38rsfMyjr3vBbgzvH4=;
 b=IqlIfAOS+nsgF02Db+5g3IbT7HnqW8J3nk2GzOIgesLnxaC72qbfzQegGUTkFOJr0i
 VnF1XkK2HQ4bbSWrDuyNLhxpb4gfhWKnByhsZW3ZO12zh9TKYMxh2Zqn4RXH74UGS8ez
 gUfGIiii7PrL+N78E44a7KXXo8+jyAfX2uMQV8XHkaXv+IiYBdFKdulAv9DipziQj3NW
 M8Rwbp8TFxDmFbXpRp6ZRunO4X5N7IZK9ffwrMnxJBiKrPXvKW2Ncj+T7RGXISwThsho
 rS+dJOqZ2D8TE0qCKOQ2zqFhd4vgrUVe9I/Z05nyttDlRe+3F/GGkpcp1HsiV8y9U93M
 HzuA==
In-Reply-To: <20180606004705.79641-1-sjg@chromium.org>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Tom Rini <trini@konsulko.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

VGhpcyBjdXJyZW50bHkgZmFpbHMgdG8gcmVkdWNlIHRoZSBkZXZpY2UtdHJlZSBieXRlYXJyYXkg
c2l6ZS4gRml4IHRoaXMuCgpUaGlzIHN0YW5kcyBpbiBmb3IgYSBwZW5kaW5nIHVwc3RyZWFtIGNo
YW5nZS4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgotLS0K
CiBzY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkIHwgNiArKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9z
Y3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkIGIvc2NyaXB0cy9kdGMvcHlsaWJm
ZHQvbGliZmR0Lmlfc2hpcHBlZAppbmRleCA2Nzc0YjkzYjJjYi4uNWIzOGU2M2IyNjcgMTAwNjQ0
Ci0tLSBhL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQKKysrIGIvc2NyaXB0
cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZApAQCAtNDQyLDcgKzQ0MiwxMSBAQCBjbGFz
cyBGZHQ6CiAgICAgICAgIFJhaXNlczoKICAgICAgICAgICAgIEZkdEV4Y2VwdGlvbiBpZiBhbnkg
ZXJyb3Igb2NjdXJzCiAgICAgICAgICIiIgotICAgICAgICByZXR1cm4gY2hlY2tfZXJyKGZkdF9w
YWNrKHNlbGYuX2ZkdCksIHF1aWV0KQorICAgICAgICBlcnIgPSBjaGVja19lcnIoZmR0X3BhY2so
c2VsZi5fZmR0KSwgcXVpZXQpCisgICAgICAgIGlmIGVycjoKKyAgICAgICAgICAgIHJldHVybiBl
cnIKKyAgICAgICAgZGVsIHNlbGYuX2ZkdFtzZWxmLnRvdGFsc2l6ZSgpOl0KKyAgICAgICAgcmV0
dXJuIGVycgogCiAgICAgZGVmIGdldHByb3Aoc2VsZiwgbm9kZW9mZnNldCwgcHJvcF9uYW1lLCBx
dWlldD0oKSk6CiAgICAgICAgICIiIkdldCBhIHByb3BlcnR5IGZyb20gYSBub2RlCi0tIAoyLjE3
LjEuMTE4NS5nNTViZTk0NzgzMi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVLUJvb3QgbWFpbGluZyBsaXN0ClUtQm9vdEBsaXN0cy5kZW54LmRl
Cmh0dHBzOi8vbGlzdHMuZGVueC5kZS9saXN0aW5mby91LWJvb3QK
