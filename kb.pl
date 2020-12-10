%!eligibility list
%!@param: CGPA
%! Prints corresponding string.
eligible(10,['Your score meets the required criteria. Fill in the online form and pay the exam fees.']).
eligible(9,['Your score meets the required criteria. Fill in the online form and pay the exam fees.']).
eligible(8,['Your score meets the required criteria. Fill in the online form and pay the exam fees.']).
eligible(7,['Your score meets the required criteria. Fill in the online form and pay the exam fees.']).
eligible(6,['Sorry your score doesnt meet the required criteria']).
eligible(5,['Sorry your score doesnt meet the required criteria']).
eligible(4,['Sorry your score doesnt meet the required criteria']).
eligible(3,['Sorry your score doesnt meet the required criteria']).
eligible(2,['Sorry your score doesnt meet the required criteria']).
eligible(1,['Sorry your score doesnt meet the required criteria']).
eligible(0,['Sorry your score doesnt meet the required criteria']).

%!prints, when called, deadline to submit application.
deadline([15,'Jan',2020]).

%!prints, when called, examination date.
examdate([15,'Feb',2020]).

%!prints, when called, examination centers.
exam-centers(['AMC Engineering College, 18th Kilometer, Bannerghatta Main Road, Bengaluru, Karnataka - 560083',
              'City Engineering College, Doddakalasandra, Bengaluru, Karnataka,560062',
              'New Prince Shri Bhavani College Of Engineering & Technology,  Vengaivasal Main Road, Valli Nagar, Gowrivakkam, Sembakkam, Chennai, Tamil Nadu 600073',
              'Sri Ramakrishna Engineering College Vattamalaipalayam,NGGO Colony PO,Coimbatore,Tamil Nadu',
              'DPG Institute of Technology & Management, Sector-34, Near Hero Honda Chowk, NH-8, Gurgaon, Haryana, 122001',
              'BITS Pilani-Dubai Campus, International Academic City, P.O. Box  345055, DUBAI, UAE',
              'BITS Pilani-KK Birla Goa Campus, NH 17B Bye Pass Road, Zuarinagar - 403726',
              'Swami Vivekananda Institute of Technology, Patny Centre, SD Road, Maruthi Veedhi, Shivaji Nagar, Secunderabad, Telangana 500003.',
              'Aliah University, II A/27 Action Area II, New Town, Rajarhat, Kolkata,700156 West Bengal',
              'Ramarao Adik Institute of Technology Dr. D.Y. Patil Vidyanagar,Sector 7, Nerul,Navi Mumbai,Maharashtra-400706',
              'WILP Division (Right side of Library building), BITS Pilani - Pilani Campus, Vidya Vihar, Pilani 333031, Rajasthan',
              'SMT. KASHIBAI NAVALE COLLEGE OF ENGINEERING, Survey. No. 44-1, Vadgaon Budruk, Off. Sinhgad Road,Pune,Maharashtra-411041']).

%!prints, when called, examination syllabus
syllabus(['NCERT - 10th,11th,12th','CBSC - 10th,11th,12th','ICSE - 10th,11th,12th','NIOS - 10th,11th,12th']).

%!prints, when called, examination instructions
instruction(['We have collated the following good practices that would be useful for you to consider for a smooth and interruption free experience of the online proctored examinations:',
             'Login to the system on time for the examination. This ensures timely identity verification, system readiness and timely start of the online proctored examination.',
             'For any support concerning the examination platform, you may reach out to the online proctor through the system’s chat feature. This is your first line of support when you are still logged into the system.',
             'In case you face a technical difficulty and are unable to resolve it through your online proctor, you may call in the helpline number. This helpline number will connect you with a Tech Help Desk executive who will support you for any technical issue you might face with the examination platform. Helpline number will be shared via an email that also carries your exam link and login credentials. Aforesaid email will be sent you one day before the start of the examination.Helpline number will be active during your examinations only.',
             'Please note that while attempting the Online proctored examinations there might be instances wherein the Wheebox support team members may reach out to you to extendsupportespeciallyin cases related to technical issues faced by the students. Students are requested to kindly receive the call for assistance by the Wheebox support team. Please note that in case you do not respondto calls made by our technical support team, you may face issues later on while uploading / submitting your answers. We request you to keep your mobile phones close by while attempting the examination for the same.',
             'Avoid delays and interruptions that might get caused due to undue high usage of the upload facility for answers written on A4 sheets. Follow the below guidelines to minimize the possibility of interruption in the online exam due to over use of the upload facility:',
             'For questions where it is simple to directly input the entire answer into the system, please type in the answer using your laptop/desktop key board. Avoidwriting and uploading the answers to such questions using A4 sheets and the system’s upload facility.',
             'For questions where it is simple to directly input a large part of the answer into the system, you may Input that larger part of the answer using your laptop/desktop key board. A4 sheet should be used to write and uploadthose parts of the answer which might be tough to enter using a laptop/desktop key board because they may involve drawing a diagram or writing some complex equations etc. that is hard to input using a keyboard.',
             'Only for questions where answers primarily / mostly involve writing of complex equations and diagrams or any other content that is difficult to type in using the laptop/desktop’s keyboard, you may choose to entirely write and upload your answer using the A4 sheets.',
             'The above guidelines will help you avoid undue delays and interruptions during the examination on account of uploads.']).

