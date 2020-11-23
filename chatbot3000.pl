:- consult('kb.pl').
:- dynamic ec/4.
:- dynamic ap/3.
:- dynamic admit/6.
:- dynamic person/2.

read_string(String) :-
    current_input(Input),
    read_line_to_codes(Input, Codes),
    string_codes(String, Codes).

is_person(ID,Name) :-
 	person(ID,Name).
is_person(ID,Name) :-
	\+person(ID, Name),	
	write('I don\'t seem to know your name, What shall I call  you? '),
	read(Name),
	asserta(person(ID,Name)),
	!.

find_next_ID(ID, ID) :-
	\+person(ID,_).
find_next_ID(Curr, ID) :-
	person(Curr,_),
	Next is Curr+1,
	find_next_ID(Next, ID),
	!.
	
has_paid(Ref):-
    write('Checking for '),write(Ref),write('.....\n'),
	admit(_,Ref,_,_,1,_),
	write("The fees has been paid, confirming seat"),nl,
	Cnf is 1,
	assert(admit(_,Ref,_,_,_,Cnf)),
	nl,nl.
has_paid(Ref):-
	\+admit(_,Ref,_,_,1,_),
	write('You don\'t seem to have paid the fees. Please pay for seat confirmation\n'),
	nl,!.

is_Cnf(Ref):-
    write('Checking for confirmation for '),write(Ref),write('.....\n'),
	admit(_,Ref,_,_,1,1),
	write("The fees has been paid & seat confirmed"),nl.
is_Cnf(Ref):-
	\+admit(_,Ref,_,_,1,1),
	write('Your seat is not confirmed yet. Please check your payment status and contact admnoc@pilani.bits-pilani.ac.in\n'),
	!.	

printlist([]).
printlist([H|T]) :-
    write(H),nl,write('\t'),
    printlist(T).

eligibility_criteria(ID) :- 
   write('Elgibility for BE degree.....'),nl,
   person(ID,Name),
   write('What is your CGPA 12th Board Exam?'),nl,
   read(Cgpa),
   C is round(Cgpa),
   eligible(C,Branches),
   write(Name),write(', '),
   printlist(Branches),
   assert(ec(ID,Name,Cgpa,Branches)),nl,nl,nl,
   greeting(ID).
  
app_option(ID,1,Name_ap):-
	deadline(Date),
	write('The last day for submitting application is :'),
	write(Date),nl,
	assert(ap(ID,Name_ap,'Deadline')),
	app_process(ID).

app_option(ID,2,Name_ap) :-
    examdate(Date),
	write('The exam will be held on :'),
	write(Date),nl,
	assert(ap(ID,Name_ap,'Exam date')),
	app_process(ID).

app_option(ID,3,Name_ap) :-
    exam-centers(Centers),
	write('The exam centers are : \n\t'),
	printlist(Centers),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Exam centers')),
	app_process(ID).

app_option(ID,4,Name_ap) :-
    instruction(Inst),
	write('Here are some instructions we would yoou to follow:\n\t'),
	printlist(Inst),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Special instructions')),
	app_process(ID).

app_option(ID,5,Name_ap) :-
    syllabus(Syb),
	write('The exam syllabus is : \n\t'),printlist(Syb),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Syllabus')),
	app_process(ID).
	
app_option(ID,6,Name_ap) :-
    schlorship(Schp),
	write('The exam centers are : \n\t'),
	printlist(Schp),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Scholarship')),
	app_process(ID).

app_option(ID,7,Name_ap) :-
    write('Bye from application process menu, '),write(Name_ap),nl,nl,
	greeting(ID).

app_option(ID,Y,Name_ap) :-
	write('Wrong choice '),write(Name_ap),
	write(' '),write(Y),nl,
	app_process(ID),!.
	
app_process(ID) :- 
    write("Application process -- What do you want to know?"),nl,
   	write('1. Deadline'),nl,
	write('2. Exam date'),nl,
	write('3. Exam centers'),nl,
	write('4. Special instructions'),nl,
	write('5. Syllabus'),nl,
	write('6. Scholarship'),nl,
	write('7. Quit'),nl,
	write('Enter 1/2/3/4/5/6/7 :  '),
	write(' > '),
    read(Y),
	person(ID,Name_ap),
	app_option(ID,Y,Name_ap),
	write('\n').
	
