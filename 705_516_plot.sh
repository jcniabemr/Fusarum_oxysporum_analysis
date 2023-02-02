
# -----
# 705_516 Fv links
# -----
#
<links>
  <link>
    ribbon           = no
    color            = gpos50
    thickness        = 1
    radius           = 0.95r
    bezier_radius    = 0r
    crest                = 0.1
    bezier_radius_purity = 0.75
</link>
file = /home/jconnell/niab/fusarium/circos/705_vs_516/test55
</links>




# cat syn_add | grep -v "AJ516_contig_9\|AJ516_contig_6\|AJ516_contig_15\|AJ516_contig_17\|AJ516_contig_19\|AJ516_contig_20\|AJ516_contig_22\|AJ516_contig_23" >> test55
# cat syn_add | grep -w "AJ516_contig_9" | awk '{print $0 "\t" "color=chr9"}' >> test55
# cat syn_add | grep -w "AJ516_contig_6" | awk '{print $0 "\t" "color=chr6"}' >> test55
# cat syn_add | grep -w "AJ516_contig_15" | awk '{print $0 "\t" "color=chr15"}' >> test55
# cat syn_add | grep -w "AJ516_contig_23" | awk '{print $0 "\t" "color=chr23"}' >> test55
# cat syn_add | grep -w "AJ516_contig_17" | awk '{print $0 "\t" "color=chr17"}' >> test55
# cat syn_add | grep -w "AJ516_contig_22" | awk '{print $0 "\t" "color=chr22"}' >> test55
# cat syn_add | grep -w "AJ516_contig_20" | awk '{print $0 "\t" "color=chr20"}' >> test55
# cat syn_add | grep -w "AJ516_contig_19" | awk '{print $0 "\t" "color=chr19"}' >> test55
