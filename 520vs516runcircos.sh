#CIRCOS CONFIGURATION
#non optional requirements 
#1.) Required are Karyotype
#2.) 2D plot which details the synteny between bases 


#Karyotype required this is a file which details chromosome lengths this is 
karyotype = /home/jconnell/niab/fusarium/circos/520_vs_516/karyotype.txt
#karyotype = /home/jconnell/niab/fusarium/circos/520_vs_516/temp_karyotype.txt

# 2D plot required this synteny alignment file from satsuma_synteny
<<include /home/jconnell/git_repos/niab_repos/fusarium/520_516_plot.sh>>


#Set spacing between contigs 

<ideogram>

  <spacing>
#########################################################
    default = 0.005r
#########################################################

    <pairwise AJ516_contig_1 AJ520_contig_1>

    spacing = 5r

    </pairwise>

    <pairwise AJ516_contig_31 AJ520_contig_30>

    spacing = 5r

    </pairwise>

    <pairwise AJ520_contig_13 AJ520_contig_10>

    spacing = 0r

    </pairwise>

    <pairwise AJ520_contig_2 AJ520_contig_18>

    spacing = 0r

    </pairwise>

    <pairwise AJ520_contig_31 AJ520_contig_3>

    spacing = 0r

    </pairwise>

    <pairwise AJ520_contig_6 AJ520_contig_22>

    spacing = 0r

    </pairwise>

    <pairwise AJ520_contig_15 AJ520_contig_14>

    spacing = 0r

    </pairwise>

    <pairwise AJ520_contig_17 AJ520_contig_23>

    spacing = 0r

    </pairwise>

    <pairwise AJ520_contig_23 AJ520_contig_28>

    spacing = 0r

    </pairwise>

    <pairwise AJ520_contig_5 AJ520_contig_35>
    
    spacing = 0r

    </pairwise> 

    <pairwise AJ520_contig_20 AJ520_contig_25>

    spacing = 0r

    </pairwise> 

    <pairwise AJ520_contig_25 AJ520_contig_24>

    spacing = 0r

    </pairwise> 

    <pairwise AJ520_contig_21 AJ520_contig_32>

    spacing = 0r

    </pairwise> 

    <pairwise AJ516_contig_14 AJ516_contig_10>

    spacing = 0r

    </pairwise> 

    <pairwise AJ516_contig_8 AJ516_contig_11>

    spacing = 0r

    </pairwise> 
    
    <pairwise AJ516_contig_16 AJ516_contig_18>

    spacing = 0r

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

#chromosomes_order = AJ520_contig_1, AJ520_contig_18, AJ520_contig_2, AJ520_contig_12, AJ520_contig_3, AJ520_contig_22, AJ520_contig_6, AJ520_contig_7, AJ520_contig_8, AJ520_contig_9, AJ520_contig_10,        AJ520_contig_11,       AJ520_contig_13,    AJ520_contig_14, AJ520_contig_15,     AJ520_contig_17,  AJ520_contig_23,        AJ520_contig_24,   AJ520_contig_4, AJ520_contig_16,        AJ520_contig_19, AJ520_contig_20,        AJ520_contig_21, AJ520_contig_5 , AJ520_contig_25,        AJ520_contig_26,        AJ520_contig_27,        AJ520_contig_28,        AJ520_contig_29,        AJ520_contig_30,        AJ520_contig_31,        AJ520_contig_32,        AJ520_contig_33,        AJ520_contig_34,     AJ520_contig_35,        AJ520_contig_36,        AJ520_contig_37,        AJ520_contig_38,        AJ520_contig_39,        AJ520_contig_40,        AJ516_contig_37,        AJ516_contig_36,        AJ516_contig_35,        AJ516_contig_34,     AJ516_contig_33,        AJ516_contig_32,        AJ516_contig_31,        AJ516_contig_30,        AJ516_contig_29,        AJ516_contig_28,  AJ516_contig_24, AJ516_contig_9, AJ516_contig_6, AJ516_contig_27,            AJ516_contig_25,           AJ516_contig_23,        AJ516_contig_21,        AJ516_contig_20,     AJ516_contig_22,         AJ516_contig_19,    AJ516_contig_17,     AJ516_contig_15 ,AJ516_contig_13, AJ516_contig_16,  AJ516_contig_18,  AJ516_contig_14,    AJ516_contig_12,               AJ516_contig_10,   AJ516_contig_26,     AJ516_contig_7, AJ516_contig_8, AJ516_contig_11, AJ516_contig_4, AJ516_contig_3, AJ516_contig_5, AJ516_contig_2,      AJ516_contig_1

#chromosomes_reverse = AJ520_contig_25,        AJ520_contig_26,        AJ520_contig_27,        AJ520_contig_28,        AJ520_contig_29,        AJ520_contig_30,        AJ520_contig_31,        AJ520_contig_32,        AJ520_contig_33,        AJ520_contig_34,     AJ520_contig_35,        AJ520_contig_36,        AJ520_contig_37,        AJ520_contig_38,        AJ520_contig_39,        AJ520_contig_40, AJ516_contig_4, AJ520_contig_13, AJ516_contig_1, AJ516_contig_11, AJ516_contig_8, AJ516_contig_7, AJ516_contig_13, AJ520_contig_12, AJ520_contig_2, AJ520_contig_18, AJ520_contig_23




#######REORDER###########




chromosomes_order = AJ520_contig_1, AJ520_contig_13, AJ520_contig_10, AJ520_contig_7, AJ520_contig_8, AJ520_contig_2, AJ520_contig_18, AJ520_contig_31, AJ520_contig_3, AJ520_contig_6,  AJ520_contig_22, AJ520_contig_12,       AJ520_contig_15,    AJ520_contig_14, AJ520_contig_26,     AJ520_contig_9,  AJ520_contig_17,        AJ520_contig_23,   AJ520_contig_28, AJ520_contig_11,        AJ520_contig_5, AJ520_contig_35,        AJ520_contig_4, AJ520_contig_16 , AJ520_contig_20,        AJ520_contig_25,        AJ520_contig_24,        AJ520_contig_19,        AJ520_contig_21,        AJ520_contig_32,        AJ520_contig_27,        AJ520_contig_29,        AJ520_contig_30,    AJ516_contig_31,        AJ516_contig_30,        AJ516_contig_29,        AJ516_contig_28,  AJ516_contig_27, AJ516_contig_26, AJ516_contig_25,            AJ516_contig_24,           AJ516_contig_23,        AJ516_contig_22,        AJ516_contig_21,     AJ516_contig_20,         AJ516_contig_19,    AJ516_contig_17,      AJ516_contig_15,  AJ516_contig_6, AJ516_contig_9, AJ516_contig_12,  AJ516_contig_13,  AJ516_contig_7,    AJ516_contig_18,               AJ516_contig_16,   AJ516_contig_5,     AJ516_contig_4, AJ516_contig_3, AJ516_contig_2, AJ516_contig_11, AJ516_contig_8, AJ516_contig_10, AJ516_contig_14, AJ516_contig_1               



chromosomes_reverse = AJ520_contig_1, AJ520_contig_8, AJ520_contig_2, AJ520_contig_4, AJ520_contig_18, AJ520_contig_7,  AJ520_contig_6, AJ520_contig_9, AJ520_contig_12,AJ520_contig_13,AJ520_contig_14


















<<include etc/colors_fonts_patterns.conf>> # included from Circos distribution
 
<<include etc/housekeeping.conf>> # included from Circos distribution

<<include /home/jconnell/Fus2/Fus2_FoL/Fus2_FoL_ticks.conf>>