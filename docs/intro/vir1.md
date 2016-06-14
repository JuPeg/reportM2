#Reference viral sequences#

[redundancy]:http://arep.med.harvard.edu/seqanal/db.html

The results obtained by the Galaxy pipeline are very dependent on the database used as reference. Indeed, those sequences may guide one or two decisive steps. 

The matching reads from the second bowtie step, for instance, vary a lot according to the reference dataset used. Naturally, this step can be skipped, but for some sequencing datasets this would represent a heavy workload. In this cases, we use this second bowtie step to reduce the number of reads, keeping only those considered as viral. Whence the importance of having an appropriate reference database. If this database does not include as many viral sequences as known, some viral reads will be rejected, debilitating the following assembling steps. Nevertheless, there is no interest in keeping a redundant reference database, since the bowtie step will take longer and the results will not be improved.

The second step involving the reference database is the BLAST alignment of Oases _de novo_ contigs against those known viral sequences. This step is important for picking the proper contigs between the possibilities given by the assembling. Again, a reference database lacking information will disturb the pipeline performance. And a redundant database will only slow down the process.

With the sequencing technologies more accessible, the amount of protein and nucleotides sequences is rapidly increasing. However, new sequence does not mean more information, since many of the new sequences are similar to alread known sequences. These alike sequences may indicate variant species, polymorphisms or even alignement errors. Either way, this high redundancy in a database represent a higher time and resource comsumption in subsequent analyses without any true profit.

Between the numerous biological databases, a few propose to store huge amount of nucleotide and protein data. These sequence databases often propose different approaches for organising such data. In fact, redundancy in the biological field is a very complex concept that do not fit a single definition. So, there are databases that try to eliminate redundancy by automated measures, other by manual curation and others will even neglect redundancy willing for completeness. [^Robison]

GenBank is an example of non-curated database. Its entries are submitted by individual laboratories or large-scale sequencing centers. Besides its redundancy, they can contain errors and discordances between sequences, names and other informations. GenBank, EMBL (European Molecular Biology Laboratory) and DDBJ (DNA Data Bank of Japan) are supposed to contain the same database, but it is not always true thanks to timelags in propagating data between them. Still, when updated and merged, these databases achieve a wordwide coverage, regardless of its redundancy. [^Robison] [^Pruitt]

RefSeq, on the other hand, is managed by NCBI staff and contains "non-redudant" reviewed sequences. These sequences are well-annotated and contain supplementary information. Unfortunatly, not all known sequences have been reviewed, which makes RefSeq a non-redundant but not-complete collection. [^Pruitt]

In the case of protein sequence databases, SwissProt is known as a "highly-curated, highly-crossreferenced and non-redundant database". Its entries are manualy curated so there is a single entry per protein product, which might also present protein variants annotations and references to other databases. However, this process high cost reflects in the absence of some sequences not yet curated by SwissProt. [^Robison]

[RefSeq]:http://www.ncbi.nlm.nih.gov/books/NBK50679/

<!-- TODO talvez falar sobre redundância dentro do RefSeq?-->

For Metavisitor's goals, it is important to have a viral reference database as complete as it can get. For doing so, we choose to not to restrict it to the non-redundant databases. Instead, we will look for reducing redundancy on sequences sets comming from every database in NCBI.


---

[^Pruitt]: Pruitt, K. D., Tatusova, T., & Maglott, D. R. (2007). NCBI reference sequences (RefSeq): A curated non-redundant sequence database of genomes, transcripts and proteins. Nucleic Acids Research, 35(SUPPL. 1), 501–504. http://doi.org/10.1093/nar/gkl842

[^Robison]: Robison, K. (n.d.). What is Redundancy? Retrieved from http://arep.med.harvard.edu/seqanal/db.html