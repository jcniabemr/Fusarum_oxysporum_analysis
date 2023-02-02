#CIRCOS CONFIGURATION
#non optional requirements 
#1.) Required are Karyotype
#2.) 2D plot which details the synteny between bases 


#Karyotype required this is a file which details chromosome lengths this is 
karyotype = /home/jconnell/niab/fusarium/circos/4287_vs_516/karyotype.txt

# 2D plot required this synteny alignment file from satsuma_synteny
<<include /home/jconnell/git_repos/niab_repos/fusarium/516_4287_plot.sh>>


#Set spacing between contigs 

<ideogram>

  <spacing>

    default = 0.005r

    <pairwise AJ516_contig_1 4287_contig_1>

    spacing = 5r

    </pairwise>

    <pairwise AJ516_contig_10 AJ516_contig_14>

    spacing = 0r

    </pairwise>

    <pairwise AJ516_contig_18 AJ516_contig_16>

    spacing = 0r

    </pairwise>

    <pairwise AJ516_contig_8 AJ516_contig_11>

    spacing = 0r

    </pairwise>

    <pairwise AJ516_contig_31 4287_contig_11>

    spacing = 5r

    </pairwise>

    </spacing>

# ideogram position, thickness and fill
  radius           = 0.80r
  thickness        = 20p
  fill             = yes
  stroke_thickness = 1.0
  stroke_color     = black

<<include etc/colors_fonts_patterns.conf>> # included from Circos distribution

show_label     = yes
label_with_tag = yes
label_font     = bold
label_radius   = dims(ideogram,radius_outer) + 0.05r
label_center   = yes
label_size     = 20p
label_color    = black
label_parallel = no
label_case     = upper 
label_format   = eval(sprintf("%s",var(label)))

</ideogram>

# <background>
# color = gpos
# </background>


<image>

  # override the default angle_offset of -90 defined in etc/image.conf

  angle_offset* = -90

  radius* = 1100p

  <<include etc/image.conf>>  # included from Circos distribution



</image>


# Specify which chromosomes will be drawn and their orientation this must be forward and reverse 

chromosomes_order = AJ516_contig_1 ,AJ516_contig_14, AJ516_contig_10, AJ516_contig_8 ,AJ516_contig_11, AJ516_contig_2 ,AJ516_contig_3 ,AJ516_contig_4 ,AJ516_contig_5, AJ516_contig_16 ,AJ516_contig_18,AJ516_contig_7, AJ516_contig_13, AJ516_contig_12 ,AJ516_contig_9 ,     AJ516_contig_6    ,AJ516_contig_15     ,AJ516_contig_17    ,AJ516_contig_19        ,AJ516_contig_20        ,AJ516_contig_21        ,AJ516_contig_22        ,AJ516_contig_23        ,AJ516_contig_24     ,AJ516_contig_25        ,AJ516_contig_26        ,AJ516_contig_27        ,AJ516_contig_28        ,AJ516_contig_29        ,AJ516_contig_30        ,AJ516_contig_31 , 4287_contig_11, 4287_contig_6, 4287_contig_2 ,4287_contig_14, 4287_contig_15 ,4287_contig_13 , 4287_contig_12, 4287_contig_10 ,4287_contig_9 ,4287_contig_8, 4287_contig_7  ,4287_contig_5, 4287_contig_4 ,4287_contig_3 ,4287_contig_1

chromosomes_reverse = 4287_contig_7, 4287_contig_9, 4287_contig_12, AJ516_contig_8, AJ516_contig_11, 4287_contig_13, AJ516_contig_12

<<include etc/colors_fonts_patterns.conf>> # included from Circos distribution
 
<<include etc/housekeeping.conf>> # included from Circos distribution

<<include /home/jconnell/Fus2/Fus2_FoL/Fus2_FoL_ticks.conf>>