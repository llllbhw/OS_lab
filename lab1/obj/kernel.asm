
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <kern_entry>:
    80200000:	00004117          	auipc	sp,0x4
    80200004:	00010113          	mv	sp,sp
    80200008:	a009                	j	8020000a <kern_init>

000000008020000a <kern_init>:
    8020000a:	00004517          	auipc	a0,0x4
    8020000e:	00650513          	addi	a0,a0,6 # 80204010 <ticks>
    80200012:	00004617          	auipc	a2,0x4
    80200016:	01660613          	addi	a2,a2,22 # 80204028 <end>
    8020001a:	1141                	addi	sp,sp,-16
    8020001c:	8e09                	sub	a2,a2,a0
    8020001e:	4581                	li	a1,0
    80200020:	e406                	sd	ra,8(sp)
    80200022:	1d9000ef          	jal	ra,802009fa <memset>
    80200026:	13a000ef          	jal	ra,80200160 <cons_init>
    8020002a:	00001597          	auipc	a1,0x1
    8020002e:	9e658593          	addi	a1,a1,-1562 # 80200a10 <etext+0x4>
    80200032:	00001517          	auipc	a0,0x1
    80200036:	9fe50513          	addi	a0,a0,-1538 # 80200a30 <etext+0x24>
    8020003a:	030000ef          	jal	ra,8020006a <cprintf>
    8020003e:	062000ef          	jal	ra,802000a0 <print_kerninfo>
    80200042:	12e000ef          	jal	ra,80200170 <idt_init>
    80200046:	0e8000ef          	jal	ra,8020012e <clock_init>
    8020004a:	120000ef          	jal	ra,8020016a <intr_enable>
    8020004e:	a001                	j	8020004e <kern_init+0x44>

0000000080200050 <cputch>:
    80200050:	1141                	addi	sp,sp,-16
    80200052:	e022                	sd	s0,0(sp)
    80200054:	e406                	sd	ra,8(sp)
    80200056:	842e                	mv	s0,a1
    80200058:	10a000ef          	jal	ra,80200162 <cons_putc>
    8020005c:	401c                	lw	a5,0(s0)
    8020005e:	60a2                	ld	ra,8(sp)
    80200060:	2785                	addiw	a5,a5,1
    80200062:	c01c                	sw	a5,0(s0)
    80200064:	6402                	ld	s0,0(sp)
    80200066:	0141                	addi	sp,sp,16
    80200068:	8082                	ret

000000008020006a <cprintf>:
    8020006a:	711d                	addi	sp,sp,-96
    8020006c:	02810313          	addi	t1,sp,40 # 80204028 <end>
    80200070:	8e2a                	mv	t3,a0
    80200072:	f42e                	sd	a1,40(sp)
    80200074:	f832                	sd	a2,48(sp)
    80200076:	fc36                	sd	a3,56(sp)
    80200078:	00000517          	auipc	a0,0x0
    8020007c:	fd850513          	addi	a0,a0,-40 # 80200050 <cputch>
    80200080:	004c                	addi	a1,sp,4
    80200082:	869a                	mv	a3,t1
    80200084:	8672                	mv	a2,t3
    80200086:	ec06                	sd	ra,24(sp)
    80200088:	e0ba                	sd	a4,64(sp)
    8020008a:	e4be                	sd	a5,72(sp)
    8020008c:	e8c2                	sd	a6,80(sp)
    8020008e:	ecc6                	sd	a7,88(sp)
    80200090:	e41a                	sd	t1,8(sp)
    80200092:	c202                	sw	zero,4(sp)
    80200094:	57a000ef          	jal	ra,8020060e <vprintfmt>
    80200098:	60e2                	ld	ra,24(sp)
    8020009a:	4512                	lw	a0,4(sp)
    8020009c:	6125                	addi	sp,sp,96
    8020009e:	8082                	ret

00000000802000a0 <print_kerninfo>:
    802000a0:	1141                	addi	sp,sp,-16
    802000a2:	00001517          	auipc	a0,0x1
    802000a6:	99650513          	addi	a0,a0,-1642 # 80200a38 <etext+0x2c>
    802000aa:	e406                	sd	ra,8(sp)
    802000ac:	fbfff0ef          	jal	ra,8020006a <cprintf>
    802000b0:	00000597          	auipc	a1,0x0
    802000b4:	f5a58593          	addi	a1,a1,-166 # 8020000a <kern_init>
    802000b8:	00001517          	auipc	a0,0x1
    802000bc:	9a050513          	addi	a0,a0,-1632 # 80200a58 <etext+0x4c>
    802000c0:	fabff0ef          	jal	ra,8020006a <cprintf>
    802000c4:	00001597          	auipc	a1,0x1
    802000c8:	94858593          	addi	a1,a1,-1720 # 80200a0c <etext>
    802000cc:	00001517          	auipc	a0,0x1
    802000d0:	9ac50513          	addi	a0,a0,-1620 # 80200a78 <etext+0x6c>
    802000d4:	f97ff0ef          	jal	ra,8020006a <cprintf>
    802000d8:	00004597          	auipc	a1,0x4
    802000dc:	f3858593          	addi	a1,a1,-200 # 80204010 <ticks>
    802000e0:	00001517          	auipc	a0,0x1
    802000e4:	9b850513          	addi	a0,a0,-1608 # 80200a98 <etext+0x8c>
    802000e8:	f83ff0ef          	jal	ra,8020006a <cprintf>
    802000ec:	00004597          	auipc	a1,0x4
    802000f0:	f3c58593          	addi	a1,a1,-196 # 80204028 <end>
    802000f4:	00001517          	auipc	a0,0x1
    802000f8:	9c450513          	addi	a0,a0,-1596 # 80200ab8 <etext+0xac>
    802000fc:	f6fff0ef          	jal	ra,8020006a <cprintf>
    80200100:	00004597          	auipc	a1,0x4
    80200104:	32758593          	addi	a1,a1,807 # 80204427 <end+0x3ff>
    80200108:	00000797          	auipc	a5,0x0
    8020010c:	f0278793          	addi	a5,a5,-254 # 8020000a <kern_init>
    80200110:	40f587b3          	sub	a5,a1,a5
    80200114:	43f7d593          	srai	a1,a5,0x3f
    80200118:	60a2                	ld	ra,8(sp)
    8020011a:	3ff5f593          	andi	a1,a1,1023
    8020011e:	95be                	add	a1,a1,a5
    80200120:	85a9                	srai	a1,a1,0xa
    80200122:	00001517          	auipc	a0,0x1
    80200126:	9b650513          	addi	a0,a0,-1610 # 80200ad8 <etext+0xcc>
    8020012a:	0141                	addi	sp,sp,16
    8020012c:	bf3d                	j	8020006a <cprintf>

000000008020012e <clock_init>:
    8020012e:	1141                	addi	sp,sp,-16
    80200130:	e406                	sd	ra,8(sp)
    80200132:	02000793          	li	a5,32
    80200136:	1047a7f3          	csrrs	a5,sie,a5
    8020013a:	c0102573          	rdtime	a0
    8020013e:	67e1                	lui	a5,0x18
    80200140:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0x801e7960>
    80200144:	953e                	add	a0,a0,a5
    80200146:	065000ef          	jal	ra,802009aa <sbi_set_timer>
    8020014a:	60a2                	ld	ra,8(sp)
    8020014c:	00004797          	auipc	a5,0x4
    80200150:	ec07b223          	sd	zero,-316(a5) # 80204010 <ticks>
    80200154:	00001517          	auipc	a0,0x1
    80200158:	9b450513          	addi	a0,a0,-1612 # 80200b08 <etext+0xfc>
    8020015c:	0141                	addi	sp,sp,16
    8020015e:	b731                	j	8020006a <cprintf>

