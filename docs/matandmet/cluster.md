Once the sequences have been retrieved using filters described before, the cluster step can get started. Indeed, the data retrieved is still very redundant. 

Obviously, redundancy in biological data is not a novelty. Thus, there are a list of tools already developed aiming to reduce or resolve this problem. The question being what software is the best adapted to our scenario.

Besides the big amount of data available, another issue with clustering sequences is that to compute distances between elements, sequences alignments are required. Biological sequences present deletions, insertions and mutations what makes it quite complex to determine the distances between every sequence. Besides, the sequences length will impact significantly in the time processing required.

There are two main types of sequence clustering algorthms that will be discussed below:

#Hierarchical Clustering#

Hierarchical clustering algorithms are applied in many different data fields. Most of them have quadratic space and computation complexities (_O_(n<sup>2</sup>)), which means that the complexity grows quadratically with the number of elements in the dataset. This implies a data size limitation too restrictive for our case. [^Cai] 

##ESPRIT-Tree##

Some new algorithms propose methods for reducing its complexity and the processing time. It is the case of ESPRIT-Tree, a recent hierarchcal clustering algorithm that uses the concept of space partition. Unlike most hierarchical clustering algorithms, ESPRIT-Tree does not build a distance matrix, computing distance when needed. It uses a "devide-and conquer-based strategy" which assures a quasilinear complexity.

A pseudometric based partition (PBP) tree contains multiple levels uniformly spaced in a logarithmic scale. This tree is built incrementally by adding sequence by sequence in the tree. For each new sequence, its distance to the center of existing nodes will determine its position. If this pairwise distance is greater than a given threshold, a new node is created. Else, the sequence is absorbed inside the node and it is compared with the nodes in the lower level. This process repeats until the new sequences reaches the leafs level. Another new sequence will then be added in the PBP tree. To avoid the risk of overlapping the clusters hyperspaces, the new sequence goes within the first node to match the condition, instead of going within the closest cluster. This step complexity is on the order of _O_(N).

Then, this tree needs to be refined so the closest pairs of clusters stay closer. A naive calculation of distances between every pair of cluster to determine the minima takes _O_(N<sup>2</sup>) operations. However, thanks to the PBP tree, nearest neighbor sequences can be found locally since they are always in the same or adjacent cluster spaces. Taking this advantage, the minimal distances can be found in _O_(log N) time and _O_(N) space using pseudometric space triangular inequalities and the probabilistic Needleman-Wunsch algorithm.

 


<!-- "Hence, a sequence can be considered as a data point in a nucleotide space of un-defined dimensions, which poses additional mathematical challenges" Cai and Sun-->

#Greedy Heuristic Clustering#

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



---

[^Cai]: Cai, Y., & Sun, Y. (2011). ESPRIT-Tree: Hierarchical clustering analysis of millions of 16S rRNA pyrosequences in quasilinear computational time. Nucleic Acids Research, 39(14), 1–10. http://doi.org/10.1093/nar/gkr349

[^Kim]: Kim, M., Lee, K.-H., Yoon, S.-W., Kim, B.-S., Chun, J., & Yi, H. (2013). Analytical Tools and Databases for Metagenomics in the Next-Generation Sequencing Era. Genomics & Informatics, 11(3), 102–113.

[^Edgar]: Edgar, R. C. (2010). Search and clustering orders of magnitude faster than BLAST. Bioinformatics, 26(19), 2460–2461. http://doi.org/10.1093/bioinformatics/btq461

[^Fu]: Fu, L., Niu, B., Zhu, Z., Wu, S., & Li, W. (2012). CD-HIT: Accelerated for clustering the next-generation sequencing data. Bioinformatics, 28(23), 3150–3152. http://doi.org/10.1093/bioinformatics/bts565

[^Quarst]: Quast, C., Pruesse, E., Yilmaz, P., Gerken, J., Schweer, T., Glo, F. O., & Yarza, P. (2013). The SILVA ribosomal RNA gene database project : improved data processing and web-based tools. Nucleic Acids Research, 41(November 2012), 590–596. http://doi.org/10.1093/nar/gks1219