%!prints, when called, scholarship information			 
schlorship(['Under BITS own merit award scheme Top 1% Students get 100% of total tuition fee as amount of scholarship' ,
            'Under BITS own merit award scheme Top 2% Students get 40% of total tuition fee as amount of scholarship' ,
            'Under BITS own merit-cum-need awards scheme 3% Students get 80% of total tuition fee as amount of scholarship' ,
            'Under BITS own merit-cum-need awards scheme 6% Students get 40% of total tuition fee as amount of scholarship' ,
            'Under BITS own merit-cum-need awards scheme 12% Students get 25% of total tuition fee as amount of scholarship' ,
            'Under BITS own merit-cum-need awards scheme 6% Students get 15% of total tuition fee as amount of scholarship',
            'For any further queries please send mail to admnoc@pilani.bits-pilani.ac.in']).

%!prints, when called, fee structure		
fee(['Admission Fees : 43800',
     'Semester 1 fee : 199000',
     'Semester 2 fee : 199000',
	 'Students Union fee : 450',
	 'Students Aid Fund : 225',
     'Hostel, Mess & Electricity fee : 54300',
	 'Other Advances : 24000' ,
     'Institute Caution Deposit : 3000']).

payment(['online: pay from bits pilani portal www.bitsadmission.com']).
	 
%!bitsat score
%!@param: bitsat hall ticket number
%! Prints ranking of the candidate corresponding to the hallticket
bitsat_score(bitsat2019b12345,1).
bitsat_score(bitsat2019b12346,9).
bitsat_score(bitsat2019b12347,6).
bitsat_score(bitsat2019b12348,7).
bitsat_score(bitsat2019b12349,5).
bitsat_score(bitsat2019b12350,6).
bitsat_score(bitsat2019b12351,2).
bitsat_score(bitsat2019b12352,8).
bitsat_score(bitsat2019b12353,3).
bitsat_score(bitsat2019b12354,10).
bitsat_score(bitsat2019b12355,12).
bitsat_score(bitsat2019b12356,11).
bitsat_score(bitsat2019b12357,14).
bitsat_score(bitsat2019b12358,13).
bitsat_score(bitsat2019b12359,16).
bitsat_score(bitsat2019b12360,15).
bitsat_score(bitsat2019b12361,18).
bitsat_score(bitsat2019b12362,17).
bitsat_score(bitsat2019b12363,20).
bitsat_score(bitsat2019b12364,19).
bitsat_score(bitsat2019b12365,25).
bitsat_score(bitsat2019b12366,26).
bitsat_score(bitsat2019b12367,21).
bitsat_score(bitsat2019b12368,22).
bitsat_score(bitsat2019b12369,28).
bitsat_score(bitsat2019b12370,29).
bitsat_score(bitsat2019b12371,23).
bitsat_score(bitsat2019b12372,24).
bitsat_score(bitsat2019b12373,27).
bitsat_score(bitsat2019b12374,39).
bitsat_score(bitsat2019b12375,38).
bitsat_score(bitsat2019b12376,37).
bitsat_score(bitsat2019b12377,36).
bitsat_score(bitsat2019b12378,35).
bitsat_score(bitsat2019b12379,34).
bitsat_score(bitsat2019b12380,33).
bitsat_score(bitsat2019b12381,32).
bitsat_score(bitsat2019b12382,32).
bitsat_score(bitsat2019b12383,39).
bitsat_score(bitsat2019b12384,40).
bitsat_score(bitsat2019b12385,49).
bitsat_score(bitsat2019b12386,50).
bitsat_score(bitsat2019b12387,51).
bitsat_score(bitsat2019b12388,52).
bitsat_score(bitsat2019b12389,53).
bitsat_score(bitsat2019b12390,54).
bitsat_score(bitsat2019b12391,55).
bitsat_score(bitsat2019b12392,56).
bitsat_score(bitsat2019b12393,57).
bitsat_score(bitsat2019b12394,58).
bitsat_score(bitsat2019b12395,59).
bitsat_score(bitsat2019b12396,42).
bitsat_score(bitsat2019b12397,43).
bitsat_score(bitsat2019b12398,44).
bitsat_score(bitsat2019b12399,45).
bitsat_score(bitsat2019b12400,46).
bitsat_score(bitsat2019b12401,47).
bitsat_score(bitsat2019b12402,48).
bitsat_score(bitsat2019b12403,59).
bitsat_score(bitsat2019b12404,60).		 

%!cutoff
%!@param: branch code
%! Prints cutoff ranking for each branch code.
cutoff(cs,10).
cutoff(et,20).
cutoff(ee,30).
cutoff(mech,45).
cutoff(civil,60).

%!alloted 
%!@param: bitsat rank
%! Prints alloted branch
alloted(0,['Computer Science']).
alloted(1,['Computer Science']).
alloted(2,['Electronics and Telecommunication']).
alloted(3,['Electrical and Electronics']).
alloted(4,['Mechanical']).
alloted(5,['Mechanical']).
alloted(6,['Civil']).

verifypaid(1,1).
