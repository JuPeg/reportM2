#Introduction#


The next-generation sequencing (NGS) technologies, also known as high-throughput sequencing, have developped very fast in the past few years. Between the most known technologies there are Illumina, Roche 454 and SOLiD. These platforms are able to produce over billions of short read data every day. This huge amount of data at lower costs enables deep sequencing and enlarge the application possibilities. [^EMBL-EBI] These technologies can, for example, aid the study of metagenomics and the understanding of the host-pathogen interactions. [^Gausson]

Viruses present a high diversity in which concern their genomes. Single or double-stranded, RNA or DNA, linear or circular, as well as different types of replication cycles, intermediates and strategies can hamper viral sequencing and detection. For instance, viruses with no DNA stage can not be detected by DNA sequencing and viruses without poly-A tails are not detected by most mRNA sequencing protocols. [^Kreuze][^Carissimo]

Attempting to avoid this issue and knowing that NGS technologies are suitable for small RNA sequencing, Kreuze _et al._ proposed in 2009 to use vsiRNA as a solution to virus identification. This approach would enable the identification of virus in low concentration as well as new virus with no prior information. [^Kreuze]

RNA interference (RNAi) is one of the mechanisms used by plants and invertebrates in gene expression control. Besides silencing endogenous genes, this process is also a potent antiviral pathway. The Dicer enzyme mediates this process by recognising the viral RNA which is then cleaved in smaller RNA duplex called virus-derived small RNA (vsiRNA). [^Sabin] According to previous studies about Dicer's substract, different forms of viral RNA may be a vsiRNA precursor: double-strand RNA (dsRNA) as well as regions in highly structured hairpin in simple-strand RNA (ssRNA) or messenger RNA (mRNA). DNA virus are also directly identified and cleaved by Dicer enzymes. However, ssRNA virus must be transformed in dsRNA before Dicer recognition. [^Aliyari]

According to Gausson and Saleh, vsiRNA molecules indicate the activation of the antiviral response in the host and its abundance reveals the degree of viral replication and gene expression. [^Gausson] Though vsiRNA molecules have a characterisc length (varying from 21 to 23 nucleotides according to the host), the cleavages distribution in the viral genome remains unclear: some virus are cleaved in limited regions while others are targeted through the whole genome. [^Gausson][^Sabin]

Mapping these small molecules against a reference viral genome can give informations about the nature and the structure of the viral dsRNA. Moreover, as viral genomes evolve fast, it is important to know and to identify viral variants for biological and medical researches. It can be conveniently done by scaffolding vsiRNA short sequences into a known similar reference sequence. [^Gausson][^Vodovar]

Intenting to determine viral variants, Vodovar _et al._ proposed _Paparazzi_, a perl script that aims to reconstitute a virus complete genome from vsiRNA and an initial reference sequence as scaffold thanks to an iterative algorithm. The script was tested with small RNA sequencing data from _Drosophila melanogaster_ infected with _Nora virus_. The study showed that the improved sequence had a higher coverage when compared with the initial _Nora virus_ reference genome. [^Vodovar] With the same goal, SearchSmallRNA is a software developed in java that uses a similar approch. [^Andrade] 

However, both SearchSmallRNA and Paparazzi present the same combination of cons. At first, they demand some computer skills from users for installation and execution. Secondly, they require a close enough sequence to serve as reference for guiding the algorithm. This preclude the identification of new or unexpected viruses. Lastly, these programs are not currently available for download.

Aiming to release a software able to detect and reconstruct viral genomes from NGS datasets without the problems mentioned above, ARTbio developed Metavisitor, a free and open source set of Galaxy tools and workflows. 


---

[^Ikegami]: Ikegami T, Inatsugi T, Kojima I, Umemura M, Hagiwara H, Machida M, et al. (2015) Hybrid De Novo Genome Assembly Using MiSeq and SOLiD Short Read Data. PLoS ONE 10(4): e0126289. doi:10.1371/journal.pone.0126289

[^Kim]: Kim, M., Lee, K.-H., Yoon, S.-W., Kim, B.-S., Chun, J., & Yi, H. (2013). Analytical Tools and Databases for Metagenomics in the Next-Generation Sequencing Era. Genomics & Informatics, 11(3), 102–113.

[^Gausson]: Gausson, V., & Saleh, M.-C. (2011). Viral Small RNA Cloning and Sequencing. In Antiviral RNAi - Concepts, Methods, and Applications (pp. 107–122).

[^EMBL-EBI]: EMBL-EBI. (n.d.). What is Next-Generation DNA Sequencing. Retrieved June 3, 2016, from https://www.ebi.ac.uk/training/online/course/ebi-next-generation-sequencing-practical-course/what-you-will-learn/what-next-generation-dna-

[^Antoniewski]: Antoniewski, C. (2011). Visitor, An Informatic Pipeline for Analysis of Viral siRNA Sequencing Datasets. In Antiviral RNAi - Concepts, Methods, and Applications (pp. 123–142).

[^Carissimo]: Carissimo, G., Beek, M. van den, Pegoraro, J., Vernick, K. D., & Antoniewski, C. (2016). Metavisitor , a suite of Galaxy tools for simple and rapid detection and discovery of viruses in deep sequence data. bioRxiv Preprint.

[^Vodovar]: Vodovar, N., Goic, B., & Saleh, M. (2011). In Silico Reconstruction of Viral Genomes from Small RNAs Improves Virus-Derived Small Interfering, 85(21), 11016–11021. http://doi.org/10.1128/JVI.05647-11

[^Andrade]: de Andrade, R. R. S., & Vaslin, M. F. S. (2014). SearchSmallRNA: a graphical interface tool for the assemblage of viral genomes using small RNA libraries data. Virology Journal, 11, 45. http://doi.org/10.1186/1743-422X-11-45

[^Kreuze]: Kreuze, J. F., Perez, A., Untiveros, M., Quispe, D., Fuentes, S., Barker, I., & Simon, R. (2009). Complete viral genome sequence and discovery of novel viruses by deep sequencing of small RNAs: A generic method for diagnosis, discovery and sequencing of viruses. Virology, 388(1), 1–7. http://doi.org/10.1016/j.virol.2009.03.024