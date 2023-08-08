use GeneticsTest

exec insertResearcher 'stephen', 'okazaky' , 'genetist'

exec insertResearcher 'mike','zane', 'computer scientist'

exec insertResearcher 'bob' , 'curry' , 'molecular biologist'

exec insertResearcher 'martha' , 'hillberg', 'software engineer'

exec insertResearcher 'diego' , 'rossi' , 'chemist'

exec insertResearcher 'sofia' , 'giannoni' , 'biophisicist'



exec insertInstitute 1,'california', 1
exec insertInstitute 2,'milano', 2
exec insertInstitute 3, 'Warsaw' , 3

insert into Researchers_Institutes
values (1,1)

insert into Researchers_Institutes
values (2,2)

insert into Researchers_Institutes
values (3,3)

insert into Researchers_Institutes
values (4,1)

insert into Researchers_Institutes
values (5,2)

insert into Researchers_Institutes
values (6,3)



exec insertOrganism 1 , 'saccharomyces cerevisiae', 'aukaryota'

exec insertOrganism 2, 'Escherichia coli','prokatyota'

exec insertOrganism 3, 'Streptococcus pneumoniae', 'prokaryota'

exec insertOrganism 4 , 'Lactobacillus acidophilus' , 'prokaryota'

exec insertOrganism 5, 'Clostridium difficile' , 'prokaryota'

exec insertOrganism 6, 'Homo sapiens','eukaryota'

exec insertOrganism 7, 'Saccharomyces cerevisiae' , 'eukaryota'

exec insertOrganism 8, 'Drosophila melanogaster', 'eukaryota'

exec insertOrganism 9, 'Paramecium aurelia' , 'eukaryota'

exec insertOrganism 10 , 'Amoeba proteus' , 'eukaryota'




exec insertResearch 100, 2, 5500.22, 'make it unable to replicate'

exec insertResearch 101,5,10000,'squence the full human genome'

exec insertResearch 102,1,8000000,'engeneer the fungi to produce more CH3CH2OH with less sugars'



insert into Institute_Researches 
values (100,1)

insert into Institute_Researches 
values (101,2)

insert into Institute_Researches 
values (102,3)

insert into Institute_Researches 
values (101,1)



exec insertProtein 66,'carries oxygen in red blood cells','hemoglobin'

exec insertProtein 67,'provides structural support in connective tissue','collagen'

exec insertProtein 68 , 'regulates blood sugar levels', 'insulin'

exec insertProtein 69, 'protein involved in bacterial cell division' , 'FtsZ'

exec insertProtein 70 , 'protein that assists in the folding of other proteins' , 'chaperonin'

exec insertProtein 71 , 'protein involved in DNA repair and recombination', 'RecA'



exec insertSeqHigh 'AUGCCCUGA',69

exec insertSeqHigh 'AUGGGGUGA', 70

exec insertSeqHigh 'AUGTTTUGA', 68



exec insertGenome 1 , 'AUGGGGUGA'

exec insertGenome 2, 'AUGCCCUGA'

exec insertGenome 6 , 'AUGTTTUGA'

