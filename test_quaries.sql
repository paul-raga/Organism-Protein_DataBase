use GeneticsTest
--i ricercatori che sono situati in un centro di ricerca in California

select researcher_name, researcher_surname 
from Researcher
join Researchers_Institutes
on Researchers_Institutes.researcher_id=Researcher.researcher_id
join Institute
on Institute.institute_id=Researchers_Institutes.institute_id
where Institute.location='california'



--la lunghezza media delle catene associate a proteine di highlight

select dbo.avg_seq_length() as AVG_CHAIN_LENGTH



--la ricerca col maggior budget 

select top 1 *
from Research
order by budget



--gli organismi attualmente soggetti ad una ricerca che hanno una proteina di highlight associata presente nella tabella di tutte le proteine del database


select Organism.organism_id, Organism.scientific_name 
from Organism
join Genome
on Organism.organism_id=Genome.organism_id
join SequenceHighlight
on SequenceHighlight.sequence_=Genome.sequence_
join Protein
on Protein.protein_id=highlight_prot_id
where Protein.protein_name in (select distinct Protein.protein_name from Protein)
group by Organism.organism_id, Organism.scientific_name
having Organism.organism_id in (select Research.organism_id from Research)


-- seleziona il boss di ogni ricerca con il corrispondente obbiettivo della ricerca (per sbaglio ho masso due Boss di instituto a lavorare sulla stessa 
--ricerca allora ci sono due boss per il sequenziamento del genoma umano 

select Researcher.researcher_name, Researcher.researcher_surname, table_a.objective
from Researcher
join(select distinct Research.research_id, Research.objective, Institute.boss_id 
from Research
join Institute_Researches
on Institute_Researches.research_id=Research.research_id
join Institute
on Institute.institute_id=Institute_Researches.institute_id) as table_a
on table_a.boss_id=Researcher.researcher_id
where table_a.research_id in (100,101,102)





-- gli organismi nel database che hanno una proteina nel database 

select Organism.scientific_name
from Organism
join(select Protein.protein_id, Genome.organism_id from Protein
join SequenceHighlight
on SequenceHighlight.highlight_prot_id=Protein.protein_id
join Genome
on Genome.sequence_=SequenceHighlight.sequence_) as table_b
on table_b.organism_id=Organism.organism_id
where table_b.protein_id in (select Protein.protein_id from Protein)



