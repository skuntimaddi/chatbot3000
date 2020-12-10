%!Chat Bot 3000 is an assistant for candidates looking for informatio on courses provided in BITS. It provides information on.
%!1] Eligibility for entrance tests - takes CGPA as input and verfies if candidate is eligible to sit for BITSAT exam.
%!2] Application process - Informs the candidate about the application process like deadlines, exam dates, exam centers, instructions etc.
%!3] Admission status - informs the candidate based on his BITSAT hall ticket number whether he has been alloted a seta or not.
%!4] Process of admission - provides information about fees and asks candidate to pay fees for confirming seat in alloted branch.


%! dependent knowledge base
:- consult('kb.pl'). 
%! stores candidates ID, name, CGPA and eligible branches 
:- dynamic ec/4.
%! stores candidate ID, name and the instructions requested.
:- dynamic ap/3.
%! stores candidate ID, hall ticket number, score, alloted branch, fees paid, seat confirmed information.
:- dynamic admit/6.
%! stores candidate ID and name
:- dynamic person/2.
%! stores candidate ID and hall ticket
:- dynamic known_hl/2.

%!Read input as strings for saving candidate names.
read_string(String) :-
    current_input(Input),
    read_line_to_codes(Input,Codes),
    string_codes(String,Codes).

	
%! Routine to check if the person is already known to system and return name.
is_person(ID,Name) :-
 	person(ID,Name).
%! Routine to check if the person is already known to system, ask name and persist the information.
is_person(ID,Name) :-
	\+person(ID, Name),	
	write('I don\'t seem to know your name, What shall I call  you? '),
	read(Name),
	asserta(person(ID,Name)),
	!.

%! Function to generate unique ID for each request ChatBot3000 receives..
find_next_ID(ID,ID) :-
	\+person(ID,_).
find_next_ID(Curr, ID) :-
	person(Curr,_),
	Next is Curr+1,
	find_next_ID(Next, ID),
	!.

%! Function to know if the hall tick param has already been entered. 
%! hall ticket is mapped with the ID.	
is_known_hl(ID,Ref) :-
    /*write('Checking if hallticket has ready been entered'),nl,*/
	known_hl(ID,Ref),
	write('Proceed with option'),nl.
is_known_hl(ID,Ref) :-
    /*write('Checking if hallticket has ready been entered'),nl,*/
	\+known_hl(ID,Ref),
	write('Enter your hall ticket number :'),read(Ref),
	assert(known_hl(ID,Ref)),nl,!.

%! Function to check if fees has been paid. if paid updates confirm parameter. 
%! else prints message.
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

%! Function to check if confirmation parameter has been set. 
%! else prints message.
is_Cnf(Ref):-
    write('Checking for confirmation for '),write(Ref),write('.....\n'),
	admit(_,Ref,_,_,1,1),
	write("The fees has been paid & seat confirmed"),nl.
is_Cnf(Ref):-
	\+admit(_,Ref,_,_,1,1),
	write('Your seat is not confirmed yet. Please check your payment status and contact admnoc@pilani.bits-pilani.ac.in\n'),
	!.	

%! Function to check print list. 
printlist([]).
printlist([H|T]) :-
    write(H),nl,write('\t'),
    printlist(T).

%! Function to check verify eligibility criteria for BITSAT.
%! @param: ID. 
%! @input: CGPA
%! Prints eligibility message.
eligibility_criteria(ID) :- 
   write('Elgibility for BE degree.....'),nl,
   person(ID,Name),
   write('What is your CGPA 12th Board Exam?'),nl,
   read(Cgpa),
   C is round(Cgpa), /*rounds CGPA to nearest number to get elibility*/
   eligible(C,Branches),
   write(Name),write(', '),
   printlist(Branches),
   assert(ec(ID,Name,Cgpa,Branches)),nl,nl,nl,
   greeting(ID).

%! Function to print last date to submit BITSAT application.
%! @param: ID, option, candidate name. 
%! Prints date.  
app_option(ID,1,Name_ap):-
	deadline(Date),
	write('The last day for submitting application is :'),
	write(Date),nl,
	assert(ap(ID,Name_ap,'Deadline')),
	app_process(ID).

%! Function to print BITSAT examination date.
%! @param: ID, option, candidate name. 
%! Prints date.
app_option(ID,2,Name_ap) :-
    examdate(Date),
	write('The exam will be held on :'),
	write(Date),nl,
	assert(ap(ID,Name_ap,'Exam date')),
	app_process(ID).