0000000080200160 <cons_init>:
    80200160:	8082                	ret

0000000080200162 <cons_putc>:
    80200162:	0ff57513          	zext.b	a0,a0
    80200166:	02b0006f          	j	80200990 <sbi_console_putchar>

000000008020016a <intr_enable>:
    8020016a:	100167f3          	csrrsi	a5,sstatus,2
    8020016e:	8082                	ret

0000000080200170 <idt_init>:
void idt_init(void)
{
    extern void __alltraps(void);
    /* Set sscratch register to 0, indicating to exception vector that we are
     * presently executing in the kernel */
    write_csr(sscratch, 0);
    80200170:	14005073          	csrwi	sscratch,0
    /* Set the exception vector address */
    write_csr(stvec, &__alltraps);
    80200174:	00000797          	auipc	a5,0x0
    80200178:	37878793          	addi	a5,a5,888 # 802004ec <__alltraps>
    8020017c:	10579073          	csrw	stvec,a5
}
    80200180:	8082                	ret

0000000080200182 <print_regs>:
    cprintf("  cause    0x%08x\n", tf->cause);
}

void print_regs(struct pushregs *gpr)
{
    cprintf("  zero     0x%08x\n", gpr->zero);
    80200182:	610c                	ld	a1,0(a0)
{
    80200184:	1141                	addi	sp,sp,-16
    80200186:	e022                	sd	s0,0(sp)
    80200188:	842a                	mv	s0,a0
    cprintf("  zero     0x%08x\n", gpr->zero);
    8020018a:	00001517          	auipc	a0,0x1
    8020018e:	99e50513          	addi	a0,a0,-1634 # 80200b28 <etext+0x11c>
{
    80200192:	e406                	sd	ra,8(sp)
    cprintf("  zero     0x%08x\n", gpr->zero);
    80200194:	ed7ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  ra       0x%08x\n", gpr->ra);
    80200198:	640c                	ld	a1,8(s0)
    8020019a:	00001517          	auipc	a0,0x1
    8020019e:	9a650513          	addi	a0,a0,-1626 # 80200b40 <etext+0x134>
    802001a2:	ec9ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  sp       0x%08x\n", gpr->sp);
    802001a6:	680c                	ld	a1,16(s0)
    802001a8:	00001517          	auipc	a0,0x1
    802001ac:	9b050513          	addi	a0,a0,-1616 # 80200b58 <etext+0x14c>
    802001b0:	ebbff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  gp       0x%08x\n", gpr->gp);
    802001b4:	6c0c                	ld	a1,24(s0)
    802001b6:	00001517          	auipc	a0,0x1
    802001ba:	9ba50513          	addi	a0,a0,-1606 # 80200b70 <etext+0x164>
    802001be:	eadff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  tp       0x%08x\n", gpr->tp);
    802001c2:	700c                	ld	a1,32(s0)
    802001c4:	00001517          	auipc	a0,0x1
    802001c8:	9c450513          	addi	a0,a0,-1596 # 80200b88 <etext+0x17c>
    802001cc:	e9fff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  t0       0x%08x\n", gpr->t0);
    802001d0:	740c                	ld	a1,40(s0)
    802001d2:	00001517          	auipc	a0,0x1
    802001d6:	9ce50513          	addi	a0,a0,-1586 # 80200ba0 <etext+0x194>
    802001da:	e91ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  t1       0x%08x\n", gpr->t1);
    802001de:	780c                	ld	a1,48(s0)
    802001e0:	00001517          	auipc	a0,0x1
    802001e4:	9d850513          	addi	a0,a0,-1576 # 80200bb8 <etext+0x1ac>
    802001e8:	e83ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  t2       0x%08x\n", gpr->t2);
    802001ec:	7c0c                	ld	a1,56(s0)
    802001ee:	00001517          	auipc	a0,0x1
    802001f2:	9e250513          	addi	a0,a0,-1566 # 80200bd0 <etext+0x1c4>
    802001f6:	e75ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s0       0x%08x\n", gpr->s0);
    802001fa:	602c                	ld	a1,64(s0)
    802001fc:	00001517          	auipc	a0,0x1
    80200200:	9ec50513          	addi	a0,a0,-1556 # 80200be8 <etext+0x1dc>
    80200204:	e67ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s1       0x%08x\n", gpr->s1);
    80200208:	642c                	ld	a1,72(s0)
    8020020a:	00001517          	auipc	a0,0x1
    8020020e:	9f650513          	addi	a0,a0,-1546 # 80200c00 <etext+0x1f4>
    80200212:	e59ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a0       0x%08x\n", gpr->a0);
    80200216:	682c                	ld	a1,80(s0)
    80200218:	00001517          	auipc	a0,0x1
    8020021c:	a0050513          	addi	a0,a0,-1536 # 80200c18 <etext+0x20c>
    80200220:	e4bff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a1       0x%08x\n", gpr->a1);
    80200224:	6c2c                	ld	a1,88(s0)
    80200226:	00001517          	auipc	a0,0x1
    8020022a:	a0a50513          	addi	a0,a0,-1526 # 80200c30 <etext+0x224>
    8020022e:	e3dff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a2       0x%08x\n", gpr->a2);
    80200232:	702c                	ld	a1,96(s0)
    80200234:	00001517          	auipc	a0,0x1
    80200238:	a1450513          	addi	a0,a0,-1516 # 80200c48 <etext+0x23c>
    8020023c:	e2fff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a3       0x%08x\n", gpr->a3);
    80200240:	742c                	ld	a1,104(s0)
    80200242:	00001517          	auipc	a0,0x1
    80200246:	a1e50513          	addi	a0,a0,-1506 # 80200c60 <etext+0x254>
    8020024a:	e21ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a4       0x%08x\n", gpr->a4);
    8020024e:	782c                	ld	a1,112(s0)
    80200250:	00001517          	auipc	a0,0x1
    80200254:	a2850513          	addi	a0,a0,-1496 # 80200c78 <etext+0x26c>
    80200258:	e13ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a5       0x%08x\n", gpr->a5);
    8020025c:	7c2c                	ld	a1,120(s0)
    8020025e:	00001517          	auipc	a0,0x1
    80200262:	a3250513          	addi	a0,a0,-1486 # 80200c90 <etext+0x284>
    80200266:	e05ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a6       0x%08x\n", gpr->a6);
    8020026a:	604c                	ld	a1,128(s0)
    8020026c:	00001517          	auipc	a0,0x1
    80200270:	a3c50513          	addi	a0,a0,-1476 # 80200ca8 <etext+0x29c>
    80200274:	df7ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  a7       0x%08x\n", gpr->a7);
    80200278:	644c                	ld	a1,136(s0)
    8020027a:	00001517          	auipc	a0,0x1
    8020027e:	a4650513          	addi	a0,a0,-1466 # 80200cc0 <etext+0x2b4>
    80200282:	de9ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s2       0x%08x\n", gpr->s2);
    80200286:	684c                	ld	a1,144(s0)
    80200288:	00001517          	auipc	a0,0x1
    8020028c:	a5050513          	addi	a0,a0,-1456 # 80200cd8 <etext+0x2cc>
    80200290:	ddbff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s3       0x%08x\n", gpr->s3);
    80200294:	6c4c                	ld	a1,152(s0)
    80200296:	00001517          	auipc	a0,0x1
    8020029a:	a5a50513          	addi	a0,a0,-1446 # 80200cf0 <etext+0x2e4>
    8020029e:	dcdff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s4       0x%08x\n", gpr->s4);
    802002a2:	704c                	ld	a1,160(s0)
    802002a4:	00001517          	auipc	a0,0x1
    802002a8:	a6450513          	addi	a0,a0,-1436 # 80200d08 <etext+0x2fc>
    802002ac:	dbfff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s5       0x%08x\n", gpr->s5);
    802002b0:	744c                	ld	a1,168(s0)
    802002b2:	00001517          	auipc	a0,0x1
    802002b6:	a6e50513          	addi	a0,a0,-1426 # 80200d20 <etext+0x314>
    802002ba:	db1ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s6       0x%08x\n", gpr->s6);
    802002be:	784c                	ld	a1,176(s0)
    802002c0:	00001517          	auipc	a0,0x1
    802002c4:	a7850513          	addi	a0,a0,-1416 # 80200d38 <etext+0x32c>
    802002c8:	da3ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s7       0x%08x\n", gpr->s7);
    802002cc:	7c4c                	ld	a1,184(s0)
    802002ce:	00001517          	auipc	a0,0x1
    802002d2:	a8250513          	addi	a0,a0,-1406 # 80200d50 <etext+0x344>
    802002d6:	d95ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s8       0x%08x\n", gpr->s8);
    802002da:	606c                	ld	a1,192(s0)
    802002dc:	00001517          	auipc	a0,0x1
    802002e0:	a8c50513          	addi	a0,a0,-1396 # 80200d68 <etext+0x35c>
    802002e4:	d87ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s9       0x%08x\n", gpr->s9);
    802002e8:	646c                	ld	a1,200(s0)
    802002ea:	00001517          	auipc	a0,0x1
    802002ee:	a9650513          	addi	a0,a0,-1386 # 80200d80 <etext+0x374>
    802002f2:	d79ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s10      0x%08x\n", gpr->s10);
    802002f6:	686c                	ld	a1,208(s0)
    802002f8:	00001517          	auipc	a0,0x1
    802002fc:	aa050513          	addi	a0,a0,-1376 # 80200d98 <etext+0x38c>
    80200300:	d6bff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  s11      0x%08x\n", gpr->s11);
    80200304:	6c6c                	ld	a1,216(s0)
    80200306:	00001517          	auipc	a0,0x1
    8020030a:	aaa50513          	addi	a0,a0,-1366 # 80200db0 <etext+0x3a4>
    8020030e:	d5dff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  t3       0x%08x\n", gpr->t3);
    80200312:	706c                	ld	a1,224(s0)
    80200314:	00001517          	auipc	a0,0x1
    80200318:	ab450513          	addi	a0,a0,-1356 # 80200dc8 <etext+0x3bc>
    8020031c:	d4fff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  t4       0x%08x\n", gpr->t4);
    80200320:	746c                	ld	a1,232(s0)
    80200322:	00001517          	auipc	a0,0x1
    80200326:	abe50513          	addi	a0,a0,-1346 # 80200de0 <etext+0x3d4>
    8020032a:	d41ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  t5       0x%08x\n", gpr->t5);
    8020032e:	786c                	ld	a1,240(s0)
    80200330:	00001517          	auipc	a0,0x1
    80200334:	ac850513          	addi	a0,a0,-1336 # 80200df8 <etext+0x3ec>
    80200338:	d33ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  t6       0x%08x\n", gpr->t6);
    8020033c:	7c6c                	ld	a1,248(s0)
}
    8020033e:	6402                	ld	s0,0(sp)
    80200340:	60a2                	ld	ra,8(sp)
    cprintf("  t6       0x%08x\n", gpr->t6);
    80200342:	00001517          	auipc	a0,0x1
    80200346:	ace50513          	addi	a0,a0,-1330 # 80200e10 <etext+0x404>
}
    8020034a:	0141                	addi	sp,sp,16
    cprintf("  t6       0x%08x\n", gpr->t6);
    8020034c:	bb39                	j	8020006a <cprintf>

000000008020034e <print_trapframe>:
{
    8020034e:	1141                	addi	sp,sp,-16
    80200350:	e022                	sd	s0,0(sp)
    cprintf("trapframe at %p\n", tf);
    80200352:	85aa                	mv	a1,a0
{
    80200354:	842a                	mv	s0,a0
    cprintf("trapframe at %p\n", tf);
    80200356:	00001517          	auipc	a0,0x1
    8020035a:	ad250513          	addi	a0,a0,-1326 # 80200e28 <etext+0x41c>
{
    8020035e:	e406                	sd	ra,8(sp)
    cprintf("trapframe at %p\n", tf);
    80200360:	d0bff0ef          	jal	ra,8020006a <cprintf>
    print_regs(&tf->gpr);
    80200364:	8522                	mv	a0,s0
    80200366:	e1dff0ef          	jal	ra,80200182 <print_regs>
    cprintf("  status   0x%08x\n", tf->status);
    8020036a:	10043583          	ld	a1,256(s0)
    8020036e:	00001517          	auipc	a0,0x1
    80200372:	ad250513          	addi	a0,a0,-1326 # 80200e40 <etext+0x434>
    80200376:	cf5ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  epc      0x%08x\n", tf->epc);
    8020037a:	10843583          	ld	a1,264(s0)
    8020037e:	00001517          	auipc	a0,0x1
    80200382:	ada50513          	addi	a0,a0,-1318 # 80200e58 <etext+0x44c>
    80200386:	ce5ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  badvaddr 0x%08x\n", tf->badvaddr);
    8020038a:	11043583          	ld	a1,272(s0)
    8020038e:	00001517          	auipc	a0,0x1
    80200392:	ae250513          	addi	a0,a0,-1310 # 80200e70 <etext+0x464>
    80200396:	cd5ff0ef          	jal	ra,8020006a <cprintf>
    cprintf("  cause    0x%08x\n", tf->cause);
    8020039a:	11843583          	ld	a1,280(s0)
}
    8020039e:	6402                	ld	s0,0(sp)
    802003a0:	60a2                	ld	ra,8(sp)
    cprintf("  cause    0x%08x\n", tf->cause);
    802003a2:	00001517          	auipc	a0,0x1
    802003a6:	ae650513          	addi	a0,a0,-1306 # 80200e88 <etext+0x47c>
}
    802003aa:	0141                	addi	sp,sp,16
    cprintf("  cause    0x%08x\n", tf->cause);
    802003ac:	b97d                	j	8020006a <cprintf>

00000000802003ae <interrupt_handler>:

void interrupt_handler(struct trapframe *tf)
{
    intptr_t cause = (tf->cause << 1) >> 1;
    802003ae:	11853783          	ld	a5,280(a0)
    802003b2:	472d                	li	a4,11
    802003b4:	0786                	slli	a5,a5,0x1
    802003b6:	8385                	srli	a5,a5,0x1
    802003b8:	06f76f63          	bltu	a4,a5,80200436 <interrupt_handler+0x88>
    802003bc:	00001717          	auipc	a4,0x1
    802003c0:	b9470713          	addi	a4,a4,-1132 # 80200f50 <etext+0x544>
    802003c4:	078a                	slli	a5,a5,0x2
    802003c6:	97ba                	add	a5,a5,a4
    802003c8:	439c                	lw	a5,0(a5)
    802003ca:	97ba                	add	a5,a5,a4
    802003cc:	8782                	jr	a5
        break;
    case IRQ_H_SOFT:
        cprintf("Hypervisor software interrupt\n");
        break;
    case IRQ_M_SOFT:
        cprintf("Machine software interrupt\n");
    802003ce:	00001517          	auipc	a0,0x1
    802003d2:	b3250513          	addi	a0,a0,-1230 # 80200f00 <etext+0x4f4>
    802003d6:	b951                	j	8020006a <cprintf>
        cprintf("Hypervisor software interrupt\n");
    802003d8:	00001517          	auipc	a0,0x1
    802003dc:	b0850513          	addi	a0,a0,-1272 # 80200ee0 <etext+0x4d4>
    802003e0:	b169                	j	8020006a <cprintf>
        cprintf("User software interrupt\n");
    802003e2:	00001517          	auipc	a0,0x1
    802003e6:	abe50513          	addi	a0,a0,-1346 # 80200ea0 <etext+0x494>
    802003ea:	b141                	j	8020006a <cprintf>
        cprintf("Supervisor software interrupt\n");
    802003ec:	00001517          	auipc	a0,0x1
    802003f0:	ad450513          	addi	a0,a0,-1324 # 80200ec0 <etext+0x4b4>
    802003f4:	b99d                	j	8020006a <cprintf>
        /*(1)设置下次时钟中断- clock_set_next_event()
         *(2)计数器（ticks）加一
         *(3)当计数器加到100的时候，我们会输出一个`100ticks`表示我们触发了100次时钟中断，同时打印次数（num）加一
         * (4)判断打印次数，当打印次数为10时，调用<sbi.h>中的关机函数关机
         */
        if (ticks++ % TICK_NUM == 0)
    802003f6:	00004697          	auipc	a3,0x4
    802003fa:	c1a68693          	addi	a3,a3,-998 # 80204010 <ticks>
    802003fe:	629c                	ld	a5,0(a3)
    80200400:	06400713          	li	a4,100
{
    80200404:	1141                	addi	sp,sp,-16
        if (ticks++ % TICK_NUM == 0)
    80200406:	02e7f733          	remu	a4,a5,a4
{
    8020040a:	e022                	sd	s0,0(sp)
    8020040c:	e406                	sd	ra,8(sp)
        if (ticks++ % TICK_NUM == 0)
    8020040e:	0785                	addi	a5,a5,1
    80200410:	e29c                	sd	a5,0(a3)
    80200412:	00004417          	auipc	s0,0x4
    80200416:	c0640413          	addi	s0,s0,-1018 # 80204018 <num>
    8020041a:	cf19                	beqz	a4,80200438 <interrupt_handler+0x8a>
        {
            print_ticks();
            num++;
        }
        if (num == 10)
    8020041c:	6018                	ld	a4,0(s0)
    8020041e:	47a9                	li	a5,10
    80200420:	02f70863          	beq	a4,a5,80200450 <interrupt_handler+0xa2>
        break;
    default:
        print_trapframe(tf);
        break;
    }
}
    80200424:	60a2                	ld	ra,8(sp)
    80200426:	6402                	ld	s0,0(sp)
    80200428:	0141                	addi	sp,sp,16
    8020042a:	8082                	ret
        cprintf("Supervisor external interrupt\n");
    8020042c:	00001517          	auipc	a0,0x1
    80200430:	b0450513          	addi	a0,a0,-1276 # 80200f30 <etext+0x524>
    80200434:	b91d                	j	8020006a <cprintf>
        print_trapframe(tf);
    80200436:	bf21                	j	8020034e <print_trapframe>
    cprintf("%d ticks\n", TICK_NUM);
    80200438:	06400593          	li	a1,100
    8020043c:	00001517          	auipc	a0,0x1
    80200440:	ae450513          	addi	a0,a0,-1308 # 80200f20 <etext+0x514>
    80200444:	c27ff0ef          	jal	ra,8020006a <cprintf>
            num++;
    80200448:	601c                	ld	a5,0(s0)
    8020044a:	0785                	addi	a5,a5,1
    8020044c:	e01c                	sd	a5,0(s0)
    8020044e:	b7f9                	j	8020041c <interrupt_handler+0x6e>
}
    80200450:	6402                	ld	s0,0(sp)
    80200452:	60a2                	ld	ra,8(sp)
    80200454:	0141                	addi	sp,sp,16
            sbi_shutdown();
    80200456:	a3bd                	j	802009c4 <sbi_shutdown>

0000000080200458 <exception_handler>:

void exception_handler(struct trapframe *tf)
{
    switch (tf->cause)
    80200458:	11853783          	ld	a5,280(a0)
{
    8020045c:	1141                	addi	sp,sp,-16
    8020045e:	e022                	sd	s0,0(sp)
    80200460:	e406                	sd	ra,8(sp)
    switch (tf->cause)
    80200462:	470d                	li	a4,3
{
    80200464:	842a                	mv	s0,a0
    switch (tf->cause)
    80200466:	04e78663          	beq	a5,a4,802004b2 <exception_handler+0x5a>
    8020046a:	02f76c63          	bltu	a4,a5,802004a2 <exception_handler+0x4a>
    8020046e:	4709                	li	a4,2
    80200470:	02e79563          	bne	a5,a4,8020049a <exception_handler+0x42>
        /* LAB1 CHALLENGE3   2212602 :  */
        /*(1)输出指令异常类型（ Illegal instruction）
         *(2)输出异常指令地址
         *(3)更新 tf->epc寄存器
         */
        cprintf("Exception type:Illegal instruction\n");
    80200474:	00001517          	auipc	a0,0x1
    80200478:	b0c50513          	addi	a0,a0,-1268 # 80200f80 <etext+0x574>
    8020047c:	befff0ef          	jal	ra,8020006a <cprintf>
        cprintf("Illegal instruction caught at 0x%08x\n", tf->badvaddr);
    80200480:	11043583          	ld	a1,272(s0)
    80200484:	00001517          	auipc	a0,0x1
    80200488:	b2450513          	addi	a0,a0,-1244 # 80200fa8 <etext+0x59c>
    8020048c:	bdfff0ef          	jal	ra,8020006a <cprintf>
        tf->epc += 4; // 跳过异常指令
    80200490:	10843783          	ld	a5,264(s0)
    80200494:	0791                	addi	a5,a5,4
    80200496:	10f43423          	sd	a5,264(s0)
        break;
    default:
        print_trapframe(tf);
        break;
    }
}
    8020049a:	60a2                	ld	ra,8(sp)
    8020049c:	6402                	ld	s0,0(sp)
    8020049e:	0141                	addi	sp,sp,16
    802004a0:	8082                	ret
    switch (tf->cause)
    802004a2:	17f1                	addi	a5,a5,-4
    802004a4:	471d                	li	a4,7
    802004a6:	fef77ae3          	bgeu	a4,a5,8020049a <exception_handler+0x42>
}
    802004aa:	6402                	ld	s0,0(sp)
    802004ac:	60a2                	ld	ra,8(sp)
    802004ae:	0141                	addi	sp,sp,16
        print_trapframe(tf);
    802004b0:	bd79                	j	8020034e <print_trapframe>
        cprintf("Exception type:breakpoint\n");
    802004b2:	00001517          	auipc	a0,0x1
    802004b6:	b1e50513          	addi	a0,a0,-1250 # 80200fd0 <etext+0x5c4>
    802004ba:	bb1ff0ef          	jal	ra,8020006a <cprintf>
        cprintf("breakpoint caught at 0x%08x\n", tf->badvaddr);
    802004be:	11043583          	ld	a1,272(s0)
    802004c2:	00001517          	auipc	a0,0x1
    802004c6:	b2e50513          	addi	a0,a0,-1234 # 80200ff0 <etext+0x5e4>
    802004ca:	ba1ff0ef          	jal	ra,8020006a <cprintf>
        tf->epc += 4; // 跳过异常指令
    802004ce:	10843783          	ld	a5,264(s0)
}
    802004d2:	60a2                	ld	ra,8(sp)
        tf->epc += 4; // 跳过异常指令
    802004d4:	0791                	addi	a5,a5,4
    802004d6:	10f43423          	sd	a5,264(s0)
}
    802004da:	6402                	ld	s0,0(sp)
    802004dc:	0141                	addi	sp,sp,16
    802004de:	8082                	ret

