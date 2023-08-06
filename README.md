# Tema1_MN

**Nume: Titoc Oana Alexandra**
**Grupa: 313CA**

Doresc corectarea manuală a testelor pentru tema 1.

## Metode numerice matriceale - Tema1

### Markov is coming...

### Descriere:

* Aceasta problema are ca scop gasirea in mod eficient a unui drum spre iesirea
dintr-un labirint. Avand la dispozitie labitintul si o pozitie de plecare,
ne-am propus sa gasim probabilitatile de a ajunge catre castig din fiecare nod
si astfel, drumul optim.

* Am citit fisierul de intrare in care aveam o matrice in forma codificata.
Am transformat numarul in baza 2, bitii de 1 reprezentau zid, iar cei de 0,
cale libera. Fiecare dintre cei 4 biti erau asociati unei directii de deplasare
(sus, jos, stanga, dreapta). Am completat in matricea de adiacenta cu 1
pozitiile care reprezentau o legatura intre doua noduri (cale libera).

* Prin intermediul matricei de adiacenta am construit matricea Link. Daca in
matricea de adiacenta am marcat cu 1 pozitiile in care aveam legatura intre
doua noduri, in matricea Link am pus probabilitatea de deplasare dintr-un nod
in altul pe aceleasi pozitii.

* Am aplicat metoda Jacobi pentru a aproxima vectorul de probabilitati
de castig din fiecare nod.

* Pornind de la un nod dat, am construit vectorul path care reprezinta drumul
de la nod pana la starea de win. Din fiecare nod am aflat probabilitatea maxima
de castig pentru vecinii lui la care avea acces si m-am dus la cel care avea
probabilitatea cea mai mare.

* Asfel, am aflat drumul spre starea de win din oricare nod, pe care am si
decodificat-o in vectorul decoded_path cu indicii corespunzatori nodurilor.



### Linear Regression

### Descriere:

* Aceasta problema si-a propus sa gaseasca tehnici de manipularea predictiilor
si a erorilor ce pot sa apara in prelucrarea computationala a algoritmilor de
invatare automata supervizata. Problema isi propune sa foloseasca tehnici
precum multiple regression pentru a face diferite predictii in ceea ce priveste
un set de date.

* Pentru prima functie parse_data_set_file am citit din fisier numarul de linii
si de coloane si apoi Y - vectorul cu valorile actuale si InitialMatrix -
matricea ce trebuie sa fie transformata.

* Am transformat matricea InitialMatrix intr-o matrice numerica FeatureMatrix, 
analizand pe rand fiecare element: daca era "yes" => 1, daca era "no" => 0,
"semi-furnished" => (1, 0), "furnished" => (0, 0), "unfurnished" => (0, 1).
Daca era numar il converteam cu str2double.

* Am aflat functia de cost prin metoda linear_regression asa cum este explicata
in formula din enunt.

* Am parsat un fisier csv astfel: cu functia csvread am citit citit intr-o
matrice valorile din fisier si am extras liniile si coloanele fisierului. M-am
deplasat inapoi la inceputul fisierului si cu ajutorul functiei textscan am
citit datele corecte din fisier. La fel ca in prima functie, le-am atribuit
valorilen lui Y si InitialMatrix.

* Am implementat gradientul descendent, lasso si ridge regression asa cum sunt
explicate in formulele din cerinta.

* Pentru normal_equation am prelucrat formula lui theta din enunt astfel ca am
ajuns la (X' * X) * theta = X' * Y, unde X = FeatureMatrix, (X' * X) = A,
theta = x, X' * Y = b (A, b, x din pseudocod).

### MNIST

* Pentru functia load_dataset am extras valorile matricei de exemple de
traininguri, X si vectorul de labeluri corespunzator din fisier.

* Pentru functia split_dataset am amestecat exemplele de traininguri prin
intermediul functiei randperm. Am calculat numarul de exemple pentru setul de
training, dupa care am creat valorile pentru setul de training si de test.

*  Pentru initialize_weights am calculat epsilon conform cerintei si am creeat
matricea cu elemente aleatoare in intervalul (-epsilon, epsilon).

### Comentarii asupra temei:

* Mi-a placut sa lucrez la aceasta tema deoarece am vazut aplicatii practice
care se pot rezolva cu ajutorul metodelor numerice.

* Am invatat sa lucrez mult mai bine in mediul Octave, am descoperit diferite
functionalitati ale lui si am folosit functii noi, interesante, cum ar fi
textscan, csvread. Am folosit atat matrice rare cat si matrice de tip cell.

* Sunt sigura ca exista si alte modalitati mai eficiente de rezolvare a temei
pe care sper sa le descopar dupa ce lucrez mai mult in mediul Octave.

### Resurse: 

1. (http://www.ece.northwestern.edu/local-apps/matlabhelp/techdoc/ref/str2double.html) - str2double
2. (https://octave.sourceforge.io/octave/function/csvread.html) - csvread
3. (https://octave.sourceforge.io/octave/function/textscan.html) -textscan
