#CIRCOS CONFIGURATION
#non optional requirements 
#1.) Required are Karyotype
#2.) 2D plot which details the synteny between bases 


#Karyotype required this is a file which details chromosome lengths this is 
karyotype = /home/jconnell/niab/fusarium/circos/705_vs_516/AJ516_VS_AJ705_Illumina_genome.txt

# 2D plot required this synteny alignment file from satsuma_synteny
<<include /home/jconnell/git_repos/niab_repos/fusarium/705_516_plot.sh>>


#Set spacing between contigs 

<ideogram>

  <spacing>

    default = 0.005r

  <pairwise AJ516_contig_14 AJ516_contig_10>

    spacing = 0r

    </pairwise> 

    <pairwise AJ516_contig_8 AJ516_contig_11>

    spacing = 0r

    </pairwise> 
    
    <pairwise AJ516_contig_16 AJ516_contig_18>

    spacing = 0r

    </pairwise> 

    <pairwise AJ705_contig_1 AJ705_contig_27>

    spacing = 0r

    </pairwise> 

    <pairwise AJ705_contig_14 AJ705_contig_10>

    spacing = 0r

    </pairwise> 

    <pairwise AJ705_contig_8 AJ705_contig_11>

    spacing = 0r

    </pairwise> 

    <pairwise AJ705_contig_4 AJ705_contig_19>

    spacing = 0r

    </pairwise> 

    <pairwise AJ705_contig_9 AJ705_contig_25>

    spacing = 0r

    </pairwise> 

    <pairwise AJ705_contig_26 AJ705_contig_17>

    spacing = 0r

    </pairwise> 

    <pairwise AJ705_contig_1 AJ516_contig_27>

    spacing = 5r

    </pairwise> 

    <pairwise AJ705_contig_32 AJ516_contig_31>

    spacing = 5r

    </pairwise>

    <pairwise AJ705_contig_22 AJ705_contig_18>

    spacing = 0r

    </pairwise>


<pairwise AJ705_contig_1 AJ516_contig_1>

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
#label_format     = eval( var(idx) < 16? replace(var(chr),"contig_","FoC") : "")

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

#chromosomes_order = AJ516_contig_1, AJ516_contig_2 ,AJ516_contig_3 ,AJ516_contig_4 ,AJ516_contig_5 ,AJ516_contig_7 ,AJ516_contig_8 ,AJ516_contig_10, AJ516_contig_11 ,AJ516_contig_12, AJ516_contig_13, AJ516_contig_14, AJ516_contig_15, AJ516_contig_16 ,AJ516_contig_18, AJ516_contig_17, AJ516_contig_19, AJ516_contig_9, AJ516_contig_22, AJ516_contig_6, AJ516_contig_30, AJ516_contig_21,AJ516_contig_24, AJ516_contig_20 ,AJ516_contig_25, AJ516_contig_23 ,AJ516_contig_26 ,AJ516_contig_27, AJ516_contig_28, AJ516_contig_29 ,AJ516_contig_31, AJ516_contig_32, AJ516_contig_33 ,AJ516_contig_34 ,AJ516_contig_35, AJ516_contig_36, AJ516_contig_37, AJ705_contig_31, AJ705_contig_28, AJ705_contig_24, AJ705_contig_21, AJ705_contig_16, AJ705_contig_20, AJ705_contig_32, AJ705_contig_30, AJ705_contig_29, AJ705_contig_23, AJ705_contig_12, AJ705_contig_2, AJ705_contig_13, AJ705_contig_7, AJ705_contig_15, AJ705_contig_14, AJ705_contig_26, AJ705_contig_17, AJ705_contig_22, AJ705_contig_18, AJ705_contig_11, AJ705_contig_10, AJ705_contig_8, AJ705_contig_9,AJ705_contig_25, AJ705_contig_6, AJ705_contig_5, AJ705_contig_3, AJ705_contig_4, AJ705_contig_19, AJ705_contig_27, AJ705_contig_1

#chromosomes_reverse = AJ705_contig_14, AJ705_contig_1, AJ705_contig_15, AJ705_contig_16, AJ705_contig_21



############REORDER###########


chromosomes_order = AJ705_contig_1,AJ705_contig_27,AJ705_contig_14,AJ705_contig_10,AJ705_contig_8,AJ705_contig_11,AJ705_contig_4,AJ705_contig_19,AJ705_contig_3,AJ705_contig_5,AJ705_contig_6,AJ705_contig_7,AJ705_contig_9,AJ705_contig_25,AJ705_contig_26,AJ705_contig_17,AJ705_contig_22, AJ705_contig_18,AJ705_contig_2,AJ705_contig_12,AJ705_contig_13,AJ705_contig_15,AJ705_contig_16,AJ705_contig_20,AJ705_contig_21,AJ705_contig_23,AJ705_contig_24,AJ705_contig_28,AJ705_contig_29,AJ705_contig_30,AJ705_contig_31,AJ705_contig_32, AJ516_contig_31,        AJ516_contig_30,        AJ516_contig_29,        AJ516_contig_28,  AJ516_contig_27, AJ516_contig_26, AJ516_contig_25,            AJ516_contig_24,           AJ516_contig_23,        AJ516_contig_22,        AJ516_contig_21,     AJ516_contig_20,         AJ516_contig_19,    AJ516_contig_17,      AJ516_contig_15,  AJ516_contig_6, AJ516_contig_9, AJ516_contig_12,  AJ516_contig_13,  AJ516_contig_7,    AJ516_contig_18,               AJ516_contig_16,   AJ516_contig_5,     AJ516_contig_4, AJ516_contig_3, AJ516_contig_2, AJ516_contig_11, AJ516_contig_8, AJ516_contig_10, AJ516_contig_14, AJ516_contig_1               


chromosomes_reverse = AJ705_contig_1, AJ705_contig_22








<<include etc/colors_fonts_patterns.conf>> # included from Circos distribution
 
#Colour of chromosomes not synteny lines 

#chromosomes_color = Scaffold_1531=chr6

#anglestep       = 0.05

<<include etc/housekeeping.conf>> # included from Circos distribution

#<<include /home/jconnell/git_repos/niab_repos/fusarium/ticks.conf>>

<<include /home/jconnell/Fus2/Fus2_FoL/Fus2_FoL_ticks.conf>>