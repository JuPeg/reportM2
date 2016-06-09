#Retrieve from NCBI#

In order to reduce the reference database, we started reviewing the sequences retrieved from NCBI. The retrieval is done with an Entrez query and an E-utilities based tool.

##Entrez query##

Entrez search system is a powerful serch mechanism for exploring the NCBI database as it allows focused searches for getting precise results. The Entrez system embraces 39 databases for different types of molecules and literature. In Metavisitor's case, we will interest in two of these datasets: the nucleotide and the protein databases.

The first version of the reference viral sequences databases for nucleotides and proteins were both called **vir1**. They were retrieved using the the exact same Entrez query, only changing the NCBI database used. The initial commom Entrez query was:

`txid10239[Organism] NOT txid131567[Organism] NOT phage[All Fields]`

In NCBI, the taxonomy ID (txid) represents a lineage of organisms. IDs can be found in the [NCBI Taxonomy Homepage](http://www.ncbi.nlm.nih.gov/Taxonomy/taxonomyhome.html/index.cgi). 

We start getting all the viruses (txid10239) organisms making sure cellular organism (txid131567) and phages are filtered out. The retrieved database is very redundant and contains many poorly annotated sequences.

Since the following steps are going to be very resource consumming, we need to eliminate in this step as many unwanted sequences as possible. Many reasons can lead a sequence to be undesired in the viral reference database, essentially we want all of them to be informative and to have a human readable header. We studied the retrieved sequences for both databases. Besides some commom filters, they have also their particularities which are explained next.

###Nucleotide database###

The nucleotide database, also called _nuccore_, includes all sequence data from GenBank, EMBL (European Molecular Biology Laboratory) and DDBJ (DNA Data Bank of Japan). It also contains the Reference Sequences (RefSeq) and nucleotide sequences extracted from structure records from the Protein Databank (PDB).

The Entrez query with new filters proposed for the Nucleotide database is the following:

<script src="https://gist.github.com/JuPeg/229773cb099918ebe3e00574e0026dee.js"></script>

1. Patent

	Not only most patent sequences are extremely short (below 100 nucleotides), but also they are predominantly redundant with non-patent sequences. Besides, their title are almost always not representing the source organism.

2. Unverified

	Unverified sequences are sequences marked by GenBank staff as containning issues. In fact Genbank staff are reponsible for verifying the sequences and annotations accuracies. When they can not do it, the sequence is tagged as "UNVERIFIED" in its title until the submitter resolves the problems. These sequences are not included in the BLAST database and they should neither be included in the viral reference database. [^Genbank]

3. Chimeric

	Chimeric sequences are hybrids between two or more different organisms. Only a few vir1 sequences are chimeric. 

4. Vector

	A vector is a tool used in molecular biology to deliver genetic material into another cell. They are genetically engeneered from viral or cellular genetic material. Entries containing this word in the title usually present artificial sequences.

4. Method

	Some NCBI entries concern methods for molecular and cellular biology. Their title do not indicate what the sequence is neither its source. There is always some better anottated sequence for the same source organism.

5. Uncultured virus

	Some sequences present "uncultured virus" as their source organism, which does not inform much about the sequence origin.

6. Length

	NCBI contains many viral sequences below 100 nucleotides. These sequences are simutaneously not much informative and quite redundant with the rest of the database. They would increase the processing resources needs without adding results.
	
	The Entrez query syntax for defining the Sequences LENgth (SLEN) requires high and low thresholds. So, we define a high threshold that is certainly going to embrace every viral sequence.
	
For reasons that are going to be explained afterwards, we will have to retrieve nucleotide sequences in two separated sets. The first datasets will contain only RefSeq entries that will be picked by adding the filter `AND RefSeq[Filter]`. The second includes only non-RefSeq entries which means a `NOT RefSeq[Filter]` must be added in the Entrez query.  

###Protein database###

The protein database contains sequences from Protein Information Resource (PIR), UniProtKB/Swiss-Prot and Protein Research Foundation (PRF) as well as amino acid sequences obtained from the coding regions from all nucleotide records also included in Nuccore.

For the protein dataase, the proposed Entrez query with filter is the following:

<script src="https://gist.github.com/JuPeg/506a87a602fffda5ef7459fb8750d931.js"></script>

1. Unverified
	
	For the same reasons as explained for the nucleotide dataset, unverified sequences are excluded from the reference dataset.
	
2. Virus-like particles (VLP)
	
	As described by Brandão _et al._, VLPs "are multiprotein structures that mimic the organization and the conformation of authentic native viruses but lack the viral genome". They are used in different fields,  as vaccines, gene therapy and viral protein studies. Since they are not genuine viruses, they are not reference sequences.
	
3. Chimeric

	For the same reason as the nucleotide database.

4. Vector

	For the same reason as the nucleotide database.

4. Method

	For the same reason as the nucleotide database.

4. Length

	The thresholds chosen for nucleotide sequences are not convinient for proteins. Protein sequences are shorter. We will consider that the shorter significative sequence has at least 30 amino acids, which is just a bit shorter than the correspondent minimum of 100 nucleotides. To comprise the longest sequences, the high threshold is defined at 10000 amino acids. 
	
The protein sequences are also separated in two datasets. The first one, comprising data from curated databases (RefSeq, SwissProt, PIR and PDB), will be retrieved with the extra filter `AND (RefSeq[Filter] OR SwissProt[Filter] OR PIR[Filter] OR PDB[Filter])`. The remaining data belongs to the second set adding to the query: `NOT (RefSeq[Filter] OR SwissProt[Filter] OR PIR[Filter] OR PDB[Filter])`.

##*Retrieve FASTA from NCBI* tool##

For retrieving the sequences from NCBI according to the chosen Entrez query, we use a Galaxy tool developed in python and called _Retrieve FASTA from NCBI_. This tool uses the Entrez Programming Utilities ([E-utilities](http://www.ncbi.nlm.nih.gov/books/NBK25501/)) which offers a stable interface connection into the Entrez query and the NCBI databases. 

After connecting with the chosen database (nuccore or protein) and retrieving the sequences by batches, this tool also sanitazes the data by formatting the header and skipping problematic sequences. The skiped sequences are either empty or contain ambiguous nucleotides.

---

[^Genbank]: Benson, D. A., Karsch-Mizrachi, I., Clark, K., Lipman, D. J., Ostell, J., & Sayers, E. W. (2012). GenBank. Nucleic Acids Research, 40(D1), 48–53. http://doi.org/10.1093/nar/gkr1202

[^Roldão]: Roldão, A., Mellado, M. C. M., Castilho, L. R., Carrondo, M. J., & Alves, P. M. (2010). Virus-like particles in vaccine development. Expert Review of Vaccines, 9(10), 1149–1176. http://doi.org/10.1586/erv.10.115