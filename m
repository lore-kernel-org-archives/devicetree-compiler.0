From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 0/2] Emit experimental YAML output
Date: Tue, 28 Nov 2017 11:57:08 +0000
Message-ID: <20171128115710.9267-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=lYY1GhVwT3+DjR7Q+EmNd3rs802ufNlRQwxkZcGaFZk=;
        b=bSMFhCiPFRB8PjLpTCkoZASVGjy9gbgJv2dgfWAuPCALO6rdY9Vi4A/P3kpRZth25Y
         SsYkbq/Ia6NWgYnnjsV21SEGl5HzosbR1+83NEdezHMGXS5USxMPlpaacrQSULnuh5NO
         2Ibo5KUGrfsHTiv4DQb5eZxBRORq3cxm6eSwRRgBqsltUD28414uu/b8scUQVfUYrBTV
         BweEBF1ZLAJoDWovK9pHfga+8fRCusgbzi3bjGvvNHUAq38wkY74dhTvYnLmQurjxx6x
         vf3P5Nwv9EYCdvf1R96vxmbdCeDU0+iClH/X65meqxcmvn8ydxMd34JNp6NdyHeAlRDO
         5Nbg==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org

Here is some code I've been experimenting with as part of evaluating what the
YAML encoding should be for DT. It adds YAML output to DTC.

Pantelis, I know you already wrote a patch[1] that does exactly this. The only
reason I wrote a new patch is because I wanted to try a couple of different
things:
- I want to preserve datatypes and integer groupings from the DT source as much
  as possible
- I want to use an existing yaml emitter (libyaml) instead of raw fprintf() to
  avoid emitting something that is not quite compatible with YAML.

This series consists of two patches. The first patch adds new markers to
indicate the datatypes and groupings. The treesource output routines are
modified to use the datatype marker information when emitting .dts source. If
the new markers are not present (like when reading from a DTB source), then it
falls back to the existing scheme of guessing the datatype.

The first patch is pretty close to complete. I need to go through the error
conditions again, but otherwise it could be merged. Having these markers is
generally useful, and could be used as part of validation/schema checks at
compile time. For instance, keeping the groupings of interrupt specifiers would
make it easier to check that an interrupt specifier is the correct size. I
could also see adding an intermediary stage after reading a .dtb file to
interpret the properties and add the correct markers wherever possible.
phandles could be resolved back to labels in this way, which would make
decompiling .dtbs a lot more useful.

The second patch is not complete. It cannot be merged until the yaml encoding
is nailed down. It also uses libyaml, but I haven't wired in the linker flags
correctly. dtc doesn't currently use any external library apart from libc, so
I'm not sure how best to add it in. DTC should still compile successfully if
libyaml isn't available.

[1] https://github.com/pantoniou/dtc/commits/yaml

Here's an example of the output with the original source included as comments
for comparison. This example comes from tests/label01.dts.

# / {
#   model = "MyBoardName";
#   compatible = "MyBoardName", "MyBoardFamilyName";
#   #address-cells = <2>;
#   #size-cells = <2>;
- model: ["MyBoardName"]
  compatible: ["MyBoardName", "MyBoardFamilyName"]
  '#address-cells': [[0x2]]
  '#size-cells': [[0x2]]

  # cpus {
  #   linux,phandle = <0x1>;
  #   #address-cells = <1>;
  #   #size-cells = <0>;
  cpus:
    linux,phandle: [[0x1]]
    '#address-cells': [[0x1]]
    '#size-cells': [[0x0]]


    # PowerPC,970@0 {
    #   name = "PowerPC,970";
    #   device_type = "cpu";
    #   reg = <0x00000000>;
    #   clock-frequency = <1600000000>;
    #   timebase-frequency = <33333333>;
    #   linux,boot-cpu;
    #   i-cache-size = <65536>;
    #   d-cache-size = <32768>;
    # };
    PowerPC,970@0:
      device_type: ["cpu"]
      reg: [[0x0]]
      clock-frequency: [[0x5f5e1000]]
      timebase-frequency: [[0x1fca055]]
      linux,boot-cpu: true
      i-cache-size: [[0x10000]]
      d-cache-size: [[0x8000]]

    # PowerPC,970@1 {
    #   name = "PowerPC,970";
    #   device_type = "cpu";
    #   reg = <0x00000001>;
    #   clock-frequency = <1600000000>;
    #   timebase-frequency = <33333333>;
    #   i-cache-size = <65536>;
    #   d-cache-size = <32768>;
    # };
    PowerPC,970@1:
      device_type: ["cpu"]
      reg: [[0x1]]
      clock-frequency: [[0x5f5e1000]]
      timebase-frequency: [[0x1fca055]]
      i-cache-size: [[0x10000]]
      d-cache-size: [[0x8000]]

  # node: randomnode {
  #   prop: string = str: "foo", str_mid: "stuffstuff\t\t\t\n\n\n" str_end: ;
  #   blob = [byte: 0a 0b 0c 0d byte_mid: de ea ad be ef byte_end: ];
  #   ref = < cell: &{/memory@0} 0x0 cell_mid: 0xffffffff cell_end: >;
  #   mixed = "abc", pre: [1234] post: , gap: < aligned: 0xa 0xb 0xc>;
  #   tricky1 = [61 lt1: 62 63 00];
  #   subnode: child {
  #   };
  #   /* subnode_end: is auto-generated by node emit */
  # };
  randomnode:
    $labels: [node]
    string: ["foo", "stuffstuff\t\t\t\n\n\n"]
    blob: [!u8 [0xa, 0xb, 0xc, 0xd, 0xde, 0xea, 0xad, 0xbe, 0xef]]
    ref: [[!phandle "/memory@0", 0x0, 0xffffffff]]
    mixed: ["abc", !u8 [0x12, 0x34], [0xa, 0xb, 0xc]]
    tricky1: [!u8 [0x61, 0x62, 0x63, 0x0]]
    child:
      $labels: [subnode]

  # memory@0 {
  #   device_type = "memory";
  #   memreg: reg = <0x00000000 0x00000000 0x00000000 0x20000000>;
  # };
  memory@0:
    device_type: ["memory"]
    reg: [[0x0, 0x0, 0x0, 0x20000000]]
    phandle: [[0x2]]

  # chosen {
  #   bootargs = "root=/dev/sda2";
  #   linux,platform = <0x600>;
  # };
  chosen:
    bootargs: ["root=/dev/sda2"]
    linux,platform: [[0x600]]
...