admit_status(ID) :- write("What is your Admission status? let me tell you"),nl,
    write('Enter your hallticket number'),
	read(Hl),
	bitsat_score(Hl,Score),
	write("Your score is: "),write(Score),nl,
	write("The cutoff for various branches are:\n\t"),
	write("Computer Sciemce : "),cutoff(cs,R1),write(R1),nl,
	write("\tElectronics and Telecommunication : "),cutoff(et,R2),write(R2),nl,
	write("\tElectrical and Electronics : "),cutoff(ee,R3),write(R3),nl,
	write("\tMechanical : "),cutoff(mech,R4),write(R4),nl,
	write("\tCivil : "),cutoff(civil,R5),write(R5),nl,
	Scr is round(Score/10),nl,
	write("You have been alloted a seat in : "),
	alloted(Scr,Seat),
	printlist(Seat),
	write(" Engineering"),nl,
	write("Congratulations "),
	person(ID,Name),write(Name),
	assert(admit(ID,Hl,Score,Seat,_,_)),
	nl,nl,nl,nl,
	greeting(ID).
	
adm_option(ID,1,Ref) :-
    write('The Fee structure \n\t'),
	fee(Fee),
	printlist(Fee),
	person(ID,Name),write(Name),
	write(', Reference '),write(Ref),
	write(' please pay earliest.'),nl,nl,
	admission(ID).

adm_option(ID,2,Ref) :-
    write('The payment'),nl,
	payment(Pay),
	printlist(Pay),nl,
	write('Enter 1 to confirm payment is done'),
	read(Val),
	verifypaid(Val,Paid),
	assert(admit(ID,Ref,_,_,Paid,_)),
	nl,nl,nl,	
	admission(ID).	
		
adm_option(ID,3,Ref) :-
    write('The status '),nl,	
	has_paid(Ref),nl,	
	admission(ID).        
	
adm_option(ID,4,Ref) :-
    write('Confirming......'),nl,
	is_Cnf(Ref),nl,	
	admission(ID).	

adm_option(ID,5,Ref) :-
    write('Bye'),write(Ref),write(' from admission menu'),nl,nl,nl,nl,
	greeting(ID).
	
adm_option(ID,Z,Ref) :-
	write('Wrong choice '),write(Ref),
	write(' '),write(Z),nl,
	admission(ID),!.
	
admission(ID) :- write("The process of admission is"),nl,
    write('Enter your hallticket number'),
	read(Ref),
   	write('1. Fee Structure'),nl,
	write('2. Payment details'),nl,
	write('3. Payment Status'),nl,
	write('4. Confirmation'),nl,
	write('5. Quit'),nl,
	write('Enter 1/2/3/4/5 :  '),
	write(' > '),
    read(Z),
	adm_option(ID,Z,Ref),
	write('\n').

main_option(ID,1) :-
	eligibility_criteria(ID), !.
	
main_option(ID,2) :-
	app_process(ID),!.

main_option(ID,3) :-
	admit_status(ID),!.

main_option(ID,4) :-
	admission(ID),!.

main_option(ID,5) :-
    write('You are quiting the Bot-3000 support. Bye '),
	person(ID,Name),write(Name),
	undo.
	    
main_option(ID,M_op) :-
	write('Wrong choice '),write(M_op),nl,
	greeting(ID),!.

greeting(ID) :-
    write('Main Menu'), nl, 
	write('Select among the following categories'), nl,
	write('1. Eligibility criteria'),nl,
	write('2. Application process'),nl,
	write('3. Application status'),nl,
	write('4. Admission'),nl,
	write('5. Quit'),nl,
	write('Enter 1/2/3/4/5 :  '),
	write(' > '),
    read(M_op),
    main_option(ID,M_op).

greeting() :-
    write('Hi! I am Bot-3000. I am here to provide you with information in admissions into BITS Pilani'), nl, 
	find_next_ID(0, ID),
	write('Enter your name :'),
	/*read(Name),*/
	read_string(Name),
	asserta(person(ID,Name)),
	write('Main Menu'), nl, 
	write('Select among the following categories'), nl,
	write('1. Eligibility criteria'),nl,
	write('2. Application process'),nl,
	write('3. Application status'),nl,
	write('4. Admission'),nl,
	write('5. Quit'),nl,
	write('Enter 1/2/3/4/5 :  '),
	write(' > '),
    read(M_op),
    main_option(ID,M_op),
	write('\n').

main() :-
    greeting().

go() :-
    main, !.
	
undo:- retract(person(_,_)),fail.
undo:- retract(ec(_,_,_,_)),fail.
undo:- retract(ap(_,_,_)),fail.
undo:- retract(admit(_,_,_,_,_,_)),fail.
undo.	

