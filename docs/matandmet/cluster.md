Once the sequences have been retrieved using the Entrez queries described before, the cluster step can get started. Indeed, the data retrieved is still very redundant. 

Obviously, redundancy in biological data is not a novelty. Thus, there are a list of tools already developed aiming to reduce or resolve this problem. The question being what software is the best adapted to our scenario.

Besides the big amount of data available, another issue with clustering sequences is that to compute distances between elements, sequences alignments are required. Biological sequences present deletions, insertions and mutations what makes it quite complex to determine the distances between every sequence. Besides, the sequences length will impact significantly in the time processing required. To reduce this problem, some algorithm found alternatives for calculating pairwise distance wisely. 

There are two main types of sequence clustering algorthms for biological sequences. They are discussed below:

#Hierarchical Clustering#

Hierarchical clustering algorithms are applied in many different data fields. Most of them have quadratic space and computation complexities (_O_(n<sup>2</sup>)), which means that the complexity grows quadratically with the number of elements in the dataset. This implies a data size limitation too restrictive for our case. [^Cai] 

##ESPRIT-Tree##

Some new algorithms propose methods for reducing its complexity and the processing time. It is the case of ESPRIT-Tree, a recent hierarchical clustering algorithm that uses the concept of space partition. Unlike most hierarchical clustering algorithms, ESPRIT-Tree does not build a distance matrix, every distance is calculated as needed. It uses a "devide-and-conquer-based strategy" which assures a quasilinear complexity. All the informations about ESPRIT-Tree algorithm and particularities are described in its paper [_ESPRIT-Tree: Hierarchical clustering analysis of millions of 16S rRNA pyrosequences in quasilinear computational time_ (Cai & Sun)](http://nar.oxfordjournals.org/content/early/2011/05/19/nar.gkr349.full.pdf+html).

The software clusters the elements within a pseudometric based partition (PBP) tree, a tree that contains multiple levels uniformly spaced in a logarithmic scale. It is built incrementally by adding sequence by sequence in the tree. For each new sequence, its distance to the center of existing nodes will determine its position. If this pairwise distance is greater than a given threshold, a new node is created. Else, the sequence is absorbed inside the node and it is compared with the nodes in the lower level. This process repeats until the new sequences reaches the leafs level. Another new sequence will then be added in the PBP tree. To avoid the risk of overlapping the clusters hyperspaces, the software opts by adding the new sequence within the first cluster matching the condition, instead of the closest cluster. This step complexity is on the order of _O_(N).

Then, this tree needs to be refined so the closest pairs of clusters are groupped together. A naive calculation of distances between every pair of cluster to determine the minima takes _O_(N<sup>2</sup>) operations. However, thanks to the PBP tree, nearest neighbor sequences can be found locally since they are always in the same or adjacent cluster spaces. Taking this advantage, the minimal distances can be found in _O_(log N) time and _O_(N) space using pseudometric space triangular inequalities.

Another improvement implemented by ESPRIT-Tree concerns the paiwise distance calculation. As said before, computing distances between sequences is a lot more mathematically challenging than the distances between numeric-valued vectors. When comparing sequences with different lengths, an alignment is needed. ESPRIT-Tree uses probabilistic sequences to facilitate the task. A probabilistic sequence is a statistical model that describes a group of sequences. These virtual sequences are aligned using the probabilistic Needleman-Wunsch algorithm, a generalizaton of the Needleman-Wunsch algorithm. Thanks to this algorithm, pairwise distances will be calculated as an approximation of the probabilistic average distance between two probabilistic sequences.

To reduce the workload required for doing all the alignements, ESPRIT-Tree also uses the _k_-mer distances strategy. With this method it is possible to avoid many unnecessary alignments in the PBP tree construction and in the clustering refinement. This technique will be discussed in the CD-HIT section.

According to ESPRIT-Tree official [website](http://plaza.ufl.edu/sunyijun/ES-Tree.htm), the software is being optimized and a beta version is available upon request. Yet, our request never got an answer from the author.

#Greedy Heuristic Clustering#

Greedy heuristic clustering are another approach used to cluster sequences. Two of the most used algorithms are CD-HIT and UCLUST. As greedy algorithms, they try to approximate the global optimal solution in a reasonable time comsuption. These algorithms are mostly faster than hierarchical clustering algorithms, but they tend to be less accurate. 

The input sequences are processed sequentially by the algorithm. Already processed sequences can be of two types: representative or redundant. Redundant sequences are illustrated by representative sequences, so, they can be excluded from further analyzes. Every new sequence is compared with the representative sequences. If the pairwise distance is smaller than a given threshold, than the new sequence is considered redundant. Otherwise, it is a representative sequence that will be part of following analyzes.

The process described is the main process followed by this class of clustering algorithms. However, different software presents particularities in its methods and definitions. This differences will be detailed below.

Overall, these algorithms' computational complexity is on the order of _O_(NM), where N indicates the number of sequences in the input and M is the number of representative sequences. Therefore, their resources consuption is quite hard to predict since the data redundancy may be unknown until the algorithm is run.


<!--Though, this is just a simplification as it does not take into account the sequences length.-->

<!--##NRDB##-->

##CD-HIT and CD-HIT-EST##

Originally developped to protein sequences clustering in 2001, this software was extended for nucleotides sequences in 2006. The algorithm supporting nucleotides clustering received the name CD-HIT-EST. CD-HIT package also includes many other programs and perl scripts used to compare two databases, identify overlapping reads, etc. Since 2012, CD-HIT can run in multiple-thread, reducing the database size limitations.[^Li] CD-HIT's informations were retrieved from its [user's guide](https://github.com/weizhongli/cdhit/blob/master/doc/cdhit-user-guide.wiki). 

CD-HIT's algorithm starts by ordering the sequences from the longest to the shortest. The longest sequence is automatically a representative sequence. Then, as explained before, every other sequence will be classified as redundant or representative according to the sequences already classified as representative. The user can choose if redundant sequences should go to the first matching cluster (fast mode) or to the closest cluster after comparison with all representative sequences (accurate mode).

For speeding up its execution, CD-HIT uses a heuristic for reducing the amount of alignments. It consists in choosing which pairwise alignments are worth computing according to the common short words.

A short word or k-mer is a small sequence of k nucleotides (for DNAs) or amino acids (for proteins) from a bigger sequence. A linear sequence contains L-k+1 k-mers, where L is the sequence length. The combination and the repeatition of those k-mers vary from sequence to sequence and that is the big advantage of using short word filters.

At first, an index table for the whole database must be built. Every unique k-mer has a unique index that indicates how many times this k-mer appears within each sequence. Then, thanks to previous studies on real alignments, we know statistically how many common k-mers two sequences must have so they share a particular identity. If the number of common k-mers is too low, than the algorithm can predict these sequences are not similar without performing the alignment.

This process means a significant gain in the algorithm's efficiency, since accessing information in a index table can be done quite fast. Besides, CD-HIT uses a k from 2 to 5 for proteins and a k from 8 to 12 for DNA, making sure all unique k-mers can be indexed in computer memory. For instance, there are, at most, 4<sup>12</sup> = 16M different k-mers with k=12. The suggested k value for each identity range is indicated in the user's manual.

However, as the quantity of common k-mers needed vary according to sequences length and alignment identities, the CD-HIT algorithm presents some limitations. With too long sequences or for too small identities thresholds, common k-mers counting are no longer good predictors. For this reason, CD-HIT suggests a identity minima between protein sequences at 40% and CD-HIT-EST suggests 75% for nucleotide sequences. For other cases (low identity or genome sized sequences), CD-HIT proposes the PSI-CD-HIT script.

PSI-CD-HIT is a perl script that can be used for both protein and nucleotide sequences. Its algorithm is similat to CD-HIT and CD-HIT-EST's, but it does not use the k-mers filters. Each sequence is compared to the representative sequences identified so far through BLAST (blastp, blastn or megablast). Thus, it is less efficient and it is only recomended for those particular cases where the classic programs are inadequate. 

###CD-HIT's outputs###

CD-HIT's algorithms output two files. One is a fasta file containing all the dataset representative sequences. The other is a clstr file where each sequence cluster is described. A ">" starts a cluster description and is followed by the cluster id. The following lines present sequences informations (id, length, header and identity). The "*" indicates the representative sequence, every other sequence inside a cluster is redundant with the representative.

The following clstr example was extrated from the user's manual:

```
>Cluster 00 2799aa, >PF04998.6|RPOC2_CHLRE/275-3073... *>Cluster 10 2214aa, >PF06317.1|Q6Y625_9VIRU/1-2214... at 80%1 2215aa, >PF06317.1|O09705_9VIRU/1-2215... at 84%2 2217aa, >PF06317.1|Q6Y630_9VIRU/1-2217... *3 2216aa, >PF06317.1|Q6GWS6_9VIRU/1-2216... at 84%4 527aa, >PF06317.1|Q67E14_9VIRU/6-532... at 63%
```
Another CD-HIT limitation is that its output is influenced by the input sequences order.

##UCLUST##

UCLUST's algorithm is part of the USEARCH package. Its binary files are available upon request in its [website](http://drive5.com/usearch/). The 32-bit version is free, including for commercial uses. However, unlike the 64-bit paid version, it has a limitation of 4Gb RAM. User's manual is available in the [website](http://drive5.com/usearch/manual/). 

In UCLUST, representative sequences are called centroids. They were once called seeds too, but this term is now obsolet. Centroids are in the center of the cluster which is represented by a circle of radius equal to the identity threshold. UCLUST can be used to both protein and nucleotide sequences. There are two clustering algorithms: cluster_fast and cluster_smallmem. Cluster_fast can sort the input sequences by decreasing length or decreasing abundance before clustering. Cluster_smallmem, contrarily, only processes the input in the order they are given.

The main difference from CD-HIT's algorithm is the sequences comparison. UCLUST uses the USEARCH algorithm. This algorithm also uses short word filters but in a slightly different way. Each new sequence must be compared to centroids in a particular order. In fact centroids sequences are sorted by decreasing unique word count, that is, centroids that have more common unique k-mers are going to be aligned to the new sequence first. This means that the first time a pairwise alignment is found, it is likely to be the best alignment in the database. Plus, the more comparisons are done without finding a hit, the less likely it is that a hit exists in the database. This represents a big gain in efficiency. In fact, there might be no need to align a new sequence to every centroid before realizing it is not redundant.

- memory limitation

###UCLUST's outputs###

##VCLUST##



#Viral reference database case#

- Show graphic from ESPRIT-Tree paper that shows time comsumption + my predictions
- Test cd-hit parallelization
- Explain that we care more about rapidity than accuracy
- Talk about database size and length distribution

---

[^Cai]: Cai, Y., & Sun, Y. (2011). ESPRIT-Tree: Hierarchical clustering analysis of millions of 16S rRNA pyrosequences in quasilinear computational time. Nucleic Acids Research, 39(14), 1–10. http://doi.org/10.1093/nar/gkr349

[^Kim]: Kim, M., Lee, K.-H., Yoon, S.-W., Kim, B.-S., Chun, J., & Yi, H. (2013). Analytical Tools and Databases for Metagenomics in the Next-Generation Sequencing Era. Genomics & Informatics, 11(3), 102–113.

[^Edgar]: Edgar, R. C. (2010). Search and clustering orders of magnitude faster than BLAST. Bioinformatics, 26(19), 2460–2461. http://doi.org/10.1093/bioinformatics/btq461

[^Fu]: Fu, L., Niu, B., Zhu, Z., Wu, S., & Li, W. (2012). CD-HIT: Accelerated for clustering the next-generation sequencing data. Bioinformatics, 28(23), 3150–3152. http://doi.org/10.1093/bioinformatics/bts565

[^Quarst]: Quast, C., Pruesse, E., Yilmaz, P., Gerken, J., Schweer, T., Glo, F. O., & Yarza, P. (2013). The SILVA ribosomal RNA gene database project : improved data processing and web-based tools. Nucleic Acids Research, 41(November 2012), 590–596. http://doi.org/10.1093/nar/gks1219

[^Li]: Li, W., Fu, L., Niu, B., Wu, S., & Wooley, J. (2015). CD-HIT User’s Guide CD-HIT.