#Introduction#


The next-generation sequencing (NGS) technologies, also known as high-throughput sequencing, have developped very fast in the past few years. The most known are Illumina, Roche 454 and SOLiD sequencing technologies. These platforms are able to produce over billions of short read data every day. This huge amount of data at lower costs enables deep sequencing and enlarge the application possibilities. [^EMBL-EBI]

These technologies can, for example, aid the study of metagenomics and the understanding of the host-pathogen interactions between humans and microbes or viruses. [^Gausson]

Viruses present a high diversity in which concern their genomes. Single or double-stranded, RNA or DNA, linear or circular, as well as different types of replication cycles, intermediates and strategies can hamper viral sequencing and detection. For instance, viruses with no DNA stage can not be detected by DNA sequencing and viruses without poly-A tails are not detected by most mRNA sequencing protocols. [^Carissimo]

Even though the existing methods are not yet apt to identify every virus class, it is already possible to detect virus at low levels. Indeed, those techniques, suitable for small RNA sequencing, can be adopted for vsiRNA. [^Gausson]

RNA interference (RNAi) is known by its important role in the antiviral immune mechanism in plants and invertebrates. This process consists in the gene expression inhibition by Dicer enzymes which cleaves the exogenous double-stranded RNA (dsRNA) molecules. [^Vodovar] From this slicing mechanism virus-derived small RNA (vsiRNA) are generated. These vsiRNA molecules reflect not only the activation of the antiviral response in the host but also its abundance reflects the degree of viral replication and gene expression. [^Gausson]

As explained by Gausson and Saleh, "vsiRNA can be derived from the dicing of dsRNA in replication intermediates, in structured regions, or in convergent viral transcripts".  vsiRNA can be created from virus presenting differente genome types: positive or negative single-stranted RNA viruses, double-stranted RNA or DNA. This is one important advantage for the small RNA deep-sequencing approach as method of detection and assembly of viral genomes. [^Carissimo] 

vsiRNA have the caracteristic length of 21 nucleotides in many host species. Mapping vsiRNA on a reference viral genome can give informations about the nature and the structure of the viral dsRNA. Indeed, different viruses are clived differently by Dicer enwyme: some are targeted on limited regions and others are targeted through the whole genome. As viral genomes evolve fast, viral variants with its accumulated mutations can also be recognised with the remapping. [^Gausson][^Vodovar]

Given these viral variants, Vodovar _et al._ proposed _Paparazzi_, a perl script that aims to reconstitute a virus complete genome from vsiRNA and an initial reference sequence as scaffold thanks to an iterative algorithm. The script was tested with small RNA sequencing data from _Drosophila melanogaster_ infected with _Nora virus_. The study showed that the improved sequence had increased around 20% of the _Nora virus_ genome coverage when compared with the initial _Nora virus_ reference genome. [^Vodovar]

Intended to the same goal, SearchSmallRNA is a software developed in java that uses a similar approch. [^Andrade] However, both SearchSmallRNA and Paparazzi present the same combination of cons. At first, they demand some computer skills from users for installation and execution. Secondly, they require a close enough sequence to serve as reference for guiding the algorithm. This preclude the identification of new or unexpected viruses. Lastly, these programs are not currently available for download.

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