00000000802004e0 <trap>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static inline void trap_dispatch(struct trapframe *tf)
{
    if ((intptr_t)tf->cause < 0)
    802004e0:	11853783          	ld	a5,280(a0)
    802004e4:	0007c363          	bltz	a5,802004ea <trap+0xa>
        interrupt_handler(tf);
    }
    else
    {
        // exceptions
        exception_handler(tf);
    802004e8:	bf85                	j	80200458 <exception_handler>
        interrupt_handler(tf);
    802004ea:	b5d1                	j	802003ae <interrupt_handler>

00000000802004ec <__alltraps>:
    802004ec:	14011073          	csrw	sscratch,sp
    802004f0:	712d                	addi	sp,sp,-288
    802004f2:	e002                	sd	zero,0(sp)
    802004f4:	e406                	sd	ra,8(sp)
    802004f6:	ec0e                	sd	gp,24(sp)
    802004f8:	f012                	sd	tp,32(sp)
    802004fa:	f416                	sd	t0,40(sp)
    802004fc:	f81a                	sd	t1,48(sp)
    802004fe:	fc1e                	sd	t2,56(sp)
    80200500:	e0a2                	sd	s0,64(sp)
    80200502:	e4a6                	sd	s1,72(sp)
    80200504:	e8aa                	sd	a0,80(sp)
    80200506:	ecae                	sd	a1,88(sp)
    80200508:	f0b2                	sd	a2,96(sp)
    8020050a:	f4b6                	sd	a3,104(sp)
    8020050c:	f8ba                	sd	a4,112(sp)
    8020050e:	fcbe                	sd	a5,120(sp)
    80200510:	e142                	sd	a6,128(sp)
    80200512:	e546                	sd	a7,136(sp)
    80200514:	e94a                	sd	s2,144(sp)
    80200516:	ed4e                	sd	s3,152(sp)
    80200518:	f152                	sd	s4,160(sp)
    8020051a:	f556                	sd	s5,168(sp)
    8020051c:	f95a                	sd	s6,176(sp)
    8020051e:	fd5e                	sd	s7,184(sp)
    80200520:	e1e2                	sd	s8,192(sp)
    80200522:	e5e6                	sd	s9,200(sp)
    80200524:	e9ea                	sd	s10,208(sp)
    80200526:	edee                	sd	s11,216(sp)
    80200528:	f1f2                	sd	t3,224(sp)
    8020052a:	f5f6                	sd	t4,232(sp)
    8020052c:	f9fa                	sd	t5,240(sp)
    8020052e:	fdfe                	sd	t6,248(sp)
    80200530:	14001473          	csrrw	s0,sscratch,zero
    80200534:	100024f3          	csrr	s1,sstatus
    80200538:	14102973          	csrr	s2,sepc
    8020053c:	143029f3          	csrr	s3,stval
    80200540:	14202a73          	csrr	s4,scause
    80200544:	e822                	sd	s0,16(sp)
    80200546:	e226                	sd	s1,256(sp)
    80200548:	e64a                	sd	s2,264(sp)
    8020054a:	ea4e                	sd	s3,272(sp)
    8020054c:	ee52                	sd	s4,280(sp)
    8020054e:	850a                	mv	a0,sp
    80200550:	f91ff0ef          	jal	ra,802004e0 <trap>

0000000080200554 <__trapret>:
    80200554:	6492                	ld	s1,256(sp)
    80200556:	6932                	ld	s2,264(sp)
    80200558:	10049073          	csrw	sstatus,s1
    8020055c:	14191073          	csrw	sepc,s2
    80200560:	60a2                	ld	ra,8(sp)
    80200562:	61e2                	ld	gp,24(sp)
    80200564:	7202                	ld	tp,32(sp)
    80200566:	72a2                	ld	t0,40(sp)
    80200568:	7342                	ld	t1,48(sp)
    8020056a:	73e2                	ld	t2,56(sp)
    8020056c:	6406                	ld	s0,64(sp)
    8020056e:	64a6                	ld	s1,72(sp)
    80200570:	6546                	ld	a0,80(sp)
    80200572:	65e6                	ld	a1,88(sp)
    80200574:	7606                	ld	a2,96(sp)
    80200576:	76a6                	ld	a3,104(sp)
    80200578:	7746                	ld	a4,112(sp)
    8020057a:	77e6                	ld	a5,120(sp)
    8020057c:	680a                	ld	a6,128(sp)
    8020057e:	68aa                	ld	a7,136(sp)
    80200580:	694a                	ld	s2,144(sp)
    80200582:	69ea                	ld	s3,152(sp)
    80200584:	7a0a                	ld	s4,160(sp)
    80200586:	7aaa                	ld	s5,168(sp)
    80200588:	7b4a                	ld	s6,176(sp)
    8020058a:	7bea                	ld	s7,184(sp)
    8020058c:	6c0e                	ld	s8,192(sp)
    8020058e:	6cae                	ld	s9,200(sp)
    80200590:	6d4e                	ld	s10,208(sp)
    80200592:	6dee                	ld	s11,216(sp)
    80200594:	7e0e                	ld	t3,224(sp)
    80200596:	7eae                	ld	t4,232(sp)
    80200598:	7f4e                	ld	t5,240(sp)
    8020059a:	7fee                	ld	t6,248(sp)
    8020059c:	6142                	ld	sp,16(sp)
    8020059e:	10200073          	sret

00000000802005a2 <printnum>:
    802005a2:	02069813          	slli	a6,a3,0x20
    802005a6:	7179                	addi	sp,sp,-48
    802005a8:	02085813          	srli	a6,a6,0x20
    802005ac:	e052                	sd	s4,0(sp)
    802005ae:	03067a33          	remu	s4,a2,a6
    802005b2:	f022                	sd	s0,32(sp)
    802005b4:	ec26                	sd	s1,24(sp)
    802005b6:	e84a                	sd	s2,16(sp)
    802005b8:	f406                	sd	ra,40(sp)
    802005ba:	e44e                	sd	s3,8(sp)
    802005bc:	84aa                	mv	s1,a0
    802005be:	892e                	mv	s2,a1
    802005c0:	fff7041b          	addiw	s0,a4,-1
    802005c4:	2a01                	sext.w	s4,s4
    802005c6:	03067e63          	bgeu	a2,a6,80200602 <printnum+0x60>
    802005ca:	89be                	mv	s3,a5
    802005cc:	00805763          	blez	s0,802005da <printnum+0x38>
    802005d0:	347d                	addiw	s0,s0,-1
    802005d2:	85ca                	mv	a1,s2
    802005d4:	854e                	mv	a0,s3
    802005d6:	9482                	jalr	s1
    802005d8:	fc65                	bnez	s0,802005d0 <printnum+0x2e>
    802005da:	1a02                	slli	s4,s4,0x20
    802005dc:	00001797          	auipc	a5,0x1
    802005e0:	a3478793          	addi	a5,a5,-1484 # 80201010 <etext+0x604>
    802005e4:	020a5a13          	srli	s4,s4,0x20
    802005e8:	9a3e                	add	s4,s4,a5
    802005ea:	7402                	ld	s0,32(sp)
    802005ec:	000a4503          	lbu	a0,0(s4)
    802005f0:	70a2                	ld	ra,40(sp)
    802005f2:	69a2                	ld	s3,8(sp)
    802005f4:	6a02                	ld	s4,0(sp)
    802005f6:	85ca                	mv	a1,s2
    802005f8:	87a6                	mv	a5,s1
    802005fa:	6942                	ld	s2,16(sp)
    802005fc:	64e2                	ld	s1,24(sp)
    802005fe:	6145                	addi	sp,sp,48
    80200600:	8782                	jr	a5
    80200602:	03065633          	divu	a2,a2,a6
    80200606:	8722                	mv	a4,s0
    80200608:	f9bff0ef          	jal	ra,802005a2 <printnum>
    8020060c:	b7f9                	j	802005da <printnum+0x38>

000000008020060e <vprintfmt>:
    8020060e:	7119                	addi	sp,sp,-128
    80200610:	f4a6                	sd	s1,104(sp)
    80200612:	f0ca                	sd	s2,96(sp)
    80200614:	ecce                	sd	s3,88(sp)
    80200616:	e8d2                	sd	s4,80(sp)
    80200618:	e4d6                	sd	s5,72(sp)
    8020061a:	e0da                	sd	s6,64(sp)
    8020061c:	fc5e                	sd	s7,56(sp)
    8020061e:	f06a                	sd	s10,32(sp)
    80200620:	fc86                	sd	ra,120(sp)
    80200622:	f8a2                	sd	s0,112(sp)
    80200624:	f862                	sd	s8,48(sp)
    80200626:	f466                	sd	s9,40(sp)
    80200628:	ec6e                	sd	s11,24(sp)
    8020062a:	892a                	mv	s2,a0
    8020062c:	84ae                	mv	s1,a1
    8020062e:	8d32                	mv	s10,a2
    80200630:	8a36                	mv	s4,a3
    80200632:	02500993          	li	s3,37
    80200636:	5b7d                	li	s6,-1
    80200638:	00001a97          	auipc	s5,0x1
    8020063c:	a0ca8a93          	addi	s5,s5,-1524 # 80201044 <etext+0x638>
    80200640:	00001b97          	auipc	s7,0x1
    80200644:	be0b8b93          	addi	s7,s7,-1056 # 80201220 <error_string>
    80200648:	000d4503          	lbu	a0,0(s10)
    8020064c:	001d0413          	addi	s0,s10,1
    80200650:	01350a63          	beq	a0,s3,80200664 <vprintfmt+0x56>
    80200654:	c121                	beqz	a0,80200694 <vprintfmt+0x86>
    80200656:	85a6                	mv	a1,s1
    80200658:	0405                	addi	s0,s0,1
    8020065a:	9902                	jalr	s2
    8020065c:	fff44503          	lbu	a0,-1(s0)
    80200660:	ff351ae3          	bne	a0,s3,80200654 <vprintfmt+0x46>
    80200664:	00044603          	lbu	a2,0(s0)
    80200668:	02000793          	li	a5,32
    8020066c:	4c81                	li	s9,0
    8020066e:	4881                	li	a7,0
    80200670:	5c7d                	li	s8,-1
    80200672:	5dfd                	li	s11,-1
    80200674:	05500513          	li	a0,85
    80200678:	4825                	li	a6,9
    8020067a:	fdd6059b          	addiw	a1,a2,-35
    8020067e:	0ff5f593          	zext.b	a1,a1
    80200682:	00140d13          	addi	s10,s0,1
    80200686:	04b56263          	bltu	a0,a1,802006ca <vprintfmt+0xbc>
    8020068a:	058a                	slli	a1,a1,0x2
    8020068c:	95d6                	add	a1,a1,s5
    8020068e:	4194                	lw	a3,0(a1)
    80200690:	96d6                	add	a3,a3,s5
    80200692:	8682                	jr	a3
    80200694:	70e6                	ld	ra,120(sp)
    80200696:	7446                	ld	s0,112(sp)
    80200698:	74a6                	ld	s1,104(sp)
    8020069a:	7906                	ld	s2,96(sp)
    8020069c:	69e6                	ld	s3,88(sp)
    8020069e:	6a46                	ld	s4,80(sp)
    802006a0:	6aa6                	ld	s5,72(sp)
    802006a2:	6b06                	ld	s6,64(sp)
    802006a4:	7be2                	ld	s7,56(sp)
    802006a6:	7c42                	ld	s8,48(sp)
    802006a8:	7ca2                	ld	s9,40(sp)
    802006aa:	7d02                	ld	s10,32(sp)
    802006ac:	6de2                	ld	s11,24(sp)
    802006ae:	6109                	addi	sp,sp,128
    802006b0:	8082                	ret
    802006b2:	87b2                	mv	a5,a2
    802006b4:	00144603          	lbu	a2,1(s0)
    802006b8:	846a                	mv	s0,s10
    802006ba:	00140d13          	addi	s10,s0,1
    802006be:	fdd6059b          	addiw	a1,a2,-35
    802006c2:	0ff5f593          	zext.b	a1,a1
    802006c6:	fcb572e3          	bgeu	a0,a1,8020068a <vprintfmt+0x7c>
    802006ca:	85a6                	mv	a1,s1
    802006cc:	02500513          	li	a0,37
    802006d0:	9902                	jalr	s2
    802006d2:	fff44783          	lbu	a5,-1(s0)
    802006d6:	8d22                	mv	s10,s0
    802006d8:	f73788e3          	beq	a5,s3,80200648 <vprintfmt+0x3a>
    802006dc:	ffed4783          	lbu	a5,-2(s10)
    802006e0:	1d7d                	addi	s10,s10,-1
    802006e2:	ff379de3          	bne	a5,s3,802006dc <vprintfmt+0xce>
    802006e6:	b78d                	j	80200648 <vprintfmt+0x3a>
    802006e8:	fd060c1b          	addiw	s8,a2,-48
    802006ec:	00144603          	lbu	a2,1(s0)
    802006f0:	846a                	mv	s0,s10
    802006f2:	fd06069b          	addiw	a3,a2,-48
    802006f6:	0006059b          	sext.w	a1,a2
    802006fa:	02d86463          	bltu	a6,a3,80200722 <vprintfmt+0x114>
    802006fe:	00144603          	lbu	a2,1(s0)
    80200702:	002c169b          	slliw	a3,s8,0x2
    80200706:	0186873b          	addw	a4,a3,s8
    8020070a:	0017171b          	slliw	a4,a4,0x1
    8020070e:	9f2d                	addw	a4,a4,a1
    80200710:	fd06069b          	addiw	a3,a2,-48
    80200714:	0405                	addi	s0,s0,1
    80200716:	fd070c1b          	addiw	s8,a4,-48
    8020071a:	0006059b          	sext.w	a1,a2
    8020071e:	fed870e3          	bgeu	a6,a3,802006fe <vprintfmt+0xf0>
    80200722:	f40ddce3          	bgez	s11,8020067a <vprintfmt+0x6c>
    80200726:	8de2                	mv	s11,s8
    80200728:	5c7d                	li	s8,-1
    8020072a:	bf81                	j	8020067a <vprintfmt+0x6c>
    8020072c:	fffdc693          	not	a3,s11
    80200730:	96fd                	srai	a3,a3,0x3f
    80200732:	00ddfdb3          	and	s11,s11,a3
    80200736:	00144603          	lbu	a2,1(s0)
    8020073a:	2d81                	sext.w	s11,s11
    8020073c:	846a                	mv	s0,s10
    8020073e:	bf35                	j	8020067a <vprintfmt+0x6c>
    80200740:	000a2c03          	lw	s8,0(s4)
    80200744:	00144603          	lbu	a2,1(s0)
    80200748:	0a21                	addi	s4,s4,8
    8020074a:	846a                	mv	s0,s10
    8020074c:	bfd9                	j	80200722 <vprintfmt+0x114>
    8020074e:	4705                	li	a4,1
    80200750:	008a0593          	addi	a1,s4,8
    80200754:	01174463          	blt	a4,a7,8020075c <vprintfmt+0x14e>
    80200758:	1a088e63          	beqz	a7,80200914 <vprintfmt+0x306>
    8020075c:	000a3603          	ld	a2,0(s4)
    80200760:	46c1                	li	a3,16
    80200762:	8a2e                	mv	s4,a1
    80200764:	2781                	sext.w	a5,a5
    80200766:	876e                	mv	a4,s11
    80200768:	85a6                	mv	a1,s1
    8020076a:	854a                	mv	a0,s2
    8020076c:	e37ff0ef          	jal	ra,802005a2 <printnum>
    80200770:	bde1                	j	80200648 <vprintfmt+0x3a>
    80200772:	000a2503          	lw	a0,0(s4)
    80200776:	85a6                	mv	a1,s1
    80200778:	0a21                	addi	s4,s4,8
    8020077a:	9902                	jalr	s2
    8020077c:	b5f1                	j	80200648 <vprintfmt+0x3a>
    8020077e:	4705                	li	a4,1
    80200780:	008a0593          	addi	a1,s4,8
    80200784:	01174463          	blt	a4,a7,8020078c <vprintfmt+0x17e>
    80200788:	18088163          	beqz	a7,8020090a <vprintfmt+0x2fc>
    8020078c:	000a3603          	ld	a2,0(s4)
    80200790:	46a9                	li	a3,10
    80200792:	8a2e                	mv	s4,a1
    80200794:	bfc1                	j	80200764 <vprintfmt+0x156>
    80200796:	00144603          	lbu	a2,1(s0)
    8020079a:	4c85                	li	s9,1
    8020079c:	846a                	mv	s0,s10
    8020079e:	bdf1                	j	8020067a <vprintfmt+0x6c>
    802007a0:	85a6                	mv	a1,s1
    802007a2:	02500513          	li	a0,37
    802007a6:	9902                	jalr	s2
    802007a8:	b545                	j	80200648 <vprintfmt+0x3a>
    802007aa:	00144603          	lbu	a2,1(s0)
    802007ae:	2885                	addiw	a7,a7,1
    802007b0:	846a                	mv	s0,s10
    802007b2:	b5e1                	j	8020067a <vprintfmt+0x6c>
    802007b4:	4705                	li	a4,1
    802007b6:	008a0593          	addi	a1,s4,8
    802007ba:	01174463          	blt	a4,a7,802007c2 <vprintfmt+0x1b4>
    802007be:	14088163          	beqz	a7,80200900 <vprintfmt+0x2f2>
    802007c2:	000a3603          	ld	a2,0(s4)
    802007c6:	46a1                	li	a3,8
    802007c8:	8a2e                	mv	s4,a1
    802007ca:	bf69                	j	80200764 <vprintfmt+0x156>
    802007cc:	03000513          	li	a0,48
    802007d0:	85a6                	mv	a1,s1
    802007d2:	e03e                	sd	a5,0(sp)
    802007d4:	9902                	jalr	s2
    802007d6:	85a6                	mv	a1,s1
    802007d8:	07800513          	li	a0,120
    802007dc:	9902                	jalr	s2
    802007de:	0a21                	addi	s4,s4,8
    802007e0:	6782                	ld	a5,0(sp)
    802007e2:	46c1                	li	a3,16
    802007e4:	ff8a3603          	ld	a2,-8(s4)
    802007e8:	bfb5                	j	80200764 <vprintfmt+0x156>
    802007ea:	000a3403          	ld	s0,0(s4)
    802007ee:	008a0713          	addi	a4,s4,8
    802007f2:	e03a                	sd	a4,0(sp)
    802007f4:	14040263          	beqz	s0,80200938 <vprintfmt+0x32a>
    802007f8:	0fb05763          	blez	s11,802008e6 <vprintfmt+0x2d8>
    802007fc:	02d00693          	li	a3,45
    80200800:	0cd79163          	bne	a5,a3,802008c2 <vprintfmt+0x2b4>
    80200804:	00044783          	lbu	a5,0(s0)
    80200808:	0007851b          	sext.w	a0,a5
    8020080c:	cf85                	beqz	a5,80200844 <vprintfmt+0x236>
    8020080e:	00140a13          	addi	s4,s0,1
    80200812:	05e00413          	li	s0,94
    80200816:	000c4563          	bltz	s8,80200820 <vprintfmt+0x212>
    8020081a:	3c7d                	addiw	s8,s8,-1
    8020081c:	036c0263          	beq	s8,s6,80200840 <vprintfmt+0x232>
    80200820:	85a6                	mv	a1,s1
    80200822:	0e0c8e63          	beqz	s9,8020091e <vprintfmt+0x310>
    80200826:	3781                	addiw	a5,a5,-32
    80200828:	0ef47b63          	bgeu	s0,a5,8020091e <vprintfmt+0x310>
    8020082c:	03f00513          	li	a0,63
    80200830:	9902                	jalr	s2
    80200832:	000a4783          	lbu	a5,0(s4)
    80200836:	3dfd                	addiw	s11,s11,-1
    80200838:	0a05                	addi	s4,s4,1
    8020083a:	0007851b          	sext.w	a0,a5
    8020083e:	ffe1                	bnez	a5,80200816 <vprintfmt+0x208>
    80200840:	01b05963          	blez	s11,80200852 <vprintfmt+0x244>
    80200844:	3dfd                	addiw	s11,s11,-1
    80200846:	85a6                	mv	a1,s1
    80200848:	02000513          	li	a0,32
    8020084c:	9902                	jalr	s2
    8020084e:	fe0d9be3          	bnez	s11,80200844 <vprintfmt+0x236>
    80200852:	6a02                	ld	s4,0(sp)
    80200854:	bbd5                	j	80200648 <vprintfmt+0x3a>
    80200856:	4705                	li	a4,1
    80200858:	008a0c93          	addi	s9,s4,8
    8020085c:	01174463          	blt	a4,a7,80200864 <vprintfmt+0x256>
    80200860:	08088d63          	beqz	a7,802008fa <vprintfmt+0x2ec>
    80200864:	000a3403          	ld	s0,0(s4)
    80200868:	0a044d63          	bltz	s0,80200922 <vprintfmt+0x314>
    8020086c:	8622                	mv	a2,s0
    8020086e:	8a66                	mv	s4,s9
    80200870:	46a9                	li	a3,10
    80200872:	bdcd                	j	80200764 <vprintfmt+0x156>
    80200874:	000a2783          	lw	a5,0(s4)
    80200878:	4719                	li	a4,6
    8020087a:	0a21                	addi	s4,s4,8
    8020087c:	41f7d69b          	sraiw	a3,a5,0x1f
    80200880:	8fb5                	xor	a5,a5,a3
    80200882:	40d786bb          	subw	a3,a5,a3
    80200886:	02d74163          	blt	a4,a3,802008a8 <vprintfmt+0x29a>
    8020088a:	00369793          	slli	a5,a3,0x3
    8020088e:	97de                	add	a5,a5,s7
    80200890:	639c                	ld	a5,0(a5)
    80200892:	cb99                	beqz	a5,802008a8 <vprintfmt+0x29a>
    80200894:	86be                	mv	a3,a5
    80200896:	00000617          	auipc	a2,0x0
    8020089a:	7aa60613          	addi	a2,a2,1962 # 80201040 <etext+0x634>
    8020089e:	85a6                	mv	a1,s1
    802008a0:	854a                	mv	a0,s2
    802008a2:	0ce000ef          	jal	ra,80200970 <printfmt>
    802008a6:	b34d                	j	80200648 <vprintfmt+0x3a>
    802008a8:	00000617          	auipc	a2,0x0
    802008ac:	78860613          	addi	a2,a2,1928 # 80201030 <etext+0x624>
    802008b0:	85a6                	mv	a1,s1
    802008b2:	854a                	mv	a0,s2
    802008b4:	0bc000ef          	jal	ra,80200970 <printfmt>
    802008b8:	bb41                	j	80200648 <vprintfmt+0x3a>
    802008ba:	00000417          	auipc	s0,0x0
    802008be:	76e40413          	addi	s0,s0,1902 # 80201028 <etext+0x61c>
    802008c2:	85e2                	mv	a1,s8
    802008c4:	8522                	mv	a0,s0
    802008c6:	e43e                	sd	a5,8(sp)
    802008c8:	116000ef          	jal	ra,802009de <strnlen>
    802008cc:	40ad8dbb          	subw	s11,s11,a0
    802008d0:	01b05b63          	blez	s11,802008e6 <vprintfmt+0x2d8>
    802008d4:	67a2                	ld	a5,8(sp)
    802008d6:	00078a1b          	sext.w	s4,a5
    802008da:	3dfd                	addiw	s11,s11,-1
    802008dc:	85a6                	mv	a1,s1
    802008de:	8552                	mv	a0,s4
    802008e0:	9902                	jalr	s2
    802008e2:	fe0d9ce3          	bnez	s11,802008da <vprintfmt+0x2cc>
    802008e6:	00044783          	lbu	a5,0(s0)
    802008ea:	00140a13          	addi	s4,s0,1
    802008ee:	0007851b          	sext.w	a0,a5
    802008f2:	d3a5                	beqz	a5,80200852 <vprintfmt+0x244>
    802008f4:	05e00413          	li	s0,94
    802008f8:	bf39                	j	80200816 <vprintfmt+0x208>
    802008fa:	000a2403          	lw	s0,0(s4)
    802008fe:	b7ad                	j	80200868 <vprintfmt+0x25a>
    80200900:	000a6603          	lwu	a2,0(s4)
    80200904:	46a1                	li	a3,8
    80200906:	8a2e                	mv	s4,a1
    80200908:	bdb1                	j	80200764 <vprintfmt+0x156>
    8020090a:	000a6603          	lwu	a2,0(s4)
    8020090e:	46a9                	li	a3,10
    80200910:	8a2e                	mv	s4,a1
    80200912:	bd89                	j	80200764 <vprintfmt+0x156>
    80200914:	000a6603          	lwu	a2,0(s4)
    80200918:	46c1                	li	a3,16
    8020091a:	8a2e                	mv	s4,a1
    8020091c:	b5a1                	j	80200764 <vprintfmt+0x156>
    8020091e:	9902                	jalr	s2
    80200920:	bf09                	j	80200832 <vprintfmt+0x224>
    80200922:	85a6                	mv	a1,s1
    80200924:	02d00513          	li	a0,45
    80200928:	e03e                	sd	a5,0(sp)
    8020092a:	9902                	jalr	s2
    8020092c:	6782                	ld	a5,0(sp)
    8020092e:	8a66                	mv	s4,s9
    80200930:	40800633          	neg	a2,s0
    80200934:	46a9                	li	a3,10
    80200936:	b53d                	j	80200764 <vprintfmt+0x156>
    80200938:	03b05163          	blez	s11,8020095a <vprintfmt+0x34c>
    8020093c:	02d00693          	li	a3,45
    80200940:	f6d79de3          	bne	a5,a3,802008ba <vprintfmt+0x2ac>
    80200944:	00000417          	auipc	s0,0x0
    80200948:	6e440413          	addi	s0,s0,1764 # 80201028 <etext+0x61c>
    8020094c:	02800793          	li	a5,40
    80200950:	02800513          	li	a0,40
    80200954:	00140a13          	addi	s4,s0,1
    80200958:	bd6d                	j	80200812 <vprintfmt+0x204>
    8020095a:	00000a17          	auipc	s4,0x0
    8020095e:	6cfa0a13          	addi	s4,s4,1743 # 80201029 <etext+0x61d>
    80200962:	02800513          	li	a0,40
    80200966:	02800793          	li	a5,40
    8020096a:	05e00413          	li	s0,94
    8020096e:	b565                	j	80200816 <vprintfmt+0x208>

0000000080200970 <printfmt>:
    80200970:	715d                	addi	sp,sp,-80
    80200972:	02810313          	addi	t1,sp,40
    80200976:	f436                	sd	a3,40(sp)
    80200978:	869a                	mv	a3,t1
    8020097a:	ec06                	sd	ra,24(sp)
    8020097c:	f83a                	sd	a4,48(sp)
    8020097e:	fc3e                	sd	a5,56(sp)
    80200980:	e0c2                	sd	a6,64(sp)
    80200982:	e4c6                	sd	a7,72(sp)
    80200984:	e41a                	sd	t1,8(sp)
    80200986:	c89ff0ef          	jal	ra,8020060e <vprintfmt>
    8020098a:	60e2                	ld	ra,24(sp)
    8020098c:	6161                	addi	sp,sp,80
    8020098e:	8082                	ret

0000000080200990 <sbi_console_putchar>:
    80200990:	4781                	li	a5,0
    80200992:	00003717          	auipc	a4,0x3
    80200996:	66e73703          	ld	a4,1646(a4) # 80204000 <SBI_CONSOLE_PUTCHAR>
    8020099a:	88ba                	mv	a7,a4
    8020099c:	852a                	mv	a0,a0
    8020099e:	85be                	mv	a1,a5
    802009a0:	863e                	mv	a2,a5
    802009a2:	00000073          	ecall
    802009a6:	87aa                	mv	a5,a0
    802009a8:	8082                	ret

00000000802009aa <sbi_set_timer>:
    802009aa:	4781                	li	a5,0
    802009ac:	00003717          	auipc	a4,0x3
    802009b0:	67473703          	ld	a4,1652(a4) # 80204020 <SBI_SET_TIMER>
    802009b4:	88ba                	mv	a7,a4
    802009b6:	852a                	mv	a0,a0
    802009b8:	85be                	mv	a1,a5
    802009ba:	863e                	mv	a2,a5
    802009bc:	00000073          	ecall
    802009c0:	87aa                	mv	a5,a0
    802009c2:	8082                	ret

00000000802009c4 <sbi_shutdown>:
    802009c4:	4781                	li	a5,0
    802009c6:	00003717          	auipc	a4,0x3
    802009ca:	64273703          	ld	a4,1602(a4) # 80204008 <SBI_SHUTDOWN>
    802009ce:	88ba                	mv	a7,a4
    802009d0:	853e                	mv	a0,a5
    802009d2:	85be                	mv	a1,a5
    802009d4:	863e                	mv	a2,a5
    802009d6:	00000073          	ecall
    802009da:	87aa                	mv	a5,a0
    802009dc:	8082                	ret

00000000802009de <strnlen>:
    802009de:	4781                	li	a5,0
    802009e0:	e589                	bnez	a1,802009ea <strnlen+0xc>
    802009e2:	a811                	j	802009f6 <strnlen+0x18>
    802009e4:	0785                	addi	a5,a5,1
    802009e6:	00f58863          	beq	a1,a5,802009f6 <strnlen+0x18>
    802009ea:	00f50733          	add	a4,a0,a5
    802009ee:	00074703          	lbu	a4,0(a4)
    802009f2:	fb6d                	bnez	a4,802009e4 <strnlen+0x6>
    802009f4:	85be                	mv	a1,a5
    802009f6:	852e                	mv	a0,a1
    802009f8:	8082                	ret

00000000802009fa <memset>:
    802009fa:	ca01                	beqz	a2,80200a0a <memset+0x10>
    802009fc:	962a                	add	a2,a2,a0
    802009fe:	87aa                	mv	a5,a0
    80200a00:	0785                	addi	a5,a5,1
    80200a02:	feb78fa3          	sb	a1,-1(a5)
    80200a06:	fec79de3          	bne	a5,a2,80200a00 <memset+0x6>
    80200a0a:	8082                	ret
