From: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: Sort unit addresses by number
Date: Wed, 12 Aug 2015 12:00:04 +1000
Message-ID: <20150812120004.5117c6b1@kryten>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The sort option in dtc treats unit addresses as strings. This causes
cpu nodes to end up out of order:

# dtc -s -I fs -O dts /proc/proc/device-tree | grep PowerPC,POWER7

		PowerPC,POWER7@30 {
		PowerPC,POWER7@68 {
		PowerPC,POWER7@70 {
		PowerPC,POWER7@828 {
		PowerPC,POWER7@860 {
		PowerPC,POWER7@868 {
		PowerPC,POWER7@8a0 {
		PowerPC,POWER7@8b0 {
		PowerPC,POWER7@8f0 {
		PowerPC,POWER7@a0 {
		PowerPC,POWER7@a8 {
		PowerPC,POWER7@e0 {

If we use this device tree for a kexec boot we end up with a confusing
layout of logical CPUs:

node 0 cpus: 0-23 72-95
node 0 size: 32633 MB

node 1 cpus: 24-71
node 1 size: 32631 MB

The reason for this is that we allocate logical CPU ids as we walk
through the device tree.

In cmp_subnode, if both nodes have a hex unit address and the
basenames match, then compare by number.

This fixes the issue:

# dtc -s -I fs -O dts /proc/proc/device-tree | grep PowerPC,POWER7
		PowerPC,POWER7@30 {
		PowerPC,POWER7@68 {
		PowerPC,POWER7@70 {
		PowerPC,POWER7@a0 {
		PowerPC,POWER7@a8 {
		PowerPC,POWER7@e0 {
		PowerPC,POWER7@828 {
		PowerPC,POWER7@860 {
		PowerPC,POWER7@868 {
		PowerPC,POWER7@8a0 {
		PowerPC,POWER7@8b0 {
		PowerPC,POWER7@8f0 {

And the CPU layout is as expected:

node 0 cpus: 0-47
node 0 size: 32633 MB

node 1 cpus: 48-95
node 1 size: 32631 MB

Signed-off-by: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
--

Index: b/livetree.c
===================================================================
--- a/livetree.c
+++ b/livetree.c
@@ -658,12 +658,38 @@ static void sort_properties(struct node
 	free(tbl);
 }
 
+static bool is_hex(const char *str)
+{
+	while (*str) {
+		if (!isxdigit(*str++))
+			return false;
+	}
+
+	return true;
+}
+
 static int cmp_subnode(const void *ax, const void *bx)
 {
-	const struct node *a, *b;
+	struct node *a, *b;
+	const char *a_unit, *b_unit;
+
+	a = *((struct node * const *)ax);
+	b = *((struct node * const *)bx);
+
+	a_unit = get_unitname(a);
+	b_unit = get_unitname(b);
+
+	/* Sort hex unit addresses by number */
+	if (a_unit && b_unit && (a->basenamelen == b->basenamelen) &&
+	    !strncmp(a->name, b->name, a->basenamelen) &&
+	    is_hex(a_unit) && is_hex(b_unit)) {
+		unsigned long long a_num, b_num;
+
+		a_num = strtoull(a_unit, NULL, 16);
+		b_num = strtoull(b_unit, NULL, 16);
 
-	a = *((const struct node * const *)ax);
-	b = *((const struct node * const *)bx);
+		return (a_num > b_num) - (a_num < b_num);
+	}
 
 	return strcmp(a->name, b->name);
 }
