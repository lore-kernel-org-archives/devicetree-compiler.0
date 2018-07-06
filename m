From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 08/29] libfdt: Fix the Python pack() function
Date: Fri,  6 Jul 2018 10:27:21 -0600
Message-ID: <20180706162742.186950-9-sjg@chromium.org>
References: <20180706162742.186950-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20180706162742.186950-1-sjg@chromium.org>
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
CkNoYW5nZXMgaW4gdjI6IE5vbmUKCiBzY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlw
cGVkIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVk
IGIvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAppbmRleCA2Nzc0YjkzYjJj
Li41YjM4ZTYzYjI2IDEwMDY0NAotLS0gYS9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9z
aGlwcGVkCisrKyBiL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQKQEAgLTQ0
Miw3ICs0NDIsMTEgQEAgY2xhc3MgRmR0OgogICAgICAgICBSYWlzZXM6CiAgICAgICAgICAgICBG
ZHRFeGNlcHRpb24gaWYgYW55IGVycm9yIG9jY3VycwogICAgICAgICAiIiIKLSAgICAgICAgcmV0
dXJuIGNoZWNrX2VycihmZHRfcGFjayhzZWxmLl9mZHQpLCBxdWlldCkKKyAgICAgICAgZXJyID0g
Y2hlY2tfZXJyKGZkdF9wYWNrKHNlbGYuX2ZkdCksIHF1aWV0KQorICAgICAgICBpZiBlcnI6Cisg
ICAgICAgICAgICByZXR1cm4gZXJyCisgICAgICAgIGRlbCBzZWxmLl9mZHRbc2VsZi50b3RhbHNp
emUoKTpdCisgICAgICAgIHJldHVybiBlcnIKIAogICAgIGRlZiBnZXRwcm9wKHNlbGYsIG5vZGVv
ZmZzZXQsIHByb3BfbmFtZSwgcXVpZXQ9KCkpOgogICAgICAgICAiIiJHZXQgYSBwcm9wZXJ0eSBm
cm9tIGEgbm9kZQotLSAKMi4xOC4wLjIwMy5nZmFjNjc2ZGZiOS1nb29nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVLUJvb3QgbWFpbGluZyBsaXN0ClUt
Qm9vdEBsaXN0cy5kZW54LmRlCmh0dHBzOi8vbGlzdHMuZGVueC5kZS9saXN0aW5mby91LWJvb3QK
