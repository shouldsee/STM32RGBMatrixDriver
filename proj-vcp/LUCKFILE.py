'''

Output:
Usage: 

1. 

CHANGELOG

0.0.1
-------

Feng 2020-05-15

git clone https://github.com/micropython/stm32lib --depth 1
'''
from luck.shorts import LSC, TSSR, NCR, RNS, DNS



ns = RNS()
config = DNS()
config.version        = '0.0.3'
config.url_genome     = "ftp://ftp.ensemblgenomes.org/pub/plants/release-47/fasta/oryza_sativa/dna/Oryza_sativa.IRGSP-1.0.dna.toplevel.fa.gz"
config.url_gff3       = "ftp://ftp.ensemblgenomes.org/pub/plants/release-47/gff3/oryza_sativa/Oryza_sativa.IRGSP-1.0.47.gff3.gz"
config.url_ens_gtf    = "ftp://ftp.ensemblgenomes.org/pub/release-47/plants/gtf/oryza_sativa/Oryza_sativa.IRGSP-1.0.47.gtf.gz"
config.use_ens_gtf    = 1
config.threads = 1


TSSR.MWF(ns, '/data/repos/stm32/TeenyUSB/**')
TSSR.MWF(ns, '/data/repos/stm32/TeenyUSB/usb_stack/*')
TSSR.MWF(ns, '/data/repos/stm32/STM32RGBMatrixDriver/template/**')
TSSR.MWF(ns, '/data/repos/stm32/stm32lib/**')
TSSR.MWF(ns, '/data/repos/stm32/TeenyUSB/**')
TSSR.MWF(ns,
	'teeny_usb_stack', 
	'/data/repos/stm32/TeenyUSB/usb_stack/src /data/repos/stm32/TeenyUSB/usb_stack/inc',
	"mkdir -p {c.o[0]}; cp -rt {c.o[0]} {' '.join(c.i)}"
	)

TSSR.MWF(ns,
	# 'board/stm32f4xx_hal_conf.h',
	'board/stm32f4xx_hal_conf.h board/board_config.h',
	'/data/repos/stm32/TeenyUSB/demo/boards/stm32f407_evk/stm32f4xx_hal_conf.h '
	'/data/repos/stm32/TeenyUSB/demo/boards/stm32f407_evk/board_config.h',
	"cp {' '.join(c.i)} $(dirname {c.o[0]})")

TSSR.MWF(ns,
	'board/startup_stm32f40xx.S',
	"/data/repos/stm32/stm32lib/CMSIS/STM32F4xx/Source/Templates/arm/startup_stm32f407xx.s",
	# "/data/repos/stm32/STM32RGBMatrixDriver/template/startup_src/startup_stm32f40xx.S",
	"cp {c.i[0]} {c.o[0]}")

TSSR.MWF(ns,
	'board/system_stm32f4xx.c',
	"/data/repos/stm32/stm32lib/CMSIS/STM32F4xx/Source/Templates/system_stm32f4xx.c",
	# "/data/repos/stm32/STM32RGBMatrixDriver/template/src/system_stm32f4xx.c",
	"cp {c.i[0]} {c.o[0]}")


NCR.MWF(ns,
	'template',
	' /data/repos/stm32/TeenyUSB/demo/custom_bulk/custom_bulk_desc.lua'
	' /data/repos/stm32/TeenyUSB/demo/custom_bulk/custom_bulk.c'
	' /data/repos/stm32/TeenyUSB/demo/custom_bulk/custom_bulk.h',
	'cp {" ".join(c.i)} .',
	)


TSSR.MWF(ns, 'custom_bulk_desc.lua',None)
TSSR.MWF(ns,
	'src/teeny_usb_desc.c  src/teeny_usb_init.h',
	'custom_bulk_desc.lua',
	'''
	cp {c.i[0]} src
	lua5.3 /data/repos/stm32/teenydt.github.io/gen_descriptor.lua src/$(basename {c.i[0]})
	''',
	)

requires = 'curl gzip'

NCR.MWF(ns,
	'dep',
	' '.join([
		'teeny_usb_stack',
		'board/stm32f4xx_hal_conf.h',
		'board/startup_stm32f40xx.S',
		'board/system_stm32f4xx.c',
		'src/teeny_usb_desc.c  src/teeny_usb_init.h',
		# 'board/*',
		])
	# ' '.join([
	# 	'genome.fa',
	# 	'genome.fa.fai',
	# 	'genome.fa.sizes',
	# 	'bowtie2-build.1.bt2',
	# 	'hisat2-build.1.ht2',
	# 	'genome.gtf genome.sorted.gtf.idx',
	# 	'genome.gff3',
	# 	'genome.genepred',
	# 	])
	# 'genome.fa genome.fa.fai genome.fa.sizes '
	# 'bowtie2-index.1.bt2 genome.gff3 genome.gtf '
	)


import glob,os,shutil
NCR.M(ns,'clean', None, lambda c: [[os.unlink(x) if os.path.isfile(x) else shutil.rmtree(x),print('[clean]%s'%x)] for x in glob.glob("./*") if not 'LUCKFILE.py' in x])