%! Function to print BITSAT examination centers.
%! @param: ID, option, candidate name. 
%! Prints list of examination centers.
app_option(ID,3,Name_ap) :-
    exam-centers(Centers),
	write('The exam centers are : \n\t'),
	printlist(Centers),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Exam centers')),
	app_process(ID).

%! Function to print BITSAT examination centers.
%! @param: ID, option, candidate name. 
%! Prints list of examination centers.
app_option(ID,4,Name_ap) :-
    instruction(Inst),
	write('Here are some instructions we would yoou to follow:\n\t'),
	printlist(Inst),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Special instructions')),
	app_process(ID).
	
%! Function to print BITSAT exam syllabus.
%! @param: ID, option, candidate name. 
%! Prints examination syllabus.
app_option(ID,5,Name_ap) :-
    syllabus(Syb),
	write('The exam syllabus is : \n\t'),printlist(Syb),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Syllabus')),
	app_process(ID).

%! Function to print BITS Scholarship details.
%! @param: ID, option, candidate name. 
%! Prints BITS Scholarship details.	
app_option(ID,6,Name_ap) :-
    schlorship(Schp),
	write('The schloarship available at BITS is : \n\t'),
	printlist(Schp),nl,nl,nl,nl,
	assert(ap(ID,Name_ap,'Scholarship')),
	app_process(ID).

%! Exits from the application process menu.
%! @param: ID, option, candidate name. 
%! Prints exit message.	
app_option(ID,7,Name_ap) :-
    write('Bye from application process menu, '),write(Name_ap),nl,nl,
	greeting(ID).

%! Function to handle wrong options entered by users.
%! @param: ID, option, candidate name. 
%! Prints message and goes back to application process menu.
app_option(ID,Y,Name_ap) :-
	write('Wrong choice '),write(Name_ap),
	write(' '),write(Y),nl,
	app_process(ID),!.

%! Function to print Applciation process menu and handle user input.
%! @param: ID. 
%! Prints menu, takes in options and saves the entered values against ID, name.	
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

%! Function to show admission status.
%! @param: ID
%! @input: BITSAT hall ticket number [Example - bitsat2019b12345]
%! Prints cutoff for various engineering branches and alloted engineering seat.	
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
	assert(known_hl(ID,Hl)),
	nl,nl,nl,nl,
	greeting(ID).
	
%! Function to print BITS fee structure.
%! @param: ID, option. 
%! Prints exam fee structure.
adm_option(ID,1) :-
    write('The Fee structure \n\t'),
	fee(Fee),
	printlist(Fee),
	person(ID,Name),write(Name),
	known_hl(ID,Ref),
	write(', Reference '),write(Ref),
	write(' please pay earliest.'),nl,nl,
	admission(ID).

%! Function to print BITS online fee portal.
%! @param: ID, option. 
%! @input: Confirm if payment has been completed by user. 
%! Prints fee confirmation.
adm_option(ID,2) :-
    write('The payment'),nl,
	payment(Pay),
	printlist(Pay),nl,
	write('Enter 1 to confirm payment is done'),
	read(Val),
	verifypaid(Val,Paid),
	known_hl(ID,Ref),
	assert(admit(ID,Ref,_,_,Paid,_)),
	nl,nl,nl,	
	admission(ID).	
		
%! Function to print BITS feed paid status.
%! @param: ID, option. 
%! verifies if payment parameter is set and sets confirmation parameter.
%! Prints feed paid confirmation.
adm_option(ID,3) :-
    write('The status '),nl,	
	known_hl(ID,Ref),
	has_paid(Ref),nl,	
	admission(ID).        
	
%! Function to print BITS seat confirmation status.
%! @param: ID, option. 
%! verifies if payment parameter is set and sets confirmation parameter.
%! Prints seat confirmation.
adm_option(ID,4) :-
    write('Confirming......'),nl,
	known_hl(ID,Ref),
	is_Cnf(Ref),nl,	
	admission(ID).	

%! Function to handle exit option from admission menu.
%! @param: ID, option. 
%! Prints exit message.
adm_option(ID,5) :-
    write('Bye'),known_hl(ID,Ref),
	write(Ref),write(' from admission menu'),
	nl,nl,
	greeting(ID).

