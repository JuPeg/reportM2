Once the sequences have been retrieved using filters described before, the cluster step can get started. Indeed, the data retrieved is still very redundant. 

Obviously, redundancy in biological data is not a novelty. Thus, there are a list of tools already developed aiming to reduce or resolve this problem. The question was to choose the software the best adapted to our scenario.

The issue with clustering sequences is that to compute distances between elements, sequences alignments are required. Biological sequences present deletions, insertions and mutations what makes it quite complex to determine the distances between every sequence. Besides, the sequences length will impact significantly in the time processing required.

There are two main types of sequence clustering algorthms. 

Most hierarchical clustering algorithms have quadratic space and computation complexities, limitating the amount of data that can be handled. This type of algorithm is known to be more accurate, but they are quite slower.  [^Cai] Some hierarchical clustering algorithm, like ESPRIT-Tree, propose the use of space partition in order to reduce time complexity.

<!-- explain esprit-tree algorithm ?

Besides, sequences clustering gains in complexity as the sequences must be aligned to compute their distance. Sequences can have mutations, deletions and insertions which makes it complex to find the real distance between sequences.

The are some hierarchical clustering algorithm developed for clustering biological sequences. This algorithms are supposed to present a much better accuracy when compared with greedy heuristic algorithms. However, they tend to be quite slower. In this case, we are using huge database inputs, which requires a long processing time. Luckly, the similarity accuracy is not particular important, since we will be using high similarity threshold. 

"Hence, a sequence can be considered as a data point in a nucleotide space of un-defined dimensions, which poses additional mathematical challenges" Cai and Sun-->

Greedy heuristic clustering are another approach used to cluster sequences. Two of the most famous algorithms are CD-HIT and UCLUST. As a greedy algorithm, they try to approtimate to the global optimal solution in a reasonable time. This means that this algorithms are faster but less accurate than hierarchical clustering algorithms. 

The input sequences are analysed in a determined order. Ordered pairwise alignements will indicate if a sequence is:

1. redundant: belongs to a cluster
2. representative: none of the previously defined clusters are close two this sequence

The computational complexity is on the order of O(NM), where N indicates the number of sequences in the input and M is the number of representative sequences. However, this is just a simplification as it does not take into account the sequences length.

<!--##NRDB##-->

##CD-HIT##



###CD-HIT-EST###

###PSI-CD-HIT###

##UCLUST##

##VCLUST##

##ESPRIT-Tree##

This hierarchical clustering algorithm has a quasilinear time and space complexity. It uses a space partition approach 


---

[^Cai]: Cai, Y., & Sun, Y. (2011). ESPRIT-Tree: Hierarchical clustering analysis of millions of 16S rRNA pyrosequences in quasilinear computational time. Nucleic Acids Research, 39(14), 1–10. http://doi.org/10.1093/nar/gkr349

[^Kim]: Kim, M., Lee, K.-H., Yoon, S.-W., Kim, B.-S., Chun, J., & Yi, H. (2013). Analytical Tools and Databases for Metagenomics in the Next-Generation Sequencing Era. Genomics & Informatics, 11(3), 102–113.

[^Edgar]: Edgar, R. C. (2010). Search and clustering orders of magnitude faster than BLAST. Bioinformatics, 26(19), 2460–2461. http://doi.org/10.1093/bioinformatics/btq461

[^Fu]: Fu, L., Niu, B., Zhu, Z., Wu, S., & Li, W. (2012). CD-HIT: Accelerated for clustering the next-generation sequencing data. Bioinformatics, 28(23), 3150–3152. http://doi.org/10.1093/bioinformatics/bts565

[^Quarst]: Quast, C., Pruesse, E., Yilmaz, P., Gerken, J., Schweer, T., Glo, F. O., & Yarza, P. (2013). The SILVA ribosomal RNA gene database project : improved data processing and web-based tools. Nucleic Acids Research, 41(November 2012), 590–596. http://doi.org/10.1093/nar/gks1219
