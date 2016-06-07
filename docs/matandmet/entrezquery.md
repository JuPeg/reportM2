#Retrieve from NCBI#

In order to reduce the reference database, we started reviewing the sequences retrieved from NCBI. The retrieval is done with an Entrez query and an Eutils function.

##Entrez query##

Entrez search system is a powerful serch mechanism for exploring the NCBI database as it allows focused searches for getting precise results. The Entrez system embraces 39 databases for different types of molecules and literature. In Metavisitor's case, we will interest in two of these datasets: the nucleotide and the protein databases.

###Nucleotide database###

The nucleotide database, also called _nuccore_, includes all sequence data from GenBank, EMBL (European Molecular Biology Laboratory) and DDBJ (DNA Data Bank of Japan). It also contains the Reference Sequences (RefSeq) and nucleotide sequences extracted from structure records from the Protein Databank (PDB).

The first version of the reference viral nucleotide sequences database, called **vir1**, was retrieved using the following Entrez query:

`txid10239[Organism] NOT txid131567[Organism] NOT phage[All Fields]`

In NCBI, the taxonomy ID (txid) represents a lineage of organisms. IDs can be found in the [NCBI Taxonomy Homepage](http://www.ncbi.nlm.nih.gov/Taxonomy/taxonomyhome.html/index.cgi). 

We start getting all the viruses (txid10239) organisms making sure cellular organism (txid131567) and phages are filtered out. The retrieved database is very redundant and contains many poorly annotated sequences.

Since the following steps are going to be very resource consumming, we need to eliminate in this step as many unwanted sequences as possible. Many reasons can lead a sequence to be undesired in the viral reference database, essentially we want all of them to be informative and to have a human readable header. After studying the retrieved sequences, the Entrez query with new filters is the following:


<script src="https://gist.github.com/JuPeg/229773cb099918ebe3e00574e0026dee.js"></script>

1. Patent

	Not only most patent sequences are extremely short (below 100 nucleotides), but also they are predominantly redundant with non-patent sequences. Besides, their title are almost always not representing the source organism.

2. Unverified

	Unverified sequences are sequences marked by GenBank staff as containning issues. In fact Genbank staff are reponsible for verifying the sequences and annotations accuracies. When thay can not do it, the sequence is tagged as "UNVERIFIED" in its title until the submitter resolves the problems. These sequences are not included in the BLAST database and they should neither be included in the viral reference database. [^Genbank]

3. Chimeric

	Chimeric sequences are hybrids between two or more different organisms. Only a few vir1 sequences are chimeric. 

4. Vector

	Viral vector is a tool used in molecular biology to deliver genetic material into cells. There is no interest in keeping them for host-pathogens studies.

4. Method

	Some NCBI entries concern methods for molecular and cellular biology. Their title do not indicate what the sequence is neither its source as they are often unassigned sequences. 

5. Uncultured virus

	Some sequences present "uncultured virus" as their source organism, which does not inform much about the sequence origin.

6. Length

	NCBI contains many viral sequences below 100 nucleotides. These sequences are simutaneously not much informative and quite redundant with the rest of the database. They would increase the processing resources needs without adding results.
	
	The Entrez query syntax for defining the Sequences LENgth (SLEN) requires high and low thresholds. So, we define a high threshold that is certainly going to embrace every viral sequence.

###Protein database###

The protein database contains sequences from Protein Information Resource (PIR), UniProt/Swiss-Prot and Protein Research Foundation (PRF) as well as amino acid sequences obtained from the coding regions from all nucleotide records also included in Nuccore.

The first version of the reference viral protein database was also called **vir1**. It was retrieved using the exact same Entrez query as the nucleic vir1. The only difference was the NCBI database used.

For its second version, however, the filters used differ from from used against the Nucleotide database.

######
#TODO: define protein query
######

##*Retrieve FASTA from NCBI* tool##



---

[^Genbank]: Benson, D. A., Karsch-Mizrachi, I., Clark, K., Lipman, D. J., Ostell, J., & Sayers, E. W. (2012). GenBank. Nucleic Acids Research, 40(D1), 48–53. http://doi.org/10.1093/nar/gkr1202