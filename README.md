# Metode Numerice - Tema 2

La fiecare task am adaugat explicatii si in comentarii (ce am considerat eu necesar pe masura ce am implementat functiile). 
Nu am sa rescriu aici ce am pus in comentarii.

## Numerical Music
Un task foarte interesant, chiar mi-a placut.

Am implementat pas cu pas formulele si indicatiile primite pentru fiecare functie.

### Spectograme
- **Plain Loop vs. Plain Sound**

*Plain Sound* reprezinta un sunet cu o frecventa dominanta (liniile acelea verticale izolate care corespund "tiuitului" urmat de "poc").

- **Low Pass vs. Plain Sound**

*Low Pass* are un range de frecvente mai limitat; de aceea sunetul pare "inabusit" in comparatie cu *Plain Sound*.

- **Reverb vs. Plain Sound**

Se poate observa ca in cazul lui *Reverb* sunetul este "mentinut", liniile verticale nu mai sunt asa clare ca la *Plain Sound*, de aceea se si aude cu ecou.

- **Tech**

Se poate observa ca sunetul este mai complex ca *Plain Sound*, are un numar de linii verticale mai mare raspandite intr-un interval de frecventa.

*Low Pass* si *Reverb* se manifesta ca si mai devreme si cand sunt aplicate lui *Tech* (sunet inabusit, respectiv sunet cu ecou).

## Robotzii
### Cubic Spline Interpolation
La acest task a fost mai mult de munca spre deosebire de celelalte (fara foaie si pix nu m-am descurcat).

Ca sa pot calcula coeficientii a_i, b_i, c_i, d_i din sistemul A * coef = b, am folosit relatiile: si(xi) = ai, si'(xi) = bi, si''(xi) = 2 * ci. Am inlocuit aceste rezultate in fiecare ecuatie a sistemului prezentat in enunt si am completat matricea.

Pentru a calcula valorile polinomului *spline* corespunzatoare componentelor lui x_interp, am determinat intervalul in care se gaseste fiecare dintre acestea folosindu-ma de cautare binara (pentru eficienta; alta metoda incercata depasea 20s). Dupa determinarea intervalului, am "extras" coeficientii corespunzatori din vectorul de coeficienti si am calculat y_interp(i) cu formula data.

### Vandermonde Interpolation
Am construit matricea A astfel incat sa aiba forma prezentata in enunt, am determinat coeficientii din sistemul A * coef = y si am calculat valorile polinomului in x_interp(i), i = 1 : length(coef), folosind formula data.

## Recommendations
### Preprocess
Pentru fiecare client numar cate review-uri are. Daca acest numar nu atinge numarul minim necesar, marchez acest lucru intr-un vector care are pe pozitia corespunzatoare fiecarui client valoarea 1 daca acesta trebuie eliminat. Pastrez in matrice doar clientii care au pe pozitia corespunzatoare lor in vectorul descris anterior valoarea 0.


Pentru implementarea celorlalte functii am urmat pasii din cerinte si formulele (a fost un task pretty straightforward, nu stiu cum as putea sa dezvolt mai mult fara sa repet ce scrie in assignment sau ce am pus in comentarii).