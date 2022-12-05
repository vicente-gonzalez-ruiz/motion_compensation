include $(HOME)/Makefile_templates/tex2pdf_rule/Makefile
include $(HOME)/Makefile_templates/fig2pdf_rule/Makefile
include $(HOME)/Makefile_templates/eps2pdf_rule/Makefile
include $(HOME)/Makefile_templates/pdf2png_rule/Makefile
include $(HOME)/Makefile_templates/pdf2svg_rule/Makefile

default:	all

#all:	macroblocks.svg interpolation.svg
all:	$(TMPs)

# Original files
FIGs := $(wildcard *.fig)
TEXs := $(wildcard *.tex)

# Temporal files
PDFs += $(FIGs:%.fig=%.pdf)
#TMPs += $(FIGs:%.fig=%.pdf)
#TMPs += $(FIGs:%.fig=%.svg)
TMPs += $(PDFs)
SVGs += $(FIGs:%.fig=%.svg)
TMPs += $(SVGs)

PDFs += $(TEXs:%.tex=%.pdf)
TMPs += $(PDFs)
SVGs += $(TEXs:%.tex=%.svg)
TMPs += $(SVGs)

macroblocks.svg:	macroblocks.pdf
interpolation.svg:	interpolation.pdf

coastguard_352x288x30x420x300.avi:
	wget http://www.hpca.ual.es/~vruiz/videos/coastguard_352x288x30x420x300.avi

coastguard_352x288x30x420x300.yuv:	coastguard_352x288x30x420x300.avi
	ffmpeg -i coastguard_352x288x30x420x300.avi coastguard_352x288x30x420x300.yuv
#	rm coastguard_352x288x30x420x300.avi
TMPs += coastguard_352x288x30x420x300.yuv

TMP=
coastguard_150.png:	coastguard_352x288x30x420x300.yuv
	echo Building `pwd`/$@
	dd if=$< of=$@.1 bs=`echo "352*288*3/2" | bc` skip=150 count=1 2> /dev/null
	eyuvtoppm --width 352 --height 288 $@.1 2> /dev/null | pnmtopng > $@
	rm $@.1
TMPs += coastguard_150.png
TMP += coastguard_150.png

coastguard_158.png:	coastguard_352x288x30x420x300.yuv
	echo Building `pwd`/$@
	dd if=$< of=$@.1 bs=`echo "352*288*3/2" | bc` skip=158 count=1 2> /dev/null
	eyuvtoppm --width 352 --height 288 $@.1 2> /dev/null | pnmtopng > $@
	rm $@.1
TMPs += coastguard_158.png
TMP += coastguard_158.png

coastguard_162.png:	coastguard_352x288x30x420x300.yuv
	echo Building `pwd`/$@
	dd if=$< of=$@.1 bs=`echo "352*288*3/2" | bc` skip=162 count=1 2> /dev/null
	eyuvtoppm --width 352 --height 288 $@.1 2> /dev/null | pnmtopng > $@
	rm $@.1
TMPs += coastguard_162.png
TMP += coastguard_162.png

coastguard_150_cut.png:	coastguard_150.png
	pngtopnm $< > $@.1
	pnmcut -left 120 -top 65 -width 32 -height 32 < $@.1 > $@.2
	pnmtopng < $@.2 > $@
	rm $@.1 $@.2
TMPs += coastguard_150_cut.png
TMP += coastguard_150_cut.png

coastguard_158_cut.png:	coastguard_158.png
	pngtopnm $< > $@.1
	pnmcut -left 120 -top 65 -width 32 -height 32 < $@.1 > $@.2
	pnmtopng < $@.2 > $@
	rm $@.1 $@.2
TMPs += coastguard_158_cut.png
TMP += coastguard_158_cut.png

coastguard_162_cut.png:	coastguard_162.png
	pngtopnm $< > $@.1
	pnmcut -left 120 -top 65 -width 32 -height 32 < $@.1 > $@.2
	pnmtopng < $@.2 > $@
	rm $@.1 $@.2
TMPs += coastguard_162_cut.png
TMP += coastguard_162_cut.png

macroblocks.pdf: macroblocks.fig $(TMP)

tempete_352x288x30x420x260.avi:
	wget http://www.hpca.ual.es/~vruiz/videos/tempete_352x288x30x420x260.avi

tempete_352x288x30x420x260.yuv:	tempete_352x288x30x420x260.avi
	ffmpeg -i tempete_352x288x30x420x260.avi tempete_352x288x30x420x260.yuv
	rm tempete_352x288x30x420x260.avi
TMPs += tempete_352x288x30x420x260.yuv

tempete_000_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=0
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_000_q1.png

tempete_000_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=0
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_000_q2.png

tempete_000_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=0
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_000_q3.png

tempete_000_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=0
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_000_q4.png

tempete_001_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=1
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_001_q1.png

tempete_001_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=1
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_001_q2.png

tempete_001_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=1
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_001_q3.png

tempete_001_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=1
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_001_q4.png

tempete_002_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=2
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_002_q1.png

tempete_002_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=2
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_002_q2.png

tempete_002_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=2
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_002_q3.png

tempete_002_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=2
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_002_q4.png

tempete_003_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=3
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_003_q1.png

tempete_003_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=3
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_003_q2.png

tempete_003_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=3
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_003_q3.png

