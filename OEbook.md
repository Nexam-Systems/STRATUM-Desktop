# **An Introduction to Ontology Engineering** 

**C. Maria Keet v1.5,  2020** 

## **An Introduction to Ontology Engineering** 

**C. Maria Keet** 

_Keywords_ : Ontology Engineering, Ontology, ontologies, Knowledge base, Description Logics, OWL, Semantic Web, Ontology Development 

Copyright © 2020 by Maria Keet, except: The copyright of Chapter 11 is held by Zubeida C. Khan and C. Maria Keet The copyright of Appendix A.1 is held by Zola Mahlaza and C. Maria Keet 

This work is licensed under a Creative Commons Attribution 4.0 International License (CC BY 4.0). To view a copy of this license, visit `https://creativecommons. org/licenses/by/4.0/` . 

This textbook is typeset in L<sup>A</sup> TEX 

The website for this textbook is `https://people.cs.uct.ac.za/~mkeet/OEbook/` 

Cover design by Maria Keet Cover photo (by the author): A view from Table Mountain, Cape Town, SA 

### Contents 

|**Preface**||**vii**|
|---|---|---|
|**Preface**|**to v1**|**ix**|
|**How to**|**use the book**|**xi**|
|**1**<br>**Intr**|**oduction**|**1**|
|1.1|What does an ontology look like? . . . . . . . . . . . . . . . .|. . .<br>2|
|1.2|What is an ontology? . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>4|
||1.2.1<br>The defnition game<br>. . . . . . . . . . . . . . . . . . .|. . .<br>4|
||1.2.2<br>Some philosophical notes on ontologies . . . . . . . . .|. . .<br>7|
||1.2.3<br>Good, not so good, and bad ontologies . . . . . . . . .|. . .<br>8|
|1.3|What is the usefulness of an ontology?<br>. . . . . . . . . . . . .|. . .<br>9|
||1.3.1<br>Data and information system integration . . . . . . . .|. . .<br>10|
||1.3.2<br>Ontologies as part of a solution to other problems . . .|. . .<br>14|
||1.3.3<br>Success stories . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>17|
|1.4|Outline and usage of the book . . . . . . . . . . . . . . . . . .|. . .<br>20|
|1.5|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>21|
|1.6|Literature and reference material<br>. . . . . . . . . . . . . . . .|. . .<br>22|
|**I**<br>**Lo**|**gic foundations for ontologies**|**23**|
|**2**<br>**Firs**|**t order logic and automated reasoning in a nutshell**|**25**|
|2.1|First order logic syntax and semantics<br>. . . . . . . . . . . . .|. . .<br>25|
||2.1.1<br>Syntax . . . . . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>26|
||2.1.2<br>Semantics . . . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>29|
|2.2|Reasoning . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>33|
||2.2.1<br>Introduction . . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>33|
||2.2.2<br>Basic idea . . . . . . . . . . . . . . . . . . . . . . . . .|. . .<br>35|
||2.2.3<br>Deduction, abduction, and induction . . . . . . . . . .|. . .<br>36|



iii 

||2.2.4|Proofs with tableaux . . . . . . . . . . . . . . . . . . . . . .<br>37|
|---|---|---|
|2.3|Exerci|ses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>41|
|2.4|Litera|ture and reference material<br>. . . . . . . . . . . . . . . . . . .<br>44|
|**3**<br>**Des**|**criptio**|**n Logics**<br>**45**|
|3.1|DL pr|imer . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>46|
||3.1.1|Basic building blocks of DL ontologies<br>. . . . . . . . . . . .<br>47|
||3.1.2|Constructors for concepts and roles . . . . . . . . . . . . . .<br>49|
||3.1.3|Description Logic semantics . . . . . . . . . . . . . . . . . .<br>53|
|3.2|Impor|tant DLs<br>. . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>56|
||3.2.1|A basic DL to start with: _ALC_<br>. . . . . . . . . . . . . . . .<br>56|
||3.2.2|The DL _SROIQ_ . . . . . . . . . . . . . . . . . . . . . . . .<br>58|
||3.2.3|Important fragments of _SROIQ_<br>. . . . . . . . . . . . . . .<br>59|
|3.3|Reaso|ning services<br>. . . . . . . . . . . . . . . . . . . . . . . . . . .<br>61|
||3.3.1|Standard reasoning services<br>. . . . . . . . . . . . . . . . . .<br>61|
||3.3.2|Techniques: a tableau for _ALC_<br>. . . . . . . . . . . . . . . .<br>63|
|3.4|Exerci|ses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>65|
|3.5|Litera|ture and reference material<br>. . . . . . . . . . . . . . . . . . .<br>66|
|**4**<br>**The **|**Web **|**Ontology Language OWL 2**<br>**67**|
|4.1|Stand|ardising an ontology language . . . . . . . . . . . . . . . . . .<br>68|
||4.1.1|Historical notes . . . . . . . . . . . . . . . . . . . . . . . . .<br>68|
||4.1.2|The OWL 1 family of languages . . . . . . . . . . . . . . . .<br>70|
|4.2|OWL|2 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>71|
||4.2.1|New OWL 2 features . . . . . . . . . . . . . . . . . . . . . .<br>74|
||4.2.2|OWL 2 Profles . . . . . . . . . . . . . . . . . . . . . . . . .<br>76|
||4.2.3|OWL 2 syntaxes<br>. . . . . . . . . . . . . . . . . . . . . . . .<br>77|
||4.2.4|Complexity considerations for OWL . . . . . . . . . . . . . .<br>79|
|4.3|OWL|in context . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>81|
||4.3.1|OWL and the Semantic Web . . . . . . . . . . . . . . . . . .<br>81|
||4.3.2|The Distributed ontology, model, and specifcation language|
|||DOL . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>82|
||4.3.3|Common Logic<br>. . . . . . . . . . . . . . . . . . . . . . . . .<br>84|
|4.4|Exerci|ses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br>84|
|4.5|Litera|ture and reference material<br>. . . . . . . . . . . . . . . . . . .<br>88|
|**II**<br>**D**|**evelo**|**ping good ontologies**<br>**89**|
|**5**<br>**Met**|**hods **|**and Methodologies**<br>**91**|
|5.1|Metho|dologies for ontology development<br>. . . . . . . . . . . . . . .<br>92|
||5.1.1|Macro-level development methodologies . . . . . . . . . . . .<br>93|
||5.1.2|Micro-level development . . . . . . . . . . . . . . . . . . . .<br>97|
|5.2|Metho|ds to improve an ontology’s quality<br>. . . . . . . . . . . . . . 101|
||5.2.1|Logic-based methods: explanation and justifcation<br>. . . . . 101|
||5.2.2|Philosophy-based methods: OntoClean to correct a taxonomy 103|



iv 

||5.2.3<br>Combining logic and philosophy: role hierarchies . . . . . . .|104|
|---|---|---|
||5.2.4<br>Heuristics: OntOlogy Pitfall Scanner OOPS! . . . . . . . . .|106|
||5.2.5<br>Tools . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|109|
|5.3|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|111|
|5.4|Literature and reference material<br>. . . . . . . . . . . . . . . . . . .|113|
|**6**<br>**Top**|**-down Ontology Development**|**115**|
|6.1|Foundational ontologies . . . . . . . . . . . . . . . . . . . . . . . . .|115|
||6.1.1<br>Typical content of a foundational ontology . . . . . . . . . .|117|
||6.1.2<br>Several foundational ontologies<br>. . . . . . . . . . . . . . . .|121|
||6.1.3<br>Using a foundational ontology . . . . . . . . . . . . . . . . .|124|
|6.2|Part-whole relations<br>. . . . . . . . . . . . . . . . . . . . . . . . . .|130|
||6.2.1<br>Mereology . . . . . . . . . . . . . . . . . . . . . . . . . . . .|131|
||6.2.2<br>Modelling and reasoning in the context of ontologies . . . . .|132|
|6.3|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|136|
|6.4|Literature and reference material<br>. . . . . . . . . . . . . . . . . . .|138|
|**7**<br>**Bot**|**tom-up Ontology Development**|**139**|
|7.1|Relational databases and related ‘legacy’ KR . . . . . . . . . . . . .|140|
|7.2|From spreadsheets to OWL<br>. . . . . . . . . . . . . . . . . . . . . .|144|
|7.3|Thesauri . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|145|
||7.3.1<br>Converting a thesaurus into an ontology<br>. . . . . . . . . . .|146|
||7.3.2<br>Avoiding ontologies with SKOS . . . . . . . . . . . . . . . .|148|
|7.4|Text processing to extract content for ontologies . . . . . . . . . . .|148|
|7.5|Other semi-automated approaches . . . . . . . . . . . . . . . . . . .|150|
|7.6|Ontology Design Patterns<br>. . . . . . . . . . . . . . . . . . . . . . .|152|
|7.7|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|154|
|7.8|Literature and reference material<br>. . . . . . . . . . . . . . . . . . .|159|
|**III**<br>|**Advanced topics in ontology engineering**|**161**|
|**8**<br>**Ont**|**ology-Based Data Access**|**165**|
|8.1|Introduction: Motivations<br>. . . . . . . . . . . . . . . . . . . . . . .|166|
|8.2|OBDA design choices . . . . . . . . . . . . . . . . . . . . . . . . . .|167|
|8.3|An OBDA Architecture . . . . . . . . . . . . . . . . . . . . . . . . .|168|
|8.4|Principal components . . . . . . . . . . . . . . . . . . . . . . . . . .|170|
|8.5|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|174|
|8.6|Literature and reference material<br>. . . . . . . . . . . . . . . . . . .|175|
|**9**<br>**Ont**|**ologies and natural languages**|**177**|
|9.1|Toward multilingual ontologies . . . . . . . . . . . . . . . . . . . . .|178|
||9.1.1<br>Linking a lexicon to an ontology . . . . . . . . . . . . . . . .|178|
||9.1.2<br>Multiple natural languages . . . . . . . . . . . . . . . . . . .|180|
||9.1.3<br>Infrastructure for multilingual, localised, or internationalised||
||ontologies . . . . . . . . . . . . . . . . . . . . . . . . . . . .|183|
|9.2|Ontology verbalisation . . . . . . . . . . . . . . . . . . . . . . . . .|187|



v 

||9.2.1<br>Template-based approach<br>. . . . . . . . . . . . . . . .|. . . 187|
|---|---|---|
||9.2.2<br>Reusing the results for related activities<br>. . . . . . . .|. . . 189|
|9.3|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|. . . 190|
|9.4|Literature and reference material<br>. . . . . . . . . . . . . . . .|. . . 191|
|**10 Adv**|**anced Modelling with Additional Language Features**|**193**|
|10.1|Uncertainty and vagueness . . . . . . . . . . . . . . . . . . . .|. . . 193|
||10.1.1 Fuzzy ontologies . . . . . . . . . . . . . . . . . . . . . .|. . . 194|
||10.1.2 Rough ontologies . . . . . . . . . . . . . . . . . . . . .|. . . 197|
|10.2|Time and Temporal Ontologies<br>. . . . . . . . . . . . . . . . .|. . . 201|
||10.2.1 Why temporal ontologies? . . . . . . . . . . . . . . . .|. . . 202|
||10.2.2 Temporal DLs . . . . . . . . . . . . . . . . . . . . . . .|. . . 203|
|10.3|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|. . . 207|
|10.4|Literature and reference material<br>. . . . . . . . . . . . . . . .|. . . 208|
|**11 Ont**|**ology modularisation**|**211**|
|11.1|Defning modularisation<br>. . . . . . . . . . . . . . . . . . . . .|. . . 211|
|11.2|Module dimensions . . . . . . . . . . . . . . . . . . . . . . . .|. . . 213|
||11.2.1 Use-cases<br>. . . . . . . . . . . . . . . . . . . . . . . . .|. . . 213|
||11.2.2 Types<br>. . . . . . . . . . . . . . . . . . . . . . . . . . .|. . . 214|
||11.2.3 Properties . . . . . . . . . . . . . . . . . . . . . . . . .|. . . 216|
||11.2.4 Techniques . . . . . . . . . . . . . . . . . . . . . . . . .|. . . 217|
||11.2.5 Evaluation metrics . . . . . . . . . . . . . . . . . . . .|. . . 218|
|11.3|Modularisation framework . . . . . . . . . . . . . . . . . . . .|. . . 223|
|11.4|Exercises . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|. . . 225|
|11.5|Literature and reference material<br>. . . . . . . . . . . . . . . .|. . . 227|
|**Bibliog**|**raphy**|**229**|
|**A Tuto**|**rials**|**249**|
|A.1|OntoClean in OWL with a DL reasoner . . . . . . . . . . . . .|. . . 249|
|A.2|An OBDA system for elephants . . . . . . . . . . . . . . . . .|. . . 256|
|**B Assi**|**gnments**|**257**|
|B.1|Practical Assignment: Develop a Domain Ontology<br>. . . . . .|. . . 258|
|B.2|Project Assignment . . . . . . . . . . . . . . . . . . . . . . . .|. . . 260|
|**C OW**|**L 2 Profles features list**|**265**|
|**D Com**|**plexity recap**|**269**|
|**E Ans**|**wers of selected exercises**|**273**|
|**About **|**the author**|**289**|



vi 

### Preface 

The first version of this textbook received encouraging feedback and made it into print with the non-profit publisher _College Publications_ . The print version is still actual and relevant. This version 1.5 does have a few additions and corrections that seemed to deserve more than a 0.1-point notch. The main additions consist of about 10% increased main content, consisting main of 10% more exercises in Chapters 2- 9, a new preliminary Chapter 11 on ontology modularisation, and a new section on challenges for multilingualism (§ 9.1.3). The appendix has increased with two new tutorials—on OntoClean and on OBDA—and more answers to selected exercises. Also, typos and related infelicities that have been found were corrected, and in the grey area of copyright issues, I tweaked a few more figures a bit just to be on the safe side. Altogether, this caused an increase of 36 pages. If the reader wants access to v1 nonetheless: the pdf is still available as OEbookV1.pdf. 

In addition the the book’s content in the pdf file, the website accompanying the textbook now has has more materials, notably the slides (in pdf, L<sup>A</sup> TEX source, and ppt), new ontologies for the tutorials and exercises, and additional software for the exercises. This material can be found at `https://people.cs.uct.ac.za/~mkeet/ OEbook/` . The website also contains a page with instructions for improved accessibility for the visually impaired, in particular for low-cost screen reader training to handle the Description Logics symbols. 

As with the previous v1, more can indeed be added, but there are certain time constraints. For contributions to the additions, I would like to thank former and current students Zubeida Khan, Zola Mahlaza, Frances Gillis-Webber, Michael Harrison, Toky Raboanary, and Joan Byamugisha, as well as the grant from the “Digital Open textbooks for Development” (DOT4D) Project that made some of the additions possible. Also, I would like to thank the constructive feedback on the ontologies by Ludger Jansen, which has led to improvements of the content. 

Cape Town, South Africa February, 2020 

C. Maria Keet 

vii 

### Preface to v1 

This book is my attempt at providing the first textbook for an introduction in ontology engineering. Indeed, there are books about ontology engineering, but they either promote one specific ontology or methodology only, are handbooks, or are conference proceedings. There have been collaborative initiatives that aimed for a generic introduction, yet they have not made it to the writing stage. Problems to overcome with such an endeavour—aside from the difficult task of finding time to write it—are, mainly, to answer the questions of 1) _which topics should an introductory textbook on ontology engineering cover?_ and 2) _how comprehensive should an introduction be?_ The answer to the first question is different for the different audiences, in particular with respect to emphases of one topic or another and the order of things. The intended audience for this textbook are people at the level of advanced undergraduate and early postgraduate studies in computer science. This entails, for instance, that I assume the reader will know what UML class diagrams and databases are. As computing degrees seem to have a tendency to have become less theoretical, a solid background in logic, reasoning, and computational complexity is not expected, so a gentle introduction (or recap, as it may be) of the core concepts is provided. There are no lengthy philosophical debates in any of the chapters, but philosophical aspects are presented and discussed mainly only insofar as they are known to affect the engineering side. There still will be sections of interest for philosophers and domain experts, but they may prefer to work through the chapters in a different order (see ‘how to use the book’). 

As to how comprehensive an introduction to ontology engineering should be, there is no good answer. At least for this first version, the aim is for a semester-long course, where each chapter can be covered in a week and does not require too much reading of core material, with the core material being the contents of the chapter. For an introductory course at undergraduate level, the citations in the text may be ignored, but it serves to read 1-3 scientific papers per chapter for more detail, especially if this book is used in a postgraduate course. This makes also sense in the light that ontology engineering is still an active field of research—hence, some basics may change still—and it allows for flexibility in a course programme so as to emphasise one topic more than another, as the lecturer may prefer. The in-text 

ix 

references also may help students to start reading scientific papers when they are working on their assignments, as a place to start the consultation of the literature. I hope I have succeeded in striking a good balance on topics & depth in the first two blocks of the textbook. Suggestions for improvement are welcome. (Knowing that ontologists can be a quite critical group, perhaps I should add to that: _antes de criticarme, intenta superarme_ , i.e., before you criticise me, try to do a better job at writing an ontology engineering textbook than me.) 

The contents of the textbook was written by gradually improving, extending, and further updating material that started with blog posts in 2009 for the European Masters in Computational Logic’s Semantic Web Technologies course I taught at the Free University of Bozen-Bolzano, Italy, in 2009/2010, with the hope of generating and facilitating online discussions. That failed miserably, but the posts were visited often. The blogposts were reworked into short syllabi for the Ontology Engineering courses at the University of Havana and University of Computer Science, Cuba, in 2010 and at the Masters Ontology Winter School 2010 in South Africa, which, in turn, were reworked into the COMP718/720 lecture notes at the University of KwaZulu-Natal and the Ontology Engineering honours course lecture notes at the University of Cape Town, South Africa, of which the latest version was in 2015. All those chapters have been updated for this textbook, new material added, and course-specific data has been removed. I had put a CC BY-NC-SA licence on those 2015 lecture notes, so therefore this book has that Creative Commons licence as well. If you think this sounds problematic: it probably is not; if in doubt, please contact me. 

Some contents of this book or associated exercises are adapted from slides or tutorials made by other people, and I would like to thank them for having made that material available for use and reuse. They are (in alphabetic order) Jos de Bruijn, Diego Calvanese, Nicola Guarino, Matthew Horridge, Ian Horrocks, Markus Kr¨otzsch, Tommie Meyer, Mariano Rodr´ıguez-Muro, Frantiˇsek Simanˇc´ık, Umberto Straccia, and David Toman. I also would like to thank the students who were enrolled in any of the aforementioned courses, who provided feedback on the blog posts and lecture notes, and assisted me in fine-tuning where more or less explanations and exercises were deemed useful. 

For the rest, it was a lot of hard work, with a few encouragements by some academics who appreciated sections of the lecture notes (thank you!) and some I-ignore-that-advice by others who told me it’s a waste of time because one cannot score brownie points with a textbook anyway. The most enjoyable of all the sessions of updating the contents was the increment from the 2015 lecture notes to the first full draft of the textbook, which was at Consuelo’s _casa particular_ in La Habana in June 2018 and interspersed with a few casino (salsa) lessons to stretch the legs and get-togethers with acquaintances and colleagues. 

Cape Town, South Africa July, 2018 

C. Maria Keet 

x 

### How to use the book 

### **Aims and Synopsis** 

The principal aim of this textbook is to provide the student with a comprehensive introductory overview of ontology engineering. A secondary aim is to provide hands-on experience in ontology development that illustrate the theory, such as language features, automated reasoning, and top-down and bottom-up ontology development with methods and methodologies. 

This textbook covers material such that, upon completion, the student: 

- (i) has a general understanding of the notion of what ontologies and knowledge bases are, what they can be used for, how, and when not; 

- (ii) has obtained an understanding of the, currently, main ontology languages— OWL and its underlying Description Logics languages—in order to represent the knowledge in ontologies formally and to reason over them, and have a basic understanding of what an automated reasoner does; 

- (iii) can confidently use an Ontology Development Environment; 

- (iv) can confidently use methods and methodologies to develop ontologies, including the top-down approach with foundational ontologies and bottom-up using non-ontological resources such as relational databases, natural language or thesauri; and 

- (v) has become acquainted with several major applications and application scenarios, such as the Semantic Web Technologies for ontologies, and has had a taste of the research trends in the 

Interwoven in the aims is skills development for a 4th year/honours project or masters dissertation. The students will become familiar with reading scientific literature and will gain experience in report writing and presenting their work to their peers, in particular when carrying out the two suggested assignments. 

xi 

_How to use the book_ 

xii 

### **Content at a glance** 

The chapters are structured such that one could cover one chapter per week for a semester-long course with, depending on one’s interest, e.g., to spread Chapter 6 over two lectures or elaborate more on Chapter 5. 

1. _Chapter 1: Introduction._ The introductory chapter addresses differences between databases and knowledge bases, conceptual data models and ontologies, what an ontology is (and is not), and takes a sampling of application areas, such as the Semantic Web and data integration. 

##### 2. **Block 1: Logic foundations for ontologies** 

- (a) _Chapter 2: First order logic and automated reasoning._ This chapter provides a recap of the basics of first order predicate logic, including the notion of model-theoretic semantics. The second part introduces the principles of reasoning over a logical theory, and tableau reasoning in particular. 

- (b) _Chapter 3: Description Logics._ This chapter is devoted to a gentle introduction to the basics of Description Logics, which are a family of languages that are decidable fragments of FOL and lie at the basis of most ‘species’ of the World Wide Web consortium’s standardised Web Ontology Language OWL. Tableau reasoning returns and is adapted to the DL setting. 

- (c) _Chapter 4: The web ontology language OWL and Automated Reasoning._ The chapter starts with a few historical notes to put the language(s) into context, and proceeds with OWL 2 and its computationally better behaved profiles. In addition, we take a look at the principal automated reasoning services for (OWL) ontologies, such as satisfiability checking and classification and how this works in the currently available software. It has a short recap on computational complexity to appreciate the trade-offs between language features and scalable applications, and closes with a note on the broader context of the Semantic Web on the one hand, and more expressive logics on the other. 

##### 3. **Block 2: Developing good ontologies** 

- (a) _Chapter 5: Methods and Methodologies._ This chapter starts with a sampling of methodologies to structure the process of actually developing an ontology. Drilling down into some detail, this also requires several methods to improve an ontology’s quality, which, to some extent, use the automated reasoner to the developer’s benefit as well as some philosophical notions. 

- (b) _Chapter 6: Top-down Ontology Development._ One step of ontology development is the use of foundational ontologies and their formalisations. 

_How to use the book_ 

xiii 

We shall have a look at some typical content of foundational ontologies and look at how they represent things differently from conceptual modelling practice so as to foster interoperability. Several foundational ontologies will pass the revue. As part-whole relations are deemed very important in ontology development, both its foundations as well as some practical guidance on its use as discussed. 

- (c) _Chapter_ **??** _: Bottom-up Ontology Development._ In addition to starting from ‘above’ with a foundational ontology, one can reuse legacy material to generate candidate classes and relations to speed up populating an ontology. In particular, we will look at relational databases, thesauri (including SKOS), spreadsheets, and natural language processing. It also introduces ontology design patterns. 

##### 4. **Block 3: Advanced Topics** 

This block contains a small selection of advanced topics, which assume that the contents of Block I and Block II are understood. 

- (a) _Chapter 8: Ontology-Based Data Access._ Due to various usage scenarios, there is a need to maintain the link between the data and the knowledge, such as in scientific workflows or _in silico_ biology and enhanced user and content management in e-learning applications. For scalability purposes, one connects a database to an ontology so that one can query the database ‘intelligently’ through the ontology. The chapter starts with a motivation and design choices and then proceeds to one such instantiation with (roughly) OWL 2 QL, a mapping layer, and a relational database. 

- (b) _Chapter 9: Ontologies and natural language._ This chapter considers two principal interactions between ontologies and natural language: dealing with the internationalisation and localisation of ontologies, and a natural language interface to ontology by means of a controlled natural language to render the axioms readable for domain experts. 

- (c) _Chapter 10: Advanced modelling with additional language features._ There are various extensions to the ‘basic’ ontology languages and reasoning services to cater for additional knowledge that needs to be represented, such as vagueness, uncertainty, and temporal aspects of a subject domain. The chapter touches upon fuzzy and rough ontologies and considers briefly a temporal DL that, albeit impractical at present, does solve a range of modelling issues. 

- (d) _Chapter 11: Ontology modularisation._ Production-level ontologies may become very large, and an approach to deal with that is to modularise the ontology into multiple smaller ones. This chapter will take a look at the foundations of the landscape of ontology modules, such as the purposes they are made for, their types, and characteristics, how to determine what good modules are. 

_How to use the book_ 

xiv 

While the textbook is aimed at advanced undergraduate/early postgraduate level for people studying for a degree in, or with a background in, computer science, it can be used differently. For instance, one may be a logician and wonder what those philosophers are going on about, or are unfamiliar with the ‘hands in the mud’ of some bio-ontologies project and wants to gain an appreciation of those efforts. In that case, it would be better to commence with Block II and just consult Block I as/if the need arise. Conversely, if one has tried to develop an ontology and ‘fights’ with the reasoner or cannot represent the things one would like, then commence with Block I, which will provide some answers to solve such issues. In any case, the material of both Block I and Block II are prerequisites for the advanced topics in Block III. The three chapters in Block III can be done in order of preference, or just a subset thereof, since they do not depend on each other. 

Supporting materials are available online at the book’s webpage at `https: //people.cs.uct.ac.za/~mkeet/OEbook/` , which consist mainly of: 

- ontologies that are used in the exercises, to inspect, modify, and explore sample answers; 

- software to assist with various tasks of developing ontologies; 

- supporting documentation, such as slides and instructions for how to read the book—in particular the Description Logic axioms—when visually impaired. 

### **Assessment** 

There are review questions at the end of each chapter, whose answers can be found in the text of that chapter. Exercises are intended to obtain practical hands-on experiences and sometimes challenge the student. A selection of the exercises’ answers is included in the appendix, which is indicated with an “*” at the end of the question. Assignments require the student to integrate the material and, especially for the mini-project, delve deeper into a specific sub-topic. 

There can be several assessment modes for a final mark of a course. I have used mainly the following format, but one can choose differently: 

- A test (exam) at the end of the course [50%] 

- A practical assignment due some time half-way the course duration [20%] 

- Mini-project due at the end of the course [30%] 

Students had to submit something for each component in order to have a chance to pass the course. 

### CHAPTER 1 

### Introduction 

This chapter introduces ontologies: what they are (roughly), what they are used for, and describes a few success stories where they have been instrumental at solving problems. Where and how an ontology can solve problems is not of the variety “when you have only a hammer, everything looks like a nail”, but where the use of an ontology was _the_ solution to a particular problem, or at least an essential ingredient of it. To place “ontologies” in its right context, the first two questions one has to ask and answer are: 

- What is an ontology? 

- What is it good for? (or: what problems does it solve?) 

A short, informal, and very concrete way to clarify what “an ontology” is in computing—in analogy a the first mention of a relational database—is that it is a text file containing structured knowledge about a particular subject domain. Of course, a relational database with its management system is a lot more than ‘just a text file’, and likewise there’s more to “an ontology”, even from this practical engineering perspective. Such a file is used as a component of a so-called ‘intelligent’ information system. Fancy marketing talk may speak of some of those **ontology-driven information systems** as “like a database, _on steroids_ !” and similar. Ontologies have been, and are being, used to solve data integration problems by providing the _common, agreed-upon vocabulary_ and the _constraints among them_ , which is then used in a way so that the software understands that, say, an entity Student of a relational database _DB_ 1 actually means the same thing as AdvancedLearners in some application software _OO_ 2. Tools can then be developed to link up those two applications and exchange information smoothly thanks to the shared vocabulary. Over time, people figured out other ways to use ontologies and contribute to solving entirely different problems. For instance, a questionanswering system that lets the scientist chat with a library chatterbot to more easily find relevant literature (compared to string and keyword matching), automatically find a few theoretically feasible candidate rubber molecules out of very 

1 

_Chapter 1. Introduction_ 

2 

many (compared to painstaking trial-and-error work in the laboratory), and automated discovery of a new enzyme (outperforming the human experts!). Thus, the text in that text file somehow has meaning and there are tools that can process that, which therewith can improve in various ways the regular software you have encountered and developed in your undergraduate studies. 

In the next section (Section 1.1), we have a quick peek at what an ontology— the artefact—looks like, and proceed to the more and less pedantic viewpoints of defining what an ontology is with respect to the content (Section 1.2). We will then look at the original motivations why ontologies were taken up in computing & IT and look at a few examples of other uses and what may be considered as some of the success stories (Section 1.3). Lots of new terms are introduced in this chapter that are fleshed out in much more detail in subsequent chapters. Therefore, it is probably useful to revisit this chapter later on—and don’t be put off if it is not all clear immediately and raises many questions now! In fact, it should raise questions, which hopefully will motivate you to want to have them answered, which indeed will be in the subsequent chapters. 

### **1.1 What does an ontology look like?** 

Most of you may only vaguely have heard of ‘ontologies’, or not at all. Instead of delving into the theory straight away, we’ll have a quick look at the artefact, to show that, practically in computing and intelligent software development, it is an object one can play with and manipulate. The actual artefact can appear in multiple formats that are tailored to the intended user, but at the heart of it, there is a logic-based representation that the computer can process. Let us take as example the African Wildlife Ontology (AWO), which is a so-called ‘tutorial ontology’ that will return in the exercises. The AWO contains knowledge about wildlife, such as that giraffes eat leaves and twigs, that they are herbivores, that herbivores are animals, and so on. A mathematician may prefer to represent such knowledge with first order predicate logic. For instance: 



that states that “all lions eat herbivores, and they also eat some impalas”. This axiom may be one of the axioms in the ontology. One can represent the same knowledge also in logics other than plain vanilla first order logic. For instance, in a **Description Logic** language, we have the same knowledge formally represented as: 



A domain expert, however, typically will prefer a more user-friendly rendering, such as an automatically generated (pseudo-)natural language sentence, e.g.: 

Each lion eats only herbivore and eats some Impala 

where the first “ _∀_ ” in equation 1.1 is verbalised as Each and the second one as only, the “ _∧_ ” as and, and the “ _∃_ ” as some. Another option is to use a graphical language that is more or less precise in showing the knowledge, as shown in Figure 1.1. 



<!-- Start of picture text -->
*@ Impala<br>|—® lion | ~<br><!-- End of picture text -->







<!-- Start of picture text -->
[<2| => [© AfricanWildlifeOntology2 & Q<br>Active Ontology Entities Classes Object Properties DataProperties Individuals ©OWLViz DLQuery OntoGraf<br>Class hierarchy: lion Dees<br>[es [is] [3] Annotations<br>y @animal fe comment<br>@lmpala “Lions are animals that eat only herbivores.”<br>©Omnivore<br>@RockDassie<br>@Warthog<br>carnivore -<br>@ giraffe<br>» Gherbivore Equivalent classes ®<br>v @plant Supercl<br>@CarnivorousPlant :—<br>@Grass @animal<br>SPalmtree : @eats only herbivore<br>tasty-p ant 7 @eats some Impala 4<br>vv<br>To use the reasoner click Reasoner->Start reasoner [¥ Show Inferences a<br><!-- End of picture text -->



<!-- Start of picture text -->
4 “Stu f ” ==aH|Domain “xa<br>“Things” Relationships |H ApplicDom a tionsin \ Ey5<br>| Functional 3<br>H Domain 8<br><!-- End of picture text -->

_Chapter 1. Introduction_ 

6 

come across this in the scientific literature. The most quoted (but problematic!) definition is the following one by Tom Gruber: 

**Definition 1.1** ([Gru93]) **.** _An ontology is a specification of a conceptualization._ 

You may see this quote especially in older scientific literature on ontologies, but it has been superseded by other, more precise ones, for Gruber’s definition is unsatisfactory for several reasons: what is a “conceptualization” exactly, and what is a “specification”? Using two nebulous terms to describe a third one does not clarify matters. A proposed refinement to address these two questions is the following one: 

**Definition 1.2** ([SBF98]) **.** _An ontology is a formal, explicit specification of a shared conceptualization._ 

However, this still leaves us with the questions as to what a “conceptualization” is and what a “formal, explicit specification” is, and why and how “shared”? Is it shared enough when, say, you and I agree on the knowledge represented in the ontology, or do we need a third one or a whole group to support it? A comprehensive definition is given in Guarino’s landmark paper on ontologies [Gua98] (revisited in [GOS09]): 

**Definition 1.3** ([Gua98]) **.** _An ontology is a logical theory accounting for the_ intended meaning _of a formal vocabulary, i.e. its_ ontological commitment _to a particular_ conceptualization _of the world. The intended models of a logical language using such a vocabulary are constrained by its ontological commitment. An ontology indirectly reflects this commitment (and the underlying conceptualization) by approximating these intended models._ 

A broader scope is also described in [Gua09], and a more recent overview about definitions of “an ontology” versus Ontology in philosophy can be found in [GOS09], which refines in a step-wise and more precise fashion Definitions 1.2 and 1.3. It is still not free of debate [Neu17], though, and it is a bit of a mouthful as definition. A simpler definition is given by the developers of the World Wide Web Consortium’s standardised ontology language OWL<sup>6</sup> : 

**Definition 1.4** ([HPSvH03]) **.** _An ontology being equivalent to a Description Logic knowledge base._ 

That last definition has a different issue, and is unduly restrictive, because 1) it surely is possible to have an ontology that is represented in another logic language (OBO format, Common Logic, etc.) and 2) then formalising a thesaurus as a “Description Logic knowledge base” (or: in OWL) also ends up as a simple ‘lightweight ontology’ (e.g., the NCI thesaurus as cancer ‘ontology’) and a conceptual data model in EER or UML that is translated into OWL becomes an ‘application ontology’ or ‘operational ontology’ by virtue of it being formalised in OWL. But, as we saw above, there are differences between the two. 

> 6Note: we will go into some detail of OWL, Description Logics, and knowledge bases in Chapters 3 and 4. 

_1.2. What is an ontology?_ 

7 

For better or worse, currently, and in the context of the most prominent application area of ontologies—the **Semantic Web** —the tendency is toward it being equivalent to a logical theory, and a Description Logics knowledge base in particular (Definition 1.4). Ontologists at least frown when someone calls ‘a thesaurus in OWL’ or ‘an ER diagram in OWL’ ontologies, but even aside from that: the blurring of the distinctions between the different artefacts is problematic for various reasons (discussed in later chapters), and one should note the fact that just because something is represented in OWL does not make it an ontology, just like that something that is represented in a language other than OWL may well be an ontology. 

#### **1.2.2 Some philosophical notes on ontologies** 

The previous section mentioned that the definition would have to survive the philosophers’ scrutiny. But why so? The reason for that is that ‘ontologies’ in computer science did not come out of nowhere. Philosophers are in the picture because the term ‘ontology’ is taken from philosophy, where it has a millennia-old history, and one uses insights emanating from philosophy when developing good ontologies. When we refer to that philosophical notion, we use **Ontology** , with a capital ‘O’, and it does not have a plural. Orthogonal to the definition game, there are discussions about what is actually represented in an ontology, i.e., its contents, from a philosophical perspective. 

One debate is about ontology as a representation of a conceptualisation— roughly: things you are thinking of—and as a representation of reality. Practically, whether that is a relevant topic may depend on the subject domain for which you would be developing an ontology. If you represent formally the knowledge about, say, malaria infections, you would better represent the (best approximation of) reality, being the current state of scientific knowledge, not some divergent political or religious opinion about it, because the wrong representation can lead to wrong inferences, and therewith wrong treatments that are either ineffective or even harmful. Conversely, there are subject domains where it does not really matter much whether you represent reality or a conceptualisation thereof, or something independent of whether that exists in reality or not, or even certainly does not exist in reality. Such discussions were commonplace in computing and applications of ontologies some 10-15 years ago, but have quieted down in recent years. One such debate can be found in writing in [Mer10a, Mer10b, SC10]. Merrill [Mer10a] provides several useful clarifications. First, there is an “ _Empiricist Doctrine_ ” where “the terms of science... are to be taken to refer to actually existing entities in the real world”, such as Jacaranda tree, HIV infection and so forth, which are considered mind-independent, because HIV infections occurred also without humans thinking of it, knowing how it worked, and naming those events HIV infections. This is in contrast with the “conceptualist view according to which such terms refer to concepts (which are taken to be psychological or abstract formal entities of one sort or another)”, with concepts considered to be mind-dependent entities; prototypical examples of such mind-dependent entities are Phlogiston and Unicorn—there are no objects in the world as we know it that are phlogiston or unicorns, only 

_Chapter 1. Introduction_ 

8 

our outdated theories and fairy tale stories, respectively, about them. Second, the “ _Universalist Doctrine_ ”, which asserts “that the so-called “general terms” of science” (HIV infection etc.) “are to be understood as _referring directly to universals_ ”, with universals being “a class of mind independent entities, usually contrasted with individuals, postulated to ground and explain relations of qualitative identity and resemblance among individuals. Individuals are said to be similar in virtue of sharing universals.” [MR05]. However, philosophers do not agree on the point whether universals exist, and even if they exist, what kind of things they are. This brings the inquiring person to metaphysics, which, perhaps, is not necessarily crucial in building ontologies that are to serve information systems; e.g., it need not be relevant for developing an ontology about viruses whilst adhering to the empiricist doctrine. The philosophically inclined reader may wish to go a step further and read about interactions between Ontology and metaphysics by, e.g., [Var12]. 

There are other aspects of philosophy that can have an effect on what is represented in an ontology and how. For instance, it can help during the modelling stage, like that there’s a difference between what you are vs. the role(s) you play and between participating in an event vs. being part of an event, and help clarifying assumptions you may have about the world that may trickle into the ontology, like whether you’re convinced that the vase and the clay it is made of are the same thing or two different things. We will return to this topic in Chapter 6. 

#### **1.2.3 Good, not so good, and bad ontologies** 

Just like one can write good and bad code, one can have good and bad ontologies. Their goodness, or badness, is a bit more elaborate than with software code, however. Bad software code can be unmaintainable spaghetti code or have bugs or not even compile. For ontologies, the equivalent to ‘not compile’ is when there is a violation of the syntax. We’ll get into the syntax in Block I. The equivalent to ‘bugs’ is two-fold, as it is for software code: there can be errors in the sense that, say, a class cannot have any instances due to conflicting constraints and there can be semantic errors in that what has been represented is logically correct, but entirely unintended. For instance, that a class, say, Student somehow turns up as a subclass of Table, which it obviously should not. 

There are further intricate issues that make one ontology better than another. Some structuring choices are excluded because of ontological constraints. Let us take the example of green apples. One could formalise it as that we have apples that have the attribute green or say there are green objects that have an appleshape. Logic does not care about this distinction, but, at least intuitively, somehow, objects having the colour green seems more reasonable than green objects having an apple-shape. There are reasons for that: Apple carries an identity condition, so one can identify the object (it is a ‘sortal’), whereas Green does not (it is a value of the attribute hasColor that a thing has). Ontology helps explaining such distinctions, as we shall see in Chapter 6. 

Finally, with the interplay between the logic one uses to represent the knowledge in an ontology and the meaning of the entities in the subject domain, we can show schematically a notion of good and bad ontologies. Consider Figure 1.4. We 

_1.3. What is the usefulness of an ontology?_ 

9 

have a _good ontology_ when what we want to represent has been represented in the ontology, yet what is actually represented is very close and only slightly more than the intention; that is, we have a high precision and maximum coverage. We have a _less good ontology_ when the ontology represents quite a bit more than what it should; that is, we have a low precision and maximum coverage. Things can go wrong when we have a maximum precision, but only limited coverage, or: the ontology does not contain all that it should, hence, would be a _bad ontology_ when it can’t do what it should in our ontology-driven information system. Things are even worse if we have both a low precision and limited coverage: then it contains we don’t want in there and does not contain that should be in there. 

The interplay between precision and coverage have to do both with the language one uses for the ontology and with good modelling. This will be addressed in Block I and Block II, respectively. 



<!-- Start of picture text -->
Good Less good<br>what you<br>want to represent<br>what you do/can represent with the language<br>Universe<br>Bad Worse<br><!-- End of picture text -->

**Figure 1.4:** Good, less good, bad, and even worse ontologies. The pink circle denotes the subject domain (say, African Wildlife), the green circle denotes what’s in the ontology (say, the AWO). 

### **1.3 What is the usefulness of an ontology?** 

Now that we have some idea of ontologies, let us have a look at where they are being used. Ontologies for information systems were first proposed to contribute to solving the issues with **data integration** : an ontology provides the common vocabulary for the applications that is at one level of abstraction higher up than conceptual data models such as EER diagrams and UML Class Diagrams. Over the years, it has been used also for other purposes. We start with two distinct scenarios of data integration where ontologies play a central role, and subsequently describe other scenarios where ontologies are an important part of the solution. 

_Chapter 1. Introduction_ 

10 

#### **1.3.1 Data and information system integration** 

Figure 1.5 sketches the idea of the ontology-driven _schema-based data integration_ and Figure 1.6 further below shows an example of _data-based data integration_ that we shall elaborate on in the next two subsections. 



<!-- Start of picture text -->
PD ED Q A<br>Ontology qt ql R<br>provides the common vocabulary<br>and constraints that hold across AR<br>NAPO<br>the applications PR<br>Pantone<br>Flower Colour<br>ColourRegion<br>Colour<br>Kleur Flower<br>Conceptual model shows what is stored  Flower Height Bloem(ID) (datatype: real) color:Stringheight:inch<br>in that particular<br>Lengte<br>application ID<br>Implementation<br>the actual information  C++<br>system that stores and Database Database application<br>manipulates the data<br><!-- End of picture text -->



<!-- Start of picture text -->
Flower<br><!-- End of picture text -->



<!-- Start of picture text -->
Database<br><!-- End of picture text -->



<!-- Start of picture text -->
Database<br><!-- End of picture text -->



<!-- Start of picture text -->
C++<br>application<br><!-- End of picture text -->

**Figure 1.5:** Sketch of an ontology-based application integration scenario. Bottom: different implementations, such as relational databases and OO software; Centre: conceptual data models tailored to the application (a section of an EER, ORM, and UML diagram, respectively); Top: an ontology that provides a shared common vocabulary for interoperability among the applications. See text for explanation. 

##### **Integrating legacy systems** 

In the setting of ontology-driven schema-based (and conceptual data model-based) data integration, a typical situation is as follows. You have several databases containing data on the same topic. For instance, two universities join forces into one: each university had its own database with information about students, yet, as the new mega-university, there has to be one single database to manage the data of all students. This means that the two databases have to be integrated somehow. A similar situation occurs oftentimes in industry, especially due to mergers and acquisitions, in government due to the drive for e-Government services to the citizens of the country, or attempting to develop a software system for integrated service delivery, as well as in healthcare due to a drive for electronic health records that need to combine various systems, say, a laboratory database with the doctor’s database, among other scenarios. 

While the topic of data integration deserves its own textbook<sup>7</sup> , we focus here only on the ontology-driven aspect. Let us assume we have the relational databases 

> 7the ‘principles of...’ series may be a good start; e.g., [DHI12]. 

_1.3. What is the usefulness of an ontology?_ 

11 

and therewith at least their respective physical schemas, and possibly also the relational model and even the respective conceptual models, and also some objectoriented application software on top of the relational database. Their corresponding conceptual data models are tailored to the RDBMS/OO application and may or may not be modelled in the same conceptual data modelling language; e.g., one could be in EER, another in ORM, in UML and so forth. The example in Figure 1.5 is a sketch of such a situation about information systems of flower shops, where at the bottom of the figure we have two databases and one application that has been coded in C++. In the layer above that, there is a section of their respective conceptual data models: we have one in EER with bubble-notation, one in ORM, and one UML Class Diagram. Each conceptual data model has “Flower” and “Colour” included in some way: in the UML Class diagram, the colour is an attribute of the flower, i.e., Color _�→_ Flower _×_ `String` (that actually uses only the values of the Pantone System) and similarly in the EER diagram (but then without the data type), and in the ORM diagram the colour is a value type (unary predicate) Kleur with an additional relation to the associated datatype `colour region` in the spectrum with as data type `real` . Clearly, the notion of the flower and its colour is the same throughout, even though it is represented differently in the conceptual data models and in the implementations. It is here that the ontology comes into play, for it is _the_ place to assert exactly that underlying, agreed-upon notion. It enables one to assert that: 

- EER’s and UML diagram’s Flower and ORM’s Bloem ‘means’ _Flower_ in the domain ontology<sup>8</sup> , which is indicated with the red dashed arrows. 

- EER’s Colour, ORM’s Kleur and UML’s Color denote the same kind of thing, albeit at one time it is represented as a unary predicate (in ORM) and other times it is a binary relation with a data type, i.e., an attribute. Their ‘mappings’ to the entity in the ontology (green dashed arrows), _Colour_ , indicates that agreement. 

- There is no agreement among the conceptual models when it comes to the data type used in the application, yet they may be mapped into their respective notion in an ontology (purple dashed arrows). For instance, the _ColourRegion_ for the values of the colour(s) in the colour spectrum is a _PhysicalRegion_ , and one might say that the _PantoneSystem_ of colour encoding is an _AbstractRegion_ . 

The figure does not include names of relationships in the conceptual data model, but they obviously can be named at will; e.g., heeftKleur (‘hasColour’) in the ORM diagram. Either way, there is, from an ontological perspective, a specific type of relation between the class and its attribute: one of dependency or inherence, i.e., that specific colour instance depends on the existence of the flower, for if that particular flower does not exist, then that specific instance of colour does not exist either. An ontology can provide those generic relations, too. In the sketch, this happens to be the _qt_ relationship between enduring objects (like flowers) and the qualities they have (like their colour), and from the quality to the value regions 

> 8that in this case is linked to a _foundational ontology_ , DOLCE, and there it is a subclass of a Non-Agentive Physical Object; we return to this in Block II 



<!-- Start of picture text -->
3N 5]ao5] a$<br>> 22s 2<br>— S| Oo} = 2<br>> al al oi e © ©<br>r gi 2@ss7 aie<br>o. a SEs as =<br>n = Qqarrr E Uv ><br>° Q £o 3<br>6 3 E 588 ;<br>a so S = z:G<br>Ra g 2 53)oO |3/8<br>”3 qosqa< ®-3%S 2=<Soo 88/3<br>a EE ee) jae<br>S 237o| 5) E zofa§SO0§ oga|tua e\e|ole<br>o tle} oul oSS55 S\5<br>aa & 2 ts) 2 Psi EEaD0a g/oSs<br>é alg& 8Q| =ass)5 Sees!gee [ole8<br>® =||8 =| x} S| & Seoed B\E<br>4 3} | 4 | a] c} @ a7ss 3/2<br>3 s. g a3) (s|Se saurlos]8 Sar(eoss| laso<br>_ as a8 S| 2 ASIII B||©<br>53 a ao BA go =| 3 | gl Salalo ae<br>3 sf. 2aa wo > —q uy & be Oe Lie Lie al Bi] S<br>£& 3 F3$835OFo29te82si/C}§] /8/2/8fa ye) Oo3 Tol345OO}Fl ee) 82 | |S Se lalallala  cicleclee|| Sl5|5}5|||}3) /vla Bi]|i] SO<br>2 {8 3/5—— 3= 8c 8 ‘a<br>a.8 £wo 5o Ssgaa2 x::|=| =<br>5£ a 2 e 6<br>8/|s Bz < a § Sr} |<br>7 2 = Fs fe)<br>0 c ]<br><!-- End of picture text -->



<!-- Start of picture text -->
7 2 = Fs<br>Bua4a Yuou 0 a 533c =<br>otov 2ca ZN<br>=a we . i. a<br>a E a u w“ —oa4rdoa4rda4rdrd —o34o3434 +0AA<br>=>se o>ee abeus>us> || eS2sve>e eS2sve>eve>e<br>Fe EZ oFe orzo ©<br>ae 5u Ecu Ecta<br>ac us ae oat peu<br>£63.2 = e+== i=eeee 2<br>Poe = = a<br>osee. QS<br><!-- End of picture text -->



<!-- Start of picture text -->
ZN 7<br>. i. a 7<br>—oa4rdoa4rda4rdrd —o34o3434 +0AA A s<br>abeus>us> || eS2sve>e eS2sve>eve>e<br>oFe orzo ©<br>Ecu Ecta<br>oat peu<br>e+== i=eeee 2 Nv.‘<br>= = a \<br>QS \\<br>Cd am al = \<br>a.a Peato> |4lo @ 1|8Sar<br>8 |e |Bagl. § ar<br>a a Worole «a lsc<br>~ ®|S |GA|Oogplaa] PB@ IIsan<br>§ 18 |Bogls * Be<br>°% 9se 19|@ | @5qRaola &» | a53<br>(7)®@&® |e|Oe/TOXR|®onlseo;s_|ZOUa|y -Aa ! 0a~<br>® |odl\gnale a a4<br>3 7 |Falgo -Jo 8 Vyas<br>Pond 2 AlBOd|o 4 lias<br>o co] ~'s ool @® NO<br>x MW0 |delaaolevPi~ alo =>» pier=><br>>ce atal amoOl}nono;]QAA DIO a lid<br>o mo |dalm>molH oO<br>fe]a ga©Glee|ocloog|/UcCHjodg|adada|a-sa(888/23. | SalisAyBy<br><== Bl2al/O*|Bda/ES. Add oc a SSa a wolRS<br>ec a o|aAlawl|oo: “AqedO-d 8 Or\/hooo re)<br>O Im]216a2/8)sJawnlowelocoo|anadAMYUISS/SCCO|Ptel|ooloootlHDMlANM|O#OAHSha EllB  slowBIGAGCSa ad oO |ied7m<br>a ad s8lesieses/aueed ee oo gizeomeAY<br>g F wy,<br>21g |e 8<br>giaq |2 4(3 iw aii<br>alg ls [8 8<br><!-- End of picture text -->

_1.3. What is the usefulness of an ontology?_ 

13 

(more precisely: qualia), the relation is called _ql_ in Figure 1.5. 

Although having established such links does not complete the data integration, it is the crucial step—the rest has become, by now, largely an engineering exercise. 

##### **Data-level data integration** 

While in computer science the aforementioned approach to data integration was under investigation, domain experts in molecular biology needed a quick and practical solution to the data integration problem, urgently. Having noticed the idea of ontologies, they came up with another approach, being interoperability at the instance-level, tuple-by-tuple, or even cell-by-cell, and that with multiple databases over the Internet instead of the typical scenario of RDBMSs within an organisation. This can be achieved with lightweight ontologies, or **structured controlled vocabularies** . 

The basic idea is illustrated in Figure 1.6. There are multiple databases, which in the figure are the KEGG and InterPro databases. In the KEGG database, there is a tuple with as key `K01834` and it has several attributes (columns in the table in the relational database), such as the name ( `gpmA` ), and further down in the display there is an attribute `Other DBs` , which has as entry `GO:0004619` ; i.e., there is a tuple in the table along the line of _⟨_ `K01834, ..., GO:0004619` _⟩_ . In the InterPro database, we have a similar story but then for the entity with the key `IPR005995` , where there is a section “GO Term Annotation” with an attribute `function` that has `GO:0004619` ; i.e., a tuple _⟨_ `IPR005995, ..., GO:0004619` _⟩_ . That is, they are clearly distinct tuples—each with their separate identifier from a different identifier scheme, with different attributes, one physically stored in a database in Japan and the other in the USA—yet they actually talk about the same thing: `GO:0004619` , which is the identifier for Phosphoglycerate Mutase Activity. 

The “GO:0004619” is an identifier for a third artefact: a class in the Gene Ontology (GO) [Gen00]. The GO is a structured controlled vocabulary that contains the concepts and their relationship that the domain experts agree upon to annotate genes with; the GO contains over 40000 concepts by now. The curators of the two databases each annotated their entity with a term from the GO, and thereby they assert they have to do with that same thing, and therewith have created an entitylevel linking and interoperability through the GO. Practically, on top of that, these fields are hyperlinked (in the soft copy: blue text in KEGG and green underlined text in the screenshot of the InterPro entry), so that a vast network of data-level interlinked databases has been created. Also, the GO term is hyperlinked to the GO file online, and in this way, you can browse from database to database availing of the terms in the ontology without actually realising they are wholly different databases. Instead, they appear like one vast network of knowledge. 

There are many more such ontologies, and several thousand databases that are connected in this way, not only thanks to ontologies, but where the ontology serves as the essential ingredient to the data integration. Some scientific journals require the authors to use those terms from the ontologies when they write about their discoveries, so that one more easily can find papers about the same entity<sup>9</sup> . 

> 9It used to be a sport among geneticists to come up with cool names for the genes they 

_Chapter 1. Introduction_ 

14 

##### **Trying to prevent interoperability problems** 

A related topic in the data integration scenarios, is trying to _prevent_ the integration problems form happening in the first place. This may be done though generating conceptual models for related new applications based on the knowledge represented in the ontology [EGOMA06, JDM03, SS06]. This is a bit alike the Enterprise Models you may have come across in information system design. In this way, interoperability is guaranteed upfront because the elements in the new conceptual data models are already shared thanks to the link with the same ontology. For instance, some relation R between A and B, as is depicted in Figure 1.7 (e.g., an enrols relation between Student and Course), is reused across the conceptual data models, yet each model may have its own additional constraints and data types for attributes. For instance, in one university (hence, student information management system), students may not register for more than six courses and have to be registered for at least one to count as student, whereas at another university, a student may well decide not to be registered for any course at a particular time during the year and still count as a registered student. Whichever rules there may be at each individual university, the systems do agree on the notions of Student, Course, and enrols. Thus, the ontology provides the shared common vocabulary for interoperability among the applications. 



<!-- Start of picture text -->
1 1..*<br>Ontology: UML Class Diagram 1: A B<br>R<br>* R *<br>A UML Class Diagram 2: A B B<br>B att1: String<br>generate ... att2: Integer<br>R 1 R *<br>UML Class Diagram  n : A B B<br>att1: String<br>att2: Real<br><!-- End of picture text -->

**Figure 1.7:** Basic illustration of taking information from an ontology and using it for several conceptual data models (here: UML Class Diagrams), where the constraints may be refined or attributes added, yet sharing the semantics of A, B, and R. 

#### **1.3.2 Ontologies as part of a solution to other problems** 

Over the years, ontologies have been shown to be useful in a myriad of other application scenarios; among others, negotiation between software services, mediation between software agents, bringing more quality criteria into conceptual data modelling to develop a better model (hence, a better quality software system), orchestrating the components in semantic scientific workflows, e-learning, ontology-based data access, information retrieval, management of digital libraries, improving the accuracy of question answering systems, and annotation and analysis of electronic health records, to name but a few. Four of them are briefly illustrated in this section. 

discovered (e.g., “Sonic hedgehog”); when a gene was independently recovered, each research team typically had given the gene a different name, which can end up as a Tower of Babel of its own that hampered progress in science. The GO and similar ontologies resolve that issue. 

_1.3. What is the usefulness of an ontology?_ 

15 

##### **e-Learning** 

The ‘old-fashioned’ way of e-learning is a so-called content-push: the lecturer sends out softcopies of the notes, slides, answers to the solutions, and perhaps the video recordings of the lectures, and the student consumes it. This is a one-size-fits-all approach regardless the student’s background with acquired knowledge and skills, and learning preferences and habits, which cannot be assumed to be homogeneous in an e-learning setting, or at least much less so than with respect to your fellow students in the ontology engineering class. A more sophisticated way for e-learning is _adaptive e-learning_ , which tailors the contents to the student based on prior knowledge and learning habits. To be able to automatically tailor the offering to the student, one has to develop a ‘smart’ e-learning application that can figure out what kind of student is enrolled. Put differently: students have certain properties (part-time/full-time student, age, undergraduate degree, etc.), the learning objects have to be annotated (by skill level and topic), and user logs have to be categorised according to type of learning pattern, and based on that the material and presentation can be adjusted, like skipping the section on first order logic and delve deeper into, or spend more time on, ontology engineering and modelling if you have a mathematics background, whereas a philosopher may crave for more content about foundational ontologies but skip reverse engineering of relational databases, or offer a student more exercises on a topic s/he had difficulties with. This requires **knowledge representation** —of the study material, questions, answers, students’ attributes, learning approaches—and **automated reasoning** to classify usage pattern and student, and annotated content, i.e., using ontologies and knowledge bases to make it work solidly and in a repeatable way. See, e.g., [HDN04] as a start for more details on this topic. 

##### **Deep question answering with Watson** 

Watson<sup>10</sup> is a sophisticated question answering engine that finds answers to trivia/general knowledge questions for the _Jeopardy!_ TV quiz that, in the end, did consistently outperform the human experts of the game. For instance, a question could be “who is the president of South Africa?”: we need algorithms to parse the question, such as that ‘who’ indicates the answer has to be a person and a named entity, it needs to be capable to detect that South Africa is a country and what a country is, and so on, and then have some kind of a look-up service in knowledge bases and/or natural language documents to somehow find the answer by relating ‘president’, ‘South Africa’ and ‘Cyril Ramaphosa’ and that he is the current president of the country. An ontology can then be used in the algorithms of both the understanding of the question and finding the right answer<sup>11</sup> and integrating data sources and knowledge, alongside natural language processing, statistical analysis and so on, comprising more than 100 different techniques<sup>12</sup> . Thus, a key aspect of 

> 10 `http://en.wikipedia.org/wiki/Watson_(computer)` 

> 11 On a much more modest scale, as well as easier accessible and shorter to read, Vila and Ferr´andez describe this principle and demonstrated benefits for their Spanish language based question-answering system in the agricultural domain [VF09]. 

> 12 `ftp://public.dhe.ibm.com/common/ssi/ecm/en/pow03061usen/POW03061USEN.PDF` 

_Chapter 1. Introduction_ 

16 

the system’s development was that one cannot go in a linear fashion from natural language to knowledge management, but have to use an integration of various technologies, including ontologies, to make a successful tool. 

##### **Digital humanities** 

Some historians and anthropologists in the humanities try to investigate what happened in the Mediterranean basin some 2000 years ago, aiming to understand food distribution systems. Food was stored in pots (more precisely: an amphora) that had engravings on it with text about who, what, where etc. and a lot of that has been investigated, documented, and stored in multiple resources, such as in databases. None of the resources cover all data points, but to advance research and understanding about it and food trading systems in general, it has to be combined and made easily accessible to the domain experts. That is, essentially it is an instance of a data access and integration problem. Also, humanities researchers are not at all familiar with writing SQL queries, so that would need to be resolved as well, and in a flexible way so that they would not have to be dependent on the availability of a system administrator. 

A recent approach, of which the technologies have been maturing, is OntologyBased Data Access (OBDA). The general idea of OBDA applied to the Roman Empire Food system is shown in Figure 1.8. There are the data sources, which are federated (one ‘middle layer’, though still at the implementation level). The federated interface has mapping assertions to elements in the ontology. The user then can use the terms of the ontology (classes and their relations and attributes) to query the data, without having to know about how the data is stored and without having to write page-long SQL queries. For instance, a query “Retrieve inscriptions on amphorae found in the city of ‘Mainz’ containing the text ‘PNN’.” would use just the terms in the ontology, say, Inscription, Amphora, City, found in, and inscribed on, and any value constraint added (like the PNN), and the OBDA system takes care of the rest to return the answer. 

More high-level details of the system are described in [CLM<sup>+</sup> 16] and we will look at its technicalities in Chapter 8. 

##### **Semantic** 

Due to the increase in a variety of equipment, their speed, and decreasing price, scientists are generating more data than ever, and are collaborating more. This data has to be analysed and managed. In the early days, and, to some extent, to this day, many one-off little tools were developed, or simply scripted together with PERL, Ruby on Rails, or Python, used once or a few times and then left for what it was. This greatly hampers repeatability of experiments, insight in the provenance of the data, and does not quite follow a methodological approach for so-called _in silico_ biology research. Over the past 10 years, comprehensive software and hardware infrastructures have been, and are being, built to fix these and related problems. Those IT ‘workbenches’ (as opposed to the physical ones in the labs) are realised in _semantic scientific workflow systems_ . An example of a virtual 



<!-- Start of picture text -->
G g5 4<br>‘EPNetDB —- EDH " Pleiades<br><!-- End of picture text -->



<!-- Start of picture text -->
Ontologies Models Services Algorithms Workflows<br><!-- End of picture text -->



<!-- Start of picture text -->
APPLICATION LAYER<br>Les | paey we? Data w semantic Selectit Enact DM U<br>2 annotations ea id —_* Results oer<br>oO Task soecs workflow workflow Feedback<br>Domain= bial,<br>Ontology<br>Multimedia<br>Planner-based Plan DM Ranked DM _ * Datasets<br>DM Assistant Process Workflows = Models<br>DM Toolsiu r CWorldiows<br>Meta-Miner<br>a Adjust parameters —s<br>a. of OM planner Data Mining<br>Data Mining onase Anahse DME ExperimentsRepository<br>Ontology<br>DATA MINING LAYER<br><!-- End of picture text -->

_Chapter 1. Introduction_ 

20 

cess in inferring novel biological knowledge has been achieved with classification of protein phosphatases [WSH07], precisely thanks to the expressive ontology and its automated reasoning services. 

Good quality ontologies have to built and maintained, though, and there needs to be working infrastructure for it. This textbook hopefully will help you with that. 

### **1.4 Outline and of the book usage** 

The preceding sections already indicated that several aspects would return ‘later in the course’. The order that will be followed in this book, is to commence with a recap (or brief introduction, as may be the case) of First Order Predicate Logic regarding the formalisation with syntax, semantics (what it all ‘means’, formally), and principles of automated reasoning. Full FOL is undecidable, but there are less expressive languages, i.e., fragments of FOL, that are decidable for a set of important problems in computing in the area of ontologies and knowledge bases. One such family of languages is the Description Logics (DL) family of languages. These two topics are covered in Chapter 2 and Chapter 3, respectively. Several DLs, in turn, form the basis of the W3C standardised Web Ontology Language OWL (actually, a family of languages, too). OWL specifies a computer-processable serialisation of the ontology and knowledge base, and interacts with the automated reasoners for OWL. OWL and the so-called standard reasoning services are summarised in Chapter 4. 

After these logic foundations in Block I, we shall look at how one can develop an ontology. The first approach is a so-called ‘top-down’ approach, where we use foundational ontologies with the high-level categories and relationship to get us started with the principal choices and the modelling so that a modeller does not have to reinvent the wheel; this is covered in Chapter 6. However, designing an ontology from scratch is rather cumbersome, and much information already has been represented in various ways—natural language, conceptual data models, etc.—so, one can speed up ontology development also by somehow reusing those ‘legacy’ sources, which is described in Chapter 7. Both approaches, however, are just that—not a ‘cookbook recipe’ for ontology development—and there exist interdependencies, methods, tools, and methodologies that help structure and carry out the activities, which is described in Chapter 5. One could go through Block II either in the order of Chapters 6, 7, and 5, or first Chapter 5 and then 6 and 7. 

Blocks I and II form the foundations of ontology engineering at an introductory level, and the topics that follow afterward deepen and extend that material. Block III contains a few short chapters that introduce various subtopics, which is far from exhaustive and the block is intended mainly to illustrate that there is a range of themes within ontology engineering. In one direction, you may wish to explore further some quite involved theory and technology to realise a practical ontology-driven information system, being querying databases by means of an ontology, which is the topic of Chapter 8. Ontologies are used throughout the world, and not all systems are in English, therefore we will look at the interaction of nat- 

_1.5. Exercises_ 

21 

ural language with ontologies in Chapter 9. There are extensions to the standard ontology languages, because it is perceived to be needed to be more precise in representing the subject domain. Chapter 10 touches upon the temporal, uncertain, and vague dimension. 

Depending on one’s background, one can study Block I after Block II—unless one’s knowledge of logic is a bit rusty or limited. In any case, both the material of Block I and Block II are prerequisites for Block III, advanced topics. Within Block III, the chapters can be done in order of preference, or just a subset thereof. 

This is the first version of the textbook, but essentially the fourth version of prior lecture notes, and due to time constraints, perhaps not everything that should have been in the book made it into the book. Also, because it is of an introductory nature and a reader may be interested more in one sub-topic than another, it is liberally referenced, so you more easily can look up further details. There are many references in the bibliography. You are not expected to read all of them; instead, each chapter has a “Literature and reference material” section with a small selection of recommended reading. The large reference list may be useful especially for the practical assignment (Appendix B.1) and the mini-project assignment (Appendix B.2): there are _very_ many more references in computer science conference proceedings and journals, but the ones listed, first, in the “literature and reference material” and, second, in the bibliography, will give you a useful ‘entry point’ or may even suffice, depending on the chosen topics. 

Exercises are structured along the line of review questions and then either practical exercises or further analysis questions. Some exercises refer to particular ontologies, which can be found at the book’s webpage at `https://people.cs.uct. ac.za/~mkeet/OEbook/` or the URL provided. The answers to the review questions can be found in the respective chapter. A selection of answers to the exercises is included in Appendix E. 

### **1.5 Exercises** 

**Review question 1.1.** There are several terms in the preceding sections that were highlighted in bold in the text. Find them, and try to describe them in your own words, in particular: ontology-driven information system, Ontology, ontology, and ontology engineering. 

**Review question 1.2.** List several uses of ontologies. 

**Review question 1.3.** Describe the difference between schema vs. instance-level data integration. 

**Exercise 1.1.** You may like to get a practical ‘feel’ of ontologies and how they look like in an ontology development environment. To this end, install an ODE, such as Prot´eg´e, load the `AfricanWildlifeOntology1.owl` from the book’s supplementary material page at `https://people.cs.uct.ac.za/~mkeet/OEbook/` in the tool and 

_Chapter 1. Introduction_ 

22 

browse around. Download the `AfricanWildlifeOntology1.owl` file (right-click, save as) and open it in your text editor, such as notepad. 

**Exercise 1.2.** Having inspected the `AfricanWildlifeOntology1.owl` , is it a good, less good, bad, or even worse ontology? Why? 

### **1.6 Literature and reference material** 

1. Tim Berners-Lee, James Hendler and Ora Lassila. The Semantic Web. _Scientific American Magazine_ , May 17, 2001. `http://www.sciam.com/article. cfm?id=the-semantic-web&print=true` 

2. Nicola Guarino, Daniel Oberle, and Steffen Staab. What Is An Ontology? In: S. Staab and R. Studer, _Handbook on Ontologies_ , Chapter 6. Springer. 2009. pp1-17. 

## **Part I Logic foundations for ontologies** 

23 

### CHAPTER 2 

### First order logic and automated reasoning in a nutshell 

Perhaps more foundations in modelling may be useful before delving into how to represent what you want to represent, but at the same time, one also needs to understand the language to model in. In this case, this means obtaining a basic grasp of logic-based ontology languages, which will help understanding the ontologies and ontology engineering better, and how to formalise the things one wants to represent. Therefore, we shall refresh the basics of first order logic in Section 2.1 (comprehensive introductions can be found elsewhere, e.g., [Hed04]), which is followed by a general idea of (automated) reasoning and two examples of tableau reasoning in Section 2.2. If you have had a basic course in logic from a mathematics department, you may wish to just skim over Section 2.1; my experience is that automated reasoning is typically not covered in such a mathematics or standard basic course in logic and you should therefore still engage with Section 2.2. 

### **2.1 First order logic syntax and semantics** 

Observe first that logic is not the study of truth, but of the _relationship between the truth of one statement and that of another_ . That is, in logic, we do not care whether a statement like “If angels exist then necessarily all of them fit on the head of a needle” (suitably formalised) is indeed true in reality<sup>1</sup> , but if the if-part were true (resp., false), then what does that say about the truth value of the then-part of the statement? And likewise for a whole bunch of such sentences. Others do care what is represented formally with such a logic language, but we will defer that to Block II. 

To be able to study those aspects of logic, we need a language that is unambiguous; natural language is not. You may have encountered propositional logic already, and first order predicate logic (FOL) is an extension of that, which enables us to represent more knowledge in more detail. Here, I will give only a brief 

> 1or, for that matter, whether there is a reality and whether we have access to it 

25 

_Chapter 2. First order logic and automated reasoning in a nutshell_ 

26 

glimpse of it. Eventually, you will need to be able to recognise, understand, and be able to formalise at least a little bit in FOL. Of all the definitions that will follow shortly, there are four important ideas to grasp: the _syntax_ of a language, the _model-theoretic semantics_ of a language, what a _theory_ means in the context of logic, and the notion of _deduction_ where we apply some rules to what has been represented explicitly so as to derive knowledge that was represented only implicitly. We will address each in turn. 

First, there are two principal components to consider for the language: 

- **Syntax** has to do with what ‘things’ (symbols, notations) one is allowed to use in the language and in what way; there is/are a(n): 

   - Alphabet 

   - Language constructs 

   - Sentences to assert knowledge 

- **Semantics** 

   - Formal meaning, which has to do what those sentences with the alphabet and constructs are supposed to mean. 

Their details are presented in the remainder of this section. 

#### **2.1.1 Syntax** 

The lexicon of a first order language contains the following: 

- Connectives and Parentheses: _¬_ , _→_ , _↔_ , _∧_ , _∨_ , ( and ); 

- Quantifiers: _∀_ (universal) and _∃_ (existential); 

- Variables: _x, y, z, ..._ ranging over particulars (individual objects); 

- Constants: _a, b, c, ..._ representing a specific element; 

- Functions: _f, g, h, ..._ , with arguments listed as _f_ ( _x_ 1 _, ...xn_ ); 

- Relations: _R, S, ..._ with an associated arity. 

There is an (countably infinite) supply of _symbols_ (signature): variables, functions, constants, and relations. 

In other words: we can use these things to create ‘sentences’, like we have in natural language, but then controlled and with a few extra figurines. Let us look first at how we can formalise a natural language sentence into first order logic. 

**Example 2.1.** _From Natural Language to First order logic (or vv.). Consider the following three sentences:_ 

- _“Each animal is an organism”_ 

- _“All animals are organisms”_ 

- _“If it is an animal then it is an organism”_ 

_This can be formalised as:_ 



_Observe the colour coding in the natural language sentences: ‘each’ and ‘all’ are different ways to say “∀”, the ‘is a’ and ‘are’ in the first two sentences match the “→”, and the combination of the “∀” and “→” in this particular construction can be put into natural language as ‘if ... then’._ 

_Instead of talking about all objects of a particular type, one also can assert there are at least some of them; e.g.,_ 

_2.1. First order logic syntax and semantics_ 

27 

_- “Aliens exist” could be formalised as_ 



_with the ‘exist’ matching the ∃, and_ 

- _“There are books that are heavy”_ 

- _(well, at least one of them is) as:_ 



_where the ‘there are’ is another way to talk about “∃” and the ‘that’ hides (linguistically) the “∧”. A formulation like “There is at least one book, and it is heavy” is a natural language rendering that is closer to the structure of the axiom._ 

_A sentence—or, more precisely, its precise meaning—such as “Each student must be registered for a degree programme” requires a bit more consideration. There are at least two ways to say the same thing in the way the sentence is formulated (we leave the arguments for and against each option for another time):_ 

- _i) ∀x, y_ ( _registered_ _~~f~~ or_ ( _x, y_ ) _→ Student_ ( _x_ ) _∧ DegreeProgramme_ ( _y_ )) _“if there is a registered_ _~~f~~ or relation, then the first object is a student and the second one a degree programme”_ 

   - _∀x_ ( _Student_ ( _x_ ) _→∃y registered_ _~~f~~ or_ ( _x, y_ )) 

   - _“Each student is registered for at least one y”, where the y is a degree programme (taken from the first axiom)_ 

- _ii) ∀x_ ( _Student_ ( _x_ ) _→∃y_ ( _registered_ _~~f~~ or_ ( _x, y_ ) _∧ DegreeProgramme_ ( _y_ ))) _“Each student is registered for at least one degree programme”_ 

_But all this is still just syntax (it does not say what it really means), and it looks like a ‘free for all’ on how we can use these symbols. This is, in fact, not the case, and the remainder of the definitions will make this more precise, which will be illustrated in Example 2.2 afterward. ♦_ 

There is a systematic to the axioms in the examples, with the brackets, arrows, etc. Let us put this more precisely now. We start from the basic elements and gradually build it up to more complex things. 

**Definition 2.1. (Term)** _A term is inductively defined by two rules, being:_ 

- _Every variable and constant is a term._ 

- _if f is a m-ary function and t_ 1 _, . . . tm are terms, then f_ ( _t_ 1 _, . . . , tm_ ) _is also a term._ 

**Definition 2.2. (Atomic formula)** _An_ atomic formula _is a formula that has the form t_ 1 = _t_ 2 _or R_ ( _t_ 1 _, ..., tn_ ) _where R is an n-ary relation and t_ 1 _, ..., tn are terms._ 

**Definition 2.3. (Formula)** _A string of symbols is a_ formula _of FOL if and only if it is constructed from atomic formulas by repeated applications of rules R1, R2, and R3._ 

- _R1. If φ is a formula then so is ¬φ._ 

- _R2. If φ and ψ are formulas then so is φ ∧ ψ._ 

_Chapter 2. First order logic and automated reasoning in a nutshell_ 

28 

_R3. If φ is a formula then so is ∃xφ for any variable x._ 

A _free variable_ of a formula _φ_ is that variable occurring in _φ_ that is not quantified. For instance, if _φ_ = _∀x_ ( _Loves_ ( _x, y_ )), then _y_ is the free variable, as it is not bound to a quantifier. We now can introduce the definition of _sentence_ . 

**Definition 2.4. (Sentence)** _A_ sentence _of FOL is a formula having no free variables._ 

Check that there are no free variables in the axioms in Example 2.1, i.e., they are all sentences. 

Up to this point, we have seen only a few examples with going back-and-forth between sentences in natural language and in FOL. This is by no means to only option. One can also formalise diagrams and provide logic-based reconstructions of, say, UML class diagrams in order to be precise. We can already do this with syntax introduced so far. Let’s consider again the lion eating impalas and herbivores, as was shown in Figure 1.1-B in Chapter 1. First, we ‘bump up’ the eats association end to the name of the binary relation, _eats_ . Second, noting that UML uses lookacross notation for its associations, the 1..* ‘at least one’ amounts to an existential quantification for the impalas, and the * ‘zero or more’ to a universal quantification for the herbivores. This brings us back to Eq. 1.1 from Chapter 1: 

_∀x_ ( _Lion_ ( _x_ ) _→∀y_ ( _eats_ ( _x, y_ ) _→ Herbivore_ ( _y_ )) _∧∃z_ ( _eats_ ( _x, z_ ) _∧ Impala_ ( _z_ ))) (2.4) 

Another example with different constraints is shown in Figure 2.1, which could be the start of a UML class diagram (but incomplete; notably because it has no attributes and no methods) or an abuse of notation, in that an ontology is shown diagrammatically in UML class diagram notation, as there is no official graphical language to depict ontologies. Either way, syntactically, also here the 



<!-- Start of picture text -->
4<br>Limb<br>part<br><!-- End of picture text -->



<!-- Start of picture text -->
4<br>Animal<br>part<br>{disjoint, complete}ete}ete}<br><!-- End of picture text -->



<!-- Start of picture text -->
{disjoint, complete}ete}ete}<br>Carnivore Herbivore<br><!-- End of picture text -->



<!-- Start of picture text -->
{disjoint, complete}ete}ete}<br>Herbivore<br><!-- End of picture text -->



<!-- Start of picture text -->
Omnivore<br><!-- End of picture text -->

**Figure 2.1:** A UML model that can be formally represented in FOL; see text for details. 

UML classes can be converted into unary predicates in FOL, the association is translated into a binary relation, and the multiplicity constraint turns into an existential quantification that is restricted to exactly 4 limbs<sup>2</sup> . In the interest of succinctness and convention, the latter is permitted to be abbreviated as _∃_<sup>=4</sup> . The corresponding sentence in FOL is listed in Eq. 2.5. One can dwell on the composite aggregation (the black diamond), and we will do so in a later chapter. Here, it is 

> 2There are animals that indeed do not have 4 limbs (e.g., the sirens and the Mexican mole lizard have only two limbs and the millipede _Illacme plenipes_ has 750 (the most), and there are animals with specific numbers of limbs in between, but that is beside the point as it would not change much the features used in the formalisation, just become more cluttered. 

_2.1. First order logic syntax and semantics_ 

29 

left as an association with an ‘at most one’ constraint on the whole side (Eq. 2.6), or: “if there’s a limb related to two animal instances through _whole_ , then those two instances must be the same object”. 





That is, indeed, literally talking of two references to one object. 

The ‘new’ constraints that we have not translated before yet, are the subclassing, the disjointness, and the completeness. Subclassing is the same as in Eq. 2.1, hence, we obtain Eqs. 2.7-2.9. 







Disjoint means that the intersection is empty, so it has the pattern _∀x_ ( _A_ ( _x_ ) _∧ B_ ( _x_ ) _→⊥_ ), where “ _⊥_ ” is the bottom concept/unary predicate that is always false; hence, Eq. 2.10 for the sample classes of Figure 2.1. 

Completeness over the specialisation means that all the instances of the superclass must be an instance of either of the subclasses; hence Eq. 2.11. 





These are all syntactic transformations, both by example and that informally some translation rules and a general pattern (like for disjointness) have been noted. From a software engineering viewpoint, this can be seen as a step toward a logicbased reconstruction of UML class diagrams. From a logic viewpoint, the diagram can be seen as ‘syntactic sugar’ for the axioms, which is more accessible to domain experts (non-logicians) than logic. 

This playing with syntax, however, does not say what it all _means_ . How do these sentences in FOL map to the objects in, say, the Java application (if it were a UML diagram intended as such) or to some domain of objects wherever that is represented somehow (if it were a UML diagram depicting an ontology)? And can the latter be specified a bit more precise? We shall see the theoretical answers to such question in the next section. 

#### **2.1.2 Semantics** 

Whether a sentence is true or not depends on the underlying set and the interpretation of the function, constant, and relation symbols. To this end, we have 

_Chapter 2. First order logic and automated reasoning in a nutshell_ 

30 

structures: a _structure_ consists of an _underlying set_ together with an _interpretation_ of functions, constants, and relations. Given a sentence _φ_ and a structure _M_ , _M models φ_ means that the sentence _φ_ is true with respect to _M_ . More precisely, through the following set of definitions (which will be illustrated afterward): 

**Definition 2.5. (Vocabulary)** _A_ vocabulary _V is a set of function, relation, and constant symbols._ 

**Definition 2.6. (** _V_ **-structure)** _A V-_ structure _consists of a non-empty underlying set_ ∆ _along with an interpretation of V. An interpretation of V assigns an element of_ ∆ _to each constant in V, a function from_ ∆<sup>_n_</sup> _to_ ∆ _to each n-ary function in V, and a subset of_ ∆<sup>_n_</sup> _to each n-ary relation in V. We say M is a_ structure _if it is a V-structure of some vocabulary V._ 

**Definition 2.7. (** _V_ **-formula)** _Let V be a vocabulary. A V-_ formula _is a formula in which every function, relation, and constant is in V. A V-_ sentence _is a V-formula that is a sentence._ 

When we say that _M models φ_ , denoted with _M |_ = _φ_ , this is with respect to _M_ being a _V_ -structure and _V_ -sentence _φ_ is true in _M_ . 

Model theory is about the interplay between _M_ and a set of first-order sentences _T_ ( _M_ ), which is called the _theory of M_ , and its ‘inverse’ from a set of sentences Γ to a class of structures. 

**Definition 2.8. (Theory of** _M_ **)** _For any V-structure M , the_ theory of _M , denoted with T_ ( _M_ ) _, is the set of all V-sentences φ such that M |_ = _φ._ 

**Definition 2.9. (Model)** _For any set of V-sentences, a_ model _of_ Γ _is a V- structure that models each sentence in_ Γ _. The class of all models of_ Γ _is denoted by M_ (Γ) _._ 

Now we can go to the interesting notions: _theory_ in the context of logic: 

**Definition 2.10. (Complete** _V_ **-theory)** _Let_ Γ _be a set of V-sentences. Then_ Γ _is a_ complete _V_ -theory _if, for any V-sentence φ either φ or ¬φ is in_ Γ _and it is not the case that both φ and ¬φ are in_ Γ _._ 

It can then be shown that for any _V_ -structure _M_ , _T_ ( _M_ ) is a complete _V_ -theory (for proof, see, e.g., [Hed04], p90). 

**Definition 2.11.** _A set of sentences_ Γ _is said to be_ consistent _if no contradiction can be derived from_ Γ _._ 

**Definition 2.12. (Theory)** _A_ theory _is a consistent set of sentences._ 

The latter two definitions are particularly relevant later on when we look at the typical reasoning services for ontologies. 

_2.1. First order logic syntax and semantics_ 

31 

Student **is an entity type** . DegreeProgramme **is an entity type** . Student attends DegreeProgramme. 



<!-- Start of picture text -->
Each Student attends  exactly one DegreeProgramme.<br>It is possible that more than one Student attends  the same DegreeProgramme.<br>OR, in the negative:<br>For each Student,  it is impossible that that Student attends  more than one<br>DegreeProgramme.<br>It is impossible that any Student attends  no DegreeProgramme.<br>attends<br>Student DegreeProgramme<br>               Attends<br>Student  DegreeProgramme<br>John  Computer Science<br>Mary  Design<br>Fabio  Design<br>Claudio  Computer Science<br>Markus  Biology<br>Inge  Computer Science<br><!-- End of picture text -->

**Figure 2.2:** A theory denoted in ORM notation, ORM verbalization, and some data in the database. See Example 2.2 for details. 

**Example 2.2.** _How does all this work out in practice? Let us take something quasifamiliar: a conceptual data model in Object-Role Modeling notation, depicted in the middle part of Figure 2.2, with the top-half its ‘verbalisation’ in a controlled natural language, and in the bottom-part some sample objects and the relations between them._ 

_First, we consider it as a theory, creating a logical reconstruction of the icons in the figure. There is one binary predicate,_ attends _, and there are two unary predicates,_ Student _and_ DegreeProgramme _. The binary predicate is typed, i.e., its domain and range are defined to be those two entity types, hence:_ 



_Note that x and y quantify over the whole axiom (thanks to the brackets), hence, there are no free variables, hence, it is a sentence. There are two constraints in the figure: the blob and the line over part of the rectangle, and, textually, “_ Each Student attends exactly one DegreeProgramme _” and “_ It is possible that more than one Student attends the same DegreeProgramme _”. The first constraint can be formalised (in short-hand notation):_ 



_The second one is already covered with Eq. 2.12 (it does not introduce a new constraint). So, our vocabulary is {attends, Student, DegreeProgramme}, and we have two sentences (Eq. 2.12 and Eq. 2.13). The sentences form the theory, as they are not contradicting and admit a model._ 

_Let us now consider the structure. We have a non-empty underlying set of objects:_ ∆ = _{John, Mary, Fabio, Claudia, Markus, Inge, ComputerScience, Biology, Design}. The interpretation then maps the instances in_ ∆ _with the elements in our_ 

_Chapter 2. First order logic and automated reasoning in a nutshell_ 

32 

_vocabulary; that is, we end up with {John, Mary, Fabio, Claudio, Markus, Inge} as instances of Student, and similarly for DegreeProgramme and the binary attends. Observe that this structure does not contradict the constraints of our sentences. ♦_ 

##### **Equivalences** 

With the syntax and semantics, several equivalencies between formulae can be proven. We list them for easy reference, with a few ‘informal readings’ for illustration. _φ_ , _ψ_ , and _χ_ are formulas. 

- Commutativity: 

   - _φ ∧ ψ ≡ ψ ∧ φ_ 

   - _φ ∨ ψ ≡ ψ ∨ φ_ 

_φ ↔ ψ ≡ ψ ↔ φ_ 

- Associativity: 

( _φ ∧ ψ_ ) _∧ χ ≡ φ ∧_ ( _ψ ∧ χ_ ) 

( _φ ∨ ψ_ ) _∨ χ ≡ φ ∨_ ( _ψ ∨ χ_ ) 

- Idempotence: 

_φ ∧ φ ≡ φ_ 

_φ ∨ φ ≡ φ_ 

_//‘itself or itself is itself’_ 

- Absorption: 

_φ ∧_ ( _φ ∨ ψ_ ) _≡ φ_ 

_φ ∨_ ( _φ ∧ ψ_ ) _≡ φ_ 

- Distributivity: ( _φ ∨_ ( _ψ ∧ χ_ ) _≡_ ( _φ ∨ ψ_ ) _∧_ ( _φ ∨ χ_ ) ( _φ ∧_ ( _ψ ∨ χ_ ) _≡_ ( _φ ∧ ψ_ ) _∨_ ( _φ ∧ χ_ ) 

- Double negation: 

_¬¬φ ≡ φ_ 

- De Morgan: 

_¬_ ( _φ ∧ ψ_ ) _≡¬φ ∨¬ψ_ 

_¬_ ( _φ ∨ ψ_ ) _≡¬φ ∧¬ψ //‘negation of a disjunction implies the negation of each of the disjuncts’_ 

- Implication: _φ → ψ ≡¬φ ∨ ψ_ 

- Tautology: _φ ∨⊤≡⊤_ 

- Unsatisfiability: 

_φ ∧⊥≡⊥_ 

• Negation: _φ ∧¬φ ≡⊥ //something cannot be both true and false φ ∨¬φ ≡⊤_ 

- Neutrality: _φ ∧⊤≡ φ φ ∨⊥≡ φ_ 

- Quantifiers: _¬∀x.φ ≡∃x.¬φ_ 

_2.2. Reasoning_ 

33 

_¬∃x.φ ≡∀x.¬φ //‘if there does not exist some, then there’s always none’ ∀x.φ ∧∀x.ψ ≡∀x._ ( _φ ∧ ψ_ ) 

_∃x.φ ∨∃x.ψ ≡∃x._ ( _φ ∨ ψ_ ) 

( _∀x.φ_ ) _∧ ψ ≡∀x._ ( _φ ∧ ψ_ ) if _x_ is not free in _ψ_ 

( _∀x.φ_ ) _∨ ψ ≡∀x._ ( _φ ∨ ψ_ ) if _x_ is not free in _ψ_ 

( _∃x.φ_ ) _∧ ψ ≡∃x._ ( _φ ∧ ψ_ ) if _x_ is not free in _ψ_ 

( _∃x.φ_ ) _∨ ψ ≡∃x._ ( _φ ∨ ψ_ ) if _x_ is not free in _ψ_ 

Note: The ones up to (but excluding) the quantifiers hold for both propositional logic and first order predicate logic. 

### **2.2 Reasoning** 

Having a logic language with a semantics is one thing, but it may be only a means to an end rather than an end in itself. From the computational angle—especially from a logician’s perspective—the really interesting aspect of having such a language and (someone else) having put in the effort to formalise some subject domain, is to reason over it to infer implicit knowledge. Here, we are not talking about making a truth table, which is computationally way too costly when one has to analyse many sentences, but deploying other techniques so that it can be scaled up compared to the manual efforts. Automated reasoning, then, concerns computing systems that automate the ability to make inferences by designing a formal language in which a problem’s assumptions and conclusion can be written and providing correct algorithms to solve the problem with a computer in an efficient way. 

How does one find out whether a formula is valid or not? How do we find out whether our knowledge base is satisfiable? The main proof technique for DL-based ontologies is tableaux, although there are several others<sup>3</sup> . The following subsections first provide a general introduction (Section 2.2.1), the essential ingredients for automated reasoning (Section 2.2.2), and then describes deduction, abduction, and induction (Section 2.2.3). 

#### **2.2.1 Introduction** 

##### **Characteristics** 

People employ reasoning informally by taking a set of premises and somehow arriving at a conclusion, i.e., it is _entailed by_ the premises (deduction), arriving at a hypothesis (abduction), or generalizing from facts to an assumption (induction). Mathematicians and computer scientists developed ways to capture this formally with logic languages to represent the knowledge and rules that may be applied to the axioms so that one can construct a _formal proof_ that the conclusion can be derived from the premises. This can be done by hand [Sol05] for small theories, but that does not scale up when one has, say, 80 or more axioms even though there are much larger theories that require a formal analysis, such as checking that the 

> 3The remainder of Section 2.2 consists of amended versions of my “Reasoning, automated” essay and related definitions that have been published in Springer’s Encyclopedia of Systems Biology. 

_Chapter 2. First order logic and automated reasoning in a nutshell_ 

34 

theory can indeed have a model and thus does not contradict itself. To this end, much work has gone into automating reasoning. The remainder of this section introduces briefly several of the many purposes and usages of automated reasoning, its limitations, and types of automated reasoners. 

##### **Purposes** 

Automated reasoning, and deduction in particular, has found applications in ‘every day life’. A notable example is hardware and (critical) software verification, which gained prominence after Intel had shipped its Pentium processors with a floating point unit error in 1994 that lost the company about $500 million. Since then, chips are routinely automatically proven to function correctly according to specification before taken into production. A different scenario is scheduling problems at schools to find an optimal combination of course, lecturer, and timing for the class or degree program, which used to take a summer to do manually, but can now be computed in a fraction of it using constraint programming. In addition to such general application domains, it is also used for specific scenarios, such as the demonstration of discovering (more precisely: deriving) novel knowledge about protein phosphatases [WSH07]. They represented the knowledge about the subject domain of protein phosphatases in humans in a formal bio-ontology and classified the enzymes of both human and the fungus _Aspergillus fumigatus_ using an automated reasoner, which showed that (i) the reasoner was as good as human expert classification, (ii) it identified additional p-domains (an aspect of the phosphatases) so that the human-originated classification could be refined, and (iii) it identified a novel type of calcineurin phosphatase like in other pathogenic fungi. The fact that one can use an automated reasoner (in this case: deduction, using a Description Logics knowledge base) as a viable method in science is an encouragement to explore such avenues further. 

##### **Limitations** 

While many advances have been made in specific application areas, the main limitation of the implementations are due to the computational complexity of the chosen representation language and the desired automated reasoning services. This is being addressed by implementations of optimisations of the algorithms or by limiting the expressiveness of the language, or both. One family of logics that focus principally on ‘computationally well-behaved’ languages is Description Logics, which are decidable fragments of first order logic [BCM<sup>+</sup> 08]; that is, they are languages such that the corresponding reasoning services are guaranteed to terminate with an answer. Description Logics form the basis of most of the Web Ontology Languages OWL and OWL 2 and are gaining increasing importance in the Semantic Web applications area. Giving up expressiveness, however, does lead to criticism from the modellers’ community, as a computationally nice language may not have the features deemed necessary to represent the subject domain adequately. 

_2.2. Reasoning_ 

35 

##### **Tools** 

There are many tools for automated reasoning, which differ in which language they accept, the reasoning services they provide, and, with that, the purpose they aim to serve. 

There are, among others, generic first- and higher order logic theorem provers (e.g., Prover9, MACE4, Vampire, HOL4), SAT solvers that compute if there is a model for the formal theory (e.g., GRASP, Satz), Constraint Satisfaction Programming for solving, e.g., scheduling problems and reasoning with soft constraints (e.g., Eclipse), DL reasoners that are used for reasoning over OWL ontologies using deductive reasoning to compute satisfiability, consistency, and perform taxonomic and instance classification (e.g., Fact++, RacerPro, Hermit, CEL, QuOnto), and inductive logic programming tools (e.g., PROGOL and Aleph). 

#### **2.2.2 Basic idea** 

Essential to automated reasoning are: 

1. _The choice of the class of problems the software program has to solve_ , such as checking the consistency of a theory (i.e., whether there are no contradictions) or computing a classification hierarchy of concepts subsuming one another based on the properties represented in the logical theory; 

2. _The formal language in which to represent the problems_ , which may have more or less features to represent the subject domain knowledge, such as cardinality constraints (e.g., that spiders have as part exactly eight legs), probabilities, or temporal knowledge (e.g., that a butterfly is a transformation of a caterpillar); 

3. _The way how the program has to compute the solution_ , such as using natural deduction or resolution; and 

4. _How to do this efficiently_ , be this achieved through constraining the language into one of low complexity, or optimising the algorithms to compute the solution, or both. 

Concerning the first item, with a _problem_ being, e.g., “is my theory is consistent?”, then the _problem’s assumptions_ are the axioms in the logical theory and the _problem’s conclusion_ that is computed by the automated reasoner is a “yes” or a “no” (provided the language in which the assumptions are represented is decidable and thus guaranteed to terminate with an answer). With respect to how this is done (item iii), two properties are important for the calculus used: soundness and completeness. To define them, note/recall that “ _⊢_ ” means ‘derivable with a set of inference rules’ and “ _|_ =” denotes ‘implies’, i.e., every truth assignment that satisfies Γ also satisfies _φ_ . The two properties are defined as follows: 

- Completeness: if Γ _|_ = _φ_ then Γ _⊢ φ_ 

- Soundness: if Γ _⊢ φ_ then Γ _|_ = _φ_ 

If the algorithm it is incomplete, then there exist entailments that cannot be computed (hence, ‘missing’ some results), if it is unsound then false conclusions can be derived from true premises, which is even more undesirable. 

_Chapter 2. First order logic and automated reasoning in a nutshell_ 

36 

An example is included in Section 2.2.4, once the other ingredients have been introduced as well: proving the validity of a formula (the class of the problem) in propositional logic (the formal language) using tableau reasoning (the way how to compute the solution) with the Tree Proof Generator<sup>4</sup> (the automated reasoner); more detail, with reflection and other techniques, can be found in [Por10] among others. 

#### **2.2.3 Deduction, abduction, and induction** 

There are three principle ways of making the inferences—deduction, abduction, and induction—that are described now. 

##### **Deduction** 

Deduction is a way to ascertain if a theory _T_ represented in a logic language entails an axiom _α_ that is not explicitly asserted in _T_ (written as _T |_ = _α_ ), i.e., whether _α_ can be _derived_ from the premises through repeated application of _deduction rules_ . For instance, a theory that states that “each Arachnid has as part exactly 8 legs” and “each Tarantula is an Arachnid” then one can deduce—it is entailed in the theory—that “Each Tarantula has as part 8 legs”. An example is included further below (after having introduced a reasoning technique), which formally demonstrates that a formula is entailed in a theory _T_ using said rules. 

Thus, strictly speaking, a deduction does not reveal _novel_ knowledge, but only that what was already represented implicitly in the theory. Nevertheless, with large theories, it is often difficult to oversee all implications of the represented knowledge and, hence, the deductions may be perceived as novel from a domain expert perspective, such as with the example about the protein phosphatases. (This is in contrast to Abduction and Induction, where the reasoner ‘guesses’ knowledge that is not already entailed in the theory; see below). 

There are various ways how to ascertain _T |_ = _α_ , be it manually or automatically. One can construct a step-by-step proof ‘forward’ from the premises by applying the deduction rules or prove it indirectly such that _T ∪{¬α}_ must lead to a contradiction. The former approach is called _natural deduction_ , whereas the latter is based on techniques such as resolution, matrix connection methods, and sequent deduction (which includes _tableaux_ ). How exactly that is done for tableau is described in Section 2.2.4. 

##### **Abduction** 

One tries to infer _a_ as an explanation of _b_ . That is, we have a set of observations, a theory of the domain of the observations, and a set of (possible, hypothesised) explanations that one would hope to find. For each explanation, it should be the case that the set of observations follows from the combination of the theory and the set of explanations, noting that the combination of the theory and the set of 

> 4 `http://www.umsu.de/logik/trees/` 

_2.2. Reasoning_ 

37 

explanation has to be consistent. One can add additional machinery to these basics to, e.g., find out which of the explanations are the most interesting. 

Compared to deduction, there is less permeation of automated reasoning for abduction. From a scientist’s perspective, automation of abduction may seem appealing, because it would help one to generate a hypothesis based on the facts put into the reasoner [Ali04]. Practically, it has been used for, for instance, fault detection: given the knowledge about a system and the observed defective state, find the likely fault in the system. To formally capture theory with assumptions and facts and find the conclusion, several approaches have been proposed, each with their specific application areas; for instance, sequent calculus, belief revision, probabilistic abductive reasoning, and Bayesian networks. 

##### **Induction** 

With induction, one generalises toward a conclusion based on a set of individuals. However, the conclusion is _not_ a logical consequence of the premise. Thus, it allows one to arrive at a conclusion that actually may be false even though the premises are true. The premises provide a _degree of support_ so as to infer _a_ as an explanation of _b_ . Such a ‘degree’ can be based on probabilities (a statistical syllogism) or analogy. For instance, we have a premise that “The proportion of bacteria that acquire genes through horizontal gene transfer is 95%” and the fact that “ _Staphylococcus aureus_ is a bacterium”, then we induce that the probability that _S. aureus_ acquires genes through horizontal gene transfer is 95%. 

Induction by analogy is weaker version of reasoning, in particular in logicbased systems, and yields very different answers than deduction. For instance, let us encode that some instance, Tibbles, is a cat and we know that all cats have the properties of having a tail and four legs and that they are furry. When we encode that another animal, Tib, who happens to have four legs and is also furry, then by inductive reasoning by analogy, we conclude that Tib is also a cat, even though in reality it may well be an instance of cheetah. On the other hand, by deductive reasoning, Tib will not be classified as being an instance of cat (but may be an instance of a superclass of cats (e.g., still within the suborder _Feliformia_ ), provided that the superclass has declared that all instances have four legs and are furry. Given that humans do perform such reasoning, there are attempts to mimic this process in software applications, most notably in the area of machine learning and inductive logic programming. The principal approach with inductive logic programming is to take as input positive examples + negative examples + background knowledge and then derive a hypothesised logic program that entails all the positive and none of the negative examples. 

#### **2.2.4 Proofs with tableaux** 

Simply put, a proof is a convincing argument expressed in the language of mathematics. The steps in the process of the (automated) reasoning provide a proof. Several outcomes are possible for a given formula: 

_Chapter 2. First order logic and automated reasoning in a nutshell_ 

38 

- A formula is _valid_ if it holds under _every_ assignment<sup>5</sup> ; this is denoted as “ _|_ = _φ_ ”. A valid formula is called a _tautology_ . 

- A formula is _satisfiable_ if it holds under _some_ assignment. 

- A formula is _unsatisfiable_ if it holds under _no_ assignment. An unsatisfiable formula is called a _contradiction_ . 

The questions that need to be answered to realise the next step are: 

- _How_ do we out whether a formula is valid or not? 

- _How_ do we find out whether our theory is satisfiable? 

A rather unpractical approach is truth tables, which may be fine in a paper-based logic course, but won’t do for computing. While there are several tools with several techniques, we will look at one that is, at the time of writing, the ‘winner’ in the realm of ontologies: _tableaux-based reasoning_ , which is also the principal approach for DL reasoners and the OWL tools. A tableau provides a sound and complete procedure that decides satisfiability by checking the existence of a model<sup>6</sup> . It exhaustively looks at all the possibilities, so that it can eventually prove that no model could be found for formulas. That is: 

- _φ |_ = _ψ_ iff _φ ∧¬ψ_ is NOT satisfiable—if it is satisfiable, we have found a counterexample 

It does this by decomposing the formula in top-down fashion. Tableaux calculus works only if the formula has been translated into _Negation Normal Form_ , however, so the first step in the process is: 

- (1.) Push the negations inside to convert a sentence into Negation Normal Form, if applicable. 

We use the aforementioned equivalences for that, which were listed on page 32. For instance, one of the De Morgan rules is _¬_ ( _φ ∧ ψ_ ) _≡¬φ ∨¬ψ_ , where the ‘outer’ negation outside the brackets is pushed inside right in front of the formula, which can be done likewise with the quantifiers, such as substituting _¬∀x.φ_ with _∃x.¬φ_ . 

Now it is ready to enter the tableau. Use any or all of the following rules, as applicable (in a ‘smart’ order): 

- (2a.) If a model satisfies a _conjunction_ , then it also satisfies each of the conjuncts: _<u>φ ∧ ψ</u> φ ψ_ 

- (2b.) If a model satisfies a _disjunction_ , then it also satisfies one of the disjuncts (which is non-deterministic): _<u>φ ∨ ψ</u> φ | ψ_ 

> 5typically, the assignments are ‘true’ and ‘false’, but there are also other logics that allow more/other assignments 

> 6model in the sense of logic (recall Definition 2.9), not in the sense of ‘conceptual data model’ like a UML class diagram. 

_2.2. Reasoning_ 

39 

- (2c.) If a model satisfies a universally quantified formula ( _∀_ ), then it also satisfies the formula where the quantified variable has been substituted with some term (and the prescription is to use all the terms which appear in the tableaux), 

   - _∀x.φ φ{X/t} ∀x.φ_ 

- (2d.) For an existentially quantified formula, if a model satisfies it, then it also satisfies the formula where the quantified variable has been substituted with a new Skolem constant, 

_∃x.φ φ{X/a}_ 

To complete the proof: 

- (3.) Apply the completion rules 2a-d until either: 

   - (a) an explicit contradiction is generated in each branch due to the presence of two opposite literals in a node (called a _clash_ ), or 

   - (b) there is a completed branch where no more rule is applicable. 

- (4.) Determine the outcome: 

   - (a) If _all_ branches result in clashes, i.e., there is no completed branch, then _φ ∧¬ψ_ is NOT satisfiable, which makes the original one, _φ |_ = _ψ_ , satis- 

   - (b) If there is _a completed_ branch, then we have found a model for _φ ∧¬ψ_ , hence, have found a counterexample for some assignments of the original _φ |_ = _ψ_ , hence _φ_ ⊭ _ψ_ . 

This completes the procedure. 

One can also do the above for individual formulas and not bother with the negation at the start and then simply check if one can find a model for some formula; i.e., ‘try to build a model’ (to see if everything can be instantiated) with the completion rules cf. the ‘check there is no model (when negated)’ of the tableau procedure above. In that case, the conclusions one should draw are the opposite, i.e., then if there’s a completed branch it means that that formula is satisfiable for it has found a model, and if there are only clashes, the tableau cannot find a model so there’s some contradiction in the formula. For instance, the formula _∃x_ ( _p_ ( _x_ ) _∧¬q_ ( _x_ )) _∧∀y_ ( _¬p_ ( _y_ ) _∨ q_ ( _y_ )) is unsatisfiable. 

Let’s have a look at how to apply all this, which is depicted in Figure 2.3 and described in the example below. 

**Example 2.3.** _Let us take some arbitrary theory T that contains two axioms stating that relation R is reflexive (i.e., ∀x_ ( _R_ ( _x, x_ )) _, a thing relates to itself) and asymmetric (i.e., ∀x, y_ ( _R_ ( _x, y_ ) _→¬R_ ( _y, x_ )) _, if a thing a relates to b through relation R, then b does not relate back to a). We then can deduce, among others, that T ∪{¬∀x, y_ ( _R_ ( _x, y_ )) _} is satisfiable. We do this by demonstrating that the negation of the axiom is_ 



<!-- Start of picture text -->
Number Tableau Explanation<br>1 Vx.R(x,x) Reflexivity axiom in the original theory T<br>2 Vxy. ~R(x,y) v ~R(y,x) Asymmetry axiom in the original theory T<br>3 Vx, y.R(x,y) The negated axiom added to theory T<br>4 Substitute x for term a in 1,2,3<br>5 R(a,a)<br>6 Vy. ~R(a,y) v ~R(y,a)<br>7 Vy.R(a,y)<br>8 | Substitute y for term a in 2 and 3<br>9 R(a,a)<br>10 -=R(a,a) v ~R(a,a)<br>11 R(a,a)<br>12 IN Split the disjunction of 10<br>13 =R(a,a) -=R(a,a) Which each generate a clash with 9 and 11,<br>hence, -Vx,y.R(x,y) is entailed by T.<br><!-- End of picture text -->

Tree Proof Generator = v2.07 (2012-02-11) Help/Background a]/a])v] >] ]/¥]) 3] Prove | (p\lor (q\land r))\to (p\lor q)\land (p\lor r)) (pv (qar))((pwq)a(pvr)) ((pv(qar))((pvg)a(pvr))) is valid. 1. a((pv(gar))((pyq)a(pvr))) 2. (py(qar)) (1) 3. “{(pva)a(pvr)) (1) 4. p (2) 5. (avr) (2) ae 12. q (5) 6. a(pvq) (3) 7. =(pvr) (3) a a, 9. aq (6) V1. ar (7) 14. -(pvq) (3) 15. -(pyr) (3) x x 16. sp (14) 18. ap (15) 17. aq (14) 19. ar (15) x x 

|Axiom Number<br><br>|Explanation<br> <br>|
|---|---|
|“——Siat__—<br>(qaN<br>|sTheaimistoprovethat((pv<br>))—(pyq)a(pyN)svaid<br>|
|“1<br>|<br>This we approach by demonstrating that itsnegation (-((p v(qa1)= (pvq)a_<br>(Pp v 1))) leads toa contradiction<br>|
|“Ta|The implication (—)is rewritten following the rule that ¢ = g equals +@ v ¢, sothat<br>we obtain +(-(p v (qa 1)) v ((P vq) a(p v 1)|
|1b|The result of 1a is rewritten to push the negation inside using the equivalence that<br>=(9 v pg)=76 « 7g, 50that we obtain --(p v (qara -((Pvq)a (pvr)|
|ic|Double negation is thesame as positive, hencewe obtain ((p v (q a 1) « +((p v q)<br>a (p v 1) that continues in the tableau|
|2,3|For a conjunction (1c), both parts, being ((p v (q « r)) and ((p v q) « (p vr), must<br>hold; hence, theaxiom is split intothose two part, numbered 2 and 3.|
|4,5|Starting with 2, it has a disjunction that is split into p and (q « r)|
|da|The negation in 3 is pushed inside following the rule that -(9 a g) = -o v +9,<br>hencewe obtain -(p v g) v =(p vr)|
|6,7<br>|The result of4a is disjunction and thus generates two branches thatweappend to<br>4<br>|
|“8,9|Rewriting 6 by pushing negation inside generates a conjunction so that both parts~<br>must hold. However, with 9 we obtain ~p whereas from 4 we know that p must<br>hold, hence, a contradiction|
|10,11|Analogously, rewriting * by pushing negation inside generates a conjunction so<br>that both parts must hold, wherewe have again —p<br>that contradicts p of4|
||Giventhat thesetwo branchesareexhausted, we continuewith 5|
|12, 13|The conjunction of5 means that both pandr|
|14, 15|Like with 6, 7, also here we must generate two branches to deal with =(p v q) v<br>7(P vr)|
|16, 17|The same procedure as with 8,9<br>is repeated<br>here, which also generates a<br>contradiction, between 12 and 17|
|18, 19<br>|Unfolding the last branch (like in 10, 11) we arrive at a contradiction between 13<br>and 19<br>|
|“End _|Given that all branches of the negated original formula lead toa contradiction,we<br>haveproventhattheoriginalformulaisvalid|

































_2.3. Exercises_ 

43 

- a. Formalise the following properties of the graph as _L_ -sentences: (i) ( _a, a_ ) and ( _b, b_ ) are edges of the graph; (ii) ( _a, b_ ) is an edge of the graph; (iii) ( _b, a_ ) is not an edge of the graph. Let _T_ stand for the resulting set of sentences. * 

- b. Prove that _T ∪{∀x∀yR_ ( _x, y_ ) _}_ is unsatisfiable using tableaux calculus. * 

**Exercise 2.5.** Let us have a logical theory Θ with the following sentences: 

   - _∀xPizza_ ( _x_ ), _∀xPizzaT_ ( _x_ ), _∀xPizzaB_ ( _x_ ), which are disjoint 

   - _∀x_ ( _Pizza_ ( _x_ ) _→¬PizzaT_ ( _x_ )), 

   - _∀x_ ( _Pizza_ ( _x_ ) _→¬PizzaB_ ( _x_ )), 

   - _∀x_ ( _PizzaT_ ( _x_ ) _→¬PizzaB_ ( _x_ )), 

   - _∀x, y_ ( _hasT_ ( _x, y_ ) _→ Pizza_ ( _x_ ) _∧ PizzaT_ ( _y_ )), 

   - _∀x, y_ ( _hasB_ ( _x, y_ ) _→ Pizza_ ( _x_ ) _∧ PizzaB_ ( _y_ )), 

   - _∀x_ ( _ITPizza_ ( _x_ ) _→ Pizza_ ( _x_ )), and 

   - _∀x_ ( _ITPizza_ ( _x_ ) _→¬∃y_ ( _hasT_ ( _x, y_ ) _∧ FruitT_ ( _y_ )), where 

   - _∀x_ ( _V egeT_ ( _x_ ) _→ PizzaT_ ( _x_ )) and 

   - _∀x_ ( _FruitT_ ( _x_ ) _→ PizzaT_ ( _x_ )). 

- Task (read in full first before attempting it): 

   - a. A Pizza margherita has the necessary and sufficient conditions that it has mozzarella, tomato, basilicum and oil as toppings and has a pizza base. Add this to Θ. 

Annotate you commitments: what have you added to Θ and how? 

   - Hint: fruits are not vegetables, categorise the toppings, and “necessary and is denoted with _↔_ . 

- b. We want to merge our new Θ with some other theory Γ that has knowledge about fruits and vegetables. Γ contains, among other formulas, _∀x_ ( _Tomato_ ( _x_ ) _→ Fruit_ ( _x_ )). What happens? Represent the scenario formally, and prove your answer. 

Actually, this is not easy to figure out manually, and there are ways to automate this, which you will do later in Chapter 4. 

**Exercise 2.6.** Try to formalise the following natural language sentences into FOL now or in DL later in the next chapter, or both. (optional practice). * 

1. All lions are animals 

2. Each professor teaches at least course 

3. All humans eat some fruit and cheese 

4. Animals are either herbivores or carnivores 

5. The sister of one’s mother is one’s aunt 

6. Something can’t be both pap and pizza 

7. If a person works for a company, then that person is an employee 

8. Anything that manages something is a manager, and vice versa. 

9. All flies have exactly two eyes as part 

10. Anything has at most one life 

11. The participation relation is defined by relating physical objects to processes 

12. Having something as part is the inverse of being part of something 

13. connection is symmetric (if one thing is connected to something else, that other thing is also connected to the one thing) 

14. A vehicle can be either motorised or not, but not both 

44 _Chapter 2. First order logic and automated reasoning in a nutshell_ 

15. Several snails are slow 

16. Each patient is registered at some hospital on a certain weekday 

17. All students are at some time in their life not a student 

### **2.4 Literature and reference material** 

The following literature is optional for the scope of ontology engineering, but you may find of interest if you would like to design your own logic, for instance. 

1. Hedman, S. _A first course in logic—an introduction to model theory, proof theory, computability, and complexity_ . Oxford: Oxford University Press. 2004. 

2. Solow, D. _How to read and do proofs_ . 4th Ed. Wiley. 2005. 

### CHAPTER 3 

### Description Logics 

A Description Logic (DL) is a structured fragment of FOL; more precisely: any (basic) Description Logic language is a subset of _L_ 3, i.e., the function-free FOL using only at most three variable names. Its representation is at the predicate level: no variables are present in the formalism. DLs provide a logical reconstruction and (claimed to be a) unifying formalism for other knowledge representation languages, such as frames-based systems, object-oriented modelling, Semantic data models, etc. They provide the language to formulate theories and systems declaratively _expressing structured knowledge_ and for _accessing_ it and _reasoning_ with it, and they are used for, among others, terminologies and ontologies, logic-based conceptual data modelling, and information integration. 

Figure 3.1 shows a basic overview of the principal components of a DL knowledge base, with the so-called _TBox_ containing the knowledge at the class-level and the _ABox_ containing the data (individuals). Sometimes you will see added to the figure an _RBox_ , which is used to make explicit there are relationships and the axioms that hold for them. 



<!-- Start of picture text -->
TBox<br>( T erminology) Automated<br>Description<br>reasoning<br>language<br>(over the TBox<br>(a logic) ABox<br>and ABox)<br>( A ssertions)<br>Knowledge base<br>Interaction with Interaction with other<br>user applications technologies<br><!-- End of picture text -->

**Figure 3.1:** A Description Logic knowledge base. Sometimes you will see a similar picture extended with an “RBox”, which denotes the DL roles and their axioms. 

45 

_Chapter 3. Description Logics_ 

46 

The remainder of this section contains, first, a general introduction to DL (Section 3.1), which are the first five sections of the DL Primer [KSH12], and is reproduced here with permission of its authors Markus Kr¨otzsch, Frantiˇsek Simanˇc´ık, and Ian Horrocks<sup>1</sup> . (Slightly more detailed introductory notes with examples can be found in the first 8 pages of [Tur10] and the first 10 pages of [Sat07]; a DL textbook is in the pipeline). We then proceed to several important DLs out of the very many DLs investigated, being _ALC_ and _SROIQ_ , in Section 3.2. We then proceed to describing and illustrating the standard reasoning services for DLs in Section 3.3, which essentially applies and extends the tableau reasoning of the previous chapter. Note that DLs and its reasoning services return in Chapter 4 about OWL 2, building upon the theoretical foundations introduced in this chapter. 

### **3.1 DL primer** 

Description logics (DLs) are a family of knowledge representation languages that are widely used in ontology development. An important practical reason for this is that they provide one of the main underpinnings for the Web Ontology Language OWL as standardised by the World Wide Web Consortium (W3C). However, DLs have been used in knowledge representation long before the advent of ontologies in the context of the Semantic Web, tracing back to first DL modelling languages in the mid 1980s. 

As their name suggests, DLs are logics (in fact they are decidable fragments of first-order logic), and as such they are equipped with a _formal semantics_ : a precise specification of the meaning of DL ontologies. This formal semantics allows humans and computer systems to exchange DL ontologies without ambiguity as to their intended meaning, and also makes it possible to use logical deduction to – _infer_ additional information from the facts stated explicitly in an ontology an important feature that distinguishes DLs from other modelling languages such as UML. 

The capability of inferring additional knowledge increases the modelling power of DLs but it also requires some understanding on the side of the modeller and, above all, good tool support for computing the conclusions. The computation of inferences is called _reasoning_ and an important goal of DL language design has been to ensure that reasoning algorithms of good performance are available. This is one of the reasons why there is not just a single description logic: the best balance between expressivity of the language and complexity of reasoning depends on the intended application. 

We provide a self-contained first introduction to Description Logics. We start by explaining the basic way in which knowledge is modelled in DLs in Section 3.1.1 and continue with an intuitive introduction to the most important DL modelling features in Section 3.1.2. In Section 3.1.3, we explain the underlying ideas of 

> 1I harmonised the terminology so as to use the same terms throughout the book, cf. adding synonyms at this stage, and added a few references to other sections in this book to integrate the text better. Also, I moved their _SROIQ_ section into Section 3.2 and inserted _ALC_ there, and made the family composition examples more inclusive. 

_3.1. DL primer_ 

47 

DL semantics. Then a common starting point of DLs is introduced, being _ALC_ , and subsequently the rather expressive DL called _SROIQ_ (summarised in Section 3.2.2), which forms the basis of the OWL 2 DL language. Many DLs can be obtained by omitting some features of _SROIQ_ and in Section 3.2.3 we review some of the most important DLs obtained in this way. In particular, this includes various light-weight description logics that allow for particularly efficient reasoning and are also standardised, as fragments of OWL. 

#### **3.1.1 Basic building blocks of DL ontologies** 

Description logics (DLs) provide means to model the relationships between entities in a domain of interest. In DLs there are three kinds of entities: concepts, roles and individual names. Concepts denote sets of individuals, roles denote sets of binary relations between the individuals<sup>2</sup> , and individual names denote single individuals in the domain. Readers familiar with first-order logic will recognise these as unary predicates, binary predicates and constants. 

For example, an ontology representing the domain of people and their family relationships might use concepts such Parent to denote the set of all parents and Female to represent the set of all female individuals, roles such as parentOf to denote the (binary) relationship between parents and their children, and individual names such as julia and john to denote the individuals Julia and John. 

Unlike a database, a DL ontology does not fully describe a particular situation or “state of the world”; rather it consists of a set of statements, called axioms, each of which must be true in the situation described. These axioms typically capture only partial knowledge about the situation that the ontology is describing, and there may be many different states of the world that are consistent with the ontology. Although, from the point of view of logic, there is no principal difference between different types of axioms, it is customary to separate them into three groups: assertional (ABox) axioms, terminological (TBox) axioms and relational (RBox) axioms. 

**Asserting Facts with ABox Axioms** ABox axioms capture knowledge about named individuals, i.e., the concepts to which they belong and how they are related to each other. The most common ABox axioms are _concept assertions_ such as 



which asserts that Julia is a mother or, more precisely, that the individual named julia is an _instance_ of the concept Mother. 

_Role assertions_ describe relations between named individuals. The assertion 



for example, states that Julia is a parent of John or, more precisely, that the individual named julia is in the relation that is denoted by parentOf to the individual 

> 2 There are a few DLs that permit _n_ -aries, which are the _DLR_ and _CFD_ families of logics that were inspired by conceptual data modelling and relational models. 

_Chapter 3. Description Logics_ 

48 

named john. The previous sentence shows that it can be rather cumbersome to explicitly point out that the relationships expressed by an axiom are really relationships between the individuals, sets and relations that are denoted by the respective individual names, concepts and roles. Assuming that this subtle distinction between syntactic identifiers and semantic entities is understood, we will thus often adopt a more sloppy and readable formulation. Section 3.1.3 below explains the underlying semantics with greater precision<sup>3</sup> . 

Although it is intuitively clear that Julia and John are different individuals, this fact does not logically follow from what we have stated so far. DLs may or may not make the _unique name assumption_ , so different names might refer to the same individual unless explicitly stated otherwise<sup>4</sup> . The _individual inequality_ assertion 



is used to assert that Julia and John are actually different individuals. On the other hand, an _individual equality_ assertion, such as 



states that two different names are known to refer to the same individual. Such situations can arise, for example, when combining knowledge about the same domain from several different sources, a task that is known as _ontology alignment_ . 

**Expressing Terminological Knowledge with TBox Axioms** TBox axioms describe relationships between concepts. For example, the fact that all mothers are parents is expressed by the _concept inclusion_ 



in which case we say that the concept Mother is _subsumed_ by the concept Parent. Such knowledge can be used to infer further facts about individuals. For example, (3.1) and (3.5) together imply that Julia is a parent. 

_Concept equivalence_ asserts that two concepts have the same instances, as in 



While synonyms may be perceived to be an obvious example of equivalent concepts, in practice one uses concept equivalence to give a name to complex expressions as introduced in Section 3.1.2 below and put real synonyms in the annotations or extra labels in the ontology file. Furthermore, such additional concept expressions can be combined with equivalence and inclusion to describe more complex situations such as the disjointness of concepts, which asserts that two concepts do not share any instances. 

> 3It is the same as the model-theoretic semantics we have seen in Section 2.1.2, but then restated for DLs. 

> 4i.e., the unique name assumption (UNA) means that different names refer to different individuals, as is customary in the database world. There are consequences for UNA/no-UNA both regarding computational complexity and automated reasoners: no-UNA is more costly and the deductions are different when reasoning with UNA or not. We will see the effects of especially the latter in the exercises of Chapter 4. 

_3.1. DL primer_ 

49 

**Modelling Relationships between Roles with RBox Axioms** RBox axioms refer to properties of roles. As for concepts, DLs support _role inclusion_ and _role equivalence_ axioms. For example, the inclusion 



states that parentOf is a _subrole_ of ancestorOf, i.e., every pair of individuals related by parentOf is also related by ancestorOf. Thus (3.2) and (3.7) together imply that Julia is an ancestor of John. 

In role inclusion axioms, _role composition_ can be used to describe roles such as uncleOf. Intuitively, if Charles is a brother of Julia and Julia is a parent of John, then Charles is an uncle of John. This kind of relationship between the roles brotherOf, parentOf and uncleOf is captured by the _complex role inclusion_ axiom 



Note that role composition can only appear on the left-hand side of complex role inclusions. Furthermore, in order to retain decidability of reasoning (see Appendix D for a recap on complexity and decidability), their use is restricted by additional structural restrictions that specify whether or not a collection of such axioms can be used together in one ontology. 

Nobody can be both a parent and a child of the same individual, so the two roles parentOf and childOf are disjoint. In DLs we can write _disjoint roles_ as follows: 



Further RBox axioms include _role characteristics_ such as reflexivity, symmetry and transitivity of roles. These are closely related to a number of other DL features and we will discuss them again in more detail in Section 3.1.2. 

#### **3.1.2 Constructors for concepts and roles** 

The basic types of axioms introduced in Section 3.1.1 are rather limited for accurate modelling. To describe more complex situations, DLs allow new concepts and roles to be built using a variety of different constructors. We distinguish concept and role constructors depending on whether concept or role expressions are constructed. In the case of concepts, one can further separate basic Boolean constructors, role restrictions and nominals/enumerations. At the end of this section, we revisit the additional kinds of RBox axioms that have been omitted in Section 3.1.1. 

**Boolean Concept Constructors** Boolean concept constructors provide basic Boolean operations that are closely related to the familiar operations of intersection, union and complement of sets, or to conjunction, disjunction and negation of logical expressions. 

For example, concept inclusions allow us to state that all mothers are female and that all mothers are parents, but what we really mean is that mothers are 

_Chapter 3. Description Logics_ 

50 

_exactly_ the female parents. DLs support such statements by allowing us to form complex concepts such as the _intersection_ (also called _conjunction_ ) 



which denotes the set of individuals that are both female and parents. A complex concept can be used in axioms in exactly the same way as an atomic concept, e.g., in the equivalence Mother _≡_ Female _⊓_ Parent. 

_Union_ (also called _disjunction_ ) is the dual of intersection. For example, the concept 



describes those individuals that are either (biological) fathers or mothers. Again, it can be used in an axiom such as Parent _≡_ Father _⊔_ Mother, which states that a parent is either a father or a mother (and vice versa). One can extend this further, of course, by stating, e.g., that a parent is equivalent to father or mother or guardian: Parent _≡_ Father _⊔_ Mother _⊔_ Guardian. 

Sometimes we are interested in individuals that do _not_ belong to a certain concept, e.g., in women who are not married. These could be described by the complex concept 



where the _complement_ (also called _negation_ ) _¬_ Married denotes the set of all individuals that are not married. 

It is sometimes useful to be able to make a statement about every individual, e.g., to say that everybody is either male or female. This can be accomplished by the axiom 



where the _top concept ⊤_ is a special concept with every individual as an instance; it can be viewed as an abbreviation for _C ⊔¬C_ for an arbitrary concept _C_ . Note that this modelling is rather coarse as it presupposes that _every_ individual has a gender, which may not be reasonable, especially for instances of a concept such as Computer. We will see more useful applications for _⊤_ later on. 

To express that, for the purposes of our modelling, nobody can be both a parent and childless at the same time, we can declare the set of parents and the set of childless individuals to be disjoint. While ontology languages like OWL provide a basic constructor for disjointness, it is naturally captured in DLs with the axiom 



where the _bottom concept ⊥_ is the dual of _⊤_ , that is the special concept with no individuals as instances; it can be seen as an abbreviation for _C ⊓¬C_ for an arbitrary concept _C_ . The above axiom thus says that the intersection of the two concepts is empty. 

**Role Restrictions** So far we have seen how to use TBox and RBox axioms to express relationships between concepts and roles, respectively. The most interesting 

_3.1. DL primer_ 

51 

feature of DLs, however, is their ability to form statements that link concepts and roles together. For example, there is an obvious relationship between the concept Parent and the role parentOf, namely, a parent is someone who is a parent of at least one individual. In DLs, this relationship can be captured by the concept equivalence 



where the _existential restriction ∃_ parentOf _.⊤_ is a complex concept that describes the set of individuals that are parents of at least one individual (instance of _⊤_ ). Similarly, the concept _∃_ parentOf _._ Female describes those individuals that are parents of at least one female individual, i.e., those that have a daughter. 

To denote the set of individuals all of whose children are female, we use the _universal restriction_ 



It is a common error to forget that (3.16) also includes those that have no children at all. More accurately (and less naturally), the axiom can be said to describe the set of all individuals that have “no children other than female ones,” i.e., no “no children that are not female.” Following this wording, the concept (3.16) could indeed be equivalently expressed as _¬∃_ parentOf _.¬_ Female (recall the equivalences on page 32). If this meaning is not intended, one can describe the individuals who have at least one child and with all their children being female by the concept ( _∃_ parentOf _.⊤_ ) _⊓_ ( _∀_ parentOf _._ Female). To state the difference between Eq. 3.16 and the latter in another way: Eq. 3.16 says “if has children, then all female” and latter “does have children, and all female”. 

Existential and universal restrictions are useful in combination with the top concept for expressing _domain_ and _range restrictions_ on roles; that is, restrictions on the kinds of individual that can be in the domain and range of a given role. To restrict the domain of sonOf to male individuals we can use the axiom 



and to restrict its range to parents we can write 



In combination with the assertion sonOf(john _,_ julia), these axioms would then allow us to deduce that John is male and Julia is a parent. 

_Number restrictions_ allow us to restrict the number of individuals that can be reached via a given role. For example, we can form the _at-least restriction_ 



to describe the set of individuals that are children of at least two parents, and the _at-most restriction_ 



for those that are children of at most two parents. The axiom Person _⊑_ ⩾2 childOf _._ Parent _⊓_ ⩽2 childOf _._ Parent then states that every person is a child of exactly two parents. A shorthand notation is Person _⊑_ = 2 childOf _._ Parent 

_Chapter 3. Description Logics_ 

52 

Finally, _local reflexivity_ can be used to describe the set of individuals that are related to themselves via a given role. For example, the set of individuals that are talking to themselves is described by the concept 



**Nominals** As well as defining concepts in terms of other concepts (and roles), it may also be useful to define a concept by simply enumerating its instances. For example, we might define the concept Beatle by enumerating its instances: john, paul, george, and ringo. Enumerations are not supported natively in DLs, but they can be simulated in DLs using _nominals_ . A nominal is a concept that has exactly one instance. For example, _{_ john _}_ is the concept whose only instance is (the individual denoted by) john. Combining nominals with union, the enumeration in our example could be expressed as 



It is interesting to note that, using nominals, a concept assertion Mother(julia) can be turned into a concept inclusion _{_ julia _} ⊑_ Mother and a role assertion parentOf(julia _,_ john) into a concept inclusion _{_ julia _} ⊑∃_ parentOf _.{_ john _}_ . This illustrates that the distinction between ABox and TBox does not have a deeper logical meaning<sup>5</sup> . 

**Role Constructors** In contrast to the variety of concept constructors, DLs provide only few constructor for forming complex roles. In practice, _inverse roles_ are the most important such constructor. Intuitively, the relationship between the roles parentOf and childOf is that, for example, if Julia is a parent of John, then John is a child of Julia and vice versa. More formally, parenfOf is the inverse of childOf, which in DLs can be expressed by the equivalence 



where the complex role childOf<sup>_−_</sup> denotes the inverse of childOf. 

In analogy to the top concept, DLs also provide the _universal role_ , denoted by _U_ , which always relates all pairs of individuals. It typically plays a minor role in modelling,<sup>6</sup> but it establishes symmetry between roles and concepts w.r.t. a top element. Similarly, an _empty role_ that corresponds to the bottom concept is also available in OWL but has rarely been introduced as a constructor in DLs; however, we can define any role _R_ to be empty using the axiom _⊤⊑¬∃R.⊤_ (“all things do not relate to anything through _R_ ”). Interestingly, the universal role cannot be defined by TBox axioms using the constructors introduced above, and in particular universal role restrictions cannot express that a role is universal. 

> 5It does so ontologically, to which we shall return in Block II. 

> 6Although there are a few interesting things that could be expressed with _U_ , such as _concept products_ [RKH08a], tool support is rarely sufficient for using this feature in practice. 

_3.1. DL primer_ 

53 

**More RBox Axioms: Role Characteristics** In Section 3.1.1 we introduced three forms of RBox axioms: role inclusions, role equivalences and role disjointness. OWL provides a variety of others, namely role transitivity, symmetry, asymmetry, reflexivity and irreflexivity. These are sometimes considered as basic axiom types in DLs as well, using some suggestive notation such as _Trans_ (ancestorOf) to express that the role ancestorOf is transitive. However, such axioms are just syntactic sugar; all role characteristics can be expressed using the features of DLs that we have already introduced. 

_Transitivity_ is a special form of complex role inclusion. For example, transitivity of ancestorOf can be captured by the axiom ancestorOf _◦_ ancestorOf _⊑_ ancestorOf. A role is _symmetric_ if it is equivalent to its own inverse, e.g., marriedTo _≡_ marriedTo<sup>_−_</sup> , and it is _asymmetric_ if it is disjoint from its own inverse, as in _Disjoint_ (parentOf _,_ parentOf<sup>_−_</sup> ). If desired, _global reflexivity_ can be expressed by imposing local reflexivity on the top concept as in _⊤⊑∃_ knows _.Self_ . A role is _irreflexive_ if it is never locally reflexive, as in the case of _⊤⊑¬∃_ marriedTo _.Self_ . 

#### **3.1.3 Description Logic semantics** 

The formal meaning of DL axioms is given by their semantics. In particular, the semantics specifies what the logical consequences of an ontology are. The formal semantics is therefore the main guideline for every tool that computes logical consequences of DL ontologies, and a basic understanding of its working is vital to make reasonable modelling choices and to comprehend the results given by software applications. Luckily, the semantics of description logics is not difficult to understand provided that some common misconceptions are avoided. 

Intuitively speaking, an ontology describes a particular situation in a given domain of discourse. For example, the axioms in Sections 3.1.1 and 3.1.2 describe a particular situation in the “families and relationships” domain. However, ontologies usually cannot fully specify the situation that they describe. On the one hand, there is no formal relationship between the symbols we use and the objects that they represent: the individual name julia, for example, is just a syntactic identifier with no intrinsic meaning. Indeed, the intended meaning of the identifiers in our ontologies has no influence on their formal semantics: what we know about them stems only from the axioms. On the other hand, the axioms in an ontology typically do not provide complete information. For example, Eqs. (3.3) and (3.4) in Section 3.1.1 state that some individuals are equal and that others are unequal, but in many other cases this information might be left unspecified. 

Description logics have been designed to deal with such incomplete information. Rather than making default assumptions in order to fully specify one particular interpretation for each ontology, the DL semantics generally considers all the possible situations (i.e., states of the world) where the axioms of an ontology would hold (we also say: where the axioms are _satisfied_ ). This characteristic is called the _Open World Assumption_ since it keeps unspecified information open.<sup>7</sup> A logical 

> 7A _Closed World Assumption_ “closes” the interpretation by assuming that every fact not explicitly stated to be true is actually false. Both terms are not formally specified and rather outline the general flavour of a semantics than any particular definition. 

_Chapter 3. Description Logics_ 

54 

**Table 3.1:** Syntax and semantics of _SROIQ_ constructors. 

||_Syntax_|_Semantics_|
|---|---|---|
|_Individuals:_|||
|individual name|_a_|_a_<sup>_I_</sup>|
|_Roles:_|||
|atomic role|_R_|_R_<sup>_I_</sup>|
|inverse role|_R_<sup>_−_</sup>|_{⟨x, y⟩| ⟨y, x⟩∈R_<sup>_I_</sup>_}_|
|universal role|_U_|∆<sup>_I _</sup>_×_∆<sup>_I_</sup>|
|_Concepts:_|||
|atomic concept|_A_|_A_<sup>_I_</sup>|
|intersection|_C ⊓D_|_C_<sup>_I _</sup>_∩D_<sup>_I_</sup>|
|union|_C ⊔D_|_C_<sup>_I _</sup>_∪D_<sup>_I_</sup>|
|complement|_¬C_|∆<sup>_I _</sup>_\ C_<sup>_I_</sup>|
|top concept|_⊤_|∆<sup>_I_</sup>|
|bottom concept|_⊥_|_∅_|
|existential restriction|_∃R.C_<br>_{x _|_|_some _R_<sup>_I_</sup>-successor of _x_ is in _C_<sup>_I_</sup>_}_|
|universal restriction|_∀R.C_<br>_{x _|_|_all _R_<sup>_I_</sup>-successors of _x_ are in _C_<sup>_I_</sup>_}_|
|at-least restriction|⩾_n R.C_<br>_{x |_at|least _n R_<sup>_I_</sup>-successors of _x_ are in _C_<sup>_I_</sup>_}_|
|at-most restriction|⩽_n R.C_<br>_{x |_at|most _n R_<sup>_I_</sup>-successors of _x_ are in _C_<sup>_I_</sup>_}_|
|local refexivity|_∃R.Self_|_{x | ⟨x, x⟩∈R_<sup>_I_</sup>_}_|
|nominal|_{a}_|_{a_<sup>_I_</sup>_}_|



where _a, b ∈_ N _I_ are individual names, _A ∈_ N _C_ is a concept name, _C, D ∈_ **C** are concepts, and _R ∈_ **R** is a role 

consequence of an ontology is an axiom that holds in all interpretations that satisfy the ontology, i.e., something that is true in all conceivable states of the world that agree with what is said in the ontology. The more axioms an ontology contains, the more specific are the constraints that it imposes on possible interpretations, and the fewer interpretations exist that satisfy all of the axioms (recall Section 1.2.3 on good ontologies with high precision). Conversely, if fewer interpretations satisfy an ontology, then more axioms hold in all of them, and more logical consequences follow from the ontology. The previous two sentences imply that the semantics of description logics is _monotonic_ : additional axioms always lead to additional consequences, or, more informally, the more knowledge we feed into a DL system the more results it returns. 

An extreme case is when an ontology is not satisfied in any interpretation. The ontology is then called _unsatisfiable_ or _inconsistent_ . In this case _every_ axiom holds vacuously in all of the (zero) interpretations that satisfy the ontology. Such an ontology is clearly of no utility, and avoiding inconsistency (and checking for it in the first place) is therefore an important task during ontology development. 

We have outlined above the most important ideas of DL semantics. What remains to be done is to define what we really mean by an “interpretation” and which conditions must hold for particular axioms to be satisfied by an interpretation. For this, we closely follow the intuitive ideas established above: an interpretation _I_ consists of a set ∆<sup>_I_</sup> called the _domain_ of _I_ and an interpretation function _·_<sup>_I_</sup> that 

_3.1. DL primer_ 

55 

**Table 3.2:** Syntax and semantics of _SROIQ_ axioms. 

||_Syntax_|_Semantics_|
|---|---|---|
|_ABox:_|||
|concept assertion|_C_(_a_)|_a_<sup>_I _</sup>_∈C_<sup>_I_</sup>|
|role assertion|_R_(_a, b_)|_⟨a_<sup>_I_</sup>_, b_<sup>_I_</sup>_⟩∈R_<sup>_I_</sup>|
|individual equality|_a ≈b_|_a_<sup>_I_ </sup>=_b_<sup>_I_</sup><br>|
|individual inequality|_a ≈b_|_a_<sup>_I_ </sup>=_b_<sup>_I_</sup>|
|_TBox:_|||
|concept inclusion|_C ⊑D_|_C_<sup>_I _</sup>_⊆D_<sup>_I_</sup>|
|concept equivalence|_C ≡D_|_C_<sup>_I_ </sup>=_D_<sup>_I_</sup>|
|_RBox:_|||
|role inclusion|_R ⊑S_|_R_<sup>_I _</sup>_⊆S_<sup>_I_</sup>|
|role equivalence|_R ≡S_|_R_<sup>_I_ </sup>=_S_<sup>_I_</sup>|
|complex role inclusion|_R_1_◦R_2 _⊑S_|_R_<sup>_I_</sup><br>1 <sup>_◦RI_</sup><br>2 <sup>_⊆SI_</sup>|
|role disjointness|_Disjoint_(_R, S_)|_R_<sup>_I _</sup>_∩S_<sup>_I_ </sup>=_∅_|



maps each atomic concept _A_ to a set _A_<sup>_I_</sup> _⊆_ ∆<sup>_I_</sup> , each atomic role _R_ to a binary relation _R_<sup>_I_</sup> _⊆_ ∆<sup>_I_</sup> _×_ ∆<sup>_I_</sup> , and each individual name _a_ to an element _a_<sup>_I_</sup> _∈_ ∆<sup>_I_</sup> . The interpretation of complex concepts and roles follows from the interpretation of the basic entities. Table 3.1 shows how to obtain the semantics of each compound expression from the semantics of its parts. By “ _R_<sup>_I_</sup> -successor of _x_ ” we mean any individual _y_ such that _⟨x, y⟩∈ R_<sup>_I_</sup> . The definition should confirm the intuitive explanations given for each case in Section 3.1.2. For example, the semantics of Female _⊓_ Parent is indeed the intersection of the semantics of Female and Parent. 

Since an interpretation _I_ fixes the meaning of all entities, we can unambiguously say for each axiom whether it holds in _I_ or not. An axiom _holds_ in _I_ (we also say _I satisfies α_ and write _I |_ = _α_ ) if the corresponding condition in Table 3.2 is met. Again, these definitions fully agree with the intuitive explanations given in Section 3.1.1. If all axioms in an ontology _O_ hold in _I_ (i.e., if _I_ satisfies _O_ , written _I |_ = _O_ ), then _I_ is a _model_ of _O_ . Thus a model is an abstraction of a state of the world that satisfies all axioms in the ontology. An ontology is _consistent_ if it has at least one model. An axiom _α_ is a _consequence_ of an ontology _O_ (or _O entails α_ written _O |_ = _α_ ) if _α_ holds in every model of _O_ . In particular, an inconsistent ontology entails every axiom. 

A noteworthy consequence of this semantics is the meaning of individual names in DL ontologies. We already remarked that DLs do not usually make the Unique Name Assumption, and indeed our formal definition allows two individual names to be interpreted as the same individual (element of the domain). Possibly even more important is the fact that the domain of an interpretation is allowed to contain many individuals that are not denoted by any individual name. A common confusion in modelling arises from the implicit assumption that interpretations must only contain individuals that are denoted by individual names (such individuals are also called _named individuals_ ). For example, one could wrongly assume the 

_Chapter 3. Description Logics_ 

56 

##### ontology consisting of the axioms 

##### parentOf(julia _,_ john) manyChildren(julia) manyChildren _⊑_ ⩾3 parentOf _.⊤_ 

to be inconsistent since it requires Julia to have at least 3 children when only one (John) is given. However, there are many conceivable models where Julia does have three children, even though only one of them is explicitly named. A significant number of modelling errors can be traced back to similar misconceptions that are easy to prevent if the general open world assumption of DLs is kept in mind. 

Another point to note is that the above specification of the semantics does not provide any hint as to how to compute the relevant entailments in practical software tools. There are infinitely many possible interpretations, each of which may have an infinite domain (in fact there are some ontologies that are satisfied only by interpretations with infinite domains). Therefore it is impossible to test all interpretations to see if they model a given ontology, and impossible to test all models of an ontology to see if they entail a given axiom. Rather, one has to devise concrete deduction procedures and prove their correctness with respect to the above specification. The interplay of certain expressive features can make reasoning algorithms more complicated and in some cases it can even be shown that no correct and terminating algorithm exists at all (i.e., that reasoning is undecidable). For our purposes it suffices to know that entailment of axioms is decidable for _SROIQ_ (with the structural restrictions explained in Section 3.2.2, below) and that a number of free and commercial tools are available. Such tools are typically optimised for more specific reasoning problems, such as consistency checking, the entailment of concept subsumptions (subsumption checking) or of concept assertions (instance checking). Many of these standard inferencing problems can be expressed in terms of each other, so they can be handled by very similar reasoning algorithms. 

### **3.2 Important DLs** 

There are very many DLs, of which some are used more often than others. In this section, we will first look at _ALC_ , for it is typically one of the languages used in DL courses, a basis to add various language features to, and it is much easier for showing how the principles of tableau work for DLs. Subsequently, we list the more expressive _SROIQ_ , and finally comment on leaner fragments that are computationally better behaved. 

#### **3.2.1 A basic DL to start with:** _ALC_ 

The DL language _ALC_ —which stands for _A_ ttributive _L_ anguage with _C_ oncept negation—contains the following elements: 

- _Concepts_ denoting entity types/classes/unary predicates/universals, including top _⊤_ and bottom _⊥_ ; 

- _Roles_ denoting relationships/associations/binary predicates/properties; 

- _Constructors_ : and _⊓_ , or _⊔_ , and not _¬_ ; quantifiers _∀_ and _∃_ ; 

_3.2. Important DLs_ 

57 

- _Complex concepts_ using constructors: Let _C_ and _D_ be concept names, _R_ a role name, then 

**–** _¬C_ , _C ⊓ D_ , and _C ⊔ D_ are concepts, and 

**–** _∀R.C_ and _∃R.C_ are concepts 

- _Individuals_ 

Some examples that can be represented in _ALC_ are, respectively: 

- Concepts (primitive, atomic); e.g., Book, Course 

- Roles; e.g., enrolled, reads 

- Complex concepts; e.g., 

   - Student _⊑∃_ enrolled _._ (Course _⊔_ DegreeProgramme) 

(this is a _primitive concept_ ) 

   - Mother _⊑_ Woman _⊓∃_ ParentOf _._ Person 

   - Parent _≡_ (Male _⊔_ Female) _⊓∃_ ParentOf _._ Mammal _⊓∃_ caresFor _._ Mammal (this is a _defined concept_ ) 

- Individuals; e.g., Student(Andile), Mother(Katniss), _¬_ Student(Katniss), enrolled(Andile _,_ COMP101) 

As usual, the meaning is defined by the _semantics_ of _ALC_ , and it follows the same approach as we have seen for the other languages that have passed the revue (recollect FOL and model-theoretic semantics from Section 2.1). First, there is a _domain of interpretation_ , and an _interpretation_ , where: 

– Domain ∆is a non-empty set of objects 

– Interpretation: _·_<sup>_I_</sup> is the _interpretation function_ , domain ∆<sup>_I_</sup> 

**–** _·_<sup>_I_</sup> maps every concept name _A_ to a subset _A_<sup>_I_</sup> _⊆_ ∆<sup>_I_</sup> 

**–** _·_<sup>_I_</sup> maps every role name _R_ to a subset _R_<sup>_I_</sup> _⊆_ ∆<sup>_I_</sup> _×_ ∆<sup>_I_</sup> 

**–** _·_<sup>_I_</sup> maps every individual name _a_ to elements of ∆<sup>_I_</sup> : _a_<sup>_I_</sup> _∈_ ∆<sup>_I_</sup> Note that _⊤_<sup>_I_</sup> = ∆<sup>_I_</sup> and _⊥_<sup>_I_</sup> = _∅_ . 

Using the typical notation where _C_ and _D_ are concepts, _R_ a role, and _a_ and _b_ are individuals, then they have the following meaning, with on the left-hand side of the “=” the syntax of _ALC_ under an interpretation and on the right-hand side its semantics: 

- ( _¬C_ )<sup>_I_</sup> = ∆<sup>_I_</sup> _\C_<sup>_I_</sup> 

- ( _C ⊓ D_ )<sup>_I_</sup> = _C_<sup>_I_</sup> _∩ D_<sup>_I_</sup> 

- ( _C ⊔ D_ )<sup>_I_</sup> = _C_<sup>_I_</sup> _∪ D_<sup>_I_</sup> 

- ( _∀R.C_ )<sup>_I_</sup> = _{x | ∀y.R_<sup>_I_</sup> ( _x, y_ ) _→ C_<sup>_I_</sup> ( _y_ ) _}_ 

- ( _∃R.C_ )<sup>_I_</sup> = _{x | ∃y.R_<sup>_I_</sup> ( _x, y_ ) _∧ C_<sup>_I_</sup> ( _y_ ) _}_ Observe that this list is a subset of those listed in Table 3.1, as there are fewer features in _ALC_ cf. _SROIQ_ . 

One also can specify the notion of _satisfaction_ : 

- An interpretation _I_ satisfies the statement _C ⊑ D_ if _C_<sup>_I_</sup> _⊆ D_<sup>_I_</sup> 

- An interpretation _I_ satisfies the statement _C ≡ D_ if _C_<sup>_I_</sup> = _D_<sup>_I_</sup> 

- _C_ ( _a_ ) is satisfied by _I_ if _a_<sup>_I_</sup> _∈ C_<sup>_I_</sup> 

- _R_ ( _a, b_ ) is satisfied by _I_ if ( _a_<sup>_I_</sup> _, b_<sup>_I_</sup> ) _∈ R_<sup>_I_</sup> 

- An interpretation _I_ = (∆<sup>_I_</sup> _, ·_<sup>_I_</sup> ) is a _model_ of a knowledge base _KB_ if every axiom of _KB_ is satisfied by _I_ 

- A knowledge base _KB_ is said to be _satisfiable_ if it admits a model 

_Chapter 3. Description Logics_ 

58 

_Many_ DLs have be defined over the past 25 years and their complexity proved. For instance, one could add _I_ nverses to _ALC_ , giving _ALCI_ , or a _H_ ierarchy of roles, _ALCH_ , or _Q_ ualified cardinality restrictions; the appendix of the DL Handbook [BCM<sup>+</sup> 08] has the full list of letters and the features they denote. You also may like to have a look at the DL Complexity Navigator<sup>8</sup> . In the next chapter about OWL 2, we shall introduce a few more expressive languages, whereas ontologybased data access in Chapter 8 introduces _DL_ - _Lite_ that is less expressive than _ALC_ . 

#### **3.2.2 The DL** _SROIQ_ 

In this section, we summarise the various features that have been introduced informally above to provide a comprehensive definition of DL syntax. Doing so yields the description logic called _SROIQ_ , which is one of the most expressive DLs commonly considered today. It also largely agrees in expressivity with the ontology language OWL 2 DL, though there are still some differences as will be discussed in Chapter 4. 

Formally, every DL ontology is based on three finite sets of signature symbols: a set N _I_ of _individual names_ , a set N _C_ of _concept names_ and a set N _R_ of _role names_ . Usually these sets are assumed to be fixed for some application and are therefore not mentioned explicitly. Now the set of _SROIQ role expressions_ **R** (over this signature) is defined by the following grammar: 



where _U_ is the universal role (Section 3.1.2). Based on this, the set of _SROIQ concept expressions_ **C** is defined as: 



where _n_ is a non-negative integer. As usual, expressions like ( **C** _⊓_ **C** ) represent any expression of the form ( _C ⊓ D_ ) with _C, D ∈_ **C** . It is common to omit parentheses if this cannot lead to confusion with expressions of different semantics. For example, parentheses do not matter for _A ⊔ B ⊔ C_ whereas the expressions _A ⊓ B ⊔ C_ and _∃R.A ⊓ B_ are ambiguous. 

Using the above sets of individual names, roles and concepts, the _axioms_ of _SROIQ_ can be defined to be of the following basic forms: 



with the intuitive meanings as explained in Section 3.1.1 and 3.1.2. 

Roughly speaking, a _SROIQ_ ontology (or _knowledge base_ ) is simply a set of such axioms. To ensure the existence of reasoning algorithms that are correct 

> 8 `http://www.cs.man.ac.uk/ezolin/logic/complexity.html` 

_3.2. Important DLs_ 

59 

and terminating, however, additional syntactic restrictions must be imposed on ontologies. These restrictions refer not to single axioms but to the structure of the ontology as a whole, hence they are called _structural restrictions_ . The two such conditions relevant for _SROIQ_ are based on the notions of _simplicity_ and _regularity_ . Notably, both are automatically satisfied for ontologies that do not contain complex role inclusion axioms. 

A role _R_ in an ontology _O_ is called _non-simple_ if some complex role inclusion axiom (i.e., one that uses role composition _◦_ ) in _O_ implies instances of _R_ ; otherwise it is called _simple_ . A more precise definition of the non-simple role expressions of the ontology _O_ is given by the following rules: 

- if _O_ contains an axiom _S ◦ T ⊑ R_ , then _R_ is non-simple, 

- if _R_ is non-simple, then its inverse _R_<sup>_−_</sup> is also non-simple,<sup>9</sup> 

- if _R_ is non-simple and _O_ contains any of the axioms _R ⊑ S_ , _S ≡ R_ or _R ≡ S_ , then _S_ is also non-simple. 

All other roles are called simple.<sup>10</sup> Now for a _SROIQ_ ontology it is required that the following axioms and concepts contain simple roles only: 



The other structural restriction that is relevant for _SROIQ_ is called _regularity_ and is concerned with RBox axioms only. Roughly speaking, the restriction ensures that cyclic dependencies between complex role inclusion axioms occur only in a limited form. For details, please see [HKS06]. For the introductory treatment in this paper, it suffices to note that regularity, just like simplicity, is a property of the ontology as a whole that cannot be checked for each axiom individually. An important practical consequence is that the union of two regular ontologies may no longer be regular. This must be taken into account when merging ontologies in practice. 

The semantics of _SROIQ_ is shown in Tables 3.1 and 3.2. 

#### **3.2.3 Important fragments of** _SROIQ_ 

Many different description logics have been introduced in the literature. Typically, they can be characterised by the types of constructors and axioms that they allow, which are often a subset of the constructors in _SROIQ_ . For example, the description logic _ALC_ is the fragment of _SROIQ_ that allows no RBox axioms and only _⊓_ , _⊔_ , _¬_ , _∃_ and _∀_ as its concept constructors. It is often considered the most basic DL. The extension of _ALC_ with transitive roles is traditionally denoted by the letter 

> 9If _R_ = _S−_ already is an inverse role, then _R−_ should be read as _S_ . We do not allow expressions like _S_<sup>_−−_</sup> . 

> 10Whether the universal role _U_ is simple or not is a matter of preference that does not affect the computational properties of the logic [RKH08b]. However, the universal role in OWL 2 is considered non-simple. 

_Chapter 3. Description Logics_ 

60 

_S_ . Some other letters used in DL names hint at a particular constructor, such as inverse roles _I_ , nominals _O_ , qualified number restrictions _Q_ , and role hierarchies (role inclusion axioms without composition) _H_ . So, for example, the DL named _ALCHIQ_ extends _ALC_ with role hierarchies, inverse roles and qualified number restrictions. The letter _R_ most commonly refers to the presence of role inclusions, local reflexivity _Self_ , and the universal role _U_ , as well as the additional role characteristics of transitivity, symmetry, asymmetry, role disjointness, reflexivity, and irreflexivity. This naming scheme explains the name _SROIQ_ . 

In recent years, fragments of DLs have been specifically developed in order to obtain favourable computational properties. For this purpose, _ALC_ is already too large, since it only admits reasoning algorithms that run in worst-case exponential time. More light-weight DLs can be obtained by further restricting expressivity, while at the same time a number of additional _SROIQ_ features can be added without loosing the good computational properties. The three main approaches for obtaining light-weight DLs are _EL_ , _DLP_ and _DL-Lite_ , which also correspond to language fragments OWL EL, OWL RL and OWL QL of the Web Ontology Language. 

The _EL_ family of description logics is characterised by allowing unlimited use of existential quantifiers and concept intersection. The original description logic _EL_ allows only those features and _⊤_ but no unions, complements or universal quantifiers, and no RBox axioms. Further extensions of this language are known as _EL_<sup>+</sup> and _EL_<sup>++</sup> . The largest such extension allows the constructors _⊓_ , _⊤_ , _⊥_ , _∃_ , _Self_ , nominals and the universal role, and it supports all types of axioms other than role symmetry, asymmetry and irreflexivity. Interestingly, all standard reasoning tasks for this DL can still be solved in worst-case polynomial time. One can even drop the structural restriction of regularity that is important for _SROIQ_ . _EL_ - type ontologies have been used to model large but light-weight ontologies that consist mainly of terminological data, in particular in the life sciences. A number of reasoners are specifically optimised for handling _EL_ -type ontologies, the most recent of which is the ELK reasoner<sup>11</sup> for OWL 2 EL. 

DLP is short for _Description Logic Programs_ and comprises various DLs that are syntactically restricted in such a way that axioms could also be read as rules in first-order Horn logic without function symbols. Due to this, DLP-type logics can be considered as kinds of rule languages (hence the name OWL 2 RL) contained in DLs. To accomplish this, one has to allow different syntactic forms for subconcepts and superconcepts in concept inclusion axioms. We do not provide the details here. While DLs in general may require us to consider domain elements that are not denoted by individual names, for DLP one can always restrict attention to models in which all domain elements are denoted by individual names. This is why DLP is often used to augment databases (interpreted as sets of ABox axioms), e.g., in an implementation of OWL 2 RL in the Oracle 11g database management system. 

DL-Lite is a family of DLs that is also used in combination with large data collections and existing databases, in particular to augment the expressivity of a query language that retrieves such data. This approach, known as Ontology Based 

> 11 `http://elk-reasoner.googlecode.com/` 

_3.3. Reasoning services_ 

61 

Data Access, considers ontologies as a language for constructing _views_ or _mapping rules_ on top of existing data. The core feature of DL-Lite is that data access can be realised with standard query languages such as SQL that are not aware of the DL semantics. Ontological information is merely used in a query preprocessing step. Like DLP, DL-Lite requires different syntactic restrictions for subconcepts and superconcepts. It is the basis for the OWL 2 QL species of OWL ontology languages, and we will present its DL definition and its use in Chapter 8. 

### **3.3 Reasoning services** 

The reasoning services for DLs can be divided into so-called ‘standard’ reasoning services and ‘non-standard’ reasoning services. The former are more common and provided by all extant DL reasoners, whereas for the latter, new problems had been defined that needed specific algorithms, extensions, and interfaces to the standard ones. In this section, only the standard ones are considered; an example example of the latter is deferred to Section 7.5, because the ‘non-standard’ ones are typically focussed on assisting modellers in the ontology authoring process, rather than purely deriving knowledge only. 

#### **3.3.1 Standard reasoning services** 

Recalling the four essential components of (automated) reasoning listed in Section 2.2.2, the formal language in this case is a DL, and we take a closer look the choice of class of problems the software has to solve. The standard reasoning services are as follows, i.e., generally, all DL-focussed automated reasoners offer these services. 

- Consistency of the knowledge base ( _KB_ ⊭ _⊤⊑⊥_ ) 

   - Is the _KB_ = ( _T , A_ ) consistent (non-selfcontradictory), i.e., is there at least one model for _KB_ , i.e.: “can _all_ concepts and roles be instantiated without leading to a contradiction?” 

- Concept (and role) satisfiability ( _KB_ ⊭ _C ⊑⊥_ ) 

   - is there a model of _KB_ in which _C_ (resp. _R_ ) has a nonempty extension, i.e., “can that concept (role) have instances without leading to contradictions?” 

- Concept (and role) subsumption ( _KB |_ = _C ⊑ D_ ) 

   - i.e., is the extension of _C_ (resp. _R_ ) contained in the extension of _D_ (resp. _S_ ) in every model of _T_ (the TBox), i.e., ‘are all instances of _C_ also instances of _D_ ? 

- Instance checking ( _KB |_ = _C_ ( _a_ ) or _KB |_ = _R_ ( _a, b_ )) 

   - is _a_ (resp. ( _a, b_ )) a member of concept _C_ (resp. _R_ ) in _KB_ , i.e., is the fact _C_ ( _a_ ) (resp. _R_ ( _a, b_ )) satisfied by every interpretation of _KB_ ? 

_Chapter 3. Description Logics_ 

62 

- Instance retrieval ( _{a | KB |_ = _C_ ( _a_ ) _}_ ) 

   - find all members of _C_ in _KB_ , i.e., compute all individuals _a_ s.t. _C_ ( _a_ ) is satisfied by every interpretation of _KB_ 

You have used the underlying idea of concept subsumption both with EER and UML class diagrams, but then you did it all manually, like declaring that all cars are vehicles. Now, instead of you having to model a hierarchy of entity types/classes, we let the automated reasoner compute it for us thanks to the properties that have been represented for the DL concepts. 

The following two examples illustrate logical implication and concept subsumption. 

**Example 3.1. Logical implication** _Consider logical implication—i.e., KB |_ = _φ if every model of KB is a model of φ—with the following example:_ 

- _TBox: ∃_ teaches _._ Course _⊑¬_ Undergrad _⊔_ Professor 

   - _“The objects that teaches a course are not undergrads or professors”_ 

_• ABox:_ teaches(Thembi _,_ cs101) _,_ Course(cs101) _,_ Undergrad(Thembi) _This is depicted graphically in Figure 3.2. What does it entail, if anything? The only possibility to keep this logical theory consistent and satisfiable is to infer that Thembi is a professor, i.e., KB |_ = Professor(Thembi) _, because anything that teaches a course must be either not an undergrad or a professor. Given that Thembi is an undergrad, she cannot be not an undergrad, hence, she has to be a professor. ♦_ 



<!-- Start of picture text -->
teaches<br>~Undergrad v Professor Course<br>Undergrad teaches(Thembi, cs101) Course<br>cs101<br>Thembi<br><!-- End of picture text -->





<!-- Start of picture text -->
Thembi<br><!-- End of picture text -->



<!-- Start of picture text -->
cs101<br><!-- End of picture text -->

**Figure 3.2:** Top: Depiction of the TBox according to the given axiom; bottom: depiction of the ABox. See Example 3.1 for details. 

What will happen if we have the following knowledge base? 

- TBox: _∃_ teaches _._ Course _⊑_ Undergrad _⊔_ Professor 

• ABox: teaches(Thembi _,_ cs101), Course(cs101), Undergrad(Thembi) That is, do we obtain _KB |_ = Professor(Thembi) again? No. Perhaps the opposite, that _KB |_ = _¬_ Professor(Thembi)? No. Can you explain why? 

**Example 3.2. Concept subsumption** _As an example of concept subsumption, consider the knowledge base KB that contains the following axioms and is depicted graphically in Figure 3.3 (for intuitive purpose only):_ 

- HonsStudent _≡_ Student _⊓∃_ enrolled _._ BScHonsDegree 

- X _≡_ Student _⊓∃_ enrolled _._ BScHonsDegree _⊓∃_ hasDuty _._ TeachingAssistantShip 

_3.3. Reasoning services_ 

63 

- Y _≡_ Student _⊓∃_ enrolled _._ BScHonsDegree _⊓∃_ hasDuty _._ ProgrammingTask 

- X(John) _,_ BScHonsDegree(comp4) _,_ TeachingAssistantShip(cs101) _,_ enrolled(John, comp4) _,_ hasDuty(John, cs101) _,_ BScHonsDegree(maths4) _._ 

_KB |_ = X _⊑_ HonsStudent _? That is, is the extension of_ X _contained in the extension of_ HonsStudent _in every model of KB? Yes. Why? We know that both_ HonsStudent _and_ X _are subclasses of_ Student _and that both are_ enrolled _in an_ BScHonsDegree _programme. In addition, every instance of_ X also _has a duty performing a_ TeachingAssistantShip _for an undergrad module, whereas, possibly, not all honours students work as a teaching assistant. Thus, all_ X _’s are always also an instance of_ HonsStudent _in every possible model of KB, hence KB |_ = X _⊑_ HonsStudent _. And likewise for KB |_ = Y _⊑_ HonsStudent _. This deduction is depicted in green in Figure 3.4._ 

_Let us modify this a bit by adding the following two axioms to KB:_ 

- Z _≡_ Student _⊓∃_ enrolled _._ BScHonsDegree _⊓_ 

   - _∃_ hasDuty _._ (ProgrammingTask _⊓_ TeachingAssistantShip) 

- TeachingAssistantShip _⊑¬_ ProgrammingTask 

_What happens now? The first step is to look at_ Z _: it has the same properties as_ HonsStudent _,_ X _, and_ Y _, but now we see that each instance of_ Z _has as duty soothing that is both a_ ProgrammingTask _and_ TeachingAssistantShip _; hence, it must be a subconcept of both_ X _and_ Y _, because it refines them both. So far, so good. The second axiom tells us that the intersection of_ ProgrammingTask _and_ TeachingAssistantShip _is empty, or: they are disjoint, or: there is no object that is both a teaching assistantship and a programming task. But each instance of_ Z _has as duty to carry out a duty that is both a teaching assistantship and a programming task! This object cannot exist, hence, there cannot be a model where_ Z _is instantiated, hence,_ Z _is an unsatisfiable concept. ♦_ 





<!-- Start of picture text -->
comp4<br>maths4<br><!-- End of picture text -->



<!-- Start of picture text -->
X BScHonsDegree<br>enrolled<br>comp4<br>John maths4<br><!-- End of picture text -->



<!-- Start of picture text -->
comp4<br>maths4<br>TeachingAssistantShip<br>hasDuty<br>cs101<br><!-- End of picture text -->



<!-- Start of picture text -->
comp4<br>maths4<br><!-- End of picture text -->



<!-- Start of picture text -->
ProgrammingTask<br>hasDuty<br><!-- End of picture text -->

**Figure 3.3:** Graphical depiction of an approximation of _KB_ before checking concept subsumption ( _≡_ not shown, nor are the subsumptions to Student, so as to avoid too much clutter). 

#### **3.3.2 Techniques: a tableau for** _ALC_ 

The description of the deductions illustrated in the previous paragraph is an informal, high-level way of describing what the automated reasoner does when computing the concept hierarchy and checking for satisfiability. Clearly, such an informal way will not work as an algorithm to be implemented in a computer. There are 

_Chapter 3. Description Logics_ 

64 



<!-- Start of picture text -->
John<br><!-- End of picture text -->



<!-- Start of picture text -->
comp4<br>maths4<br><!-- End of picture text -->



<!-- Start of picture text -->
X BScHonsDegree<br>enrolled<br>comp4<br>John maths4<br><!-- End of picture text -->





<!-- Start of picture text -->
comp4<br>maths4<br><!-- End of picture text -->



<!-- Start of picture text -->
ProgrammingTask<br>hasDuty<br><!-- End of picture text -->



<!-- Start of picture text -->
cs101<br><!-- End of picture text -->

**Figure 3.4:** Graphical depiction of _K_ after checking concept subsumption; content in green is deduced. 

several proof techniques both in theory and in practice to realise the reasoning service. The most widely used technique at the time of writing (within the scope of DLs and the Semantic Web) is _tableau reasoning_ , and is quite alike what we have seen with tableau with full FOL. In short, it: 

1. Unfold the TBox 

2. Convert the result into negation normal form (NNF) 

3. Apply the tableau rules to generate more ABoxes 

4. Stop when none of the rules are applicable 

Then: 

- _T ⊢ C ⊑ D_ if all ABoxes contain clashes 

- _T_ ⊬ _C ⊑ D_ if some ABox does not contain a clash 

” _¬_ First, recall that one enters the tableau in Negation Normal Form (NNF), i.e., “ only in front of concepts. For DLs and _C_ and _D_ are concepts, _R_ a role, we use equivalences to obtain NNF, just like with FOL: 

- _¬¬C_ gives _C_ 

- _¬_ ( _C ⊓ D_ ) gives _¬C ⊔¬D_ 

- _¬_ ( _C ⊔ D_ ) gives _¬C ⊓¬D_ 

- _¬_ ( _∀R.C_ ) gives _∃R.¬C_ 

- _¬_ ( _∃R.C_ ) gives _∀R.¬C_ 

Second, there are the tableau rules. If there are more features, there will be more rules. These are the ones for _ALC_ : 

_⊓_ -rule: If ( _C_ 1 _⊓ C_ 2)( _a_ ) _∈ S_ but _S_ does not contain both _C_ 1( _a_ ) and _C_ 2( _a_ ), then _S_ = _S ∪{C_ 1( _a_ ) _, C_ 2( _a_ ) _}_ 

_⊔_ -rule: If ( _C_ 1 _⊔ C_ 2)( _a_ ) _∈ S_ but _S_ contains neither _C_ 1( _a_ ) nor _C_ 2( _a_ ), then _S_ = _S ∪{C_ 1( _a_ ) _}_ 

_S_ = _S ∪{C_ 2( _a_ ) _}_ 

_∀_ -rule: If ( _∀R.C_ )( _a_ ) _∈ S_ and _S_ contains _R_ ( _a, b_ ) but not _C_ ( _b_ ), then _S_ = _S ∪{C_ ( _b_ ) _}_ 

_∃_ -rule: If ( _∃R.C_ )( _a_ ) _∈ S_ and there is no _b_ such that _C_ ( _b_ ) and _R_ ( _a, b_ ), then _S_ = _S ∪{C_ ( _b_ ) _, R_ ( _a, b_ ) _}_ 

With these ingredients, it is possible to construct a tableau to prove that the aforementioned deductions hold. There will be an exercise about it, and we will see more aspects of automated reasoning in the lectures and exercises about OWL. 

_3.4. Exercises_ 

65 

### **3.4 Exercises** 

**Review question 3.1.** How are DLs typically different from full FOL? 

**Review question 3.2.** What are the components of a DL knowledge base? 

**Review question 3.3.** What are (in the context of DLs) the concept and role constructors? You may list them for either _ALC_ or _SROIQ_ . 

**Review question 3.4.** What distinguishes one DL from another? That is, e.g., _ALC_ is different from _SROIQ_ and from _EL_ ; what is the commonality of those 

**Review question 3.5.** Explain in your own words what the following _ALC_ reasoning tasks involve and why they are important for reasoning with ontologies: 

- a. Instance checking. 

- b. Subsumption checking. 

- c. Checking for concept satisfiability. 

**Exercise 3.1.** Consider again the natural language sentences from Exercise 2.6. Formalise them into a suitable DL, where possible. * 

**Exercise 3.2.** Consider the following TBox _T_ : 

_V egan ≡ Person ⊓∀eats.Plant_ 

_V egetarian ≡ Person ⊓∀eats._ ( _Plant ⊔ Dairy_ ) 

We want to know if _T ⊢ V egan ⊑ V egetarian_ . This we convert to a constraint system _S_ = _{_ ( _V egan ⊓¬V egetarian_ )( _a_ ) _}_ , which is unfolded (here: complex concepts on the left-hand side are replaced with their properties declared on the right-hand side) into: 

_S_ = _{Person ⊓∀eats.Plant ⊓¬_ ( _Person ⊓∀eats._ ( _Plant ⊔ Dairy_ ))( _a_ ) _}_ (3.24) 

Tasks: 

- a. Rewrite Eq. 3.24 into negation normal form 

- b. Enter the tableau by applying the rules until either you find a completion or only clashes. 

- c. _T ⊢ V egan ⊑ V egetarian_ ? * 

**Exercise 3.3.** In anticipation of using ontologies in computing and information systems, download and install Prot´eg´e 5.x, download the jar file of the “DL axiom renderer” from the course book’s website, and place it in the ‘plugins’ folder. Open Prot´eg´e and add it (click Window - Views - Class views - select DL axiom renderer - place cursor in desired position and click). Load the AWO, click on Lion, and inspect the DL axioms. It should look like the screenshot of Figure 3.5. Explore other classes similarly. 



<!-- Start of picture text -->
Active ontology «| Entitiesx| Classes «| Object properties x Individuals by class x |Query DL =.<br>Class hierarchy | Class hierarchy (inferred DL Class Axiom Renderer. De@e<br>Class hierarchy: giraffe eat =[OE3) giraffe < Veats.(Twig u leaf)<br>ts+ |S. iat ~ Qgifaffegiraffe n= animallion = 1<br>¥- @ ow!:Thing<br>Vv @ animal<br>~~ © carnivore<br>>» © herbivore<br><!-- End of picture text -->

### CHAPTER 4 

### The Web Ontology Language OWL 2 

In the previous two chapters we have seen first FOL and then a version of it that was slightly changed with respect to notation and number of features in the language (easier, and less, respectively), being the DL family of languages. They haven’t gotten us anywhere close to implementations, however. This is set to change in this chapter, where we will look at ‘implementation versions’ of DLs that have rich tooling support. We will take a look at the computational use of DLs with a so-called _serialization_ to obtain computer-processable versions of an ontology and _automated reasoning_ over it. The language that we will use to serialise the ontology is the most widely used ontology language for computational purposes, being the Web Ontology Language OWL. OWL was standardised first in 2004 and a newer version was standardised in 2009, which has fuelled tool development and deployment of ontologies in ontology-driven information systems. OWL looks like yet another a language and notation to learn, but the ones that we will consider (the DL-based ones) have the same underlying principles. It does have a few engineering extras, which also has as consequence that there are several ways to serialise the ontology so as to cater for software developers’ preferences. Thus, theoretically, there is not really anything substantially new in this chapter, but there will be many more options and exercises to practically engage with the ontology languages, automated reasoning, and toy ontologies to play with on the computer. Depending on your interests, things start to get ‘messy’ (for a theoretician) or finally concrete (for an engineer). 

OWL actually constitutes a family of languages consisting of OWL “species”, and we will focus on those species that are based on DLs, which are all fragments of the most expressive one, OWL 2 DL. To understand how these species came about in the way they are, with these features and not others, we will touch upon OWL in Section 4.1 first, which will shed light on questions such as: What goes into standardising a language? Why precisely these ones came out of the efforts, and in this way? Why should an ontology engineer even consider the previous version and not only the latest? 

67 

_Chapter 4. The Web Ontology Language OWL 2_ 

68 

Afterward, an overview of the DL-based OWL 2 languages is provided in Section 4.2. Yes, plural; that’s not a typo. As we shall see, there are good reasons for it both from a computational viewpoint for scalable implementations and to please the user-base. The computational aspect is summarised in Section 4.2.4. If you have completed a course on theory of computation, this will be easy to follow. If not, you would want to consult Appendix D, which provides an explanation why one _cannot_ have it all, i.e., both a gazillion of language features and good performance of an ontology-driven information system. Experience has seen that that sort of trade-off can annoy a domain expert become disappointed with ontologies; Section 4.2.4 (and the background in Appendix D) will help you explain to domain experts it’s neither your fault nor the ontology’s fault. Finally, OWL does not exist in isolation—if it were, then there would be no tools that can use OWL ontologies in information systems. Section 4.3 therefore sets it in context of the Semantic Web—heralded as a ‘next generation’ World Wide Web—and shows that, if one really wants the extra expressiveness, it can fit in another logic framework and system even up to second order logic with the Distributed Ontology, Model, and Specification Language (DOL) and its software infrastructure. 

### **4.1 an Standardising ontology language** 

This section and the next one are intentionally kept short, as listing language features isn’t the most interesting of content, those lists exist also online in the standard<sup>1</sup> , and are not meant to be memorised but to be consulted as the need arises. This section and the next one, instead, focus on the gist of it and provide some contextual information. 

#### **4.1.1 Historical notes** 

Before OWL, there were a plethora of ontology languages, such as the `obo` format (directed acyclic graphs) initiated by the Gene Ontology Consortium, KL-ONE, and F-logic (frames, and older versions of the Prot´eg´e ODE). Unsurprisingly, this caused ontology interoperation problems even at the syntactic level and hampered development and use of ontology tools, hence, its uptake. To solve those issues, researchers set out to standardise a logic language. At the time that people sat at the standardisation table (first around 2001) of the World Wide Web Consortium (W3C), there were several logics that had a considerable influence on the final product, most notably the SHOE, DAML-ONT, OIL, and DAML+OIL languages, and, more generally, the fruits of 20 years of research on languages and prototyping of automated reasoners by the DL community. 

Following good engineering practices, a document of requirements and objectives was devised to specify what such an ontology language for the Semantic Web should meet. It is useful to list them here, so that you can decide yourself how well OWL meets them, as well as any contender languages, or if you would 

> 1start with a general non-technical overview in the OWL primer `http://www.w3.org/TR/ owl2-primer/` . 

_4.1. Standardising an ontology language_ 

69 

want to design one of your own. It specified the following _design goals_ : Shareable; Change over time; Interoperability; Inconsistency detection; Balancing expressivity and complexity; Ease of use; Compatible with existing standards; and Internationalisation. There were also _requirements_ on the features of the language. They were: Ontologies are objects on the Web; they have their own meta-data, versioning, etc.; Ontologies are extendable; They contain classes, properties, data-types, range/domain, individuals; they must be able to express equality for classes and for individuals; Classes as instances; Cardinality constraints; and XML syntax<sup>2</sup> . 

First, as standardisation is typically consensus-based, there was, on the one hand, a language called _OWL full_ with RDF-based semantics (graphs) and two DL-based species, being _OWL lite_ and _OWL DL_ . But what makes OWL a Semantic Web language compared to the regular DL languages that were introduced in the previous chapter? This is the second step. There are the following main differences: 

- OWL uses URI references as names; e.g., `http://www.mysite.co.za/UniOnto.owl#Student` is the URI of the class Student in the ontology with file name `UniOnto.owl` file that is online at `http://www.mysite.co.za` ; 

- It gathers information into ontologies stored as documents written in RDF/XML including things like `owl:imports` to import one ontology into another; e.g. another ontology, `HigherEd.owl` can import the `UniOnto.owl` so that the class `http://www.mysite.co.za/UniOnto.owl#Student` becomes, in a way, part of `HigherEd.owl` (though it still exists independently as well); 

- It adds RDF data types and XML schema data types for the ranges of data properties (attributes), so one can use, e.g., `string` and `integer` in a similar way as you are familiar with in UML class diagrams and databases. 

- A different terminology: a DL concept is now called a _class_ , a DL role is called an _object property_ , and _data property_ is added for attributes (i.e., the relation that relates a class to a data type). 

With this information, we can start going from a paper-based representation to its computational version. The first steps are illustrated in the next example, which will be extended in later chapters. 

**Example 4.1.** _The African Wildlife Ontology (AWO) is a basic tutorial ontology based on the examples in the “A Semantic Web Primer” book [AvH03]. The fist step is to represent that in OWL, using your favourite ontology development environment (ODE). An OWL version of it,_ `AfricanWildlifeOntology0.owl` _, has 10 classes and 3 object properties concerning animals such as_ Lion _,_ Giraffe _,_ Plant _, and object properties_ eats _and_ is-part-of _, and has annotations that give an idea of what should be modelled (else: see 4.3.1 pages 119-133 in [AvH03]). Upon running the reasoner, it will classify, among others, that_ Carnivore _is a subclass of_ Animal _(i.e, AWO |_ = Carnivore _⊑_ Animal _)._ 

> 2The “making of an ontology language” article [HPSvH03] gives a longer general historical view and it also summarises OWL with its three species (OWL lite, OWL-DL, and OWL full). The details of the standard are freely available at `http://www.w3.org/TR/owl-ref/` . 

_Chapter 4. The Web Ontology Language OWL 2_ 

70 

_This is not really exciting, and the tutorial ontology is not of a particularly good quality. First, we_ extend _it by having loaded the ontology and adding knowledge to it: among others, proper parthood, a few more plant parts and animals, such as_ Impala _,_ Warthog _, and_ RockDassie _. This version of the AWO is named_ `AfricanWildlifeOntology1.owl` _. With this additional knowledge, warthogs are classified as omnivores, lions as carnivores, giraffes as herbivores, and so on._ 

_Another aspect is purely engineering practice: if the intention is to put the ontology online, it should be_ named _properly, i.e., the URI has to be set so that its contents can be identified appropriately on the Semantic Web; that is, do not simply use the default URI generated by the tool (e.g.,_ _`http://www.semanticweb.org/ ontologies/2018/0/Ontology1357204526617.owl` ), but specify an appropriate one where the ontology will be published, like_ _`http://www.meteck.org/files/ ontologies/myAWO.owl` . ♦_ 

#### **4.1.2 The OWL 1 family of languages** 

Purely for legacy purposes, I include here the first three ‘species’ of OWL (version 1). This because 1) there are still plenty of ontologies around that are represented in either of these languages and you may have to deal with them, and 2) OWL DL seems to be a fairly good ‘sweet spot’ in the expressivity/complexity trade-off, meaning: still being able to represent the domain fairly well, or at least sufficiently to the extent that the increased expressiveness of OWL 2 DL doesn’t weigh up against the increased slowness of completing the reasoning tasks. The key points to remember are: 

- OWL Lite and OWL DL are DL-based, with model-theoretic semantics. 

- OWL DL is more expressive than OWL Lite, but one does not gain a lot computationally, so OWL Lite was hardly used explicitly. 

- OWL full never really took off either. 

- There are multiple syntaxes for the serialisation: functional-style syntax (optional) and RDF/XML (required for tool interoperability). 

**OWL Lite** has a classification hierarchy and (relative to OWL DL) simple constraints. While OWL Lite has strong syntactic restrictions, it has only limited semantics restrictions compared to OWL DL<sup>3</sup> . OWL Lite corresponds to the DL _SHIF_ ( _D_ ). Putting the DL symbols to the names of the features, we have: 

- Named classes ( _A_ ) 

- Named properties ( _P_ ) 

> 3More specifically regarding the latter, if you really want to know: negation can be encoded using disjointness and with negation and conjunction, you can encode disjunction. Take, for instance: `Class(C complete unionOf(B C))` This is equivalent to `DisjointClasses(notB B) DisjointClasses(notC C) Class(notBandnotC complete notB notC) DisjointClasses(notBandnotC BorC) Class(C complete notBandnotC)` 

_4.2. OWL 2_ 

71 

- Individuals ( _C_ ( _o_ )) 

- Property values ( _P_ ( _o, a_ )) 

- Intersection ( _C ⊓ D_ ) 

- Union ( _C ⊔ D_ ) 

- Negation ( _¬C_ ) 

- Existential value restrictions ( _∃P.C_ ) 

- Universal value restrictions ( _∀P.C_ ) 

- Unqualified (0/1) number restrictions ( _≥ nP_ , _≤ nP_ , = _nP_ ), 0 _≤ n ≤_ 1 

**OWL DL** had, at the time, ‘maximal’ expressiveness while maintaining tractability, and has, as the name suggestion, an underlying DL. It has all the features of OWL-lite, and, in addition: Negation, Disjunction, (unqualified) Full cardinality, Enumerated classes, and hasValue. OWL DL corresponds to the DL _SHOIN_ ( _D_ ). It has the following features: 

- All OWL Lite features 

- Arbitrary number restrictions ( _≥ nP_ , _≤ nP_ , = _nP_ ), with 0 _≤ n_ 

- Property value ( _∃P.{o}_ ) 

- Enumeration ( _{o_ 1 _, ..., on}_ ) 

**OWL Full** , has a very high expressiveness (losing tractability) and all syntactic freedom of RDF (self-modifying). OWL full has meta-classes and one can modify the language. Note that OWL Full is _not_ a Description Logic. 

As mentioned earlier, OWL and DLs are tightly related, in particular OWL Lite and OWL DL. They have, just like their base DLs, a model theoretic semantics. Table 4.1 shows a few examples of some OWL syntax and its DL counterpart notation. There is also the not-for-human-consumption RDF/XML serialisation. 

**Table 4.1:** Some examples of OWL’s construct, the same in DL notation, and an example. 

|OWL Construct|DL notation|Example|
|---|---|---|
|`intersectionOf`|_C_1_⊓... ⊓Cn_|Human_⊓_Male|
|`unionOf`|_C_1_⊔... ⊔Cn_|Doctor_⊔_Lawyer|
|`complementOf`|_¬C_|_¬_Male|
|`oneOf`|_{o_1_, ..., on}_|_{_giselle_,_juan_}_|
|`allValuesFrom`|_∀P.C_|_∀_hasChild_._Doctor|
|`someValuesFrom`|_∃P.C_|_∃_hasChild_._Lawyer|
|`value`|_∃P.{o}_|_∃_citizenOf_.{_RSA_}_|
|`minCardinality`|_≥nP_|_≥_2 hasChild|
|`maxCardinality`|_≤nP_|_≤_6 enrolledIn|



### **4.2 OWL 2** 

Over the past 16 years, OWL has been used across subject domains, but in the early years mostly by the health care and life sciences disciplines. Experimentation with the standard revealed expected as well as unexpected shortcomings in addition 

_Chapter 4. The Web Ontology Language OWL 2_ 

72 

**Table 4.2:** Some examples of OWL’s axioms, the same in DL notation, and an example. 

|OWL Axiom|DL|Example|
|---|---|---|
|`SubClassOf`|_C_1 _⊑C_2|Human_⊑_Animal_⊓_Biped|
|`EquivalentClasses`|_C_1 _≡... ≡Cn_|Man_≡_Human_⊓_Male|
|`SubPropertyOf`|_P_1 _⊑P_2|hasDaughter_⊑_hasChild|
|`EquivalentProperties`|_P_1 _≡... ≡Pn_|cost_≡_price|
|`SameIndividual`|_o_1 =_..._=_on_|President<br>~~Z~~uma=J<br>~~Z~~uma|
|`DisjointClasses`|_Ci ⊑¬Cj_|Male_⊑¬_Female|
|`DifferentIndividuals`|_oi_ =_oj_|Thabo=Andile|
|`inverseOf`|_P_1 _≡P _<sup>_−_</sup><br>2|hasChild_≡_hasParent<sup>_−_</sup>|
|`transitiveProperty`|_P_ <sup>+</sup> _⊑P_|ancestor<sup>+</sup> _⊑_ancestor,<br>denoted also as Trans(ancestor)|
|`symmetricProperty`|_P ≡P _<sup>_−_</sup>|Sym(connectedTo)|
|`functionalProperty`|_⊤⊑≤_1_P_|_⊤⊑≤_1hasPresident|
|`inverseFunctionalProperty`|_⊤⊑≤_1_P _<sup>_−_</sup>|_⊤⊑≤_1hasIDNo<sup>_−_</sup>|



to the ideas mentioned in the “Future extensions” section of [HPSvH03], so that a successor to OWL was deemed to be of value. Work towards a standardisation of an OWL 2 took shape after the OWL Experiences and Directions workshop in 2007 and a final draft was ready by late 2008. On October 27 2009 it became the official OWL 2 W3C recommendation<sup>4</sup> . What does OWL 2 consist of—new and improved!—and what does it fix with respect to the OWL standard of 2004? Let’s consider the answers to these questions in the remainder of this section. 

##### **Limitations of OWL—as experienced by the practitioners** 

OWL 2 aims to address the issues described in section 2 of [CGHM<sup>+</sup> 08] to a greater or lesser extent, which is neither a superset nor subset of [HPSvH03]’s ideas for possible extensions. For instance, an OWL 1 possible future feature was catering for the Unique Name Assumption, but that did not make it into OWL 2, despite that it has quite an effect on the complexity of a language [ACKZ09]. We briefly summarise the interesting issues; refer to [CGHM<sup>+</sup> 08] for details. 

_Expressivity limitations._ First, it is not possible to express _qualified cardinality restrictions_ in OWL. For instance, one can state Bicycle _⊑≥_ 2 hasComponent. _⊤_ or Bicycle _⊑∃_ hasComponent.Wheel, but not Bicycle _⊑≥_ 2 hasComponent.Wheel. This was deemed an important shortcoming in OWL DL by its modellers. Second, some relational properties were perceived to be missing, notably reflexivity and irreflexivity, so one could not represent the class Narcissist (someone who loves him/herself), and not state that proper parthood is irreflexive, yet an irreflexive partOf relation is important in medicine and biology. Third, there were also limitations on data types; e.g., one cannot express restrictions to a subset of datatype values (ranges) and relationships between values of data properties on one object. Last, there were also some ‘housekeeping’ features missing, such as annotations, 

> 4 `http://www.w3.org/TR/2009/REC-owl2-overview-20091027/` 

_4.2. OWL 2_ 

73 

imports, versioning, and species validation (see p315 of [CGHM<sup>+</sup> 08] for details). 

_Syntax problems._ OWL has both a frame-based legacy (Abstract syntax) and axioms (DL), which was deemed too confusing. For instance, take the following axiom: 

```
Class(Apartialrestriction(hasBsomeValuesFrom(C))
```

What type of ontology elements do we have? Is `hasB` is data property and `C` a datatype, or is `hasB` an object property and `C` a class? OWL-DL has a strict separation of the vocabulary, but the specification does not precisely specify how to enforce this separation at the syntactic level. In addition, RDF’s triple notation is difficult to read and process. 

_Problems with the semantics._ We shall not cover this issue. (For the curious: this has to do with RDF’s blank nodes, but unnamed individuals not directly available in _SHOIN_ ( _D_ ), and frames and axioms). 

##### **Overview of OWL 2** 

Complex systems have a tendency to become more, rather than less, complex, and so it is for OWL 2, mainly regarding new features and more new languages. First, have a look at the ‘orchestration’ of the various aspects of OWL 2 in Figure 4.1. The top section indicates several syntaxes that can be used to serialize the ontology, where RDF/XML is required and the other four are optional. There are mappings between an OWL ontology and RDF graph in the middle, and the lower half depicts that there is both a direct semantics, for OWL 2 DL-based species, and an RDFbased one, for OWL 2 full. Note that while that “mapping” between “ontology structure” and “RDF Graph” and that “correspondence theorem” between “Direct semantics” and “RDF-based semantics” exist, this does not mean they’re all the same thing. The DL-based OWL 2 species have a mapping into RDF for the serialisation, but they do not have an RDF-based semantics. 

Second, the OWL 2 DL species is based on the DL _SROIQ_ ( _D_ ) [HKS06]. It is more expressive than the underlying DL of OWL DL ( _SHOIN_ ( _D_ )) and therewith meeting some of the modellers’ requests, such as more properties of properties and qualified number restrictions (see below). There is cleaner support for annotations, debatable (from an ontological perspective, that is) punning for metamodelling, and a ‘key’ that is not a key in the common sense of keys in conceptual data models and databases. Also, it irons out some difficulties that tool implementers had with the syntaxes of OWL and makes importing ontologies more transparent. 

Third, there are three OWL 2 profiles, which are sub-languages of (syntactic restrictions on) OWL 2 DL so as to cater for different purposes of ontology usage in applications. At the time of standardisation, they already enjoyed a considerable user base. This choice has its consequences that very well can, but may not necessarily, turn out to be a positive one in praxis; this will be explored further in the block on ontology engineering. The three profiles are: 

- **OWL 2 EL** , which is based on the _EL_<sup>++</sup> language [BBL05], intended for use with large relatively simple type-level ontologies; 

- **OWL 2 QL** , which is based on the _DL_ - _LiteR_ language [CGL<sup>+</sup> 07], intended 



<!-- Start of picture text -->
RDF/XML _— Gi<br>functional ~ = owyxML<br>document ~ document<br>\ 3] = ef +<br>licedocumentsyntax ~ Cow,‘“ SSWM,ES)©,%, %, 3=22a) | £>Fa2c eygvoneweya7& f documentTurtle<br>ae© ER 5; 4 ov gs7 ew %<br>Onfo. ~ti \ } o OV"wo 4aey<br>2G, Ney ~ ‘ “ f peeee “<br>Fay)~~ «> “adf 3“ Pr“eS<br>import ~m OWL 2 Ontology L -x 3<br>Ontology —_ RDF Syntax layer<br>Structure MapningDp ‘Graph J Semantics layer<br>Direct Semantics | _ _‘ome*Pondence theorem (for DLsubset! | poe. Based Semantics<br><!-- End of picture text -->

_4.2. OWL 2_ 

75 

- Qualified cardinality restrictions, _≥ nR.C_ and _≤ nR.C_ (the _Q_ in _SROIQ_ ): 

   - ( _≥ nR.C_ )<sup>_I_</sup> = _{x | ♯{y |_ ( _x, y_ ) _∈ R_<sup>_I_</sup> _∩ y ∈ C_<sup>_I_</sup> _} ≥ n}_ In OWL 2: `ObjectMinCardinality(n OPE CE)` ; an example in DL notation: _≥_ 3 hasPart _._ Door 

   - ( _≤ nR.C_ )<sup>_I_</sup> = _{x | ♯{y |_ ( _x, y_ ) _∈ R_<sup>_I_</sup> _∩ y ∈ C_<sup>_I_</sup> _} ≤ n}_ In OWL 2: `ObjectMaxCardinality(n OPE CE)` , an example in DL notation: _≤_ 2 enrolledIn _._ UGDegree 

   - The difference between the _unqualified_ cardinality constraint (the _N_ in OWL DL’s _SHOIN_ ) and _qualified_ cardinality constraint (the _Q_ in OWL 2 DL’s _SROIQ_ ) is the difference between aforementioned Bicycle _⊑≥_ 2 hasComponent. _⊤_ and Bicycle _⊑≥_ 2 hasComponent.Wheel, respectively. 

- Properties of roles (the _R_ in _SROIQ_ ): 

   - Reflexive (globally): Ref( _R_ ), with semantics: 

      - _∀x_ : _x ∈_ ∆<sup>_I_</sup> implies ( _x, x_ ) _∈_ ( _R_ )<sup>_I_</sup> 

Example: the connection relation (everything is connected to itself). 

   - Reflexive (locally): _∃R._ Self, with semantics: 

      - _{x |_ ( _x, x_ ) _∈ R}_ 

      - In OWL 2: `ObjectHasSelf (OPE)` ; e.g., _∃_ knows _._ Self to state you know yourself. 

   - Irreflexive: Irr( _R_ ), with semantics: _∀x_ : _x ∈_ ∆<sup>_I_</sup> implies ( _x, x_ ) _∈/_ ( _R_ )<sup>_I_</sup> For instance, proper parthood is irreflexive: something cannot be proper part of itself. 

   - Asymmetric: Asym( _R_ ), with semantics: 

      - _∀x, y_ : ( _x, y_ ) _∈_ ( _R_ )<sup>_I_</sup> implies ( _y, x_ ) _∈/_ ( _R_ )<sup>_I_</sup> For instance, Asym(parentOf): if John is the parent of Divesh, then Divesh cannot be the parent of John. 

- _Limited_ role chaining (also covered with the _R_ in _SROIQ_ ): e.g., _R ◦ S ⊑ R_ , with semantics: _∀y_ 1 _, . . . , y_ 4 : ( _y_ 1 _, y_ 2) _∈_ ( _R_ )<sup>_I_</sup> and ( _y_ 3 _, y_ 4) _∈_ ( _S_ )<sup>_I_</sup> imply ( _y_ 1 _, y_ 4) _∈_ ( _R_ )<sup>_I_</sup> , and regularity restriction (strict linear order (“ _<_ ”) on the properties). For instance: childOf _◦_ childOf _⊑_ grandchildOf so that one can deduce that the child of a child is that person’s grandchild, and the uncle example in Chapter 3. 

The tricky part especially in practical ontology development is that some object property features and axioms work only on _simple_ object properties, ‘simple’ meaning that it has no direct or indirect subproperties that are either transitive or are defined by means of property chains; see section 11.1 of the OWL Structural Specification and Functional-Style Syntax for the exact specification of this limitation. Practically, this means that the following features can be used only on simple object properties: `ObjectMinCardinality` , `ObjectMaxCardinality` , `ObjectExactCardinality` , `ObjectHasSelf` , `FunctionalObjectProperty` , `InverseFunctionalObjectProperty` , `IrreflexiveObjectProperty` , 

_Chapter 4. The Web Ontology Language OWL 2_ 

76 

`AsymmetricObjectProperty` , and `DisjointObjectProperties` . Two examples of what this concretely means when you’re trying to develop an ontology are illustrated next. 

**Example 4.2.** _In the first example, the ontologist has to choose between transitivity or qualified number restrictions, but cannot have both. This gives a modeller options within OWL 2 DL, using cake with its ingredients as example:_ 

- _1)_ Cake has ingredient _any number of_ Edible substance _s and one would be able to infer that if_ Milk _is an_ ingredient of Butter _that is an_ ingredient of Cake _, then_ Milk _is an_ ingredient of Cake _; i.e.,_ hasIngredient _and its inverse,_ ingredientOf _is transitive; or_ 

- _2) a (standard)_ Cake has ingredients _at least four_ Edible substance _s, but it cannot be inferred that the_ Milk _is an_ ingredient of _the_ Cake _; i.e.,_ hasIngredient _participates in a qualified number restriction._ 

_Another modelling trade-off is the following one. Alike the_ uncle _example in Chapter 3, one can specify a role chain for aunts, e.g.:_ hasMother _◦_ hasSister _⊑_ hasAunt _. It certainly holds that_ hasMother _is asymmetric (your mother cannot be your child), i.e.,_ Asym(hasMother) _. Each axiom can be represented in an OWL 2 DL ontology, yet, one cannot assert both the property chain and antisymmetry in the same OWL 2 DL ontology. ♦_ 

The ontology development environment probably will warn you about such syntax violations, and will prevent you from running the reasoner. It may say something cryptic like “internal reasoner error” and the log file will have an entry returned by the OWL API with the offending axioms, along the line of: 

```
Anerroroccurredduringreasoning:Non-simpleproperty
’<ex#hasIngredient>’oritsinverseappearsinthecardinality
restriction’ObjectMaxCardinality(4<ex#hasIngredient>
<ex#EdibleSubstance>)’.
```

where the `ex` is the ontology’s URI. If it happens, you will have to decide which of the two axioms is the more important one to keep, or choose another, more expressive, logic beyond OWL 2 DL. One ‘way out’ to this problem will pass the revue in Section 4.3.2. 

#### **4.2.2 OWL 2** 

The main rationale for the profiles are computational complexity considerations and robustness of implementations with respect to _scalable_ applications. Their features are summarised here. Note that you are not expected to learn the following lists of features by heart (it can be used as a quick ‘cheat sheet’), but you do need to know, at least, their intended purpose. The more you practice developing ontologies, the easier it becomes to remember them. To assist with grasping language features actually used in a particular ontology—be it the three OWL 1 species or the five OWL 2 species—the OWL Classifier can be used. It lists in which OWL species one’s OWL ontology is and why it violates the other species (i.e., creates 

_4.2. OWL 2_ 

77 

a justification of the reported expressivity)<sup>5</sup> , and therewith provides features that are not available in currently popular ontology editors such as Prot´eg´e. 

##### **OWL 2 EL** 

OWL 2 EL is intended for large ‘simple’ ontologies and focuses on type-level knowledge (TBox). It has a better computational behaviour than OWL 2 DL . It is based on the DL language _EL_<sup>++</sup> (PTime complete), and it is used for the large medical terminology SNOMED CT [SNO12], among others. The listing of OWL 2 EL features is included in Appendix C. 

##### **OWL 2 QL** 

OWL 2 QL aims at scenarios for query answering over a large amount of data with the same kind of performance as relational databases (Ontology-Based Data Access; see Chapter 8). Its expressive features cover several used features of UML Class diagrams and ER models. It is based on _DL_ - _LiteR_ (though more is possible with the Unique Name Assumption and in some implementations). 

The supported axioms in OWL 2 QL take into account what one can use on the left-hand side of the inclusion operator ( _⊑_ , `SubClassOf` ) and what can be asserted on the right-hand side, which turns it into a fairly long list due to the intricate exclusions. The listing of OWL 2 QL features is included in Appendix C. 

##### **OWL 2 RL** 

OWL 2 RL’s development was motivated by what fraction of OWL 2 DL can be expressed by rules (with equality) and scalable reasoning in the context of RDF(S) application. It uses rule-based technologies (forward chaining rule system, over _instances_ ) and is inspired by Description Logic Programs and pD*. Reasoning in PTime. 

The list of features supported in OWL 2 RL is easily specified: 

- More restrictions on class expressions (see table 2 of [MGH<sup>+</sup> 09]; e.g., no SomeValuesFrom on the right-hand side of a subclass axiom) 

- All axioms in OWL 2 RL are constrained in a way that is compliant with the restrictions in Table 2. 

- Thus, OWL 2 RL supports all axioms of OWL 2 apart from disjoint unions of classes and reflexive object property axioms. 

A quick one-liner of the difference with OWL 2 DL is: No _∀_ and _¬_ on the left-hand side, and _∃_ and _⊔_ on right-hand side of _⊑_ . 

#### **4.2.3 OWL 2 syntaxes** 

There are more syntaxes for OWL 2 than for OWL, as we have seen in Figure 4.1. Consider the DL axiom 

> 5Source code and tool: `https://github.com/muhummadPatel/OWL_Classifier` ; for a brief explanation of its use, see `https://keet.wordpress.com/2016/06/19/ an-exhaustive-owl-species-classifier/` . 

_Chapter 4. The Web Ontology Language OWL 2_ 

78 

FirstYearCourse _⊑∀_ isTaughtBy.Professor Rendering this in RDF/XML yields: 

_<_ ! _−−_ http://www.semanticweb.org/ontologies/2017/6/exOKB17.owl#FirstYearCourse _−−>_ 

_<_ owl:Class rdf:about=”&exOKB17;FirstYearCourse” _> <_ rdfs:subClassOf rdf:resource=”&owl;Thing”/ _> <_ rdfs:subClassOf _> <_ owl:Restriction _> <_ owl:onProperty rdf:resource=”&exOKB17;isTaughtBy”/ _> <_ owl:allValuesFrom rdf:resource=”&exOKB17;Professor”/ _> <_ /owl:Restriction _> <_ /rdfs:subClassOf _> <_ /owl:Class _>_ 

This RDF/XML fragment tells us that the ontology is called `exOKB17` (abbreviated name for the full URI), `FirstYearCourse` is a `subClassOf` the root-class `Thing` , and a subclass of the restriction on `FirstYearCourse` , being that the restriction is `owl:onProperty` object property `isTaughtBy` and the ‘filler’, i.e., to which the restriction applies, is `allValuesFrom` (i.e., _∀_ ) `Professor` . 

In OWL/XML (also not intended for human consumption), we have the same as follows: 

_<_ SubClassOf _> <_ Class IRI=”#FirstYearCourse”/ _> <_ Class abbreviatedIRI=”owl:Thing”/ _> <_ /SubClassOf _> <_ SubClassOf _> <_ Class IRI=”#FirstYearCourse”/ _> <_ ObjectAllValuesFrom _> <_ ObjectProperty IRI=”#isTaughtBy”/ _> <_ Class IRI=”#Professor”/ _> <_ /ObjectAllValuesFrom _> <_ /SubClassOf _>_ 

The functional syntax equivalent is as follows: 

Declaration(Class(:FirstYearCourse)) SubClassOf(:FirstYearCourse owl:Thing) SubClassOf(:FirstYearCourse ObjectAllValuesFrom(:isTaughtBy :Professor)) 

The Manchester syntax rendering is intended exceedingly for human reading, for non-logicians, and for ease of communication in, say, emails that do not render mathematical symbols well. On the one hand, there is a Prot´eg´e-generated Manchester syntax rendering: 

Class: _<_ http://www.semanticweb.org/ontologies/2017/6/exOKB17.owl#FirstYearCourse _>_ 

SubClassOf: 

owl:Thing, 

_<_ http://www.semanticweb.org/ontologies/2017/6/exOKB17.owl#isTaughtBy _>_ only _<_ http://www.semanticweb.org/ontologies/2017/6/exOKB17.owl#Professor _>_ 

But this usually gets abbreviated as follows: 

Class: FirstYearCourse SubClassOf: 



<!-- Start of picture text -->
A<br>\<br>e ng FirstYearCourse — isTaughtBy(Subclass all) -> Professor<br>e First¥earCourse<br><!-- End of picture text -->

_Chapter 4. The Web Ontology Language OWL 2_ 

80 

|**Combined**<br>**Com-**<br>**plexity**<br>Undecidable<br>2NEXPTIME-<br>complete (NEXPTIME<br>if property hierarchies<br>are bounded)<br>Decidability open<br>PTIME-complete<br>PSPACE-Complete<br>NLogSpace-complete<br>NP-complete<br>PTIME-complete<br>NP-complete<br>NEXPTIME-complete<br>Decidability open|
|---|
|**Query**<br>**Com-**<br>**plexity**<br>Undecidable<br>Not Applicable<br>Decidability open<br>Not Applicable<br>NP-Complete<br>Not Applicable<br>NP-complete<br>Not Applicable<br>NP-complete<br>Not Applicable<br>Decidability open|
|**Data**<br>**Com-**<br>**plexity**<br>Undecidable<br>Decidable,<br>but<br>complexity<br>open<br>(NP-Hard)<br>Decidability open<br>PTIME-complete<br>PTIME-complete<br>in AC0<br>in AC0<br>PTIME-complete<br>PTIME-complete<br>Decidable,<br>but<br>complexity<br>open<br>(NP-Hard)<br>Decidability open|
|**Taxonomic Com-**<br>**plexity**<br>Undecidable<br>2NEXPTIME-<br>complete<br>(NEXP-<br>TIME<br>if<br>property<br>hierarchies<br>are<br>bounded)<br>Decidability open<br>PTIME-complete<br>PTIME-complete<br>NLogSpace-complete<br>NLogSpace-complete<br>PTIME-complete<br>PTIME-complete<br>NEXPTIME-complete<br>Decidability open|
|**Reasoning Problems**<br>Ontology<br>Consistency,<br>Class<br>Ex-<br>pression Satisfability, Class Expres-<br>sion Subsumption, Instance Check-<br>ing, Conjunctive Query Answering<br>Ontology Consistency, Class Expres-<br>sion Satisfability, Class Expression<br>Subsumption, Instance Checking<br>Conjunctive Query Answering<br>Ontology Consistency, Class Expres-<br>sion Satisfability, Class Expression<br>Subsumption, Instance Checking<br>Conjunctive Query Answering<br>Ontology Consistency, Class Expres-<br>sion Satisfability, Class Expression<br>Subsumption, Instance Checking,<br>Conjunctive Query Answering<br>Ontology Consistency, Class Expres-<br>sion Satisfability, Class Expression<br>Subsumption, Instance Checking,<br>Conjunctive Query Answering<br>Ontology Consistency, Class Expres-<br>sion Satisfability, Class Expression<br>Subsumption, Instance Checking,<br>Conjunctive Query Answering|
|**Language**<br>OWL<br>2<br>RDF-<br>Based<br>Semantics<br>OWL<br>2<br>Direct<br>Semantics<br>OWL<br>2<br>EL<br>OWL<br>2<br>QL<br>OWL<br>2<br>RL<br>OWL DL|



_4.3. OWL in context_ 

81 

Table 4.3 summarises the known complexity results for OWL 2 under both RDF and the direct semantics, OWL 2 EL, OWL 2 QL, OWL 2 RL, and OWL 1 DL. The results refer to the _worst-case complexity_ of these reasoning problems and, as such, do not say that implemented algorithms necessarily run in this class on all input problems, or what space/time they use on some/typical/certain kind of problems. 

For X-complete problems, these results only say that a reasoning algorithm cannot use less time/space than indicated by this class on all input problems, where “X” is one of the complexity classes listed in the previous section. 

### **4.3 OWL in context** 

OWL was designed for the World Wide Web, and has a place there, which is outlined in the next subsection. A different notion of ‘positioning’ OWL is with respect to the language features, or: options to link OWL to more expressive languages, which is described afterward. 

#### **4.3.1 OWL and the Semantic Web** 

OWL does not exist in isolation, but is part of the Semantic Web stack—also called the (in)famous ‘layer cake’—to make the Semantic Web work. This layer cake is shown in Figure 4.3. Stepwise working our way up from the bottom layer, there is XML, which is a surface syntax that has no semantics, and then XML Schema, which describes structure of XML documents. 

RDF is intended for describing data and facilitating data exchange; it is a data model for “relations” between “things”, which also has a RDF Schema and an RDF Vocabulary Definition Language. RDF data can be queried with the SPARQL query language (one can draw an analogue with SQL for relational databases, but then tailored to the Internet). At the time of writing, RDF with its Linked Data— be it open or not—is quite popular. One of the central nodes in the Linked Data cloud is DBpedia [BLK<sup>+</sup> 09], an RDF-ised version of Wikipedia’s info boxes. Such systems may be users of lightweight ontologies or structured controlled vocabularies. The reason for lightweight is because the RDF store tends to be large with a lot of data stored in triples. 

On top of that, we have the ontology language for the Web, OWL, to handle the knowledge and reasoning, and rules (RIF). RIF does not seem to be used much. 

There are many user interfaces for the whole range of Semantic Web applications. The details of the “trust” and “crypto”, on the other hand, are still sketchy. Perhaps the “crypto” will receive more attention with the increasing popularity of BlockChain. There are, at the time of writing, some preliminary explorations on using RDF with BlockChain. Also, as there are several BlockChain systems, and they will need to interoperate at some point, so perhaps there is a job for ontologies there as well in the near future. 

Finally, several directions for extensions to OWL proposed. These include the ‘leftover’ from OWL 1’s “Future extensions”, such as the unique name assumption, closed world assumption, making parthood a primitive object property alike 



<!-- Start of picture text -->
User Interface & applications<br>uniying Lovie} |<br>Rules:<br>Query: RIF<br>SPARQL<br><!-- End of picture text -->

_4.3. OWL in context_ 

83 



<!-- Start of picture text -->
UML-CD<br><!-- End of picture text -->



<!-- Start of picture text -->
Schema.org<br><!-- End of picture text -->



<!-- Start of picture text -->
bRDF<br>OBO OWL<br><!-- End of picture text -->



<!-- Start of picture text -->
RDF<br><!-- End of picture text -->



<!-- Start of picture text -->
EL++<br>(OWL 2 EL)<br><!-- End of picture text -->



<!-- Start of picture text -->
DL-LiteR<br>(OWL 2 QL)<br><!-- End of picture text -->



<!-- Start of picture text -->
DL-RL<br>(OWL 2 RL)<br><!-- End of picture text -->



<!-- Start of picture text -->
Prop<br><!-- End of picture text -->



<!-- Start of picture text -->
RDFS<br>OBO 1.4<br>OWL-Full<br>FOL =<br><!-- End of picture text -->



<!-- Start of picture text -->
SROIQ<br>(OWL 2 DL)<br><!-- End of picture text -->



<!-- Start of picture text -->
OBO 1.4<br>FOL =<br>F-logic<br><!-- End of picture text -->



<!-- Start of picture text -->
DDL OWL<br><!-- End of picture text -->



<!-- Start of picture text -->
DFOL<br><!-- End of picture text -->



<!-- Start of picture text -->
E Co OWL<br><!-- End of picture text -->



<!-- Start of picture text -->
CL -<br><!-- End of picture text -->



<!-- Start of picture text -->
E Co FOL<br><!-- End of picture text -->



<!-- Start of picture text -->
CL<br><!-- End of picture text -->



<!-- Start of picture text -->
EER<br><!-- End of picture text -->



<!-- Start of picture text -->
FOL ms=<br><!-- End of picture text -->



<!-- Start of picture text -->
CASL<br><!-- End of picture text -->



<!-- Start of picture text -->
HOL<br><!-- End of picture text -->

**Figure 4.4:** A sub-graph of logics currently supported by DOL/Ontohub, linked with a variety of logic translations; the arrow shapes indicate some technical differences in translation from one logic to another and the different colours of the boxes give a ballpark figure of the expressivity/complexity of that language. (Source: based on [KK17b]) 

(OMG) in 2016<sup>6</sup> . DOL is not yet a new language for representing the axioms, but provides a _unified metalanguage_ where one can slot in one’s logic of choice— including OWL—as one pleases (roughly), and put the axioms that violate the OWL 2 DL restrictions in another ontology module that is then linked to the OWL file. The system can treat them both as one larger ontology and reason over it (that will take a bit more time to complete, if at all). It comes with a tool for realising reasoning over the combination of ontologies (the Heterogeneous ToolSet<sup>7</sup> ) and the OntoHub repository to store heterogeneous ontologies [CKK<sup>+</sup> 17]. 

How this is achieved behind the scenes is not trivial; the general theoretical background of DOL is described in [KML10], with a detailed description in [MCNK15]. It uses the notion of _institutions_ (in the mathematical sense) to tie the logics together, which were first introduced in [GB92]. Institutions capture commonalities across logics—like FOL and DLs both using a model-theoretic semantics, the overlap in constructors—and therewith provide a means of interoperability across logics. 

The orchestration of languages DOL supports currently is depicted in Figure 4.4, which is organised along two dimensions: the quality of logic translation (the different shapes of the arrows) and expressivity of the logic (coloured boxes). The expressivity ranges from the Semantic Web languages RDF and the OWL species all the way up to (variants of) first- and second-order logic, so as to cater for a wide range of requirements from the different communities that use models in one way or another. 

DOL has many more features that, at this stage in the book, may not make a 

> 6 `http://www.omg.org/spec/DOL/` 

> 7 `http://hets.dfki.de` 

_Chapter 4. The Web Ontology Language OWL 2_ 

84 

lot of sense or seem not really needed, but they probably will be perceived useful as one advances in ontology engineering and/or are facing a concrete ontology development and maintenance project in government or industry. This for the simple reason that ontologies ‘out there’ are definitely not as small and simple as the African Wildlife Ontology. For instance, one could create a network of ontologies rather than a monolithic one, which can be useful if several groups at different locations contribute to the ontology, or create mappings between elements in ontologies once one has imported one for reuse. We will see such scenarios in Block II. In addition, or, perhaps: moreover, besides being able to represent the aforementioned expressiveness example with the cake and the aunts (Example 4.2), one can also do other things that are still in the ‘future extensions’ list for OWL, such as playing with open vs. closed world semantics and declare _n_ -ary relations fully. 

#### **4.3.3 Common Logic** 

Ontology development does not need to occur with OWL. The main other logic that has been serialised is Common Logic (CL) [CLs07], which has been standardised by the ISO. It is a family of first-order logics that share a common abstract syntax, have a model-theoretic semantics, and it uses XML as well. It has three “dialects” (syntaxes): 1) the Common Logic Interchange Format CLIF (one textual notation); 2) the Conceptual Graph Interchange Format (diagrams), CGIF; and 3) eXtended Common Logic Markup Language (XCL), based on XML (another textual notation). 

It had its own design goals, which wasn’t concerned with computability. More specifically<sup>8</sup> , and in comparison with the earlier listed design goals of OWL, they were: 1) Common interlingua for variety of KR notations; 2) Syntactically as unconstrained as possible; 3) Semantically as simple and conventional as possible; 4) Full first-order logic with equality, at least; 5) web-savvy, up-to-date; 6) Historical origins in Knowledge Interchange Format (KIF). 

Because CL is more expressive, the Semantic Web languages (including the OWL species) all can map into CL. Further, since DOL, it need not be ‘self standing’, as the DOL framework as well as the tooling with Hets do provide support for CL; see also the “CL<sup>_−_</sup> ” and “CL” boxes in the right-bottom corner in Figure 4.4. 

### **4.4 Exercises** 

**Review question 4.1.** How does OWL/OWL 2 differ from a DL language? 

**Review question 4.2.** Describe what were the motivations to develop OWL 2. 

**Review question 4.3.** What are the new features in OWL 2 DL compared to OWL-DL? 

> 8A clear brief overview can be found at `https://www.w3.org/2004/12/rules-ws/slides/ pathayes.pdf` 

_4.4. Exercises_ 

85 

**Review question 4.4.** Which is the required format one has to serialise an OWL ontology in? 

**Review question 4.5.** List all the species of OWL (both standards). 

**Review question 4.6.** Which language features can be used on simple object properties only? 

**Review question 4.7.** What are OWL 2 QL, OWL 2 RL, and OWL 2 EL tailed toward, respectively? 

**Review question 4.8.** What is the major advantage of the OWL 2 Profiles over OWL 2 DL and OWL 2 full? 

**Review question 4.9.** Which four ‘parameters’ are considered for complexity of an OWL species? 

**Review question 4.10.** Describe in one sentence the purpose of DOL. 

**Exercise 4.1.** Complete Table 4.4: Verify the question marks in the table (tentatively all “–”), fill in the dots, and any “ _±_ ” should be qualified at to what the restriction is. You may prefer to distribute this exercise among your classmates. 

**Exercise 4.2.** Consider some medical ontology. You know that an injury (a cut, a fracture) to a bone in your hand is also an injury to your hand. How can you model this, and similar, information in an OWL 2 DL ontology such that it infers this not only for injuries to hands, but for any injury to any anatomical body part to an injury to its (direct/indirect) whole? Which OWL 2 DL feature do you need for this? Try to formalise it. * 

**Exercise 4.3.** Install your ODE of choice, if not already done so, and acquaint yourself with the software. If you installed Prot´eg´e (5.x it is in 2018), you may want to have a look at the Pizza Ontology Tutorial (can be downloaded from the Web), but note that it was for a prior Prot´eg´e version, so there are slight differences in the screenshots there and the current interface. Also note that the Pizza tutorial was designed with the intention to acquaint the user the tool, not as a cookbook for best practices in ontology development (which it certainly is not). 

**Exercise 4.4.** Recall Exercise 3.3: if you have not added the DL axiom renderer plug in yet, do so now. Load the AWO, or any other expressive ontology (i.e., one that is more than a simple bare hierarchy) and inspect both the DL rendering and the quasi natural language of the Prot´eg´e interface. Use this to familiarise yourself with the Prot´eg´e notation. Also, it may be of use when carrying out the next two exercises. 

**Exercise 4.5.** Several axioms were listed in the chapter. You will now add them to a new ‘test ontology’ and experiment a bit with it. 

- a. Create a new ontology, give it a new URI, and save it in RDF/XML. 

- b. Add either Bicycle _⊑≥_ 2 hasComponent. _⊤_ or Bicycle _⊑∃_ hasComponent.Wheel. 

_Chapter 4. The Web Ontology Language OWL 2_ 

86 

- c. Take the OWL classifier (see footnote 5) and inspect the least expressive OWL species and violations. * 

- d. Update the previous axiom with the following one: Bicycle _⊑≥_ 2 hasComponent.Wheel. 

- e. Reload the ontology in the OWL classifier and inspect the OWL species and violations. What is the main difference? * 

- f. Experiment in a similar way with one or more of the other axioms listed in the chapter. 

**Exercise 4.6.** Create a new ontology, add the vegan and vegetarian from Exercise 3.2, and check both _O ⊢ V egan ⊑ V egetarian_ and _O ⊢ V egetarian ⊑ V egan_ . Describe the outcomes. 

**Exercise 4.7.** Find another ontology development environment, be with a Web interface or stand-alone tool. 

- a. Repeat the previous exercise. 

- b. Compare the tools by considering, among others: do they both support OWL 2 DL? Which one is easier to navigate? Which one has the most features to help ontology development? Which one is easier for a collaborative ontology development project? 

If you cannot find a tool, then consider the documentation of, e.g., MoKi and ACEWiki and compare them on their features. 

**Exercise 4.8.** Load `university.owl` (note the OWL species) in your ODE, inspect the contents, and try to represent: 

   - a. A `Joint Honors Maths & Computer Science Student` , who is one who takes both Computer Science and Mathematics modules. 

- b. A `Single Honours Maths Student` (or [Computer Science, Economics]) is one who takes only Maths [Computer Science, Economics] modules. 

- Is it possible? If yes, how, if not, why not? * 

**Exercise 4.9.** Classify the ontology of the previous question, and describe what happened and changed. 

**Exercise 4.10.** The university has a regulation that each undergraduate student must take exactly 2 modules. Add this restriction to the ontology of the previous question. 

- a. `Student 9` takes `MT101` , `CS101` , and `CS102` . Do you think your ontology is consistent? Describe why. Check your answer by adding the student and his * 

- courses, run the reasoner and examine the inferences. 

- b. `Student 10` takes `MT101` , `CS101` , and `EC101` . Do you think your ontology is consistent? Describe why. Check your answer by adding the data, running the reasoner, and examining the inferences. * 

**Exercise 4.11.** Open the `computerscience.owl` file, find the principal errors in the ontology, and distinguish them from the ‘knock-on’ errors that are merely a consequence of the principal errors. What would you propose to a modeller how to fix it, and why? Note that “fixing” is to be understood as obtaining a satisfiable ontology other than just deleting the unsatisfiable classes. * 

_4.4. Exercises_ 

87 

**Table 4.4:** Partial comparison of some OWL features 

|**Language** _⇒_<br>**Feature** _⇓_|OW<br>**Lite**|L 1<br>**DL**|OWL 2<br>**DL**|OW<br>EL|L 2 P<br>QL|rofles<br>RL|
|---|---|---|---|---|---|---|
|Role hierarchy|+|+|+|.|+|.|
|N-ary roles (where _n ≥_2)|–|–|–|.|?|.|
|Role chaining|–|–|+|.|–|.|
|Role acyclicity|–|–|–|.|–|.|
|Symmetry|+|+|+|.|+|.|
|Role values|–|–|–|.|–|.|
|Qualifed number restrictions|–|–|+|.|–|.|
|One-of, enumerated classes|?|+|+|.|–|.|
|Functional dependency|+|+|+|.|?|.|
|Covering constraint over concepts|?|+|+|.|–|.|
|Complement of concepts|?|+|+|.|+|.|
|Complement of roles|–|–|+|.|+|.|
|Concept identifcation|–|–|–|.|–|.|
|Range typing|–|+|+|.|+|.|
|Refexivity|–|–|+|.|–|.|
|Antisymmetry|–|–|–|.|–|.|
|Transitivity|+|+|+|.|–|.|
|Asymmetry|?|?|+|–|+|+|
|Irrefexivity<br>.|–<br>.|–<br>.|+<br>.|.<br>.|–<br>.|.<br>.|



**Exercise 4.12.** Consider again the content of the AWO. How would you represent the following information, if it is possible at all without running into inconsistencies? 

- a. There is also bird wildlife, and birds fly. Then there are penguins—a type of bird—not only on Antarctica, but also in South Africa, in the wild even, so they also have to be added to the AWO. Penguins don’t fly, however. * 

- b. There are plenty of insects, too, which are also animals. Before we look into human edible insects, let’s first try to represent the _Lepidoptera_ family, which literally means “having scaled wings”, i.e., insects like butterflies and moths. The life of those insects goes through four stages where the entity is morphologically rather distinct: egg, larva (e.g., the caterpillar), pupa (or chrysalis), and adult (e.g., the butterfly). * 

Note: you may wish to do this exercise together with a classmate to bounce of ideas. The caterpillar/butterfly challenge will return in Chapter 5 from a different viewpoint. 

**Exercise 4.13.** From an educational perspective, you could do Practical Assignment 1 now (see Section B.1) or at the end of Block II. The advantage of doing it now is that you will appreciate the contents of Block II more and can revisit this assignment at the end of Block II, and it gives you a better understanding of both the language features and the automated reasoner. The disadvantage is that 

_Chapter 4. The Web Ontology Language OWL 2_ 

88 

it might be harder to do now than at the end of Block II and the quality of the ontology of your first attempt to create one is likely going to be low (which, on the other hand, is a good learning opportunity). 

### **4.5 Literature and reference material** 

1. Ian Horrocks, Peter F. Patel-Schneider, and Frank van Harmelen. From SHIQ and RDF to OWL: The making of a web ontology language. _Journal of Web Semantics_ , 1(1):7, 2003. 

2. OWL Guide: `http://www.w3.org/TR/owl-guide/` 

3. OWL Reference: `http://www.w3.org/TR/owl-ref/` 

4. OWL Abstract Syntax and Semantics: `http://www.w3.org/TR/owl-semantics/` 

5. B. Cuenca Grau, I. Horrocks, B. Motik, B. Parsia, P. Patel-Schneider, and U. Sattler. OWL 2: The next step for OWL. _Journal of Web Semantics: Science, Services and Agents on the World Wide Web_ , 6(4):309-322, 2008. 

6. Pascal Hitzler, Markus Kroetzsch, Sebastian Rudolph. _Foundations of Semantic Web Technologies_ . Chapman & Hall/CRC, 2009, 455p. 

7. OWL 2 quick Reference: `http://www.w3.org/TR/owl2-quick-reference/` 

8. OWL 2 Web Ontology Language Structural Specification and FunctionalStyle Syntax: `http://www.w3.org/TR/owl2-syntax/` 

9. OWL 2 Profiles: `http://www.w3.org/TR/owl2-profiles/` 

## **Part II** 

## **Developing good ontologies** 

89 

### CHAPTER 5 

### Methods and Methodologies 

In Block I we looked at languages for representing ontologies, and you obtained experience in reading existing ontologies, adding and removing some axioms, and using the automated reasoner. But how exactly did someone come up with the whole ontology in the first place? What can, or should, you do when you have to develop your own ontology? When is an ontology a good one? Just like in software engineering, there are methods and methodologies to guide you through it so that you will be able to answer these questions, or they at least will help out with one or more of the steps in the development of an ontology. 

There is not just one way of doing it or a single up-to-date comprehensive _methodology_ for ontology development that covers everything you possibly probably need, but there some useful steps and combinations. There are several proposals along the line of generic ‘waterfall’ and ‘agile’ approaches that were inspired by software development methodologies. They are at the level of general guidelines and more and less detailed stages, which we shall cover in this chapter in Section 5.1. Diagrammatically, such (generalised!) methodologies have the tasks as shown in Figure 5.1: this one may look like a ‘waterfall’, but practically, it can be an iterative one not only within the ontology development, but within the “maintenance” that may involve substantial redesign or adding a new module that follows those development steps again, and a further refinement are methodologies for ontology authoring that permeate the whole development process. Particular aspects of such methodologies can be assisted by one or more _methods_ and guidelines of the many ones available. A main reason for this state of affairs is that there is still much to be done, there are many different use-case scenarios, and it is—scientifically—hard to prove one methodology is better than another. This is easier to demonstrate for particular methods. 

More specifically, in this chapter we start with high-level methodologies reminiscent of those in software development—dubbed (process-oriented) ‘macro-level’ methodologies—and more detailed ones that focus on ontology authoring—called ‘micro-level’ development—in Section 5.1. We then proceed to a sampling of meth- 

91 

_Chapter 5. Methods and Methodologies_ 

92 



<!-- Start of picture text -->
Ontology management (scheduling, controlling, quality assurance)<br>Feasibility study  (problems, opportunities, potential<br>solutions, economic feasibility)<br>Ontology development and support<br>Domain Analysis  (motivating scenarios, competency<br>questions, existing solutions)<br>Conceptualisation  (of the model, integration and<br>extension of existing solutions)<br>Implementation  (ontology authoring in a logic-based<br>representation language)<br>Ontology use<br>Maintenance  (adapting the ontology to new<br>requirements)<br>Use  (ontology-based search, integration, negotiation)<br>Evaluation acquisition Knowledge<br>Documentation Ontology reuse<br><!-- End of picture text -->

**Figure 5.1:** Main tasks in ontology engineering (Source: based on [SMB10]) 

ods that can be used as a component within those methodologies (Section 5.2), which are roughly divided into one of the four categories of methods: logic-based only, purely based on philosophy, a combination of the two, and heuristics. 

### **5.1 Methodologies for ontology development** 

Several specific methodologies for ontology development exist following the general idea depicted in Figure 5.1, notably the older Methontology and On-ToKnowledge, the more recent NeON and Melting Point methodologies, and the authoring-focused recent ones OntoSpec, DiDOn, and TDDonto, and the older “Ontology Development 101” (OD101)<sup>1</sup> . They are not simply interchangeable in that one could pick any one of them and it will work out well. Besides that some are older or outdated by now, they can be distinguished in core approach, being between: 

- micro-level ontology authoring vs. a macro-level systems-view of ontology development; 

- isolated, single, stand-alone, ontology development vs. collaborative development of ontologies and ontology networks. 

Micro-level methodologies focus on the viewpoint of the details emphasising formalisation aspects, which goes into _ontology authoring_ , for it is about writing down the actual axioms and design choices that may even be driven by the language. Macro-level methodologies, on the other hand, emphasise the processes from an 

> 1details can be found in [FGPPP99, SSSS01, SFdCB+08, GOG+10, Kas05, Kee12b, KL16, NM01], respectively. 

_5.1. Methodologies for ontology development_ 

93 

information systems and IT viewpoint, such as depicted in Figure 5.1. They may merge into comprehensive methodologies in the near future. 

Regarding the second difference, this reflects a division between ‘old’ and ‘new’ methodologies in the sense that the older ones assume a setting that was typical of 20 years ago: the development of a single monolithic ontology by one or a few people residing in one location, who were typically the knowledge engineers doing the actual authoring after having extracted the domain knowledge from the domain expert. The more recent ones take into account the changing landscape in ontology development over the years, being towards collaboratively building ontology networks that cater for characteristics such as _dynamics, context, collaborative, and distributed development_ . For instance, domain experts and knowledge engineers may author an ontology simultaneously, in collaboration, and residing in two different locations, or the ontology may have been split up into inter-related modules so that each sub-group of the development team can work on their section, and the automated reasoning may well be distributed over other locations or remotely with more powerful machines. 

The remainder of this section provides an overview of these two types of guidelines. 

#### **5.1.1 Macro-level development methodologies** 

##### **Waterfalls** 

The macro-level methodologies all will get you started with domain ontology development in a structured fashion, albeit not all in the exact same way, and sometimes that is even intended like that. For instance, one may commence with a feasibility study and assessment of potential economic benefits of the ontology-driven approach to solving the problem(s) at hand, or assume that is sorted out already or not necessary and commence with the actual development methodology by conducting a requirements analysis of the ontology itself and/or find and describe case studies. A well-known instantiation of the generic notions of the development process depicted in Figure 5.1, is the comparatively comprehensive Methontology methodology [GPFLC04], which has been applied to various subject domains since its development in the late 1990s (e.g., the chemicals [FGPPP99] and legal domain [CMFL05]). This methodology is for single ontology development and while several practicalities are superseded with more recent and even newer languages, tools, and methodologies, the core procedure still holds. Like Figure 5.1, it has a distinct flavour of a waterfall methodology. The five main steps are: 

- 1) Specification: why, what are its intended uses, who are the prospective users 

- 2) Conceptualization: with intermediate representations such as in text or diagrams 

- 3) Formalization: transforms the domain-expert understandable ‘conceptual model’ into a formal or semi-computable model 

- 4) Implementation: represent it in an ontology language 

- 5) Maintenance: corrections, updates, etc. 



<!-- Start of picture text -->
po Knowiedge Resouces<br>|| Non Ontological Resources—1 OntologicalTY<br>11] ITA Gecian Patornel Ds oo coe |<br>tl sueraris_] i!0. Design Patterns) |'0. Repositories and Registries rf 4)<br>Class iteation<br>[ses —AL -Hn titi an e =)e i ! dh y  hb y foesoi tehy hy i t O@tN \ese<br>e{SESSSE SSESE SSS S ESSSSION<br>Non Ontological Resource Ontology Design 4] 0. Aligning<br>Reuse Pattern Reuse 3) re) 0. Merging<br>b 2) @ Ontological Resource ----¥---~<br>Non Ontological Resource Reengineering S ] | chet‘<br>Reengineering 4) 6] | |<br>0dSNf vem| I Lee<br>{ ) ( () ( ) ROF(S) I<br>Q. Specification O. Conceptualization 0. Formalization 0. Implementation éby<br>O> at r3) ! |<br>9) Ontology Restructuring | |<br>0. Localizationan re) Spedialization,(Pruning, Extension,Modulanzation) pow i|<br><!-- End of picture text -->

Ontology Support Activities: Knowledge Acquisition (Elicitation); Documentation; Configuration Management; Evaluation V&V); Assessment 

_5.1. Methodologies for ontology development_ 

95 

own (see, e.g., [KG17, KK12, McD17]); 

- b) extract only a module from an ontology, rather than reusing the whole ontology (see, e.g., [Daw17] for a recent overview, new methods, and tools); 

- c) convert the representation language of the ontology; e.g., from OWL 2 DL to OWL 2 QL, or from OBO to OWL; and 

- d) align ontologies, which is even a sub-field within ontology engineering that is large and active enough for a second edition of a handbook [ES07]. 

Each of these tasks has its own theoretical foundations, methods, and tools. 

NeON also includes more details for the specification stage, especially with respect to so-called _Competency Questions_ (CQs). CQs, first introduced in [GF95], specify the questions one’s ontology should be able to answer and therewith what knowledge the ontology should contain. For instance, with the AWO, one may want the ontology to be able to answer “Which animal eats which other animal?” and “Which animals are endangered?”. The AWO you have inspected does contain some information to answer the former (lions eat impalas), but not the latter, for it does not contain information about endangered species. 

NeOn also has a “Glossary of Activities”, identifying and defining 55 activities when ontology networks are collaboratively built, such as ontology localisation (for another natural language), alignment (linking to another ontology), and diagnosis (of errors), which are divided into a matrix with “required” and “if applicable” [SFdCB<sup>+</sup> 08]. 

Not even the NeON methodology covers all options—i.e., all the steps and all possible permutations at each step—that should be in an ontologist’s ‘tool box’, though. For instance, some mention “non-ontological resource reuse” for bottomup ontology development (number 2 in Figure 5.2), and note NLP and reuse of thesauri, but lack detail on how this is to be done—for that, one has to search the literature and look up specific methods and tools and the other bottom-up routes (the topic of Chapter 7) that can, or have to be, ‘plugged in’ the methodology actually being applied. A glaring absence from the methodologies is that none of them incorporates a ‘top-down’ step on foundational ontology use to enforce precision and interoperability with other ontologies and reuse generic classes and object properties to facilitate domain ontology development. We will look at this in some detail in Chapter 6. For the older methodologies this may be understandable, given that at the time they were hardly available, but it is a missed opportunity for the more recent methodologies. 

##### **Lifecycles** 

A recent addition to the ontology development methodology landscape is the Ontology Summit 2013 Communiqu´e’s<sup>2</sup> take on the matter with the _ontology lifecycle model_ ; see Figure 5.3. Each stage has its own set of questions that ought to be answered satisfactorily. To provide a flavour of those questions that need to be answered in an ontology development project, I include here an arbitrary selection of such questions at several stages, which also address evaluation of the results of that stage (see the communiqu´e or [N<sup>+</sup> 13] for more of such questions): 

> 2 `http://ontolog.cim3.net/cgi-bin/wiki.pl?OntologySummit2013_Communique` 



<!-- Start of picture text -->
@ Evaluation<br>c<br>=<br><<br>om©FAo<br>3-<br>Sf = c<br>= ee S =<br>2 4<br>‘mh Evaluation<br><!-- End of picture text -->

_5.1. Methodologies for ontology development_ 

97 

for the usual syntax checking, consistency, and entailment [PS15], simplified agile [Per17], a sketch of a possible Test-Driven Development methodology is introduced in [KL16], and eXtreme Design was added to NeON [PD<sup>+</sup> 09]. 

It is beyond the current scope to provide a comparison of the methodologies (see for an overview [GOG<sup>+</sup> 10]). Either way, it is better to pick one of them to structure your activities for developing a domain ontology than using none at all. Using none at all amounts to re-inventing the wheel and stumbling upon the same difficulties and making the same mistakes developers have made before, but a good engineer has learned from previous mistakes. The methodologies aim to prevent common mistakes and omissions, and let you to carry out the tasks better than otherwise would have occurred without using one. 

#### **5.1.2 Micro-level development** 

OntoSpec, OD101, and DiDOn can be considered ‘micro-level’ methodologies: they focus on guidelines to formalise the subject domain, i.e., providing guidance _how_ to go from an informal representation to a logic-based one. While this could be perceived to be part of the macro-level approach, as it happens, such a ‘micro-level view’ actually does affect some macro-level choices and steps. It encompasses not only axiom choice, but also other aspects that affect that, such as the following ones (explained further below): 

- 1) Requirements analysis, with an emphasis on purpose, use cases regarding expressiveness (temporal, fuzzy, n-aries etc.), types of queries, reasoning services needed; 

- 2) Design of an ontology architecture (e.g., modular), distributed or not, which (logic-based) framework to use; 

- 3) Choose principal representation language and consider encoding peculiarities (see below); 

- 4) Consider and choose a foundational ontology and make modelling decisions (e.g., on attributes and n-aries as relations or classes; Chapter 6); 

- 5) Consider domain ontology, top-domain level ontology, and ontology design pattern ontology reuse, if applicable, and any ontology matching technique required for their alignment; 

- 6) Consider semi-automated bottom-up approaches, tools, and language transformations, and remodel if needed to match the decisions in steps 3 and 4 (Chapter 7); 

- 7) Formalization (optionally with intermediate representations), including: a) examine and add the classes, object properties, constraints, rules taking into account the imported ontologies; 

   - b) use an automated reasoner for debugging and detecting anomalous deductions in the logical theory; 

   - c) use ontological reasoning services for ontological quality checks (e.g., OntoClean and RBox Compatibility); 

   - d) add annotations; 

_Chapter 5. Methods and Methodologies_ 

98 

- 8) Generate versions in other ontology languages, ‘lite’ versions, etc., if applicable; 

- 9) Deployment, with maintenance, updates, etc. 

Some of them are incorporated also in the macro-level methodologies, but do not yet clearly feature in the detail required for authoring ontologies. There is much to say about these steps, and even more yet to be investigated and developed (and they will be revised and refined in due time); some and its application to bio-ontologies can be found in [Kee12b]. 

For the remainder of this section, we shall consider briefly the language choice and some modelling choices on formalising it, in order to demonstrate that the ‘micro’ is not a ‘single step’ as it initially might seem from the macro-level methodologies, and that the ‘micro’ level does not simply consist of small trivial choices to make in the development process. 

##### **The representation language** 

Regarding formalisation, the first aspect is to choose a suitable logic-based language, which ought to be the optimal choice based on the required language features and automated reasoning requirements (if any), that, in turn, ought to follow from the overall purpose of the ontology (due to computational limitations), if there is a purpose at all [Kee10a]. Generalising slightly, they fall into two main group: light-weight ontologies—hence, languages—to be deployed in systems for, among others, annotation, natural language processing, and ontology-based data access, and there are ‘scientific ontologies’ for representing the knowledge of a subject domain in science, such as human anatomy, biological pathways, and data mining [D<sup>+</sup> 10, HND<sup>+</sup> 11, KLd<sup>+</sup> 15, RMJ03]. More importantly for choosing the suitable language, is that the first main group of ontologies require support for navigation, simple queries to retrieve a class in the hierarchy, and scalability. Thus, a language with low expressiveness suffices, such as the Open Biological and biomedical Ontologies’ `obo` -format, the W3C standardised Simple Knowledge Organisation System (SKOS) language [MB09], and the OWL 2 EL or OWL 2 QL profile [MGH<sup>+</sup> 09]. For a scientific ontology, on the other hand, we need a very expressive language to capture fine-grained distinctions between the entities. This also means one needs (and can use fruitfully) more reasoning services, such as satisfiability checking, classification, and complex queries. One can choose any language, be it full first order predicate logic with or without an extension (e.g., temporal, fuzzy), or one of the very expressive OWL species to guarantee termination of the reasoning services and foster interoperability and reuse with other ontologies. The basic idea is summarised in Figure 5.4, which is yet to be refined further with more ontology languages, such as the OWL 2 RL profile or SWRL for rules and the _DLR_ and _CFD_ families of DL languages that can handle _n_ -ary relationships (with _n ≥_ 2) properly. 

The analysis of the language aspects can be pushed further, and one may wish to consider the language in a more fine-grained way and prefer one semantics over another and one ontological commitment over another. For instance, assessing whether one needs access to the components of a relationship alike UML’s asso- 

_5.1. Methodologies for ontology development_ 

99 



<!-- Start of picture text -->
Is reasoning  No Only data  Text<br>required? annotation? annotation?<br>Yes<br>Use OBO  Use SKOS, OBO, or<br>or OWL 2 EL OWL 2 EL<br>Expressivity<br>large ABox? Use OWL 2 EL<br>is important?<br>Use OWL 2 QL<br>Use any FOL, extension thereof, or higher order<br>logic, e.g. Common Logic, DLRus<br>Decidability is<br>important?<br>Use OWL (2) DL<br><!-- End of picture text -->

**Figure 5.4:** A preliminary decision diagram to choose a suitable ontology language for one’s prospective ontology, with indications of current typical usage and suggestions for use. (Source: extended from [Kee12b]) 

ciation ends, the need for _n_ -aries, or whether asymmetry is essential, and, e.g., graph-based versus model-theoretic semantics. This is interesting from a logic and philosophical perspective at a more advanced level of ontology engineering and research, which we will not cover in this introductory course to a practically usable detail. 

##### **Encoding Peculiarities** 

This is tricky to grasp at the start: there may be a difference between what the domain expert sees in the tool—what it is ‘understood to represent’—and what you, as the computer scientist, know how it works regarding the computational representation at the back-end that a domain expert need not know about. Ontologies need not be stored in an OWL file. For instance, it may be the case that a modeller sees an ontology in the interface of a software application, but those classes, relations, and constraints are actually stored in a database, or an n-ary relationship is depicted in the diagrammatic rendering of the ontology, but this is encoded as 3 binaries behind the scenes. The former plays a trick logically: in that case, mathematically, classes are stored as instances in the system (not classes-as-instances in the ontology!). For instance, Chair may be represented in the OWL ontology as the class `Chair` , but one equally well can store Chair in a database table, by which it mathematically has become an instance when it is a tuple or a value when it is stored in a cell, yet it is ‘thought of’ and pretended to be a universal, class, or concept in the graphical interface. This is primarily relevant for SKOS and OBO ontologies. Take the Gene Ontology, among others, which is downloadable in OBO or OWL format—i.e., its taxonomy consists of, mathematically, classes—and is available in database format—i.e., mathematically it is a taxonomy of instances. This does not have to be a concern of the subject 

_Chapter 5. Methods and Methodologies_ 

100 

domain experts, but it does affect how the ontology can be used in ontology-driven information systems. A motivation for storing the ontology in a database, is that databases are much better scalable, which is nice for querying large ontologies. The downside is that data in databases are much less usable for automated reasoning. As an ontology engineer, you will have to make a decision about such trade-offs. 

There is no such choice for SKOS ‘ontologies’, because each SKOS concept is always serialised as an OWL individual, as we shall see in Chapter 7. One has to be aware of this distinction when converting between SKOS and OWL, and it can be handled easily in the application layer in a similar way to GO. 

One also could avail of “punning” as a way to handle second-order logic rules in a first-order setting and use the standard reasoners instead of developing a new one (that is, not in the sense of confusing class as instance, but for engineering reasons), or ‘push down’ the layers. This can be done by converting the content of the TBox into the ABox, encode the second-order or meta rules in the TBox, and classify the classes-converted-into-individuals accordingly. We will come across one such example with OntoClean in Section 5.2.2. 

In short: one has to be careful with the distinction between the ‘intended meaning’ and the actual encoding in an implemented system. 

##### **On formalising it** 

The ‘ _how to formalise it?_ ’ question is not new, neither in IT and Computing [Hal01, HP98] nor in logic [BE93], and perhaps more of those advances made elsewhere should be incorporated in ontology development methodologies. For ontologies, they seem to be emerging as so-called _modelling styles_ that reflect formalisation choices. These formalisation choices can have a myriad of motivations, but also consequences for linking one’s ontology to another or how easy it is to use the ontology in, say, an OBDA system. The typical choices one probably has come across in conceptual modelling for database systems or object-oriented software also appear here, as well as others. For instance: 

- will you represent ‘marriage’ as a class Marriage or as an object property isMarriedTo? 

- will you represent ‘skill’ as a class Skill, as an object property hasSkill, or as a data property (attribute) with values? 

At this stage, it may look like an arbitrary choice of preference or convenience. This is not exactly the case, as we shall see in Chapter 6. Others have to do with a certain axiom type or carefulness: 

- On can declare, say, hasPart and partOf and state they are inverses, i.e., adding two vocabulary elements to the ontology and the axiom hasPart _≡_ partOf<sup>_−_</sup> . In OWL 2, one also could choose to add only one of the two and represent the other through an inverse directly; e.g., with only hasPart, one could state C _⊑_ hasPart<sup>_−_</sup> _._ D “Each C is part of at least one D”, i.e., partOf would not be a named object property in the ontology. 

- The Pizza Ontology Tutorial cautions against declaring domain and range axioms, mainly because the inferences can come as a surprise to novice ontology developers. Should one therefore avoid them? Ideally, no, for this results 

_5.2. Methods to improve an ontology’s quality_ 

101 

in a lower precision and actually may hide defects in the ontology. 

- _n_ -aries ( _n ≥_ 3) cannot be represented fully, only approximated, in OWL and there are different ways to manage that, be it through reification or choosing another logic. 

Whichever way you choose to represent a particular recurring pattern, do try to do it consistently throughout. There are some methods and tools to assist with such matters, which will be introduced gradually, starting with the next section. 

### **5.2 Methods to improve an ontology’s quality** 

The methodologies we have seen in the previous section may include one or more methods at a particular step in the process. These methods aim to assist the ontologist in certain tasks of the ontology engineering process, such as to assist the modelling itself and to integrate ontologies, which may have supporting software tools. The methods can be divided roughly into: logic-based only, purely based on philosophy, a combination of the two, and practical rules or guidelines. Each of these categories has several methods with more or less tool support. In this section, we take an illustrative sampling of each of them, respectively: 

1. The ‘debugging’ of deductions that caused, e.g., one or more classes to have become unsatisfiable, where we’ll see some detail as to what creates such justifications; 

2. OntoClean to ‘clean up’ a ‘dirty’ taxonomy; 

3. The RBox compatibility service for coherent hierarchies and role chains of object properties; 

4. OOPS! with TIPS to catch common pitfalls and how to avoid them. 

#### **5.2.1 Logic-based methods: explanation and justification** 

People make errors with respect to what they intend to represent in the ontology, or do it correctly, but are somewhat surprised by one or more deductions. The automated reasoners can help explain that, or: ‘justify’ the deduction. The more recent versions of ODEs may have this feature already implemented, and you may have come across it during the exercises (e.g., by having clicked on the “?” on the right of the yellow deduction in Prot´eg´e). Put differently: you have been using an automated reasoner to ‘debug’ the ontology. Where do they come from, and what is a good strategy to explain deductions to the modeller or domain expert? 

As a first step to obtain the answers, researchers looked at what were the most common logical mistakes that modellers made. Typical mistakes that cause a class to be unsatisfiable, result in undesirable inferred subsumptions, or inconsistent ontologies, are the following ones: 

- The basic set of clashes for concepts (w.r.t. tableaux algorithms) resulting in an _incoherent_ ontology are: 

   - Atomic: Any individual of a class would belong to a class and its complement; 

_Chapter 5. Methods and Methodologies_ 

102 

   - Cardinality: A class has a max cardinality restriction declared, but its subclass has a higher min cardinality on that same object or data property; 

   - Datatype: A literal value violates the (global or local) range restrictions on a data property (i.e., conflicting data types). 

- The basic set of clashes for the ontology resulting in an _inconsistent_ ontology are: 

   - Inconsistency of assertions about individuals, e.g., an individual is asserted to belong to disjoint classes or has a cardinality restriction but related to more individuals; 

   - Individuals related to unsatisfiable classes; 

   - Defects in class axioms involving nominals ( `owl:oneOf` , if present in the language). 

The second step was to integrate this with what the reasoner computes along the way to the final deduction: which axioms are involved that lead to the unsatisfiable class or inconsistent ontology? Any such explanation feature thus uses at least the standard reasoning services. It adds further and new reasoning services tailored to pinpointing the errors and explaining the entailments to, e.g., try to find the least number of axioms among the alternative explanation. Such ‘debugging’ goes under terms like glass box reasoning, (root) justification, explanation, and pinpointing errors. This may sound easy: just get a log from the reasoner. It is not that simple, however. Consider the following example. 

**Example 5.1.** _The ontology O under consideration contains, among many other axioms, the following two:_ 

A _⊑_ B _⊓_ C _⊓¬_ C 

A _⊑¬_ B 

_One deduces A ⊑⊥. Why? There are two routes that explain this deduction purely based on the axioms, indicated in red:_ 

_1._ A _⊑_ B _⊓_ C _⊓¬_ C 

_2._ A _⊑_ B _⊓_ C _⊓¬_ C A _⊑ ¬_ B 

_Which of the two ‘explanations’ should be shown to the user, or both? And the whole axiom, or only the relevant part(s) of it, or like the colour highlighting? Or, given a set of explanations, those axioms that appear in all explanations or, vv., that are unique (i.e., appear only once across all explanations)? Or maybe to not show a whole set of axioms, but instead only the essence in natural language, alike “_ A _is a subclass of both a class and its complement, which causes it to be unsatisfiable” or perhaps a Venn diagram can be drawn? ♦_ 

Both the theory and how to present it to the user have been investigated. If you use Prot´eg´e, it is based on the work presented in [HPS08]. They use the notions of _laconic_ justifications, which are justifications—i.e., a set of relevant axioms— whose axioms do not contain any superfluous parts (and all of whose parts are as weak as possible<sup>3</sup> ) and _precise_ justifications, which are laconic justifications where 

> 3an axiom _β_ is deemed weaker than another one, _α_ if and only if _α |_ = _β_ and _β_ ⊭ _α_ 

_5.2. Methods to improve an ontology’s quality_ 

103 

each axiom is a minimal repair in the sense that changing something to any axiom may result in fixing the undesirable deduction. While they are useful topics, we will spend little time on it here, because it requires some more, and more indepth, knowledge of Description Logics and its reasoning algorithms (suitable for a Description Logics course). 

Proposing possible fixes automatically is yet a step further and research is still under way to address that. This is in no small part because it is hard to secondguess the user. Taking the axioms in Example 5.1 as example, there are already multiple options, such as removing A _⊑¬_ B, or deleting A _⊑_ B, and likewise for C, yet showing all possible ways to fix the undesirable deduction results in too much clutter. 

#### **5.2.2 Philosophy-based methods: OntoClean to correct a taxonomy** 

OntoClean [GW09] helps the ontologist to find errors in a taxonomy, and explains why. One might ask oneself: who cares, after all we have the reasoner to classify our taxonomy anyway, right? Indeed, but that works only if you have declared many properties for the classes so that the reasoner can sort out the logical issues. However, it is not always the case that many property expressions have been declared for the classes in the ontology and those reasoners do not detect certain ontological issues. 

OntoClean fills this gap for taxonomies. It uses several notions from philosophy, such as rigidity, identity criteria, and unity (based on [GW00a, GW00b]) to provide modelling guidelines. Let’s take rigidity as example, for it can be used elsewhere as well. There are four different types of rigidity, but the useful ones are _rigid_ and _anti-rigid_ , which are defined as follows: 

**Definition 5.1.** _(+R [GW09]) A_ rigid _property φ is a property that is essential to_ all _its instances, i.e., ∀xφ_ ( _x_ ) _→_ □ _φ_ ( _x_ ) _._ 

**Definition 5.2.** _(∼R [GW09]) An_ anti-rigid _property φ is a property that is not essential to_ all _its instances, i.e., ∀xφ_ ( _x_ ) _→¬_ □ _φ_ ( _x_ ) _._ 

OntoClean takes these sort of metaproperties to annotate each class in the ontology. For instance, a modeller may want to assert that Apple is rigid (each instance remains an apple during its entire existence) and being a Professor is antirigid (all individuals that are professors now were at some time not a professor). 

Subsequently, we apply meta-rules to reclassify the classes. For our rigid and anti-rigid meta-property, the applicable rule is as follows: 

- _Given two properties (classes), p and q, when q subsumes p the following constraint hold:_ 

   1. _If q is anti-rigid, then p must be anti-rigid_ 

Or, in shorthand: + _R ⊂∼R_ , i.e., it cannot be the case that a class that is annotated as being rigid is subsumed by a class that is annotated as being anti-rigid. 

_Chapter 5. Methods and Methodologies_ 

104 

For instance, if we have, say, both Student and Person in our ontology, then the former is subsumed by the latter, not vice versa, because Person is rigid and Student anti-rigid. If Person _⊑_ Student were asserted, it would say that each person is a student, which we know not to be the case: 1) it is not the case that all persons come into existence as students and die as students, and 2) it is not the case that if a student ceases to be a student (e.g., graduates), then that object also ceases to be a person. 

Besides manual analyses, currently, two approaches have been proposed for incorporating the ideas of OntoClean in OWL ontologies. One is to develop a separate application to handle the annotations of the classes and the rules, another is to leverage the capabilities of the standard reasoning services of the OWL reasoners, which is done by [GRV10, Wel06]. They differ in the details, but they have in common the high-level approach: 

- 1) develop the domain ontology (TBox); 

- 2) push it into the ABox (i.e., convert everything from the TBox into ABox assertions); 

- 3) encode the OntoClean ‘meta rules’ in the TBox; 

- 4) run the standard OWL reasoner and classify the ‘instances’; 

- 5) transfer the reclassifications in the taxonomy back into the domain-ontologyin-TBox. 

Finally, observe that this machinery of OntoClean also provides one with the theory to solve the “green apple issue” we encountered in Section 1.2.3 on good and bad ontologies: Apple is rigid (and a sortal), but its greenness is not. It is the rigid entities that provide a backbone of an ontology, not the other ones (like Green, Student) that depend on the existence of rigid entities. 

An OntoClean tutorial can be found in Appendix A.1. 

#### **5.2.3 Combining logic and philosophy: role hierarchies** 

OntoClean does little to help solving so-called _undesirable deductions_ , be they logically consistent or not, and the justifications computed may not always point to the root problem from a modelling viewpoint. The _RBox Compatibility service_ [KA08] and its extension to _SubProS_ and _ProChainS_ [Kee12a] can assist with at least some of that. They check for _meaningful_ object property hierarchies and property chains. This has as prerequisite to know when a property hierarchy is ‘good’ (e.g.: guaranteed not lead to an undesirable deduction). Only afterward can one test for violations of those principles, and finally have guidance on how a mistake can be revised. 

The hierarchy of object properties must be well-formed, which entails the principles as to what it means for one property to be a sub-property of another. In analogy to a class hierarchy, where the instances of a subclass necessarily are a subset of the set of instances of the superclass, one can state that in every model, the tuples (individual relations) of the sub-property are a subset of the tuples of its parent property. This can be guaranteed in two distinct ways. The most-straightforward case is that the domain and/or range of the sub-property must be a subclass of the domain and/or range of its super-property. This is similar to UML’s ‘subsetting’ 



<!-- Start of picture text -->
eaA. es<br><!-- End of picture text -->



<!-- Start of picture text -->
D = DataTable<br>hasFeature DataSet DataTable DataTable Feature<br>LOO NES”<br>hasMainTable hasFeature<br>hasFeature<br><!-- End of picture text -->

_5.2. Methods to improve an ontology’s quality_ 

107 

OWL are described in [RDH<sup>+</sup> 04], which moved onward to the notion of “antipatterns” of the ‘don’t do this’ variety [RCVB09], and a growing catalogue of pitfalls [PVSFGP12] of which 21 can be scanned automatically online with the OntOlogy Pitfall Scanner! (OOPS!)<sup>4</sup> . A selection of those pitfalls are: Creating synonyms as classes (P2); Creating the relationship “is” instead of using `rdfs:subClassOf` , `rdf:type` or `owl:sameAs` (P3); Defining wrong inverse relationships (P5); Including cycles in the hierarchy (P6); Merging different concepts in the same class (P7); Missing disjointness (P10); Missing domain or range in properties (P11); Swapping intersection and union (P19); Using a miscellaneous class (P21); Using different naming criteria in the ontology (P22); Defining a relationship inverse to itself (P25); Defining inverse relationships for a symmetric one (P26); and Defining wrong transitive relationships (P29). Pitfall P19 is illustrated in the following example. 

**Example 5.3.** _You have to represent “a pizza Hawaii has as topping ham and pineapple”_<sup>5</sup> _. A modeller may be inclined to take the natural language description of the toppings quite literally, and add_ 



_However, this is not what the modeller really wants to say. The “⊓” means ‘and’, i.e., an intersection, and thus the “_ (Ham _⊓_ Pineapple) _” is the OWL class with those objects that are_ both _ham_ and _pineapple. However, nothing is both, for meat and fruit are disjoint, so the pizza Hawaii in our ontology has a topping that is_ Nothing _. What we want to represent, is that from_ PizzaHawaii _there are at least two outgoing relations for the toppings, being one to_ Ham _and one to_ Pineapple _, i.e.,_ 



_In addition, one may want to add a so-called ‘closure axiom’ to say that all pizzas Hawaii “have as topping only ham and pineapple”,_ 



_Note also here that there is not a one-to-one mapping between the imprecise natural language and the constructors: ham_ and _pineapple, but using an ‘or’ ⊔, which becomes clearer when we rephrase it as “all toppings are either ham or pineapple”. ♦_ 

An evaluation of the presence of those 21 pitfalls showed that it does not make much difference whether the ontology is one developed by novices, an arbitrary ontology, or is a well-known ontology [KSFPV13]. It may well be that the notion of a good quality ontology is not tightly related to absence of pitfalls, or maybe the modelling pitfalls are propagated from the well-known ones by novice modellers; whichever be the case, it is fertile ground for research. Notwithstanding this, the 

> 4 `http://www.oeg-upm.net/oops` 

> 5and we ignore the fact that, according to Italians, pizzas are not supposed to have any fruit on a pizza—other than tomatoes—so the pizza Hawaii is not really an Italian pizza. 

_Chapter 5. Methods and Methodologies_ 

108 

ontology can be scanned quickly with OOPS! and the results provide pointers where the ontology may be improved. 

The error, anti-pattern, and pitfall efforts look at quality of an ontology from the negative side—what are the mistakes?—whereas, e.g., OntoClean and the RBox compatibility view it from the positive side, i.e., what does a good representation look like? To this end, one also can turn around the pitfalls, into authoring guidelines, which is dubbed the **T** ypical p **I** tfall **P** revention **S** cheme, TIPS [KSFPV15], which describe the tips in the imperative so as to indicate what a developer should be checking. The one that includes trying to avoid the problem illustrated in Example 5.3 is the following: 

**T7: Intended formalization** (includes P14, P15, P16, P19, C1, and C4): A property’s domain (resp., range) may consist of more than one class, which is usually a union of the classes (an `or` ), not the intersection of them. Considering the property’s participation in axioms, the `AllValuesFrom` /only/ _∀_ can be used to ‘close’ the relation, i.e., that no object can relate with that relation to the class other than the one specified. If you want to say there is at least one such relation (more common), then use `SomeValuesFrom` /some/ _∃_ instead. To state there is _no_ such relation in which the class on the left-hand side participates, put the negation before the quantifier ( _¬∀_ or _¬∃_ ), whereas stating that there is a relation but just not with some particular class, then the negation goes in front of the class on the right-hand side; e.g., a vegetarian pizza does not have meat as ingredient ( _¬∃_ hasIngredient.Meat), not that it can have all kinds of ingredients—cucumber, marsh mellow, etc.—as long as it is not meat ( _∃_ hasIngredient. _¬_ Meat). To avoid the latter (the unintended pizza ingredients), one ought not to introduce a class with negation, like NotMeat, but use negation properly in the axiom. Finally, when convinced _all_ relevant properties for a class are represented, consider making it a defined class, if not already done so. [KSFPV15] 

One that has nothing to do with logic foundations, but enters the picture for ontology development is the aspect where it is still more of a craft and engineering, is the following. 

**T1: Class naming and identification** (includes P1, P2, P7, C2, and C5): When identifying and naming classes in ontologies, avoid synonymy and polysemy: distinguish the concept itself from the different names such a concept can have (the synonyms) and create just one class for the concept and provide, if needed, different names for such a class using `rdfs:label` annotations. Regarding polysemy, where the same name has different meanings, try to disambiguate the term, use extension mechanisms and/or axioms. Other important cases regarding class naming and identification are (a) creating a class whose name refers to two or more different concepts by including “and” or “or” in the name (e.g., StyleAndPeriod or ProductOrService) and (b) using 

_5.2. Methods to improve an ontology’s quality_ 

109 

modality (“can”, “may”, “should”) in the ontology element’s names. In situation (a) consider dividing the class into different subclasses, and in case (b) consider a more appropriate name avoiding the use of modality or change to a logic language that can express it. Take care about providing proper names for both the ontology file and the URI. [KSFPV15] 

The topic of pitfalls, anti-patterns, and modelling suggestions spills over into a broader setting of ontology quality, which includes aspects such as accuracy, adaptability, clarity, completeness, computational efficiency, conciseness, consistency/coherence and organisational fitness, and domain and task-independent evaluation methods that cover, among others, syntax, semantics, representation, and context aspects. (see, e.g., [Vra09] for an early overview.) 

#### **5.2.5 Tools** 

There are many tools around that help you with one method or with a methodology. Finding the right tool to solve the problem at hand (if it exists) is a skill of its own and it is a necessary one to find a feasible solution to the problem at hand. From a technologies viewpoint, the more you know about the goals, features, strengths, and weaknesses of available tools (and have the creativity to develop new ones, if needed), the higher the likelihood you bring a potential solution of a problem to successful completion. 

Honesty requires me to admit that not all Semantic Web tools are being maintained and there is typically little documentation. In particular, plugins may falter when they have been developed for one ODE but not another, or for a prior version but aren’t compatible with a later version of the ODE. This short section it merely intended to give you an idea that there _are_ tools for a range of activities, and if the one listed does not work anymore, then there is likely some open source code or at least a paper describing what it does and how, so that one could re-implement it, if needed<sup>6</sup> . The tools are grouped along five categories—to support methodologies, ODEs, implementing methods, portals, and exports—and where to start when you want to develop your own one. 

_Software-supported methodologies._ They are few and far between. WebODE provided software support for Methontology, the NeOn toolkit<sup>7</sup> aims to support the NeON methodology for distributed development of ontologies. 

_Ontology Development Environments (ODEs)._ Clearly, the tools listed under the ‘Software-supported methodologies’ are ODEs, but there are also ODEs that are not tailored to a particular methodology. They mainly lack project management features, and/or the possibility to switch back and forth between informal, intermediate, and formal representations, or do not have features for activities such 

> 6Inclusion in this section does not mean I have tested all of them and give a quality judgement on it. 

> 7 `http://neon-toolkit.org/` 

_Chapter 5. Methods and Methodologies_ 

110 

as project documentation. It may well be the case that such functionality is available in part or in whole as a set of plug-ins to the ODE. Some of those ODEs are stand-alone tools, such as Prot´eg´e desktop and Racer, others have a web interface, such as WebProt´eg´e and the Modeling Wiki MOKI. The HOZO ontology editor is the only editor that was specifically designed to explicitly accommodate for certain ontological commitments, in particular regarding roles [MSKK07]. Most ODEs are packaged with one or more automated reasoners, but one also can use another one, given that there is a plethora of ontology reasoners and editors<sup>8</sup> . This includes tools that have a pseudo-natural language interface or a graphical interface to adding axioms to an ontology, which serves as ‘syntactic sugar’ to the underlying logic. 

_Software-supported methods and other features._ Additional features and implemented methods may exist as stand-alone tool or as plugin for an ODE, or, thanks to the widespread uptake, may have been integrated in the ODEs already upon installation. For instance, Racer has extensive features for sophisticated querying and OWL ontology visualisation with Ontograf is already included in the standard installation of Prot´eg´e For the axiom tests component of test-driven development, there is a TDDonto2 plugin for Prot´eg´e [KL16], and plugins for very specific tasks, such as the DroolsTab for visual authoring of complex spatial process simulation, and the CompGuide Editor for obtaining Computer-Interpretable Guidelines for Clinical Practice Guidelines. There are many more Prot´eg´e plug-ins<sup>9</sup> , which are sorted by topic (e.g., NLP, biomedical) and type (e.g., API, viewing), but do verify the versioning of the plugins and the ODE before installation. 

Some of the recent stand-alone tools focussed on improving the quality of the ontology are the Possible World Explorer that helps with adding disjointness axioms [FR12, Fer16], the OntOlogy Pitfall Scanner (OOPS!) that implements an automated check of the ontology with 21 common modelling pitfalls [PVSFGP12], and OntoPartS to represent part-whole relations better [KFRMG12]. 

There are many more tools, such as for ontology alignment, converting one language into another, tools for language extensions, and so on. 

_Portals._ Other tools that can make an ontology developer’s life easier, are portals to more easily find ontologies and search them, and easily obtain some additional information. For instance, BioPortal [WNS<sup>+</sup> 11] also lists an ontology’s use, OntoHub [CKK<sup>+</sup> 17] analyses the characteristics of the ontology and which features have been used, and ROMULUS [KK16] and COLORE [GHH<sup>+</sup> 12] zoom in on advanced aspects of foundational ontologies (the topic of the next chapter). 

_Exporting ontologies._ There are tools for exporting the knowledge represented in the ontology and rendering it in another format for documentation purposes. These include, notably, a conversion from OWL to latex so as to obtain the—to some, more readable—DL notation of the ontology (see “save as” in Prot´eg´e, select 

> 8 `https://www.w3.org/wiki/Ontology_editors` and `http://owl.cs.manchester.ac.uk/ tools/list-of-reasoners/` 

> 9 `https://protegewiki.stanford.edu/wiki/Protege_Plugin_Library` 

_5.3. Exercises_ 

111 

latex), and to automatically generate documentation alike software documentation, like in LiveOWL, LODE, and its successor WIDOCO [Gar17]. 

_Develop your own tool._ There are many plugins and stand-alone tools. Still, it may be that what you need doesn’t exist yet. To develop your own tool, be it a standalone tool or as plugin, one does not have to start from scratch. For applications that have to read in or write to OWL files: rather than declaring your own regular expressions to find things in an OWL file and declaring methods to write into an OWL file, use the OWL API<sup>10</sup> , OWLink [LLNW11], or Apache Jena<sup>11</sup> for Java-based applications and Owlready for Python-based applications [Lam17]. 

### **5.3 Exercises** 

**Review question 5.1.** List the main high-level tasks in a ‘waterfall’ ontology development methodology. 

**Review question 5.2.** Explain the difference between macro and micro level development. 

**Review question 5.3.** What is meant by ‘encoding peculiarities’ of an ontology? 

**Review question 5.4.** Methods were grouped into four categories. Name them and describe their 

**Review question 5.5.** Give two examples of types of modelling flaws, i.e., that are possible causes of undesirable deductions. 

**Review question 5.6.** Ontology development methodologies have evolved over the past 20 years. Compare the older Methontology with the newer NeON methodology. 

**Exercise 5.1.** Consider the following CQs and evaluate the `AfricanWildlifeOntology1.owl` against them. If these were the requirements for the content, is it * a ‘good’ ontology? 

1. Which animal eats which other animal? 

2. Is a rockdassie a herbivore? 

3. Which plant parts does a giraffe eat? 

4. Does a lion eat plants or plant parts? 

5. Is there an animal that does not drink water? 

6. Which plants eat animals? 

7. Which animals eat impalas? 

8. Which animal(s) is(are) the predators of rockdassies? 

9. Are there monkeys in South Africa? 

10. Which country do I have to visit to see elephants? 

11. Do giraffes and zebras live in the same habitat? 

> 10 `https://github.com/owlcs/owlapi` 

> 11 `https://jena.apache.org/` 

_Chapter 5. Methods and Methodologies_ 

112 

**Exercise 5.2.** Carry out at least subquestion a) and if you have started with, or already completed, the practical assignment at the end of Block I, do also subquestion b). 

- a. Take the Pizza ontology `pizza.owl` , and submit it to the OOPS! portal. Based on its output, what would you change in the ontology, if anything? * 

- b. Submit your ontology to OOPS! How does it fare? Do you agree with the critical/non-critical categorisation by OOPS!? Would you change anything based on the output, i.e.: does it assist you in the development of your ontology toward a better quality ontology? 

**Exercise 5.3.** There is some ontology _O_ that contains the following expressions: 

R _⊑_ PD _×_ PD _,_ PD _⊑_ PT _,_ A _⊑_ ED _,_ A _⊑∃_ R _._ B _,_ S _⊑_ PT _×_ PT _,_ ED _⊑_ PT _,_ B _⊑_ ED _,_ D _⊑∃_ S _._ C _._ S _⊑_ R _,_ ED _⊑¬_ PD _,_ C _⊑_ PD _,_ Trans(R) _,_ D _⊑_ PD _,_ 

Answer the following questions: 

- a. Is A consistent? Verify this with the reasoner and explain why. * 

- b. What would the output be when applying the _RBox Compatibility service_ ? Is the knowledge represented ontologically flawed? 

**Exercise 5.4.** Apply the OntoClean rules to the flawed ontology depicted in Figure 5.7, i.e., try to arrive at a ‘cleaned up’ version of the taxonomy by using the rules. * 

- Note: the other properties are, in short: 

   - _Identity_ : being able to recognise individual entities in the world as being the same (or different); Any property carrying an IC: +I (-I otherwise); Any property supplying an IC: +O (-O otherwise) (“O” is a mnemonic for “own identity”); +O implies +I and +R. 

   - _Unity_ : being able to recognise all the parts that form an individual entity; e.g., ocean carries unity (+U), legal agent carries no unity (-U), and amount of water carries anti-unity (“not necessarily wholes”, _∼_ U) 

   - _Identity criteria_ are the criteria we use to answer questions like, “is that my dog?” 

- Identity criteria are conditions used to determine equality (sufficient conditions) and that are entailed by equality (necessary conditions) 

- With the rules: 

   - Given two properties, _p_ and _q_ , when _q_ subsumes _p_ the following constraints hold: 

      - If _q_ is anti-rigid, then _p_ must be anti-rigid 

      - If _q_ carries an IC, then _p_ must carry the same IC 

      - If _q_ carries a UC, then _p_ must carry the same UC 

      - If _q_ has anti-unity, then _p_ must also have anti-unity 

   - Incompatible IC’s are disjoint, and Incompatible UC’s are disjoint 

   - And, in shorthand: **–** + _R̸ ⊂∼ R_ 



<!-- Start of picture text -->
Entity<br>Location Amount of matter oO<br>Physical Red Agent yn<br>object | Living being Group of people<br>Fruit Food Social entity<br>Animal Legal agent<br>Apple<br>/. Vertebrate Organization<br>Caterpillar oS<br>Country Red apple Butterfly Person<br><!-- End of picture text -->

_Chapter 5. Methods and Methodologies_ 

114 

2. Alexander Garcia, Kieran ONeill, Leyla Jael Garcia, Phillip Lord, Robert Stevens, Oscar Corcho, and Frank Gibson. Developing ontologies within decentralized settings. In H. Chen et al., editors, _Semantic e-Science. Annals of Information Systems 11_ , pages 99-139. Springer, 2010. 

3. Fabian Neuhaus, Amanda Vizedom, Ken Baclawski, Mike Bennett, Mike Dean, Michael Denny, Michael Gr¨uninger, Ali Hashemi, Terry Longstreth, Leo Obrst, Steve Ray, Ram Sriram, Todd Schneider, Marcela Vegetti, Matthew West, and Peter Yim. Towards ontology evaluation across the life cycle. _Applied Ontology_ , 8(3):179-194, 2013. 

4. Guarino, N. and Welty, C. An Overview of OntoClean. in S. Staab, R. Studer (eds.), _Handbook on Ontologies_ , Springer Verlag 2009, pp. 201-220. 

5. C. Maria Keet. Preventing, detecting, and revising flaws in object property expressions. _Journal on Data Semantics_ , 3(3):189-206, 2014. 

### CHAPTER 6 

### Top-down Ontology Development 

Having an ontology language is one thing, but _what_ to represent, and _how_ , is quite another. In the previous chapter, we looked at answering “Where do you start?” and “How to proceed” with methodologies, but we are still left with answering: How can you avoid reinventing the wheel? What can guide you to make the process easier to carry it out successfully? How can you make the best of ‘legacy’ material? There are two principal approaches, being the so-called _top-down_ and _bottom-up_ ontology development approaches with their own set of methods, tools, and artefacts. In this chapter, we focus on the former and in the next chapter on the latter, where each can be seen as a refinement of some aspects of an overall methodology like introduced in Chapter 5. 

We look at ‘avoiding to reinvent the wheel’ and ‘what can guide you to make the process of adding those axioms easier’ by reusing some generic principles. Those generic modelling aspects are typically represented in _foundational ontologies_ , assisted by further details on specific sub-topics. We will cover each in sequence: foundational ontologies, also called top-level or upper ontologies, are introduced in Section 6.1 and subsequently parthood and part-whole relations, as one of the sub-topics, are introduced in Section 6.2. (The notion of _ontology design patterns_ partially could fit here as well, but also partially as bottom-up or practice-oriented; for the latter reason and chapter size considerations, it has been moved to the next chapter.) 

### **6.1 Foundational ontologies** 

The basic starting point for top-down ontology development is to consider several core principles of Ontology for ontologies; or: some philosophical guidance for the prospective engineering artefact<sup>1</sup> . Although we will not delve into deep debates 

> 1As philosophy enters, a note about terminology may be in order, because some ideas are borrowed and changed, and some terms that are the same do mean different things in different 

115 

_Chapter 6. Top-down Ontology Development_ 

116 

about philosophical theories in this course, it is useful to know it has something to offer to the development of ontologies, and we will see several examples where it has had influence. A few examples where results from philosophy can be useful when deciding what is going to be represented in one’s ontology, and how, are the following ones. 

- One can commit to a 3-Dimensional view of the world with objects persisting in time or take a(4-Dimensional (perdurantist) stance with space-time worms; e.g., are you convinced that you after reading this sentence is a different you than you before reading this sentence? If so, then you may well be a perdurantist, if you consider yourself to be the very same entity before and after, then you lean toward the 3D, endurantist, commitment (but before proclaiming to be one or the other based on this single example, do read up on the details and the implications). 

- The distinction between (in OWL terminology) classes and individuals: the former can have instances, but the latter cannot be instantiated further; e.g., a class Chair can have instances, such as the one you are sitting on now, but that chair cannot be instantiated further (it is already an individual object). Generally, philosophers tend to agree on such a distinction, but one has to decide whether one’s ontology is for individuals or for classes, or both. 

- In the previous chapters, we have used terms like class and concept as they are used in that specific field. Philosophically, however, terms like class, concept, universal, type, and category each have their very specific meaning and this brings us back to comments in Section 1.2.2: concepts live in the mind/one’s thoughts, whereas universals are out there in the world (if one is convinced universals exist). OWL and its reasoners are entirely agnostic about this distinction, but the people who are reading, developing, and evaluating the ontologies typically are not. 

- Descriptivist vs. prescriptivist: should the ontology try to _describe_ as best as possible the subject domain, i.e., give an account of it, or should that what is represented in the ontology _prescribe_ how the world is, i.e., that the entities in the ontology and constraints represented necessarily must hold, and shown to hold, in reality? Conversely, if something is not represented in the ontology, then a descriptivist may say it was unintentionally incomplete whereas a prescriptivist may say not only that, but also, pedantically, argue that if it’s not in the ontology, then it does not exist in reality. 

disciplines. In the literature, you will come across _material_ ontology and _formal_ ontology. The former (roughly) concerns making an ‘inventory’ of the things in the universe (we have the vase, the clay, the apple, etc.), whereas the latter concerns laying bare the formal structure of (and relation between) entities, which are assumed to have general features and obey some general laws that hold across subject domains, like identity, constitution, and parthood (the latter will be introduced in Section 6.2). So, in ontology engineering the ‘formal’ may refer to _logic-based_ but also to the usage of ‘formal’ in philosophy, which concerns the topic of investigation and does not imply there is a formalisation of it in a logic language. In most computer science and IT literature, when ‘formal’ is written, it generally refers to logic-based. 

_6.1. Foundational ontologies_ 

117 

Then there more detailed decision to make, such as whether you are convinced that there are entities that are not in space/time (i.e., that are abstract), whether two entities can be co-located (the vase and the amount of clay it is made of), and what it means that one entity is [dependent on/constituted by/part of/...] another. There are more of such questions and decision to make. If you do not want to entertain yourself with these questions, you can take someone else’s design decisions and use that in ontology development. Someone else’s design decisions on Ontology for a set of such questions typically is available in a **foundational ontology** , and the different answers to such questions end up as different foundational ontologies. Even with the same answers they may be different<sup>2</sup> . The intricacies of, and philosophical debates about, the more subtle details and differences are left to another course, as here the focus is one _why to use one_ , _where_ , and _how_ . 

In the remainder of this section, we’ll first have a look at typical content of a foundational ontology (Section 6.1.1) and that there are multiple foundational ontologies (Section 6.1.2) to subsequently proceed to the why, where, and how to use them (Section 6.1.3). 

#### **6.1.1 Typical content of a foundational ontology** 

Foundational ontologies provide a high-level categorisation about the kinds of things that will be represented in the ontology, such as _process_ and _physical object_ , relations that are useful across subject domains, such as _participation_ and _parthood_ , and (what are and) how to represent ‘attributes’ in a particular subject domain, such as Colour and Height (recall Section 1.3), which can be done, e.g., as _quality_ or some kind of _dependent continuant_ or _trope_ . To make sense of this, let us start with the two main ingredients: the ‘class’ taxonomy and the relationships. 

##### **Universals, categories, class hierarchy** 

Just like with other ontologies we have seen, also a foundational ontology represented in OWL has a hierarchy in the TBox. However, there are some differences with a domain ontology or tutorial ontology such as the AWO and the Pizza ontology. The hierarchy in a foundational ontology does not contain subject domain classes such as Boerewors and PizzaHawaii, but _categories_ (or, loosely, ‘conceptual containers’) of kinds of things. For instance, all instances of PizzaHawaii can be considered to be _physical objects_ , as are those sausages that are an instance of Boerewors. If we assume there to be physical objects, then presumably, there can also be entities that can be categorised as _non-physical objects_ ; e.g., the class (concept/universal/...) Organisation, with instances such as the United Nations, fall in the category of _social object_ , which are a type of non-physical object. Non-physical objects typically ‘inhere in’ physical objects, or physical objects are the ‘bearer’ of the non-physical ones; e.g., being an instance of Student is a role you play<sup>3</sup> where the physical object is you as an instance of Human. 

> 2see, e.g. beyond concepts [Smi04], the WonderWeb deliverable [MBG+03], and a synopsis of the main design decisions for DOLCE [BM09] 

> 3not ‘role’ as in DLs or ORM, but role in the common sense meaning. 

_Chapter 6. Top-down Ontology Development_ 

118 

Likewise, one can categorise kinds of processes. For instance, writing an exam is something that unfolds in time and has various sub-activities, such as thinking, writing, erasing pencil marks, and so on; taken together, writing an exam is an _accomplishment_ . Contrast this with, say, an instance of Sitting: for the whole duration you sit, each part of it is still an instance of sitting, which thereby may be categorised as a _state_ . None of the things mentioned in _slanted font type_ in this paragraph actually are specific entity types that one would encounter in an ontology about subject domain entities only, yet we would want to be able to categorise the kinds of things we represent in our domain ontology in a systematic way. It is these and other categories that are represented in a foundational ontology. 

The categories introduced with the examples above actually are from the Descriptive Ontology for Linguistic and Cognitive Engineering (DOLCE) foundational ontology, and a screenshot of its hierarchy is shown in Figure 6.1-B. Behind this simple taxonomy in the picture, is a comprehensive formalisation in first order predicate logic that was introduced in [MBG<sup>+</sup> 03]. The taxonomy of the Basic Formal Ontology (BFO) v1 is shown in Figure 6.1-A, to illustrate that the DOLCE categories and their hierarchical organisation are not the only way of structuring such core entities. (How to deal with such variety will be addressed further below). 

Being a pedantic ontologist, one could go as far as saying that if a category is not in the foundational ontology, then its developers are of the opinion it does not exist in reality. It is more likely that the ontology is incomplete in some way. There are efforts ongoing to harmonise the foundational ontologies better, to create a ‘core’ foundational ontology, and to standardise such a core. At the time of writing, this is under construction. 

##### **Relations in foundational ontologies** 

In analogy to the ‘subject domain classes’ in domain ontologies versus categories in foundational ontologies, one can identify generic relations/relationships/object properties that are different from those in domain ontologies. For instance, a domain ontology about universities may have a relation enrolled to relate Student to Course, or in a sports ontology that a runner runs a marathon. These relations are specific to the subject domain, but there are several that re-appear across domains, or: they are subject domain-independent. Such subject domain-independent relations are represented in a foundational ontology. Notable core relations are _parthood_ (which we shall look at in some detail in Section 6.2), _participation_ of an object in an event, _constitution_ of an object (e.g., a vase) from an amount of matter (such as clay), and _dependency_ when the existence of one entity depends on the existence of another. The characterisation of such relations goes hand in hand with the categories from a foundational ontology, so as to be precise rather than alluding to ‘object’ or ‘event’ and assuming your and my intuition about what those things really mean are the same. For instance, one thus could assert that, say, _participates in_ holds only between exactly a _dolce:Endurant_ , which is an entity that is wholly present at a time, and a _dolce:Perdurant_ (an entity that unfolds in time). 

It is a typical characteristic of foundational ontologies to have a set of relations that are used heavily in axioms so as to constrain the possible models as much as 



<!-- Start of picture text -->
Vv @Thing<br>v ©Entity<br>v ©Continuant<br>v ©@DependentContinuant<br>® GenericallyDependentContinuant<br>v ©SpecificallyDependentContinuant<br>® Quality<br>v @RealizableEntity<br>®Disposition<br>® Function<br>@®Role<br>v ©IndependentContinuant<br>v ©MaterialEntity<br>@FiatObjectPart<br>@ Object<br>®ObjectAggregate<br>® ObjectBoundary<br>@Site<br>v ©SpatialRegion<br>®OneDimensionalRegion<br>®ThreeDimensionalRegion<br>®TwoDimensionalRegion<br>®ZeroDimensionalRegion<br>vy ©Occurrent<br>v ©ProcessualEntity<br>@FiatProcessPart<br>@Process<br>®ProcessAggregate<br>®ProcessBoundary<br>®ProcessualContext<br>v ©SpatiotemporalRegion<br>v ©&ConnectedSpatiotemporalRegion<br><!-- End of picture text -->



<!-- Start of picture text -->
Vv @Thing<br>v @Particular<br>v @Abstract<br>@Fact<br>v @Region<br>®AbstractRegion<br>v @PhysicalRegion<br>» @SpaceRegion<br>v ®TemporalRegion<br>®Timelinterval<br>@Set<br>v @®Endurant<br>@ArbitrarySum<br>v @®NonPhysicalEndurant<br>v @®NonPhysicalObject<br>®MentalObject<br>v @SocialObject<br>v @®AgentiveSocialObject<br>®SocialAgent<br>®Society<br>®NonAgentiveSocialObject<br>v @PysicalEndurant<br>®AmountOfMatter<br>v @Feature<br>® DependentPlace<br>®RelevantPart<br>v @PhysicalObject<br>® AgentivePhysicalObject<br>®NonAgentivePhysicalObject<br>v @Perdurant<br>v @Event<br>® Accomplishment<br>® Achievement<br>Vv @Stative<br><!-- End of picture text -->

Vv @Thing Vv @Thing v ©Entity v @Particular v ©Continuant v @Abstract v ©@DependentContinuant @Fact ® GenericallyDependentContinuant v @Region v ©SpecificallyDependentContinuant ®AbstractRegion ® Quality v @PhysicalRegion v @RealizableEntity » @SpaceRegion ®Disposition v ®TemporalRegion ® Function ®Timelinterval @®Role @Set v ©IndependentContinuant v @®Endurant v ©MaterialEntity @ArbitrarySum @FiatObjectPart v @®NonPhysicalEndurant @ Object v @®NonPhysicalObject ®ObjectAggregate ®MentalObject ® ObjectBoundary v @SocialObject @Site v @®AgentiveSocialObject v ©SpatialRegion ®SocialAgent ®OneDimensionalRegion ®Society ®ThreeDimensionalRegion ®NonAgentiveSocialObject ®TwoDimensionalRegion v @PysicalEndurant ®ZeroDimensionalRegion ®AmountOfMatter vy ©Occurrent v @Feature v ©ProcessualEntity ® DependentPlace @FiatProcessPart ®RelevantPart @Process v @PhysicalObject ®ProcessAggregate ® AgentivePhysicalObject ®ProcessBoundary ®NonAgentivePhysicalObject ®ProcessualContext v @Perdurant v ©SpatiotemporalRegion v @Event v ©&ConnectedSpatiotemporalRegion ® Accomplishment ®Spatiotemporallnstant ® Achievement ®Spatiotemporallnterval Vv @Stative ®ScatteredSpatiotemporalRegion @ Process Process vy ©@TemporalRegion @State v @ConnectedTemporalRegion v ®Quality ®Temporalinstant @ AbstractQuality ®Temporalinterval v @PhysicalQuality <mark>®ScatteredTemporalRegion</mark> ®SpatialLocation v ®TemporalQuality ®TemporalLocation 



<!-- Start of picture text -->
v ©&ConnectedSpatiotemporalRegion<br>®Spatiotemporallnstant<br>®Spatiotemporallnterval<br>®ScatteredSpatiotemporalRegion<br>vy ©@TemporalRegion<br>v @ConnectedTemporalRegion<br>®Temporalinstant<br>®Temporalinterval<br>®ScatteredTemporalRegion<br><!-- End of picture text -->



<!-- Start of picture text -->
Vv @Stative<br>@ Process Process<br>@State<br>v ®Quality<br>@ AbstractQuality<br>v @PhysicalQuality<br>®SpatialLocation<br>v ®TemporalQuality<br>®TemporalLocation<br><!-- End of picture text -->

> 



<!-- Start of picture text -->
Physical Object Region<br>| Non-agentive | Physical Quality Physical Region<br>i| Physical Object | ;<br>| | Color Region color space<br>| | Rose |<br>| | P<br>| Color red color<br>| | qt qt(c#1, rose#1) qh PP P<br>| rose#| | c#1=the color color#1 color#2  color#3<br>| ! ofrose#l q\(color#1, c#1, f)<br><!-- End of picture text -->

_6.1. Foundational ontologies_ 

121 

##### types. 

The next step then is: how to solve that problem? That other way of handing attributions is the one typical of foundational ontologies and their respective OWLized versions. The idea is to _generalise_ (more precisely: reify) the attribute into a class so that we can reuse the core notion that is the same throughout (Colour and Weight in the examples), and this new entity is then related to the endurants and perdurants on the one side and instead of datatypes, we use value regions on the other side. Thus, an unfolding from one attribute/OWL data property into at least two properties: there is one OWL object property from the endurant/perdurant to the reified attribute—a _quality_ property, represented as an OWL class—and a second object property from _quality_ to the value region. In this way, the shared understanding can be shared, and any specifics on how one has to store the data is relegated to the implementation, therewith solving the problem of the limited reusability of attributes and preventing duplication of data properties. For instance, Colour would be a subclass of Quality in DOLCE [MBG<sup>+</sup> 03] and a Specifically dependent continuant in BFO. An example of the approach taken in DOLCE is depicted in Figure 6.2: rose1 is an instance of Rose, which is a subclass of NonAgentive Physical Object, and it is related by the qt relation to its colour property, c1, which is an instance of the quality Colour that is a subclass of Physical Quality. The actual value—the [measured] redness—of the colour of the rose at a given time is a region red colour as instance of the Colour Region, which is a subclass of Physical Region, and they are related by means of the qlt relation<sup>4</sup> . 

The remaining step one may have to take is the case when one really has to represent some values in the ontology itself, which is something that the foundational ontologies are silent about. The least complicated and most reusable option is to create a data property, say, hasDataValue with the Region class as domain and XML data type `anyType` as range. This allows one to use the attributions across ontologies and tools, yet leaves the flexibility to the implementer to choose the actual data type. 

This concludes the brief idea of what is in a foundation ontology. As you will have observed, there are several foundational ontologies, which may be confusing or look like overcomplicating things, so we spend a few words on that now. 

#### **6.1.2 Several foundational ontologies** 

In this section, a selection of the foundation ontologies are summarised with respect to their ontological commitments. 

##### **DOLCE** 

As the name suggests, the Descriptive Ontology for Linguistic and Cognitive Engineering (DOLCE) has a strong cognitive/linguistic bias. It takes a descriptive 

> 4There are alternative theories in philosophy one can commit to whilst taking the unaries approach to attributes, but this would be more suitable for an intermediate level of ontology engineering. 

_Chapter 6. Top-down Ontology Development_ 

122 

(as opposite to prescriptive) attitude and the categories mirror cognition, common sense, and the lexical structure of natural language. The emphasis is on cognitive invariants and the categories are intended as ‘conceptual containers’ in the sense that there are no deep metaphysical implications. Further, its documentation [MBG<sup>+</sup> 03] focuses on design rationale so as to facilitate a comparison with different ontological options. It is rigorous, systematic, and has a rich axiomatisation. Concerning the size, it may look ‘small’ from an OWL ontologies viewpoint, having 37 basic categories, 7 basic relations, 80 axioms, 100 definitions, and 20 theorems, but it is a rather dense ontology nonetheless. Besides the paper-based version in [MBG<sup>+</sup> 03], there are also several versions in OWL (Dolce-lite, Dolce-lite Plus, ultralight), where some concessions have been made to force the formalisation into a less expressive language. Some more information and downloads of the various versions are available<sup>5</sup> . 

##### **BFO and the RO** 

The Basic Formal Ontology (BFO)<sup>6</sup> sees Ontology as reality representation. It aims at reconciling the 3-dimensionalist and 4-dimensionalist views with a ‘Snap’ ontology of endurants, which is reproduced at each moment of time and is used to characterise static views of the world, and a ‘Span’ ontology of happenings and occurrents and, more generally, of entities which persist in time by perduring. It has a limited granularity and is heavily influenced by parthood relations, boundaries, and dependence. 

Its version 1 is a bare taxonomy, i.e., there are no relations/object properties. There is a separate Relation Ontology (RO) [SCK<sup>+</sup> 05], which was developed to assist ontology developers in avoiding errors in modelling and assist users in using the ontology for annotations, and such that several ontologies would use the same set of agreed-upon defined relations to foster interoperability among the ontologies. Philosophically, it is still a debate what then the ‘essential’ relations are to represent reality, and if those included are good enough, are too many, or too few. Several extensions to the RO are under consideration and refinements have been proposed, such as for RO’s _transformation_ _~~o~~ f_ [Kee09] that avails of theory underlying OntoClean and _derived_ _~~f~~ rom_ [Bro06]. 

Meanwhile, BFO v2.0 is richly annotated, the forked ROcore<sup>7</sup> does use relevant BFO classes for the domain and range of the incorporated RO relations, whereas the forked draft release of BFO v2.1 (of 2014) takes yet another route where most names of the relations suggest temporality and thus indicate a different intended meaning, yet OWL is atemporal. There is also a BFO Core with mereological theories<sup>8</sup> . 

> 5 `http://www.loa.istc.cnr.it/old/DOLCE.html` 

> 6 `http://basic-formal-ontology.org/` 

> 7 `https://github.com/oborel/obo-relations/wiki/ROCore` 

> 8 `http://www.acsu.buffalo.edu/~bittner3/Theories/BFO/` 

_6.1. Foundational ontologies_ 

123 

##### **GFO** 

The General Formal Ontology (GFO)<sup>9</sup> [HH06] is a component of an integrated system of foundational ontologies that has a three-layered meta-ontological architecture. The three layers are the abstract core level (ACO), the entities of the world (ATO) that are exhaustively divided into _categories_ and _individuals_ , where individuals instantiate categories, and among individuals, there is a distinction between objects and attributives, and the basic level ontology that contains all relevant toplevel distinctions and categories. It has (3D) objects and (4D) processes, admitting universals, concepts, and symbol structures and their interrelations. There are also modules for functions and for roles, and s slimmed version GFO-basic. 

##### **Other foundational ontologies** 

There are several other foundational ontologies that did not receive their separate paragraph in this version of the textbook as the aim is to have about 20 pages per chapter. They include, in alphabetical order: 

- GIST minimalist upper ontology [McC10]; 

- GUM, the Generalized Upper Model, driven by natural language [BMF95]; 

- SUMO, the Standard Upper Merged Ontology [NP01], which was an early FO and has relatively very many classes and relations; 

- UFO, the Unified Foundational Ontology [Gui05]; 

- YAMATO, the Yet Another More Advanced Top-level Ontology, which focuses on qualities and processes and events [Miz10]. 

To the best of my knowledge, only GIST, UFO, and YAMATO are being maintained or extended at the time of writing. 

##### **On multiple foundational ontologies** 

The documentation of the foundational ontologies contain further details about their formalisation and the rationale for having modelled it in the way they did; e.g., that DOLCE takes a multiplicative approach, GFO lets one represent both universals and individuals in the same ontology, BFO claims a realist approach, and so on. Their properties have been structured and are included in the ONSET tool that assists an ontologist with selecting a suitable foundational ontology for one’s own domain ontology based on the selected requirements [KK12]. It saves the user reading the foundational ontology literature to large extent, and all of those new terms that have been introduced (like “multiplicative”) have brief informal explanations. There will be an exercise about it at the end of the chapter. 

One can wonder whether such foundational ontologies just use different names for the same kind of entities, but are essentially all the same anyway. Only very few detailed comparisons have been made. If we ignore some intricate philosophical aspects, such as whether universals and properties exist or not, then still only few entity-by-entity alignments can be made, and even less mappings. An alignment is a mapping only if asserting the alignment in the new ontology containing the 

> 9 `http://www.onto-med.de/ontologies/gfo/` 

_Chapter 6. Top-down Ontology Development_ 

124 

(foundational) ontologies does not lead to an inconsistency. Table 6.1 lists the common alignments among DOLCE, BFO, and GFO. More alignments and mappings are described and discussed in [KK15a] and a searchable version is online in the foundational ontology library ROMULUS [KK16]. 

**Table 6.1:** Common alignments between DOLCE-Lite, BFO and GFO; the ones numbered in bold can also be mapped. (Source: [KK13a]) 

||**DOLCE-Lite**|**BFORO**|**GFO**|
|---|---|---|---|
|||**Class**||
|**1.**|endurant|Independent<br>Continu-<br>ant|Presential|
|**2.**|physical-object|Object|Material<br>~~o~~bject|
|**3.**|perdurant|Occurrent|Occurrent|
|**4.**|process|Process|Process|
|**5.**|quality|Quality|Property|
|**6.**|space-region|SpatialRegion|Spatial<br>~~r~~egion|
|7.|temporal-region|Temporal-Region|Temporal<br>region|
|||**Relational property**||
|1.|proper-part|has<br>~~p~~roper<br>~~p~~art|has<br>proper<br>~~p~~art|
|2.|proper-part-of|proper<br>~~p~~art<br>~~o~~f|proper<br>~~p~~art<br>~~o~~f|
|3.|participant|has<br>~~p~~articipant|has<br>participant|
|4.|participant-in|participates<br>~~i~~n|participates<br>in|
|5.|generic-location|located<br>~~i~~n|occupies|
|6.|generic-location-of|location<br>~~o~~f|occupied<br>~~b~~y|



In closing, observe that there are different versions of each foundational ontology, not only differentiating between a formalisation on paper versus what is representable in OWL, but also more and less detailed versions of an ontology. The other main aspect from an engineering perspective, is to choose the most suitable foundational ontology for the task at hand. 

#### **6.1.3 Using a foundational ontology** 

Having some idea of what a foundational ontology is, is one thing, but how to use them is a different story, and one that is not fully resolved yet. In this subsection, we start first with answering why one would want to use one at all, and some examples where it helps a modeller in making modelling decisions for the overall (domain) ontology. We then turn to some practical aspects, such as their files, language used, and how (where) to link one’s domain entities to those generic categories in a foundational ontology. 

_6.1. Foundational ontologies_ 

125 

##### **Why use a foundational ontology?** 

Foundational ontologies exist, but does that means one necessarily must use one? Not everybody agrees on the answer. There are advantages and disadvantages to it. The principal reasons for why it is beneficial are: 

- one does not have to ‘reinvent the wheel’ with respect to the basic categories and relations to represent the subject domain, 

- it improves overall quality of the ontology by using principled design decisions, and 

- it facilitates interoperability among ontologies that are aligned to the same foundational ontology. 

From the viewpoint of Ontology, a foundational ontology serves to clarify philosophical details and be upfront about them, bring assumptions to the fore and justify them, and, with that, it may become clear where there are any philosophical agreements and disagreements and what their underlying causes are. 

A subset of domain ontology developers do not see a benefit: 

- they consider them too abstract, too expressive and comprehensive for the envisioned ontology-driven information system, and 

- it takes excessive effort to understand them in sufficient detail such that it would not weigh up to the benefits. 

A controlled experiment has been carried out with 52 novice ontology developers, which showed that, on average, using a foundational ontology resulted in an ontology with more new classes and class axioms, and significantly less new ad hoc object properties than those who did not, there were no part-of vs. is-a mistakes, and, overall, “the ‘cost’ incurred spending time getting acquainted with a foundational ontology compared to starting from scratch was more than made up for in size, understandability, and interoperability already within the limited time frame of the experiment” [Kee11b]. There is room for further experimentation, but results thus far point clearly to a benefit. 

##### **Modelling guidance: examples of some principal choices** 

An immediate practical benefit is that Ontology and foundational ontologies help preventing making novice ontology developer’s mistakes, such as confusing parthood with subsumption and class vs instance mix-ups. The former will become clear in Section 6.2 (e.g., a province is part of a country, not a subclass). Regarding the latter, ontologically, instances/individuals/particulars are, roughly, those things that cannot be instantiated, whereas classes (or universals or concepts) can. For instance, the chair you are sitting on is an instance whereas the class Chair can be instantiated (the one you are sitting on is one such instance). Likewise, MacBookPro is a type of laptop, which in an OWL ontology would be added as a _subclass_ of Laptop, not as an instance of Laptop—the MacBook I have with serial number _♯_ 123456 is an instance, and, likewise, GoldenDelicious is a subclass of Apple, 

_Chapter 6. Top-down Ontology Development_ 

126 

not an instance (the actual instances grow on the tree and are on the shelves in the supermarket). 

An example on choosing how to represent relations is described next. 

**Example 6.1.** _A relation, i.e., an n-ary with n >_ 1 _, can be represented as an unary entity (a class in OWL) or as a n-ary relation (object property in OWL if it is a binary). It is certainly more intuitive to keep the n-aries as such, because it indicates a close correspondence with natural language. For instance, in formalising “Person runs marathon”, it is tempting to represent “runs” as an object property_ runs _and assert, say,_ Marathon _⊑∃_ runs<sup>_−_</sup> _._ Person _._ 

_The foundational ontologies take a different approach. Such perdurants, like_ Running _, and the verbs we use to label them, are included as an_ unary _(OWL class) suitably positioned as a subclass of processes, being Process in both DOLCE and BFO. In DOLCE, it is then related with a_ new _relation to ‘objects’, which are suitably positioned subclasses of Endurant in such a way that an endurant is a participant in a perdurant. For instance, still with the TBox-level knowledge that “Person runs marathon”, then_ Running _(being a subclass of_ Process _) has_ _~~p~~ articipant some_ Person _(i.e.,_ Running _⊑∃_ has ~~p~~ articipant _._ Person _) and another binary to_ Marathon _(e.g.,_ Marathon _⊑∃_ involves _._ Running _), but there is no 1-to-1 formalisation with an object property_ runs _that has as domain and range_ Person _and_ Marathon _. BFO (with the RO) aim to resolve this with_ dispositions _: a person may have the disposition to run (be it a marathon or more generally), but not actually run (a marathon) in their entire life. To resolve this in the representation, we need not only_ Running _⊑_ Process _, but also the definition that_ RunningDisposition _≡_ Disposition _⊓∀_ hasRealization _._ Running) _and assert that_ Person _⊑∃_ bearerOf _._ RunningDisposition _before we get to the marathon._ 

_The option with_ runs _results in a more compact representation, is intuitively closer to the domain expert’s understanding, and makes it easier to verbalise the ontology, and therefore is likely to be more useful in praxis. The_ Running _option is more generic, and thereby likely to increase reusability of the ontology. No scientific experiments have been conducted to test which way would be better to represent such knowledge, and current mapping tools do not deal with such differences of representing roughly the same knowledge in syntactically very different ways. Theoretical foundations for mappings between such distinct modelling styles have been proposed [FK17], and this may be resolved soon._ 

_Whichever way one chooses to represent such information, adhering to that choice throughout the ontology makes the ontology easier to process and easier to understand by the human reader. ♦_ 

A longer and practical example and exercises with the African Wildlife Ontology is included in the next section. 

##### **Practical aspects on using a foundational ontology** 

It was already mentioned that there are OWL-ized versions of several foundational ontologies, but there is more to it. Once the most appropriate foundational ontology is selected, the right version needs to be imported either in full or a module thereof, 

_6.1. Foundational ontologies_ 

127 

and it has to be linked to the entities in your ontology. The latter means you will have to find out which category each of your entity is and which object properties to use. 

Some 15 years ago researchers already realised it might not be feasible to have one singe foundational ontology that pleases everybody; hence, the idea emerged to create a library of foundational ontologies with appropriate mappings between them so that each modeller can choose her pet ontology and the system will sort out the rest regarding the interoperability of ontologies that use different foundational ontologies. The basis for this has been laid with the Wonderweb deliverable D18, but an implementation was yet to be done and new foundational ontology developments have taken place since 2003. A first step in the direction of such a foundational ontology library has been laid recently with the Repository of Ontology for MULtiple USes, ROMULUS [KK13b]. ROMULUS focuses on OWL ontologies in particular. 

The leaner OWL versions of DOLCE and BFO have been made available and are intended to be used for development of ontologies in one’s domain of interest. These files can be found on their respective websites (see earlier footnotes), which also lists domain ontologies that use them. Observe that DOLCE-Lite is encoded in the DL language that is characterised by _SHI_ , BFO is simpler (in _ALC_ ); that is, neither one uses all OWL-DL capabilities of _SHOIN_ ( _D_ ), let alone all OWL 2 DL features. Recall that another difference is that BFO-in-owl is only a bare taxonomy (extensions with the RO do exist; see Section 6.1.2), whereas DOLCE-Lite makes heavy use of object properties. 

To make reuse easier, ‘clever modules’ of foundational ontologies may be useful, such as light/basic and full versions according to the developers’ taste, a separate major branch of the ontology (e.g., using only _Endurant_ s), and a computationally better behaved fragment with the best semantic approximation of the full version (i.e., not merely dropping the violating axioms), such as an OWL 2 EL compliant fragment of DOLCE. Some of those are also available from the aforementioned ROMULUS and, by extension, the OntoHub ontology libraries. 

Once the foundational ontology is _imported_ (not leaded and extended), the task is to find the right classes to link one’s domain classes to, and likewise for the object properties. The whole process is illustrated in the following example, starting with a very basic African Wildlife Ontology, and gradually extending it and improving its quality. 

**Example 6.2.** _Continuing with the African Wildlife Ontology from Example 4.1, a first step to improve its quality may be to add knowledge to ensure a better coverage of the subject domain. Adding classes and object properties to an ontology does not necessarily make a_ better quality _ontology. One aspect that does with respect to the subject domain, is to_ refine the represented knowledge _further and with_ more constraints _so as to limit the possible models; e.g.: 1) giraffes eat not only leaves but also twigs, 2) they are disjoint from impalas, and 3) more object property characteristics, e.g., that the_ is-part-of _is not only transitive, but also reflexive, and_ is-proper-part-of _is transitive and irreflexive or asymmetric (recall that the latter can be added thanks to the increased expressiveness of OWL 2 DL compared to_ 

_Chapter 6. Top-down Ontology Development_ 

128 

_OWL-DL, but not both irreflexivity and asymmetry)._ 

_Third, we can improve the ontology’s quality by using a_ foundational ontology _, as mentioned in Section 6.1.3; e.g., one of DOLCE, BFO, GFO, SUMO, and YAMATO that were introduced in Section 6.1.1 and all happen to have OWLized version of them._ 

_For the sake of example, let us take DOLCE to enrich the African Wildlife Ontology. To do this, we need to import into the AWO an OWLized version of DOLCE; in this case, this means importing_ `DOLCE-lite.owl` _. Then, consider first the taxonomic component of DOLCE in Figure 6.1-B (for details, see Wonderweb deliverable D18 Fig 2 p14 and Table 1 p15 or explore the imported ontology with its annotations)._ 

_1. Where does_ Plant _fit in in the DOLCE categorisation?_ 

_2. Giraffes drink water: where should we put_ Water _?_ 

_3. Impalas run (fast); where should we put_ Running _?_ 

_4. Lions eat impalas, and in the process, the impalas die; where should we put_ Death _?_ 

_To answer such questions, we have to look at the principal distinctions made in DOLCE among its categories. Let us take_ Plant _: is_ Plant _wholly presents during its existence (enduring), or is it happening in time (perduring)? With a 3D versus 4D worldview, the former applies. Within endurants, we look at its subclasses, which are Arbitrary Sum, Physical Endurant, and Non-Physical Endurant: a plant is certainly not some arbitrary collection of things, like the set of this lecture notes and your pencil are, and a plant takes up physical space, so one chooses Physical Endurant. We repeat this for the subclasses of Physical Endurant, which are Feature, Amount of Matter, and Physical Object. A feature (in DOLCE) is something like a bump in the road or the hole in a swiss cheese, hence quite distinct from Plant (but a plant can have such things). Amount of matter is in natural language normally denoted with a mass noun, such as gold and water, and it can be counted only in quantities (a litre of water); however, plants can be counted, so they are physical objects and, hence, we can add_ AWO:Plant _⊑_ dolce:PhysicalObject _to the ontology. One can find the alignments for the other ones in a similar step-wise way, which may be assisted by the decision diagram in Figure 6.3. The answers can be found in_ `AfricanWildlifeOntology2a.owl` _._ 

_DOLCE is more than a taxonomy, and we can also inspect in more detail its object properties and reuse the properties already defined instead of re-inventing them. First, the African Wildlife Ontology’s_ is-part-of _is the same as DOLCE’s partof, and likewise for their respective inverses, so declare them equivalent. Concerning the subject domain, here are a few modelling questions._ 

_1. The_ Elephant _’s_ Tusk _s (ivory) are made of_ Apatite _(calcium phosphate, an amount of matter); which DOLCE relation can be reused?_ 

_2. Giraffes eat leaves and twigs; how do_ Plant _and_ Twig _relate?_ 

_3. How would you represent the_ Size _(_ Height _,_ Weight _, etc.) of an average adult elephant; with DOLCE’s_ Quality _or an OWL data property?_ 

_Answers to the first two questions are included in_ `AfricanWildlifeOntology2a.owl` _. Note first that_ AWO:Tusk _⊑_ dolce:PhysicalObject _and_ AWO:Apatite _⊑_ dolce:AmountOfMatter _, so we need to find an object property that has as domain a physical object_ 



<!-- Start of picture text -->
Q: Is [] wholly present at<br>any time of its existence?<br>(oooQ:happeningIs [] something or an occuring?that ispreceivedaQ: Is [] somethingor measuredthat(like cancolor,be Q:inDoes time or[] exist doesneither so becausein space somenor Q:7 Is []a collectionEndurantra} of things,<br>Z\ size, smell, etc.,)? other itemsparts occupy that are that not region? among its regardicesOBer ot curerences!ele spevel or<br>Q: Are you able to be ‘Yes, bie<br>present or participate In []? (auatty ) rm RA ae<br>Q: [\ Sum Z\<br>(physical) object? Q: Is [] a collection of well Q: Is [Ja location of or some other object to exist in, or is [] a role<br>(event) Is [] an attribute ofa _______. Q: Does [] not take up space or does [] need<br>A —_ Yes No defined objects? ‘occupled by some played by some object? (e.g., a student)<br>subdivisionsQ: Isdefinite[] Atomic, end of iti.e., point? andhas hasno a Ga6 Regionobject? EndurantPhysicalNo GnipHuniealYes<br>‘\ “ endurant<br>.es: No. shortQ: when durations,[] is dividedis eachintoof oleee ntig that Q: Doesexist (like[] exist insofarholes, bump it s  host, x<br>these durations‘as a[]? referred to happeningTe or occurring?Ne Q: Issomething[] a piece that of information exists or has about boundaries, or spots of color)? cconmeporeny@: Is []dependent egents on a<br>‘Accomplishment appened? No Ye<br>‘Yes na C2 or embeddedsocial setting?in some<br>Temporal Abstract Q: Is [] something that<br>Quality Quality cannot be counted, or only in No<br>specific quantities? bias<br>° Mental<br>Object<br>Amount of<br>Matter<br><!-- End of picture text -->

_Chapter 6. Top-down Ontology Development_ 

130 

_a Content Ontology Design Pattern_<sup>10</sup> _, such as being more finicky about names for plants and animals with, perhaps, a Linnaean Taxonomy content pattern or adding some information on Climatic Zones where the plants and animals live, and so on_<sup>11</sup> _. Such patterns are the topic of Section 7.6. ♦_ 

You may like to inspect a real ontology that is linked to DOLCE as well. There are multiple examples, such as BioTop [BSSH08] that is linked to both DOLCE and BFO-RO, and the Data Mining Optimization Ontology we have come across in Section 1.3.2 [KLd<sup>+</sup> 15]. A selection of the links is depicted in Figure 6.4. 

Methods and supporting tools are being developed that are informed by foundational ontologies or provide actual support using them, e.g., [HOD<sup>+</sup> 10, KK12, KKG13, KK16, Hep11], but more can be done to assist the modeller in the ontology authoring process involving foundational ontologies. 



<!-- Start of picture text -->
dolce:particular<br>dolce:non-physical-endurant dolce:process dolce:quality dolce:abstract<br>.... DataType DataFormat<br>DM-Task DM-Data<br>dolce:abstract-quality dolce:region<br>DM-Algorithm<br>DM-Operation<br>dolce:quale dolce:abstract-region<br>DM-Experiment<br>Characteristic Parameter<br>....<br>NeighborhoodRange<br>OpParameterSetting<br><!-- End of picture text -->

**Figure 6.4:** Selection of DMOP classes linked to DOLCE. 

### **6.2 Part-whole relations** 

A, if not _the_ , essential relation in Ontology and ontologies is the part-whole relation, which is deemed as essential as subsumption by the most active adopters of ontologies—i.e., bio- and medical scientists—while its full potential is yet to be discovered by, among others, manufacturing to manage components of devices. Let’s start with a few modelling questions to get an idea of the direction we are heading at: 

- Is City a subclass of or a part of Province? 

- Is a tunnel part of the mountain? If so, is it a ‘part’ in the same way as the sand of your sandcastle on the beach? 

- What is the difference, if any, between how Cell nucleus and Cell are related and how Cell Receptor and Cell wall are related? Or between the circuit on the ethernet card embedded on the motherboard and the motherboard in the computer? 

> 10 `http://www.ontologydesignpatterns.org/` 

> 11But note that regarding content, one also can take a bottom-up approach to ontology development with resources such as the Environment Ontology ( `http://www.environmentontology. com/` ) or pick and choose from ‘semantified’ Biodiversity Information Standards ( `http://www. tdwg.org/` ) etc. Bottom-up approaches are the topic of the next chapter. 

_6.2. Part-whole relations_ 

131 

- Assuming boxers must have their own hands and boxers are humans, is Hand part of Boxer in the same way as Brain is part of Human? 

- Consider that “Hand is part of Musician” and “Musician part of Orchestra”. Clearly, the musician’s hands are not part of the orchestra. Is part-of then not transitive, or is there a problem with the example? 

To shed light on part-whole relations in its broadest sense and sort out such modelling problems, we will look first at mereology, which is the Ontology take on part-whole relations, and to a lesser extent meronymy, which is more popular in linguistics. Subsequently, the different terms that are perceived to have something to do with part-whole relations are structured into a taxonomy of part-whole relations, based on [KA08], which has been adopted elsewhere, such as in NLP. 

#### **6.2.1 Mereology** 

The most ‘simple’ mereological theory is commonly considered to be Ground Mereology. We take the one where parthood is primitive<sup>12</sup> , i.e., part-of is not defined but only characterised with some properties. In particular, the three characterising properties are that parthood is reflexive (everything is part of itself, Eq. 6.1), antisymmetric (two distinct things cannot be part of each other, or: if they are, then they are the same thing, Eq. 6.2), and transitive (if _x_ is part of _y_ and _y_ is part of _z_ , then _x_ is part of _z_ , Eq. 6.3): 







With parthood, on can define _proper parthood_ : 



and its characteristics are that it is transitive (Eq. 6.5), asymmetric (if _x_ is part of _y_ then _y_ is not part of _x_ , Eq. 6.6) and irreflexive ( _x_ is not part of itself, Eq. 6.7). Irreflexivity follows from the definition of proper parthood and then, together with antisymmetry, one can prove asymmetry of proper parthood (proofs omitted). 







These basic axioms already enable us to define several other common relations. Notably, overlap ( _x_ and _y_ share a piece _z_ ): 



> 12one also can take proper parthood as primitive and define parthood in terms of it [Var04], and one can argue about including other things (see below for some examples) or remove some (see, e.g., [Cot10]) 

_Chapter 6. Top-down Ontology Development_ 

132 

and underlap ( _x_ and _y_ are both part of some _z_ ): 



The respective definitions of proper overlap & proper underlap are similar. 

But there are ‘gaps’ in Ground Mereology, some would say; put differently: there’s more to parthood than this. For instance: what to do—if anything—with the ‘remainder’ that makes up the whole? There are two options: 

- Weak supplementation: every proper part must be supplemented by another, disjoint, part, resulting in Minimal Mereology (MM). 

- Strong supplementation: if an object fails to include another among its parts, 

then there must be a remainder, resulting in Extensional Mereology (EM). There is a problem with EM, however: non-atomic objects with the same proper parts are identical (extensionality principle), but sameness of parts may not be sufficient for identity. For instance, two objects can be distinct purely based on arrangement of its parts, like there is a difference between statue and its marble and between several flowers bound together and a bouquet of flowers. This is addressed in General Extensional Mereology (GEM); see also Figure 6.5. 

One can wonder about parts some more: does it go on infinitely down to even smaller than the smallest, or must it stop at some point? If one is convinced it stops with a smallest part, this means a ‘basic element’ exists, which is called Atom in mereology. The alternative—going on infinitely down into parts of parts—is that at the very basis there is so-called atomless ‘gunk’. These different commitments generate additional mereological theories. If that is not enough for extensions: one could, e.g., _temporalise_ each mereological theory, so that one can assert that something used to be part of something else; this solves the boxer, hand, and brain example mentioned in the introduction (we’ll look at the solution in Section 10.2.2). Another option is to also consider space or topology, which should solve the tunnel/mountain question, above; see also, e.g., [Var07]. These extensions do not yet solve the cell and the musician questions. This will be addressed in the next section. 

#### **6.2.2 Modelling and reasoning in the context of ontologies** 

Mereology is not enough for ontology engineering. This is partially due to the ‘spillover’ from conceptual data modelling and cognitive science, where a whole range of relations are sometimes referred to as a parthood relation, but which are not upon closer inspection. In addition, if one has only part-of in one’s ontology with no domain or range axiom, the reasoner will not complain when one adds, say, Hand _⊑ ∃_ part-of.Musician and Musician _⊑∃_ part-of.Performance, even though ontologically this is not quite right. A philosopher might say “yeah, well, then don’t do this!”, but it would be more useful for an ontology developer to have relations at one’s disposal that are more precise, both for avoiding modelling mistakes and for increasing precision to obtain a better quality ontology. 

This issue has been investigated by relatively many researchers. We shall take a closer look at a taxonomy of part-whole relations [KA08] that combines, extends, and formalises them. The basic version of the informal graphical rendering is depicted in Figure 6.6. 

_6.2. Part-whole relations_ 

133 



<!-- Start of picture text -->
General Extensional Mereology<br>GEM = GMM<br>General Mereology<br>GM Extensional Closure Mereology<br>CEM = CMM<br>Closure Mereology<br>CM Extensional Mereology<br>EM<br>Minimal Mereology<br>MM<br>Ground Mereology<br>M<br><!-- End of picture text -->

**Fig. 1:** Hasse diagram of mereological theories; from weaker to stronger, going uphill (after [44]). 

**Figure 6.5:** Hasse diagram of mereological theories; from weaker to stronger, going uphill (after [Var04]). Atomicity can be added to each one. 



<!-- Start of picture text -->
Part-whole relation<br>parthood mpart<br>[mereology] [in discourse only]<br>membership constitution<br>s-parthood involvement (object/role- (stuff-object)<br>(objects) spatial  (processes) collective)<br>parthood stuff part portion participation<br>(different stuffs) (same stuff) (object-process)<br>containment lo cation<br>(3D objects) (2D objects)<br><!-- End of picture text -->

**Figure 6.6:** Taxonomy of basic mereological (left-hand branch) and meronymic (righthand branch) part-whole relations, with an informal summary of how the relations are constrained by their domain and range; s-parthood = structural parthood. (Source: based on [KA08]) 

The relations have been formalised in [KA08]. It uses DOLCE in order to be precise in the domain and range axioms; one could have taken another foundational ontology, but at the time it was a reasonable choice (for an assessment of alternatives, see [Kee17a]). The more precise characterisations (cf. the figure) and some illustrative examples are as follows. 

- _involvement_ for processes and sub-processes; e.g. Chewing (a pedurant, PD) is involved in the grander process of Eating (also a perdurant), or vv.: 



- _containment_ and _location_ for object and its 2D or 3D region; e.g., containedin(John’s address book, John’s bag) and located ~~i~~ n(Tshwane, South Africa). They are formalised as Eqs. 6.11 and 6.12, respectively, where _has_ ~~2~~ _D_ and _has_ 3 _D_ are shorthand relations standing for DOLCE’s qualities and qualia: 



_Chapter 6. Top-down Ontology Development_ 

134 



Observe that the domain and range is _Region_ (R), which has an object occupying it, i.e., this does not imply that those objects are related also by structural parthood. Also, the 2D vs 3D distinction is not strictly necessary, but prior research showed that modellers like to make that difference explicit. 

- _structural parthood_ between endurants (ED) specifically: 



Practically, this is probably better constrained by PED, physical endurant, such as a wall being a structural part of a house. 

- _stuff part_ or “quantity-mass”, e.g., Salt as a stuff part of SeaWater relating different types of amounts of matter (M) or stuffs, which are typically indicated with mass nouns and cannot be counted other than in quantities. A _partial formalisation_ is as follows (there is a more elaborate one [Kee16]): 



- _portion_ , elsewhere also called “portion-object”, relating a smaller (or sub) part of an amount of matter to the whole, where both are of the same type of stuff; e.g., the wine in the glass of wine & wine in the bottle of wine. A _partial formalisation_ is as follows (there is a more elaborate one [Kee16]): 



- _membership_ for so-called “member-bunch”: collective nouns (e.g., Herd, Orchestra) with their members (Sheep, Musician, respectively), where the subscript “n” denotes non-transitive and POB physical object and SOB social object: 



That is, sometimes transitivity might hold in a chain of memberships, but as soon as POB and SOB are mixed, that stops working, like with the hand in the example at the start of the section, for it is a POB. 

- _participation_ where an entity participates in a process (also called “nounfeature/ activity”), like Enzyme that participates in CatalyticReaction or a Musician participating in a Performance, where the subscript “it” denotes intransitive: 



From this definition, it becomes obvious why a ‘musician is part of a performance’ does not work: the domain and range are disjoint categories, so they never can line up in a transitivity chain. 

_6.2. Part-whole relations_ 

135 

- _constitution_ or “material-object”, to relate that what something is made of to the object, such as the Vase and the (amount of) Clay it is constituted of, where the subscript “it” denotes intransitive: 

   - _∀_ x _,_ y(constitutesit(x _,_ y) _≡_ constituted ~~o~~ fit(y _,_ x) _≡_ mpart ~~o~~ f(x _,_ y) _∧_ (6.18) 

   - POB(y) _∧_ M(x)) 

This can be put to use with manual or software-supported guidelines, such as OntoPartS [KFRMG12], to choose the most appropriate part-whole relation for the modelling problem at hand. Several OWL files with taxonomies of part-whole relations, including aligned to other foundational ontologies are also available<sup>13</sup> . 

Note that the mereological theories from philosophy are, as of yet, not feasible to implement in OWL: there is no DL that actually allows one to represent all of even the most basic mereological theory (Ground Mereology), as shown in Table 6.2, let alone add definitions for relations. This is possible within the DOL framework (recall Section 4.3.2). More precisely with respect to the table’s languages beyond OWL: _DLRµ_ is a peculiar DL [CDGL99] and HOL stands for higher order logic (like, second order, beyond first order). Acyclicity means that an object _x_ does not have a path to itself through one or more relations _R_ on which acyclicity is declared. The reason why acyclicity is included in the table is that one actually can prove acyclicity with the axioms of proper parthood. It needs second order logic, though; formally, acyclicity is _∀x_ ( _¬ϕ_ ( _x, x_ )) where _ϕ_ ranges over one or more relations (of proper parthood, in this case). 

**Table 6.2:** Properties of parthood ( _._<sup>_P_</sup> ) and proper parthood ( _._<sup>_PP_</sup> ) in Ground Mereology and their inclusion in the OWL family, FOL, _DLRµ_ , and HOL. 

|**Language** _⇒_|DL|Lite|2DL|2QL|2RL|2EL|_DLRµ_|FOL|HOL|
|---|---|---|---|---|---|---|---|---|---|
|**Feature** _⇓_||||||||||
|Refexivity<sup>_P_</sup>|–|–|+|+|–|+|+|+|+|
|Antisymmetry<sup>_P_</sup>|–|–|–|–|–|–|–|+|+|
|Transitivity<sup>_P,PP_</sup>|+|+|+|–|+|+|+|+|+|
|Asymmetry<sup>_PP_</sup>|–|–|+|+|+|–|+|+|+|
|Irrefexivity<sup>_PP_</sup>|–|–|+|+|+|–|+|+|+|
|Acyclicity|–|–|–|–|–|–|+|–|+|



Notwithstanding this, what sort of things can be derived with the part-whole relations, and what use may it have? The following example provides a few of the myriad of illustrations. 

**Example 6.3.** _Informally, e.g., when it is possible to deduce which part of the device is broken, then only that part has to be replaced instead of the whole it is part of (saving a company money), and one may want to deduce that when a soccer player has injured her ankle, she has an injury in her limb, but not deduce that_ 

> 13 `http://www.meteck.org/swdsont.html` 

_Chapter 6. Top-down Ontology Development_ 

136 

_if she has an amputation of her toe, she also has an amputation of her foot that the toe is (well, was) part of. If a toddler swallowed a Lego brick, it is spatially contained in his stomach, but one does_ not _deduce it is structurally part of his stomach (normally it will leave the body unchanged through the usual channel). A consequence of asserting reflexivity of parthood in the ontology is that then for a domain axiom like_ Twig _⊑∃_ s-part-of.Plant _, one deduces that each_ Twig _is a_ part-of _some_ Twig _as well, which is an uninteresting deduction, and, in fact, points to a defect: it should have been asserted to be a_ proper _part—which is irreflexive—of_ Plant _. ♦_ 

A separate issue that the solution proposed in [KA08] brought afore, is that it requires one to declare the taxonomy of relations correctly. This can be done by availing of the _RBox Compatibility_ service that we have seen in Section 5.2.3. While the part-whole taxonomy, the _RBox Compatibility_ service, and the OntoPartS tool’s functionalities do not solve all modelling problems of part-whole relations, at least they provide an ontologist with a sound basis and some guidelines. 

As noted before, various extensions to mereology are being investigated, such as mereotopology and mereogeometry, the notion of essential parthood, and portions and stuffs. For mereotopology, the interested reader may want to consult, among others, ontological foundations [Var07] and its applicability and modelling aspects in the Semantic Web setting with OWL ontologies [KFRMG12] and DOL [KK17b], the introduction of the RCC8 spatial relations [RCC92], and exploration toward integrating RCC8 with OWL [GBM07, SS09]. Useful starting points for portions and stuff parts from the viewpoint of ontology and formalisations are [BD07, DB09, Kee16]. 

Other foundational ontology aspects, such as philosophy of language, modal logic, change in time, properties, the ontology of relations, and dependence, will not be addressed in this course. The free online Stanford Encyclopedia of Philosophy<sup>14</sup> contains comprehensive, entry-level readable, overviews of such foundational issues. 

### **6.3 Exercises** 

**Review question 6.1.** Why would one want to at least consider using a foundational ontology in ontology development? 

**Review question 6.2.** Name at least three fundamental ontological design decisions that affect how a foundational ontology will look like with respect to its contents. 

**Review question 6.3.** What are the major differences between DOLCE and BFO in terms of philosophical approach? * 

**Review question 6.4.** What is the major difference between DOLCE and BFO in type of contents of the ontologies? * 

> 14 `http://plato.stanford.edu/` 

_6.3. Exercises_ 

137 

**Review question 6.5.** Name at least 2 common relations—in terms of definition * or description and intention—in the OWLized DOLCE, GFO and RO. 

**Review question 6.6.** Why can one not represent Ground Mereology fully in OWL 2 DL? 

**Review question 6.7.** Which part-whole relation is appropriate to relate the following entities? 

1. Plant and Twig; 

2. Tusk/Ivory and Apatite; 

3. Musician and Performance; 

4. Musician and Orchestra 

**Exercise 6.1.** Content comparison: 

   - a. Try to match the DOLCE classes Endurant, Process, Quality, Amount of Matter, Accomplishment, Spatial Region, Agentive Physical Object, and Set to a class in BFO. * 

   - b. If you cannot find a (near) equivalence, perhaps as a subclass-of some BFO class? And if not even that, why do you think that (those) class(es) is (are) not mappable? * 

- **Exercise 6.2.** Assume you are asked to develop an ontology about a. Sociological and organisational aspects of public administration 

   - b. The physiology and chemistry of medicinal plants c. A topic of your choice 

- Which (if any) foundational ontology would you choose for each one? Why? * 

**Exercise 6.3.** Download ONSET from `http://www.meteck.org/files/onset/` and re-do Exercise 6.2, but now use the ONSET tool to obtain an answer. Does it make any difference? Were your reasons for choosing a foundational ontology the same as ONSET’s? 

**Exercise 6.4.** Consider the following scenario. 

Both before and since the 2008 recession hit, banks have been merging and buying up other banks, which have yet to integrate their IT systems within each of the consolidated banks, and meet new regulations on transparency of business operations. To achieve that, you are tasked with developing an ontology of banks that will facilitate the database integration and transparency requirements. In such an ontology there will be concrete entities e.g., Bank manager and ATM, and abstract entities e.g., Loans. For this to be possible, the ontological assumptions that are made by the ontology must be based on human common-sense. Processes, such as withdrawals and deposits must also be modelled. It must be possible to capture dates and times for operations that occur between entities and processes. Past and present transactions must be allowed in the ontology. Entities of the ontology may have properties and values associated with them e.g., an individual has a credit rating. It may be useful to refer to or possibly use components of an 

_Chapter 6. Top-down Ontology Development_ 

138 

ontology that implements a particular mereology theory such as classical extensional mereology (CEM) or any other. This ontology must be represented in OWL 2 DL. 

Which (if any) foundational ontology would you choose? Why? * 

**Exercise 6.5.** Consider the D3 decision diagram and answer the first four questions of Example 6.2. 

**Exercise 6.6.** Download either `AfricanWildlifeOntology2.owl` (with DOLCE) or `AfricanWildlifeOntology3.owl` (with BFO), open it in the ontology development environment of choice, and inspect its contents. Modify the African Wildlife Ontology such that it contains, in some way, the following: 

- a. Add enough knowledge so that RockDassie will be classified automatically as * 

- a subclass of Herbivore. 

- b. Add information that captures that lions, impalas, and monkeys reside in nature reserves that are located in a country (like Kenya, well-known for safaris), and that monkeys can also be found on some university campuses in residential areas. * 

- c. Rangers of nature reserves are Humans (or: it’s a role that a human can perform). * 

Was there anything of use from DOLCE/BFO to assist with that? 

**Exercise 6.7.** Consider the _dispositions_ and _realisations_ included in BFO v2 and the RunningDisposition in Example 6.1. How would this approach affect the AWO regarding the eats object property (and, optionally: how should the Running class of Example 6.2 be handled (as part of the ‘impalas that run fast’))? Discuss and write the new axioms. * 

### **6.4 Literature and reference material** 

1. Masolo, C., Borgo, S., Gangemi, A., Guarino, N., Oltramari, A.: WonderWeb Deliverable D18–Ontology library. WonderWeb. `http://wonderweb.man. ac.uk/deliverables/documents/D18.pdf` (2003). 

2. Keet, C.M. and Artale, A. Representing and Reasoning over a Taxonomy of Part-Whole Relations. _Applied Ontology_ , IOS Press, 2008, 3(1-2): 91-110. 

### CHAPTER 7 

### Bottom-up Ontology Development 

Besides a top-down approach, another option to developing an ontology without starting with a blank slate, is to reuse exsiting data, information, or knowledge. A motivation to consider this are the results obtained by Simperl et al [SMB10]: they surveyed 148 ontology development projects, which showed that “domain analysis was shown to have the highest impact on the total effort” of ontology development, “tool support for this activity was very poor”, and the “participants shared the view that process guidelines tailored for [specialised domains or in projects relying on end-user contributions] are essential for the success of ontology engineering projects”. In other words: the _knowledge acquisition bottleneck_ is still an issue. Methods and tools have been, and are being, developed to make it less hard to get the subject domain knowledge out of the experts and into the ontology, e.g., through natural language interfaces and diagrams, and to make it less taxing on the domain experts by reusing the ‘legacy’ material they already may have to manage their information and knowledge. It is the latter we are going to look at in this chapter: _bottom-up ontology development_ to get the subject domain knowledge represented in the ontology. We approach it from the other end of the spectrum compared to what we have seen in Chapter 6, being starting from more or less reusable non-ontological sources and try to develop an ontology from that. 

Techniques to carry out bottom-up ontology development range from manual to (almost) fully automated. They differ according to their focus: 

- Ontology learning to populate the TBox, where the strategies can be subdivided into: 

   - transforming information or knowledge represented in one logic language into an OWL species; 

   - transforming somewhat structured information into an OWL species; 

   - starting at the base. 

- Ontology learning to populate the ABox. 

139 



<!-- Start of picture text -->
XML = ae<br>Schema Description<br>Formal Logics<br>Terms XML DTDs taxonomies<br>Common Logic<br>C e T<br>Conceptual Data<br>‘ordinary’ Models<br>Glossaries<br>DictionariesDatata Database Frames GeneralLogicH<br>Schema<br>Glossaries & MetaData, Formal Ontologies<br>Data Dictionaries XML Schemas, & Inference<br>& Data Models<br><!-- End of picture text -->

_7.1. Relational databases and related ‘legacy’ KR_ 

141 

academics’ best efforts to teach good design and maintenance methodologies in a degree programme, it is not uncommon in organisations that if there was a conceptual model for the database at all, it is outdated by the time you would want to use it for ontology development. New columns and tables may have been added in the database, constraints removed, tables joined (further denormalised) for better performance or vice versa for cleaner data, and so on, and no-one may have bothered to go back to the original conceptual, or even relational, model and update it with the changes made. Practically, there likely will be a database with multiple tables that have many (15-50) columns. This is represented at the bottom of Figure 7.2. 



<!-- Start of picture text -->
Ontology<br>G<br>T F<br>...<br>C<br>S B<br>A<br>E<br>R H<br>D Env:1 Env:2 Env:3<br>Env:15 Env:25<br>...<br>... ...<br>B A<br>C<br>ID Env:123 Env:444<br>Env:512<br>D<br>X ...<br>E H ...<br>G<br>X<br>ID A B C D E F G H ...<br>Env:123<br>Env:137<br>Env:512<br>Env:444<br>...<br>X<br>F<br><!-- End of picture text -->

**Figure 7.2:** Denormalised relational database (bottom), where each table is reverse engineered into an entity in a ‘flat’ EER diagram (middle), and subsequently refined with respect to the hidden entity types and annotations, such as the Environment ontology (top), which then finally can be transformed/translated into an ontology. 

_Chapter 7. Bottom-up Ontology Development_ 

142 

If one were to simply convert that SQL schema into an OWL ontology, the outcome would be a bunch of classes with many data properties and an unnamed object property between a subset of the classes based on the foreign key constraints. This won’t do as an ontology. Let us have a look at the additional steps. 

##### **Reverse engineering the database** 

There are several reverse engineering tools for SQL schemas of relational databases, where a first pass results in one of the possible logical models (i.e., the relational model for an RDBMSs), and another iteration brings one up to the conceptual data model (such as ER, ORM) [HCTJ93]. Such a first draft version of the EER model is depicted in EER bubble notation in Figure 7.2, where each table (relation) has become an entity type and each column an attribute. The main problematic consequence for reverse engineering the conceptual data model to feed into an OWL ontology is that the database structure has been ‘flattened out’, which, if simply reverse engineered, ends up in the ‘ontology’ as a class with umpteen attributes with which one can do minimal (if at all) automated reasoning (see the first diagram above the table in Figure 7.2). 

To avoid this, should one perform some normalization steps to try to get some structure back into the conceptual view of the data alike in the diagram at the top in Figure 7.2, and if so, how? Whether done manually or automatically, it can be cleaned up, and original entity types (re-)introduced, relationships added, and the attributes separated accordingly, thereby making some knowledge implicit in the database schema explicit, which is depicted in the top-half of Figure 7.2. A tried and tested strategy to do this semi-automatically is by discovering functional dependencies in the data stored in the database tables. Such reverse engineering opens up other opportunities, for one could use such a procedure to also establish some mechanism to keep a ‘link’ between the terms in the ontology and the source in the database so that the ontology can be used to enhance data analysis through conceptual model or ontology-based querying. A particular algorithm up to obtaining a DL-formalised conceptual data model based on a fully normalised database can be found in, e.g., [LT09]. Most of the reverse engineering achievements up to conceptual models were obtained in the 1990s. 

Figure 7.2 may give the impression that it is easy to do, but it is not. Difficulties have to do with the formal apparatus of the representation languages<sup>1</sup> , and the static linking between the layers and the procedures—conveniently depicted with the three arrows—hide the real complexity of the algorithms. Reverse engineering is not simply running the forward algorithm backwards, but has a heuristics component to second-guess what the developers’ design decisions may have been along the stages toward implementation and may have a machine learning algorithm to find constraints among instances. Most solutions to date set aside data duplication, 

> 1For conceptual data modelling languages, among others, the Object Management Group’s Ontology definition metamodel ( `http://www.omg.org/spec/ODM/1.0/` ) is exploring interactions between UML and OWL & RDF, and there are various results on mapping ER, EER, UML, ORM and/or ORM2 into a suitable or convenient DL language. This ‘application of Ontology and ontologies’ areas are deemed outside the book’s current scope. 

_7.1. Relational databases and related ‘legacy’ KR_ 

143 

violations of integrity constraints, hacks, outdated imports from other databases and assume to have a well-designed relational database in at least 3NF or BCNF, and, thus, the results are imperfect. 

In addition to this procedure, one has to analyse the data stored in the database on its exact meaning. In particular, one may come across data in the database that are actually assumed to be concepts/universals/classes, whereas others represent real instances (typically, a tuple represents an instance). For instance, a Content Management System, such as Joomla, requires the content provider to store a document under a certain category that is considered a class by its user, which, however, is stored in a cell of a row in the back-end database, hence, mathematically an instance in the software. Somehow, we need to find that and extract it for use in the ontology in a way that they will become classes. Another typical case is where a structured controlled vocabulary, such as the Gene Ontology we have seen in Section 1.3, has been used in the database for annotation. This is depicted on the right-hand side with `Env:444` and so on. Knowing this, one can reverse engineer that section of the database into a taxonomy in the conceptual data model (shown in Figure 7.2 in the top figure on the right-hand side). Finally, there is a so-called ‘impedance mismatch’ between database _values_ and ABox _objects_ , but this is relevant mainly for ontology-based data access (see Chapter 8). Thus, we end up having to process the case that some, or all, data where the values are actually concepts, should become OWL classes and values that should become OWL individuals. 

##### **Enhancing and converting the conceptual model** 

Having completed all the reverse engineering and data analysis to obtain the conceptual data model, one can commence with the ontological analysis. For instance, whilst improving the conceptual data model, one could add a section of another ontology for use or interoperability, alike the GO, improve on the naming and meaning of the relationships as perhaps some of them have the same meaning as those in a foundational ontology, add constraints (notably: disjointness), and so forth. Subsequently, it will have to be converted to a suitable logic. 

There are several tools that convert a conceptual model, especially UML Class Diagrams, into OWL, but they have only partial coverage and its algorithms are unclear; for instance, on how one should transform ternaries and what to do with the attributes (recall Section 6.1.1). In addition, they work only with a subset of UML diagrams due to the differences in UML tool implementations (which is due to ambiguity emanating from the OMG standard and differences across versions); hence, a careful post-transformation analysis will have to be carried out. 

One also could switch these steps by first converting a schema to OWL and then perform the ontological analysis. 

##### **Other languages and OWL** 

Imperfect transformations from other languages, such as the common OBO format [GH07, HOD<sup>+</sup> 10] and a pure frames-based approach [ZBG06], are available, which 

_Chapter 7. Bottom-up Ontology Development_ 

144 

also describe the challenges to create them. 

OBO is a Directed Acyclic Graph mainly for classes and a few relationships (mainly is a and part of), which relatively easily can be mapped into OWL, and the extras (a.o., date, saved by, remark) could go in OWL’s annotations. There are a few mismatches and ‘work-arounds’, such as the not-necessary and inverse-necessary, and a non-mappable antisymmetry (cannot be represented in OWL). As a result, there are several OBO-in-OWL mappings, of which some are more comprehensive than others. The latest/official mapping available from `http://oboformat.org` (superseding the earlier mapping by [GH07]), which is also implemented in the OWL API. Most OBO ontologies now also have an OWL version (consult OBO Foundry, BioPortal), but keep both, for each has their advantages (at present). There is one salient difference between OWL and OBO ontologies—more precisely: the approach to modelling—which also affects multilingual ontologies (Section 9.1), and how an OBO ontology in Prot´eg´e is displayed. In OWL, you typically give a class a human readable _name_ , whereas in OBO, a class is assigned an _identifier_ and the name is associated to that with a label (OBO people who moved to OWL maintain that practice, so numbers as class names do not imply it was natively an OBO ontology). Newer versions of ontology editors let the user choose how to render the ontology in the interface, by name or by label. If you find an ontology online and the class names are something alike `IAO12345` , then it was likely an OBO ontology converted into OWL, and you’ll have to change the view so that it will show the labels instead of those meaningless numbers. 

While OBO and the older frames-based Prot´eg´e do serve a user base, their overall impact on widespread bottom-up ontology development for the Semantic Web is likely to be less than the potential that might possibly be unlocked with leveraging knowledge of existing (relational) databases to start developing ontologies. 

### **7.2 From spreadsheets to OWL** 

Spreadsheets are normally intended to store data. There are two ways to leverage the structure of spreadsheet content in the process of developing an ontology. The first option is based on the ‘standard’ way of using a spreadsheet. Normally, the first row contains column headings that are essentially the ‘attributes’ or classes of something, and the rest of the columns or rows are the data. This can be likewise for the rows in the first column. This gives two opportunities for bottom-up development: extract those column/row headings and take that vocabulary to insert in the TBox. For instance, a row 1 that contains in columns A-D _⟨_ `FlowerType` _,_ `Colour` _,_ `Height` _,_ `FloweringSeason` _⟩_ gives a clear indication of what one could put in the ontology. It is a bit less structured than databases and their corresponding conceptual models, and there are no reverse engineering algorithms to discover the constraints, so still an analysis has to be carried out as to how one represents, say, Colour in the ontology. Subsequently, and having recorded how the column headings have been represented in the ontology, one could load the data into the ABox accordingly, if desired. 

The second option of using a spreadsheet is that it can be seen as an easier 

_7.3. Thesauri_ 

145 

interface to declare knowledge compared to adding axioms in an ODE such as Prot´eg´e, especially for domain experts. The idea works as follows. We have seen several axioms that adhere to a particular pattern, such as C _⊑_ D and C _⊑∃_ R _._ D, where the former could be called, say, “named class subsumption” and the latter “all-some”. This can be converted into ‘logical macros’, i.e., a non-logician-friendly interface where _only_ the vocabulary is entered into specific fields, and some script behind the scenes does the rest to insert it in the ontology. This is illustrated in the following example. 

**Example 7.1.** _Consider Figure 7.3. On the left-hand side is a small spreadsheet, with in column A some data that one would want to have converted into classes in the TBox and to be asserted to be subclasses of those values-to-be-turned-intoclasses in column B. That is, it is a table representation of the axiom type_ C _⊑_ D _. The script to do that may be, say, a JSON script to process the spreadsheet that, in turn, uses the OWL API to write into the OWL file. Such a script is shown on the right-hand side of the figure. Upon running it, it will add_ Lion _⊑_ Animal _etc. to the ontology, if not already present._ 

_The principle is similar for the data in columns D and E, but then for the “allsome” axiom type_ C _⊑∃_ R _._ D _. The values in column D will be the class that will have a property declared and in column E what the class in column D is doing (eating, in this case). Looking at it differently: the table consisting of columns D and E amounts to the_ eats _relation and is intended to be converted into the two axioms_ Lion _⊑∃_ eats _._ Impala _and_ Giraffe _⊑∃_ eats _._ Twig _. ♦_ 

One such tool with which one can do this is cellfie<sup>2</sup> that uses the M<sup>2</sup> DSL for the transformation [OHWM10]. It still requires one to declare what the axiom pattern should be in the `rule` line, which could be seen as disadvantage but also as having the advantage to be more flexible. For instance, a table could have three columns, so that a domain expert can add arbitrary object properties in a row, like in row 2 _⟨_ `lion` _,_ `eats` _,_ `impala` _⟩_ and in row 3 _⟨_ `lion` _,_ `drinks` _,_ `water` _⟩_ and then declare in the rule that the second column has to become an object property in the ontology. 

If there are many axioms to add, such an approach likely also will be faster when knowledge has to be added in batch compared to clicking around in the ODE. 

### **7.3 Thesauri** 

A thesaurus is a simple concept hierarchy where the concepts are related through three core relations: **BT** broader term, **NT** narrower term, and **RT** related term (and auxiliary ones UF/USE, use for/use). For instance, a small section of the Educational Resources Information Center thesaurus looks like this: 

```
readingability
BTability
RTreading
RTperception
```

> 2 `https://github.com/protegeproject/cellfie-plugin` 



<!-- Start of picture text -->
e600  cellfieEx.xlsx JSON RawData Headers<br>| EA GY eb (Q Search in Sheet ® Save Copy<br>G6 : [x] iv} C Sx * vO:<br>eS RS A > =  - EI sheetName: "Sheet1"<br>| 1 lion animal lion impala nan<br>| 2 |giraffe animal giraffe twig startColumn:<br>| 3 |impala animal endColumn: A<br>| 4= | startRow: "1"<br>a<br>Lis <> +i Jl Sheets jm i endRow: mae<br>=ormal View Ready Al comment: uu<br>rule: "Class: @Ax\n SubClassOf: @Bx"<br>active: true<br><!-- End of picture text -->

_7.3. Thesauri_ 

147 

out and describing concepts in the name of the concept, rather than adding characterising properties; 

- Thesauri have low ontological precision with respect to the categories and the relations: there are typically no formal details defined for the concept names, and BT/NT/RT are the _only_ relations allowed in the concept hierarchy. 

As thesauri were already in widespread use before ontologies came into the picture for ontology-driven information systems, they lack basic categories alike those in DOLCE and BFO. Hence, an alignment activity to such foundational ontology categories will be necessary. Harder to figure out, however, are the relations. RT can be _anything_ , from parthood to transformation, to participation, or anything else, and BT/NT turns out not to be the same as class subsumption; hence, the relations are overloaded with (ambiguous) subject domain semantics. This has as result that those relationships are used inconsistently—or at least not precise enough for an ontology. For instance, in the aforementioned example, `milk` and `milk fat` relate in a different way to each other than `milk` and `cow milk` , for `milk fat` is a component of milk and `cow milk` indicates its origin (and, arguably, it is part of the cow), yet both were `NT` -ed to `milk` . 

##### **A sample solution: rules as you go** 

Because of the relatively low precision of a thesaurus, it will take a bit more work to convert it into an ontology cf. a database. Basically, the ontological analysis that hasn’t been done when developing the thesaurus—in favour of low-hanging fruit for system development—will have to be done now. For instance, a nebulous term like “Communication (Thought Transfer)” in the ERIC thesaurus will have to be clarified and distinguished from other types of communication like in computer networks. They then could be aligned to a foundational ontology or a top-domain ontology after some additional analysis of the concepts in the hierarchy and aided by a decision diagram like D3. One also should settle on the relations that will replace BT/NT/RT. An approach to this particular aspect of refinement is presented in [KJLW12]. 

This is a lot of manual work, and there may be some ways to automate some aspects of the whole process. Soergel and co-authors [SLL<sup>+</sup> 04] took a ‘rules as you go’ approach that can be applied after the aforementioned ontological analysis. This means that as soon as some repetitiveness was encountered in the manual activity, a rule was devised, the rest of the thesaurus assessed on the occurrence of the pattern, and converted in one go. A few examples are included below. 

**Example 7.2.** _For instance, Soergel and co-authors observed that, e.g.,_ `cow NT cow milk` _should become_ cow _<_ hasComponent _>_ cow milk _. There are more animals with milk; hence, a pattern could be_ animal _<_ hasComponent _>_ milk _, or, more generally_ animal _<_ hasComponent _>_ body part _. With that rule, one can find automatically, e.g.,_ `goat NT goat milk` _and convert that automatically into_ goat _<_ hasComponent _>_ goat milk _. Other pattern examples were, e.g.,_ plant _<_ growsIn _>_ soil type _and_ geographical entity _<_ spatiallyIncludedIn _>_ geographical entity. _♦_ 

_Chapter 7. Bottom-up Ontology Development_ 

148 

#### **7.3.2 Avoiding ontologies with SKOS** 

Thesauri tend to be very large, and it may well be too much effort to convert them into a real ontology, yet one still would want to have some interoperation of thesauri with other systems so as to avail of the large amounts of information they contain. To this end, the W3C developed a standard called _Simple Knowledge Organisation System(s): SKOS_<sup>4</sup> [MB09]. More broadly, it is intended for converting thesauri, classification schemes, taxonomies, subject headings etc. into one interoperable syntax, thereby enabling concept-based search instead of text-based search, reuse of each other’s concept definitions, facilitate the ability to search across institution boundaries, and to use standard software. This is a step forward compared to the isolated thesauri. 

However, there are also some limitations to it: ‘unusual’ concept schemes do not fit into SKOS because sometimes the original structure too complex, `skos:Concept` is without clear properties like in OWL, there is still much subject domain semantics in the natural language text which makes it less amenable to advanced computer processing, and the SKOS ‘semantic relations’ have little semantics, as `skos:narrower` does not guarantee it is is a or part of, as it just is the standardised version of NT. 

Then there is a peculiarity in the encoding. Let us take the example where Enzyme is a subtype of Protein, hence, we declare: 

```
SKOSPaths:proteinrdf:typeskos:Concept
```

```
SKOSPaths:enzymerdf:typeskos:Concept
```

```
SKOSPaths:enzymeSKOSPaths:broaderGenericSKOSPaths:protein
```

in the `SKOSPaths` SKOS file, which are, mathematically, statements about instances. This holds true also if we were to transform an OWL file to SKOS: each OWL class becomes a SKOS instance due to the mapping of `skos:Concept` to `owl:Class` [IS09]. This is a design decision of SKOS. From a purely technical point of view, that can be dealt with easily, but one has to be aware of it when developing applications. 

As the scope of this book is ontology engineering, SKOS will not be elaborated on further. 

### **7.4 Text processing to extract content for ontologies** 

If all else fails, and there happens to be a good amount of text available in the subject domain of the (prospective) ontology, one can try Natural Language Processing (NLP) to develop the ontology<sup>5</sup> . Which approaches and tools suit best depends on the goal (and background) of its developers and prospective users, ontological commitment, and available resources. 

> 4 `http://www.w3.org/TR/swbp-skos-core-spec` 

> 5of course, once the ontology is there, it can be used as a component in an ontology-driven information system, and an NLP application can be enhanced with an ontology, but that is a separate theme. 

_7.4. Text processing to extract content for ontologies_ 

149 

There are two principal possibilities to use NLP for ontology development: 

- Use NLP to populate the TBox of the ontology, i.e., obtaining candidate terms from the text, which is also called _ontology learning_ (from text). 

- Use NLP to populate the ABox of the ontology, i.e., obtaining named entities, which is also called _ontology population_ (from text). 

A review of NLP and (bio-)ontologies can be found in [LHC11] and some examples in [CSG<sup>+</sup> 10, AWP<sup>+</sup> 08]. 

But why the “if all else fails...” at the start of the section? The reason is that information in text is _unstructured_ and natural language is _inherently ambiguous_ . The first step researchers attempted was to find candidate terms for OWL classes. This requires a Part-of-Speech (POS) tagger so as to annotate each word in the text with its category; e.g., ‘apple’ is a noun and so forth. Then one selects the nouns only and counts how often it occurs, taking into account synonyms so as to group those together and assesses which ones are homonyms and used in different ways and therefore have to be split into different buckets. This process may be assisted by, e.g., WordNet<sup>6</sup> . Challenges arise with euphemisms, slang, and colloquialisms, as well as with datedness of texts as terms may have undergone concept drift (i.e., mean something else now) and new ones have been invented. The eventual resulting candidate list is then assessed by humans on relevance, and subsequently a selection will be added to the ontology. 

The process for candidate relations is a bit more challenging. Although one easily can find the verbs with a POS tagger, it is not always easy to determine the scope of what denotes the subject and what denotes the object in the sentence, and authors are ‘sloppy’ or at least imprecise. For instance, one could say (each) ‘human has a heart’, where ‘has’ actually refers to structural parthood, ‘human has a house’ where ‘has’ probably means ownership, and ‘human has a job’ which again has a different meaning. The taxonomy of part-whole relations we have seen in Section 6.2 has been used to assist with this process (e.g., [THU<sup>+</sup> 16]). Consider that DOLCE and WordNet are linked and thus for a noun in the text that is also in WordNet, then one can find the DOLCE category. Knowing the DOLCE category, one can check which part-whole relation fits with that thanks to the formal definitions of the relations. For instance, ‘human’ and ‘heart’ are both physical endurants, which are endurants, which are particulars. One then can use OntoPartS’s algorithm: return only those relations where the domain and range are either of those three, but not any others. In this case, it can be (proper) _structural parthood_ or the more generic plain (proper) _parthood_ , but not, say _involvement_ because ‘human’ and ‘heart’ are not perdurants. A further strategy that could be used is, e.g., VerbNet<sup>7</sup> that uses compatible roles of the relations that the nouns play in the relation. 

Intuitively, one may be led to think that simply taking the generic NLP tools will do also for specialised domains, such as (bio-)medicine. Any application does indeed use those techniques and tools, but, generally, they do not suffice to obtain 

> 6 `https://wordnet.princeton.edu/` 

> 7 `https://verbs.colorado.edu/verbnet/` 

_Chapter 7. Bottom-up Ontology Development_ 

150 

‘acceptable’ results. Domain specific peculiarities are many and wide-ranging. For instance, 1) to deal with the variations of terms (e.g., scientific name, variants, abbreviations, and common misspellings) and the grounding step (linking a term to an entity in a biological database) in the ontology-NLP preparation and instance classification [WKB07]; 2) to characterise the question in a question answering system correctly (e.g., [VF09]); and 3) to find ways to deal with the rather long strings and noun phrases that denote a biological entity or concept or universal [AWP<sup>+</sup> 08]. Taking into account such peculiarities does generate better overall results than generic or other domain-specific usages of NLP tools, but it requires extra manual preparatory work and a basic understanding of the subject domain and its applications to include also such rules. For instance, enzyme names always end with ‘-ase’, so one can devise a rule with a regular expression to detect these terms ending in ‘-ase’ and add them in the taxonomy as a subclass of Enzyme. 

Ontology population in the sense of actually adding a lot of objects in the ABox of the OWL file is not exciting, for it is not good in scalability of reasoning, partially due to the complexity of OWL 2 and partially because the default setting of the ODEs is that it will load the whole OWL file into main memory and by default settings at least, the ODE will run out of memory. There are alternatives to that, such as putting the instances in a database or annotating the instances named in the text with the terms of the ontology and store those texts in a digital library, which then can be queried. The process to realise it requires, among others, a named entity tagger so that is can tag, say, the ‘Kruger park’ as a named entity. It then has to find a way to figure out that that is an instance of Nature Reserve. For geographic entities, a gazetteer can be used. As for nouns, also named entities can have different strings yet refer to the same entity; e.g., the strings ‘Luis Fonsi’ and ‘L. Fonsi’ refer to the same singer-songwriter of the smash-hit Despacito. It has further issues, such as referring expressions in the same as well as successive sentences; e.g., in the sentence “he wrote the song during a sizzling Sunday sunset”, “he” refers to Fonsi and “the song” to Despacito, which has to be understood and represented formally as a triple, say, _⟨_ `Fonsi` _,_ `songwriter` _,_ `Despacito` _⟩_ and linked to the classes in the ontology. 

NLP for ontology learning and population is its own subfield in ontology learning. The brief summary and illustration of some aspects of it does not cover the whole range, but may at least have given some idea of non-triviality of the task. If you are interested in this topic: a more comprehensive overview is described in [CMSV09] and there are several handbooks. 

### **7.5 Other semi-automated approaches** 

Other (semi-)automated approaches to bottom-up ontology development include machine learning techniques, deploying so-called ‘non-standard’ DL reasoning services, and converting diagrams fro biology into (candidate) ontology terms and relations. 

A short overview and relevant references of machine learning techniques for ontology development can be found in [dFE10], who also outline where such _induc-_ 

_7.5. Other semi-automated approaches_ 

151 

_tive methods_ can be used, being: classifying instances, learning new relationships among individuals, probabilistic ontologies, and probabilistic mapping for the ontology matching task, (semi)-automating the ontology population task, refining ontologies, and reasoning on inconsistent or noisy knowledge bases. Several ‘hybrids’ exists, such as the linking of Bayesian networks with probabilistic ontologies [dCL06] and improving data mining with an ontology [ZYS<sup>+</sup> 05]. 

Other options are to resort to a hybrid of Formal Concept Analysis with OWL [BGSS07], least common subsumer [BST07, Tur08, PT11], and similar techniques. The notion of least common subsumer and most specific concept and motivations where and how it may be useful are described in [PT11]. The least common subsumer and most specific concept use non-standard reasoning services that help with ontology development, and they are defined in terms of DL knowledge bases as follows. 

**Definition 7.1** (least common subsumer ([PT11])) **.** _Let L be a Description Logic language, K_ = ( _T , A_ ) _be a knowledge base represented in DL L (an L-KB). The_ least common subsumer _(lcs) with respect to T of a collection of concepts C_ 1 _, . . . , Cn is the L-concept description C such that:_ 

_1. Ci ⊑T C for all_ 1 _≤ i ≤ n, and_ 

_2. for each L-concept description D holds: if Ci ⊑T D for all_ 1 _≤ i ≤ n, then C ⊑T D._ 

**Definition 7.2** (most specific concept ([PT11])) **.** _Let L be a Description Logic language, K_ = ( _T , A_ ) _be a knowledge base represented in DL L (an L-KB). The_ most specific concept _(msc) with respect to K of an individual from A is the L- concept description C such that:_ 

_1. K |_ = _C_ ( _a_ ) _, and_ 

_2. for each L-concept description D holds: K |_ = _D_ ( _a_ ) _implies C ⊑T D._ 

The least common subsumer computes the common superclass of a concept and the most specific concept classifies an individual into a concept description. 

One could exploit biological models to find candidate terms and relations when those models have been created with software. This allows for semi-automated approaches to formalise the graphical vocabulary in textbooks and drawing tools, and subsequently use an algorithm to populate the TBox with the knowledge taken from the drawings. This because such software has typical icons for categories of things, like a red oval meaning Protein, a yellow rectangle meaning Cell Process, and a pale green arrow with a grey hexagon in the middle meaning Protein Modification. Each individual diagram can thus be analysed, and the named shapes at least categorised as subclasses of such main classes and relations asserted for the arrows between the shapes. This has been attempted for STELLA and PathwayStudio models [Kee05, Kee12b]. Related are the efforts with converting models represented in the Systems Biology Markup Language (SMBL) into OWL [HDG<sup>+</sup> 11]. 

_Chapter 7. Bottom-up Ontology Development_ 

152 

### **7.6 Ontology Design Patterns** 

Ontology Design Patterns (ODPs) are a middle out way for developing ontologies. They can be viewed as an extremely lightweight version of design principles alike found in foundational ontologies, but then with less ‘clutter’. That is, they can be cleverly modularised foundational ontology fragments that serve as design snippets for good modelling practices. They also can be viewed as a way of bottom-up pattern finding that is then reused across the ontology and offered to others as a ‘best practices’ design solution for some modelling aspect. ODPs have been proposed first a while ago [BS05, Gan05], and have gained some traction in research in recent years with various ideas and proposals. There is, therefore, no clear single, neat, core to extract from it and describe at present. A clear, informal overview is described in [GP09], but terms, descriptions, and categorisations are being reworked [FGGP13], and the sub-field better characterised with respect to the issues for using ODPs and possible research directions [BHJ<sup>+</sup> 15]. 

Let us first introduce some definitions for a pattern for a specific ontology and their uses and then proceed to types of patterns. The definitions are geared to the OWL language, but one can substitute that for another language of choice. 

**Definition 7.3** (Language of pattern instantiation [FK17]) **.** _OWL Ontology O with language specification adhering to the W3C standard [MPSP09], which has classes C ∈ VC, object properties OP ∈ VOP , data properties D ∈ VD, data types DT ∈ VDT of the permitted XML schema types, axiom components (‘language features’) X ∈ VX, and such that Ax ∈ VAx are the axioms._ 

The ‘axiom components’ include features such as, among others, subsumption, transitivity, existential quantification, and cardinality, which can be used according to the syntax of the language. A pattern itself is a _meta-level_ specification, in a similar fashion as stereotyping in UML. Just in case a pattern also includes ‘reserved’ entities from, say, a foundational ontology, they get their own entry in the vocabulary to clearly distinguish them. 

**Definition 7.4** (Language for patterns: Vocabulary _V_ [FK17]) **.** _The meta-level (second order) elements (or_ stereotypes _) for patterns are:_ 

- _class C ∈ VC as C in the pattern;_ 

- _object property OP ∈ VOP as R in the pattern;_ 

- _data property D ∈ VD as D in the pattern;_ 

- _data type DT ∈ VDT as DT in the pattern;_ 

_• reserved set of entities from a foundational ontology, as F in the pattern; where added subscripts i with_ 1 _≤ i ≤ n may be different elements. Two elements in the vocabulary are called_ homogeneous _iff they belong to the same type, i.e., they are both classes, or both object properties, and so on. Elements can be used in axioms Ax ∈ VAx that consists of axiom components x ∈ VX in the pattern such that the type of axioms are those supported in the ontology language in which the instance of the pattern is represented._ 

With these ingredients in place, one can then define an ontology pattern _P_ as follows. 

_7.6. Ontology Design Patterns_ 

153 

**Definition 7.5** (Ontology Pattern _P_ [FK17]) **.** _An_ ontology pattern _P consists of more than one element from vocabulary V which relate through at least one axiom component from VX. Its specification contains the:_ 

- _pattern name;_ 

- _pattern elements from V;_ 

- _pattern axiom component(s) from VX;_ 

- _pattern’s full formalisation._ 

For instance, the _basic all-some_ pattern that we have seen as ‘macro’ in Section 7.2 has as specification ([FK17]): 

- _pattern name_ : _basic all-some_ 

- _pattern elements_ : _C_ 1, _C_ 2, _R_ 

- _pattern axiom component(s)_ : _⊑_ , _∃_ 

- _pattern’s full formalisation_ : _C_ 1 _⊑∃R.C_ 2 

An instantiation of the _basic all-some_ pattern in an ontology, say, the AWO, may be, e.g., Giraffe _⊑∃_ drinks _._ Water. 

— As can be seen from the definition, they are referred to agnostically as _patterns_ it may be a pattern realised in the ontology and some algorithm has to search for (as was the scope in [FK17]) as well as one defined separately and applied during the design phase and is therewith thus also in line with some newly proposed terminology [FGGP13]. Ontology patterns tend to be more elaborate than the _basic all-some_ pattern. For instance, one could specify a pattern for how to represent attributions with DOLCE’s Quality rather than an OWL data property, as was discussed in Section 6.1.1, or how to systematically approximate representing an _n_ -ary into _n_ binaries in OWL. Furthermore, there are broader options for ontology patterns. A selection of them with a few examples is as follows. 

- Architecture pattern. This specifies how the ontology is organised. For instance, one could choose to have a modular architecture in the sense of sub-domains. An example of a fairly elaborate architecture is illustrated in Figure 7.4 for BioTop [BSSH08]. 

- Logical pattern. This deals with the absence of some features of a representation language and how to work with that. The issue with _n_ -aries in OWL is such an example. 

- Content pattern. This pattern assists with representing similar knowledge in the same way for that particular ontology. Recalling the rules-as-you-go from thesauri bottom-up development, they can be specified as content patterns. A larger example is shown in Figure 7.5. 

- ‘Housekeeping’ patterns, including so-called lexico-syntactic patterns. They refer to ensuring clean and consistent representations in the ontology. For instance, to write names in CamelCase or with dashes, and using IDs with labels throughout versus naming the classes throughout the ontology. 

There are also practical engineering tasks in the process of using ODPs, such as a workflow for using ODPs and the usual requirements of documentation and metadata; recent first proposals include [FBR<sup>+</sup> 16, KHH16]. 



<!-- Start of picture text -->
eM ee MechanismBridging<br>ee<br>Onto1 Top-Level<br>Onto2® ® Ontology<br>Bridge@ @<br>BFO-ROBre<br>: Top-Domain<br>egy Ontology<br>Bs<br>Domain<br>Ontology<br>CL<br><!-- End of picture text -->



<!-- Start of picture text -->
ShasInput.Input C Material Transformation<br>ShasOutput.Output C MaterialTransformation<br>SoccursInNeighborhood.Neighborhood CE MaterialTransformation<br>SoccursDuring.time : Interval C MaterialTransformation<br>Material Transformation C VhasInput.Input<br>Material Transformation C VhasOutput.Output<br>Material Transformation EC VoccurslnNeighborhood.Neighborhood<br>Material Transformation C VoccursDuring.time:Interval<br>Material Transformation C SoccurslnNeighborhood.Neighborhood<br>Material Transformation EC SoccursDuring.time:|nterval<br>Material Transformation EC ShasInput.|Input<br>Material Transformation C ShasOutput.Output<br>Input LI Output C MaterialObject<br>Catalyst E Input M Output<br>MaterialTransformation C 3(hasInput N N shasOutput).TT<br>MaterialTransformation C 3(hasOutput M —haslInput).TT<br><!-- End of picture text -->

ShasInput.Input C Material Transformation ShasOutput.Output C MaterialTransformation SoccursInNeighborhood.Neighborhood CE MaterialTransformation SoccursDuring.time : Interval C MaterialTransformation Material Transformation C VhasInput.Input Material Transformation C VhasOutput.Output Material Transformation EC VoccurslnNeighborhood.Neighborhood Material Transformation C VoccursDuring.time:Interval Material Transformation C SoccurslnNeighborhood.Neighborhood Material Transformation EC SoccursDuring.time:|nterval Material Transformation EC ShasInput.|Input Material Transformation C ShasOutput.Output Input LI Output C MaterialObject Catalyst E Input M Output MaterialTransformation C 3(hasInput N N shasOutput).TT MaterialTransformation C 3(hasOutput M —haslInput).TT 



<!-- Start of picture text -->
O SQ OES<br>O<br><!-- End of picture text -->



<!-- Start of picture text -->
Employee<br>O Oo<br>RichEmployee PoorEmployee<br>Salary String8 Salary String8<br>Salary String5 Salary Stringé<br><!-- End of picture text -->



<!-- Start of picture text -->
Employee<br>(code)<br>\ ra ae / Vrs. H<br>e | &\®<br>RichEmployee PoorEmployee<br>(-------, | has<br>1 Salaryi | |<br>‘-------7 i<br><has<br>CT crt<br>has 1eiaieieiellSalary CT<has<br><!-- End of picture text -->

_7.7. Exercises_ 

157 

```
RTGlobalization
RTLiterature
RTMassMedia
RTMediaLiteracy
RTFilms
UFMassCulture(2004)
MassMedia
BTn/a
NTFilms
NTNewsMedia
NTRadio
RTAdvertising
RTPropaganda
RTPublications;
UFMultichannelPrograming(19661980)(2004)
```

```
Propaganda
BTCommunication(ThoughtTransfer)
BTInformationDissemination
NTn/a
RTAdvertising
RTDeception
RTMassMedia
UFn/a
```

**Exercise 7.4.** In what way(s) may data mining be useful in bottom-up ontology development? Your answer should include something about the following three aspects: 

- a. populating the TBox (learning classes and hierarchies, relationships, constraints), 

- b. populating the ABox (assertions about instances), and 

- c. possible substitutes or additions to the standard automated reasoning service (consistency checking, instance classification, etc.). 

**Exercise 7.5.** Define a pattern for how to represent attributions with DOLCE’s Quality rather than an OWL data property. 

**Exercise 7.6.** OWL permits only binary object properties, though n-aries can be approximated. Describe how they can be approximated, and how your OP would look like such that, when given to a fellow student, s/he can repeat the modelling of that n-ary exactly the way you did it and add other n-aries in the same way. * 

**Exercise 7.7.** Inspect the Novel Abilities and Disabilities OntoLogy for ENhancing Accessibility: adolena; Figure 7.9 provides a basic informal overview. Can (any of) this be engineered into an ODP? If so, which type(s), how, what information is needed to document an OP? * 

**Exercise 7.8.** Figure 7.5 shows a content OP. How would you _evaluate_ whether this is a good ODP? In doing so, describe your reasoning why it is, or is not, a good ODP. * 

_Chapter 7. Bottom-up Ontology Development_ 

158 



<!-- Start of picture text -->
ServiceProvider<br>providedBy /<br>provides<br>Device<br>hasFunction<br>Function<br><!-- End of picture text -->



<!-- Start of picture text -->
Disability<br><!-- End of picture text -->



<!-- Start of picture text -->
hasFunction<br>Function<br>Body<br>Assistive<br>Part<br>Device<br>replaces<br>Replacement  assistsWith /<br>Device isAssistedBy<br><!-- End of picture text -->



<!-- Start of picture text -->
affects<br>requiresAbility<br>Ability<br>Assistive<br>Device<br><!-- End of picture text -->



<!-- Start of picture text -->
Physical<br>Ability<br><!-- End of picture text -->

**Figure 7.9:** Informal view of the adolena ontology. 

**Exercise 7.9.** Discuss the feasibility of the following combinations of requirements for an ontology-driven information system (and make an informed guess about the unknowns): 

- a. Purpose: science; Language: OWL 2 DL, or an extension thereof; Reuse: foundational; Bottom-up: form textbook models; Reasoning services: standard and non-standard. 

- b. Purpose: querying data through an ontology; Language: some OWL 2; Reuse: reference; Bottom-up: physical database schemas and tagging; Reasoning services: ontological and querying. 

- c. Purpose: ontology-driven NLP; Language: OWL 2 EL; Reuse: unknown; Bottom up: a thesaurus and tagging experiments; Reasoning services: mainly just querying. 

You may wish to consult [Kee10a] for a table about dependencies, or argue upfront 

**Exercise 7.10.** You are an ontology consultant and have to advise the clients on ontology development for the following scenario. What would your advice be, assuming there are sufficient resources to realize it? Consider topics such as language, reasoning services, bottom-up, top-down, methods/methodologies. * 

A pharmaceutical company is in the process of developing a drug to treat blood infections. There are about 100 candidate-chemicals in stock, categorised according to the BigPharmaChemicalsThesaurus, and they need to find out whether it meets their specification of the ‘ideal’ drug, codename DruTopiate, that has the required features to treat that disease (they already know that DruTopiate must have as part a benzene ring, must be water-soluble, smaller than 1 _µ_ m, etc). Instead of finding out by trial-and-error and test all 100 chemicals in the lab in costly experiments, they want to filter out candidate chemicals by automatic classification according to those DruTopiate features, and then experiment only with the few that match the desired properties. This _in silico_ (on-the-computer) biomedical research is intended as a pilot study, and it is hoped that the successes obtained in related works, such as that of 

159 

- _7.8. Literature and reference material_ 

the protein phosphatases and ideal rubber molecules, can be achieved also in this case. 

### **7.8 Literature and reference material** 

A small selection of sample articles are the following ones, noting that there are, at the time of writing no ‘common reference papers’ on the topic: 

1. L. Lubyte, S. Tessaris. Automatic Extraction of Ontologies Wrapping Relational Data Sources. In _Proc. of the 20th International Conference on Database and Expert Systems Applications (DEXA 2009)_ . 

2. Witte, R. Kappler, T. And Baker, C.J.O. Ontology design for biomedical text mining. In: _Semantic Web: revolutionizing knowledge discovery in the life sciences_ , Baker, C.J.O., Cheung, H. (eds), Springer: New York, 2007, pp 281-313. 

3. Dagobert Soergel, Boris Lauser, Anita Liang, Frehiwot Fisseha, Johannes Keizer and Stephen Katz. Reengineering thesauri for new applications: the AGROVOC example. _Journal of Digital Information_ 4(4) (2004). 

4. SKOS Core<sup>8</sup> , SKOS Core guide<sup>9</sup> , and the SKOS Core Vocabulary Specification<sup>10</sup> . 

> 8 `http://www.w3.org/2004/02/skos/core` 

> 9 `http://www.w3.org/TR/swbp-skos-core-guide` 

> 10 `http://www.w3.org/TR/swbp-skos-core-spec` 

## **Part III** 

## **Advanced topics in ontology engineering** 

161 

163 

### **Introduction** 

There are a myriad of advanced topics in ontology engineering, of which most require an understanding of both the logic foundations and of the modelling and engineering, albeit that each subtopic may put more emphasis on one aspect than another. A textbook at an introductory level cannot possibly cover all the specialised subtopics. Those included in this Block III aim to give an impression of the many possible directions with very distinct flavours and interests. They could have been other topics as well, and it was not easy to make a selection. For instance, machine learning is currently popular, and it is being used in ontology engineering, yet has not been included. Likewise, ontology mapping and alignment have a set of theories, methods, and tools drawing from various disciplines and topics that is of interest (graph matching, similarity measures, language technologies). Perhaps readers are interested in learning more about the various applications of ontologies in ontology-driven information systems to be motivated more thanks to demonstrations of some more concrete benefits of ontologies in IT and computing. I do have reasons for including the ones that have been included, though. 

Ontology-Based Data Access could be seen as an application scenario of ontologies, yet it is also intricately linked with ontology engineering due to the representation limitations to achieve scalability, the sort of automated reasoning one does with it, handling the ABox, and querying ontologies, which can be done but hasn’t been mentioned at all so far. That is, it adds new theory, methods, and tools into an ontology engineer’s ‘knapsack’. It principally provides an answer to the question: 

- How can I have a very large ABox in my knowledge base and still have good performance? 

The second topic (in Chapter 9) is of an entirely different nature compared to OBDA and brings afore two ontology development issues that have so far been ignored as well: 

- What to do if one would want, say, the AWO not in English, or have it in several languages, like name the class Isilwane or Dier rather than Animal, and manage it all with several natural languages? 

- How can one interact with domain experts in natural language, so that they can provide knowledge and verify that what has been represented in the ontology is what they want to have in there, without them having to learn logic? 

That is, there is an interaction between ontologies and natural language, which oftentimes cannot be ignored. 

A different topic is the tension between the expressivity of the logic and what one would like to—or need to—represent. Indeed, we have come across the DOL framework (Section 4.3.2), but that does neither cover all possibilities (yet), nor does it make immediately clear how to represent advanced features. For instance, what if the knowledge is not ‘crisp’, i.e. either true or false, but may be true _to a_ 

164 

_degree_ ? Or if one has used machine learning and induced some _x_ , then that will be _probabilistically_ true and it may be nicer to represent that uncertainty aspect in the ontology as well. Also, one of the BFO 2.x versions squeezed notions of time in the labels of the object properties (recall Section 6.1.2), but OWL is not temporal, so, logically, those labels have no effect whatsoever. Language extensions to some fragment of OWL and to DLs have been proposed, as there are requests for features to represent such knowledge and reason over it. The main question this strand of research tries to answer is: 

- In what way(s) can ontology languages deal with, or be extended with, language features, such a time and vagueness, so that one also can use those extensions in automated reasoning (cf. workarounds with labels)? 

That is, this topic has a tight interaction between modelling something even more precisely—obtaining a better quality ontology—and not just availability of language features and tinkering with workarounds, but actually getting them. 

The final advanced topic looks at scaling up the TBox layer. So far, we have dealt with (very) small ontologies only, but the real ones used in information systems are typically much larger than that: they run into the thousands if not hundreds of thousands of classes, which have many more axioms declared in the ontology. This brings afore questions regarding how to work in the best way with large subject domains and large ontologies. Modularisation is a tried and tested approach, and the main questions that the chapter’s contents contributes to answering are: 

- What is the landscape of ontology modules, with their aims, types, and characteristics? 

- What are good modules? 

- How to take a good modular approach with large ontologies? 

Chapter 11 takes a foundations and systems-oriented approach rather than logicbased, as it was not possible to cover both in a short chapter and one first needs to know some foundations as to what is required before devising a logic and algorithms to support ontology modularisation. There is still a lot of work to be done on ontology modularisation, and this chapter may assist both beginners to find suggestions on how to approach modularisation and researchers to find ideas to investigate. 

As mentioned in the introduction of the book, one can read either chapter in any order, as they do not depend on each other. They are short chapters and could perhaps have been combined into one large chapter with several sections, but that did not look nice aesthetically. Also, it is easier for lectures to cover a whole chapter at once and cover one topic at a time (though noting that each topic easily can cover more than one lecture). 

### CHAPTER 8 

### Ontology-Based Data Access 

Blocks I and II were rather theoretical in the sense that we have not seen many practical application infrastructures with ontologies. This is set to change in this chapter. We shall look at both theoretical foundations of _ontology-based data access_ (OBDA) and one of its realisations, and you will set up an OBDA system yourself as an exercise. Also, this chapter will provide some technical details of the EPNet example of food in the Mediterranean [CLM<sup>+</sup> 16] that was briefly described in Section 1.3.2 as an example of ontologies for data integration in the humanities. 

From an education perspective, there are several ‘starting points’ for introducing OBDA, for it depends on one’s background how one looks at it. The short description is that it links an OWL file (the ‘ontology’ in the TBox) to lots of data in a relational database (the ‘Abox’) by means of a newly introduced mapping layer, which subsequently can be used for automated reasoner-enhanced ‘intelligent’ queries. The sneer quotes on ‘ontology’ have to do with the fact that, practically, the ‘ontology’ is a logic-based simple conceptual data model formalised in _±_ OWL 2 QL. The sneer quotes on ‘intelligent’ refer to the fact that with the knowledge represented in the ontology/conceptual data model and an OBDA-enabled reasoner, one can pose more advanced queries to the database in an easier way in some cases than with just a plain relational database and SQL (although at the same time, one cannot use all of SQL). 

In any case, in this chapter we divert from the “we don’t really care about expressivity and scalability” of Block II to a setting that is driven by the need for scalability of ontology-driven information systems. We start with some motivations why one should care (Section 8.1). There are many ways to address the issues of query formulation and management, and several design choices are available even within the OBDA approach alone; they are described in Section 8.2. Sections 8.3 and 8.4 describe one of the architectures and its principal components. 

165 

_Chapter 8. Ontology-Based Data Access_ 

166 

### **8.1 Introduction: Motivations** 

To motivate the need for some version of an OBDA system, we start with two perspectives: the (end-)user and the database administrator. 

#### **A database administrator’s perspective** 

Organisations normally have multiple databases to store and manage their data; e.g., a PeopleSoft applications for student, course, degree, and grade management at a university, a database with employee data, a course management system like Moodle or Sakai for the university’s course content management, and so on. Or take a city’s public administration that wants to develop integrated services delivery and the separate databases of the individual services have to be integrated from separate electricity, sewerage, water, refuse collection, and cadastre databases. Health information systems sometimes need to be kept separate for privacy reasons, yet at the same time, some cross-database queries have to be executed. Hence, the databases have to be connected in some way, and doing all that manually is a tedious, time-consuming task in any case. Moreover, as database administrator, you will have to know _how_ the data is stored in the database, write (very) large queries that can span pages, and there is no management for recurring queries. 

Instead of knowing the structure of the database(s) by heart to construct such large queries, one can reduce the cognitive (over-)load by focusing only on _what_ is in the database, without having to care about if, say, the class Student has a separate table or not, whether it uses the full name `student` or perhaps an abbreviation, like `stud` or `stdnt` , or whether the data about students is split into more than one table in more than one database. Provided the database was developed properly, there is a conceptual data model that has exactly the representation of what kind of data is stored in the database. Traditionally it is offline and shelved after the first implementation. However, this need not be the case, and OBDA can fill this gap. 

#### **The case from the viewpoint of the user** 

Did you ever not want to bother knowing how the data is stored in a database, but simply want to know what kind of things are stored in the database at, say, the conceptual layer? And did you ever not want to bother having to learn SQL in order to write queries in SQL (or, in the context of the Semantic Web, SPARQL), but have a graphical point-and-click interface with which you can compose a query using that ‘what layer’ of knowledge or some natural language interface such that the system will generate automatically the SQL query for you, in the correct syntax? (And all that not with a downloaded desktop application but in a Web browser?) Frustrated with rigid canned queries and pre-computed queries that limit your freedom to analyse the data? You don’t want to keep on bothering the sysadmin for application layer updates to meet your whims and be dependent on whether she has time for your repeated requests? 

Several domain experts in genetics, healthcare informatics, and oil processing, 

_8.2. OBDA design choices_ 

167 

at least, wanted that and felt constrained in what they could do with their data, including at least pondering about, if not full desperation with, the so-called “writeonly” databases. Especially in the biology and biomedical fields, there has been much ontology development as well as generation of much data, in parallel, which somehow has to be linked up again. 

The notions of _query by diagram_ or _conceptual queries_ might fill this gap. These ideas are not new [CS94, BH96, BH97, SGJR<sup>+</sup> 17], but now the technologies exist to realise it, even through a web interface and with reasoner-enabled querying. So, now one can do a sophisticated analysis of one’s data and unlock new information from the database by using the OBDA approach. In one experiment, this resulted in the users—scientists conducting _in silico_ experiments—coming up with new queries not thought of asking before [CKN<sup>+</sup> 10]. 

### **8.2 OBDA design choices** 

Regardless whether you needed the motivation, the commonality of both cases described in the previous section is that it tries to ‘cut out’ several processes that were hitherto done manually by automating them, which is one of the core aims of computing. In essence, the aim is to link the knowledge layer to the data layer that contains gigabytes or even terabytes of data, and in some way still obtain inferences. From a knowledge engineering viewpoint, this is “logic-based knowledge representation + lots of data” where the latter is relegated to secondary storage rather than kept in the OWL file. From a database perspective, this is seen as “databases + background knowledge” where the latter happens to have been represented an OWL file. The following example illustrates how the knowledge can make a 

##### **Example 8.1.** _Consider we have the following:_ `Professor(Mkhize)` _//explicit data_ 

`Professor(Mkhize)` _//explicit data represented and stored in a database_ Professor _⊑_ Employee _// knowledge represented in the ontology Then what is the answer to the query “list all employees”? In a database-only setting, it will tell you that there are no employees, i.e., return {}. In the ontologyonly setting, it wouldn’t know if there are none. With the ontology + database, it will infer_ Employee(Mkhize) _and return {_ `Mkhize` _} as answer, which is what one may have expected intuitively by reading the example. ♦_ 

The question then becomes: how to combine the two? Data complexity for OWL 2 DL is decidable but open, and for query complexity the decidability is open (recall Table 4.2.4). Put differently: this is bad news. There are two ways we can restrict things to get the eventual algorithms ‘well-behaved’ for scalability: 

1. Restrict the TBox somehow, i.e., decrease the expressivity of the language (at the cost of what one can model); within this option, there are two variants: 

   - v1: Incorporate the relevant parts of the TBox into the query and evaluate the query over a completed ABox; 

_Chapter 8. Ontology-Based Data Access_ 

168 

   - v2: Rewrite the query as needed, incorporate the TBox into the ABox, and then evaluate the query. 

2. Restrict the queries one can ask in such a way that they are only those whose answer do _not_ depend on the choice of model of the combination of the TBox + ABox. 

First of all, when we’re considering limiting the TBox, we end up with some minimalist language like OWL 2 QL or one of the DL-Lite flavours underpinning OWL 2 QL. Then, what do v1 and v2 mean for our example above? This is illustrated in the following example. 

**Example 8.2.** _Consider again the query “list all employees” with the following:_ `Professor(Mkhize)` _//explicit data represented and stored in a database_ Professor _⊑_ Employee _// knowledge represented in the ontology Option v1 will first notice_ Employee _’s subclass,_ Professor _. It will then rewrite the query so as to ask for all instances of both_ Employee _and_ Professor _. It then returns {_ `Mkhize` _} as answer._ 

_Option v2 first will notice_ `Professor(Mkhize)` _, and it sees_ Professor _’s superclass_ Employee _. It will extend the database with a new assertion,_ `Employee(Mkhize)` _. Then it will try to answer the original query. It now sees_ `Employee(Mkhize)` _and will return {_ `Mkhize` _} as answer. ♦_ 

Does this difference in process matter? Of course, it does. There are advantages and disadvantages, as shown in Table 8.1: having to re-compute the whole extended database can be time-consuming, as is using the knowledge of the TBox to rewrite the query. Option 1 v1 is used more often, and we’ll see the technicalities of it in the remainder of the chapter<sup>1</sup> . 

Option 2 tends to be more used in the database world for database’s physical design, data structures, query optimisation, and materialised views [TW11]. 

**Table 8.1:** Comparing v1 and v2 of the ‘restrict your ontology language’ option. 

||**v1 (query rewriting)**|**v2 (data completion)**|
|---|---|---|
|**Queries**|rewriting is exponential|data only grows polyno-|
||in _|Query|_|mially in _|ABox|_|
|**Updates**|applies to original data|needs<br>to<br>rematerialise|
|||the data completion|



### **8.3 An OBDA Architecture** 

Among the options described in the previous section, the architecture with its components that we will look at here are an example of Option 1 v1 [CGL<sup>+</sup> 07]. The intuitive idea for solving the sysadmin issues is depicted in Figure 8.1, tophalf (in blue): we add a “semantic layer” to a traditional database, or: we have a 

> 1More details about the options can be found in[CGL+07, KLT+10, LTW09] 



<!-- Start of picture text -->
' Semantic Layer , Data Layer<br>i<br>!!<br>I1<br>User DL-Lite Mappings<br>' Ontolo ' DB<br>I1<br>!!<br>! 1<br>Rewritten Unfolded<br>Client Oa: Enabled Query Sarol Qjuery RDBMS<br>Side ; easoner - nfolder -<br><!-- End of picture text -->

_Chapter 8. Ontology-Based Data Access_ 

170 

### **8.4 Principal components** 

The theoretical details are quite involved, and relevant papers span hundreds of pages. In essence, there are two principal aspects to it: 

1. Ontology-Based Data Access systems (static components): 

   - An ontology language, for representing the ontology 

   - A mapping language, for declaring the mappings between vocabulary in the ontology and the data 

   - The data 

2. Query answering in Ontology-Based Data Access systems: 

   - Reasoning over the TBox 

   - Query rewriting 

   - Query unfolding 

   - Relational database technology 

The mapping language and the items under 2 are new notions compared Blocks I and II and a regular database course, which will be described in the following subsections. 

##### **The ontology language** 

For the language, we remain, roughly, within the Semantic Web setting, and take a closer look at the OWL 2 QL profile and similar languages in the “DL-lite” family that is at the basis of OWL 2 QL, and _DL_ - _LiteA_ in particular [CGL<sup>+</sup> 07]. Most significantly, the trade-off between expressive power and computational complexity of the reasoning services leans strongly towards the scalability of reasoning (including query answering) over large amounts of data; or: one can’t say a lot with either OWL 2 QL or _DL_ - _LiteA_ . 

**Syntax of** _DL_ **-** _LiteA_ **.** As is common in DLs and OWL, we distinguish between (abstract) objects and (data) values. A _class expression_ denotes a set of objects, a _datatype_ denotes a set of values, an _object property_ denotes a binary relationship between objects, and a _data property_ denotes a binary relation between objects and values. We assume to have a set _{T_ 1 _, . . . , Tn}_ of pairwise disjoint and unbounded datatypes, each denoting a set _val_ ( _Ti_ ) of values (integers, strings, etc.), and _⊤d_ denotes the set of all values. Class expressions, _C_ , and object property expressions, _R_ , are formed according to the following syntax, where _A_ denotes a class, _P_ an object property, and _U_ a data property: 



Observe that _∃R_ denotes an unqualified existential class expression, _δ_ ( _U_ ) denotes the domain of _U_ , and _P_<sup>_−_</sup> denotes the inverse of _P_ . 

_8.4. Principal components_ 

171 

A _DL_ - _LiteA_ ontology _O_ = _⟨T , A⟩_ , consists of a TBox _T_ and an ABox _A_ , where the TBox is constituted by a set of _axioms_ of the form 



The axioms in the first row denote _inclusions_ , with _ρ_ ( _U_ ) the range of _U_ . The axioms in the second row denote _disjointness_ ; note that distinct datatypes are assumed to be disjoint. The axioms in the third row denote _functionality_ (at most one) of an object property expression and of a data property expression, respectively. The ABox is constituted by a set of _assertions_ of the form _A_ ( _a_ ), _P_ ( _a, a_<sup>_′_</sup> ), and _U_ ( _a, ℓ_ ), where _a_ , _a_<sup>_′_</sup> are individuals denoting objects and _ℓ_ is a literal (denoting a value). To ensure that _DL_ - _LiteA_ maintains the computationally wellbehaved computational properties of the _DL_ - _Lite_ family [CGL<sup>+</sup> 07], the form of the TBox has to be restricted (as we have seen for OWL 2 QL in Chapter 3). In particular, object and data properties occurring in functionality assertions cannot be specialized, i.e., the cannot appear in the right hand side of an inclusion axiom. 

**Semantics of** _DL_ **-** _LiteA_ **.** The semantics of _DL_ - _LiteA_ is based on first-order _interpretations I_ = (∆<sup>_I_</sup> _, ·_<sup>_I_</sup> ), where ∆<sup>_I_</sup> is a nonempty interpretation domain, which is partitioned into a ∆<sup>_I_</sup> _O_<sup>of objects, and a ∆</sup><sup>_I_</sup> _V_<sup>of values.The interpretation function</sup> _·_<sup>_I_</sup> maps each individual _a_ to _a_<sup>_I_</sup> _∈_ ∆<sup>_I_</sup> _O_<sup>,eachclass</sup><sup>_A_to</sup><sup>_AI⊆_∆</sup><sup>_I_</sup> _O_<sup>,eachobject</sup> property _P_ to _P_<sup>_I_</sup> _⊆_ ∆<sup>_I_</sup> _O_<sup>_×_∆</sup><sup>_I_</sup> _O_<sup>,andeachdataproperty</sup><sup>_U_to</sup><sup>_U I⊆_∆</sup><sup>_I_</sup> _O_<sup>_×_∆</sup><sup>_I_</sup> _V_<sup>,</sup> whereas each literal _ℓ_ is interpreted as the value _ℓ_<sup>_I_</sup> = _val_ ( _ℓ_ ), each datatype _Ti_ as the set of values _Ti_<sup>_I_=</sup><sup>_val_(</sup><sup>_Ti_),and</sup><sup>_⊤I_</sup> _d_<sup>= ∆</sup><sup>_I_</sup> _V_<sup>.Thesemanticsofexpressions:</sup> 



Contrary to OWL, _DL_ - _LiteA_ (and its implementation) adopts the _unique name assumption_ , meaning that for every interpretation _I_ and distinct individuals or values _c_ 1, _c_ 2, we have that _c_<sup>_I_</sup> 1<sup>=</sup><sup>_cI_</sup> 2<sup>(whichisthenorminthedatabasesetting).</sup> As for other DLs and OWL species, _I satisfies α_ 1 _⊑ α_ 2 if _α_ 1<sup>_I⊆α_</sup> 2<sup>_I_,itsatisfies</sup> (disj _α_ 1 _α_ 2) if _α_ 1<sup>_I∩α_</sup> 2<sup>_I_=</sup><sup>_∅_,anditsatisfies(funct</sup><sup>_S_)if</sup><sup>_SI_isafunction(thatis,if</sup> ( _o, z_ 1) _∈ S_<sup>_I_</sup> and ( _o, z_ 2) _∈ S_<sup>_I_</sup> , then _z_ 1 = _z_ 2)). _I_ satisfies _A_ ( _a_ ) if _a_<sup>_I_</sup> _∈ A_<sup>_I_</sup> , it satisfies _P_ ( _a, a_<sup>_′_</sup> ) if ( _a_<sup>_I_</sup> _, a_<sup>_′I_</sup> ) _∈ P_<sup>_I_</sup> , and it satisfies _U_ ( _a, ℓ_ ) if ( _a_<sup>_I_</sup> _, val_ ( _ℓ_ )) _∈ U_<sup>_I_</sup> . 

##### **Mappings** 

Here, a few definitions and an example is included; the chapter literature contains further technical details and more examples of mappings. 

**Definition 8.1** (Mapping assertion between a database and a TBox) **.** _A mapping assertion between a database D and a TBox T has the form_ Φ ⇝ Ψ _where_ 

- Φ _is an arbitrary SQL query of arity n >_ 0 _over D;_ 

_Chapter 8. Ontology-Based Data Access_ 

172 

- Ψ _is a conjunctive query over T of arity n_<sup>_′_</sup> _>_ 0 _without non-distinguished variables, possibly involving variable terms._ 

**Definition 8.2** (Mapping assertion in _M_ in an OBDA system) **.** _A mapping assertion between a database D and a TBox T in M has the form_ Φ( _⃗x_ ) ⇝ Ψ( _⃗t,⃗y_ ) _where_ 

- Φ _is an arbitrary SQL query of arity n >_ 0 _over D;_ 

- Ψ _is a conjunctive query over T of arity n_<sup>_′_</sup> _>_ 0 _without non-distinguished variables;_ 

- _•⃗x,⃗y are variables with⃗y ⊆⃗x;_ 

- _•⃗t are variable terms of the form f_ ( _⃗z_ ) _, with f ∈_ Λ _and⃗z ⊆⃗x._ 

Concerning the semantics of mappings, intuitively: _I_ satisfies Φ ⇝ Ψ with respect to _D_ if all facts obtained by evaluating Φ over _D_ and then propagating answers to Ψ, hold in _I_ . 

**Definition 8.3** (Satisfaction of a mapping assertion with respect to a database) **.** _An interpretation I satisfies a mapping assertion_ Φ( _⃗x_ ) ⇝ Ψ( _⃗t,⃗y_ ) _in M with respect to a database D, if for each tuple of values⃗v ∈ Eval_ (Φ _, D_ ) _, and for each ground atom in_ Ψ[ _⃗x/⃗v_ ] _, we have that:_ 

- _If the ground atom is A_ ( _s_ ) _, then s_<sup>_I_</sup> _∈ A_<sup>_I_</sup> _;_ 

- _If the ground atom is P_ ( _s_ 1 _, s_ 2) _, then_ ( _s_<sup>_I_</sup> 1<sup>_, sI_</sup> 2<sup>)</sup><sup>_∈P I._</sup> 

(Note: _Eval_ (Φ _, D_ ) denotes the result of evaluating Φ over _D_ , Ψ[ _⃗x/⃗v_ ] denotes Ψ where each _xi_ is substituted with _vi_ ) 

An example is shown in Figure 8.2 with the OBDA plugin for Prot´eg´e. There is an ontology that happens to have a class PromiscuousBacterium, among other things, and a relational database ( `HGT` ) with several tables, such as `organisme` and `flexcount` . Now we have to link the two with a mapping, which means (i) constructing a database query such that it retrieves only the promiscuous bacteria, and (ii) solving the ‘impedance mismatch’ (recollect Chapter 7) with a functor so that the values returned by the database query become objects in the ontology, which is what getPromBact does. Informally, the functor can be considered as a URI building mechanism for individuals in the ontology taken from the database (theoretically, they are skolem functions). 

##### **Query answering** 

Recall the outline of the adolena ontology from the exercise and Figure 7.9. A query could be “retrieve the devices that ameliorate paraplegia” 

```
q(x):-Device(x),ameliorates(x,y),Paraplegia(y)
```

For this to work, we have to introduce three aspects. First, we need a computerprocessable serialization of the query, a notion of what kind of queries we can pose, and a way how it will do the answering. The query language is SPARQL (see footnote 4). The kind of queries is (unions of) conjunctive queries. A conjunctive query (CQ) _q_ over an ontology _O_ is an expression of the form _q_ ( _⃗x_ ) _←∃⃗y_ **.** _conj_ ( _⃗x,⃗y_ ), where _q_ ( _⃗x_ ) the head, _conj_ ( _⃗x,⃗y_ ) the body, the variables in _⃗x_ are distinguished variables and _⃗y_ the non-distinguished variables, and where _conj_ ( _⃗x,⃗y_ ) is a conjunction 



<!-- Start of picture text -->
Dee ¢B86 »a YS AEH <e <Q protégé<br>| @ Metadata (Ontology1222766179.owl) “) OWLClasses = MM Properties @ Individuals = Forms | §& Datasource Manager | 9) ABox Queries<br>DATASOURCE BROWSER DATASOURCE MANAGER<br>Forproject’ @ hgt-app... |( Mappings | SQL queries | SQL Schema Inspector<br>v@<br>O Hct ~M:0 “a<br>OQ PromiscuousBacterium(getPromBact(Sabbrev,$ccount,$percentage))<br>SELECT organisme.abbrev, ccount, organisme.percentage<br>FROM ( SELECT idorganisme, COUNT(distinct cstart) as ccount<br>Q FROM COMCLUSTG2 GROUP BY idorganisme<br>) flexcount, organisme<br>WHERE organisme.abbrev = flexcount.idorganisme AND<br>= [a] organisme.percentage > 10 AND flexcount.ccount > 5<br>nsHGT M21. yYo™<br>RDBMS © PromBactPrime(getPromBactPrime(Sabbrev,$ccount,$percentage,$hgt))<br>OBDAMappings SELECT organisme.abbrev, ccount, organisme.percentage,<br>Source IE organisme.hgt<br>‘com/Ontology12227 FROM ( SELECT idorganisme, COUNT (distinct estart) as ccount<br>JDBC URL me) FROM COMCLUSTG2 GROUP BY idorganisme<br>) flexcount, organisme<br>Database Namé WHERE organisme.abbrev = flexcount.idorganisme AND<br>organisme.percentage > 10 AND flexcount.ccount > 10 AND<br>Database Usernar organisme.hgt > 150<br><!-- End of picture text -->



<!-- Start of picture text -->
q Perfect Tq,T }<br>T reformulationunder OWA '\<br>1 I<br>A — —» cert(q,(T,A))<br><!-- End of picture text -->

_8.6. Literature and reference material_ 

175 

**Review question 8.2.** What are the principal components of the OBDA system described in some detail in this chapter? 

**Review question 8.3.** How is querying in the OBDA setting different compared to plain relational database? 

**Exercise 8.1.** Inspect an ontology used for OBDA; e.g.,: the one of the EPnet<sup>5</sup> or one from the Ontop examples<sup>6</sup> . Consider again Section 1.2.1 regarding the differences between ontologies and conceptual models and Chapter 6 on foundational ontologies. Why does the ‘ontology’ in an OBDA system look more like an OWLized conceptual data model? * 

**Exercise 8.2.** You will set up an OBDA system. For a generic topic, such as movies, you can consult the wiki at `https://github.com/ontop/ontop/wiki` for tutorials and sample data, and the software at `https://github.com/ontop/ontop` ; for an OBDA tutorial with South African wildlife—mainly research data about elephants in SA’s national parks—you can get a tutorial from the textbook’s homepage. 

### **8.6 Literature and reference material** 

1. Diego Calvanese, Giuseppe De Giacomo, Domenico Lembo, Maurizio Lenzerini, Antonella Poggi, Mariano Rodriguez-Muro, and Riccardo Rosati. Ontologies and databases: The DL-Lite approach. In Sergio Tessaris and Enrico Franconi, editors, _Semantic Technologies for Information Systems - 5th Int. Reasoning Web Summer School (RW 2009)_ , volume 5689 of Lecture Notes in Computer Science, pages 255-356. Springer, 2009. 

2. Calvanese, D., Keet, C.M., Nutt, W., Rodr´ıguez-Muro, M., Stefanoni, G. Web-based Graphical Querying of Databases through an Ontology: the WONDER System. _ACM Symposium on Applied Computing (ACM SAC’10)_ , March 22-26 2010, Sierre, Switzerland. 

3. D. Calvanese, P. Liuzzo, A. Mosca, J. Remesal, M. Rezk, and G. Rull. Ontology-based data integration in EPnet: Production and distribution of food during the roman empire. _Engineering Applications of Artificial Intelligence_ , 51:212-229, 2016. 

> 5 `http://romanopendata.eu/sparql/doc/index.html` 

> 6e.g., movies: `https://github.com/ontop/ontop/wiki/Example_MovieOntology` 

### CHAPTER 9 

### Ontologies and natural languages 

The interaction of ontologies with natural language processing and even more so at the fundamental level—Ontology and language—can be good for many conversations and debates about long-standing controversies<sup>1</sup> . In this chapter, we shall focus on the former and take an engineering perspective to it. In this case we can do that, because the points of disagreement are ‘outside’ the ontology as artefact, in a similar way as an OWL file is indifferent as to whether a human who reads the file assumes a particular OWL class to be a concept or a universal. Regardless whether you are convinced the reality is shaped, or even created, by language, or not, there are concrete issues that have to be resolved anyhow. For instance, the OWL standard had as one of the design goals “internationalisation” (recall Section 4.1.1), which presumably means ontologies being able to handle multiple languages. How is that supposed to work? Anyone who speaks more than one language will know there are many words that do not have a simple 1:1 translation of the vocabulary. What can, or should, one do with those non-1:1 cases when translating an ontology in one’s own language or from one’s own language into, say, English? Where exactly is a good place to record natural language information pertaining to the vocabulary elements? How to manage all those versions in different languages? The area of _multilingual ontologies_ aims to find answers to such questions, which will be introduced in Section 9.1. 

A quite different type of interaction between ontologies and languages is that of ontologies and Controlled Natural Language (CNL), which may avail of multilingual ontologies to a greater or lesser extent. One can _verbalise_ —or: put into (pseudo)natural language sentences—the knowledge represented in the ontology. This can be useful for, among others: interaction with domain expert during the knowledge acquisition and verification phases, automatically generating documentation about the ontology, and anywhere where the ontology is being used in an ontology-driven information system (e.g., SNOMED CT with an electronic health records system). 

> 1Debates include the topic whether language shapes reality and therewith ontology or is used to approximate describing the world. 

177 

_Chapter 9. Ontologies and natural languages_ 

178 

The general idea will be described in Section 9.2. 

Besides these two interactions between ontology and natural language, and the use of NLP for ontology learning that we have seen in Section 7.4, there are also areas of research and working technologies where ontologies enhance NLP applications<sup>2</sup> . This version of the textbook does not include a separate section on such ontology-driven information systems, however, for the scope is ontology engineering. It is duly acknowledged that some of the solutions that came out of the application areas can be useful for the aforementioned tasks, and the Semantic Web as application area in particular. This because the Web is global, so it makes sense to create a _Multilingual_ Semantic Web (see the recently published handbook [BC14]). It turned out there are some inherent problems of the original vision of Berners-Leet et al. [BLHL01] to overcome [Hir14], and insights gained there assist with solutions for ontologies in the general case, regardless whether that is within the Semantic Web with OWL or another logic and technology stack. 

### **9.1 Toward multilingual ontologies** 

Let us first have a look at just one natural language and an ontology (Section 9.1.1) before complicating matters with multiple languages in Section 9.1.2. 

#### **9.1.1 Linking a lexicon to an ontology** 

Most, if not all, ontologies you will have inspected and all examples given in the preceding chapters simply gave a human-readable name to the DL concept or OWL class. Perhaps you have loaded an ontology in the ODE, and the class hierarchy showed numbers, alike GO:00012345, and you had to check the class’s annotation what was actually meant with that identifier. This is an example of a practical difference between OBO and OWL (recall Section 7.1), but which is based on different underlying modelling principles. DLs assume that a concept is _identified_ by the _name_ given to it; that is, there is a 1:1 correspondence between what a concept, say, being a vegetarian, means and the name we give to it. Natural language and the knowledge, reality etc. are thus tightly connected and, perhaps, even conflated. Not everybody agrees with that underlying assumption. An alternative viewpoint is to assume that there are language- _independent_ entities—i.e., they exist regardless whether humans name them or not—that somehow have to be identified and then one sticks one or more labels or names to it. Put differently: knowledge is one thing and natural language another, and they should be kept as distinct kinds of things. 

The second view is prevailing at least within the ontology engineering arena. To date, two engineering solutions have been proposed how to handle this in an ontology. The first one is the OBO solution, which was used since its inception 

> 2E.g., it has been shown to enhance precision and recall of queries (including enhancing dialogue systems [VF09]), to sort results of an information retrieval query to the digital library [DAA<sup>+</sup> 08], (biomedical) text mining, and annotating textbooks for ease of navigation and automated question generation [CCO<sup>+</sup> 13] as an example of adaptive e-learning. 



<!-- Start of picture text -->
formvVariant<br>LexicalForm<br>representation:String Com ponent<br>4writtenRep:String<br>LexiconexICO entry a<br>language:String _canonicalForm decompositiont leaf =<br>topic:Resource form kt otherForm<br>|<br>abstractForm elementt constituent:Resource|<br>separator:String<br>lexicalVariant _ LexicalEntryi a ‘am, ShraseRoot tree<br>Morph pattern (Word,Phrase,Part)<br>Pattern topic:Resourceic cynBahavior Frame leaf<br>nextTransform transform isSenseOf<br>_ subsense<br>Morph LexicalSense<br>Transform condition:Resource * Argument<br>[equivalent senseRelation | definition:Resourcet semArg poe ; optional:boolean<br>onstem Fincompatible example:Resource? )subjOfProp |<br>generates :itbroader moore —| XQ reference LobjOfPropij'sA ii mar‘ker<br>nl isReferenceOf } jextrinsicArg |<br>typ | altRef Ontology ' Any lemon lexicalProperty Lexical<br>iniddenRef 1 _sloment Category<br>* LexicalErtry has three subclasses: Word, Ptrase, Part<br>* definition and example are stated as nodes with a value<br>* condijon has subproperies propertyDomain and propertyRange<br>+ decomposition and element may also be used with Frames and Arauments resp.<br><!-- End of picture text -->

_Chapter 9. Ontologies and natural languages_ 

180 

phrase, verb etc.), gender, case and related properties (if applicable). A simple entry in the _Lemon_ file could look like this, which lists, in sequence: the location of the lexicon, the location of the ontology, the location of the _Lemon_ specification, the lexical entry (including stating in which language the entry is), and then the link to the class in the OWL ontology: 

```
@base<http://www.example.org/lexicon>
@prefixontology:<http://www.example.org/AfricanWildlinfeOntology1#>
@prefixlemon:<http://www.monnetproject.eu/lemon#>
```

```
:myLexiconalemon:Lexicon;
```

```
lemon:language"en";
lemon:entry:animal.
```

```
:animalalemon:LexicalEntry;
```

```
lemon:form[lemon:writtenRep"animal"@en];
```

```
lemon:sense[lemon:referenceAfricanWildlinfeOntology1:animal].
```

One can also specify rules in the _Lemon_ file, such as how to generate the plural from a singular. However, because the approach is principally a declarative specification, it is not as well equipped at handling rules compared to the well-established grammar systems for NLP. Also, while _Lemon_ covers a fairly wide range of language features, it may not cover all that is needed; e.g., the noun class system emblematic for the indigenous language spoken in a large part of sub-Saharan Africa does not quite fit [CK14]. Nonetheless, _Lemon_ , and other proposals with a similar idea of separation of concerns, are a distinct step forward for ontology engineering where interaction with languages is a requirement. Such a separation of concerns is even more important when the scope is broadened to a multilingual setting, which is the topic of the next section. 

#### **9.1.2 Multiple natural languages** 

Although this textbook is written in one language, English, for it is currently the dominant language in science, the vast majority of people in the world speak another language and they both have information systems in their own language as well as that they may develop an ontology in their own language, or else localise an ontology into their own language. One could just develop the ontology in one’s own language in the same way as the examples were given in English in the previous chapters and be done with it. But what if, say, SNOMED CT should be translated in one’s own language for electronic health records, like with OpenMRS [Ope], or the ontology has to import an existing ontology that happens to be not represented in the target language and compatibility with the original ontology has to be maintained? What if some named class is not translatable into one single term? For instance, in French, there are two words for the English ‘river’: one for a river that ends in the sea and another word for a river that doesn’t ( _fleuve_ and _rivi`ere_ ), and isiZulu has two words and corresponding meanings for the _participation_ relation: one as we have seen in Section 6.2 and another for participation of collectives in a process ( _-hlanganyela_ ). 

_9.1. Toward multilingual ontologies_ 

181 

Several approaches have been proposed for the multilingual setting, for both localisation and internationalisation of the ontology with links to the original ontology and multiple languages at the same time in the same system. The simplest approach is known as _semantic tagging_ . This means that the ontology is developed ‘in English’, i.e., _naming_ the vocabulary elements in one language and for other languages, labels are added, such as Fakult¨at and Fakulteit for the US-English School. This may be politically undesirable and anyhow it does not solve the issue of non1:1 mappings of vocabulary elements. It might be a quick ‘smart’ solution if you’re lucky (i.e., there happen to be only 1:1 mappings for the vocabulary elements in your ontology), but a solid reusable solution it certainly is not. OBO’s approach of IDs and labels avoids the language politics: one ID with multiple labels for each language, so that it at least treats all the natural languages as equals. 

However, both falter as soon as there is no neat 1:1 translation of a term into another single term in a different language—which is quite often the case except for very similar languages—though within the scientific realm, this is much less of an issue, where handling synonyms may be more relevant. 

One step forward is a mildly “lexicalised ontology” [BCHM09], of which an example is depicted in Figure 9.2. Although it still conflates the entity and its name and promotes one language as the primary, at least the handling of other languages is much more extensive and, at least in theory, will be able to cope with multilingual ontologies to a greater extent. This is thanks to its relatively comprehensive information about the lexical aspects in its own linguistic ontology, with the WordForm etc., which is positioned orthogonally to the domain ontology. In Figure 9.2, the English OralMucosa has its equivalent in German as Mundschleimhaut, which is composed here of two sub-words that are nouns themselves, Mund ‘mouth’ and Schleimhaut ‘mucosa’. It is this idea that has been made more precise and comprehensive in its successor, the _Lemon_ model, that is tailored to the Semantic Web setting [MdCB<sup>+</sup> 12]. Indeed, the same _Lemon_ from the previous section. The _Lemon_ entries can become quite large for multiple languages and, as it uses RDF for the serialisation, it is not easily readable. An example for the class Cat in English, French, and German is shown diagrammatically in Figure 9.3, and two annotated short entries of the Friend Of A Friend (FOAF)<sup>4</sup> structured vocabulary in Chichewa (a language spoken in Malawi) are shown in Figure 9.4. 

There are only few tools that can cope with ontologies and multiple languages. It would be better if at least some version of language management were to be integrated in ODEs. At present, to the best of my knowledge, only MoKI provided such a service partially for a few languages, inclusive of a localised interface [BDFG14]. 

The following example illustrates some actual (unsuccessful) ‘struggling’ trying to handle a more complex case than ‘dog = chien = inja’ when there is not even a name for the entity in the other language; a more extensive list of the type of issues can be found in [LAF14]. 

**Example 9.1** ([AFK12]) **.** _South Africa has a project on indigenous knowledge management systems, but the example can easily be generalised to cultural his-_ 

> 4 `http://xmlns.com/foaf/spec/` 



<!-- Start of picture text -->
[Lingtnto=<a*® Word on<br>hasLinginfo aad i instanceos””°*<br>nae : has Lit<br>m *s hasMorphSyninfo _<br>” and “teeny, “tee, Pd<br>hasOrthographi . hasLang “t See<br>hasPoS 5 ‘+, has Stem “tay<br>, ,<br>(n] geneaeea Pls<br>. .<br>http://olp.dfki.de/LingInfo/ “ hasOrthographicForm |<br>http://ontoware.org/projects/lexonto/ (aund] Gaia<br><!-- End of picture text -->



<!-- Start of picture text -->
ent“>{ dog :Lexicalent sense ;<br>canonicalForm translationOf translationOf<br>writtenRep="dog"@en<br>sense<br>entry sense<br>chien : LexicalEnt<br>canonicalForm<br>| Form<br>writtenRep=“chien" @fr<br>enny:<br>inja : LexicalEnt<br>canonicalForm<br>Form<br>writtenRep=“inja"@zu<br><!-- End of picture text -->



<!-- Start of picture text -->
e090 __) foaf.ttl<br>## theme ##<br>:mutu a lemon:LexicalEntry :<br>lexinfo:partOfSpeech lexinfo:noun;<br>lemon:canonicalForm [ lemon:writtenRep “mutu"@ny;<br>lexinfo:grammaticalNumber lexinfo:singular;<br>ncs:hasNounClass ncs:class3 ] ;<br>lemon:otherForm [lemon:writtenRep "mitu"@ny;<br>lexinfo:grammaticalNumber lexinfo:plural;<br>ncs:hasNounClass ncs:class4] ;<———<br>lemon:sense [ lemon:reference foaf:theme] .<br>## thumbnail ##<br>:chinthu_chaching'ono a lemon:Phrase ;<br>Lemon:decomposition (<br>[ lemon:element :chithunzi ]<br>[ lemon:element :chaching'ono]<br>3<br>:chithunzi a lemon:Word;<br>lexinfo:PartOfSpeech:chaching'ono:chaching'ono a lemon:Wordneronero ei; snouns; snouns snouns £7 a<br>lemon: form [ lemon:writtenRep “chithunzi chaching'ono"@ny ] ;<br>lemon:sense [ lemon:reference foaf:thumbnail] .<br>## topic ##<br><!-- End of picture text -->

e090 __) foaf.ttl ## theme ## :mutu a lemon:LexicalEntry : | lexinfo:partOfSpeech lexinfo:noun; | lemon:canonicalForm [ lemon:writtenRep “mutu"@ny; lexinfo:grammaticalNumber lexinfo:singular; ncs:hasNounClass ncs:class3 ] ; lemon:otherForm [lemon:writtenRep "mitu"@ny; lexinfo:grammaticalNumber lexinfo:plural; ncs:hasNounClass ncs:class4] ;<——— lemon:sense [ lemon:reference foaf:theme] . j ## thumbnail ## :chinthu_chaching'ono a lemon:Phrase ; | Lemon:decomposition ( | [ lemon:element :chithunzi ] [ lemon:element :chaching'ono] 3 :chithunzi a lemon:Word; lexinfo:PartOfSpeech:chaching'ono:chaching'ono a lemon:Wordneronero ei; snouns; snouns snouns £7 a | lemon: form [ lemon:writtenRep “chithunzi chaching'ono"@ny ] ; lemon:sense [ lemon:reference foaf:thumbnail] . ## topic ## 

_9.1. Toward multilingual ontologies_ 

185 

it still would require resolving the third item listed above. Here, we’ll explore the first two items and highlight some interesting curiosities and hurdles, to eventually end up with a judgement on the “internationalisation” goal of OWL (recall Section 4.1.1). 

Let us first consider the ‘easy’ case of disjunctive languages, i.e., where different parts of speech are written as separate words, cf. the agglutinating languages that string things together. For illustrative purpose we take Spanish and Afrikaans: the former is a widely-spoken language globally and the latter is a language spoken widely in the province where this author lives when writing this section. 

The OWL 2 keywords were easy to translate for the class axioms in both cases; e.g., `SubClass Of` translates as `Subclase de` and `Subklas van` , respectively. For the object properties, the only real deliberation was regarding the translation of ‘property’ in Afrikaans, since the literal translation is _eienskap_ , which is of an entity itself, but not really relational as OWL’s object property is used. Eventually, a semantic translation was decided upon ( _verwantskap_ ). 

The Manchester OWL Syntax (MOS) translations showed to be more interesting already for the class constructors. They are listed in Table 9.1. There are three observations on differences, and consequences for tool development: 

- MOS’s keywords in English are all single words, whereas this is not the case for Spanish and Afrikaans. 

- Spanish uses diacritics; e.g., _s´olo_ . 

- Afrikaans has double negation that wraps around an expression, which is either disjointness of classes (e.g., _’n dier is_ _<u>nie</u> ’n plant_ _<u>nie.</u>_ ‘an animal is not a plant’) or in the context of object properties (as in _Elke CE1 (is CE2 en nie OP1 nie)_ ) 

UTF encodings and tools have improved over the years so that the diacritics are processed with ease. The multi-words and disconnected-strings features, on the other hand, are obviously an issue for parsing MOS files if it were really to be ‘Spanish MOS’, ‘Afrikaans MOS’ etc. To avoid that, the only option is to render MOS in Spanish/Afrikaans in the interface only and not also in the serialisation. This is exactly what the Prot´eg´e plugin for Spanish and Afrikaans does<sup>7</sup> . However, if the localisation is only achieved through the rendering in a GUI, then one might as well omit MOS and render straight from the RDF/XML required syntax, rather than through an optional syntax. Prot´eg´e specifically does use MOS in its interface, however; hence, the translations. This improves the rendering of axioms of an ontology in Spanish from, e.g., 

jirafa come only (oja or ramita) 

into a full pseudo-natural Spanish, alike: 

jirafa come s´olo (oja o ramita) 

On the flip side, the Spanish for ‘or’, _o_ , is the same as the ‘o’ used in declaring property chains. This should be clear from the context of use, but a novice will have to be made aware of the semantics of those o’s. 

> 7the plugins are downloadable from `https://github.com/mkeet/ODElocalisation` 

_Chapter 9. Ontologies and natural languages_ 

186 

**Table 9.1:** Manchester OWL Syntax (MOS) and two sets of translations. 

|**MOS**|**MOS in Spanish**|**MOS in Afrikaans**|
|---|---|---|
|some|al menos uno|sommige|
|only|s´olo|slegs|
|min|al m´ınimo|ten minste|
|max|al m´aximo|by die meeste|
|exactly|exactamente|precies|
|and|y|en|
|or|o|of|
|not|no|nie _<_`expression`_>_ nie|
|SubClassOf|SubclaseDe|SubklasVan|
|EquivalentTo|EquivalenteA|DieselfdeAs|
|DisjointWith|DisjuntoCon|DisjunkteVan|



The ‘MOS approach’ becomes more challenging with agglutinating languages and those that have many genders or noun classes that determine surrounding words. For instance, there are seven variants for ‘at least one’ in isiZulu (the Zulu language), depending on the noun class of the noun that is quantifies over; e.g., it is _elilodwa_ in the case of ‘at least one’ apple and _esisodwa_ in the context of ‘at least one’ twig. This is still processable with a more comprehensive plugin that avails of additional annotations and rules and that operate on the ‘syntactic sugar’ layer only as well, not for generating a serialisation in isiZulu as that would challenge the parser even more. 

Overall, one could thus already argue that it is not going well for OWL with respect to meeting the internationalisation goal. There are other complications, which have to do with the object properties. For an ‘English ontology’, it is common practice to name an object property with a verb in the 3rd person singular and include any prepositions in the name of the object property. This makes sense for English, but not in various other languages. Lithuanian puts the preposition with the noun at the end and isiZulu puts it at the start of the noun, rather than with the verb. That is, the element’s labels are not fixed, but context-dependent. To complicate matters further, there may be gender/noun class-based inflections (which there are for isiZulu and similar languages), which also contributes to not having a fixed string for name. The worst case we have encountered so far, is that for ‘contained in’, there is no string for the object property at all: a prefix and a suffix is added to the noun that plays the container role to indicate it is the object containing the subject. Yet, by default—baked into the assumptions in the OWL standard—an object property must have a name. Indeed, one can use identifiers as names for entities, but this then always will require additional label processing. This, in turn, may result in either two-tier tools—those that do have that extra functionality with label processing, and those that do not—or one dominant one for English and many disconnected attempts for all the other languages. The current state at the time of writing is (still) the latter. 

In closing, the development of multilingual ontologies with suitable tooling is 

_9.2. Ontology verbalisation_ 

187 

still a challenge. 

### **9.2 Ontology verbalisation** 

The second topic of ontologies & natural language—ontology verbalisation—can build upon the previous, but need not if you happen to be interested in a grammatically ‘simple’ language, such as English. The core notion is to generate (pseudo-) natural language sentences from the axioms in the ontology. The introduction to Block III already noted that ontology verbalisation may be useful for, mainly: 

- Ameliorating the knowledge acquisition bottleneck; it: 

   - helps the domain experts understand what exactly has been represented in the ontology, and thereby provides a means to validate that what has been represented is what was intended; 

   - can be used to write axioms in pseudo-natural language, rather than the logic itself, to develop the ontology. 

- Some ontology-driven information system purposes; e.g., e-learning (question generation, textbook search), readable medical information from medical terminologies in electronic health record systems. 

The term ‘ontology verbalisation’ is rather specific and restricted, and it falls within the scope of Controlled Natural Language (CNL) and Natural Language Generation fields of research (NLG). While most papers on ontology verbalisation will not elaborate on the methodological approach specifically, there are clear parallels with the activities of the traditional NLG pipeline alike proposed in [RD97]. The pipeline is summarised in Figure 9.5, top section, and the corresponding answers for ontology verbalisation are described in the bottom section of the figure. 

#### **9.2.1 Template-based approach** 

There are three principal approaches to generate the sentences: canned text, templates, and a grammar engine. There are also hybrids, such as templates with a few grammar rules, and either can be created by hand entirely or has use some partial automation by being based on some corpus to aid determining preferred sentences structures and terminology. The most commonly used approach for ontology verbalisation is templates that optionally have a few grammar rules, since it generally takes less effort to start with, there are only a relatively small number of constraints to verbalise, and there are only domain corpora, if any, rather than some ‘corpus for OWL ontologies’. Let’s look at two examples (analysed afterward): 

- (S1) Giraffe _⊑_ Animal 

<u>Each is an</u> Animal 

- (S2) Herb _⊑_ Plant <u>Each</u> Herb <u>is a</u> Plant 

The underlined text ‘Each’ is the natural language rendering of the silent “ _∀_ ” at the start of the axioms, and ‘is a(n)’ for “ _⊑_ ”, which remain the same, and the 

_Chapter 9. Ontologies and natural languages_ 

188 



<!-- Start of picture text -->
Text planning<br><!-- End of picture text -->



<!-- Start of picture text -->
Sentence<br>planning<br><!-- End of picture text -->



<!-- Start of picture text -->
Linguistic<br>realisation<br><!-- End of picture text -->



<!-- Start of picture text -->
Sentence  Linguistic<br>Text planning planning realisation<br>1. Content  2. Discourse  3. Sentence  4. Lexica- 5. Referring  6. Linguistic<br>determination planning Aggregation lisation expression  realisation<br>generation<br>1. What structured data/info/ 3. Which messages to put together into a  6. Use grammar rules to<br>knowledge do you want to put  sentence? produce syntac-tically,<br>into NL sentences? 4. Which words and phrases will it use for  morphological-ly, and<br>2. In what order should it be  each domain concept and relation? orthographical-ly correct<br>presented? 5. Which words or phrases to select to  (and is also meaningful)<br>identify domain entities?<br>The NLG ‘pipeline’<br>Ontology verbalisation<br>1. The (OWL) ontology 3. Aim: sentence for each axiom 6. Language-specific issues (e.g.,<br>2. Your choice (e.g., first all classes and   4. Use vocabulary of the ontology; Select term for  singular/plural of the class in<br>class expressions in the TBox, then the  each constructor in the language (Each/All, and,  agreement with conjugation of the<br>object properties, etc.)  some/at least one) verb, ‘a’ and ‘an’ vs ‘a(n)’, etc.)<br>5. Combine related small axiom, or to relate the<br>sentences generated for a large axiom<br><!-- End of picture text -->

**Figure 9.5:** The common NLG ‘pipeline’ and how that links to ontology verbalisation 

vocabulary from the axiom is inserted on-the-fly by reading it in from the ontology file. One can construct a _template_ for an axiom type with those pieces of text that remain the same for each construct, interspersed with variables that will take the appropriate entity from the ontology. For instance, for this named class subsumption axiom type _C ⊑ D_ , one could declare the following template: 

`Each` _class_ 1 `is a(n)` _class_ 2 and for the _basic all-some_ axiom type _C ⊑∃R.D_ , either one of the following ones may be selected: 

`Each` _class_ 1 _op_ `at least one` _class_ 2 

`Each` _class_ 1 _op_ `some` _class_ 2 

`All` _class_ 1 _pl opinf_ `at least one` _class_ 2 

`All` _class_ 1 _pl opinf_ `some` _class_ 2 

The subscript “ _pl_ ” indicates that the first noun has to be pluralised and “ _inf_ ” denotes that the object property has to be rendered in the infinitive. The algorithms tend to be based on the assumption that the ontology adheres to conventions of naming classes with nouns in the singular and object properties in 3rd person singular. It is an implementation detail whether a plural or the infinitive is generated on-the-fly from grammar rules or fetched from a _Lemon_ file or another annotation or precomputed lexicon. A relatively straight-forward template for the _C ⊑∃R.D_ axiom pattern at the implementation level is illustrated in Figure 9.6 for English and Arabic, which are based on the templates of the multilingual verbaliser by [JKD06]. 

One could declare templates of each axiom type, but because it is ‘arbitrary’ within the syntax constraints of the logic, a modular approach makes sense. Essentially, each symbol in the language has one or more ways of putting it in natural language, and based on that, one can create a _controlled natural language_ that 

###### English template 

- <Constraint xsi:type="Existential"> <Text> -[Existential] Each</Text> <Class index="0"/> <Text>must</Text> <Property index="0"/> <Text>at least one</Text> <Class index="1"/> 

- </Constraint> 

###### Arabic template 

- <Constraint xsi:type="Existential"> <Text> ki </Text> <Class index="0" /> <Property index="0" /> <Class index="1" /> <Text> ils de dall<e/Text> 

- </Constraint> 

_Chapter 9. Ontologies and natural languages_ 

190 

patterns without the ontology [GK18]. 

One might take another step further: use machine translation in the verbalisation process. Such a system has been developed by [GB11]: it uses ACE for ontology verbalisation in English and Grammatical Framework for translations between English and Latvian. Which option is the better one is not clear: a) make templates in one’s language and translate the ontology vocabulary (overcoming the challenges described in Section 9.1), or b) skip the template specification by reusing an existing English one, develop a resource grammar for Grammatical Framework, and translate the generated English into the target language or use, e.g., Neural Machine Translation (NMT) for that. This depends on one’s aims and availability of resources. In theory, the Grammatical Framework should work better as a reusable solid solution but with (very) high start-up costs for grammar specification (as does NMT because it needs large parallel corpora in the domain of the ontology), whereas templates are easier to specify but the knowledge that goes into it is not easily reused elsewhere. Of course, the latter may not be useful if the ontology has its vocabulary elements already in the target language. 

Having the route from axiom to (pseudo-)natural language sentence, one could wonder about the process in the reverse, i.e., using the CNL to generate the axioms. The most successful results for ontologies to date have been obtained with Attempto Controlled English (ACE) [FKK10] for OWL DL. A related line of work within the scope of from-text-to-axiom, is natural language-based query formulation (e.g., [FGT10]), which uses a CNL for sentence fragments to iteratively construct a query. In this scenario, however, partial completions of an iteratively constructed sentence to query the ontology are based on the step-wise selected vocabulary and the (partial) axioms in which it appears. 

### **9.3 Exercises** 

**Review question 9.1.** Name some of the problems with naming the classes in an OWL file, when considering multiple languages. 

**Review question 9.2.** Describe in your own words the theoretical solution that _Lemon_ exhibits, both in the context of a single natural language and in the multilingual setting. 

**Review question 9.3.** Name some of the challenges for localising an ontology into a language that is not English. 

**Review question 9.4.** What can ontology verbalisation be used for? 

**Review question 9.5.** Describe how the template-based approach works for ontology verbalisation. 

**Exercise 9.1.** The AWO has been translated into Spanish, Afrikaans, isiZulu, and Dutch. That has been done in different ways, as follows: 

- IsiZulu: translated terms, changed IRI; 

- Afrikaans: translated terms, still has some IRI issues to resolve; 

191 

##### _9.4. Literature and reference material_ 

   - Dutch: translated terms, changed IRI; 

   - Spanish: translated terms, same IRI but different file name. 

- Inspect them, and then try to answer the following questions: 

   - 

   - a. What are the IRI issues with the Afrikaans OWL file? 

   - b. For the other three: which one, if any, is the best way to handle the IRI, and why/if neither: why not? * 

   - c. In what way, if any, is the link to the original AWO v1 maintained? * 

- Note: it may be easier to answer the questions by looking at the OWL file in a text editor cf an ODE, since it gives a more easily accessible view on the IRIs. 

**Exercise 9.2.** Create a _Lemon_ file for the ontology of your choice, in the language of your choice. 

**Exercise 9.3.** Devise templates in English for the following axiom types: 

1. _C ⊓ D ⊑⊥_ 

2. _∃R.C ⊑ D_ 

3. _C ⊑∀R.D_ 

You may want to do this for a language of choice, but this may turn out a hard exercise then, depending on the chosen language. * 

**Exercise 9.4.** Devise a software architecture that would solve the multilingualism with respect to maintenance. Lists its pros and cons. Compare your solution to your classmates’ solutions. * 

**Exercise 9.5.** If there were to be an ‘OWL 3’ standardisation effort, what would you propose to change to the current OWL 2 standard so that it will meet better the original “internationalisation” goal, and why? If nothing, why? 

### **9.4 Literature and reference material** 

1. John McCrae, Guadalupe Aguado de Cea, Paul Buitelaar, Philipp Cimiano, Thierry Declerck, Asunci´on G´omez-P´erez, Jorge Gracia, Laura Hollink, Elena Montiel-Ponsoda, Dennis Spohr, and Tobias Wunner. _The lemon cookbook_ . Technical report, Monnet Project, June 2012. www.lemon-model.net. 

2. Paul Buitelaar and Philipp Cimiano (Eds.). _Towards the Multilingual Semantic Web: Principles, Methods and Applications_ . Springer, 2014. 

3. N. Bouayad-Agha, G. Casamayor, and L. Wanner. Natural language generation in the context of the Semantic Web. _Semantic Web Journal_ , 5(6):493513, 2014. 

4. Hazem Safwat and Brian Davis. CNLs for the semantic web: a state of the art. _Language Resources & Evaluation_ , 51(1):191-220, 2017. 

### CHAPTER 10 

### Advanced Modelling with Additional Language Features 

When the representation of the subject domain in an ontology requires features not available in OWL, the default response is typically ‘tough luck’. This is not exactly true. Common Logic (CL) and the Distributed Ontology, model and specification Language (DOL) were mentioned as an alternative way out in Section 4.3.2. It is not immediately clear, however, how exactly CL and DOL can assist with, say, probabilistic or temporal information. Also, for some ‘minor’ addition, one perhaps may not want to immediately leave behind all the Semantic Web tooling infrastructure. To some extent, such requirements have been met for especially uncertainty and vagueness, and extensions to OWL do exist, as we shall see. Temporal extensions have shown to be somewhat difficult, or: if one wants to remain within a decidable fragment of FOL, then there is not much temporal knowledge one would be able to represent. We will look at each in turn. 

The main aim of this chapter is to provide several pointers to more advanced language features that allow the modeller to represent more than can be done with the DL-based OWL species only. We shall see some solutions to earlier-mentioned modelling question, among others: with which extension that “small” of the ‘small bladed hunting spear’ can be represented and how the essential and immutable behaviour of the parthood relation with the boxer and his hands vs. brain and human is resolved. 

### **10.1 Uncertainty and vagueness** 

This advanced ontology engineering topic concerns how to cope with uncertainty and vagueness in ontology languages and their reasoners and what we can gain from all the extra effort. At the time of writing, this elective topic is mainly focused on theory and research, and a few proof-of-concept tools exist. Let’s first clarify these two terms upfront: 

193 

194 _Chapter 10. Advanced Modelling with Additional Language Features_ 

- **Uncertainty** : statements are true or false, but _due to lack of knowledge_ we can only estimate to which probability / possibility / necessity degree they are true or false; 

- **Vagueness** : statements involve concepts for which _there is no exact definition_ (such as tall, small, close, far, cheap, expensive), which are then true to some degree, taken from a truth space. 

Consider, e.g., information retrieval: to which _degree_ is a web site, a page, a paragraph, an image, or a video segment relevant to the information need and an acceptable answer to what the user was searching for? In the context of ontology alignment, one would want to know (automatically) to which _degree_ the focal concepts of two or more ontologies represent the same thing, or are ‘sufficiently’ overlapping. In an electronic health record system, one may want to classify patients based on their symptoms, such as throwing up _often_ , having a _high_ blood pressure, and _yellow-ish_ eye colour. Or compute the probability that a person is HIV positive is 23% and has been exposed to TB is 85%, or the probability that birds fly. How can ontology-driven software agents do the negotiation for your holiday travel plans that are specified imprecisely, alike “I am looking for a package holiday of _preferably less than_ R15000, but really no more than R20000 , for _about_ 12 days in a _cold_ country that has snow”? One may want to classify, say, _ripe_ apples, find the set of all individuals that _mostly_ buy low calorie food, and patients that are possibly septic when having the properties of “infection and [temperature _>_ 39C OR temperature _<_ 36C, respiratory rate _>_ 20 breaths/minute OR PaCO2 _<_ 32 mmHg]”. Of course, one can combine the two notions as well, e.g.: “It is _probable_ to degree 0.915 that it will be _hot_ in June in the Northern hemisphere”. 

The main problem to solve, then, is what and how to incorporate such _vague_ or _uncertain_ knowledge in OWL and its reasoners (or another logic, as one desires). The two principal approaches regarding uncertainty probabilistic and possibilistic languages, ontologies, and reasoning services, where the former way of dealing with uncertainty receives a lot more attention than the latter<sup>1</sup> . The two principal approaches regarding vagueness and the semantic web are fuzzy and rough extensions, where fuzzy used to receive more attention compared to the rough approach, but theories for the latter are catching up. 

#### **10.1.1 Fuzzy ontologies** 

In fuzzy logic<sup>2</sup> , statements are true to some degree which is taken from a _truth space_ , which is usually [0 _,_ 1]. This sounds easier than it is, especially the deductions that follow from them. Consider first the following example. 

> 1We will not cover probabilistic ontologies in this chapter; a recent introductory overview is described in [Luk17]. Some pointers to reasoners are: Pronto, which is an extension to the Pellet reasoner ( `http://pellet.owldl.com/pronto/` ), PR-OWL ( `http://www.pr-owl.org/` and others, such as a Probabilistic Ontology Mapping Tool (OMEN), and combinations with Bayesian networks (BayesOWL, OntoBayes). 

> 2In this section, I assume the reader recalls something of fuzzy logic or fuzzy sets, and that the occasional examples suffice as refresher. 



<!-- Start of picture text -->
expensive<br>;oO1 —<br><!-- End of picture text -->



<!-- Start of picture text -->
trapezoid<br>ST \<br><!-- End of picture text -->



<!-- Start of picture text -->
= cold<br>—hot<br><!-- End of picture text -->

_Chapter 10. Advanced Modelling with Additional Language Features_ 

196 

[0 _,_ 1], which are extended to formulae as follows (the principal list is shown): 

|_I_(_¬φ_) =_I_(_φ_)_→_0|(10.1)|
|---|---|
|_I_(_∃xφ_) = sup_c∈_∆_II_<sup>_c_</sup><br>_x_<sup>(</sup><sup>_φ_)</sup>|(10.2)|
|_I_(_∀xφ_) = inf_c∈_∆_II_<sup>_c_</sup><br>_x_<sup>(</sup><sup>_φ_)</sup>|(10.3)|
|_I_(_φ ∧ψ_) =_I_(_φ_)_⊗I_(_ψ_)|(10.4)|
|_I_(_φ ∨ψ_) =_I_(_φ_)_⊕I_(_ψ_)|(10.5)|
|_I_(_φ →ψ_) =_I_(_φ_)_⇒I_(_ψ_)|(10.6)|
|_I_(_¬φ_) = _⊖I_(_φ_)|(10.7)|



where _Ix_<sup>_c_isas</sup><sup>_I_exceptthatvar</sup><sup>_x_ismappedtoindividual</sup><sup>_c_,the</sup><sup>_⊗_,</sup><sup>_⊕_,</sup><sup>_⇒_,</sup> and _⊖_ are _combination functions_ : triangular norms (or t-norms), triangular conorms (or s-norms), implication functions, and negation functions, respectively. Also, they extend the classical Boolean conjunction, disjunction, implication, and negation, respectively, to the many-valued case. In addition, it poses the notion of _degree of subsumption_ between two fuzzy sets _A_ and _B_ , which is defined as inf _x∈XA_ ( _x_ ) _⇒ B_ ( _x_ ) and such that if _A_ ( _x_ ) _≤ B_ ( _x_ ) for all _x ∈_ [0 _,_ 1] then _A ⊑ B_ evaluates to 1. Finally, _I |_ = _φ ≥ l_ (resp. _I |_ = _φ ≤ u_ ) iff _I_ ( _φ_ ) _≥ l_ (respectively, _I_ ( _φ_ ) _≤ u_ ). 

For notations of specific fuzzy DLs and fuzzy OWL extension, basically, the language specifications are the usual DL/OWL notation, with the above-mentioned modifications and additions. For details and examples, you are suggested to start with [Str08], which provides a good introductory overview and has a very long list of references to start delving into the topics, and a more technical take on it is provided in [LS08]. An alternative approach is taken in [BS11] (that also describes many examples), where all the fuzzy knowledge is put in the annotations of an OWL 2 file through a Prot´eg´e plugin<sup>3</sup> and then it is either ignored by a standard reasoner or parsed and handled by the fuzzyDL<sup>4</sup> or DeLorean<sup>5</sup> reasoner. 

Fuzzy DLs can be classified according to the DL or OWL language that they extend, the allowed fuzzy constructs and the underlying fuzzy logics (notably, G¨odel, Lukasiewicz, Zadeh), and their reasoning services. Regarding the latter, because we have those special new fuzzy features in the language, we get new reasoning services with it. They are: 

   - Consistency, Subsumption, Equivalence 

   - Graded instantiation: Check if individual _a_ is an instance of class _C_ to degree at least _n_ , i.e., _KB |_ = _⟨a_ : _C, n⟩_ 

   - Best Truth Value Bound problem: determine tightest bound _n ∈_ [0 _,_ 1] of an axiom _α_ , i.e. _glb_ ( _KB, α_ ) = _sup{n, | KB |_ = _⟨α ≥ n⟩}_ (likewise for _lub_ , lowest upper bound) 

- 3available at `http://www.umbertostraccia.it/cs/software/FuzzyOWL/` in July 2018, not 

- the URL listed in the paper. 

> 4 `http://www.umbertostraccia.it/cs/software/fuzzyDL/fuzzyDL.html` 

> 5 `http://webdiis.unizar.es/~fbobillo/delorean.php` 

_10.1. Uncertainty and vagueness_ 

197 

- Best Satisfiability Bound problem: _glb_ ( _KB, C_ ) determined by the max value of _x_ s.t. ( _R, T , A ∪{a_ : _C ≥ x}_ ) (among all models, determine the max degree of truth that concept C may have over all individuals _x ∈_ ∆<sup>_I_</sup> ) 

- _glb_ ( _KB, C ⊑ D_ ) is the minimal value of _x_ such that _KB_ = ( _R, T , A ∪{a_ : _C ⊓¬D ≥_ 1 _− x}_ ) is satisfiable, where _a_ is a new individual; Therefore, the greatest lower bound problem can be reduced to the minimal satisfiability problem of a fuzzy knowledge base 

There are several fuzzy reasoners, such as the aforementioned FuzzyDL for fuzzy _SHIF_ ( _D_ ) the DeLorean reasoners. 

How does this work out practically? Given some fuzzy _SHIF_ ( _D_ ), _SHOIN_ ( _D_ ), _SROIQ_ ( _D_ ) that is serialised in OWL syntax, then one can declare the fuzzy concepts with either modifiers (e.g., very) or ‘concrete’ fuzzy concepts (e.g., Young) using data properties, where both additions have explicit membership functions. Jumping over the technicalities here, it enables one to specify fuzzy concepts as follows, using ‘minor’ and ‘young’ as examples. Just by numbers, _≤_ 18( _x_ ) over N, evaluates to true if _x ≤_ 18, false otherwise (i.e., _cr_ (0 _,_ 18)). Let’s define ‘minor’ as Minor _≡_ Person _⊓∃_ Age _.≤_ 18. Being a minor and being young is not exactly the same thing, so let’s add something new for the latter: Young : Natural _→_ [0 _,_ 1] is declared as a fuzzy datatype predicate denoting the degree of youngness, which then allows one to define ‘young’ as, say, Young(x) = ls(x _,_ 10 _,_ 30), where _ls_ is the left shoulder function (like the cold line in Figure 10.1). Then a young person may be defined as YoungPerson _≡_ Person _⊓∃_ Age _._ Young. What does the ontology entail with these axioms asserted? It entails, e.g.: 

O _|_ = Minor _⊑_ YoungPerson _≥_ 0 _._ 6, 

O _|_ = YoungPerson _⊑_ Minor _≥_ 0 _._ 4 

The values of 0.6 and 0.4 follow from the fuzzy functions, were ‘minor’ covered the age range of 0 to 18 and the young covered 0-30 age range that was going downhill with being ‘young’ from the age of 10. 

Example 9.1 describes the specification of a ‘small bladed hunting spear’ in a fuzzy way. 

#### **10.1.2 Rough ontologies** 

Rough ontologies are not an endpoint of themselves, but a means to an end—if one is lucky. If a concept turns out to be a rough concept, i.e., there are some individuals of which we don’t know whether they are instances of that concept, it means that the concept is _underspecified_ at least with respect to the properties one has represented in the ontology. More precision is good, from an ontological viewpoint at least, and rough ontologies can assist the modeller by providing an iterative way to add more properties so as to reduce the amount of uncertainty in an observable way. That is, adding more properties to the concept should lead to fewer individuals of which we don’t know whether they are instances of that concept. If adding or removing a property does not make a difference, then that property is less important than others for that specific concept. Thus is, it can 

_Chapter 10. Advanced Modelling with Additional Language Features_ 

198 



<!-- Start of picture text -->
Granule with object(s) Universe  U<br>(white squares being the negative<br>region w.r.t.  X )<br>Boundary region Bp X<br>(light green squares)<br>Upper approximation  X<br>(light + dark green squares)<br>Target set  X (oval), which is  Lower approximation  X<br>rough, i.e.,  X  = < X ,  X > (dark green squares)<br><!-- End of picture text -->

**Figure 10.2:** A rough set and associated notions (Source: based on [PS07]). 

assist in making one’s ontology more precise, be this regarding the representation only, or to press the domain expert for more subject domain details. 

Rough DLs were first introduced in [Kee10b]. As ‘roughness’ is not commonly included in undergraduate education, a brief summary (based on [Kee10b]) is provided first, before porting it to DLs and demonstrating where it solves some representation and reasoning problems. 

##### **Rough sets** 

We consider here the typical rough set model of Pawlak, which is illustrated diagrammatically in Figure 10.2. Formally, _I_ = ( _U, A_ ) is an _information system_ , where _U_ is a non-empty finite set of objects and _A_ a finite non-empty set of attributes such that for every _a ∈ A_ , we have the function _a_ : _U �→ Va_ where _va_ is the set of values that attribute _a_ can have. For any subset of attributes _P ⊆ A_ , the equivalence relation ind( _P_ ) is then defined as follows: 



which generates a partition of _U_ , denoted with _U/_ ind( _P_ ), or _U/P_ for short. If ( _x, y_ ) _∈_ ind( _P_ ), then _x_ and _y_ are _indistinguishable_ with respect to the attributes in _P_ , which is referred to as _p-indistinguishable_ . 

From those objects in _U_ , the aim is to represent set _X_ such that _X ⊆ U_ , using _P_ (with _P ⊆ A_ ). That set _X_ may not be crisp, i.e., it may include or exclude objects which are indistinguishable on the basis of the attributes in _P_ , i.e., we do not know given the attributes under consideration. This can be approximated by using a _lower_ and an _upper_ approximation, which are defined as: 



where [ _x_ ] _P_ denotes the equivalence classes of the p-indistinguishability relation. The _lower approximation_ (10.9) is the set of objects that are _positively_ members of set _X_ (more precisely: it is the union of all equivalence classes in [ _x_ ] _P_ ). The _upper approximation_ is the set of objects that are _possibly_ in _X_ and its complement, _U − PX_ , is the _negative region_ that is the union of all equivalence classes of sets 

_10.1. Uncertainty and vagueness_ 

199 

of objects that are definitely _not_ in _X_ (i.e., _¬X_ ). Then, “with every rough set we associate two _crisp_ sets, called _lower_ and _upper approximation_ ” [PS07], which is denoted as a tuple _X_ = _<u>⟨X,</u> X⟩_ . Finally, the difference between the lower and upper approximation, _BP X_ = _PX −_ _<u>P</u> X_ , is called the _boundary region_ : this region contains the objects that neither can be classified as member of _X_ nor that they are not in _X_ . It follows that if _BP X_ = _∅_ then _X_ is a crisp set with respect to _P_ and when _BP X_ = _∅_ then _X_ is rough w.r.t. _P_ , i.e., then there are indistinguishable objects. 

Given the boundary region, one can compute the _accuracy of approximation_ , _αP X_ , which indicates how well a rough set approximates the target set. There are several ways to compute it, e.g., _αP X_ =<sup>_<u>|</u>_</sup> _|_<sup>_<u>P</u>_</sup> _PXX||_<sup>or</sup><sup>_αPX_= 1</sup><sup>_−_</sup><sup>_<u>|B</u>_</sup> _|_<sup>_<u>P</u>_</sup> _U_<sup>_X_</sup> _|_<sup>_<u>|</u>_</sup> (this is a separate topic not further discussed here). Note that _<u>P</u> X ⊆ X ⊆ PX_ . There are further notions that we do not need in this summary, but are ontologically interesting: the _reduct_ and _core_ , which are the set of _sufficient_ conditions (attributes) and the set of _necessary_ conditions, respectively (still with respect to _P_ ). 

##### **Transferring rough sets into ontologies** 

In most ontology languages, there are more constructors than just attributes and ‘attributes’ may be, at least, represented with a role (object property) _R ∈R_ or value attributions (data property) _D ∈D_ , which has to be accounted for: rough set’s _P_ is thus to be taken from _R∪D_ where those attributes have the rough concept declared as domain. In addition, it requires an appropriate model-theoretic semantics for _<u>C</u>_ and _C_ as well as a ‘rough concept’, denoted here with “ _≀C_ ” to simplify notation. The semantics of the approximations can be transferred in a straightforward manner, where _E_ denotes indistinguishability (equivalence) relation (which is reflexive, symmetric, and transitive): 



Then there is rough sets’ tuple notation, _X_ = _<u>⟨X,</u> X⟩_ to transfer into DL, but a _≀C_ = _<u>⟨C,</u> C⟩_ is a rather unusual notation. Instead, one can use also two new binary relationships, dubbed _lapr_ and _uapr_ , to relate _any_ rough concept and its associated approximations, which are typed as follows: 



Note that they quantify over _sets_ , not objects that are member of the respective sets, therewith making explicit the knowledge about the three sets and how they relate. Finally, we make explicit that _≀C_ is identified by the combination of its 

200 _Chapter 10. Advanced Modelling with Additional Language Features_ 

lower and upper approximation, which the flowing axioms ensure: 

_∀φ. ≀ C_ ( _φ_ ) _→∃ψ.lapr_ ( _φ, ψ_ ) _, ∀φ. ≀ C_ ( _φ_ ) _→∃ψ.uapr_ ( _φ, ψ_ ) _, ∀φ, ψ, ϕ.lapr_ ( _φ, ψ_ ) _∧ lapr_ ( _φ, ϕ_ ) _→ ψ_ = _ϕ,_ (10.15) _∀φ, ψ, ϕ.uapr_ ( _φ, ψ_ ) _∧ uapr_ ( _φ, ϕ_ ) _→ ψ_ = _ϕ, ∀φ_ 1 _, φ_ 2 _, ψ_ 1 _, ψ_ 2 _.lapr_ ( _φ_ 1 _, ψ_ 1) _∧ uapr_ ( _φ_ 1 _, ψ_ 2) _∧ lapr_ ( _φ_ 2 _, ψ_ 1) _∧ uapr_ ( _φ_ 2 _, ψ_ 2) _→ φ_ 1 = _φ_ 2 _._ 

They say that: 1) there must be exactly one lower and one upper approximation for each rough concept, and 2) there is one rough concept for each combination of lower and upper approximation (i.e., if an approximation differs, it is a different rough concept). 

Practically within an OWL-only setting, the `C` and <u>`C`</u> is reduced to, in OWL 2 DL functional syntax: 

```
EquivalentClasses(CObjectSomeValuesFrom(a:Inda:C))
EquivalentClasses(CObjectAllValuesFrom(a:Inda:C))
```

where `Ind` denotes the indistinguishability relation. Then Eq. 10.15 is approximated by adding object properties `uapr, lapr` that have _≀_ `C` as domain, and an exactly 1 cardinality constraint: 

`ObjectPropertyDomain(a:upar a:` _≀_ `C) ObjectPropertyDomain(a:lapr a:` _≀_ `C) ObjectExactCardinality(1 a:uapr a:C) ObjectExactCardinality(1 a:lapr a:C)` 

One has to add this for each rough concept and its approximations. For instance, the promiscuous bacteria of [Kee10c]: 

PromiscuousBacterium _≡_ Organism _⊓∃_ Percentage.real _>_ 10 _⊓ ≥_ 6 hasHGTCluster.FlexibleHGTGeneCluster PromiscuousBacterium _⊑_ = 1 lapr.PromBactLapr (10.16) PromiscuousBacterium _⊑_ = 1 uapr.PromBactUapr PromBactLapr _≡∀_ Ind.PromBact PromBactUapr _≡∃_ Ind.PromBact 

Each such concept will have to be tested against the instances in the ABox: is the PromiscuousBacterium indeed a rough concept? This was experimented with in two ways: ‘natively’ in OWL files as well as in the OBDA setting (Figure 8.2 was taken from that experiment). Practically, at the time at least, putting the instances in the OWL file was a ‘bad’ idea, mainly because the reasoners are not optimised to deal efficiently with data properties, value restrictions, and instances (or: computing the rough concepts took quite some time even with just 17 individuals). The OBDA 

_10.2. Time and Temporal Ontologies_ 

201 

setting did work, but was at the time cumbersome to set up; this has improved in the meantime (see also Chapter 8). 

One can add _rough subsumption_ to rough concepts [Kee11a] as well, which is beyond the current introductory scope. 

### **10.2 Time and Temporal Ontologies** 

There are multiple requests for including a temporal dimension in OWL. Some of those requirements are described in the ontology’s annotation fields (see the OWL files of BFO and DOLCE), or the labels of the object properties in the BFO v2.1 draft, where they mention temporality that cannot be represented formally in OWL: e.g., DOLCE has a temporally indexed parthood in the paper-based version but this could not be transferred into the OWL file. This is, perhaps, even more an issue for domain ontologies. For instance, SNOMED CT [SNO12] has concepts like “Biopsy, _planned_ ”, i.e., an event is expected to happen in the future, and “Concussion with loss of consciousness for _less than one hour_ ”, i.e., a specific interval and where the loss of consciousness can be before or after the concussion, the symptom HairLoss _during_ the treatment Chemotherapy, and Butterfly is a _transformation of_ Caterpillar. Other examples are a business rule alike ‘RentalCar must be returned _before_ Deposit is reimbursed’. Adding an object property before in one’s OWL ontology is not going to ensure that in all possible models, some return event happened before a reimbursement event, however, because it does not know when what happened. 

There is no single computational solution to solve these examples all at once in another way beyond OWL. Thus far, it is a bit of a patchwork of various theories and some technologies, with, among many aspects, the Allen’s interval algebra [All83] with the core qualitative temporal relations (such as _before_ and _during_ ), Linear Temporal Logics (LTL) and Computational Tree Logics (CTL, with branching time). There is also a Time Ontology<sup>6</sup> that was recently standardised by the W3C (more explanation in [HP04]), but it is an ontology for annotations only—i.e., no temporal reasoning intended—and suffers from the class-as-instance modelling confusion<sup>7</sup> . 

In the remainder of this section, we will look at some motivations for temporal ontologies first, proceed to a very expressive temporal DL, _DLRUS_ , and finally look at several modelling issues it helps solving. Although computationally, things do not look rosy at all, it is possible to squeeze out a bit here and there, which we shall touch upon at the end. 

> 6 `http://www.w3.org/TR/owl-time/` 

> 7e.g., DayOfWeek(Friday) and, in the one for the Gregorian calendar, MonthOfYear(January): Friday does have instances, such as `Friday 6 July 2018` and `Friday 13 July 2018` , etc., and likewise for the other days and for the month instances. 

202 _Chapter 10. Advanced Modelling with Additional Language Features_ 

#### **10.2.1 Why temporal ontologies?** 

There are two principal parts to answering this question: because of _what_ we want to represent and _what_ inferencing we want to do with it. 

##### **The things to represent** 

Quite common time aspects in conceptual data modelling for information systems are the requirements to record actual dates and intervals and calendar calculations. This is not particularly relevant for a domain ontology, but it would be useful to have an ontology about such things so that the applications use the same notions and, hence, will be interoperable in that regard. 

In Chapter 6 we have seen BFO and the RO, where it was the intention by its developers to add a _precedes_ and an _immediately precedes_ relation to the OBO Foundry ontologies, which could not be done other than for annotation purposes. There are more such established qualitative temporal relations, also known as the ‘Allen relations’ or ‘Allen’s interval algebra’, after the author who gave a first systematic and formal account of them [All83], which comprise relations such as _before_ , _after_ , _during_ , _while_ , and _meet_ . Some might say they are all the temporal relations one will ever need, but one may wish to be more specific in specialised subject domains, such as a _transformation_ _~~o~~ f_ a caterpillar into a butterfly, not just that a butterfly was a caterpillar ‘before’, and one thing _developed_ _~~f~~ rom_ another thing in developmental biology. Also, the latter two are _persistent_ changes cf. permitting to go back to what it was before. 

Modellers want to do even more than that: temporalising classes and relations. The former is well-known in databases as ‘object migration’; e.g., an active project evolves to a completed project, and each divorcee in the census database must have been married before. Relation migration follows the idea of temporal classes, but applies to _n_ -ary tuples (with _n ≥_ 2); e.g. ‘during _x_ ’s lifetime, it always has _y_ as part’ and ‘every passenger that boards the plane must have checked in before departure of that flight’. 

More comprehensive and real examples, can be found in, among others, [AGK08, Kee09, KA10, SSBS09]. This is not to say that all ontologies have, or ought to have, a temporal component to represent the subject domain as accurately as possible. It depends on the use case scenarios and CQs devised for the ontology. 

##### **Temporal reasoning services** 

As with a-temporal ontologies, one would want to have the same ones for temporal ontologies, such as satisfiability checking, subsumption reasoning, and classification. Logical implications are a bit more involved; e.g., given _B ⊑ A_ , then it must be the case that objects ‘active’ (alive) in _B_ must be active in _A_ and, e.g., to come up for promotion to become a company’s manager (B), one must first exist as an employee (A) of that company. Also, an ontology should permit either a statement that ‘X must happen before Y’ or that ‘Y must happen before X’, but not both. That is, there are temporal constraints that are not permitted to be contradicted, and algorithms are needed to check for that. 

_10.2. Time and Temporal Ontologies_ 

203 

One also would want to be able to query temporal information. For instance, to retrieve the answer to “Who was the South African president after Nelson Mandela?” and “Which library books have not been borrowed in the past five years?”. This also suggests that the ‘plain’ OBDA may be extended to a temporal OBDA system; see [AKK<sup>+</sup> 17] for a recent survey. There is a range of other examples that involve time in some way in information systems, and which have been solved and implemented already, such as querying with a calendar hierarchy and across calendars and finding a solution satisfying a set of constraints for scheduling the lecture hours of a study programme; there uses are outside the scope. 

##### **Open issues** 

There are many problems that are being investigated in temporal information and knowledge processing. On the one hand, there are the modelling issues in ontology development and figuring out what temporal features modellers actually require in a temporal logic cf. the logicians deciding which temporal features a modeller gets (typically only the computational well-behaved ones), the interaction between temporal logic and temporal databases (temporal OBDA), and further investigation into the interaction between temporal DLs with temporal conceptual data modelling. This, in turn, requires one to look into the computational properties of various fragments of expressive temporal logics. More fundamental issues have to do with making choices regarding linear time vs. branching time (LTL vs CTL), endurantism vs. perdurantism (‘4D-fluents’) as was noted in Chapter 6 as a choice for foundational ontologies, and dense time vs points in time. 

#### **10.2.2 Temporal DLs** 

If one assumes that recent advances in temporal DLs may have the highest chance of making it into a temporal OWL, then the following is ‘on offer’. 

- A very expressive (undecidable) DL language is _DLRUS_ (with the _U_ ntil and _S_ ince operators), which already has been used for temporal conceptual data modelling [APS07] and for representing essential and immutable parts and wholes [AGK08], which also solves the Boxer example of Section 6.2. It uses linear time and mostly qualitative temporal constraints. 

- An inexpressive language is TDL-Lite [AKL<sup>+</sup> 07], which is a member of the DL-Lite family of DL languages (of which one is the basis for OWL 2 QL). It also uses linear time and mostly qualitative temporal constraints, but fewer of them (e.g., one can’t have temporal relations). 

- Metric temporal logic, which zooms in on quantitative temporal constraints; e.g. [BBK<sup>+</sup> 17]. 

- 4-D fluents/n-ary approach in OWL with SWRL rules [BPTA17], rather than a new language. 

_Chapter 10. Advanced Modelling with Additional Language Features_ 

204 

It is already known that _EL_<sup>++</sup> (the basis for OWL 2 EL) does not keep the nice computational properties when extended with LTL, and results with _EL_<sup>++</sup> with CTL are not out yet. If you are really interested in the topic, you may want to have a look at a survey [LWZ08] or take a broader scope with any of the four chapters from the KR handbook [vHLP08] that cover temporal knowledge representation and reasoning, situation calculus, event calculus, and temporal action logics, or the Handbook of temporal reasoning in artificial intelligence [EM05]. To give a flavour of how temporal logics may look like and what one can do with it, we shall focus on _DLRUS_ , which has been extended with temporal relations and attributes and is also used for temporal conceptual modelling (including a graphical notation in the new TREND notation [KB17]). 

##### **The** _DLRUS_ **temporal DL** 

_DLRUS_ [AFWZ02] combines the propositional temporal logic with _Since_ and _Until_ operators with the a-temporal DL _DLR_ [CDG03] and can be regarded as an expressive fragment of the first-order temporal logic _L_<sup>_{_</sup><sup>**since,until**</sup><sup>_}_</sup> [CT98, HWZ99, GKWZ03]. 

As with other _DLR_ s, the basic syntactical types of _DLRUS_ are _classes_ and _n_ -ary _relations_ ( _n ≥_ 2). Starting from a set of _atomic classes_ (denoted by _CN_ ), a set of _atomic relations_ (denoted by _RN_ ), and a set of _role symbols_ (denoted by _U_ ), we can define complex class and relationship expressions (see upper part of Figure 10.3), where the restriction that binary constructors ( _⊓, ⊔, U, S_ ) are applied to relations of the same arity, _i_ , _j_ , _k_ , _n_ are natural numbers, _i ≤ n_ , _j_ does not exceed the arity of _R_ . All the Boolean constructors are available for both class and relation expressions. The selection expression _Ui/n_ : _C_ denotes an _n_ -ary relation whose _i_ -th argument ( _i ≤ n_ ), named _Ui_ , is of type _C_ . (If it is clear from the context, we omit _n_ and write ( _Ui_ : _C_ ).) The projection expression _∃_<sup>≶</sup><sup>_k_</sup> [ _Uj_ ] _R_ is a generalisation with cardinalities of the projection operator over argument _Uj_ of relation _R_ ; the classical projection is _∃_<sup>_≥_1</sup> [ _Uj_ ] _R_ . 

The model-theoretic semantics of _DLRUS_ assumes a flow of time _T_ = _⟨Tp, <⟩_ , where _Tp_ is a set of time points and _<_ a binary precedence relation on _Tp_ , assumed to be isomorphic to _⟨_ Z _, <⟩_ . The language of _DLRUS_ is interpreted in _temporal models_ over _T_ , which are triples of the form _I_ =<sup>_._</sup> _⟨T ,_ ∆<sup>_I_</sup> _, ·_<sup>_I_(</sup><sup>_t_)</sup> _⟩_ , where ∆<sup>_I_</sup> is nonempty set of objects (the _domain_ of _I_ ) and _·_<sup>_I_(</sup><sup>_t_)</sup> an _interpretation function_ . Since the domain, ∆<sup>_I_</sup> , is time independent, we assume here the so called _constant domain assumption_ with _rigid designator_ —i.e., an instance is _always_ present in the interpretation domain and it identifies the same instance at different points in time. The interpretation function is such that, for every _t ∈T_ (a shortcut for _t ∈Tp_ ), every class _C_ , and every _n_ -ary relation _R_ , we have _C_<sup>_I_(</sup><sup>_t_)</sup> _⊆_ ∆<sup>_I_</sup> and _R_<sup>_I_(</sup><sup>_t_)</sup> _⊆_ (∆<sup>_I_</sup> )<sup>_n_</sup> . The semantics of class and relation expressions is defined in the lower part of Fig. 10.3, where ( _u, v_ ) = _{w ∈T | u < w < v}_ . For classes, the temporal operators ♦<sup>+</sup> (some time in the future), _⊕_ (at the next moment), and their past counterparts can be defined via _U_ and _S_ : ♦<sup>+</sup> _C ≡⊤U C_ , _⊕ C ≡⊥U C_ , etc. The operators □<sup>+</sup> (always in the future) and □<sup>_−_</sup> (always in the past) are the duals of ♦<sup>+</sup> (some time in the future) and ♦<sup>_−_</sup> (some time in the past), respectively, i.e., □<sup>+</sup> _C ≡¬_ ♦<sup>+</sup> _¬C_ 

_10.2. Time and Temporal Ontologies_ 

205 

_C → ⊤| ⊥| CN | ¬C | C_ 1 _⊓ C_ 2 _| C_ 1 _⊔ C_ 2 _| ∃_<sup>≶</sup><sup>_k_</sup> [ _Uj_ ] _R |_ ♦<sup>+</sup> _C |_ ♦<sup>_−_</sup> _C |_ □<sup>+</sup> _C |_ □<sup>_−_</sup> _C | ⊕ C | ⊖ C | C_ 1 _U C_ 2 _| C_ 1 _S C_ 2 _R → ⊤n | RN | ¬R | R_ 1 _⊓ R_ 2 _| R_ 1 _⊔ R_ 2 _| Ui/n_ : _C |_ ♦<sup>+</sup> _R |_ ♦<sup>_−_</sup> _R |_ □<sup>+</sup> _R |_ □<sup>_−_</sup> _R | ⊕ R | ⊖ R | R_ 1 _U R_ 2 _| R_ 1 _S R_ 2 

_⊤_<sup>_I_(</sup><sup>_t_)</sup> = ∆<sup>_I_</sup> ; _⊥_<sup>_I_(</sup><sup>_t_)</sup> = _∅_ ; _CN_<sup>_I_(</sup><sup>_t_)</sup> _⊆⊤_<sup>_I_(</sup><sup>_t_)</sup> ; ( _¬C_ )<sup>_I_(</sup><sup>_t_)</sup> = _⊤_<sup>_I_(</sup><sup>_t_)</sup> _\ C_<sup>_I_(</sup><sup>_t_)</sup> ; ( _C_ 1 _⊓ C_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _C_ 1<sup>_I_(</sup><sup>_t_)</sup> _∩ C_ 2<sup>_I_(</sup><sup>_t_)</sup> ; ( _C_ 1 _⊔ C_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _C_ 1<sup>_I_(</sup><sup>_t_)</sup> _∪ C_ 2<sup>_I_(</sup><sup>_t_)</sup> ; ( _∃_<sup>≶</sup><sup>_k_</sup> [ _Uj_ ] _R_ )<sup>_I_(</sup><sup>_t_)</sup> = _{ d ∈⊤_<sup>_I_(</sup><sup>_t_)</sup> _| ♯{⟨d_ 1 _, . . . , dn⟩∈ R_<sup>_I_(</sup><sup>_t_)</sup> _| dj_ = _d}_ ≶ _k}_ ; ( _C_ 1 _U C_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _{ d ∈⊤_<sup>_I_(</sup><sup>_t_)</sup> _| ∃v > t_ **.** ( _d ∈ C_ 2<sup>_I_(</sup><sup>_v_)</sup> _∧∀w ∈_ ( _t, v_ ) **.** _d ∈ C_ 1<sup>_I_(</sup><sup>_w_)</sup> ) _}_ ; ( _C_ 1 _S C_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _{ d ∈⊤_<sup>_I_(</sup><sup>_t_)</sup> _| ∃v < t_ **.** ( _d ∈ C_ 2<sup>_I_(</sup><sup>_v_)</sup> _∧∀w ∈_ ( _v, t_ ) **.** _d ∈ C_ 1<sup>_I_(</sup><sup>_w_)</sup> ) _}_ ; ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _⊆_ (∆<sup>_I_</sup> )<sup>_n_</sup> ; _RN_<sup>_I_(</sup><sup>_t_)</sup> _⊆_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> ; ( _¬R_ )<sup>_I_(</sup><sup>_t_)</sup> = ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _\ R_<sup>_I_(</sup><sup>_t_)</sup> ; ( _R_ 1 _⊓ R_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _R_ 1<sup>_I_(</sup><sup>_t_)</sup> _∩ R_ 2<sup>_I_(</sup><sup>_t_)</sup> ; ( _R_ 1 _⊔ R_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _R_ 1<sup>_I_(</sup><sup>_t_)</sup> _∪ R_ 2<sup>_I_(</sup><sup>_t_)</sup> ; ( _Ui/n_ : _C_ )<sup>_I_(</sup><sup>_t_)</sup> = _{⟨d_ 1 _, . . . , dn⟩∈_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _| di ∈ C_<sup>_I_(</sup><sup>_t_)</sup> _}_ ; ( _R_ 1 _U R_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _{⟨d_ 1 _, . . . , dn⟩∈_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _| ∃v > t_ **.** ( _⟨d_ 1 _, . . . , dn⟩∈ R_ 2<sup>_I_(</sup><sup>_v_)</sup> _∧∀w ∈_ ( _t, v_ ) **.** _⟨d_ 1 _, . . . , dn⟩∈ R_ 1<sup>_I_(</sup><sup>_w_)</sup> ) _}_ ; ( _R_ 1 _S R_ 2)<sup>_I_(</sup><sup>_t_)</sup> = _{ ⟨d_ 1 _, . . . , dn⟩∈_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _| ∃v < t_ **.** ( _⟨d_ 1 _, . . . , dn⟩∈ R_ 2<sup>_I_(</sup><sup>_v_)</sup> _∧∀w ∈_ ( _v, t_ ) **.** _⟨d_ 1 _, . . . , dn⟩∈ R_ 1<sup>_I_(</sup><sup>_w_)</sup> ) _}_ ; (♦<sup>+</sup> _R_ )<sup>_I_(</sup><sup>_t_)</sup> = _{⟨d_ 1 _, . . . , dn⟩∈_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _| ∃v > t_ **.** _⟨d_ 1 _, . . . , dn⟩∈ R_<sup>_I_(</sup><sup>_v_)</sup> _}_ ; ( _⊕ R_ )<sup>_I_(</sup><sup>_t_)</sup> = _{⟨d_ 1 _, . . . , dn⟩∈_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _| ⟨d_ 1 _, . . . , dn⟩∈ R_<sup>_I_(</sup><sup>_t_+1)</sup> _}_ ; (♦<sup>_−_</sup> _R_ )<sup>_I_(</sup><sup>_t_)</sup> = _{⟨d_ 1 _, . . . , dn⟩∈_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _| ∃v < t_ **.** _⟨d_ 1 _, . . . , dn⟩∈ R_<sup>_I_(</sup><sup>_v_)</sup> _}_ ; ( _⊖ R_ )<sup>_I_(</sup><sup>_t_)</sup> = _{⟨d_ 1 _, . . . , dn⟩∈_ ( _⊤n_ )<sup>_I_(</sup><sup>_t_)</sup> _| ⟨d_ 1 _, . . . , dn⟩∈ R_<sup>_I_(</sup><sup>_t−_1)</sup> _}._ 

**Figure 10.3:** Syntax and semantics of _DLRUS_ . 

and □<sup>_−_</sup> _C ≡¬_ ♦<sup>_−_</sup> _¬C_ , for both classes and relations. The operators ♦<sup>_∗_</sup> (at some moment) and its dual □<sup>_∗_</sup> (at all moments) can be defined for both classes and relations as ♦<sup>_∗_</sup> _C ≡ C ⊔_ ♦<sup>+</sup> _C ⊔_ ♦<sup>_−_</sup> _C_ and □<sup>_∗_</sup> _C ≡ C ⊓_ □<sup>+</sup> _C ⊓_ □<sup>_−_</sup> _C_ , respectively. 

A _DLRUS knowledge base_ is a finite set Σ of _DLRUS_ axioms of the form _C_ 1 _⊑ C_ 2 and _R_ 1 _⊑ R_ 2, with _R_ 1 and _R_ 2 being relations of the same arity. An interpretation _I_ satisfies _C_ 1 _⊑ C_ 2 ( _R_ 1 _⊑ R_ 2) if and only if the interpretation of _C_ 1 ( _R_ 1) is included in the interpretation of _C_ 2 ( _R_ 2) at _all time_ , i.e., _C_ 1<sup>_I_(</sup><sup>_t_)</sup> _⊆ C_ 2<sup>_I_(</sup><sup>_t_)</sup> ( _R_ 1<sup>_I_(</sup><sup>_t_)</sup> _⊆ R_ 2<sup>_I_(</sup><sup>_t_)</sup> ), for all _t ∈T_ . Thus, _DLRUS_ axioms have a global reading. To see examples on how a _DLRUS_ knowledge base looks like we refer to the following sections where examples are provided. 

##### **Modelling** 

Let us look at some examples, both in shorthand _DLRUS_ notation and in their semantics. The second line provides a verbalisation of the axiom, using the CNL approach described in Section 9.2, but then tailored to verbalising the temporal features. 

- MScStudent _⊑_ ♦<sup>_∗_</sup> _¬_ MScStudent 

_Chapter 10. Advanced Modelling with Additional Language Features_ 

206 

_Each_ MSc Student _is not a(n)_ MSc Student _for some time_ . 

- marriedTo _⊑_ ♦<sup>_∗_</sup> _¬_ marriedTo 

_The objects participating in a fact in_ Person married to Person _do_ not _relate through_ married-to _at some time_ ; or: people who are married now aren’t married at another time. 

– _o ∈ Academic_<sup>_I_(</sup><sup>_t_)</sup> _∧ o ∈/ PhDStudent_<sup>_I_(</sup><sup>_t_)</sup> _∧ o ∈ PhDStudent_<sup>_I_(</sup><sup>_t−_1)</sup> _∧ o ∈/ Academic_<sup>_I_(</sup><sup>_t−_1)</sup> 

_A(n)_ Academic _may have been a(n)_ PhD Student _before, but is not a(n)_ PhD Student _now_ . 

– _o ∈ Frog_<sup>_I_(</sup><sup>_t_)</sup> _→∃t_<sup>_′_</sup> _< t.o ∈_ Dev<sup>_I_</sup> _Tadpole,Frog_<sup>(</sup><sup>_t′_)</sup> _Each_ Frog _was a(n)_ Tadpole _before, but is not a(n)_ Tadpole _now_ . 

The aforementioned ‘planned’ biopsy can now also be represented as something that will hold in the future ♦<sup>+</sup> Biopsy and the returning (of the car) before the reimbursement (of the deposit) as, e.g., reimbursement _⊑_ ♦<sup>_−_</sup> return, i.e., “if reimbursement, then sometime in the past there was a return”. 

With this machinery, one can also solve the “Assuming boxers must have their own hands and boxers are humans, is Hand part of Boxer in the same way as Brain is part of Human?” that we have encountered in Section 6.2. Recasting this problem into the temporal dimension, we can encode it in _DLRUS_ and prove the correctness of the intended behaviour [AGK08]. The hand being part of the boxer is an _immutable_ parthood, whereas the brain being part of the human is an _essential_ parthood. That is: the ‘essential’ parthood relation means, informally, that ‘that specific object must be part of the whole for entire lifetime of the whole object’, whereas ‘immutable’ means, informally, ‘for the time the objects are instance of that specific class (which is typically a role they play for some duration that is less that the lifetime of the object), it is essential’. The formal apparatus is quite lengthy, including recasting OntoClean’s rigidity (recall Section 5.2.2) into the temporal modality, and is described in detail in [AGK08]. The short version showing the main axioms that represent that difference is as follows. First, for illustrative purpose, let’s introduce a part-whole relation to relate brain to human: 

##### HumanBrainPW _⊑_ PartWhole 

##### HumanBrainPW _⊑_ part : Brain _⊓_ whole : Human 

Subsequently, we add the ‘essential’ to it, which means it holds _at all times_ , i.e., □<sup>_∗_</sup> , for both human (once a human always a human for the whole lifetime of the object—it is a _rigid_ property) and the essential parthood (once a part, always a part): 

##### Human _⊑_ □<sup>_∗_</sup> Human 

##### Human _⊑∃_ [whole]□<sup>_∗_</sup> HumanBrainPW 

Then, the boxer’s hands. Also here, for illustrative purpose, we introduce the part-whole relation HumanHandPW to relate the hand to human: 

_10.3. Exercises_ 

207 

HumanHandPW _⊑_ PartWhole 

HumanHandPW _⊑_ part : Hand _⊓_ whole : Human 

To state that a boxer is at some time not (♦<sup>_∗_</sup> _¬_ ) a boxer (an _anti-rigid_ property), and is a human, the following axioms suffice: 

Boxer _⊑_ ♦<sup>_∗_</sup> _¬_ Boxer 

Boxer _⊑_ Human 

The next step is the cardinality constraint that a boxer must have exactly two hands, if temporarily something is wrong with the boxer (e.g., the boxer has an injured hand for some time) he isn’t a boxer either (‘suspended’), and finally, that if that part-whole relation does not hold anymore (‘disabled’), then the boxer ceases to be a boxer: 

Boxer _⊑∃_<sup>=2</sup> [whole]HumanHandPW 

Suspended-HumanHandPW _⊑_ whole : Suspended-Boxer 

Disabled-HumanHandPW _⊑_ whole : Disabled-Boxer 

Note that ‘suspended’ and ‘disabled’ are names for so-called _status relations_ that are defined formally in [AGK08] and do not exactly have their colloquial meaning. If the boxer has to be continuously active by some rule from, say, the boxing association, then the ‘suspended’ axiom has to replaced by the following one, i.e., the relation is not allowed to be ‘suspended’: 

Suspended-HumanHandPW _⊑⊥_ 

Obviously, this can be defined for any essential or immutable relation, regardless whether it is a part-whole relation or not. The upside is that now we know how to represent it; the downside is that it uses both DL role hierarchies and temporal relations, which are computationally costly. What to do with this insight is something that a modeller has to decide. 

### **10.3 Exercises** 

**Review question 10.1.** What is the difference between uncertainty and vagueness? 

**Review question 10.2.** Name some examples of fuzzy concepts. 

**Review question 10.3.** Rough ontologies contain rough concepts. Describe how they are approximated in an OWL ontology. 

**Review question 10.4.** Name two conceptually distinct ways how time can be dealt with in/with ontologies. 

**Review question 10.5.** The introductory paragraph of Section 10.1 lists a series of examples. State for each whether it refers to uncertainty or vagueness. 

_Chapter 10. Advanced Modelling with Additional Language Features_ 

208 

**Exercise 10.1.** Devise an example similar to the ‘minor’ and ‘young’, but then for ‘senior citizen’, ‘old’ and ‘old person’. Compare this with another student. How well do you think fuzzy ontologies will fare with respect to 1) ontologies _in_ information systems and 2) the original aim of ontologies _for_ information systems? * 

**Exercise 10.2.** There are a few temporal reasoners for DLs and OWL. Find them (online) and assess what technology they use. As to the temporal things one can model, you may want to try to find out as follows: define a small example and see whether it can be represented and the deductions obtained in each of the tools. * 

**Exercise 10.3.** The Time Ontology was standardised recently. Inspect it. Can this be a viable alternative to _DLRUS_ ? * 

**Exercise 10.4.** BFO draft v2.1 has all those indications of time in the names of the object properties. Compare this to the Time Ontology and something like _DLRUS_ or TDL-Lite. What would your advice to its developers be, if any? 

### **10.4 Literature and reference material** 

##### **Suggested readings for fuzzy and rough ontologies:** 

1. Thomas Lukasiewicz and Umberto Straccia. 2008. Managing Uncertainty and Vagueness in Description Logics for the Semantic Web. _Journal of Web Semantics_ , 6:291-308. NOTE: only the section on fuzzy ontologies 

2. Umberto Straccia and Giulio Visco. DLMedia: an Ontology Mediated Multimedia Information Retrieval System. In: _Proceedings of the International Workshop on Uncertainty Reasoning for the Semantic Web (URSW-08)_ , 2008. this is an example of an application that uses fuzzy DL 

3. Keet, C.M. On the feasibility of Description Logic knowledge bases with rough concepts and vague instances. _23rd International Workshop on Description Logics (DL’10)_ , 4-7 May 2010, Waterloo, Canada. 

##### **Suggested readings for temporal ontologies:** 

1. Alessandro Artale, Christine Parent, and Stefano Spaccapietra. Evolving objects in temporal information systems. _Annals of Mathematics and Artificial Intelligence (AMAI)_ , 50:5-38, 2007. NOTE: only the _DLRUS_ part, the rest is optional. 

2. J. R. Hobbs and F. Pan. An ontology of time for the semantic web. _ACM Transactions on Asian Language Processing (TALIP): Special issue on Temporal Information Processing_ , 3(1):6685, 2004. 

Optional readings with more technical details (in descending order of being optional): 

1. Artale, A., Guarino, N., and Keet, C.M. Formalising temporal constraints on part-whole relations. _11th International Conference on Principles of Knowledge Representation and Reasoning (KR’08)_ . Gerhard Brewka, Jerome Lang (Eds.) AAAI Press, pp 673-683. Sydney, Australia, September 16-19, 2008. 

_10.4. Literature and reference material_ 

209 

2. Alessandro Artale, Enrico Franconi, Frank Wolter and Michael Zakharyaschev. A Temporal Description Logic for Reasoning over Conceptual Schemas and Queries. In: _Proceedings of the 8th European Conference on Logics in Artificial Intelligence (JELIA’02)_ , Cosenza, Italy, September 2002. LNAI, SpringerVerlag. 

3. Alessandro Artale, Roman Kontchakov, Carsten Lutz, Frank Wolter and Michael Zakharyaschev. Temporalising Tractable Description Logics. In: _Proc. of the 14th International Symposium on Temporal Representation and Reasoning (TIME’07)_ , Alicante, June 2007. 

### CHAPTER 11 

### Ontology modularisation 

Ontology development is a laborious task. To assist with this, modularisation is a principle that has been proposed and increasingly been used for ontology development. Modularisation refers to the division of an ontology to aid with the simplification of large ontologies. It is required when one needs to hide or remove knowledge that is not required for the application at hand, or divided so that modules can be worked on separately. It does the former by enabling developers and users to hide or remove entities and axioms that are not relevant for the application. There are a number of benefits for the modularisation of ontologies such as ontology reuse, collaboration, and scalability for data processing. 

There are multiple angles from which to present ontology modularisation, which cannot all be covered in the 10-15 pages that a chapter typically is in Block III. Here, we take the angle of foundations for ontology development, rather than a logic-based angle to the issues, which is partially so that we then also can touch upon the notion of evaluation metrics. The other reason is that the content is based on parts of the PhD thesis of Zubeida Khan, who is the main author of this chapter (and who was supervised by the main author of this textbook). 

We will start with a motivating example and a definition of a module. Subsequently, we look at the various ‘dimensions’ of modules, i.e., aspects to features that help describe modules, and close with a framework for modularisation. 

### **11.1 Defining modularisation** 

Let us start with a use case example, which illustrates the need for modularisation, which is followed by several questions that will have to be answered. 

**Example 11.1.** _Consider a case where an ontology engineer wishes to develop an enterprise web application for an exciting book store. In order to compete with existing exciting interactive web utilities such as Pottermore which engages_ 

211 

_Chapter 11. Ontology modularisation_ 

212 

_and challenges Harry Potter fans_<sup>1</sup> _, a simple website is not enough. The developer needs to create an interactive experience aimed at book fandoms_<sup>2</sup> _. Furthermore, the book store application must be machine readable in order to realise the vision of the Semantic Web. Rather than unnecessarily starting from scratch, the ontology developer decides to reuse existing resources from the web._ 

_She has found the following existing resources: a general book ontology containing metadata about books such as authors, edition, etc., a Japanese anime ontology, containing a large amount of data about anime such as genre, protagonists, mangaka, etc., a toy ontology which contains toy product details, and a gazetteer ontology describing different places of geographical interest._ 

_For the Japanese anime ontology, she wishes only to use parts of the ontology that contains information about anime that have originated from manga and novels. The taxonomy of the anime ontology is large, complicated, and too difficult for the developer to manually traverse through the entire ontology and understand it. For the toy ontology, there are two main branches, a Toy entity with subclasses such as Book-toy, Game-toy, Movie-toy etc. , and a Toy-property entity containing knowledge about the properties of a toy, e.g., height, weight, colour, etc. The developer wishes to extract only the specific Book-toy entity and the generalised Toy-property entity. She wishes to use the gazetteer ontology to describe both fictional and real places that appear in books. The gazetteer ontology has a high level of detail and contains knowledge about the population of each city, neighbouring countries, the size of the country, etc. However, the developer does not require the high level of detail of the ontology, but rather a simplified version._ 

_The developer decides that the manga and novel aspects of the anime ontology could be imported into the general book ontology. The toy ontology, however, should be separate from the book ontology, to allow toy specialists to update it separately. The gazetteer ontology should also be a separate module. By creating separate modules, the developer hopes to promote collaborative ontology development within a team and ease the validity and maintenance of the system. While the toy and gazetteer ontology are separate modules, they are also related to the book ontology, i.e., there should be axioms that link the modules. For instance, for the toy ontology, it could be that a scaled figure of Katniss Everdeen is based on the character, Katniss Everdeen, from the Hunger Games trilogy book series. For the geographical ontology, it could be that Alicante is the city that exists in the Mortal Instruments book series._ 

This example opens up a number of questions for the developer. How should the developer extract reading material aspects from the anime ontology without traversing through the entire ontology? How should the developer isolate the Booktoy and Toy-property entities from the toy ontology? How should the developer simplify the geographical ontology? It is true that there are existing ontology modularity techniques. However, which technique, if any, will be able to perform the aforementioned tasks. It is clear that the processes of extracting reading ma- 

> 1 `https://www.pottermore.com/` last accessed: 20 September 2019. 

> 2A fandom is a term used to describe fans who share a common interest such as the Harry Potter community, the Pok´emon community, the Doctor Who community, and so on. 

_11.2. Module dimensions_ 

213 

terial aspects, isolating branches of interest, and taxonomy simplification are all different. Once the developer creates these modules, how should she measure the quality of these modules, considering that these modules have different properties? 

Before we start answering these questions, we need a definition of modules first, to indicate when is really meant with it here. There are several definitions of modularisation and modules in the literature. We use the most recent one that is exhaustive and does not enforce restrictions, such as that a module must exist in a set that composes a whole, or that it must contain a source ontology, or that it captures the knowledge of a given signature. The definition for a module we use is as follows: 

**Definition 11.1.** _(Module ([KK15b])) A_ Module _M is a subset of a source ontology O, M ⊂ O, or M is an ontology existing in a set such that, when combined, make up a larger ontology. M is created for some use-case u ∈ U , number of u ≥_ 1 _, and is of a particular type t ∈ T , number of t_ = 1 _. t is classified by a set of distinguishing properties {p_ 1 _, ..., pk} ∈ P , number of p ≥_ 1 _, and is created by using a specific modularisation technique mt ∈ MT , number of mt_ = 1 _, and has a set of corresponding evaluation metrics {em_ 1 _, ..., emk} ∈ EM , number of em ≥_ 1 _, which is used to assess the quality of M ._ 

This definition introduces _dimensions_ for modularisation: use-cases, techniques, properties, and evaluation criteria. The inclusion of these dimensions in the definition contributes to an exhaustive, generic, broad definition for modules. In the following section we introduce the dimensions for modularisation. 

### **11.2 Module dimensions** 

Module dimensions are aspects or features that help describe modules. Five dimensions have been identified for modules: use-cases, techniques, types, properties, and evaluation criteria. They will be described in the following five subsections, since each dimension has one or more ‘types’ or values. Afterward, we will tie the components together in a framework, which systematises dependencies between dimensions. 

#### **11.2.1 Use-cases** 

In the substantial amount of literature on modularisation, use-cases have commonly been referred to as purposes, goals, benefits or rationale for modularity. A use-case states the underlying reason why the module will is, is, or has been created. We discuss all known existing use-cases for modularisation in this section. 

**Maintenance** An important step in the ontology development process is the maintenance of an ontology. Maintenance deals with preserving the quality of an ontology to foster and ensure usage. Modules are constantly evolving and need to be maintained on a regular basis. Maintenance is easier to perform when there are separate modules because not all modules might need to be updated, and different people could maintain different modules. 

_Chapter 11. Ontology modularisation_ 

214 

**Automated reasoning** Since ontology reasoners do not scale well when reasoning over large ontologies, reasoning is the next use-case for modularisation. Reasoner performance improves when ontologies are smaller with less knowledge, and one could try to optimise it by reasoning only over the module that has changed rather than the whole ontology. The Data Mining OPtimisation ontology (DMOP), which we have come across in Chapter 1 (Figure 1.10), takes about 10 minutes to classify [KdKL14]. It will be worthwhile to investigate whether modularisation could result in reduced reasoning time. 

**Validation** Validation deals with checking an ontology for correctness. This is performed by checking for errors and redundancy, and checking if an ontology meets all requirements. This is a difficult process for a human when an ontology is large, hence the need for modularisation. 

**Processing** Processing tools such as ontology alignment, computing of metrics, and editing tools prohibitively slow down when working with large ontologies; they could take several minutes to perform simple tasks such as loading and traversal. Smaller modules take a shorter time to open, load, and use with tools, and hence could possibly improve the performance of the processing tools. 

**Comprehension** There is a cognitive overload for humans to use and understand large ontologies, therefore to ease comprehension, it is required that some data be hidden or removed. This can be achieved with modularisation. 

**Collaborative efforts** This is when several people need to work together for the ontology development task. Modularisation promotes dividing the development task among several people, and helps to achieve consistency such that there is no conflict whereby the same ontology is altered by different people. 

**Reuse** At times, ontology users or developers require a subset of an ontology pertaining to a specific topic, and not the entire ontology. Modular ontologies are created such that ontology modules can be easily extracted and reused for the application at hand. 

#### **11.2.2 Types** 

Ontology modules can be classified into different types, based on the nature of the module. There are four main types pertaining to their function, structure, abstraction, and expressiveness, which is exhaustive at the time of writing. They each have several subtypes, which we summarise here. 

**Functional** These are modules whereby a large domain is split into modules to represent various subject domains or functions. Currently, there are five types of modules with a specific function: 

_11.2. Module dimensions_ 

215 

- Ontology design patterns: An ontology is modularised by identifying a portion that can be easily reused to solve recurring ontology issues, i.e., an ontology design pattern (recall Section 7.6) is created. 

- Subject domain modules: There are various sub-domains in an ontology, hence the ontology is modularised or split up into modules for each subdomain; e.g., to create a separate module for the habitats of animals that then can be imported into the AWO. 

- Isolation branch modules: A subset of entities from an ontology is extracted given an input entity as a starting point; e.g., extracting all endurants from DOLCE but not the rest. Entities with weak dependencies to the input entities are excluded from the extracted module. 

- Locality modules: A subset of entities from an ontology is extracted given an input entity as a starting point. All entities, including those with weak dependencies to the input entity, are included in the extracted module. 

- Privacy modules: Some sensitive information is removed from an ontology in order to preserve the privacy of information for a particular application, or from certain users. 

**Structural** These modules are generated motivated by the syntax, or structure of the ontology. This includes modules for domain coverage, ontology matching, and to optimise reasoning. For the first, domain coverage modules: an ontology covers a domain, so it is modularised structurally by placement of entities in the taxonomy such that similar size modules could be generated and such that the set of generated modules collectively cover the domain. For instance, the Foundational Model of Anatomy [RMJ03] contains over 100 000 entities describing human anatomy exhaustively. This could be modularised structurally for ease of use. Ontology matching modules concern the case where an ontology is modularised specifically for the ontology matching process. The ontology should be modularised into disjoint partitions so there is no repetition of entities, so as to promote ontology matching. For instance, the Common Anatomy Reference Ontology (CARO) [HNOS<sup>+</sup> 08] aims to align existing anatomy ontologies. To assist with aligning it to domain ontologies, CARO could be partitioned into smaller modules. Finally, the optimal reasoning modules may be created form a larger ontology to promote efficient reasoning. 

**Abstraction** These are modules that are simpler or lighter than an original ontology due to hiding or deleting some detail. This hiding or deleting can be done systematically in different ways. We describe four options. First, one could create an abstraction module by targeting certain axioms; e.g., axioms that relate classes using object properties are removed. This results in a module with a decreased horizontal structure. Alternatively, one can create vocabulary abstraction modules, resulting from removing a certain type of entity from an ontology; e.g., the removal of individuals from an ontology. A computationally easier way of creating abstraction modules are high-level abstraction modules: entities that exist at a lower level in the hierarchy of the ontology, i.e., the more specific entities, are to 

_Chapter 11. Ontology modularisation_ 

216 

be removed. This results in a module with the higher-level entities of the ontology. Conversely, a more refined and elaborate way is to create weighted modules, where some entities are deemed more important than others in an ontology. The importance may be specified by the developer’s preference in preserving entities. 

**Expressiveness** There are modules that are created by altering a module’s language expressive power. This then has an effect on what is represented in the ontology. There are two types: sub-language and feature modules. For sub-language modules, a module is created based on only prioritising the features of a sublanguage e.g., only preserving the axioms of an ontology that are OWL 2 EL. An example is OpenGalen [RRZvdH03], which is a module of GALEN in OWL 2 EL for the purpose of testing the lightweight ELK [KKS12] reasoner for ontologies within OWL 2 EL expressiveness. With feature modules, a module is created by limiting the language features but not based on a specific sub-language. For instance, the removal of cardinality constraints for simplification purposes. 

#### **11.2.3 Properties** 

Different motivations, or aims, for modules and different types give rise to a range of properties that modules may have and that can be measured or identified qualitatively. Such properties that are associated with them gives the user more information about the modules. This may be of the module itself or of a set of modules. 

**Properties of a module** These are properties that a module exhibits by itself. There are at least seven such properties: 

- Seed signature: For this module, a user has provided an input entity to base the module on. 

- Information removal: Some information from an ontology is to be removed, resulting in a module with less detail than the original ontology. This relates back to the types of module already: abstraction. An example is the NCS ontology with information noun classes of the about Niger-Congo B languages [CK15]: it reuses only part of the GOLD ontology, because it has no need for language features such as phonetic properties of a word. On the one hand, one can have a so-called breadth abstraction, where the property of hiding some of the relational properties of the ontology is used to decrease the ‘breadth’ of the module and, on the other hand, there is depth abstraction, referring to the property of hiding some of the lower level classes of the ontology to decrease the ‘depth’ of the module. 

- Refinement: New axioms are added to an ontology. Modules are typically not created with new knowledge hence this occurs in cases such as the creation of inter-module links, as a result of ontology processing tools, or when computationally-expensive ontology language features are altered. A concrete example that reduced reasoning time was by removing the InverseObjectProperties axioms and replacing it with the OWL ObjectInverseOf in the DMOP ontology [KdKL14]. 

_11.2. Module dimensions_ 

217 

- Stand-alone: This describes a module that can exist on its own and does not have dependencies to other ontologies or modules. For instance, the BioTopLite module [SB13] was extracted from the source, which is the topdomain level ontology for the life sciences BioTop (recall its architecture from Figure 7.4). BioTopLite is self-standing in the sense that it does not have inter-module relations to other ontologies and it does not contain import statements either. 

- Source ontology: This is the original ontology that the user selects to modularise. 

- Proper subset: This describes a module that is smaller than its source ontology, as it contains a subset of the entities of the source ontology. 

- Imports: This is a module that contains knowledge from other ontologies by using the import function of the OWL language. 

Not all modules will have all these properties; e.g, a module can not be both the source an a proper subset of itself. One may encounter complex combinations to manage, such as where there is an import and subsequent abstraction over the merged ontology. 

**Properties of a set of modules** These are properties that exist in a set of related modules. 

   - Overlapping: This occurs when the same entity/ies extend over more than one modules in a set of modules. 

   - Mutual exclusion: This occurs when an entity/ies does not extend over more than one module in a set of modules. The modules share no common entities. 

   - – Union equivalence: The union, or the set of all entities of the modules is semantically equivalent to the original ontology. 

   - Partitioning: This describes the structural division of a large ontology into modules. 

   - Inter-module interaction: When there are links to other modules in the set of modules to preserve the knowledge of the original ontology. 

   - Pre-assigned number of modules: This occurs when the number of modules to be created is known at the onset of the module generation. 

   - The modules can be annotated with such properties and some may be computed. 

- For instance, annotating a module with the source ontology it was extracted from and computing overlap between two modules by using the axioms and vocabulary (provided that the URI is still the same). 

#### **11.2.4 Techniques** 

A range of techniques have been proposed to actually create or generate modules from ontologies. We zoom in on three categories of algorithms: graph-based ones, statistical approaches, and, for the lack of a better term, ‘semantic’ approaches. 

**Graph theory approaches** This set of techniques are based on graph theory whereby the classes in the ontology are represented by vertices and the OWL object properties are represented by edges. Then one can pick a graph-based algorithm to 

_Chapter 11. Ontology modularisation_ 

218 

compute the desired outcome. For instance, in graph partitioning, a large ontology is divided structurally such that vertices (entities) are not shared among partitions (modules). Modularity maximisation uses some modularity function to measure the axiomatic relations of entities resulting in modules, such as optimising the connection between nodes in graphs. Also, one could use clique detection to find sections of an ontology that may be safely removed. 

**Statistical approaches** This includes Hierarchical clustering, which is a method of grouping together data (entities) by building a hierarchy of clusters. 

**Semantic approaches** These techniques are based more on the meaning of the ontology, which can be both logic-based using the axioms as input or a user provides subject domain semantics input to guide the modularisation process. For instance, there is so-called locality modularity, which is a method to create modules based on an input entity/ies with the condition that ‘conservation extension’ holds for the given module, i.e., the meaning of every axiom from the original ontology is preserved, and is thus a logic-based approach. A combination of that and user input is query-bases modularity, where the ontology developer creates a query using a query language such as SPARQL to base a module on. Even more user input is expected in semantic-based abstractions. Here, the subject domain semantics of an ontology is analysed and rules are used to prioritise certain entities in an ontology to be included in a resultant module. 

Further down the road of more user input is the _A priori_ modularity: the modular structure of the domain is decided upfront so that the modules are created initially without a need for an original ontology. This one can do also manual from a source ontology, called manual modularity, where the ontology developer analyses an existing ontology to manually select which entities and axioms should be removed from it to create a specific module. 

Finally, there is language simplification, where some axioms based on language features are removed from an ontology resulting in a simplified module with limited language expressivity. One may argue that it is a semantics-based approach or syntax-based, depending on how it is carried out. One could forcefully implement it though syntactic analysis without remodelling or try to add approximations for the axioms slated for removal. For instance, if _C ⊑_ = 2 _R.D_ (qualified cardinality) is disallowed, as it is in OWL DL, then a rough technique could just delete that axioms, whereas an approximator might replace it with the _C ⊑∃R.D_ or _C ⊑_ = 2 _R.⊤_ . Such an approximations strategy will not help with reducing the size of the ontology, however, and thus not lead to the desired effect of a smaller ontology. This brings us to the next topic: how to evaluate the module created or generate is any good? 

#### **11.2.5 Evaluation metrics** 

With multiple techniques and use cases for devising modules, the outcome of some modularisation is unlikely to be the same sort of module, and for the same use case, there may be different techniques to accomplish it with varying levels of success. 

_11.2. Module dimensions_ 

219 

This requires a notion of being able to specify what a ‘good’ module is. When one tries to modularise an ontology, and one module has 95% of the content of the source ontology and the other module has the other the remaining 5%, then clearly that doesn’t help much. But should it be 50-50 in all cases? Probably not, and it may not be relevant to some type of modules anyway (e.g., when one wants to end up with a bare taxonomy). More broadly, this relates to some extent also to metrics for ontologies, not just their modules. 

In order to get to the stage of determining whether a module is good or not, we first need a set of criteria. Ideally, one would be able to compute automatically the values of those criteria, and then some way to deter mine which values are ‘good’ values for which type of module. In order to arrive at that stage, we present a (nonexhaustive) list of metrics with a short definition of each metric, together with its corresponding equation. The metrics are grouped into five categories: structural criteria, logical, relational with respect to other ontologies, information hiding, and richness. A summary table is included at the end of this section. We refer to the DOLCE ontology and its related modules in the text for examples demonstrating the calculations for the metrics. 

**Structural criteria** The first metric is _size_ , which is a common metric used to measure the number of entities in a module and for any ontology: 



where _C_ are classes, _OP_ object properties, _DP_ data properties, and _I_ instances. One then can also compute the _relative size_ , which is defined as the size of a module in comparison to the original ontology: 



where _|M |_ is again the size of the module, as described in Eq. 11.1, and _|O|_ is the size of the ontology. 

**Example 11.2.** _The size from the DOLCE-perdurants module of DOLCE is calculated as follows: it has 27 classes, 0 individuals, 70 object properties, and 0 data properties. For its source ontology, DOLCE, there are 37 classes, 0 individuals, 70 object properties, and 0 data properties. Hence the relative size is_ 37+70<sup><u>27+70</u></sup><sup>_=0.91%._</sup> 

The _appropriateness of module size_ is defined as a mapping the size of an ontology module to some appropriateness function, based on software design principles: 



where _x_ is the number of axioms in the module. 

**Example 11.3.** _The Temporal Relations module of the DOLCE ExtendedDnS (Descriptions & Situations) ontology has 435 axioms. Therefore, its appropriate size value is_<sup><u>1</u></sup><sup>_<u>π</u>=0.16.TheappropriatesizevalueoftheTemporal_</sup> 2<sup>_−_</sup><sup><u>1</u></sup> 2<sup>_cos_(435</sup><sup>_._</sup> 250<sup>)</sup> _Relations module is rather low, due to the fact that the module has many more axioms than the optimal of 250 as defined by Schlicht and Stuckenschmidt._ 

_Chapter 11. Ontology modularisation_ 

220 

_Intra-module distance_ is the distance between entities in a module, which is measured by counting the number of relations in the shortest path from one entity to the other, for every entity in the module. 



where _n_ is the number of nodes in the module, and Freeman’s Farness value **??** is as follows: 



where _i_ and _j_ are two entities in the module. 

One then also can define and compute a _relative intra-module distance_ , which is based on the intra-module distance. It checks whether the overall distance between the entities in the module has been reduced. It is measured as the difference between the intra-module distance of a source ontology and the intra module distance of a module: 



Last, the _cohesion_ metric measures the extent which entities are related to each other in a module. It is measured by calculating the sum of the strength of relations as a fraction over the number of all possible relations in a module: 



where _|M |_ is the number of entities in the module as described in Eq. 11.1. The product of _|M |_ ( _|M |−_ 1) represents the number of possible relations between entities in _M_ . The strength of the relation for each entity is calculated based on the farness centrality measure for graph theory proposed by Freeman **??** from Eq. 11.5. 



**Logical Criteria** The logical criteria included here are correctness and completeness. _Correctness_ states that no new axioms should be added to a module, i.e., every axiom that exists in the module should also exist in its original ontology. 



_11.2. Module dimensions_ 

221 

whereas the _completeness_ metric checks whether the meaning of every entity is preserved in a module as in the source ontology: 





**Example 11.4.** _In the source ontology, DOLCE the_ endurant _entity is defined with the following set of properties (listed separately for ease of reading):_ 

- _endurant ⊑∀ part.endurant_ 

- _endurant ⊑ spatio-temporal-particular_ 

- _endurant ⊑∃ participant-in.perdurant_ 

- _endurant ⊑∀ specific-constant-constituent.endurant_ 

- _endurant ⊑¬ quality_ 

- _endurant ⊑¬ perdurant_ 

- _endurant ⊑¬ abstract_ 

_If DOLCE were to be modularised to create a branch module, containing only the branch of Endurant entities, DOLCE-endurants, the_ endurant _entity will end up being defined as follows:_ 

- _endurant ⊑∀ part.endurant_ 

- _endurant ⊑ spatio-temporal-particular_ 

- _endurant ⊑∃ participant-in.perdurant_ 

_The meaning of the_ endurant _entity was thus not fully preserved in the module since the axiom_ endurant _⊑∀_ specific-constant-constituent.endurant _existed in the original ontology but not in the module. Therefore the DOLCE-endurants module has a false value for the completeness metric._ 

**Relational Criteria** The relational criteria all concern how modules relate to other modules, assuming there is more than one module (be it generated from a source ontology, or from manually having divided up the subject domain). There are three metrics. First _inter-module distance_ refers to that, for a set of modules, one checks the number of modules that have to be considered to relate two entities: 



where _NM_ ( _Ci, Cj_ ) is the number of modules to consider to relate entities _i_ and _j_ . The product of _|_ ( _Mi, .., Mn_ ) _|_ ( _|_ ( _Mi, .., Mn_ ) _| −_ 1) represents the number of possible relations between entities in a set of modules _Mi, ., Mn_ . 

Second, there is _coupling_ , which checks whether modules have relations to entities in other modules, i.e., it is a way to compute the degree of interdependence 

_Chapter 11. Ontology modularisation_ 

222 

of a module: 



where _|Mi|_ is the number of entities in the current module and _|Mj|_ is the number of entities in a related module in the set of _n_ modules. 

Third, _redundancy_ checks if the same axioms exist in various modules within a set of module, i.e., whether modules overlap due to the duplication of axioms: 



**Information hiding** Ontology modules sometimes are designed with the intention to hide aspects of the source ontology from the module for privacy and simplification reasons. Information hiding within modules assesses whether the module encapsulates all the information in the module such that the privacy is preserved for each module. To this end, two criteria to measure information hiding properties of an ontology module are formulated. The first one is _encapsulation_ , which aims to describe how well a module’s knowledge is ‘protected’, i.e., whether it can be easily exchanged for another module or be modified without affecting the rest or the application that uses it. It is defined as follows: 



The related metric _Independence_ checks if a module is self-contained, i.e., if it could be altered on its own without affecting other modules. If so, then ontology modules can evolve independently and, hence, the semantics of the ontology as a whole could change without the need for all the modules to be changed. 



where _|Mi|_ is the number of entities in the current module and _|Mj|_ is the number of entities in a related module in the set of _n_ modules. 

**Richness Criteria** This category of metrics has to do with the type of axioms that are being used in the module. Two are defined here to indicate the idea. _Attribute richness_ checks the average number of attributes per class in an ontology, as: 



_11.3. Modularisation framework_ 

223 

**Table 11.1:** A summary of the set of evaluation metrics with their expected value range and values that are considered good. 

|**Evaluation metric**|**Value range**|**Value type**|**Good value**|
|---|---|---|---|
|Relative size|1 _≥i ≥_0|decimal|small to medium|
|Appropriateness|1 _≥i ≥_0|decimal|large|
|Cohesion|1 _≥i ≥_0|decimal|small|
|Correctness|true or false|boolean|true|
|Completness|true or false|boolean|true|
|Coupling|_i ≥_0|decimal|small|
|Redundancy|1 _≥i ≥_0|decimal|small to medium|
|Encapsulation|1 _≥i ≥_0|decimal|large|
|Independence|true or false|boolean|true|



where _att_ is measured by the number of data properties in the module and _|C|_ is the number of classes in the module. 

Another one is _inheritance richness_ , which checks the average number of subclasses per class, as follows: 



where _|H_<sup>_C_</sup> ( _C_ 1 _, Ci_ ) _|_ is the number of subclasses per class and _|C|_ is the total number of classes in the ontology. 

A summary of some of the evaluation metrics, where the values could be labelled as ‘good’ using a 4-point scale of small (0-0.25), medium (0.25-0.5), moderate (0.510.75), and large (0.75-1), and true/false values is shown in Table 11.1. 

### **11.3 Modularisation framework** 

With the dimensions identified and a set of metrics defined, we can now look at the next step: devise some sort of framework that puts it all together and ideally evaluated with actual modules, so that the goalposts can be moved even further, being toward methods for modularisation and guidance for modellers. 

Experimentation was performed with those dimensions and a set of modules, where the modules were classified according to the dimensions listed in Section 11.2 [KK15b]. The resulting high-level view of the framework is shown in Figure 11.1. The framework states that: A module’s _use-case_ results in modules of a specific _type_ . A module of a specific _type_ is generated by a modularisation _technique_ . A module of a specific _type_ is assessed by a set of _evaluation metrics_ . Modularisation _techniques_ are the cause for modules to be annotated with certain _properties_ . 

Let’s drill down into the details of each arrow in Figure 11.1. For the first relation in the framework, between the module use-case and type, we have the relations as shown in Figure 11.2. The dependencies in Figure 11.2 should be read 

_Chapter 11. Ontology modularisation_ 

224 

as follows: If an ontology developer wishes to create a module for a use-case of _Validation_ , it would result in a module of type _Structural: Domain Coverage_ . The full set of dependencies is shown in Figure 11.2. 

For the relation between the module type and technique, we have the relations as shown in Figure 11.3. The dependencies in Figure 11.3 should be read as follows, illustrated with an example: A module of type _Structural: Domain Coverage_ can be created using a _Graph partitioning_ technique. The full set of dependencies is shown in Figure 11.3. Perhaps of note is that for all abstraction and expressiveness modules, only manual methods are used, and for all structural module, there is some automated technique available. 

For the dependencies between technique and properties in the framework, we have the relations as shown Figure 11.4. The dependencies in Figure 11.4 should be read as follows: e.g., a module created by an _a priori_ technique has the following properties: _Imports, Stand-alone, Overlapping, and Pre-assigned number of modules_ . 

Finally, for the relation between type and evaluation metrics, we have the relations as shown Figure 11.5. For each type, it lists the relevant metrics together with desirable values for that metric. The dependencies in Figure 11.5 should be read as follows, e.g.: a module of type _Locality_ is a good quality module if its evaluation metric values are as follows: _Relative size: medium, cohesion: small, correctness: true_ . There are two important conclusions that can be drawn from this. First, not all metrics are relevant for each type of module. Second, in some cases the values of the metrics are different for different types of modules; e.g., for ODPs, the relative size should be small, wheres for privacy modules it should be medium. 

The framework for modularity can be used to guide ontology developers along the modularisation process. For instance, say that the user looks at an existing restaurant ontology to reuse, with the intent of only creating a module for a coffee shop. The ontology developer can start the modularisation process by identifying the use-case, which is re-use. From there on, the type, technique, property, and evaluation metrics can be formulated. The user will be clear on the type of ontology module that has to be created, and the method or technique that should be employed to create such a module. The technique is used to determine the properties of the module. The properties are useful in annotating a module with additional information (metadata) which could promote ontology usage and reuse. Lastly, the developer can assess the quality of a module that has been developed 

|Use-case|Type|Technique|Property|
|---|---|---|---|
||Evaluation<br>metric|||



**Figure 11.1:** A high-level view of the framework for modularity (source: based on [KK15b]). 

_11.4. Exercises_ 

225 



<!-- Start of picture text -->
Functional: Functional:<br>Locality Reuse ODPs<br>Functional:<br>Isolation branch<br>Functional:<br>Privacy<br>Functional:<br>Subject domain<br>Maintenance Collaboration<br>Structural: Domain<br>coverage Structural: Ontology<br>matching<br>Expressiveness: Abstraction: Axiom<br>Validation Sublanguage abstraction Processing<br>expressiveness<br>Expressiveness: Feature Abstraction: Vocabulary<br>expressiveness abstraction<br>Abstraction: High-level<br>abstraction<br>Reasoning Structural: Optimal Comprehension<br>Abstraction: Weighted<br>reasoning abstraction<br><!-- End of picture text -->

**Figure 11.2:** The dependencies between use-case and type. For instance, for a use-case of _maintenance_ , the resultant modules are _subject-domain modules_ or _domain coverage modules_ , i.e. maintenance results in a functional or structural module. 

by comparing its evaluation metrics to what is expected for that module from the framework. 

### **11.4 Exercises** 

**Review question 11.1.** What are some of the dimensions specified for modules? **Review question 11.2.** Name three techniques for modularising a large ontology. 

**Review question 11.3.** There are many criteria one can let loose on an otology to evaluate it. Name five criteria that concern the structure of the ontology and three that have to do with how one module relates to the other modules that were made from one large ontology. 

**Review question 11.4.** Describe in your own words the framework for modularity introduced in this chapter, and how you would be able to use that to modularise, e.g., SNOMED CT, the FMA, or DOLCE. 

**Exercise 11.1.** Recall that we have imported DOLCE and BFO into the AWO. In terms of all the definitions introduced in this chapter, what sort of modularisation do we have there? 

_Chapter 11. Ontology modularisation_ 

226 



<!-- Start of picture text -->
Domain Subject<br>Graph Domain<br>Coverage A priori<br>partitioning<br>Ontology Locality<br>Matching<br>Locality-<br>Optimal ODP<br>based<br>Reasoning<br>Isolation<br>Branch<br>Sub-language Axiom Abs.<br>Expressiveness Voc Abs. Privacy<br>High-level Abs. Manual<br>Feature<br>Expressiveness Weighted Abs.<br>Structural<br>Functional<br>Expressiveness Abstraction<br><!-- End of picture text -->

**Figure 11.3:** The dependencies between type and technique. For instance, for an _ontology design pattern module_ , both _manual_ and _a priori_ methods are used. 

**Exercise 11.2.** The Quantities, Units, Dimensions and Data Types (QUDT) ontologies are a set of ontology modules. These modules describe terminology used in science and engineering for the representation of physical quantities, units of measure, and their dimensions [3]. A table of evaluation criteria for the QUDT modules is shown in Table 11.2. Study the evaluation metrics to determine whether the set of QUDT modules are a good set of modules. Explain your findings. 

**Exercise 11.3.** Return to the motivating Example 11.1, specifically, “The developer wishes to extract only the specific Book-toy entity and the generalised Toyproperty entity”. Determine the use-case for modularisation for this, and thereafter determine the type of module to be created, technique to be used, the properties it would exhibit, and which evaluation criteria could be used to measure it. 

**Table 11.2:** The metrics for the QUDT ontology modules; approp = appropriateness, encap. = encapsulation, redund. = redundancy, avg. = average, med. = median. 

||**Struct**<br>**Size**|**ural crite**<br>**Atomic**<br>**size**|**ria**<br>**No. of**<br>**axioms**|**Approp.**|**Intra**<br>**module**<br>**distance**|**Cohesion**|
|---|---|---|---|---|---|---|
|**Avg.**|595.38|5.71|3112.00|0.91|8577.25|0.008|
||**Richne**<br>**criteri**|**ss**<br>**a**|**Informa**<br>**hiding c**|**tion**<br>**riteria**|**Relational crit**|**eria**|
||**AR**|**IR**|**Encap.**|**Coupling**|**Independence**|**Redund.**|
|**Avg.**|1.69|1.89|0.99|0|25% true|0.50|



_11.5. Literature and reference material_ 

227 



<!-- Start of picture text -->
A priori Locality-based Graph partitioning Manual<br>Imports Information removal Information removal Seed signature<br>Stand-alone Overlapping Stand-alone Information retrieval<br>Overlapping<br>Stand-alone Source ontology Source ontology<br>Pre-assigned<br>Proper subset Proper subset Proper subset<br>no. of modules<br>Seed signature Overlapping Stand-alone<br>Source ontology Mutual exclusion Imports<br>Partitioning Abstraction<br>Inter-module Breadth abs.<br>interaction Depth abs.<br>Refnement<br><!-- End of picture text -->

**Figure 11.4:** The dependencies between technique and property. For instance, when _graph partitioning_ techniques are used, the following properties may be relevant for the modules, among others: information removal, standalone, source ontology, and proper subset. 

|**Ontology design**<br>**pattern**|**Subject domain**|**Isolation branch**|**Locality**|**Privacy**|**Expressive-**<br>**ness feature**|**Expressive-**<br>**ness sub-**<br>**language**|
|---|---|---|---|---|---|---|
|**Relative size: small**<br>**Cohesion: small**<br>**Completeness: true**|**Cohesion: small**<br>**Encapsulation:**<br>**large**<br>**Coupling: small**<br>**Redundancy: small**|**Cohesion: small**|**Relative size:**<br>**medium**<br>**Cohesion:**<br>**small**<br>**Correctness:**<br>**true**|**Relative size:**<br>**medium**<br>**Cohesion:**<br>**small**|**Cohesion:**<br>**small**|**Cohesion:**<br>**small**|
|**Optimal reasoning**|**Ontlogy matching**|**Domain coverage**|**Weighted**<br>**abstraction**|**Axiom**<br>**abstraction**|**Vocabulary**<br>**abstraction**|**High level**<br>**abstraction**|
|**Cohesion: small**<br>**Correctness: true**<br>**Encapsulation:**<br>**large**<br>**Coupling: small**<br>**Redundancy:**<br>**medium**|**Relative size: small**<br>**Cohesion: small**<br>**Encapsulation:**<br>**large**<br>**Independence: true**<br>**Coupling: small**<br>**Redundancy: small**|**Relative size: small**<br>**Cohesion: small**<br>**Encapsulation:**<br>**large**<br>**Coupling: small**<br>**Redundancy: small**|**Relative size:**<br>**medium**<br>**Cohesion:**<br>**small**|**Cohesion:**<br>**small**<br>**Correctness:**<br>**true**|**Appropriate-**<br>**ness: large**<br>**Cohesion:**<br>**small**<br>**Correctness:**<br>**true**|**Appropriate-**<br>**ness: large**<br>**Cohesion:**<br>**small**|



**Figure 11.5:** The dependencies between type and evaluation property. 

### **11.5 Literature and reference material** 

1. d’Aquin M., Schlicht A., Stuckenschmidt H. and Sabou M. Criteria and evaluation for ontology modularization techniques. _Modular ontologies_ , Springer, Berlin, Heidelberg, 2009, (pp. 67-89). 

2. Khan, Z.C. and Keet, C.M. An empirically-based framework for ontology modularisation. _Applied Ontology_ , IOS Press, 2015, 10(3-4):171-95. 

### Bibliography 

- [ACDG<sup>+</sup> 05] Andrea Acciarri, Diego Calvanese, Giuseppe De Giacomo, Domenico Lembo, Maurizio Lenzerini, Mattia Palmieri, and Riccardo Rosati. QuOnto: Querying Ontologies. In _Proc. of the 20th Nat. Conf. on Artificial Intelligence (AAAI 2005)_ , pages 1670–1671, 2005. 

- [ACK<sup>+</sup> 07] Alessandro Artale, Diego Calvanese, Roman Kontchakov, Vladislav Ryzhikov, and Michael Zakharyaschev. Reasoning over extended ER models. In Christine Parent, Klaus-Dieter Schewe, Veda C. Storey, and Bernhard Thalheim, editors, _Proceedings of the 26th International Conference on Conceptual Modeling (ER’07)_ , volume 4801 of _LNCS_ , pages 277–292. Springer, 2007. Auckland, New Zealand, November 5-9, 2007. 

- [ACKZ09] Alessandro Artale, Diego Calvanese, Roman Kontchakov, and Michael Zakharyaschev. DL-Lite without the unique name assumption. In _Proc. of the 22nd Int. Workshop on Description Logic (DL 2009)_ , volume 477 of _CEUR-WS_ , 2009. http://ceur-ws.org/. 

- [AFK12] Ronell Alberts, Thomas Fogwill, and C. Maria Keet. Several required OWL features for indigenous knowledge management systems. In P. Klinov and M. Horridge, editors, _7th Workshop on OWL: Experiences and Directions (OWLED 2012)_ , volume 849 of _CEUR-WS_ , page 12p, 2012. 27-28 May, Heraklion, Crete, Greece. 

- [AFWZ02] A. Artale, E. Franconi, F. Wolter, and M. Zakharyaschev. A temporal description logic for reasoning about conceptual schemas and queries. In S. Flesca, S. Greco, N. Leone, and G. Ianni, editors, _Proceedings of the 8th Joint European Conference on Logics in Artificial Intelligence (JELIA-02)_ , volume 2424 of _LNAI_ , pages 98– 110. Springer Verlag, 2002. 

- [AGK08] Alessandro Artale, Nicola Guarino, and C. Maria Keet. Formalising temporal constraints on part-whole relations. In Gerhard Brewka and Jerome Lang, editors, _11th International Conference on Principles of Knowledge Representation and Reasoning (KR’08)_ , pages 673–683. AAAI Press, 2008. Sydney, Australia, September 16-19, 2008. 

- [AKK<sup>+</sup> 17] Alessandro Artale, Roman Kontchakov, Alisa Kovtunova, Vladislav Ryzhikov, Frank Wolter, and Michael Zakharyaschev. Ontology-mediated query answering over temporal data: A survey. In Sven Schewe, Thomas Schneider, and Jef Wijsen, editors, _Proceedings of the 24th International Symposium on Temporal Representation and Reasoning (TIME’17)_ , pages 1:1–1:36. Leibniz International Proceedings in Informatics, 2017. 

229 

_Bibliography_ 

230 

|[AKL<sup>+</sup>07]|A. Artale, R. Kontchakov, C. Lutz, F. Wolter, and M. Zakharyaschev. Temporalis-<br>ing tractable description logics. In _Inter. Symposium on Temporal Representation_<br>_and Reasoning (TIME07)_. IEEE Computer Society, 2007.|
|---|---|
|[ALG13]|I. Androutsopoulos, G. Lampouras, and D. Galanis. Generating natural language<br>descriptions from owl ontologies: the naturalowl system.<br>_Journal of Artifcial_<br>_Intelligence Research_, 48:671–715, 2013.|
|[Ali04]|A. Aliseda. Logics in scientifc discovery. _Foundation of Science_, 9:339–363, 2004.|
|[All83]|James F. Allen. Maintaining knowledge about temporal intervals._Communications_<br>_of the ACM_, 26(11):832–843, 1983.|
|[APS07]|A. Artale, C. Parent, and S. Spaccapietra. Evolving objects in temporal infor-<br>mation systems. _Annals of Mathematics and Artifcial Intelligence_, 50(1-2):5–38,<br>2007.|
|[AvH03]|G. Antoniou and F. van Harmelen. _A Semantic Web Primer_. MIT Press, USA,<br>2003.|
|[AWP<sup>+</sup>08]|Dimitra Alexopoulou, Thomas W¨achter, Laura Pickersgill, Cecilia Eyre, and<br>Michael Schroeder. Terminologies for text-mining; an experiment in the lipoprotein<br>metabolism domain. _BMC Bioinformatics_, 9(Suppl 4):S2, 2008.|
|[BACW14]|N. Bouayad-Agha, G. Casamayor, and L. Wanner. Natural language generation<br>in the context of the semantic web. _Semantic Web Journal_, 5(6):493–513, 2014.|
|[BBK<sup>+</sup>17]|Franz Baader, Stefan Borgwardt, Patrick Koopmann, Ana Ozaki, and Veronika<br>Thost. Metric temporal description logics with interval-rigid names. In C. Dixon<br>and M. Finger, editors,_Proceedings of the International Symposium on Frontiers of_<br>_Combining Systems (FroCoS’17)_, volume 10483 of _LNCS_, pages 60–76. Springer,<br>2017.|
|[BBL05]|F. Baader, S. Brandt, and C. Lutz. Pushing the EL envelope. In_Proc. of the 19th_<br>_Joint Int. Conf. on Artifcial Intelligence (IJCAI 2005)_, volume 5, pages 364–369,<br>2005.|
|[BC14]|Paul Buitelaar and Philipp Cimiano, editors. _Towards the Multilingual Semantic_<br>_Web: Principles, Methods and Applications_. Springer, 2014.|
|[BCDG05]|D. Berardi, D. Calvanese, and G. De Giacomo. Reasoning on UML class diagrams.<br>_Artifcial Intelligence_, 168(1-2):70–118, 2005.|
|[BCHM09]|P. Buitelaar, P. Cimiano, P. Haase, and Sintek M. Towards linguistically grounded<br>ontologies. In L. Aroyo et al., editors, _Proceedings of the Extended Semantic Web_<br>_Conference (ESWC’09)_, volume 5554 of _LNCS_, pages 111–125. Springer, 2009.|
|[BCM<sup>+</sup>08]|F. Baader, D. Calvanese, D. L. McGuinness, D. Nardi, and P. F. Patel-Schneider,<br>editors. _The Description Logics Handbook – Theory and Applications_. Cambridge<br>University Press, 2 edition, 2008.|
|[BD07]|T. Bittner and M. Donnelly. A temporal mereology for distinguishing between<br>integral objects and portions of stuf. In _Proceedings of AAAI’07_, pages 287–292,<br>2007. Vancouver, Canada.|
|[BDFG14]|Alessio Bosca, Mauro Dragoni, Chiara Di Francescomarino, and Chiara Ghi-<br>dini. Collaborative management of multilingual ontologies. In Paul Buitelaar and<br>Philip Cimiano, editors, _Towards the Multilingual Semantic Web_, pages 175–192.<br>Springer, 2014.|
|[BE93]|Jon Barwise and John Etchemendy. _The language of frst-order logic_. Stanford,<br>USA: CSLI Lecture Notes, 3rd edition, 1993.|



_Bibliography_ 

231 

|[BGSS07]|F. Baader, B. Ganter, B. Sertkaya, and U. Sattler. Completing description logic<br>knowledge bases using formal concept analysis. In_Proc. of IJCAI 2007_, volume 7,<br>pages 230–235, 2007. Hyderabad, India, 2007.|
|---|---|
|[BH96]|A. C. Bloesch and T. A. Halpin. ConQuer: a conceptual query language. In _Pro-_<br>_ceedings of ER’96: 15th International Conference onconceptual modeling_, volume<br>1157 of _LNCS_, pages 121–133. Springer, 1996.|
|[BH97]|A. C. Bloesch and T. A. Halpin. Conceptual Queries using ConQuer-II. In _Pro-_<br>_ceedings of ER’97: 16th International Conference on Conceptual Modeling_, volume<br>1331 of _LNCS_, pages 113–126. Springer, 1997.|
|[BHJ<sup>+</sup>15]|E. Blomqvist, P. Hitzler, K. Janowicz, A. Krisnadhi, T. Narock, and M. Solanki.<br>Considerations regarding ontology design patterns. _Semantic Web_, 7(1):1–7, 2015.|
|[BLHL01]|Tim Berners-Lee, James Hendler, and Ora Lassila. The semantic web. _Scientifc_<br>_American Magazine_, May 17, 2001, 2001.|
|[BLK<sup>+</sup>09]|Christian Bizer, Jens Lehmann, Georgi Kobilarov, S¨oren Auer, Christian Becker,<br>Richard Cyganiak, and Sebastian Hellmann. Dbpedia – a crystallization point for<br>the web of data. _Journal of Web Semantics: Science, Services and Agents on the_<br>_World Wide Web_, 7:154165, 2009.|
|[BM09]|Stefano Borgo and Claudio Masolo. Foundational choices in DOLCE. In Stefen<br>Staab and Rudi Studer, editors,_Handbook on Ontologies_, pages 361–381. Springer,<br>2 edition, 2009.|
|[BMF95]|John A. Bateman, Bernardo Magnini, and Giovanni Fabris. The Generalized Upper<br>Model Knowledge Base: Organization and Use. In N. J. I. Mars, editor, _Towards_<br>_very large knowledge bases: knowledge building and knowledge sharing_, pages 60–<br>72, Amsterdam, 1995. IOS Press.|
|[BPTA17]|Sotiris Batsakis, Euripides Petrakis, Ilias Tachmazidis, and Grigoris Antoniou.<br>Temporal representation and reasoning in OWL 2.<br>_Semantic Web Journal_,<br>8(6):981–1000, 2017.|
|[Bro06]|Matthias Brochhausen. The _Derives_<br>_~~f~~rom_ relation in biomedical ontologies. _Stud-_<br>_ies in Health Technology and Informatics_, 124:769–774, 2006.|
|[BS05]|E. Blomqvist and K. Sandkuhl. Patterns in ontology engineering - classifcation<br>of ontology patterns. In _Proc. of the 7th International Conference on Enterprise_<br>_Information Systems_, 2005. Miami, USA, May 2005.|
|[BS11]|Fernando Bobillo and Umberto Straccia. Fuzzy ontology representation using OWL<br>2. _International Journal of Approximate Reasoning_, 52:1073–1094, 2011.|
|[BSSH08]|Elena Beisswanger, Stefan Schulz, Holger Stenzhorn, and Udo Hahn. BioTop: An<br>upper domain ontology for the life sciences - a description of its current structure,<br>contents, and interfaces to OBO ontologies. _Applied Ontology_, 3(4):205–212, 2008.|
|[BST07]|Franz Baader, Baris Sertkaya, and Anni-Yasmin Turhan. Computing the least<br>common subsumer w.r.t. a background terminology.<br>_Journal of Applied Logic_,<br>5(3):392–420, 2007.|
|[CCKE<sup>+</sup>17]|Diego Calvanese, Benjamin Cogrel, Sarah Komla-Ebri, Roman Kontchakov, Da-<br>vide Lanti, Martin Rezk, Mariano Rodriguez-Muro, and Guohui Xiao.<br>Ontop:<br>Answering SPARQL queries over relational databases.<br>_Semantic Web Journal_,<br>8(3):471–487, 2017.|
|[CCO<sup>+</sup>13]|V.K. Chaudhri, B. Cheng, A. Overholtzer, J. Roschelle, A. Spaulding, P. Clark,<br>M. Greaves, and D Gunning. Inquire biology: A textbook that answers questions.<br>_AI Magazine_, 34(3):55–72, 2013.|



_Bibliography_ 

|232|_Bibliography_|
|---|---|
|[CDG03]|D. Calvanese and G. De Giacomo. _The DL Handbook: Theory, Implementation_<br>_and Applications_, chapter Expressive description logics, pages 178–218. Cambridge<br>University Press, 2003.|
|[CDGL99]|Diego Calvanese, Giuseppe De Giacomo, and Maurizio Lenzerini. Reasoning in<br>expressive description logics with fxpoints based on automata on infnite trees.<br>In _Proc. of the 16th Int. Joint Conf. on Artifcial Intelligence (IJCAI’99)_, pages<br>84–89, 1999.|
|[CGHM<sup>+</sup>08]|B. Cuenca Grau, I. Horrocks, B. Motik, B. Parsia, P. Patel-Schneider, and U. Sat-<br>tler.<br>OWL 2: The next step for OWL.<br>_Journal of Web Semantics: Science,_<br>_Services and Agents on the World Wide Web_, 6(4):309–322, 2008.|
|[CGL<sup>+</sup>07]|Diego Calvanese, Giuseppe De Giacomo, Domenico Lembo, Maurizio Lenzerini,<br>and Riccardo Rosati. Tractable reasoning and efcient query answering in descrip-<br>tion logics: The DL-Lite family. _Journal of Automated Reasoning_, 39(3):385–429,<br>2007.|
|[CGL<sup>+</sup>09]|Diego Calvanese, Giuseppe De Giacomo, Domenico Lembo, Maurizio Lenzerini,<br>Antonella Poggi, Mariano Rodr´ıguez-Muro, and Riccardo Rosati. Ontologies and<br>databases: The DL-Lite approach. In Sergio Tessaris and Enrico Franconi, editors,<br>_Semantic Technologies for Informations Systems - 5th Int. Reasoning Web Summer_<br>_School (RW 2009)_, volume 5689 of _LNCS_, pages 255–356. Springer, 2009. Brixen-<br>Bressanone, Italy, 30 August - 4 September 2009.|
|[CK14]|Catherine Chavula and C. Maria Keet. Is lemon sufcient for building multilingual<br>ontologies for Bantu languages? In C. Maria Keet and Valentina Tamma, editors,<br>_Proceedings of the 11th OWL: Experiences and Directions Workshop (OWLED’14)_,<br>volume 1265 of _CEUR-WS_, pages 61–72, 2014. Riva del Garda, Italy, Oct 17-18,<br>2014.|
|[CK15]|Catherine Chavula and C. Maria Keet. An orchestration framework for linguistic<br>task ontologies. In E. adn others Garoufallou, editor, _Proceedings of teh 9th Meta-_<br>_data and Semantics Research Conference (MTSR’15)_, volume 544 of _CCIS_, pages<br>3–14. Springer, 2015. 9-11 September, 2015, Manchester, UK.|
|[CKK<sup>+</sup>17]|M. Codescu, E. Kuksa, O. Kutz, T. Mossakowski, and F. Neuhaus. Ontohub: A<br>semantic repository for heterogeneous ontologies. _Applied Ontology_, 2017. Forth-<br>coming.|
|[CKN<sup>+</sup>10]|Diego Calvanese, C. Maria Keet, Werner Nutt, Mariano Rodr´ıguez-Muro, and<br>Giorgio Stefanoni. Web-based graphical querying of databases through an ontol-<br>ogy: the WONDER system. In Sung Y. Shin, Sascha Ossowski, Michael Schu-<br>macher, Mathew J. Palakal, and Chih-Cheng Hung, editors, _Proceedings of ACM_<br>_Symposium on Applied Computing (ACM SAC’10)_, pages 1389–1396. ACM, 2010.<br>March 22-26 2010, Sierre, Switzerland.|
|[CLM<sup>+</sup>16]|D. Calvanese, P. Liuzzo, A. Mosca, J. Remesal, M. Rezk, and G. Rull. Ontology-<br>based data integration in epnet: Production and distribution of food during the ro-<br>man empire. _Engineering Applications of Artifcial Intelligence_, 51:212–229, 2016.|
|[CLs07]|Common Logic (CL): a framework for a family of logic-based languages, 2007.<br>https://www.iso.org/standard/39175.html.|
|[CMFL05]|Oscar Corcho and Angel L´opez-Cima Mariano Fern´andez-L´opez, Asunci´on G´omez-<br>P´erez. Building legal ontologies with methontology and webode. In _Law and the_<br>_Semantic Web 2005_, volume 3369 of _LNAI_, pages 142–157. Springer LNAI, 2005.|
|[CMSV09]|Philipp Cimiano, Alexander M¨adche, Stefen Staab, and Johanna V¨olker. Ontology<br>learning. In S. Staab and R. Studer, editors, _Handbook on Ontologies_, pages 245–<br>267. Springer Verlag, 2009.|



_Bibliography_ 

233 

|[Cot10]|A. J. Cotnoir. Anti-symmetry and non-extensional mereology. _The Philosophical_<br>_Quarterly_, 60(239):396–405, 2010.|
|---|---|
|[CS94]|Tiziana Catarci and Giuseppe Santucci. Query by diagram: a graphical environ-<br>ment for querying databases. _ACM SIGMOD Record_, 23(2):515, 1994.|
|[CSG<sup>+</sup>10]|Adrien Coulet, Nigam H. Shah, Yael Garten, Mark Musen, and Russ B. Altman.<br>Using text to build semantic networks for pharmacogenomics. _Journal of Biomed-_<br>_ical Informatics_, 43(6):1009–1019, 2010.|
|[CT98]|J. Chomicki and D. Toman. _Logics for databases and information systems_, chapter<br>Temporal logic in information systems. Kluwer, 1998.|
|[D<sup>+</sup>10]|Emek Demir et al. The BioPAX community standard for pathway data sharing.<br>_Nature Biotechnology_, 28(9):935–942, 2010.|
|[DAA<sup>+</sup>08]|Heiko Dietze, Dimitra Alexopoulou, Michael R. Alvers, Liliana Barrio-Alvers,<br>Bill Andreopoulos, Andreas Doms, Joerg Hakenberg, Jan Moennich, Conrad<br>Plake, Andreas Reischuck, Loic Royer, Thomas Waechter, Matthias Zschunke, and<br>Michael Schroeder. Gopubmed: Exploring pubmed with ontological background<br>knowledge. In Stephen A. Krawetz, editor, _Bioinformatics for Systems Biology_.<br>Humana Press, 2008.|
|[Daw17]|Zubeida C. Dawood. _A foundation for ontology modularisation_. Phd thesis, De-<br>partment Computer Science, University of Cape Town, November 2017 2017.|
|[DB09]|Maureen Donnelly and Thomas Bittner. Summation relations and portions of stuf.<br>_Philosophical Studies_, 143:167–185, 2009.|
|[dCL06]|P. C. G. da Costa and K. B. Laskey. PR-OWL: A framework for probabilistic<br>ontologies. In _Proceedings FOIS’06_, pages 237–249. IOS Press, 2006.|
|[dFE10]|Claudia d’Amato, Nicola Fanizzi, and Floriana Esposito. Inductive learning for<br>the Semantic Web: What does it buy? _Semantic Web Journal_, 1(1,2):53–59, 2010.|
|[DGR12]|Chiara Di Franscescomarino, Chiara Ghidini, and Marco Rospocher. Evaluating<br>wiki-enhanced ontology authoring. In A ten Teije et al., editors,_18th International_<br>_Conference on Knowledge Engineering and Knowledge Management (EKAW’12)_,<br>volume 7603 of _LNAI_, pages 292–301. Springer, 2012. Oct 8-12, Galway, Ireland.|
|[DHI12]|A. Doan, A. Y. Halevy, and Z. G. Ives. _Principles of Data Integration_. Morgan<br>Kaufmann, 2012.|
|[EGOMA06]|H. El-Ghalayini, M. Odeh, R. McClatchey, and D. Arnold. Deriving conceptual<br>data models from domain ontologies for bioinformatics.<br>In _2nd Conference on_<br>_Information and Communication Technologies (ICTTA’06)_, pages 3562 – 3567.<br>IEEE Computer Society, 2006. 24-28 April 2006, Damascus, Syria.|
|[EM05]|J. Euzenat and A. Montanari. _Handbook of temporal reasoning in artifcial intel-_<br>_ligence_, chapter Time granularity, pages 59–118. Amsterdam: Elsevier, 2005.|
|[ES07]|Jerome Euzenat and Pavel Shvaiko. _Ontology Matching_. Springer, 2007.|
|[FBR<sup>+</sup>16]|R. A. Falbo, M. P. Barcelos, F. B. Ruy, G. Guizzardi, and R. S. S. Guizzardi.<br>Ontology pattern languages. In A. Gangemi, P. Hizler, K. Janowicz, A. Krisnadhi,<br>and V. Presutti, editors, _Ontology Engineering with Ontology Design Patterns:_<br>_Foundations and Applications_. IOS Press, 2016.|
|[Fer16]|S. Ferr´e. Semantic authoring of ontologies by exploration and elimination of possi-<br>ble worlds. In E. Blomqvist, P. Ciancarini, F. Poggi, and F. Vitali, editors,_Proceed-_<br>_ings of the 20th International Conference on Knowledge Engineering and Knowl-_<br>_edge Management (EKAW’16)_, volume 10024 of _LNAI_, pages 180–195. Springer,<br>2016. 19-23 November 2016, Bologna, Italy.|



_Bibliography_ 

|234|_Bibliography_|
|---|---|
|[FFT12]|Pablo R. Fillottrani, Enrico Franconi, and Sergio Tessaris. The ICOM 3.0 intelli-<br>gent conceptual modelling tool and methodology._Semantic Web Journal_, 3(3):293–<br>306, 2012.|
|[FGGP13]|Ricardo A Falbo, Giancarlo Guizzardi, Aldo Gangemi, and Valentina Presutti.<br>Ontology patterns: clarifying concepts and terminology. In _Proc. of OSWP’13_,<br>2013.|
|[FGPPP99]|M. Fern´andez, A. G´omez-P´erez, A. Pazos, and J. Pazos.<br>Building a chemical<br>ontology using METHONTOLOGY and the ontology design environment. _IEEE_<br>_Expert: Special Issue on Uses of Ontologies_, January/February:37–46, 1999.|
|[FGT10]|Enrico Franconi, Paolo Guagliardo, and Marco Trevisan.<br>An intelligent query<br>interface based on ontology navigation. In _Workshop on Visual Interfaces to the_<br>_Social and Semantic Web (VISSW’10)_, 2010. Hong Kong, February 2010.|
|[Fin00]|Kit Fine. Neutral relations. _The Philosophical Review_, 109(1):1–33, 2000.|
|[FK15]|Pablo Rub´en Fillottrani and C. Maria Keet. Evidence-based languages for concep-<br>tual data modelling profles. In T. Morzy et al., editors, _19th Conference on Ad-_<br>_vances in Databases and Information Systems (ADBIS’15)_, volume 9282 of_LNCS_,<br>pages 215–229. Springer, 2015. 8-11 Sept, 2015, Poitiers, France.|
|[FK17]|Pablo R. Fillottrani and C. Maria Keet. Patterns for heterogeneous tbox mappings<br>to bridge diferent modelling decisions. In E. Blomqvist et al., editors,_Proceeding of_<br>_the 14th Extended Semantic Web Conference (ESWC’17)_, volume 10249 of_LNCS_,<br>pages 371–386. Springer, 2017. 30 May - 1 June 2017, Portoroz, Slovenia.|
|[FKK10]|Norbert E. Fuchs, Kaarel Kaljurand, and Tobias Kuhn. Discourse Representation<br>Structures for ACE 6.6. Technical Report if-2010.0010, Department of Informatics,<br>University of Zurich, Zurich, Switzerland, 2010.|
|[FR12]|Sebastien Ferr´e and Sebastian Rudolph. Advocatus diaboli<br>exploratory enrich-<br>ment of ontologies with negative constraints. In A ten Teije et al., editors, _18th_<br>_International Conference on Knowledge Engineering and Knowledge Management_<br>_(EKAW’12)_, volume 7603 of_LNAI_, pages 42–56. Springer, 2012. Oct 8-12, Galway,<br>Ireland.|
|[Gan05]|Aldo Gangemi. Ontology design patterns for semantic web content. In Yolanda Gil,<br>Enrico Motta, V. Richard Benjamins, and Mark A. Musen, editors, _Proceedings_<br>_of the 4th International Semantic Web Conference (ISWC’05)_, pages 262–276,<br>Berlin, Heidelberg, 2005. Springer. Galway, Ireland, November 6-10, 2005.|
|[Gar17]|Daniel Garijo. WIDOCO: a wizard for documenting ontologies. In C. d’Amato<br>et al., editors, _The Semantic Web_<br>_ISWC 2017_, volume 10588 of _LNCS_, pages<br>94–102, Berlin, 2017. Springer.|
|[GB92]|J. A. Goguen and R. M. Burstall. Institutions: Abstract Model Theory for Speci-<br>fcation and Programming. _Journal of the Association for Computing Machinery_,<br>39(1):95–146, 1992. Predecessor in: LNCS 164, 221–256, 1984.|
|[GB11]|Normunds Gruzitis and Guntis Barzdins. Towards a more natural multilingual<br>controlled language interface to OWL. In _Proceedings of the Ninth International_<br>_Conference on Computational Semantics_, IWCS ’11, pages 335–339, Stroudsburg,<br>PA, USA, 2011. Association for Computational Linguistics.|
|[GBM07]|Rolf Gr¨utter and Bettina Bauer-Messmer. Combining OWL with RCC for spa-<br>tioterminological reasoning on environmental data. In _Third international Work-_<br>_shop OWL: Experiences and Directions (OWLED 2007)_, 2007.<br>6-7 June 2007,<br>Innsbruck, Austria.|
|[Gen00]|Gene Ontology Consortium. Gene Ontology: tool for the unifcation of biology.<br>_Nature Genetics_, 25:25–29, 2000.|



_Bibliography_ 

235 

|[GF95]|M. Gr¨uninger and M. S. Fox. Methodology for the design and evaluation of on-<br>tologies. In _IJCAI Workshop on Basic Ontological Issues in Knowledge Sharing_,<br>1995.|
|---|---|
|[GH07]|Christine Golbreich and Ian Horrocks. The OBO to OWL mapping, GO to OWL<br>1.1!<br>In _Proc. of the Third OWL Experiences and Directions Workshop_, volume<br>258 of _CEUR-WS_, 2007. http://ceur-ws.org/.|
|[GHH<sup>+</sup>12]|Michael Gr¨uninger, Torsten Hahmann, Ali Hashemi, Darren Ong, and Atalay Oz-<br>govde. Modular frst-order ontologies via repositories. _Applied Ontology_, 7(2):169–<br>209, 2012.|
|[GK18]|Nikhil Gilbert and C. Maria Keet. Automating question generation and marking<br>of language learning exercises for isiZulu. In Brian Davis, C. Maria Keet, and<br>Adam Wyner, editors,_6th International Workshop on Controlled Natural language_<br>_(CNL’18)_, volume 304 of_FAIA_, pages 31–40. IOS Press, 2018. Co. Kildare, Ireland,<br>27-28 August 2018.|
|[GKL<sup>+</sup>09]|Chiara Ghidini, Barbara Kump, Stefanie Lindstaedt, Nahid Mabhub, Viktoria<br>Pammer, Marco Rospocher, and Luciano Serafni.<br>Moki: The enterprise mod-<br>elling wiki. In _Proceedings of the 6th Annual European Semantic Web Conference_<br>_(ESWC2009)_, 2009. Heraklion, Greece, 2009 (demo).|
|[GKWZ03]|D. Gabbay, A. Kurucz, F. Wolter, and M. Zakharyaschev.<br>_Many-dimensional_<br>_modal logics: theory and applications_. Studies in Logic. Elsevier, 2003.|
|[GOG<sup>+</sup>10]|Alexander Garcia, Kieran O’Neill, Leyla Jael Garcia, Phillip Lord, Robert Stevens,<br>´Oscar Corcho, and Frank Gibson. Developing ontologies within decentralized set-<br>tings. In H. Chen et al., editors, _Semantic e-Science. Annals of Information Sys-_<br>_tems 11_, pages 99–139. Springer, 2010.|
|[GOS09]|Nicola Guarino, Daniel Oberle, and Stefen Staab.<br>What is an ontology?<br>In<br>S. Staab and R. Studer, editors, _Handbook on Ontologies_, chapter 1, pages 1–17.<br>Springer, 2009.|
|[GP09]|A. Gangemi and V. Presutti. Ontology design patterns. In S. Staab and R. Studer,<br>editors, _Handbook on Ontologies_, pages 221–243. Springer Verlag, 2009.|
|[GPFLC04]|A. G´omez-P´erez, M. Fern´andez-Lopez, and O. Corcho. _Ontological Engineering_.<br>Springer Verlag, 2004.|
|[GR09]|A. Gatt and E. Reiter. Simplenlg: A realisation engine for practical applications. In<br>E. Krahmer and M. Theune, editors, _Proceedings of the 12th European Workshop_<br>_on Natural Language Generation (ENLG’09)_, page 9093. ACL, 2009. March 30-31,<br>2009, Athens, Greece.|
|[Gru93]|T. R. Gruber. A translation approach to portable ontologies. _Knowledge Acquisi-_<br>_tion_, 5(2):199–220, 1993.|
|[GRV10]|Birte Glimm, Sebastian Rudolph, and Johanna V¨olker. Integrated metamodeling<br>and diagnosis in OWL 2. In Peter F. Patel-Schneider, Yue Pan, Pascal Hitzler,<br>Peter Mika, Lei Zhang, Jef Z. Pan, Ian Horrocks, and Birte Glimm, editors,<br>_Proceedings of the 9th International Semantic Web Conference_, volume 6496 of<br>_LNCS_, pages 257–272. Springer, November 2010.|
|[Gua98]|Nicola Guarino. Formal ontology and information systems. In N. Guarino, editor,<br>_Proceedings of Formal Ontology in Information Systems (FOIS’98)_, Frontiers in<br>Artifcial intelligence and Applications, pages 3–15. Amsterdam: IOS Press, 1998.|
|[Gua09]|Nicola Guarino. The ontological level: Revisiting 30 years of knowledge repre-<br>sentation. In A.T. Borgida et al., editors, _Mylopoulos Festschrift_, volume 5600 of<br>_LNCS_, pages 52–67. Springer, 2009.|



_Bibliography_ 

|236|_Bibliography_|
|---|---|
|[Gui05]|Giancarlo Guizzardi. _Ontological Foundations for Structural Conceptual Models_.<br>Phd thesis, University of Twente, The Netherlands. Telematica Instituut Funda-<br>mental Research Series No. 15, 2005.|
|[GW00a]|Nicola Guarino and Chris Welty. A formal ontology of properties. In R. Dieng and<br>O. Corby, editors,_Proceedings of 12th International Conference on Knowledge En-_<br>_gineering and Knowledge Management (EKAW’00)_, volume 1937 of _LNCS_, pages<br>97–112. Springer Verlag, 2000.|
|[GW00b]|Nicola Guarino and Chris Welty.<br>Identity, unity, and individuality: towards a<br>formal toolkit for ontological analysis. In W. Horn, editor,_Proceedings of ECAI’00_,<br>pages 219–223. IOS Press, Amsterdam, 2000.|
|[GW08]|Giancarlo Guizzardi and Gerd Wagner. What’s in a relationship: An ontological<br>analysis. In Qing Li, Stefano Spaccapietra, Eric Yu, and Antoni Oliv´e, editors,<br>_ER_, volume 5231 of _Lecture Notes in Computer Science_, pages 83–97. Springer,<br>2008.|
|[GW09]|N. Guarino and C. Welty. An overview of ontoclean. In S. Staab and R. Studer,<br>editors, _Handbook on Ontologies_, pages 201–220. Springer Verlag, 2009.|
|[GWG<sup>+</sup>07]|Carole Goble, Katy Wolstencroft, Antoon Goderis, Duncan Hull, Jun Zhao, Pinar<br>Alper, Phillip Lord, Chris Wroe, Khalid Belhajjame, Daniele Turi, Robert Stevens,<br>Tom Oinn, and David De Roure. Knowledge discovery for biology with taverna. In<br>C.J.O. Baker and H. Cheung, editors, _Semantic Web: Revolutionizing knowledge_<br>_discovery in the life sciences_, pages 355–395. Springer: New York, 2007.|
|[Hal01]|T.A. Halpin.<br>_Information Modeling and Relational Databases_.<br>San Francisco:<br>Morgan Kaufmann Publishers, 2001.|
|[HC11]|Terry A. Halpin and Matthew Curland. Enriched support for ring constraints. In<br>Robert Meersman, Tharam S. Dillon, and Pilar Herrero, editors,_OTM Workshops_<br>_2011_, volume 7046 of _LNCS_, pages 309–318. Springer, 2011. Hersonissos, Crete,<br>Greece, October 17-21, 2011.|
|[HCTJ93]|J.-L. Hainaut, M. Chandelon, C. Tonneau, and M. Joris. Contribution to a theory<br>of database reverse engineering.<br>In _Reverse Engineering, 1993., Proceedings of_<br>_Working Conference on_, pages 161–170, May 1993.|
|[HDG<sup>+</sup>11]|Robert Hoehndorf, Michel Dumontier, J H Gennari, Sarah Wimalaratne, Bernard<br>de Bono, Daniel Cook, and George Gkoutos. Integrating systems biology models<br>and biomedical ontologies. _BMC Systems Biology_, 5:124, 2011.|
|[HDN04]|N. Henze, P. Dolog, and W. Nejdl.<br>Reasoning and ontologies for personalized<br>e-learning in the semantic web.<br>_Educational Technology & Society_, 7(4):82–97,<br>2004.|
|[Hed04]|Shawn Hedman. _A frst course in logic—an introduction to model theory, proof_<br>_theory, computability, and complexity_. Oxford University Press, Oxford, 2004.|
|[Hep11]|Martin Hepp.<br>SKOS to OWL.<br>Online: `http://www.heppnetz.de/projects/`<br>`skos2owl/`, Last accessed: Aug 30, 2011.|
|[HH06]|H. Herre and B. Heller.<br>Semantic foundations of medical information systems<br>based on top-level ontologies. _Knowledge-Based Systems_, 19:107–115, 2006.|
|[Hir14]|Graeme Hirst. Overcoming linguistic barriers to the multilingual semanticweb. In<br>Buitelaar and Cimiano [BC14], chapter 1, pages 3–14.|
|[HKS06]|I. Horrocks, O. Kutz, and U. Sattler. The even more irresistible _SROIQ_. _Pro-_<br>_ceedings of KR-2006_, pages 452–457, 2006.|



_Bibliography_ 

237 

|[HND<sup>+</sup>11]|Melanie Hilario, Phong Nguyen, Huyen Do, Adam Woznica, and Alexandros<br>Kalous.<br>Ontology-based meta-mining of knowledge discovery workfows.<br>In<br>N. Jankowski, W. Duch, and K. Grabczewski, editors, _Meta-learning in Com-_<br>_putational Intelligence_, pages 273–315. Springer, 2011.|
|---|---|
|[HNOS<sup>+</sup>08]|Melissa A Haendel, Fabian Neuhaus, David Osumi-Sutherland, Paula M Mabee,<br>Jos LV Mejino Jr, Chris J Mungall, and Barry Smith.<br>CARO- The common<br>anatomy reference ontology. In _Anatomy Ontologies for Bioinformatics_, volume 6<br>of _Computational Biology_, pages 327–349. Springer, 2008.|
|[HOD<sup>+</sup>10]|Robert Hoehndorf, Anika Oellrich, Michel Dumontier, Janet Kelso, Dietrich<br>Rebholz-Schuhmann, and Heinrich Herre.<br>Relations as patterns: bridging the<br>gap between OBO and OWL. _BMC Bioinformatics_, 11(1):441, 2010.|
|[HP98]|A. H. M. ter Hofstede and H. A. Proper. How to formalize it? formalization prin-<br>ciples for information systems development methods. _Information and Software_<br>_Technology_, 40(10):519–540, 1998.|
|[HP04]|J. R. Hobbs and F. Pan. An ontology of time for the semantic web. _ACM Trans-_<br>_actions on Asian Language Processing (TALIP): Special issue on Temporal Infor-_<br>_mation Processing_, 3(1):66–85, 2004.|
|[HPS08]|M. Horridge, B. Parsia, and U. Sattler. Laconic and precise justifcations in OWL.<br>In _Proc. of the 7th International Semantic Web Conference (ISWC 2008)_, volume<br>5318 of _LNCS_. Springer, 2008.|
|[HPSvH03]|Ian Horrocks, Peter F. Patel-Schneider, and Frank van Harmelen. From SHIQ and<br>RDF to OWL: The making of a web ontology language. _Journal of Web Semantics_,<br>1(1):7, 2003.|
|[HWZ99]|I. M. Hodgkinson, F. Wolter, and M. Zakharyaschev. Decidable fragments of frst-<br>order temporal logics. _Annals of pure and applied logic_, 106:85–134, 1999.|
|[IS09]|Antoine Isaac and Ed Summers.<br>SKOS Simple Knowledge Organization Sys-<br>tem Primer. W3c standard, World Wide Web Consortium, August 2009 2009.<br>http://www.w3.org/TR/skos-primer.|
|[JDM03]|M. Jarrar, J. Demy, and R. Meersman. On using conceptual data modeling for<br>ontology engineering. _Journal on Data Semantics: Special issue on Best papers_<br>_from the ER/ODBASE/COOPIS 2002 Conferences_, 1(1):185–207, 2003.|
|[JKD06]|Mustafa Jarrar, C. Maria Keet, and Paolo Dongilli. Multilingual verbalization<br>of ORM conceptual models and axiomatized ontologies. Starlab technical report,<br>Vrije Universiteit Brussel, Belgium, February 2006.|
|[KA08]|C. Maria Keet and Alessandro Artale. Representing and reasoning over a tax-<br>onomy of part-whole relations. _Applied Ontology – Special issue on Ontological_<br>_Foundations for Conceptual Modeling_, 3(1-2):91–110, 2008.|
|[KA10]|C. Maria Keet and Alessandro Artale. A basic characterization of relation migra-<br>tion. In R. Meersman et al., editors, _OTM Workshops, 6th International Work-_<br>_shop on Fact-Oriented Modeling (ORM’10)_, volume 6428 of_LNCS_, pages 484–493.<br>Springer, 2010. October 27-29, 2010, Hersonissou, Crete, Greece.|
|[KAGC08]|C. Maria Keet, Ronell Alberts, Aurona Gerber, and Gibson Chimamiwa. Enhanc-<br>ing web portals with Ontology-Based Data Access: the case study of South Africa’s<br>Accessibility Portal for people with disabilities. In Catherine Dolbear, Alan Rut-<br>tenberg, and Uli Sattler, editors, _Proceedings of the Fifth OWL: Experiences and_<br>_Directions (OWLED 2008)_, volume 432 of_CEUR-WS_, 2008. Karlsruhe, Germany,<br>26-27 October 2008.|



_Bibliography_ 

|238|_Bibliography_|
|---|---|
|[Kas05]|Gilles Kassel. Integration of the DOLCE top-level ontology into the OntoSpec<br>methodology.<br>Technical Report HAL : hal-00012203/arXiv :<br>cs.AI/0510050,<br>Laboratoire de Recherche en Informatique d’Amiens (LaRIA), October 2005.<br>http://hal.archives-ouvertes.fr/ccsd-00012203.|
|[Kaz08]|Yevgeny Kazakov. RIQ and SROIQ are harder than SHOIQ. In_11th International_<br>_Conference on Principles of Knowledge Representation and Reasoning (KR’08)_,<br>pages 274–284, 2008. 16-19 August 2008, Sydney, Australia.|
|[KB17]|C. Maria Keet and Sonia Berman. Determining the preferred representation of<br>temporal constraints in conceptual models. In H.C. Mayr et al., editors, _36th In-_<br>_ternational Conference on Conceptual Modeling (ER’17)_, volume 10650 of _LNCS_,<br>pages 437–450. Springer, 2017. 6-9 Nov 2017, Valencia, Spain.|
|[KC16]|C. M. Keet and T. Chirema. A model for verbalising relations with roles in multiple<br>languages. In E. Blomqvist, P. Ciancarini, F. Poggi, and F. Vitali, editors,_Proceed-_<br>_ings of the 20th International Conference on Knowledge Engineering and Knowl-_<br>_edge Management (EKAW’16)_, volume 10024 of _LNAI_, pages 384–399. Springer,<br>2016. 19-23 November 2016, Bologna, Italy.|
|[KdKL14]|C. Maria Keet, Claudia d’Amato, Zubeida C. Khan, and Agnieszka Lawrynowicz.<br>Exploring reasoning with the DMOP ontology. In S. Bail, B. Glimm, E. Jim´enez-<br>Ruiz, N. Matentzoglu, B. Parsia, and A. Steigmiller, editors, _3rd Workshop on_<br>_Ontology Reasoner Evaluation (ORE’14)_, volume 1207 of _CEUR-WS_, pages 64–<br>70. CEUR-WS, 2014. July 13, 2014, Vienna, Austria.|
|[Kee05]|C. Maria Keet. Factors afecting ontology development in ecology. In B Lud¨ascher<br>and L. Raschid, editors, _Data Integration in the Life Sciences 2005 (DILS2005)_,<br>volume 3615 of _LNBI_, pages 46–62. Springer Verlag, 2005. San Diego, USA, 20-22<br>July 2005.|
|[Kee09]|C. Maria Keet. Constraints for representing transforming entities in bio-ontologies.<br>In R. Serra and R. Cucchiara, editors,_11th Congress of the Italian Association for_<br>_Artifcial Intelligence (AI*IA 2009)_, volume 5883 of _LNAI_, pages 11–20. Springer<br>Verlag, 2009. Reggio Emilia, Italy, Dec. 9-12, 2009.|
|[Kee10a]|C. Maria Keet. Dependencies between ontology design parameters. _International_<br>_Journal of Metadata, Semantics and Ontologies_, 5(4):265–284, 2010.|
|[Kee10b]|C. Maria Keet. On the feasibility of description logic knowledge bases with rough<br>concepts and vague instances. In _Proceedings of the 23rd International Workshop_<br>_on Description Logics (DL’10)_, CEUR-WS, pages 314–324, 2010. 4-7 May 2010,<br>Waterloo, Canada.|
|[Kee10c]|C. Maria Keet.<br>Ontology engineering with rough concepts and instances.<br>In<br>P. Cimiano and H.S. Pinto, editors, _17th International Conference on Knowl-_<br>_edge Engineering and Knowledge Management (EKAW’10)_, volume 6317 of_LNCS_,<br>pages 507–517. Springer, 2010. 11-15 October 2010, Lisbon, Portugal.|
|[Kee11a]|C. Maria Keet. Rough subsumption reasoning with rOWL. In _Proceeding of the_<br>_SAICSIT Annual Research Conference 2011 (SAICSIT’11)_, pages 133–140. ACM<br>Conference Proceedings, 2011. Cape Town, South Africa, October 3-5, 2011.|
|[Kee11b]|C. Maria Keet. The use of foundational ontologies in ontology development: an<br>empirical assessment. In G. Antoniou et al., editors, _8th Extended Semantic Web_<br>_Conference (ESWC’11)_, volume 6643 of _LNCS_, pages 321–335. Springer, 2011.<br>Heraklion, Crete, Greece, 29 May-2 June, 2011.|
|[Kee12a]|C. Maria Keet. Detecting and revising faws in OWL object property expressions.<br>In A. ten Teije et al., editors, _18th International Conference on Knowledge En-_<br>_gineering and Knowledge Management (EKAW’12)_, volume 7603 of _LNAI_, pages<br>252–266. Springer, 2012. Oct 8-12, Galway, Ireland.|



_Bibliography_ 

239 

|[Kee12b]|C. Maria Keet. Transforming semi-structured life science diagrams into meaningful<br>domain ontologies with DiDOn. _Journal of Biomedical Informatics_, 45:482–494,<br>2012.|
|---|---|
|[Kee13]|C. Maria Keet.<br>Ontology-driven formal conceptual data modeling for biologi-<br>cal data analysis. In Mourad Elloumi and Albert Y. Zomaya, editors, _Biological_<br>_Knowledge Discovery Handbook: Preprocessing, Mining and Postprocessing of Bi-_<br>_ological Data_, chapter 6, pages 129–154. Wiley, 2013.|
|[Kee14]|C. Maria Keet. Preventing, detecting, and revising faws in object property ex-<br>pressions. _Journal on Data Semantics_, 3(3):189–206, 2014.|
|[Kee16]|C. M. Keet.<br>Relating some stuf to other stuf.<br>In E. Blomqvist, P. Ciancar-<br>ini, F. Poggi, and F. Vitali, editors, _Proceedings of the 20th International Confer-_<br>_ence on Knowledge Engineering and Knowledge Management (EKAW’16)_, volume<br>10024 of _LNAI_, pages 368–383. Springer, 2016. 19-23 November 2016, Bologna,<br>Italy.|
|[Kee17a]|C. M. Keet. A note on the compatibility of part-whole relations with foundational<br>ontologies. In_FOUST-II: 2nd Workshop on Foundational Ontology, Joint Ontology_<br>_Workshops 2017_, volume 2050 of _CEUR-WS_, page 10p, 2017. 21-23 September<br>2017, Bolzano, Italy.|
|[Kee17b]|C. M. Keet.<br>Representing and aligning similar relations: parts and wholes in<br>isizulu vs english. In J. Gracia, F. Bond, J. McCrae, P. Buitelaar, C. Chiarcos,<br>and S. Hellmann, editors,_Language, Data, and Knowledge 2017 (LDK’17)_, volume<br>10318 of _LNAI_, pages 58–73. Springer, 2017. 19-20 June, 2017, Galway, Ireland.|
|[KFRMG12]|C. Maria Keet, Francis C. Fern´andez-Reyes, and Annette Morales-Gonz´alez. Rep-<br>resenting mereotopological relations in OWL ontologies with ontoparts.<br>In<br>E. Simperl et al., editors, _Proceedings of the 9th Extended Semantic Web Con-_<br>_ference (ESWC’12)_, volume 7295 of _LNCS_, pages 240–254. Springer, 2012. 29-31<br>May 2012, Heraklion, Crete, Greece.|
|[KG17]|Megan Katsumi and Michael Gr¨uninger. Choosing ontologies for reuse. _Applied_<br>_Ontology_, 12(3-4):195–221, 2017.|
|[KHH16]|Nazifa Karima, Karl Hammar, and Pascal Hitzler. How to document ontology de-<br>sign patterns. In_Proceedings of the 7th Workshop on Ontology Patterns (WOP’16)_,<br>2016. Kobe, Japan, on 18th October 2016.|
|[KHS<sup>+</sup>17]|Evgeny Kharlamov, Dag Hovland, Martin G. Skaeveland, Dimitris Bilidas, Ernesto<br>Jim´enez-Ruiz, Guohui Xiao, Ahmet Soylu, Davide Lanti, Martin Rezk, Dmitriy<br>Zheleznyakov, Martin Giese, Hallstein Lie, Yannis Ioannidis, Yannis Kotidis,<br>Manolis Koubarakis, and Arild Waaler.<br>Ontology based data access in statoil.<br>_Web Semantics: Science, Services and Agents on the World Wide Web_, 44:3–36,<br>2017.|
|[KJLW12]|Daniel Kless, Ludger Jansen, Jutta Lindenthal, and Jens Wiebensohn. A method<br>for re-engineering a thesaurus into an ontology. In M. Donnelly and G. Guizzardi,<br>editors, _Proceedings of the Seventh International Conference on Formal Ontology_<br>_in Information Systems_, pages 133–146. IOS Press, 2012.|
|[KK12]|Zubeida Khan and C. Maria Keet. ONSET: Automated foundational ontology se-<br>lection and explanation. In A. ten Teije et al., editors, _18th International Confer-_<br>_ence on Knowledge Engineering and Knowledge Management (EKAW’12)_, volume<br>7603 of _LNAI_, pages 237–251. Springer, 2012. Oct 8-12, Galway, Ireland.|
|[KK13a]|Z. Khan and C. Maria Keet. Addressing issues in foundational ontology mediation.<br>In Joaquim Filipe and Jan Dietz, editors,_5th International Conference on Knowl-_<br>_edge Engineering and Ontology Development (KEOD’13)_, pages 5–16. INSTICC,<br>SCITEPRESS – Science and Technology Publications, 2013. Vilamoura, Portugal,<br>19-22 September 2013.|



_Bibliography_ 

240 

|[KK13b]|Zubeida Khan and C. Maria Keet. The foundational ontology library ROMULUS.<br>In Alfredo Cuzzocrea and Sofan Maabout, editors, _Proceedings of the 3rd In-_<br>_ternational Conference on Model & Data Engineering (MEDI’13)_, volume 8216 of<br>_LNCS_, pages 200–211. Springer, 2013. September 25-27, 2013, Amantea, Calabria,<br>Italy.|
|---|---|
|[KK14]|Zubeida C. Khan and C. Maria Keet. Feasibility of automated foundational ontol-<br>ogy interchangeability. In K. Janowicz and S. Schlobach, editors,_19th International_<br>_Conference on Knowledge Engineering and Knowledge Management (EKAW’14)_,<br>volume 8876 of_LNAI_, pages 225–237. Springer, 2014. 24-28 Nov, 2014, Linkoping,<br>Sweden.|
|[KK15a]|Z. C. Khan and C. M. Keet. Foundational ontology mediation in ROMULUS. In<br>A. Fred et al., editors, _Knowledge Discovery, Knowledge Engineering and Knowl-_<br>_edge Management: IC3K 2013 Selected Papers_, volume 454 of _CCIS_, pages 132–<br>152. Springer, 2015.|
|[KK15b]|Zubeida C. Khan and C. Maria Keet. An empirically-based framework for ontology<br>modularization. _Applied Ontology_, 10(3-4):171–195, 2015.|
|[KK16]|Zubeida C. Khan and C. Maria Keet. ROMULUS: a Repository of Ontologies for<br>MULtiple USes populated with foundational ontologies. _Journal on Data Seman-_<br>_tics_, 5(1):19–36, 2016.|
|[KK17a]|C. M. Keet and L. Khumalo. Toward a knowledge-to-text controlled natural lan-<br>guage of isiZulu. _Language Resources and Evaluation_, 51(1):131–157, 2017.|
|[KK17b]|C. Maria Keet and Oliver Kutz. Orchestrating a network of mereo(topo)logical<br>theories. In _Proceedings of the Knowledge Capture Conference (K-CAP’17)_, K-<br>CAP 2017, pages 11:1–11:8, New York, NY, USA, 2017. ACM.|
|[KKG13]|C. Maria Keet, M. Tahir Khan, and Chiara Ghidini. Ontology authoring with<br>FORZA. In _Proceedings of the 22nd ACM international conference on Confer-_<br>_ence on Information & Knowledge Management (CIKM’13)_, pages 569–578. ACM<br>proceedings, 2013. Oct. 27 - Nov. 1, 2013, San Francisco, USA.|
|[KKS12]|Yevgeny Kazakov, Markus Kr¨otzsch, and Frantisek Simancik.<br>ELK reasoner:<br>Architecture and evaluation. In Ian Horrocks, Mikalai Yatskevich, and Ernesto<br>Jim´enez-Ruiz, editors, _1st International Workshop on OWL Reasoner Evaluation_<br>_(ORE-2012)_, volume 858 of _CEUR Workshop Proceedings_. CEUR-WS.org, 2012.<br>Manchester, UK, July 1st.|
|[KL16]|C. M. Keet and A. Lawrynowicz.<br>Test-driven development of ontologies.<br>In<br>H. Sack et al., editors,_Proceedings of the 13th Extended Semantic Web Conference_<br>_(ESWC’16)_, volume 9678 of_LNCS_, pages 642–657, Berlin, 2016. Springer. 29 May<br>- 2 June, 2016, Crete, Greece.|
|[KLd<sup>+</sup>15]|C. Maria Keet, Agnieszka Lawrynowicz, Claudia d’Amato, Alexandros Kalousis,<br>P. Nguyen, Raul Palma, Robert Stevens, and Melani Hilario. The data mining<br>optimization ontology. _Web Semantics: Science, Services and Agents on the World_<br>_Wide Web_, 32:43–53, 2015.|
|[KLT<sup>+</sup>10]|R. Kontchakov, C. Lutz, D. Toman, F. Wolter, and M. Zakharyaschev. The com-<br>bined approach to query answering in DL-Lite. In Fangzhen Lin, Ulrike Sattler,<br>and Miroslaw Truszczynski, editors, _Principles of Knowledge Representation and_<br>_Reasoning: Proceedings of the Twelfth International Conference (KR 2010)_. AAAI<br>Press, 2010. Toronto, Ontario, Canada, May 9-13, 2010.|
|[KML10]|O. Kutz, T. Mossakowski, and D. L¨ucke. Carnap, Goguen, and the Hyperontolo-<br>gies: Logical Pluralism and Heterogeneous Structuring in Ontology Design. _Logica_<br>_Universalis_, 4(2), 2010. Special issue on ‘Is Logic Universal?’.|



_Bibliography_ 

241 

|[KSFPV13]|C. Maria Keet, Mari Carmen Su´arez-Figueroa, and Maria Poveda-Villal´on. The<br>current landscape of pitfalls in ontologies. In Joaquim Filipe and Jan Dietz, ed-<br>itors, _5th International Conference on Knowledge Engineering and Ontology De-_<br>_velopment (KEOD’13)_, pages 132–139. INSTICC, SCITEPRESS – Science and<br>Technology Publications, 2013. Vilamoura, Portugal, 19-22 September 2013.|
|---|---|
|[KSFPV15]|C. M. Keet, M. C. Su´arez-Figueroa, and M. Poveda-Villal´on. Pitfalls in ontologies<br>and tips to prevent them. In A. Fred, J. L. G. Dietz, K. Liu, and J. Filipe, editors,<br>_Knowledge Discovery, Knowledge Engineering and Knowledge Management: IC3K_<br>_2013 Selected papers_, volume 454 of _CCIS_, pages 115–131. Springer, Berlin, 2015.|
|[KSH12]|Markus Kr¨otzsch, Frantiˇsek Simanˇc´ık, and Ian Horrocks.<br>A description logic<br>primer. Technical Report 1201.4089v1, Department of Computer Science, Uni-<br>versity of Oxford, UK, 2012. arXiv:cs.LO/12014089v1.|
|[LAF14]|Pilar Le´on-Ara´uz and Pamela Faber. Context and terminology in the multilingual<br>semantic web. In Paul Buitelaar and Philip Cimiano, editors, _Towards the Mul-_<br>_tilingual Semantic Web: Principles, Methods and Applications_, chapter 3, pages<br>31–47. Springer, 2014.|
|[Lam17]|Jean-Baptiste Lamy. Owlready: Ontology-oriented programming in python with<br>automaticclassifcation and high level constructs for biomedical ontologies. _Artif-_<br>_cial Intelligence in Medicine_, 2017.|
|[Leo08]|Joop Leo. Modeling relations. _Journal of Philosophical Logic_, 37:353–385, 2008.|
|[LHC11]|Kaihong Liu, William R. Hogan, and Rebecca S. Crowley. Natural language pro-<br>cessing methods and systems for biomedical ontology learning. _Journal of Biomed-_<br>_ical Informatics_, 44(1):163–179, 2011.|
|[LLNW11]|Thorsten Liebig, Marko Luther, Olaf Noppens, and Michael Wessel. OWLlink.<br>_Semantic Web Journal_, 2(1):23–32, 2011.|
|[Loe15]|Frank Loebe.<br>_Ontological Semantics: An Attempt at Foundations of Ontology_<br>_Representation_. Phd thesis, Fakult¨at f¨ur Mathematik und Informatik, Universit¨at<br>Leipzig, 2015.|
|[LS08]|Thomas Lukasiewicz and Umberto Straccia. Managing uncertainty and vagueness<br>in description logics for the semantic web. _Journal of Web Semantics_, 6(4):291–<br>308, 2008.|
|[LT09]|Lina Lubyte and Sergio Tessaris. Automated extraction of ontologies wrapping<br>relational data sources. In _Proceedings of International Conference on Database_<br>_and Expert Systems Applications (DEXA’09)_, pages 128–142. Springer, 2009.|
|[LTW09]|C. Lutz, D. Toman, and F. Wolter. Conjunctive query answering in the description<br>logic EL using a relational database system. In_Proceedings of the 21st International_<br>_Joint Conference on Artifcial Intelligence IJCAI’09_. AAAI Press, 2009.|
|[Luk17]|Thomas Lukasiewicz. Uncertainty reasoning for the semantic web. In G. Ianni<br>et al., editors, _Reasoning Web 2017_, volume 10370 of _LNCS_, pages 276–291.<br>Springer, 2017.|
|[LWZ08]|Carsten Lutz, Frank Wolter, and Michael Zakharyaschev. Temporal description<br>logics: A survey. In _Proc. of the Fifteenth International Symposium on Temporal_<br>_Representation and Reasoning (TIME’08)_. IEEE Computer Society Press, 2008.|
|[MAdCB<sup>+</sup>12]|John McCrae, Guadalupe Aguado-de Cea, Paul Buitelaar, Philipp Cimiano,<br>Thierry Declerck, Asunci´on G´omez-P´erez, Jorge Gracia, Laura Hollink, Elena<br>Montiel-Ponsoda, Dennis Spohr, and Tobias Wunner.<br>Interchanging lexical re-<br>sources on the semantic web. _Language Resources and Evaluation_, 46(4):701–719,<br>2012.|



_Bibliography_ 

|242|_Bibliography_|
|---|---|
|[MB09]|Alistar Miles and Sean Bechhofer. SKOS Simple Knowledge Organization System<br>Reference. W3c recommendation, World Wide Web Consortium (W3C), 18 August<br>2009.|
|[MBG<sup>+</sup>03]|C. Masolo, S. Borgo, A. Gangemi, N. Guarino, and A. Oltramari.<br>On-<br>tology library.<br>WonderWeb Deliverable D18 (ver. 1.0, 31-12-2003)., 2003.<br>http://wonderweb.semanticweb.org.|
|[MBSJ08]|Joshua S. Madin, Shawn Bowers, Mark P. Schildhauer, and Matthew B. Jones.<br>Advancing ecological research with ontologies.<br>_Trends in Ecology & Evolution_,<br>23(3):159–168, 2008.|
|[McC10]|Dave McComb. Gist: The minimalist upper ontology (abstract). Semantic Tech-<br>nology Conference, 2010. 21-25 June 2010, San Francisco, USA.|
|[McD17]|M. H. McDaniel. _An Automated System for the Assessment and Ranking of Do-_<br>_main Ontologies_. PhD thesis, Department of Computer Science, 2017.|
|[MCNK15]|T. Mossakowski, M. Codescu, F. Neuhaus, and O. Kutz. _The Road to Univer-_<br>_sal Logic–Festschrift for 50th birthday of Jean-Yves Beziau, Volume II_, chapter<br>The distributed ontology, modelling and specifcation language - DOL. Studies in<br>Universal Logic. Birkh¨auser, 2015.|
|[MdCB<sup>+</sup>12]|John McCrae, Guadalupe Aguado de Cea, Paul Buitelaar, Philipp Cimiano,<br>Thierry Declerck, Asunci´on G´omez-P´erez, Jorge Gracia, Laura Hollink, Elena<br>Montiel-Ponsoda, Dennis Spohr, and Tobias Wunner. The lemon cookbook. Tech-<br>nical report, Monnet Project, June 2012. www.lemon-model.net.|
|[Mer10a]|G. H. Merrill. Ontological realism: Methodology or misdirection? _Applied Ontol-_<br>_ogy_, 5(2):79108, 2010.|
|[Mer10b]|Gary H. Merrill. Realism and reference ontologies: Considerations, refections and<br>problems. _Applied Ontology_, 5(3):189–221, 2010.|
|[MGH<sup>+</sup>09]|Boris Motik, Bernardo Cuenca Grau, Ian Horrocks, Zhe Wu, Achille Fokoue, and<br>Carsten Lutz. OWL 2 Web Ontology Language Profles. W3C recommendation,<br>W3C, 27 Oct. 2009. `http://www.w3.org/TR/owl2-profiles/`.|
|[Miz10]|R. Mizoguchi. YAMATO: Yet Another More Advanced Top-level Ontology. In<br>_Proceedings of the Sixth Australasian Ontology Workshop_, Conferences in Research<br>and Practice in Information, pages 1–16. CRPIT, 2010. Sydney : ACS.|
|[MK19]|Z. Mahlaza and C. M. Keet. A classifcation of grammar-infused templates for<br>ontology and model verbalisation. In E. Garoufallou et al., editors, _13th Metadata_<br>_and Semantics Research Conference (MTSR’19)_, volume 1057 of _CCIS_, pages 64–<br>76. Springer, 2019. 28-31 Oct 2019, Rome, Italy.|
|[MPSP09]|Boris Motik, Peter F. Patel-Schneider, and Bijan Parsia. OWL 2 web ontology lan-<br>guage structural specifcation and functional-style syntax. W3c recommendation,<br>W3C, 27 Oct. 2009. `http://www.w3.org/TR/owl2-syntax/`.|
|[MR05]|M. C. MacLeod and E. M. Rubenstein. Universals. In _The Internet Encyclopedia_<br>_of Philosophy_. 2005. `http://www.iep.utm.edu/u/universa.htm`.|
|[MSKK07]|R. Mizoguchi, E. Sunagawa, K. Kozaki, and Y. Kitamura. A model of roles within<br>an ontology development tool: Hozo. _Applied Ontology_, 2(2):159–179, 2007.|
|[N<sup>+</sup>13]|Fabian Neuhaus et al. Towards ontology evaluation across the life cycle. _Applied_<br>_Ontology_, 8(3):179–194, 2013.|
|[Neu17]|Fabian Neuhaus. On the defnition of ontology. In _FOUST-II: 2nd Workshop on_<br>_Foundational Ontology, Joint Ontology Workshops 2017_, volume 2050 of _CEUR-_<br>_WS_, page 10p, 2017. 21-23 September 2017, Bolzano, Italy.|



_Bibliography_ 

243 

|[NM01]|N.F. Noy and D.L. McGuinness. Ontology development 101: A guide to creating<br>your frst ontology. Technical Report KSL-01-05, and Stanford Medical Informatics<br>Technical Report SMI-2001-0880, Stanford Knowledge Systems Laboratory, March<br>2001.|
|---|---|
|[NP01]|I. Niles and A. Pease. Towards a standard upper ontology. In Chris Welty and<br>Barry Smith, editors, _Proceedings of the 2nd International Conference on Formal_<br>_Ontology in Information Systems (FOIS-2001)_, 2001. Ogunquit, Maine, October<br>17-19, 2001.|
|[OHWM10]|Martin J. O’Connor, Christian Halaschek-Wiener, and Mark A. Musen. Mapping<br>master: A fexible approach for mapping spreadsheets to OWL. In P. F. Patel-<br>Schneider et al., editors,_Proceedings of the International Semantic Web Conference_<br>_2010 (ISWC’10)_, volume 6497 of _LNCS_, pages 194–208, Berlin, 2010. Springer.|
|[Ope]|OpenMRS. `https://www.transifex.com/openmrs/OpenMRS/`.|
|[PD<sup>+</sup>09]|V. Presutti, E Daga, et al. extreme design with content ontology design patterns.<br>In _Proc. of WS on OP’09_, volume 516 of _CEUR-WS_, pages 83–97, 2009.|
|[Per17]|Silvio Peroni. A simplifed agile methodology for ontology development. In Dragoni<br>M., Poveda-Villal´on M., and Jimenez-Ruiz E., editors, _OWLED 2016, ORE 2016:_<br>_OWL: Experiences and Directions Reasoner Evaluation_, volume 10161 of _LNCS_,<br>pages 55–69. Springer, 2017.|
|[Por10]|F.<br>Portoraro.<br>Automated<br>reasoning.<br>In<br>E.<br>Zalta,<br>editor,<br>_Stanford_<br>_Encyclopedia of Philosophy_. 2010.<br>`http://plato.stanford.edu/entries/`<br>`reasoning-automated/`.|
|[PS07]|Zdzislaw Pawlak and Andrzej Skowron. Rudiments of rough sets. _Information_<br>_Sciences_, 177(1):3–27, 2007.|
|[PS15]|Adrian Paschke and Ralph Schaefermeier. Aspect OntoMaven - aspect-oriented<br>ontology development and confguration with OntoMaven.<br>Technical Report<br>1507.00212v1, Institute of Computer Science, Free University of Berlin, July 2015.|
|[PT11]|Rafael Pe˜naloza and Anni-Yasmin Turhan. A practical approach for computing<br>generalization inferences in EL. In G. Antoniou et al., editors,_8th Extended Seman-_<br>_tic Web Conference (ESWC’11)_, volume 6643 of _LNCS_, pages 410–423. Springer,<br>2011. Heraklion, Crete, Greece, 29 May-2 June, 2011.|
|[PVSFGP12]|Mar´ıa Poveda-Villal´on, Mari Carmen Su´arez-Figueroa, and Asunci´on G´omez-<br>P´erez.<br>Validating ontologies with OOPS!<br>In A. ten Teije et al., editors, _18th_<br>_International Conference on Knowledge Engineering and Knowledge Management_<br>_(EKAW’12)_, volume 7603 of _LNAI_, pages 267–281, Germany, 2012. Springer. Oct<br>8-12, Galway, Ireland.|
|[RCB<sup>+</sup>07]|Alan Ruttenberg, Tim Clark, William Bug, Matthias Samwald, Olivier Bodenrei-<br>der, Helen Chen, Donald Doherty, Kerstin Forsberg, Yong Gao, Vipul Kashyap,<br>June Kinoshita, Joanne Luciano, M Scott Marshall, Chimezie Ogbuji, Jonathan<br>Rees, Susie Stephens, Gwendolyn T Wong, Elizabeth Wu, Davide Zaccagnini,<br>Tonya Hongsermeier, Eric Neumann, Ivan Herman, and Kei-Hoi Cheung. Advanc-<br>ing translational research with the semantic web. _BMC Bioinformatics_, 8(Suppl<br>3):S2, 2007.|



- [RCC92] D. A. Randell, Z. Cui, and A. G. Cohn. A spatial logic based on regions and connection. In _Proc. 3rd Int. Conf. on Knowledge Representation and Reasoning_ , pages 165–176. Morgan Kaufmann, 1992. 

- [RCVB09] C. Roussey, O. Corcho, and L. Vilches-Bl´azquez. A catalogue of OWL ontology antipatterns. In _Proc. of K-CAP’09_ , pages 205–206, 2009. 

_Bibliography_ 

244 

- [RD97] E. Reiter and R. Dale. Building applied natural language generation systems. _Natural Language Engineering_ , 3:57–87, 1997. 

- [RDH<sup>+</sup> 04] AL Rector, N Drummond, M Horridge, L Rogers, H Knublauch, R Stevens, H Wang, and C. Wroe, Csallner. OWL pizzas: Practical experience of teaching OWL-DL: Common errors & common patterns. In _Proceedings of the 14th International Conference Knowledge Acquisition, Modeling and Management (EKAW’04)_ , volume 3257 of _LNCS_ , pages 63–81, Whittlebury Hall, UK, 2004. Springer. 

- [RKH08a] Sebastian Rudolph, Markus Kr¨otzsch, and Pascal Hitzler. All elephants are bigger than all mice. In Franz Baader, Carsten Lutz, and Boris Motik, editors, _Proc. 21st Int. Workshop on Description Logics (DL08)_ , volume 353 of _CEUR-WS_ , 2008. Dresden, Germany, May 1316, 2008. 

- [RKH08b] Sebastian Rudolph, Markus Kr¨otzsch, and Pascal Hitzler. Cheap boolean role constructors for description logics. In Steffen H¨olldobler, Carsten Lutz, and Heinrich Wansing, editors, _Proc. 11th European Conf. on Logics in Artificial Intelligence (JELIA08)_ , volume 5293 of _LNAI_ , page 362374. Springer, 2008. 

- [RMC12] Mariano Rodr´ıguez-Muro and Diego Calvanese. Quest, an OWL 2 QL reasoner for ontology-based data access. In P. Klinov and M. Horridge, editors, _7th Workshop on OWL: Experiences and Directions (OWLED’12)_ , volume 849 of _CEUR-WS_ , 2012. 27-28 May, Heraklion, Crete, Greece. 

- [RMJ03] C. Rosse and J. L. V. Mejino Jr. A reference ontology for biomedical informatics: the foundational model of anatomy. _J. of Biomedical Informatics_ , 36(6):478–500, 2003. 

- [RMLC08] Mariano Rodriguez-Muro, Lina Lubyte, and Diego Calvanese. Realizing Ontology Based Data Access: A plug-in for Prot´eg´e. In _Proc. of the Workshop on Information Integration Methods, Architectures, and Systems (IIMAS 2008)_ . IEEE Computer Society, 2008. 

- [RRZvdH03] Alan L. Rector, Jeremy Rogers, Pieter E. Zanstra, and Egbert J. van der Haring. OpenGALEN: Open source medical terminology and tools. In _American Medical Informatics Association Annual Symposium (AMIA’03)_ . AMIA, 2003. Washington, DC, USA, November 8-12. 

- [SAR<sup>+</sup> 07] B. Smith, M. Ashburner, C. Rosse, J. Bard, W. Bug, W. Ceusters, L.J. Goldberg, K. Eilbeck, A. Ireland, C.J. Mungall, The OBI Consortium, N. Leontis, A.B. Rocca-Serra, A. Ruttenberg, S-A. Sansone, M. Shah, P.L. Whetzel, and S. Lewis. The OBO Foundry: Coordinated evolution of ontologies to support biomedical data integration. _Nature Biotechnology_ , 25(11):1251–1255, 2007. 

- [Sat07] Ulrike Sattler. Reasoning in description logics: Basics, extensions, and relatives. In G. Antoniou et al., editors, _Reasoning Web 2007_ , volume 4636 of _LNCS_ , page 154182. Springer, 2007. 

- [SB13] Stefan Schulz and Martin Boeker. BioTopLite: An upper level ontology for the life sciences. evolution, design and application. In _Informatik 2013, 43. Jahrestagung der Gesellschaft f¨ur Informatik e.V. (GI), Informatik angepasst an Mensch, Organisation und Umwelt_ , volume 220 of _LNI_ , pages 1889–1899. GI, 2013. 16-20. September 2013, Koblenz. 

- [SBF98] R. Studer, R. Benjamins, and D. Fensel. Knowledge engineering: Principles and methods. _Data & Knowledge Engineering_ , 25(1-2):161198, 1998. 

- [SC10] Barry Smith and Werner Ceusters. Ontological realism: A methodology for coordinated evolution of scientific ontologies. _Applied Ontology_ , 5(3):139–188, 2010. 

- [SCK<sup>+</sup> 05] B. Smith, W. Ceusters, B. Klagges, J. K¨ohler, A. Kumar, J. Lomax, C. Mungall, F. Neuhaus, A. L. Rector, and C. Rosse. Relations in biomedical ontologies. _Genome Biology_ , 6:R46, 2005. 

_Bibliography_ 

245 

|[SD17]|Hazem Safwat and Brian Davis. CNLs for the semantic web: a state of the art.<br>_Language Resources & Evaluation_, 51(1):191–220, 2017.|
|---|---|
|[SFdCB<sup>+</sup>08]|Mari Carmen Suarez-Figueroa, Guadalupe Aguado de Cea, Carlos Buil, Klaas<br>Dellschaft, Mariano Fernandez-Lopez, Andres Garcia, Asuncion G´omez-P´erez,<br>German Herrero, Elena Montiel-Ponsoda, Marta Sabou, Boris Villazon-Terrazas,<br>and Zheng Yufei. NeOn methodology for building contextualized ontology net-<br>works. NeOn Deliverable D5.4.1, NeOn Project, 2008.|
|[SGJR<sup>+</sup>17]|Ahmet Soylu, Martin Giese, Ernesto Jimenez-Ruiz, Evgeny Kharlamov, Dmitriy<br>Zheleznyakov, and Ian Horrocks. Ontology-based end-user visual query formula-<br>tion: Why, what, who, how, and which?<br>_Universal Access in the Information_<br>_Society_, 16(2):435–467, Jun 2017.|
|[SKC<sup>+</sup>08]|R. Schwitter, K. Kaljurand, A. Cregan, C. Dolbear, and G. Hart. A comparison<br>of three controlled natural languages for OWL 1.1. In_Proc. of OWLED 2008 DC_,<br>2008. Washington, DC, USA metropolitan area, on 1-2 April 2008.|
|[SKZ<sup>+</sup>18]|A. Soylu, E. Kharlamov, D. Zheleznyakov, E. Jimenez Ruiz, M. Giese, M.G. Sk-<br>jaeveland, D. Hovland, R. Schlatte, S. Brandt, H. Lie, and I. Horrocks. Optiquevqs:<br>a visual query system over ontologies for industry. _Semantic Web_, 9(5):627–660,<br>2018.|
|[SLL<sup>+</sup>04]|Dagobert Soergel, Boris Lauser, Anita Liang, Frehiwot Fisseha, Johannes Keizer,<br>and Stephen Katz. Reengineering thesauri for new applications: the AGROVOC<br>example. _Journal of Digital Information_, 4(4), 2004.|
|[SMB10]|Elena Simperl, Malgorzata Mochol, and Tobias B¨urger. Achieving maturity: the<br>state of practice in ontology engineering in 2009. _International Journal of Com-_<br>_puter Science and Applications_, 7(1):45–65, 2010.|
|[Smi04]|B. Smith. Beyond concepts, or: Ontology as reality representation. In A. Varzi<br>and L. Vieu, editors,_Formal Ontology and Information Systems. Proceedings of the_<br>_Third International Conference (FOIS’04)_, pages 73–84. Amsterdam: IOS Press,<br>2004.|
|[SNO12]|SNOMED CT, last accessed: 27-1-2012. `http://www.ihtsdo.org/snomed-ct/`.|
|[Sol05]|D. Solow. _How to read and do proofs: An introduction to mathematical thought_<br>_processes_. John Wiley & Sons, Hoboken NJ, USA., 4th edition, 2005.|
|[SS06]|Vijayan Sugumaran and Veda C. Storey. The role of domain ontologies in database<br>design: An ontology management and conceptual modeling environment. _ACM_<br>_Transactions on Database Systems_, 31(3):1064–1094, 2006.|
|[SS09]|Markus Stocker and Evren Sirin. Pelletspatial: A hybrid RCC-8 and RDF/OWL<br>reasoning and query engine. In Rinke Hoekstra and Pieter Patel-Schneider, editors,<br>_Proceedings of the 6th International Workshop OWL: Experiences and Directions_<br>_(OWLED’09)_, volume 529 of _CEUR-WS_, 2009. Chantilly, Virginia, USA, 23-24<br>October 2009.|
|[SSBS09]|Stefan Schulz, Holger Stenzhorn, Martin Boekers, and Barry Smith. Strengths<br>and limitations of formal ontologies in the biomedical domain. _Electronic Jour-_<br>_nal of Communication, Information and Innovation in Health (Special Issue on_<br>_Ontologies, Semantic Web and Health)_, 3(1):31–45, 2009.|
|[SSRG<sup>+</sup>12]|S. Schulz, D. Seddig-Raufe, N. Grewe, J. R¨ohl, D. Schober, M. Boeker, and<br>L. Jansen.<br>Guideline on developing good ontologies in the biomedical domain<br>with description logics. Technocal report, December 2012. v1.0.|
|[SSSS01]|S. Staab, H.P. Schnurr, R. Studer, and Y. Sure. Knowledge processes and ontolo-<br>gies. _IEEE Intelligent Systems_, 16(1):26–34, 2001.|



_Bibliography_ 

246 

|[STK16]|L. Sanby, I. Todd, and C. M. Keet. Comparing the template-based approach to<br>gf: the case of afrikaans. In _2nd International Workshop on Natural Language_<br>_Generation and the Semantic Web (WebNLG’16)_, page (in print). ACL, 2016.<br>September 6, 2016, Edinburgh, Scotland.|
|---|---|
|[Str08]|Umberto Straccia. Managing uncertainty and vagueness in description logics, logic<br>programs and description logic programs. In _Reasoning Web, 4th International_<br>_Summer School_, 2008.|
|[THU<sup>+</sup>16]|Niket Tandon, Charles Hariman, Jacopo Urbani, Anna Rohrbach, Marcus<br>Rohrbach, and Gerhard Weikum. Commonsense in parts: Mining part-whole re-<br>lations from the web and image tags. In _Proceedings of the Thirtieth AAAI Con-_<br>_ference on Artifcial Intelligence (AAAI’16)_, pages 243–250. AAAI Press, 2016.|
|[Tob01]|S. Tobies. _Complexity Results and Practical Algorithms for Logics in Knowledge_<br>_Representation_. PhD thesis, RWTH Aachen, 2001.|
|[Tur08]|Anni-Yasmin Turhan. _On the Computation of Common Subsumers in Description_<br>_Logics_. PhD thesis, TU Dresden, Institute for Theoretical Computer Science, 2008,<br>2008.|
|[Tur10]|Anni-Yasmin Turhan. Reasoning and explanation in EL and in expressive Descrip-<br>tion Logics. In U. Assmann, A. Bartho, and C. Wende, editors, _Reasoning Web_<br>_2010_, volume 6325 of _LNCS_, pages 1–27. Springer, 2010.|
|[TW11]|David Toman and Grant E. Weddell. _Fundamentals of Physical Design and Query_<br>_Compilation_. Synthesis Lectures on Data Management. Morgan & Claypool Pub-<br>lishers, 2011.|
|[Var04]|A. C. Varzi. Mereology. In E. N. Zalta, editor, _Stanford Encyclopedia of Philos-_<br>_ophy_. Stanford, fall 2004 edition, 2004. `http://plato.stanford.edu/archives/`<br>`fall2004/entries/mereology/`.|
|[Var07]|A.C. Varzi. _Handbook of Spatial Logics_, chapter Spatial reasoning and ontology:<br>parts, wholes, and locations, pages 945–1038. Berlin Heidelberg: Springer Verlag,<br>2007.|
|[Var12]|Achille C. Varzi. On doing ontology without metaphysics. _Philosophical Perspec-_<br>_tives_, 25(1):407–423, 2012.|
|[VF09]|K. Vila and A. Ferr´andez. Developing an ontology for improving question answer-<br>ing in the agricultural domain. In F. Sartori, M.<sup>´</sup>A. Sicilia, and N. Manouselis,<br>editors, _3rd International Conference on Metadata and Semantics (MTSR’09)_,<br>volume 46 of _CCIS_, pages 245–256. Springer, 2009. Oct 1-2 2009 Milan, Italy.|
|[vHLP08]|Frank van Harmelen, Vladimir Lifschitz, and Bruce Porter, editors. _Handbook of_<br>_Knowledge Representation_. Elsevier, 2008.|
|[VKC<sup>+</sup>16]|Charles F. Vardeman, Adila A. Krisnadhi, Michelle Cheatham, Krzysztof Janow-<br>icz, Holly Ferguson, Pascal Hitzler, and Aimee P. C. Buccellato.<br>An ontology<br>design pattern and its use case for modeling material transformation. _Semantic_<br>_Web Journal_, 8(5):719–731, 2016.|
|[Vra09]|Danny Vrandeˇci´c. Ontology evaluation. In S. Staab and R. Studer, editors,_Hand-_<br>_book on Ontologies_, pages 293–313. Springer, 2nd edition, 2009.|
|[Wel06]|Chris Welty. Ontowlclean: cleaning OWL ontologies with OWL. In B. Bennet and<br>C. Fellbaum, editors, _Proceedings of Formal Ontologies in Information Systems_<br>_(FOIS’06)_, pages 347–359. IOS Press, 2006.|
|[WHF<sup>+</sup>13]|Katherine Wolstencroft, Robert Haines, Donal Fellows, Alan Williams, David<br>Withers, Stuart Owen, Stian Soiland-Reyes, Ian Dunlop, Aleksandra Nenadic,|



_Bibliography_ 

247 

Paul Fisher, Jiten Bhagat, Khalid Belhajjame, Finn Bacall, Alex Hardisty, Abraham Nieva de la Hidalga, Maria P. Balcazar Vargas, Shoaib Sufi, , and Carole Goble. The taverna workflow suite: designing and executing workflows of web services on the desktop, web or in the cloud. _Nucleic Acids Research_ , 41(W1):W557– W561, 2013. 

- [WKB07] R. Witte, T. Kappler, and C.J.O. Baker. Ontology design for biomedical text mining. In C.J.O. Baker and H. Cheung, editors, _Semantic Web: revolutionizing knowledge discovery in the life sciences_ , pages 281–313. Springer, 2007. 

- [WNS<sup>+</sup> 11] Patricia L. Whetzel, Natalya Fridman Noy, Nigam H. Shah, Paul R. Alexander, Csongor Nyulas, Tania Tudorache, and Mark A. Musen. BioPortal: enhanced functionality via new web services from the national center for biomedical ontology to access and use ontologies in software applications. _Nucleic Acids Research_ , 39(Web-Server-Issue), 2011. 

- [WSH07] K. Wolstencroft, R. Stevens, and V. Haarslev. Applying OWL reasoning to genomic data. In C.J.O. Baker and H. Cheung, editors, _Semantic Web: revolutionizing knowledge discovery in the life sciences_ , pages 225–248. Springer: New York, 2007. 

- [ZBG06] S. Zhang, O. Bodenreider, and C. Golbreich. Experience in reasoning with the Foundational Model of Anatomy in OWL DL. In R. B. Altman, A. K. Dunker, L. Hunter, T. A. Murray, and T. E. Klein, editors, _Pacific Symposium on Biocomputing (PSB’06)_ , pages 200–211. World Scientific, 2006. 

- [ZYS<sup>+</sup> 05] Y. Zhou, Jx A. Young, A. Santrosyan, K. Chen, Sx F. Yan, and Ex A. Winzeler. In silico gene function prediction using ontology-based pattern identification. _Bioinformatics_ , 21(7):1237–1245, 2005. 

#### **Books about ontologies** 

Here used to be a section on different textbooks and handbooks. Meanwhile, this has been updated and moved to an online resource. It currently resides at the wikis of the Technical Committee on Education of the International Association for Ontology and its Applications, at `http://iaoaedu.cs.uct.ac.za/` , menu option “books” (this may have moved to some place on `http://www.iaoa.org/` by the time you read this). 

#### **Selection of journals that publish papers about ontologies** 

##### **Research in ontologies** 

- Applied Ontology 

- Journal of Web Semantics 

- Semantic Web Journal 

- Journal on Data Semantics 

- International Journal of Metadata, Semantics and Ontologies 

- Artificial Intelligence Journal 

- Journal of Automated Reasoning 

##### **Ontologies and applications** 

- Journal of Biomedical Semantics 

- Journal of Biomedical Informatics 

_Bibliography_ 

248 

- BMC Bioinformatics 

- Data & Knowledge Engineering 

#### **Selection of conferences that publish papers about ontologies** 

**Research in Ontology, ontologies, ontology engineering, ontology languages, and automated reasoning** 

- Formal Ontology in Information Systems (FOIS) 

- International Conference on Knowledge Engineering and Knowledge Management (EKAW) 

- International Conference on Knowledge Capture (K-CAP) 

- Extended Semantic Web Conference (ESWC) 

- International Conference on Knowledge Representation and Reasoning (KR) 

##### **Ontologies and applications** 

- International Conference on Biomedical Ontology (ICBO) 

- Semantic Web Applications and Tools for the Life Sciences (SWAT4LS) 

- International Semantic Web Conference (ISWC) 

### APPENDIX A 

### Tutorials 

This appendix includes two tutorials from, one could say, two ‘extremes’ on the spectrum on ontology engineering. The first one is heavily influenced by notions from philosophy to inform modelling, whereas the second one is driven by practical considerations to build a scalable system. 

### **A.1 OntoClean in OWL with a DL reasoner** 

_This tutorial is written by Zola Mahlaza and C. Maria Keet and is based on a mini-project by Todii Mashoko, Siseko Neti, and Banele Matsebula._ 

The aim of this tutorial is to illustrate how the OntoClean methodology can be used in Prot´eg´e with OWL and its reasoner, based on the OntOWLClean approach proposed in [Wel06]. In particular, it focuses on the following tasks: 

- Punning an ontology in preparation for OntoClean. 

- Assigning meta-properties to classes in OWL. 

- Discovering inconsistencies in a taxonomy, and hints for fixing the hierarchy. 

The rest of the document is structured such that Section A.1 presents an overview of OntoClean and Section A.1 presents our example ontology, the manner in which OntoClean can be followed within Prot´eg´e, and a limited number of errors that should be discovered from the provided ontology. 

#### **OntoClean** 

OntoClean is a philosophy-based methodology for validating the correctness and consistency of an ontology’s taxonomy. It is based on general notions that are drawn from philosophy, which are Rigidity, Identity, Unity, and Dependence. The 

249 

_Appendix A. Tutorials_ 

250 

methodology is made up of two phases. The first phase involves annotating all the classes within an ontology with labels of the meta-properties referring to the four philosophical notions. The second phase deals with the checking of subsumption relationships of the ontology based on the predefined OntoClean constraints, which in this document are also referred to as rules. 

In the remainder of this section, we provide a brief recap to the four philosophical concepts, the OntoClean meta-property annotation symbols, and the constraints for each of them. A larger summary is described in Section 5.2.2, an overview of OntoClean is described in the handbook on ontologies [GW09], which build upon foundations presented in [GW00a, GW00b]. 

Rigidity refers to an entity’s property that are essential to that entity (i.e. it must be true of it in every possible situation). For instance, the property of having walls is essential to a house. Every house must have walls in every possible situation. In the event that they are demolished then you no longer have a house. Identity refers to the capability to identify individual entities in the world as being the same or different. Unity refers to the ability to describe the parts and boundaries of objects, and thus to know which parts constitute an object, which parts do not, and under what circumstances is the object a whole. Dependence is the relationship between entities whereby one will exist solely on the existence of the other. 

All the entities within an ontology must be assigned with meta-properties and labelled with the letter denoting the meta-property; more precisely: ( **I** ) for Identity, ( **U** ) for unity, ( **D** ) for dependence and ( **R** ) for Rigidity. Each of these labels preceded with a +, _−_ , or _∼_ symbol, where (+) means the entity is what the letter denotes, ( _−_ ) means the entity is not what the letter denotes, and ( _∼_ ) means ‘anti’ (may or may not be) to what the letter denotes. 

Recall from Exercise 5.4 that the assignment of meta-properties is useful because there are constraints that the taxonomy must not violate, and the rules that apply. For instance, when we have two properties x and z, where z subsumes x then we know that if z is anti-rigid ( _∼_ R) then x must be anti-rigid (Rigidity constraint), if z carries an identity criterion (+I) then x must carry the same criterion (Identity constraint<sup>1</sup> ), if z carries a unity criterion (+U) then x must carry the same criterion and if z has anti-unity, then x must also have anti-unity (Unity constraints), and if z is dependent (+D) on a certain property y then x is dependent on property y (Dependence constraint). 

#### **OntoClean in Prot´eg´e** 

In this section we will specify where to download the required software, describe the ontology we will use to illustrate OntoClean, introduce how to pun the ontology in Prot´eg´e in preparation for OntoClean, and present an exercise on assigning metaproperties in the tutorial ontology. 

##### **What to download** 

You will need the following material for this tutorial: 

> 1This is not true in the case of the “own” identity criteria 



<!-- Start of picture text -->
is-a pe<br>is-a @ A<br>A Tadpole<br>is-a<br><] is-a: AmountOfMatter a Amphibian Oo )<4 is-a \s-a<br>Cuving 2 Ju is-a _is-aC mamma) Pa .is-a CHuman)aa J .is-ais-a (Fatner) <j is-a (wate)<br>is-a<br>T ;is-a <j is-a Professor<br><J<br>. is-a = (wood)<br><!-- End of picture text -->

_Appendix A. Tutorials_ 

252 

##### Task 1 

Open the tutorial ontology `OntocleanTutorialOntology.owl` in Prot´eg´e, import the OntoClean OWL-DL ontology `ontoclean-dl.owl` , and explore. 

##### **Punning the tutorial ontology** 

The first task is to push the ontology’s Tbox into the ABox [Wel06]. In particular, you must create an Individual with the same name as the class (bears the same IRI), for each of the classes on the tutorial ontology. These Individuals must be of type `ontoclean:Class` . An example is shown in Figure A.2 where there are 21 Individuals of type `ontoclean:Class` . For each individual, you must then specify its “subclasses” through `ontoclean:hasSubClass` relation. For instance, _AmountOfMatter_ has the subclasses _Non-Living_ and _Living_ as shown in Figure A.2. Familiarise yourself with how to do this by conduction Task 2. You can verify whether you’ve done this task correctly by cross-checking with the provided `OntocleanTutorialOntologyPunned.owl` file. 

##### Task 2 

1. Continue from Task 1. 

2. For each class in the ontology, create its corresponding Individual with the same name as the class. 

3. Make each newly created individual an instance of `ontoclean:Class` . 

4. Specify the “subclasses” for each Individual, using the `ontoclean:hasSubClass` object property. 

##### **Assigning the meta-properties** 

Once the ontology has been punned, you can assign meta-properties to each individual. This requires you to first decide on the meta-properties for each class/OWLfileindividual. Once that is decided, you can use Prot´eg´e to assign meta-properties to each individual by setting its type to the appropriate subclasses of `ontoclean:Class` . For instance, you could deem that _Paper_ is dependent (+D) by assigning it the _Dependent_ meta-property, which practically amounts to adding the assertion that _Paper_ is an instance of `ontoclean:DependentClass` as shown in Figure A.3. Carry out Task 3. 

We provide a sample of meta-property assignments for all terms in this tutorial as shown in Figure A.4. The file `OntocleanTutorialOntologyPunnedMetaProperties.owl` contains all the assignments per individual. You are encouraged to also make your own separate assignment to the ontology by completing Task 3. Note that your meta-property assignments may be different because the “same [terms from an ontology represent] different concepts to different people” [Wel06]. If your metaproperty assignments are different from Figure A.4, you are encouraged to create 



<!-- Start of picture text -->
*5 | 8.) | Asserted ~) object property assertions<br>¥-@ owl:Thing @@hasSubClass Living<br>b @@hasSubClass Non-Living<br>> @ Entity<br>Data property assertions<br>ol pe] Negative object property assertions<br>For: © Class<br>@ Amphibian<br>@ Ball<br>@ child<br>@ Door<br>@ Entity<br>® Father<br>@ Frog<br>@ Human<br>@ Living<br>@ male<br>@® Mammal<br>@ Non-Living<br>@ DPaner<br><!-- End of picture text -->





<!-- Start of picture text -->
Description: Paper ANSE)<br>t=]<br>© Dependentclass<br>Same Individual As<br>Different Individuals<br><!-- End of picture text -->



<!-- Start of picture text -->
-I+R<br>+I+R<br>7UDER © A ~ +I1+D~R<br>--U-D+R ~U-D+R Cron-uving A) +I+U-D+R TadpoleD (cna)<br>AmountOfMatter Amphibian<br>Cent 6}~ +U-D+R £5 +I1+D~R<br>ComalAq +I+U-D+R +I+U-DtR x A +D -D<br>+1+U-D+R<br>©. +1+D~R +R<br>+I+U-D+R<br><]<br>O S , (Woe)_@<br>+D<br><!-- End of picture text -->



<!-- Start of picture text -->
@ Show regular justifications ® All justifications<br>Show laconic justifications Limit justifications to<br>Explanation 1 Display laconic explanation<br>Explanation for: owkThing SubClassOf owl:Nothing<br>DependentClass Disjointwith NonDependentClass<br>D dentcl bcl f hasSubcl yD dentcl<br>ependentClass SubClassOf hasSubClass only DependentClass<br>Father Type DependentClass<br>Male Type NonDependentClass<br>Father hasSubClass Male<br>Explanation 2 Display laconic explanation<br>Explanation for vi:Thing SubClassOf owl:Nothing<br>Ball Type SortalClass<br>Sphere Type NonSortalClass<br>SortalClass SubClassOf hasSubClass only SortalClass<br>NonSortalClass DisjointWith SortalClass<br>Ball hasSubClass Sphere<br><!-- End of picture text -->



<!-- Start of picture text -->
Help for inconsistent ontologies S98)<br>~~<br>@® Your ontology is inconsistent which means that the OWL reasoner will no<br>longer be able to provide any useful information about the ontology.<br>You have several options at this point:<br>@ Click the Explain button to try the Protege explanation facility.<br>@ If you think you know what the problem is, click Cancel to fix the<br>ontology yourself,<br># Some reasoners come with command line tools that will provide<br>complete explanations for inconsistent ontologies.<br>EET= SS0EE<br><!-- End of picture text -->



_Appendix A. Tutorials_ 

256 

a door say, when it breaks and get replaced. Whereas wood will always be wood whether it is used to make some furniture or just stored for future use. 

**Teacher and Professor** The relationship between _Teacher_ and _Professor_ violates the rigidity rule. The professor is a rigid concept as a person once granted the title they will always be a professor as long as they live. A teacher however may cease to be a teacher at any moment or stage in their life, hence it is anti-rigid. 

**AmountOfMatter and Mammal** The relationship between _AmountOfMatter_ and _Mammal_ via _Living_ is inconsistent as it violates the unity constraint that states that an anti-union class may not be a super class of a unity class. Mammals have unifying characteristics that may include giving birth to live babies and that they are all vertebrates but amount of water may not be unified as other matter may not be quantifiable as a whole for example water. 

**AmountOfMatter and Human** The relationship between _AmountOfMatter_ and _Human_ violates the unity rule since _AmountOfMatter_ is anti-rigid and _Human_ is rigid. It is not a direct violation but since _Human_ ’s superclass has an ancestor ( _AmountOfMatter_ ) that is anti-unity. _AmountOfMatter_ is not a whole for all its instances so they cannot unified but _Human_ has a unifying criteria that may include being warm-blooded and giving birth to live offspring. 

**Human and Teacher** The relationship between _Human_ and _Teacher_ violates the unity rule; a non-unity class may not be a subclass of an anti-unity class. 

##### **Fixing the hierarchy** 

Following on from Task 5, you should have resolved each inconsistency so that the reasoner does not return you any more errors like in Figure A.5. These errors can be fixed by either re-arranging the position of the classes in the taxonomy, or, upon closer inspection, one may have decided to change the meta-property assignment. An example of the former is that your revised hierarchy surely should not have _AmountOfMatter_ at the top. An example of the latter is that a +R on _Professor_ would generally be considered to be incorrect<sup>4</sup> , but is _∼_ R instead. 

### **A.2 An OBDA system for elephants** 

This tutorial turned out to take up more space than intended and it is therefore moved to an online-only document, which can be accessed from the book’s website at `https://people.cs.uct.ac.za/~mkeet/OEbook/` . The tutorial takes a modified version of the AWO v4 and links it up to a database with real data about elephants in the Kruger National Park. 

> 4being a professor is a role that a human plays, so it would be an anti-rigid property, and then not violating the rigidity rule anymore. 

### APPENDIX B 

### Assignments 

Besides the exercises to engage with the material, there are two assignments. They have a strong integrative flavour to it and will take up more time than an exercise. You are expected to applying as much as you have learned, and look up more information online, be they tools, methods, other ontologies, or scientific papers. 

The assignments in this appendix are described in such as way that they may serve as a draft description of the actual assignment. For instance, I include hard deadlines for hand-in, notwithstanding that I know the material will be better with more work put into it (ontologies are never really ‘finished’). I consider both assignments to be group assignments, even though they could be done individually, and I assign people to groups and topics if they didn’t make groups themselves by a given date. If the practical assignment is scheduled for the end of Block I rather than for hand in at the end of Block II, then remove the requirements on Block II topics form the description below. 

Regarding the project assignment: most topics can be reused across years, and some of them can be done by more than one group as it invariable ends up in different results. Some of the previously listed projects that were carried out in earlier instalments have some material available online, which gives an indication of success (i.e., examples of projects that received top marks). One such mini-project — from the OE course at the University of Havana (2010) resulted in OntoPartS a tool and creative extension to the part-whole taxonomy of [KA08]—that was subsequently formalised, written up, and published [KFRMG12]. Another one is the OWL Classifier<sup>1</sup> , which was developed as part of one of the mini-projects of the 2016 OE course at the University of Cape Town, and subsequently used toward conflict resolution in [KK17b]. These topics are not listed below anymore, for the obvious reasons. 

> 1 `https://github.com/muhummadPatel/OWL_Classifier` 

257 

_Appendix B. Assignments_ 

258 

### **B.1 Practical Assignment: Develop a Domain Ontology** 

The aim of this practical assignment is for you to demonstrate what you have learned about the ontology languages, top-down and bottom-up ontology development, and methods and methodologies, and experiment with how these pieces fit together. 

You can do this assignment in groups of two or three students. It should be mentioned in the material you will hand in who did what. 

##### **Tasks** 

1. Choose a subject domain of interest for which you will develop a domain ontology. For instance, computers, tourism, furniture, some hobby you may be familiar with (e.g., diving, dancing), or some other subject domain you happen to be knowledgable about (or know someone who is). 

2. Develop the domain ontology in the best possible way. You are allowed to use any resource you think is useful, be it other ontologies, non-ontological resources, tools, domain experts, etc.. If you do so (and you are encouraged to do so), then make sure to reference them in the write-up. 

3. Write about 2-3 pages (excluding figures or screenshots) summarising your work. This can include—but is not limited to—topics such as an outline of the ontology, why (or why not) you have used a foundational ontology (if so, which, why), if you could reuse a top-domain or other subject domain ontology, which non-ontological resources you have used (if any, and if so, how), if you encountered subject domain knowledge that should have been in the ontology but could not be represented due to the limitations of OWL, or perhaps a (real or imagined) purpose of the ontology and therefore a motivation for some OWL fragment, any particular reasoning services that was useful (and how and why, which deductions did you have or experimented with), any additional tools used. 

##### **Material to hand in** 

Send in/upload to the course’s CMS the following items: 

1. The OWL file of your ontology; 

2. Imported OWL ontologies, if any; 

3. The write up in pdf. 

##### **Assessment** 

1. Concerning the ontology: quality is more important than quantity. An ontology with more advanced constraints and appropriate reuse of foundational 

_B.1. Practical Assignment: Develop a Domain Ontology_ 

259 

or general ontologies is a better illustration of what you have learned than a large bare taxonomy. 

2. Concerning the ontology: it will be checked on modelling errors in the general sense (errors such as is-a vs. part-of, class vs. instance, unsatisfiable classes). Regarding the subject domain itself, it will be checked only insofar as it indicates (mis)understanding of the ontology language or reasoning services. 

3. Concerning the write up: a _synthesis_ is expected, not a diary. For instance, “We explored a, b, and c, and b was deemed to be most effective because blabla” would be fine, but not “We tried a, but that didn’t work out, then we had a go at b, which went well, then we came across c, tried it out of curiosity, but that was a dead end, so we went back to b.”. In short: try to go beyond the ‘knowledge telling’ and work towards the so-called _knowledge transformation_ . 

4. Concerning the write up: while a brief description of the contents is useful, it is more important to include something about the _process_ and _motivations_ how you got there, covering topics such as, but not limited to, those mentioned under Tasks, item 3 (and recollect the aim of the assignment—the more you demonstrate it, the better). 

##### **Notes** 

In random order: 

1. The assignment looks easy. It isn’t. If you start with the development of the ontology only the day or so before the deadline, there is an extremely high probability that you will fail this assignment. Your assignment will be of a higher quality if you start thinking about it some 2 weeks before the deadline, and the actual development at most one week before the deadline, and spread out the time you are working on it. 

2. If you use non-English terms for the classes and properties, you should either add the English in the annotations (preferred), else lend me a dictionary if it is in a language I do not speak. 

3. Use proper referencing when you use something from someone else, be it an ontology, other reused online resources (including uncommon software), textbooks, articles etc. Not doing so amounts to plagiarism. 

4. Spell checkers tend to be rather useful tools. 

5. Some of the mini-project topics can benefit from an experimental ontology that you know in detail, which you may want to take into consideration when choosing a subject domain or purpose so that your ontology might be reused later on. 

_Appendix B. Assignments_ 

260 

### **B.2 Project Assignment** 

The project assignment aims to let you explore in more detail a specific subtopic within ontology engineering. There is enough variation in the list of topics below to choose either a software development project, literature review, experimentation, and occasionally a bit of research. The two subsections below could be used as is or function as a template for one’s own specification of constraints and more or less project topics. 

#### **Suggested set-up of the assignment** 

The aim of this assignment is to work in a small group (2-4 students) and to investigate a specific theme of ontology engineering. The topics are such that either you can demonstrate the _integration of various aspects_ of ontologies and knowledge bases or _going into quite some detail on a single topic_ , and it can be either theory-based, implementation-focussed, or a bit of both. 

Possible topics to choose from will be communicated in week x, and has to be chosen and communicated to me (topic + group members) no later than in week x+1, else you will be assigned a topic and a group. 

##### **Tasks** 

1. Form a group of 2-4 people and choose a topic, or vv.: choose a topic and find other people to work with. It should be mentioned in the material you will hand in who did what. 

2. Carry out the project. 

3. Write about 4-6 pages (excluding figures or screenshots) summarising your work. The page limit is flexible, but it surely has to be _<_ 15 pages in total. 

4. Give a presentation of your work during the last lecture (10 minutes presentation, _±_ 5 minutes discussion). _Everyone must attend this lecture._ 

##### **Material to hand in** 

You have to upload/email the following items: 

1. The write up. 

2. Additional material: this depends on the chosen topic. If it is not purely paper-based, then the additional files have to be uploaded on the system (e.g., software, test data). 

3. Slides of the presentation, if any. 

Note that the deadline is after the last lecture so that you have the option to update your material for the mini-project with any feedback received during the presentation and discussion in class. 

_B.2. Project Assignment_ 

261 

##### **Assessment** 

1. Concerning the write up: a _synthesis_ is expected, not a diary. For instance, “We explored a, b, and c, and b was deemed to be most effective because blabla” would be fine, but not “We tried a, but that didn’t work out, then we had a go at b, which went well, then we came across c, tried it out of curiosity, but that was a dead end, so we went back to b.”. In short: try to go beyond the ‘knowledge telling’ and work towards the so-called _knowledge transformation_ . 

2. Concerning the write up: use proper referencing when you use something from someone else, be it an ontology, other reused online resources (including uncommon software), textbooks, articles etc. Not doing so amounts to plagiarism, which has a minimum penalty of obtaining a grade of 0 (zero) for the assignment (for all group members, or, if thanks to the declaration of contribution the individual can be identified, then only that individual), and you will be recorded on the departmental plagiarism list, if you are not already on it, and further steps may be taken. 

3. The presentation: respect the time limit, coherence of the presentation, capability to answer questions. 

4. Concerning any additional material (if applicable): if the software works as intended with the given input, presentability of the code. 

5. Marks will be deducted if the presentation or the write-up is too long. 

##### **Notes** 

Things you may want to take into consideration (listed in random order): 

1. L<sup>A</sup> TEX is a useful typesetting system (including beamer for presentation slides), has a range of standard layouts as well as bibliography style files to save you the trouble of wasting time on making the write up presentable, and generates a pdf file that is portable<sup>2</sup> . This is much less so with MS Word; if you use MS Word nevertheless, please also include a pdf version of the document. 

2. Regarding the bibliography: have complete entries. Examples of referencing material (for conference proceedings, books and book chapters, and journal articles) can be found in the scientific papers included in the lecture notes’ bibliography, scientific literature you consult, or L<sup>A</sup> TEX documentation. 

3. Spell checkers tend to be rather useful tools. 

4. One or more of the domain ontologies developed in the previous assignment may be suitable for reuse in your chosen topic. 

5. Some of the mini-projects lend themselves well for extension into an Honours/Masters project, hence, could give you a head-start. 

> 2in case you are not convinced: check `http://openwetware.org/wiki/Word_vs._LaTeX` or `http://ricardo.ecn.wfu.edu/~cottrell/wp.html` 

_Appendix B. Assignments_ 

262 

#### **Topics** 

You can select one of the following topics, or propose one of your own. If the latter, you first will have to obtain approval from you lecturer (if you are doing this assignment as part of a course). 

The topics are listed in random order, have different flavours or emphases; e.g., more of a literature review project, or programming, or theory, or experimentation. The notes contain pointers to some more information, as does the corresponding section in the book. 

Some descriptions may seem vague in that it still offers several possibilities with more or less work and/or more or less challenging activities; this is done on purpose. You should narrow it down as you see fit—bearing in mind the aims of the mini-project and the number of people in your group—and be able to justify why if asked to do so. If you choose a topic that involves processing OWL files, then try to use either the OWL API (for Java-based applications) or Owlready (Python), the Jena Toolkit (or similar), or OWLink, rather than spending time reinventing the wheel. 

You probably will find out it’s not as easy as it looked like initially, which may make it tempting wishing to change, but that also holds for the other topics, and by changing topic you very likely have lost too much time to bring the other one to passable completion. 

Some topics can be done by more than one group simultaneously, after which it can be interesting to compare what came out of it. Based on my experience of previous years, these include topic numbers 5, 7, 14, 16, and 19. 

   1. Consider the _Lemon_ model for monolingual and multilingual ontologies [MdCB<sup>+</sup> 12, MAdCB<sup>+</sup> 12]. Apply it to an ontology you developed for the practical assignment. You can choose any natural language, as long as it is a different one from the one the ontology is developed in or requires some redesign to bring it in line with best practices on the ontology-language interface. 

   2. There are some 15 working automated reasoners for various Description Logics (e.g., HermiT, FaCT++, TrOWL, Pellet, Racer, ELK, MoRE, Quonto, Quest). Conduct a comparison with a sensible subset, including their performance on a set of ontologies you select or create artificially, and possibly also along the direction of examining the effect of the use of different features in the ontology. Some ideas may be gleaned from the “short report” in the proceedings of the Ontology Reasoner Evaluation workshop<sup>3</sup> . 

   3. Write a literature review about ontology-driven NLP or ontology-enhanced digital libraries (minimum amount of references to consider depends on group size and whether this is an undergraduate or postgraduate course). 

   4. Set up an OBDA system (that is not one of the samples of the Ontop website). You are advised to either reuse your ontology from the practical assignment 

- 3 `http://ceur-ws.org/Vol-1015/` , and there have been subsequent editions of the ORE work- 

- shops. 

_B.2. Project Assignment_ 

263 

or take an existing one. Regarding data, you may want to have a look at the GitHub list of publicly available data sets<sup>4</sup> , or you can create a mock database. 

5. There are various ways to verbalize an ontology (e.g., _∀_ as ‘each...’ or ‘for all ...’, using the opposite, etc.). Write a web-based or stand-alone application that verbalises an ontology in a natural language of choice, where users will be able to choose their verbalization. Some of the examples you may want to check out are the Attempto project<sup>5</sup> , the discussion in [SKC<sup>+</sup> 08], results with isiZulu [KK17a] or Afrikaans [STK16] in case you’re in South Africa, or either of the review articles [BACW14, SD17]. 

6. Create a decision diagram for BFO or GFO, alike the D3 of FORZA, and validate it (e.g., by checking whether extant ontologies linked to BFO or GFO were linked correctly). 

7. There are many works on criteria to evaluate the quality of an ontology or an ontology module (e.g., [McD17, PVSFGP12, Vra09]). Provide an overview and apply it to several of your classmates’ ontologies developed in the practical assignment and/or ontologies taken from online repositories. In a larger group, this may also include evaluating the evaluation strategies themselves. 

8. Take a thesaurus represented in SKOS<sup>6</sup> and convert that into a real ontology (i.e., not simply only converting into OWL). There are manual and semiautomated approaches. 

9. Compare and contrast tools for ontology visualization (i.e., their graphical renderings in, e.g., Ontograf, OWLGrEd, SOVA, and so on). 

10. OWL (and DL) is claimed to provide a ‘unifying paradigm’ for several knowledge representation languages. Evaluate this claim, taking into consideration Common Logic as alternative ontology language that makes the same claim. 

11. Conduct a literature review on, and, where possible, test, several so-called ‘non-standard reasoning’ reasoners. Among others, you could consult one of the least-common subsumer papers [PT11], and/or reasoner-mediated ontology authoring tools [FR12, Fer16], among others. 

12. Write a plugin for Semantic MediaWiki such that an ontology can be used during the page editing stage; e.g., to have the hierarchy with terms (classes, object/data properties) on the left-hand side of the screen, and easily pick one of them, adding the annotation to the text automatically. Another idea for a semwiki plugin you may have may be considered (but check out first which ones are already there). 

> 4 `https://github.com/caesar0301/awesome-public-datasets` 

> 5 `http://attempto.ifi.uzh.ch/site/tools/` 

> 6see, e.g., the list at `http://code.google.com/p/lucene-skos/wiki/SKOSThesauri` , but there are others you may wish to consider 

_Appendix B. Assignments_ 

264 

13. Compare and contrast the two OntoClean implementations [GRV10, Wel06], including experimental assessment. 

14. Translational Research and the Semantic Web. Students should study and analyse the ‘old’ paper “Advancing translational research with the Semantic Web” [RCB<sup>+</sup> 07]. For the report, you can envision yourself as a consultant to the authors (from W3C’s HCLS IG<sup>7</sup> ) and suggest them improvements to what they did, given that a lot of new material has been developed over the past 12 years. 

15. Consider bottom-up ontology development starting from a conceptual data model (e.g., UML class diagrams, EER). Find a way to generate an OWL file from it such that it provides candidate classes, object properties, and constraints for an actual ontology. You may want to take one of the freely available conceptual modelling tools (e.g., ArgoUML) and use that serialisation for the transformations. There are a few tools around that try this already, but they have incomplete coverage (at best). 

16. Compare and contrast ontology editors in a meaningful way; e.g., the Prot´eg´e stand-alone tool, WebProt´eg´e, MoKI, NeON toolkit, etc. 

17. Implement the RBox reasoning service and demonstrate correctness of implementation in the software. 

18. OWL does not consider time and temporal aspects. To address this shortcoming, several ‘workarounds’ as well as temporal description logics have been proposed. Compare and contrast them on language features and modelling problems and reasoning. 

19. Develop a Prot´eg´e plugin that will show in the interface not the Manchester syntax with “some” and “not” etc, but the DL axiom components (e.g., alike it was in its v3.x), or with the corresponding keywords in a natural language other than English. 

20. Provide a state of the art on research into competency questions. 

21. Represent DOLCE—or another ontology that has indicated to be needing more than OWL expressiveness—in DOL on OntoHub; e.g., by adding those axioms in a module and link them to the OWL file into a network of ontologies. 

> 7 `http://www.w3.org/blog/hcls` 

### APPENDIX C 

### OWL 2 Profiles features list 

### **OWL 2 EL** 

Supported class restrictions: 

   - existential quantification to a class expression or a data range 

   - existential quantification to an individual or a literal 

   - self-restriction 

   - enumerations involving a single individual or a single literal 

   - intersection of classes and data ranges 

- Supported axioms, restricted to allowed set of class expressions: 

   - class inclusion, equivalence, disjointness 

   - object property inclusion (w. or w.o. property chains), and data property inclusion 

   - property equivalence 

   - transitive object properties 

   - reflexive object properties 

   - domain and range restrictions 

   - assertions 

   - functional data properties 

   - keys 

- NOT supported in OWL 2 EL (with respect to OWL 2 DL): 

   - universal quantification to a class expression or a data range 

   - cardinality restrictions 

   - disjunction 

   - class negation 

   - enumerations involving more than one individual 

   - disjoint properties 

   - irreflexive, symmetric, and asymmetric object properties 

   - inverse object properties, functional and inverse-functional object properties 

265 

_Appendix C. OWL 2 Profiles features list_ 

266 

### **OWL 2 QL** 

The supported axioms in OWL 2 QL take into account what one can use on the left-hand side of the inclusion operator ( _⊑_ , `SubClassOf` ) and what can be asserted on the right-hand side: 

   - Subclass expressions restrictions: 

      - a class 

      - existential quantification (ObjectSomeValuesFrom) where the class is limited to owl:Thing 

      - existential quantification to a data range (DataSomeValuesFrom) 

   - Super expressions restrictions: 

      - a class 

      - intersection (ObjectIntersectionOf) 

      - negation (ObjectComplementOf) 

      - existential quantification to a class (ObjectSomeValuesFrom) 

      - existential quantification to a data range (DataSomeValuesFrom) 

- Supported Axioms in OWL 2 QL: 

   - Restrictions on class expressions, object and data properties occurring in functionality assertions cannot be specialized 

   - subclass axioms 

   - class expression equivalence (involving subClassExpression), disjointness 

   - inverse object properties 

   - property inclusion (not involving property chains and SubDataPropertyOf) 

   - property equivalence 

   - property domain and range 

   - disjoint properties 

   - symmetric, reflexive, irreflexive, asymmetric properties 

   - assertions other than individual equality assertions and negative property assertions (DifferentIndividuals, ClassAssertion, ObjectPropertyAssertion, and DataPropertyAssertion) 

- NOT supported in OWL 2 QL (with respect to OWL 2 DL): 

   - existential quantification to a class expression or a data range in the subclass position 

   - self-restriction 

   - existential quantification to an individual or a literal 

   - enumeration of individuals and literals 

   - universal quantification to a class expression or a data range 

   - cardinality restrictions 

   - disjunction 

   - property inclusions involving property chains 

   - functional and inverse-functional properties 

   - transitive properties 

   - keys 

   - individual equality assertions and negative property assertions 

267 

### **OWL 2 RL** 

Supported in OWL 2 RL: 

   - More restrictions on class expressions (see table 2 of [MGH<sup>+</sup> 09]; e.g., no SomeValuesFrom on the right-hand side of a subclass axiom) 

   - All axioms in OWL 2 RL are constrained in a way that is compliant with the restrictions in Table 2. 

   - Thus, OWL 2 RL supports all axioms of OWL 2 apart from disjoint unions of classes and reflexive object property axioms. 

- A quick one-liner of the difference is: No _∀_ and _¬_ on the left-hand side, and _∃_ and 

- _⊔_ on right-hand side of _⊑_ . 

### APPENDIX D 

### Complexity recap 

This appendix is expected to be relevant only to those who have no idea of, or too little recollection of, computational complexity, or who have come across it many years ago and may like a brief refresher. 

Theory of computation concerns itself with, among other things, languages and its dual, problems. A problem is the question of deciding whether a given string is a member of some particular language; more precisely: if Σ is an alphabet, _L_ is a language over Σ, then the problem _L_ is “given a string _w ∈_ Σ<sup>_∗_</sup> , decide whether or not _w_ is in _L_ ”. The usage of ‘problem’ and ‘language’ is interchangeable. When we focus on strings for their own sake (e.g., in the set _{o_<sup>_n_</sup> 1<sup>_n_</sup> _| n ≥_ 1 _}_ ), then we tend to think of the set of strings as a language. When we focus on the ‘thing’ that is encoded as a string (e.g., a particular graph, a logical expression, satisfiability of a class), we tend to think of the set of strings as a problem. Within the context of ontologies, we typically talk of the representation languages and reasoning problems. 

There are several classes of languages; see Figure D.1. The regular free languages have their counterpart with finite automata; the context-free languages with push-down automata; the recursive languages is the class of languages accepted by a Turing machine (TM) that always halts; the recursively enumerable languages is the class of languages defined by a TM; the non-recursively enumerable languages is the class of languages for which there is no TM (e.g., the diagonalization language). The recursive languages, and, to a lesser extent, the recursively enumerable languages, are by far the most interesting ones for ontologies. 

Turing machines are used as a convenient abstraction of actual computers for the notion of computation. _A TM that always halts = algorithm_ , i.e., the TM halts on all inputs in finite time, either accepting or rejecting; hence, the recursive languages are _decidable_ problems/languages. Problems/languages that are not recursive are called _undecidable_ , and they do not have an algorithm; if they are in the class of recursively enumerable languages (but not recursive), then they have a _procedure that runs on an arbitrary TM_ that may give you an answer but may very well never 

269 

_Appendix D. Complexity recap_ 

270 



<!-- Start of picture text -->
recursively<br>regular free  context-free  recursive<br>enumerable<br>languages languages languages<br>languages<br>non-recursively<br>enumerable languages<br><!-- End of picture text -->

**Figure D.1:** Graphical depiction of the main categories of languages. 

halt; see also Figure D.2. First order predicate logic in its full glory is undecidable. Description logics are decidable fragments of first order predicate logic<sup>1</sup> , i.e., they are recursive languages and (can) have algorithms for the usual problems (standard reasoning services). 



<!-- Start of picture text -->
A<br><!-- End of picture text -->



<!-- Start of picture text -->
input  w<br>P<br><!-- End of picture text -->

**Figure D.2:** Graphical depiction of the main categories of languages; the rectangle denotes a Turing Machine; _w_ is a string and _L_ is a language. 

Not all algorithms are alike, however, and some take up more time (by the CPU) or space (in the form of memory size) to compute the answer than others. So, we want to know for a given problem, the answer to _“how much time [/space] does it take to compute the answer, as a function of the size of the input?”_ . If the computation takes many years with the top-of-the-range hardware, then it is still not particularly interesting to implement (from a computer science viewpoint, that is). To structure these matters, we use the notion of a _complexity class_ . There are very many of them, but we only refer to a few in the context of ontologies. For instance, it may take a polynomial amount of time to compute class subsumption for an OWL 2 EL-formalised ontology and exponential time to compute satisfiability of an EER diagram (represented in the DL _DLR_ ifd) and the bigger the diagram (more precisely: the logical theory), correspondingly the longer it takes. The intuition is depicted in Figure D.3: for small ontologies, there is but a minor difference in performance, but one really starts to notice it with larger logical theories. 

Looking ahead at the complexity classes relevant for OWL, we list here a description of the meaning of them (copied from the OWL 2 Profiles Standard page [MGH<sup>+</sup> 09]): 

- **Decidability open** means that it is not known whether this reasoning problem is decidable at all. 

> 1More precisely: there is at least one that turned out to be undecidable ( _DLRUS_ ), but this is an exception to the rule. 



<!-- Start of picture text -->
70000<br>60000<br>50000<br>40000<br>=—time: polynomial x*2<br>30000 —itime: exponential 2"<br>20000<br>10000<br>0<br>it] 2 4 6 & 10 12 14 16<br><!-- End of picture text -->

_Appendix D. Complexity recap_ 

272 

put (i.e., roughly _log_ ( _n_ ), for _n_ the size of the input and _c_ a constant). NLOGSPACE is the nondeterministic version of this class. 

- **AC**<sup>0</sup> is a proper subclass of LOGSPACE and defined not via Turing Machines, but via circuits: AC<sup>0</sup> is the class of problems definable using a family of circuits of constant depth and polynomial size, which can be generated by a deterministic Turing machine in logarithmic time (in the size of the input). Intuitively, AC<sup>0</sup> allows us to use polynomially many processors but the run-time must be constant. A typical example of an AC<sup>0</sup> problem is the evaluation of first-order queries over databases (or model checking of first-order sentences over finite models), where only the database (first-order model) is regarded as the input and the query (first-order sentence) is assumed to be fixed. The undirected graph reachability problem is known to be in LogSpace, but not in AC<sup>0</sup> . 

### APPENDIX E 

### Answers of selected exercises 

### **Answers Chapter 2** 

**Answer Exercise 2.1.** Indicative descriptions: 

- (a) All lions are mammals. 

- (b) Each PC has as part at least one CPU and at least one Monitor connected 

- (c) Proper part is asymmetric. 

###### **Answer Exercise 2.2.** 

- (a) _∀x_ ( _Car_ ( _x_ ) _→ V ehicle_ ( _x_ )) 

- (b) _∀x_ ( _HumanParent_ ( _x_ ) _→∃y_ ( _haschild_ ( _x, y_ ) _∧ Human_ ( _y_ ))) 

- (c) _∀x, y_ ( _Person_ ( _x_ ) _∧ Course_ ( _y_ ) _→¬_ ( _lecturerOf_ ( _x, y_ ) _∧ studentOf_ ( _x, y_ ))) 

###### **Answer Exercise 2.3.** 

- (b) There exists a node that does not participate in an instance of _R_ , or: it does not relate to anything else: _∃x∀y.¬R_ ( _x, y_ ). 

- (c) _L_ = _⟨R⟩_ as the binary relation between the vertices. Optionally, on can add the vertices as well. Properties: 

   - _R_ is symmetric: _∀xy.R_ ( _x, y_ ) _→ R_ ( _y, x_ ). 

   - _R_ is irreflexive: _∀x.¬R_ ( _x, x_ ). 

   - If you take into account the vertices explicitly, one could say that each note participates in at least two instances of _R_ to different nodes. 

###### **Answer Exercise 2.4.** 

- (a) _R_ is reflexive (a thing relates to itself): _∀x.R_ ( _x, x_ ). _R_ is asymmetric (if _a_ relates to _b_ through relation _R_ , then _b_ does not relate back to _a_ through _R_ ): _∀xy.R_ ( _x, y_ ) _→¬R_ ( _y, x_ ). 

- (b) See the example on p21 of the lecture notes. 

**Answer Exercise 2.6.** Note: there may be more than one solution; only one is given. Also note that a problem of natural language is that it can be imprecise. 

273 

_Appendix E. Answers of selected exercises_ 

274 

1. _∀x_ ( _Lion_ ( _x_ ) _→ Animal_ ( _x_ )) 

2. _∀x_ ( _Professor_ ( _x_ ) _→∃y_ ( _teaches_ ( _x, y_ ) _∧ Course_ ( _y_ ))) 

3. _∀x_ ( _Human_ ( _x_ ) _→∃y, z_ ( _eat_ ( _x, y_ ) _∧ Fruit_ ( _y_ ) _∧ eat_ ( _x, z_ ) _∧ Cheese_ ( _z_ ))) (note: twice the ‘eat’, with _y_ and _z_ , not “ _fruit_ ( _y_ ) _∧ cheese_ ( _y_ )”, for that refers to the objects that are _both_ , which don’t exist) 

4. _∀x_ ( _Animal_ ( _x_ ) _→ Herbivore_ ( _x_ ) _∨ Carnivore_ ( _x_ )) 

5. _∀x, y, z_ ( _hasmother_ ( _x, y_ ) _∧ hassister_ ( _y, z_ ) _→ hasaunt_ ( _x, z_ )) (or with _↔_ and/or with the composition operator _◦_ ) 

6. _∀x_ ( _Pap_ ( _x_ ) _→¬Pizza_ ( _x_ )) 

7. _∀x∃y_ (( _Person_ ( _x_ ) _∧ worksfor_ ( _x, y_ ) _∧ Company_ ( _y_ ) _→ Employee_ ( _x_ ))) 

8. _∀x, y_ ( _manages_ ( _x, y_ ) _↔ Manager_ ( _x_ )) 

9. _∀x_ ( _Fly_ ( _x_ ) _→∃_<sup>=2</sup> _y_ ( _haspart_ ( _x, y_ ) _∧ Eye_ ( _y_ ))) (note: this is shorthand notation...) 

10. _∀x, y, z_ ( _life_ ( _x, y_ ) _∧ life_ ( _x, z_ ) _→ y_ = _z_ ) 

11. _∀x, y_ ( _participation_ ( _x, y_ ) _→ PhysicalObject_ ( _x_ ) _∧ Process_ ( _y_ )) 

12. _∀x, y_ ( _hasPart_ ( _x, y_ ) _→ partOf_<sup>_−_</sup> ( _x, y_ )) 

13. _∀x, y_ ( _connection_ ( _x, y_ ) _→ connection_ ( _y, x_ )) 

14. Vehicles: combine the pattern for the ‘or’ from 4 with the disjoints of 6, for the vehicles. 

15. _∃x_ ( _Snail_ ( _x_ ) _∧slow_ ( _x_ )) but not this is suboptimal (recall the apple & green; similar story here) 

16. _∀x_ ( _Patient_ ( _x_ ) _→∃y, z_ ( _registration_ ( _x, y, z_ ) _∧ Hospital_ ( _y_ ) _∧ Weekday_ ( _z_ ))) 

17. Note: this requires either a temporal ‘extension’ or necessity (beyond the current scope). Let’s take temporal, for which we introduce a notions of time, _t_ , that quantifies over time points only (for simplicity, and linear time): _∀x, t_ ( _Student_ ( _x, t_ ) _→ ∃t_<sup>_′_</sup> = _t_ ( _¬Student_ ( _x, t_<sup>_′_</sup> ))) 

### **Answers Chapter 3** 

**Answer Exercise 3.1.** Note: there may be more than one solution; only one if given. Also note that these axioms are agnostic about particular fragments, and we don’t consider datatypes. 

1. Lion _⊑_ Animal 

2. Professor _⊑∃_ teaches _._ Course 

3. Human _⊑∃_ eat _._ Fruit _⊓∃_ eat _._ Cheese 

4. Animal _⊑_ Herbivore _⊔_ Carnivore 

5. hasMother _◦_ hasSister _⊑_ aunt (or with _≡_ , i.e., that the notion of ‘aunt’ is defined by it) 

6. Pap _⊑¬_ Pizza (or with ‘bottom’: Pap _⊓_ Pizza _⊑⊥_ ) 

7. Person _⊓∃_ worksFor _._ Company _⊑_ Employee 

8. _∀_ manages _.⊤≡_ Manager 

9. Fly _⊑_ = 2 hasPart _._ Eye 

10. lazy option: Func(life), less lazy, as part of another axiom, _≤_ 1 life or _≤_ 1 life _.⊤_ 

11. lazy option: Participation _⊑_ PhysicalObject _×_ Process, and in full: _∃_ participation _⊑_ PhysicalObject and _∃_ participation<sup>_−_</sup> _⊑_ Process 

12. hasPart _⊑_ partOf<sup>_−_</sup> 

13. lazy option (in _SROIQ_ ): Sym(connection) 

14. Vehicles: combine the ‘or’ from 4 with the disjoints of 6. 

15. Not easily represented in DLs (rework it with some subtype of snails for which it 

275 

always holds) 

16. This can be represented in the _DLR_ family of Description Logics, but not in most DLs and not in OWL either (which has only binaries—we’ll return to this in the second part of the module) 

17. This can be represented in several temporal description logics, using temporal operators, alike Student _⊑⋄_<sup>_∗_</sup> _¬_ Student with the diamond-shape the temporal counterpart of _∃_ and with _∗_ , this reads as ‘sometime’. More about this can be found in the ‘advanced topics’. 

###### **Answer Exercise 3.2.** 

- (a) Rewrite (Eq. 3.24) into negation normal form: 

_Person ⊓∀eats.Plant ⊓_ ( _¬Person ⊔¬∀eats._ ( _Plant ⊔ Dairy_ )) _Person ⊓∀eats.Plant ⊓_ ( _¬Person ⊔∃¬eats._ ( _Plant ⊔ Dairy_ )) _Person ⊓∀eats.Plant ⊓_ ( _¬Person ⊔∃eats._ ( _¬Plant ⊓¬Dairy_ )) So our initial ABox is: 

_S_ = _{_ ( _Person ⊓∀eats.Plant ⊓_ ( _¬Person ⊔∃eats._ ( _¬Plant ⊓¬Dairy_ )))( _a_ ) _}_ 

- (b) Enter the tableau by applying the rules until either you find a completion or only clashes. 

   - ( _⊓_ -rule): _{Person_ ( _a_ ) _, ∀eats.Plant_ ( _a_ ) _,_ ( _¬Person ⊔∃eats._ ( _¬Plant ⊓¬Dairy_ ))( _a_ ) _}_ 

   - ( _⊔_ -rule): (i.e., it generates two branches) 

      - (1) _{Person_ ( _a_ ) _, ∀eats.Plant_ ( _a_ ) _,_ ( _¬Person ⊔∃eats._ ( _¬Plant ⊓¬Dairy_ ))( _a_ ) _, ¬Person_ ( _a_ ) _}_ ¡clash! 

      - (2) _{Person_ ( _a_ ) _, ∀eats.Plant_ ( _a_ ) _,_ ( _¬Person ⊔∃eats._ ( _¬Plant ⊓¬Dairy_ ))( _a_ ) _, ∃eats._ ( _¬Plant ⊓¬Dairy_ )( _a_ ) _}_ 

         - ( _∃_ -rule): _{Person_ ( _a_ ) _, ∀eats.Plant_ ( _a_ ) _,_ ( _¬Person⊔∃eats._ ( _¬Plant⊓¬Dairy_ ))( _a_ ) _, ∃eats._ ( _¬Plant ⊓¬Dairy_ )( _a_ ) _, eats_ ( _a, b_ ) _,_ ( _¬Plant ⊓¬Dairy_ )( _b_ ) _}_ 

         - ( _⊓_ -rule): _{Person_ ( _a_ ) _, ∀eats.Plant_ ( _a_ ) _,_ ( _¬Person⊔∃eats._ ( _¬Plant⊓¬Dairy_ ))( _a_ ) _, ∃eats._ ( _¬Plant⊓¬Dairy_ )( _a_ ) _, eats_ ( _a, b_ ) _,_ ( _¬Plant⊓¬Dairy_ )( _b_ ) _, ¬Plant_ ( _b_ ) _, ¬Dairy_ ( _b_ ) _}_ 

         - ( _∀_ -rule): _{Person_ ( _a_ ) _, ∀eats.Plant_ ( _a_ ) _,_ ( _¬Person⊔∃eats._ ( _¬Plant⊓¬Dairy_ ))( _a_ ) _, ∃eats._ ( _¬Plant ⊓¬Dairy_ )( _a_ ) _, eats_ ( _a, b_ ) _,_ ( _¬Plant ⊓¬Dairy_ )( _b_ ) _, ¬Plant_ ( _b_ ) _, ¬Dairy_ ( _b_ ) _, Plant_ ( _b_ ) _}_ ¡clash! 

- (c) _T ⊢ V egan ⊑ V egetarian_ ? yes 

### **Answers Chapter 4** 

**Answer Exercise 4.2.** Use a property chain. 

###### **Answer Exercise 4.5.** 

- (c) Expressivity: _ALN_ , in OWL DL. Not in OWL Lite and OWL 2 EL, QL, RL because of the minCardinality. 

- (e) Expressivity: _ALQ_ , in OWL 2 DL. Not in OWL DL anymore because of the qualnumber restriction. 

_Appendix E. Answers of selected exercises_ 

276 

**Answer Exercise 4.8.** As historical note: the original exercise came from SSSW 2005<sup>1</sup> , which was at the time of OWL 1. The answers here and the next ones have been updated taking into account OWL 2. 

- (a) The description is sufficiently vague that it may be either of JointHonsMathsComp _≡∃_ takes _._ MathsModule _⊓∃_ takes _._ ComputerScienceModule JointHonsMathsComp _≡_ Student _⊓∃_ takes _._ MathsModule _⊓ ∃_ takes _._ ComputerScienceModule 

   - In any case, observe it is not “takes _._ (MathsModule _⊓_ ComputerScienceModule)”; see Example 5.3 for further explanation. 

- (b) SingleHonsMaths _≡_ Student _⊓∃_ takes _._ MathsModule _⊓∀_ takes _._ ComputerScienceModule. This is also called ‘closing’ the axiom. 

So: yes, this is possible. A possible solution is shown in `university1.owl` 

**Answer Exercise 4.9.** Deductions: they are undergrad students, and students 2, 4, and 7 are JointHonsMathsComp. Student7 is one, because it is an instance of _∃_ takes _._ MathsModule and has a property assertion that s/he takes CS101. 

No student is a SingleHonsMaths, despite that, e.g., Student3 has declared taking two math modules. This is due to the Open World Assumption: student3 may well take other courses that we don’t know of as of yet, so it is not guaranteed in all possible worlds that student3 takes _only those two_ math courses. 

**Answer Exercise 4.10.** This can now be done with OWL 2, for it permits qualified number restrictions; see `university2.owl` 

- (a) This poses no problem, because of the no unique name assumption: it will infer that CS101 and CS102 must be the same object, so then student 9 still takes 2 courses and all is well; see `university2.owl` . 

- (b) This does pose a problem, because each of the three courses mentioned are member of their respective classes that are disjoint, so they must be distinct individuals, and thus we obtain a violation in cardinality restrictions (=2 vs =3), and therewith the ontology has become inconsistent. 

**Answer Exercise 4.11.** Let us first have a look randomly at a deduction and its explanation (click on the “?” right from the deduction in Prot´eg´e) as a first step toward figuring out why so many classes are unsatisfiable (i.e., equivalent to `Nothing` , or _⊥_ ). Take the explanation for `CS StudentTakingCourses` : 

> 1 `http://owl.man.ac.uk/2005/07/sssw/university.html` 



<!-- Start of picture text -->
cl Highlight unsatisfiable classes<br>Subclass axiom symbol (co<br>quivalent classes axiom symbol |<br>Disjoint classes axiom symbol (c=<br>(CD Obfuscate entity names View justification entailments...<br>cl Use ordering { Extract ontology...<br>Explanation 1 ©O<br>‘@CS_StudentTakingCourses = Nothing (7 Tx}<br>e CS_StudentTakingCourses c CSStudent (x)<br>e CS_Student c takesCourse only CS_Course (x)<br>e CS_Course c offeredin some CS_Department x}<br>e CS_Department ¢ affiliatedWith some CS_Library (x)<br>Transitive: affiliatedWith (x)<br>C) CS_Library c affiliatedWith some EE_Librar,<br>e CS_StudentTakingCourses c takesCourse min 1 Thing [x)<br>e CS_Department c = EE_Department (x)<br>e EE_Department = affiliatedWith some EE_Library (x)<br>A} Highlight unsatisfiable classes<br>Subclass axiom symbol (ca<br>Equivalent classes axiom symbol (=a<br>Disjoint classes axiom symbol (c>-<br>O obfuscate entity names<br>eal Use ordering Extract ontology...<br>Explanation 1 @O<br>eo Al_Dept = CS Department and hasResearchArea value Al x<br>® CSDepartment ¢ affiliatedWith some CS_Library x<br>Transitive: affiliatedWith x<br>eo CS_Library c affiliatedWith some EE_Library x<br>6 CSDepartment c — EE_Department x<br>eo EE_Department = affiliatedWith some EE_Library x<br><!-- End of picture text -->



<!-- Start of picture text -->
a} Highlight unsatisfiable classes<br>Subclass axiom symbol (ci<br>Equivalent classes axiom symbol (=i<br>Disjoint classes axiom symbol |<br>O ontuscate entity names<br>wy Use ordering Extract ontology...<br>Explanation 1 @©O<br>6 CSDepartment c affiliatedWith some CSLibrary x<br>Transitive: affiliatedWith x<br>eo CS_Library ¢ affiliatedWith some EE_Library x<br>® CSDepartment c — EE_Department x<br>eo EE_Department = affiliatedWith some EE_Library x<br>- Highlight unsatisfiable classes<br>Subclass axiom symbol (cs<br>Equivalent classes axiom symbol (.<br>Disjoint classes axiom symbol {c><br>CJ obfuscate entity names<br>Explanation 1 @©O<br>6 CSCourse c offeredin some CS_Department x<br>e CS_ Department c affiliatedWith some CS_Library x<br>Transitive: affiliatedWith x<br>e CS_Library ¢ affiliatedWith some EE_Library x<br>e CS_Department c — EE_Department x<br>e EE_Department = affiliatedWith some EE_Library x<br><!-- End of picture text -->



<!-- Start of picture text -->
- Os<br>ah Highlight unsatisfiable classes<br>Subclass axiom symbol (ca<br>Equivalent classes axiom symbol (.s<br>Disjoint classes axiom symbol (c-<br>O obtuscate entity names<br>Al Use ordering Extract ontology...<br>Explanation 1 @©O<br>) AlStudent c hasAdvisor some ProfessorlnHClorAl x<br>= advisorOf inverseOf hasAdvisor x<br>eo ProfessorInHClorAl ¢ advisorOf only HCIStudent x<br>eS AlStudent c + HCIStudent x<br><!-- End of picture text -->



<!-- Start of picture text -->
-)@"s<br>ch Highlight unsatisfiable classes<br>Subclass axiom symbol (cl<br>Equivalent classes axiom symbol (sa<br>Disjoint classes axiom symbol (c><br>C)obtuscate entity names<br>Use ordering<br>Explanation 1 @©O<br>6 HCIStudent ¢ hasAdvisor some ProfessoriInHClorAl x<br>= advisorOf inverseOf hasAdvisor x<br>e ProfessorInHClorAl c advisorOf only AlStudent x<br>6 AlStudent c + HCIStudent x<br><!-- End of picture text -->



<!-- Start of picture text -->
= @"s<br>ca} Highlight unsatisfiable classes<br>Subclass axiom symbol (cs<br>Equivalent classes axiom symbol |<br>Disjoint classes axiom symbol (co<br>O obfuscate entity names<br>ral Use ordering Extract ontology...<br>Explanation 1 @O<br>e LecturerTaking4Courses c Lecturer x<br>t Lecturer c TeachingFaculty x<br>e TeachingFaculty c takesCourse max 3 Thing x<br>6 LecturerTaking4Courses c takesCourse exactly 4 Thing x<br><!-- End of picture text -->

281 

Oct 2005 that was distributed with an old Prot´eg´e version and “OOPS! - OntOlogy Pitfall Scanner! - ResultsPizzaProtegeSite.pdf”, who’s output is based on having given OOPS! the URI `https://protege.stanford.edu/ontologies/pizza/pizza.owl` in July 2018. 

There are 39 pitfalls detected and categorised as ‘minor’, and 4 as ‘important’. (explore the other pitfalls to see which ones are minor, important, and critical). 

The three “unconnected ontology elements” are used as a way to group things, so are not really unconnected, so that can stay. 

ThinAndCripsyBase is detected as a “Merging different concepts in the same class” pitfall. Aside from the typo, one has to inspect the ontology to determine whether it can do with an improvement: what are its sibling, parent and child classes, what is its annotation? It is disjoint with DeepPanBase, but there is no other knowledge. It could just as well have been named ThinBase, but the original class was likely not intended as a real merging of classes, at least not like a class called, say, UndergradsAndPostgrads. 

Then there are 31 missing annotations. Descriptions can be added to say what a DeepPanBase is, but for the toppings this seems less obvious to add. 

The four object properties missing domain and range axioms was a choice by the modellers (see the tutorial) to not ‘overcomplicate’ the tutorial for novice modellers as they can have ‘surprising’ deductions, but it would be better to add them where possible. 

Last, OOPS detected that the same four properties are missing inverses. This certainly can be added for isIngredientOf and hasIngredient. That said, in OWL 2, one also can use hasIngredient<sup>_−_</sup> to stand in for the notion of “isIngredientOf”, so missing inverses is not necessarily a problem. (Ontologically, one easily could argue for ’non-directionality’, but that is a separate line of debate; see e.g., [Fin00, KC16]). 

**Answer Exercise 5.3.** No, A is unsatisfiable. Reason: A _⊑_ ED (EnDurant), it has a property R (to B), which has declared as domain PD (PerDurant), but ED _⊑¬_ PD (endurant and perdurant are disjoint), hence, A cannot have any instances. 

**Answer Exercise 5.4.** There are several slides with the same ‘cleaning procedure’ and one of them is uploaded on the book’s webpage, which was from the Doctorate course on Formal Ontology for Knowledge Representation and Natural Language Processing 2004-2005, slide deck “Lesson3-OntoClean”. Meanwhile, there is also a related paper that describes the steps in more detail, which appeared in the Handbook on Ontologies [GW09]. 

### **Answers Chapter 6** 

**Answer Review question 6.3.** Some of the differences are: descriptive, possibilism, and multiplicative for DOLCE versus prescriptive and realist, actualism, and reductionist for BFO. You can find more differences in Table 1 of [KK12] and online in the “comparison tables” tab at `http://www.thezfiles.co.za/ROMULUS/` . 

**Answer Review question 6.4.** There are several differences. The major differences are that DOLCE also has relationships and axioms among the categories using those relationships (i.e., richly formalised), whereas BFO v1 and v1.1 is a ‘bare’ taxonomy of universals (some work exist on merging it with the RO, but not yet officially). Others are the Abstract branch and the treatment of ‘attributes’/quality properties in DOLCE that do not have an equivalent in BFO. The BFO-core has a more comprehensive inclusion of 

_Appendix E. Answers of selected exercises_ 

282 

parthood and boundaries than DOLCE. 

**Answer Review question 6.5.** The most often recurring relationships are parthood, participation, constitution, and inherence or dependence. 

**Answer Exercise 6.1.** Informal alignments: 

- (a) dolce:Endurant maps roughly to bfo:Continuant (though actually, more precisely to bfo:IndependentContinuant), dolce:Process as a sub-class of bfo:Process, and dolce:quality to bfo:quality. 

- (b) Amount of Matter, Accomplishment, Agentive Physical Object, and Set do not have a mapping. An example of the possible reasons: Set is abstract, but not existing in nature (hence, by philosophical choice, not in BFO). 

A more detailed comparison—or: the results of trying to align DOLCE, BFO, and GFO— is available at `http://www.thezfiles.co.za/ROMULUS/` . 

###### **Answer Exercise 6.2.** Options may vary: 

- (a) DOLCE or GFO 

- (b) BFO or GFO 

- (c) Depends on you chosen topic 

**Answer Exercise 6.4.** The main ‘trick’ with such questions is to be able to detect key words and phrases, such as the description stating that there will be “concrete entities ... and ... abstract entities”: this data provide answers to one of the questions in ONSET, and will affect the choice of the foundational ontology (BFO does have abstract entities, but GFO and DOLCE do), and likewise the sentence on mereology and the text mentioning OWL 2 DL. Three use case with sample answers can be found at `http://www.meteck.org/files/onset/UseCasesExperiment.pdf` . 

- **Answer Exercise 6.6.** I use the version with DOLCE in the following answers 

- (a) To have RockDassie classified as a subclass of Herbivore (still both animals, and physical objects, and physical endurants, and endurants), it needs to have more, or more constrained properties than Herbivore. In Prot´eg´e notation, each `Herbivore` is equivalent to: 

   - `(eats only plant) or (eats only (is-part-of some plant))` . 

   - Rockdassies eat grasses and broad-leafed plants. The easiest way to modify the ontology is to add that grasses are plants (already present), that broad-leafed plants are kinds of plants, and that rockdassies eat only grass or broad-leafed plant. This is not to say this is the best thing to do: there are probably also other animals that eat grasses and broad-leafed plants, which now unintentionally will be classified as rockdassies. This does not really need any of the foundational ontology content. One could align the parthood relations. 

- (b) The ontology does not contain any knowledge on ‘residing in’ and ‘nature reserves’, let alone sloppy word use of ‘found on’ (or, more precisely: in an area where a university campus is located). Nature reserves are administrative entities, but also can be considered only by their region-of-space aspect; for the sake of example, let’s add NatureReserve _⊑_ space-region. Trickier is the living, or living in: one could add it as an OWL object property livesIn or as a subclass of Process and add participation relations between that, the nature reserve, and the lions, impalas, and monkeys. The former is less cumbersome, the latter more precise and interoperable. 

283 

- (c) Ranger is a role that a human plays for some time, with Human being a physical object, Ranger an agentive social object, and that the latter inheres in the former. 

**Answer Exercise 6.7.** From the BFO viewpoint, the problem lies with the axioms that have eats existentially quantified: e.g., Warthog _⊑∃_ eats _._ FruitingBody: some individual warthog `abc123` may never get around to _actually_ eating any fruit, although the axiom asserts that each warthog will have at least one instance of eating a fruit. Thus, that axiom may not hold in all possible worlds after all and therefore ought not be in the ontology, for it would not represent reality fully correctly, according to the realist dogma. To resolve that, we first need to state that warthogs have a disposition to eat: 

- Eating _⊑_ Process 

- EatingDisposition _≡_ Disposition _⊓∀_ hasRealization _._ Eating 

Warthog _⊑∃_ bearerOf _._ EatingDisposition 

Then we need to find a way to relate it to FruitingBody, like berries and apples. The Eating process may have as participant the fruiting body, but one cannot simply state either of 

Eating _⊑∃_ hasParticipant _._ FruitingBody 

Eating _⊑∀_ hasParticipant _._ FruitingBody 

because not all eating instances involve fruiting bodies and other food can be eaten as well. So, we need another approach. The first step is to constrain the participants in the eating process to only those eating processes where warthogs are involved and where fruiting bodies are involved: 

Warthog _⊑∃_ bearerOf _._ (EatingDisposition _⊓_ 

- _∀_ hasRealization _._ (Eating _⊓∀_ hasParticipant _._ FruitingBody) 

or, more precisely: in place of the FruitingBody, to put all the things they’re eating according to AWO v1: fruiting body, grass, root, or animal. They may not be all part of the same eating event, but we will gloss over that detail for the moment. Obviously, we’ll need to change the definitions for Omnivore and the other animals that were eating something as well, for else we’ll lose the inference that Warthog _⊑_ Omnivore. That covers it with respect to refining the semantics for eats. There is also an eaten-by object property that tasty-plant participates in: 

tasty-plant _⊑∃_ eaten-by _._ carnivore _⊓∃_ eaten-by _._ herbivore 

It is left as an exercise to the reader to update this axiom<sup>2</sup> . 

Now, what to do if you want to assert that Warthog(j123) is eating Apple(apple1)? In AWO v1, it is simply added with eats(j123,apple1), but we can’t do that anymore now. First, we need to add ‘intermediate’ individuals: EatingDisposition(ed1) and Eating(e1) and then add assertions bearerOf(j123,ed1), hasRealization(ed1,e1), and hasParticipant(e1,apple1). Yet, upon running the reasoner, we still won’t observe that `j123` is eating `apple1` . In order to get some of the ‘cognitive simplicity’—our eats shortcut— back, one could add a role chain: 

bearerOf _◦_ hasRealization _◦_ hasParticipant _⊑_ eats 

It will then derive eats(j123,apple1) and show that in the inferences. 

This resultant ontology is available as `AfricanWildlifeOntology3b.owl` . 

> 2also: intuitively, this axiom ought to result in an inconsistent ontology when one adds tasty-plant(p1). Why does that not happen? Hint: examine the definition of carnivore. 



<!-- Start of picture text -->
calle" <Setinaiss> (2 | PhonePoint<br>\ e<br>O<br>r r2 O<br><!-- End of picture text -->



<!-- Start of picture text -->
e 0<br>RichEmployee :<br>Salary String8<br>Ss<br>Salary String5 Salary String8<br><!-- End of picture text -->

285 

   - OWL 2 EL: intended for large, simple, type-level ontologies, and then still some reasoning possible 

- (b) Regarding mass media, films and news media: not necessarily, but to be certain, check yourself what the definition of `Mass Media` is, when something can be called `News Media` , and then assess the differences in their properties. `Propaganda` has as broader term `Information Dissemination` , but a characteristic of propaganda is dissemination of _mis_ information. 

**Answer Exercise 7.6.** The description of the n-ary ODP can be found in the NeON deliverable D2.5.1 on pp67-68. Also, you may wish to inspect the draft ODPs that have been submitted to the ODP portal (at `http://www.ontologydesignpatterns.org` ). 

**Answer Exercise 7.7.** One could make a Content ODP out of it: for each AssistiveDevice that is added to the ontology, one also has to record the Disability it ameliorates, it requires some Ability to use/operate the device, and performs a certain Function. With that combination, one even can create some sort of an ‘input form’ for domain experts and administrators, which can then hide all the logic entirely, yet as long as they follow the pattern, the information gets represented as intended. 

Another one that may be useful is the Architectural OP: `adolena.owl` now contains some bits and pieces of both DOLCE (endurant, perdurant, and some of their subclasses) and some terms from BFO (realizable), neither of the two ontologies were imported. The architectural ODP can help cleaning this us and structuring it. 

**Answer Exercise 7.8.** One could check the design against a foundational ontology and check whether the instantiations makes sense. There may be more options to evaluate it, as there has not been done much work on ODP quality. 

###### **Answer Exercise 7.10.** Principally: 

- expressive foundational ontology, such as DOLCE or GFO for improved ontology quality and interoperability 

- bottom-up onto development from the thesaurus to OWL 

- integration/import of existing bio-ontologies 

- Domain ontology in OWL taking the classification of the chemicals, define domain & range and, ideally, defined concepts 

- Add the instance data (the representation of the chemicals in stock) in the OWL ABox (there are only 100, so no real performance issues), and add a dummy class disjoint from DruTopiate destined for the ‘wrong’ chemicals 

- Take some suitable reasoner for OWL 2 DL (either the ‘standard’ reasoners or names like Fact++) 

- Then classify the instances availing of the available reasoning services (run Fact++ etc.): those chemical classified as instances of the ‘ideal chemical’ are the candidate for the lab experiments for the drug to treat blood infections. 

- Alternatively: add DruTopiate as class, add the other chemicals as classes, and any classes subsumed by DruTopiate are the more likely chemicals, it’s parents the less likely chemicals. 

- Methods and methodologies that can be used: single, controlled ontology development, so something like METHONTOLOGY will do, and for the micro-level development something like OD101, ontospec, or DiDON. 

_Appendix E. Answers of selected exercises_ 

286 

### **Answers Chapter 8** 

**Answer Exercise 8.1.** Two of the reasons are: 

- The ontology is specific to the application, hater than being application-independent. If it wouldn’t be, then there will be mismatches (either too much/irrelevant content in the ontology, or data that should be queried but can’t if there’s no corresponding knowledge in the ontology) 

- The ontology contains implementation decisions, such as data properties, which will hamper any reuse, be that for another application or as a module of another ontology. 

### **Answers Chapter 9** 

**Answer Exercise 9.1.** There are no clear rules on IRI usage, but... 

- (a) The IRIs in `AfricanWildlifeOntologyAF.owl` are a mess. It was translated from an old AWO version that was once worked on in an old Prot´eg´e version (v4.1) that automatically put the path to where the local copy was stored ( `file: /Applications/Protege_4.1_beta/AfricanWildlifeOntology1.owl` ), and this IRI was not updated in the file. The ontology IRI was updated, to `http://www. meteck.org/teaching/ontologies/AfricanWildlifeOntology1.owl` , but this was not propagated through to the IRIs of the classes and properties already declared in the ontology. In addition, that IRI is the location of the AWO v1 with element names in English, whereas this file has the element names in Afrikaans. New entities were added afterward, such as Witwortel (parsnip), which somehow got an `xml:base` , which is also incorrect. 

- (b) Recall that a full IRI is the official address of the element (class or property). While all 1:1 translated elements are semantically the same thing, the strings of the full IRIs are not, yet no equivalence is asserted either. There are several possible solutions to this, which relate to the architecture for maintenance (Exercise 9.4). Arguably, neither option is a good option. 

- (c) There is no explicit link to the original AWO other than same IRI for the Spanish one, and an annotation at best. What would be a way to make it clear(er) that they are all related to AWO v1? 

**Answer Exercise 9.3.** Possible templates are as follows, noting that one can choose other words as well, and choose between being as close to the structure of the axiom, or decide on a more ‘colloquial’ rendering 

- (a) “ _< C >_ and _< D >_ are disjoint” 

- (b) “If there exists an outgoing arc from _< R >_ to _< C >_ , then it originates in _< D >_ ”, or, easier to read: “ _< D >_ is the domain of _< R >_ (when _< R >_ relates to _< C >_ )” 

- (c) “Each _< C > < R >_ only _< D >_ ” 

**Answer Exercise 9.4.** There are clearly many possibilities. Some essential ingredients, however, are: some place where language annotations can be stored, where some rules for the sentence can be stored and used, templates or patterns to generate a sentence for the axioms and/or parts thereof, and possibly algorithms to finalise the sentence, and the ontology. 

287 

### **Answers Chapter 10** 

**Answer Exercise 10.1.** They do not fare well in case 2 ( _for_ ISs), at least not in theory. First, because of the reliance on concrete domains. Second, the numbers you and your classmate had chosen for ‘old’ was likely not the same—it certainly wasn’t for the students in one of my classes and the cut-off point I had in mind!—which then raises the general question as to what to do with something like such a number difference when faced with choosing to reuse an ontology and when aligning ontologies or integrating system. Conversely, it thus may work well for a particular application scenario (case 1, _in_ ISs), assuming all its users agree on the fuzzy membership functions. 

**Answer Exercise 10.2.** Chronos and PROTON are relatively easy to find. Chronos uses constraint satisfaction for the temporal component, PROTON is based on Prolog. Chronos uses the 4d-fluents approach (i.e.: perdudantist [recall Chapter 6]) and implements a reasoner for the Allen relations. PROTON uses intervals and extends the situation calculus. 

**Answer Exercise 10.3.** No. (this is basically the same as the previous review question). Consider also the scope, as state in the W3C standard, with emphasis added: “OWL-Time is an OWL-2 DL ontology of temporal concepts, for _describing_ the temporal properties of resources in the world or described in Web pages. The ontology provides a _vocabulary for expressing facts_ about topological (ordering) relations among instants and intervals, together with information about durations, and about temporal position including date-time information. Time positions and durations may be expressed using either the conventional (Gregorian) _calendar and clock, or using another temporal reference system such as Unix-time, geologic time, or different calendars_ .”. That is: for annotations, but not for reasoning with it. 

### About the author 

Maria Keet (PhD, MSc, MA, BSc(hons)) is an Associate Professor at the Department of Computer Science, University of Cape Town, South Africa. She has taught multiple courses on ontology engineering at various universities yearly since 2009, as well as related courses, such as databases and theory of computation. Her research focus is on knowledge engineering with ontologies and Ontology, and their interaction with natural language and conceptual data modelling, which has resulted in over 100 peer-reviewed publications at venues including KR, FOIS, EKAW, K-CAP, ESWC, ER, CIKM, COLING, INLG, Applied Ontology, Data & Knowledge Engineering, and the Journal of Web Semantics, including best paper awards at EKAW’12, EKAW’18, and K-CAP’17. She is, and has been, a PI on NRF and DST funded projects, and she was involved in several EU projects (TONES, Net2, e-Lico). She is/was PC (co-)chair of EKAW’20, the ISWC’19 outrageous ideas track, CNL’18, the ESWC’14 track on ontologies, OWLED’14, the ISAO’16 and AFIRM’20 summer schools, was local chair of FOIS’18 and ISAO’18, and has served on many Program Committees of international workshops and conferences and reviewed for journals. 

Before her employment at UCT, Maria was a tenured Senior Lecturer at the School of Mathematics, Statistics, and Computer Science at the University of KwaZulu-Natal, South Africa and before that, an Assistant Professor at the KRDB Research Centre, Free University of Bozen-Bolzano, Italy. She obtained a PhD in Computer Science at the KRDB Research Centre in 2008, following a BSc(honours) 1st class in IT & Computing from the Open University UK in 2004, and 3.5 years work experience as systems engineer in the IT industry. In addition to computer science, she obtained an MSc in Food Science (Microbiology) from Wageningen University and Research Centre, the Netherlands, in 1998, and an MA 1st class in Peace & Development Studies from the University of Limerick, Ireland, in 2003. 

289 