%! Function to handle wrong option from admission menu.
%! @param: ID, option. 
%! retunes to admission menu.	
adm_option(ID,Z) :-
	write('Wrong choice '),
	known_hl(ID,Ref),write(Ref),
	write(' '),write(Z),nl,
	admission(ID),!.
	
%! Function to display the admission menu.
%! @param: ID, option. 
%! @input: takes in options from user and calls respective function.retunes to admission menu.	
admission(ID) :- write("The process of admission is"),nl,
    /*write('Enter your hallticket number'),
	read(Ref),*/
	is_known_hl(ID,_),
   	write('1. Fee Structure'),nl,
	write('2. Payment details'),nl,
	write('3. Payment Status'),nl,
	write('4. Confirmation'),nl,
	write('5. Quit'),nl,
	write('Enter 1/2/3/4/5 :  '),
	write(' > '),
    read(Z),
	adm_option(ID,Z),
	write('\n').

%! Function to handle eligibility criteria option.
%! @param: ID, option. 
%! calls eligibility criteria routine.
main_option(ID,1) :-
	eligibility_criteria(ID), !.
	
%! Function to handle application process option.
%! @param: ID, option. 
%! calls application process routine.
main_option(ID,2) :-
	app_process(ID),!.

%! Function to handle admit status option.
%! @param: ID, option. 
%! calls admit status routine.
main_option(ID,3) :-
	admit_status(ID),!.

%! Function to handle admission status option.
%! @param: ID, option. 
%! calls admission status routine.
main_option(ID,4) :-
	admission(ID),!.

%! Function to handle welcome menu option.
%! @param: ID, option. 
%! Takes user back to welcome menu by calling main().
main_option(ID,5) :-
    write('Ok. lets go back to welcome menu '),
	person(ID,Name),write(Name),nl,nl,
	main(),!.

%! Function to handle exit option.
%! @param: ID, option. 
%! prints exit message.
main_option(ID,6) :-
    write('You are quiting the Bot-3000 support. Bye '),
	person(ID,Name),write(Name),nl,nl,
	undo.

%! Function to handle wrong user option.
%! @param: ID, option. 
%! calls greeting routine to display main  menu.	    
main_option(ID,M_op) :-
	write('Wrong choice '),write(M_op),nl,
	greeting(ID),!.

%! Function to display main menu.
%! @param: ID. 
%! @input: user options for functionalities supported.
%! calls main function with the user option.	
greeting(ID) :-
    write('Main Menu'), nl, 
	write('----------------------------------------------------------------'),nl,
	write('Select among the following categories'), nl,
	write('1. Eligibility criteria'),nl,
	write('2. Application process'),nl,
	write('3. Application status'),nl,
	write('4. Admission status'),nl,
	write('5. Back to welcome menu'),nl,
	write('6. Quit'),nl,
	write('Enter 1/2/3/4/5/6 :  '),
	write(' > '),
    read(M_op),
    main_option(ID,M_op).

%! Function to display welcome menu.
%! @param: ID. 
%! @input: user options for functionalities supported.
%! calls main function with the user option.	
greeting() :-
    write('Hi! I am Bot-3000. I am here to provide you with information in admissions into BITS Pilani'), nl, 
	find_next_ID(0, ID),
	write('Enter your name: '),
	read_string(Name),
	write('Welcome '),write(Name),nl,
	asserta(person(ID,Name)),nl,
	write('Welcome Menu'), nl, 
	write('----------------------------------------------------------------'),nl,
	write('Select among the following categories'), nl,
	write('1. Eligibility criteria'),nl,
	write('2. Application process'),nl,
	write('3. Application status'),nl,
	write('4. Admission'),nl,
	write('5. Start a new chatbot session'),nl,
	write('6. Quit'),nl,
	write('Enter 1/2/3/4/5/6 :  '),
	write(' > '),
    read(M_op),
    main_option(ID,M_op),
	write('\n').

%! Main function to display welcome menu.
main() :-
    greeting().

%! Application entry function. First function to run.
go() :-
    write('0000000000000000000000000000000000000000000000000000000000000000000000000000000000000'),nl,
    write('0000000000000000000000000000000000000000000000000000000000000000000000000000000000000'),nl,
    main(), !.
	
%! retract all information that has been saved earlier.
undo:- retract(person(_,_)),fail.
undo:- retract(ec(_,_,_,_)),fail.
undo:- retract(ap(_,_,_)),fail.
undo:- retract(admit(_,_,_,_,_,_)),fail.
undo:- retract(known_hl(_,_)),fail.
undo.	

