From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/5] checks: Add check_is_cell() for all phandle+arg properties
Date: Tue, 25 May 2021 20:03:32 -0500
Message-ID: <20210526010335.860787-3-robh@kernel.org>
References: <20210526010335.860787-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210526010335.860787-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There's already a check for '#.*-cells' properties, so let's enable it for
all the ones we already know about.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index eb91c8ea22fa..6a01a2468c42 100644
--- a/checks.c
+++ b/checks.c
@@ -1466,7 +1466,8 @@ static void check_provider_cells_property(struct check *c,
 }
 #define WARNING_PROPERTY_PHANDLE_CELLS(nm, propname, cells_name, ...) \
 	static struct provider nm##_provider = { (propname), (cells_name), __VA_ARGS__ }; \
-	WARNING(nm##_property, check_provider_cells_property, &nm##_provider, &phandle_references);
+	WARNING_IF_NOT_CELL(nm##_is_cell, cells_name); \
+	WARNING(nm##_property, check_provider_cells_property, &nm##_provider, &nm##_is_cell, &phandle_references);
 
 WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
 WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooling-cells");
@@ -1843,21 +1844,37 @@ static struct check *check_table[] = {
 	&chosen_node_is_root, &chosen_node_bootargs, &chosen_node_stdout_path,
 
 	&clocks_property,
+	&clocks_is_cell,
 	&cooling_device_property,
+	&cooling_device_is_cell,
 	&dmas_property,
+	&dmas_is_cell,
 	&hwlocks_property,
+	&hwlocks_is_cell,
 	&interrupts_extended_property,
+	&interrupts_extended_is_cell,
 	&io_channels_property,
+	&io_channels_is_cell,
 	&iommus_property,
+	&iommus_is_cell,
 	&mboxes_property,
+	&mboxes_is_cell,
 	&msi_parent_property,
+	&msi_parent_is_cell,
 	&mux_controls_property,
+	&mux_controls_is_cell,
 	&phys_property,
+	&phys_is_cell,
 	&power_domains_property,
+	&power_domains_is_cell,
 	&pwms_property,
+	&pwms_is_cell,
 	&resets_property,
+	&resets_is_cell,
 	&sound_dai_property,
+	&sound_dai_is_cell,
 	&thermal_sensors_property,
+	&thermal_sensors_is_cell,
 
 	&deprecated_gpio_property,
 	&gpios_property,
-- 
2.27.0