tempete_003_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=3
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_003_q4.png

tempete_004_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=4
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_004_q1.png

tempete_004_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=4
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_004_q2.png

tempete_004_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=4
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_004_q3.png

tempete_004_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=4
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_004_q4.png

tempete_005_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=5
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_005_q1.png

tempete_005_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=5
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_005_q2.png

tempete_005_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=5
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_005_q3.png

tempete_005_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=5
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_005_q4.png

tempete_006_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=6
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_006_q1.png

tempete_006_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=6
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_006_q2.png

tempete_006_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=6
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_006_q3.png

tempete_006_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=6
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_006_q4.png

tempete_007_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=7
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_007_q1.png

tempete_007_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=7
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_007_q2.png

tempete_007_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=7
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_007_q3.png

tempete_007_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=7
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_007_q4.png

tempete_008_q1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=8
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_008_q1.png

tempete_008_q2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=8
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.5
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_008_q2.png

tempete_008_q3.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=8
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.1
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_008_q3.png

tempete_008_q4.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=8
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress -I -i 2.ppm -o 2.jp2 -r 0.05
	opj_decompress -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_008_q4.png

quality-scalability.pdf:	quality-scalability.fig \
	tempete_000_q1.png tempete_000_q2.png tempete_000_q3.png tempete_000_q4.png \
	tempete_001_q1.png tempete_001_q2.png tempete_001_q3.png tempete_001_q4.png \
	tempete_002_q1.png tempete_002_q2.png tempete_002_q3.png tempete_002_q4.png \
	tempete_003_q1.png tempete_003_q2.png tempete_003_q3.png tempete_003_q4.png \
	tempete_004_q1.png tempete_004_q2.png tempete_004_q3.png tempete_004_q4.png \
	tempete_005_q1.png tempete_005_q2.png tempete_005_q3.png tempete_005_q4.png \
	tempete_006_q1.png tempete_006_q2.png tempete_006_q3.png tempete_006_q4.png \
	tempete_007_q1.png tempete_007_q2.png tempete_007_q3.png tempete_007_q4.png \
	tempete_008_q1.png tempete_008_q2.png tempete_008_q3.png tempete_008_q4.png
TMPs += quality-scalability.pdf

tempete_000_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=0
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_000_s1.png

tempete_001_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=1
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_001_s1.png

tempete_002_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=2
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_002_s1.png

tempete_003_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=3
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_003_s1.png

tempete_004_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=4
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_004_s1.png

tempete_005_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=5
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_005_s1.png

tempete_006_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=6
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_006_s1.png

tempete_007_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=7
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_007_s1.png

tempete_008_s1.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=8
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 1 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_008_s1.png

tempete_000_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=0
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_000_s2.png

tempete_001_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=1
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_001_s2.png

tempete_002_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=2
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_002_s2.png

tempete_003_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=3
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_003_s2.png

tempete_004_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=4
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_004_s2.png

tempete_005_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=5
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_005_s2.png

tempete_006_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=6
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_006_s2.png

tempete_007_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=7
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_007_s2.png

tempete_008_s2.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=8
	eyuvtoppm --width 352 --height 288 1 > 2.ppm
	opj_compress  -i 2.ppm -o 2.jp2
	opj_decompress -r 2 -i 2.jp2 -o 2.ppm
	convert 2.ppm $@
	rm 2.ppm 1 2.jp2
TMPs += tempete_008_s2.png

spatial-scalability.pdf: spatial-scalability.fig \
	tempete_000.png \
	tempete_001.png \
	tempete_002.png \
	tempete_003.png \
	tempete_004.png \
	tempete_005.png \
	tempete_006.png \
	tempete_007.png \
	tempete_008.png \
	tempete_000_s1.png tempete_000_s2.png \
	tempete_001_s1.png tempete_001_s2.png \
	tempete_002_s1.png tempete_002_s2.png \
	tempete_003_s1.png tempete_003_s2.png \
	tempete_004_s1.png tempete_004_s2.png \
	tempete_005_s1.png tempete_005_s2.png \
	tempete_006_s1.png tempete_006_s2.png \
	tempete_007_s1.png tempete_007_s2.png \
	tempete_008_s1.png tempete_008_s2.png
TMPs += spatial-scalability.pdf

temporal-scalability.pdf:	temporal-scalability.fig \
				tempete_000.png \
				tempete_001.png \
				tempete_002.png \
				tempete_003.png \
				tempete_004.png \
				tempete_005.png \
				tempete_006.png \
				tempete_007.png \
				tempete_008.png \

TMPs += temporal-scalability.pdf

tempete_000.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=0
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_000.png

tempete_001.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=1
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_001.png

tempete_002.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=2
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_002.png

tempete_003.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=3
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_003.png

tempete_004.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=4
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_004.png

tempete_005.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=5
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_005.png

tempete_006.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=6
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_006.png

tempete_007.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=7
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_007.png

tempete_008.png:	tempete_352x288x30x420x260.yuv
	dd if=$< of=1 bs=`echo "352*288*3/2" | bc` count=1 skip=8
	eyuvtoppm --width 352 --height 288 1 > 2
	rm 1
	convert 2 $@
	rm 2
TMPs += tempete_008.png

all:	$(TMPs)

default:	$(TMPs)

info:
	@echo $(TMPs)

clean:
	rm -f $(TMPs)
