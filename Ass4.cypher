=====================================================================
1. LIBRARY DATABASE
=====================================================================

CREATE
// -------------------- AUTHORS --------------------
(a1:Person:Author {authorId:1, name:"Vihaan Deshpande", born:1892}),
(a2:Person:Author {authorId:2, name:"Armaan Kulkarni", born:1903}),
(a3:Person:Author {authorId:3, name:"Rishabh Joshi", born:1920}),
(a4:Person:Author {authorId:4, name:"Yuvraj More", born:1973}),
(a5:Person:Author {authorId:5, name:"Adit Shah", born:1948}),
(a6:Person:Author {authorId:6, name:"Nakul Bhosale", born:1985, city:"Nagpur"}),
(a7:Person:Author {authorId:7, name:"Parth Naik", born:1982, city:"Nashik"}),
// authors from the textbook figure
(a8:Person:Author {authorId:8, name:"Soham Rao", born:1932, dob:date("1932-10-19")}),
(a9:Person:Author {authorId:9, name:"Devendra Iyer", born:1904, dob:date("1904-10-02"), died:date("1991-04-02")}),

// -------------------- READERS --------------------
(r1:Person:Reader {readerId:1, name:"Ayaan Kapoor"}),
(r2:Person:Reader {readerId:2, name:"Yuvraj Singh"}),
(r3:Person:Reader {readerId:3, name:"Rudra Verma"}),
(r4:Person:Reader {readerId:4, name:"Kiaan Malhotra"}),
(r5:Person:Reader {readerId:5, name:"Parth Iyer"}),
// readers from the figure (Ian is both Reader and Author)
(r6:Person:Reader:Author {readerId:6, authorId:10, name:"Neil Bhat"}),
(r7:Person:Reader {readerId:7, name:"Vedant Pawar"}),

// -------------------- REVIEWERS --------------------
(rv1:Person:Reviewer {reviewerId:1, name:"Shaurya Gupta"}),
(rv2:Person:Reviewer {reviewerId:2, name:"Omkar Jadhav"}),

// -------------------- TRANSLATORS --------------------
(t1:Person:Translator {translatorId:1, name:"Tanmay Chavan"}),
(t2:Person:Translator {translatorId:2, name:"Raghav Sinha"}),

// -------------------- SUPPLIERS --------------------
(s1:Person:Supplier {supplierId:1, name:"Samar More"}),
(s2:Person:Supplier {supplierId:2, name:"Kunal Deshpande"}),

// -------------------- PUBLISHERS --------------------
(p1:Publisher {publisherId:1, name:"Manish Reddy", city:"Manchester"}),
(p2:Publisher {publisherId:2, name:"Varun Naik", city:"Manchester"}),
(p3:Publisher {publisherId:3, name:"Aniket Shinde", city:"Denver"}),
(p4:Publisher {publisherId:4, name:"Soham Kulkarni", city:"Austin"}),
(p5:Publisher {publisherId:5, name:"Naman Mehta", city:"Krakow"}),
(p6:Publisher {publisherId:6, name:"Harsh Vora", city:"Nagpur"}),
(p7:Publisher {publisherId:7, name:"Akshay Joshi", city:"Nagpur"}),
(p8:Publisher {publisherId:8, name:"Pratik Patil", city:"Manchester"}),
(p9:Publisher {publisherId:9, name:"Aditya Rao", city:"Manchester"}),

// -------------------- BOOKS --------------------
(b1:Book {bookId:101, title:"The Chronicles of Eldoria", tags:["Fantasy","Adventure"], status:"Issued", condition:"New", cost:1200, type:"Novel"}),
(b2:Book {bookId:102, title:"The Secret of Moonvale", tags:["Fantasy"], status:"Issued", condition:"Old", cost:800, type:"Novel"}),
(b3:Book {bookId:103, title:"Twenty Forty-One", tags:["Dystopian","Political"], status:"Available", condition:"New", cost:600, type:"Novel"}),
(b4:Book {bookId:104, title:"Sands of Arkon", tags:["Science Fiction"], status:"Issued", condition:"New", cost:950, type:"Novel"}),
(b5:Book {bookId:105, title:"Whispers of Ember", tags:["Fantasy"], status:"Available", condition:"New", cost:700, type:"Novel"}),
(b6:Book {bookId:106, title:"Guardians of the Silver Realm", tags:["Fantasy"], status:"Available", condition:"Old", cost:650, type:"Novel"}),
(b7:Book {bookId:107, title:"Rainfall in Deccan", tags:["Fiction","Drama","Pune"], status:"Available", condition:"New", cost:550, type:"Novel"}),
(b8:Book {bookId:108, title:"Mumbai at Dawn", tags:["Mystery","Fiction","Mumbai"], status:"Available", condition:"New", cost:600, type:"Novel"}),
(b9:Book {bookId:109, title:"The Silent Operative", tags:["Spy","Thriller"], published:1974, status:"Available", condition:"Old", cost:500, type:"Suspense Thriller"}),
(b10:Book {bookId:110, title:"Agent in Havana", tags:["Satire","Spy"], published:1958, status:"Available", condition:"Old", cost:450, type:"Novel"}),

// -------------------- WROTE --------------------
(a1)-[:WROTE]->(b1),
(a1)-[:WROTE]->(b2),
(a2)-[:WROTE]->(b3),
(a3)-[:WROTE]->(b4),
(a4)-[:WROTE]->(b5),
(a5)-[:WROTE]->(b6),
(a6)-[:WROTE]->(b7),
(a7)-[:WROTE]->(b8),
(a8)-[:WROTE]->(b9),
(a9)-[:WROTE]->(b10),

// -------------------- PUBLISHED BY --------------------
(b1)-[:PublishedBy]->(p1),
(b2)-[:PublishedBy]->(p1),
(b3)-[:PublishedBy]->(p2),
(b4)-[:PublishedBy]->(p3),
(b5)-[:PublishedBy]->(p4),
(b6)-[:PublishedBy]->(p6),
(b7)-[:PublishedBy]->(p7),
(b8)-[:PublishedBy]->(p5),
(b9)-[:PublishedBy]->(p8),
(b10)-[:PublishedBy]->(p9),

// -------------------- SUPPLIES --------------------
(s1)-[:Supplies]->(b1),
(s1)-[:Supplies]->(b2),
(s2)-[:Supplies]->(b3),
(s2)-[:Supplies]->(b4),
(s1)-[:Supplies]->(b5),
(s2)-[:Supplies]->(b6),
(s1)-[:Supplies]->(b9),
(s2)-[:Supplies]->(b10),

// -------------------- ISSUED --------------------
(r1)-[:IssuedBy {issueDate:date("2026-08-01")}]->(b2),
(r2)-[:IssuedBy {issueDate:date("2026-08-05")}]->(b4),
(r3)-[:IssuedBy {issueDate:date("2026-08-07")}]->(b1),
(r5)-[:IssuedBy {issueDate:date("2026-08-11")}]->(b2),
(r5)-[:IssuedBy {issueDate:date("2026-08-19")}]->(b4),

// -------------------- RETURNED --------------------
(r1)-[:ReturnedBy {returnDate:date("2026-08-10"), fine:0}]->(b2),
(r2)-[:ReturnedBy {returnDate:date("2026-08-18"), fine:50}]->(b4),

// -------------------- REVIEWED BY --------------------
(rv1)-[:ReviewedBy {rating:5, remark:"Excellent", reviewDate:date("2026-08-15")}]->(b1),
(rv2)-[:ReviewedBy {rating:4, remark:"Very Good", reviewDate:date("2026-08-18")}]->(b4),

// -------------------- TRANSLATED BY --------------------
(t1)-[:TranslatedBy {language:"English"}]->(b6),
(t2)-[:TranslatedBy {language:"Polish"}]->(b5),

// -------------------- VOTES --------------------
(r1)-[:Votes {rating:5}]->(b1),
(r2)-[:Votes {rating:4}]->(b4),
(r3)-[:Votes {rating:5}]->(b2),
(r4)-[:Votes {rating:3}]->(b3),

// -------------------- READ --------------------
(r1)-[:Read]->(b1),
(r1)-[:Read]->(b2),
(r1)-[:Read]->(b3),
(r1)-[:Read]->(b4),
(r2)-[:Read]->(b2),
(r2)-[:Read]->(b4),
(r3)-[:Read]->(b1),
(r3)-[:Read]->(b2),
(r4)-[:Read]->(b3),
(r4)-[:Read]->(b5),
(r5)-[:Read]->(b1),
(r5)-[:Read]->(b2),
(r5)-[:Read]->(b4),
(r6)-[:Read]->(b9),
(r7)-[:Read]->(b9),

// -------------------- RECOMMENDED --------------------
(r1)-[:Recommended {date:date("2026-08-11")}]->(b1),
(r1)-[:Recommended {date:date("2026-08-12")}]->(b2),
(r2)-[:Recommended {date:date("2026-08-19")}]->(b4),
(r5)-[:Recommended {date:date("2026-08-20")}]->(b2),
(r7)-[:Recommended {date:date("2011-07-05")}]->(b9),
(r6)-[:Recommended {date:date("2011-09-09")}]->(b9),
(r6)-[:Recommended {date:date("2011-02-03")}]->(b10);


=====================================================================
2. SONG DATABASE
=====================================================================

CREATE
// -------------------- ARTISTS --------------------
(ar1:Artist {artistId:1, name:"Rohan Bansal", country:"New Zealand"}),
(ar2:Artist {artistId:2, name:"Vivek Sharma", country:"Scotland"}),
(ar3:Artist {artistId:3, name:"Siddhant Jain", country:"Argentina"}),
(ar4:Artist {artistId:4, name:"Abhishek Nair", country:"Ukraine"}),
(ar5:Artist {artistId:5, name:"Rahul Deshmukh", country:"Canada"}),
(ar6:Artist {artistId:6, name:"Mihir Shah", country:"Canada"}),
(ar7:Artist {artistId:7, name:"Tejas Kulkarni", country:"Canada"}),
(ar8:Artist {artistId:8, name:"Yash Verma", country:"Canada"}),

// -------------------- SONG AUTHORS --------------------
(sa1:SongAuthor {authorId:1, name:"Kartik Iyer"}),
(sa2:SongAuthor {authorId:2, name:"Sarthak Gupta"}),
(sa3:SongAuthor {authorId:3, name:"Devansh Kapoor"}),
(sa4:SongAuthor {authorId:4, name:"Aryan Singh"}),
(sa5:SongAuthor {authorId:5, name:"Manav Joshi"}),
(sa6:SongAuthor {authorId:6, name:"Anmol Mehta"}),
(sa7:SongAuthor {authorId:7, name:"Rajveer Patil"}),
(sa8:SongAuthor {authorId:8, name:"Arjun Nair"}),

// -------------------- RECORDING COMPANIES --------------------
(rc1:RecordingCompany {companyId:1, name:"Amit Shah", country:"Canada"}),
(rc2:RecordingCompany {companyId:2, name:"Nikhil Rao", country:"Canada"}),
(rc3:RecordingCompany {companyId:3, name:"Chetan Desai", country:"Ireland"}),

// -------------------- RECORDING STUDIOS --------------------
(rs1:RecordingStudio {studioId:1, name:"Siddhi Kulkarni", city:"Melbourne"}),
(rs2:RecordingStudio {studioId:2, name:"Anaya Sharma", city:"Manchester"}),
(rs3:RecordingStudio {studioId:3, name:"Aadhya Patil", city:"Austin"}),

// -------------------- SONGS --------------------
(s1:Song {songId:101, title:"Midnight Blood", genre:"Indie Alternative", language:"English", duration:"4:31", releaseYear:2025}),
(s2:Song {songId:102, title:"Falling Star", genre:"Indie Alternative", language:"English", duration:"4:10", releaseYear:2025}),
(s3:Song {songId:103, title:"Open Skies", genre:"Indie Alternative", language:"English", duration:"7:47", releaseYear:2015}),
(s4:Song {songId:104, title:"Last Days of Summer", genre:"Indie Alternative", language:"English", duration:"5:00", releaseYear:2025}),
(s5:Song {songId:105, title:"Midnight Drive", genre:"Garage Rock", language:"English", duration:"4:13", releaseYear:2007}),
(s6:Song {songId:106, title:"Forever Yours", genre:"Garage Rock", language:"English", duration:"3:04", releaseYear:2013}),
(s7:Song {songId:107, title:"Mi Camino", genre:"Latin Pop", language:"Spanish", duration:"2:28", releaseYear:2015}),
(s8:Song {songId:108, title:"Neon Motion", genre:"Electronic", language:"English", duration:"3:09", releaseYear:2020}),
(s9:Song {songId:109, title:"After Hours", genre:"Indie Alternative", language:"English", duration:"5:09", releaseYear:2020}),
(s10:Song {songId:110, title:"Good Vibes", genre:"Synth Pop", language:"English", duration:"3:30", releaseYear:2023}),
(s11:Song {songId:111, title:"Different", genre:"Synth Pop", language:"English", duration:"3:20", releaseYear:2023}),
(s12:Song {songId:112, title:"Signal", genre:"Synth Pop", language:"English", duration:"3:45", releaseYear:2024}),
(s13:Song {songId:113, title:"Wild Heart", genre:"Electropop", language:"English", duration:"3:05", releaseYear:2019}),

// -------------------- PERFORMS --------------------
(ar1)-[:Performs]->(s1),
(ar1)-[:Performs]->(s2),
(ar1)-[:Performs]->(s3),
(ar1)-[:Performs]->(s4),
(ar2)-[:Performs]->(s5),
(ar2)-[:Performs]->(s6),
(ar3)-[:Performs]->(s7),
(ar4)-[:Performs]->(s8),
(ar5)-[:Performs]->(s9),
(ar6)-[:Performs]->(s10),
(ar6)-[:Performs]->(s11),
(ar7)-[:Performs]->(s12),
(ar7)-[:Performs]->(s11),
(ar8)-[:Performs]->(s13),

// -------------------- WRITTEN BY --------------------
(s1)-[:WrittenBy]->(sa1),
(s2)-[:WrittenBy]->(sa1),
(s3)-[:WrittenBy]->(sa1),
(s4)-[:WrittenBy]->(sa1),
(s5)-[:WrittenBy]->(sa2),
(s6)-[:WrittenBy]->(sa2),
(s7)-[:WrittenBy]->(sa3),
(s8)-[:WrittenBy]->(sa4),
(s9)-[:WrittenBy]->(sa5),
(s10)-[:WrittenBy]->(sa6),
(s11)-[:WrittenBy]->(sa6),
(s12)-[:WrittenBy]->(sa7),
(s13)-[:WrittenBy]->(sa8),

// -------------------- RECORDED IN --------------------
(s1)-[:RecordedIn]->(rs1),
(s2)-[:RecordedIn]->(rs1),
(s3)-[:RecordedIn]->(rs1),
(s4)-[:RecordedIn]->(rs1),
(s5)-[:RecordedIn]->(rs2),
(s6)-[:RecordedIn]->(rs2),
(s7)-[:RecordedIn]->(rs3),
(s8)-[:RecordedIn]->(rs3),
(s9)-[:RecordedIn]->(rs3),
(s10)-[:RecordedIn]->(rs3),
(s11)-[:RecordedIn]->(rs3),
(s12)-[:RecordedIn]->(rs3),
(s13)-[:RecordedIn]->(rs3),

// -------------------- MANAGED BY --------------------
(rs1)-[:ManagedBy]->(rc1),
(rs2)-[:ManagedBy]->(rc3),
(rs3)-[:ManagedBy]->(rc2),

// -------------------- FINANCES --------------------
(rc1)-[:Finances]->(s1),
(rc1)-[:Finances]->(s2),
(rc1)-[:Finances]->(s3),
(rc1)-[:Finances]->(s4),
(rc3)-[:Finances]->(s5),
(rc3)-[:Finances]->(s6),
(rc2)-[:Finances]->(s7),
(rc2)-[:Finances]->(s8),
(rc2)-[:Finances]->(s9),
(rc2)-[:Finances]->(s10),
(rc2)-[:Finances]->(s11),
(rc2)-[:Finances]->(s12),
(rc2)-[:Finances]->(s13);


=====================================================================
3. EMPLOYEE DATABASE
=====================================================================

CREATE
// -------------------- EMPLOYEES --------------------
(e1:Employee {employeeId:1, name:"Ira Joshi", designation:"Software Engineer", experience:2, salary:850000}),
(e2:Employee {employeeId:2, name:"Myra Mehta", designation:"Data Analyst", experience:3, salary:750000}),
(e3:Employee {employeeId:3, name:"Kiara Shah", designation:"Backend Developer", experience:4, salary:900000}),
(e4:Employee {employeeId:4, name:"Riya Deshmukh", designation:"Project Manager", experience:6, salary:1500000}),
(e5:Employee {employeeId:5, name:"Diya Nair", designation:"AI Engineer", experience:5, salary:1200000}),
(e6:Employee {employeeId:6, name:"Avni Rao", designation:"Software Engineer", experience:3, salary:850000}),

// -------------------- DEPARTMENTS --------------------
(d1:Department {departmentId:1, name:"Tara Kapoor", location:"Pune"}),
(d2:Department {departmentId:2, name:"Meera Iyer", location:"Bangalore"}),
(d3:Department {departmentId:3, name:"Kavya Gupta", location:"Mumbai"}),

// -------------------- SKILLSETS --------------------
(sk1:Skillset {skillId:1, skill:"Python"}),
(sk2:Skillset {skillId:2, skill:"Java"}),
(sk3:Skillset {skillId:3, skill:"MongoDB"}),
(sk4:Skillset {skillId:4, skill:"Neo4j"}),
(sk5:Skillset {skillId:5, skill:"Machine Learning"}),
(sk6:Skillset {skillId:6, skill:"Docker"}),
(sk7:Skillset {skillId:7, skill:"AWS"}),

// -------------------- PROJECTS --------------------
(p1:Project {projectId:101, name:"Anika Singh", status:"Completed", budget:500000}),
(p2:Project {projectId:102, name:"Navya Verma", status:"Completed", budget:700000}),
(p3:Project {projectId:103, name:"Shreya Patil", status:"In Progress", budget:900000}),
(p4:Project {projectId:104, name:"Sneha Kulkarni", status:"Planning", budget:400000}),

// -------------------- WORKS_IN --------------------
(e1)-[:Works_in]->(d1),
(e2)-[:Works_in]->(d3),
(e3)-[:Works_in]->(d1),
(e4)-[:Works_in]->(d1),
(e5)-[:Works_in]->(d2),
(e6)-[:Works_in]->(d1),

// -------------------- HAS_ACQUIRED --------------------
(e1)-[:Has_acquired {year:2025}]->(sk1),
(e1)-[:Has_acquired {year:2025}]->(sk3),
(e1)-[:Has_acquired {year:2026}]->(sk4),
(e2)-[:Has_acquired]->(sk1),
(e2)-[:Has_acquired]->(sk5),
(e3)-[:Has_acquired]->(sk2),
(e3)-[:Has_acquired]->(sk6),
(e4)-[:Has_acquired]->(sk7),
(e4)-[:Has_acquired]->(sk2),
(e5)-[:Has_acquired]->(sk5),
(e5)-[:Has_acquired]->(sk7),
(e6)-[:Has_acquired]->(sk1),
(e6)-[:Has_acquired]->(sk3),
(e6)-[:Has_acquired]->(sk4),

// -------------------- ASSIGNED_TO --------------------
(e1)-[:Assigned_to {role:"Developer"}]->(p2),
(e1)-[:Assigned_to {role:"AI Engineer"}]->(p3),
(e2)-[:Assigned_to {role:"Data Analyst"}]->(p1),
(e3)-[:Assigned_to {role:"Backend Developer"}]->(p3),
(e4)-[:Assigned_to {role:"Project Manager"}]->(p1),
(e4)-[:Assigned_to {role:"Project Manager"}]->(p2),
(e5)-[:Assigned_to {role:"AI Engineer"}]->(p4),
(e6)-[:Assigned_to {role:"Developer"}]->(p3),

// -------------------- CONTROLLED_BY --------------------
(p1)-[:Controlled_by]->(d3),
(p2)-[:Controlled_by]->(d2),
(p3)-[:Controlled_by]->(d1),
(p4)-[:Controlled_by]->(d2),

// -------------------- PROJECT_MANAGER --------------------
(e4)-[:Project_manager]->(p1),
(e4)-[:Project_manager]->(p2),
(e5)-[:Project_manager]->(p4),

// -------------------- DEPARTMENT MANAGEMENT --------------------
(e4)-[:Manages]->(d1),
(e4)-[:Manages]->(d3),
(e5)-[:Manages]->(d2);


=====================================================================
4. MOVIE DATABASE
=====================================================================

CREATE
// -------------------- ACTORS --------------------
(a1:Actor {actorId:1, name:"Pooja Desai", nationality:"American", age:50}),
(a2:Actor {actorId:2, name:"Nisha Shah", nationality:"Irish", age:49}),
(a3:Actor {actorId:3, name:"Simran Rao", nationality:"Australian", age:35}),
(a4:Actor {actorId:4, name:"Aarohi Mehta", nationality:"American", age:60}),
(a5:Actor {actorId:5, name:"Ishita Joshi", nationality:"British", age:29}),
(a6:Actor {actorId:6, name:"Mahi Nair", nationality:"American", age:30}),

// -------------------- MOVIES --------------------
(m1:Movie {movieId:101, title:"Dream Within", genre:"Sci-Fi", language:"English", releaseYear:2010, imdbRating:8.8}),
(m2:Movie {movieId:102, title:"The Atomic Mind", genre:"Biography", language:"English", releaseYear:2023, imdbRating:8.4}),
(m3:Movie {movieId:103, title:"Starlight Dream", genre:"Comedy", language:"English", releaseYear:2023, imdbRating:6.8}),
(m4:Movie {movieId:104, title:"Web of Fate", genre:"Action", language:"English", releaseYear:2021, imdbRating:8.2}),
(m5:Movie {movieId:105, title:"Wall Street Nights", genre:"Biography", language:"English", releaseYear:2013, imdbRating:8.2}),
(m6:Movie {movieId:106, title:"Hollywood Sunset", genre:"Comedy-Drama", language:"English", releaseYear:2019, imdbRating:7.6}),

// -------------------- ROLES --------------------
(r1:Role {roleId:1, character:"Dom Cobb"}),
(r2:Role {roleId:2, character:"J. Robert Oppenheimer"}),
(r3:Role {roleId:3, character:"Barbie"}),
(r4:Role {roleId:4, character:"Peter Parker"}),
(r5:Role {roleId:5, character:"Jordan Belfort"}),
(r6:Role {roleId:6, character:"Lewis Strauss"}),
(r7:Role {roleId:7, character:"Naomi Lapaglia"}),
(r8:Role {roleId:8, character:"Rick Dalton"}),
(r9:Role {roleId:9, character:"Sharon Tate"}),
(r10:Role {roleId:10, character:"Robert Fischer"}),
(r11:Role {roleId:11, character:"MJ"}),

// -------------------- DIRECTORS --------------------
(d1:Director {directorId:1, name:"Anvi Kapoor"}),
(d2:Director {directorId:2, name:"Sanika Iyer"}),
(d3:Director {directorId:3, name:"Trisha Gupta"}),
(d4:Director {directorId:4, name:"Ritika Sharma"}),
(d5:Director {directorId:5, name:"Neha Patil"}),

// -------------------- PRODUCERS --------------------
(p1:Producer {producerId:1, name:"Pallavi Deshmukh"}),
(p2:Producer {producerId:2, name:"Swara Shah"}),
(p3:Producer {producerId:3, name:"Aditi Rao"}),
(p4:Producer {producerId:4, name:"Maya Kulkarni"}),
(p5:Producer {producerId:5, name:"Zoya Mehta"}),

// -------------------- FINANCIERS --------------------
(f1:Financier {financierId:1, name:"Alisha Kapoor"}),
(f2:Financier {financierId:2, name:"Sara Nair"}),
(f3:Financier {financierId:3, name:"Naina Verma"}),

// -------------------- REVIEWERS --------------------
(rw1:Reviewer {reviewerId:1, name:"Reva Joshi"}),
(rw2:Reviewer {reviewerId:2, name:"Anushka Patil"}),
(rw3:Reviewer {reviewerId:3, name:"Ayesha Shah"}),

// -------------------- ACTED_IN --------------------
(a1)-[:ACTED_IN]->(m1),
(a1)-[:ACTED_IN]->(m5),
(a1)-[:ACTED_IN]->(m6),
(a2)-[:ACTED_IN]->(m1),
(a2)-[:ACTED_IN]->(m2),
(a3)-[:ACTED_IN]->(m3),
(a3)-[:ACTED_IN]->(m5),
(a3)-[:ACTED_IN]->(m6),
(a4)-[:ACTED_IN]->(m2),
(a5)-[:ACTED_IN]->(m4),
(a6)-[:ACTED_IN]->(m4),

// -------------------- PLAYED / ROLE_IN --------------------
(a1)-[:PLAYED]->(r1),
(a1)-[:PLAYED]->(r5),
(a1)-[:PLAYED]->(r8),
(a2)-[:PLAYED]->(r2),
(a2)-[:PLAYED]->(r10),
(a3)-[:PLAYED]->(r3),
(a3)-[:PLAYED]->(r7),
(a3)-[:PLAYED]->(r9),
(a4)-[:PLAYED]->(r6),
(a5)-[:PLAYED]->(r4),
(a6)-[:PLAYED]->(r11),

(r1)-[:ROLE_IN]->(m1),
(r2)-[:ROLE_IN]->(m2),
(r3)-[:ROLE_IN]->(m3),
(r4)-[:ROLE_IN]->(m4),
(r5)-[:ROLE_IN]->(m5),
(r6)-[:ROLE_IN]->(m2),
(r7)-[:ROLE_IN]->(m5),
(r8)-[:ROLE_IN]->(m6),
(r9)-[:ROLE_IN]->(m6),
(r10)-[:ROLE_IN]->(m1),
(r11)-[:ROLE_IN]->(m4),

// -------------------- DIRECTED --------------------
(d1)-[:DIRECTED]->(m1),
(d1)-[:DIRECTED]->(m2),
(d2)-[:DIRECTED]->(m3),
(d3)-[:DIRECTED]->(m4),
(d4)-[:DIRECTED]->(m5),
(d5)-[:DIRECTED]->(m6),

// -------------------- PRODUCED --------------------
(p1)-[:PRODUCED]->(m1),
(p1)-[:PRODUCED]->(m2),
(p4)-[:PRODUCED]->(m3),
(p2)-[:PRODUCED]->(m3),
(p3)-[:PRODUCED]->(m4),
(p5)-[:PRODUCED]->(m5),
(p2)-[:PRODUCED]->(m6),

// -------------------- FINANCED --------------------
(f1)-[:FINANCED {budget:160000000}]->(m1),
(f2)-[:FINANCED {budget:100000000}]->(m2),
(f1)-[:FINANCED {budget:145000000}]->(m3),
(f3)-[:FINANCED {budget:200000000}]->(m4),
(f1)-[:FINANCED {budget:100000000}]->(m5),
(f3)-[:FINANCED {budget:90000000}]->(m6),

// -------------------- FOLLOWS (reviewer -> reviewer) --------------------
(rw1)-[:FOLLOWS]->(rw2),
(rw2)-[:FOLLOWS]->(rw3),

// -------------------- REVIEWED --------------------
(rw1)-[:REVIEWED {rating:9}]->(m2),
(rw2)-[:REVIEWED {rating:8}]->(m2),
(rw3)-[:REVIEWED {rating:9}]->(m2),
(rw1)-[:REVIEWED {rating:8}]->(m5),
(rw2)-[:REVIEWED {rating:7}]->(m3),
(rw3)-[:REVIEWED {rating:9}]->(m1);


=====================================================================
5. SOCIAL NETWORK DATABASE
=====================================================================

CREATE
// -------------------- PERSONS --------------------
(p1:Person {personId:1, name:"Kritika Rao", age:22, birthYear:2004, city:"Austin"}),
(p2:Person {personId:2, name:"Mrunal Desai", age:21, birthYear:2005, city:"San Diego"}),
(p3:Person {personId:3, name:"Saanvi Gupta", age:23, birthYear:2003, city:"Austin"}),
(p4:Person {personId:4, name:"Rhea Singh", age:22, birthYear:2004, city:"Denver"}),
(p5:Person {personId:5, name:"Lavanya Mehta", age:24, birthYear:2002, city:"Denver"}),
(p6:Person {personId:6, name:"Prisha Nair", age:22, birthYear:2004, city:"Portland"}),
(p7:Person {personId:7, name:"Vanya Kapoor", age:23, birthYear:2003, city:"Austin"}),

// -------------------- AFFILIATIONS --------------------
(a1:Affiliation {affiliationId:1, name:"Anushree Iyer", type:"University"}),
(a2:Affiliation {affiliationId:2, name:"Ishani Sharma", type:"Organization"}),
(a3:Affiliation {affiliationId:3, name:"Roshni Patil", type:"Technology"}),
(a4:Affiliation {affiliationId:4, name:"Tanisha Shah", type:"Research"}),

// -------------------- GROUPS --------------------
(g1:Group {groupId:1, name:"Esha Kulkarni"}),
(g2:Group {groupId:2, name:"Mahima Rao"}),
(g3:Group {groupId:3, name:"Sakshi Deshmukh"}),
(g4:Group {groupId:4, name:"Kashvi Mehta"}),
(g5:Group {groupId:5, name:"Aaradhya Nair"}),

// -------------------- STORIES --------------------
(s1:Story {storyId:1, title:"Won AI Hackathon", category:"Achievement", createdOn:date("2015-08-10")}),
(s2:Story {storyId:2, title:"Built a Social Network App", category:"Technology", createdOn:date("2015-08-15")}),
(s3:Story {storyId:3, title:"Weekend Movie Marathon", category:"Entertainment", createdOn:date("2015-08-20")}),

// -------------------- TIMELINES --------------------
(t1:Timeline {timelineId:1, year:2015}),
(t2:Timeline {timelineId:2, year:2025}),
(t3:Timeline {timelineId:3, year:2015}),

// -------------------- MESSAGES --------------------
(m1:Message {messageId:1, content:"Congratulations on your achievement!", sentOn:date("2015-08-11")}),
(m2:Message {messageId:2, content:"Amazing project, well done!", sentOn:date("2015-08-16")}),
(m3:Message {messageId:3, content:"Let's meet for the movie night.", sentOn:date("2025-08-21")}),
(m4:Message {messageId:4, content:"Hello everyone!", sentOn:date("2015-08-12")}),
(m5:Message {messageId:5, content:"Great to connect with everyone.", sentOn:date("2015-08-18")}),
(m6:Message {messageId:6, content:"Thanks for the invite!", sentOn:date("2015-08-25")}),

// -------------------- FRIEND_OF --------------------
(p1)-[:Friend_of {since:2022}]->(p2),
(p1)-[:Friend_of {since:2021}]->(p4),
(p1)-[:Friend_of {since:2014}]->(p6),
(p2)-[:Friend_of {since:2021}]->(p3),
(p3)-[:Friend_of {since:2020}]->(p4),
(p4)-[:Friend_of {since:2023}]->(p5),
(p5)-[:Friend_of {since:2024}]->(p1),
(p6)-[:Friend_of {since:2016}]->(p2),
(p1)-[:Friend_of {since:2023}]->(p7),
(p7)-[:Friend_of {since:2020}]->(p3),
(p7)-[:Friend_of {since:2022}]->(p5),

// -------------------- AFFILIATED_TO --------------------
(p1)-[:Affiliated_to]->(a1),
(p1)-[:Affiliated_to]->(a3),
(p2)-[:Affiliated_to]->(a1),
(p3)-[:Affiliated_to]->(a2),
(p4)-[:Affiliated_to]->(a2),
(p5)-[:Affiliated_to]->(a3),
(p6)-[:Affiliated_to]->(a3),
(p6)-[:Affiliated_to]->(a4),

// -------------------- BELONGS_TO --------------------
(p1)-[:Belongs_to]->(g1),
(p1)-[:Belongs_to]->(g2),
(p1)-[:Belongs_to]->(g3),
(p1)-[:Belongs_to]->(g4),
(p2)-[:Belongs_to]->(g1),
(p2)-[:Belongs_to]->(g3),
(p3)-[:Belongs_to]->(g2),
(p4)-[:Belongs_to]->(g3),
(p4)-[:Belongs_to]->(g4),
(p5)-[:Belongs_to]->(g1),
(p5)-[:Belongs_to]->(g2),
(p5)-[:Belongs_to]->(g5),
(p6)-[:Belongs_to]->(g4),
(p7)-[:Belongs_to]->(g3),

// -------------------- CREATES (STORY) --------------------
(p1)-[:Creates]->(s1),
(p2)-[:Creates]->(s2),
(p3)-[:Creates]->(s3),

// -------------------- STORY REFERS_TO PERSON --------------------
(s1)-[:Refers_to]->(p2),
(s2)-[:Refers_to]->(p1),
(s3)-[:Refers_to]->(p4),

// -------------------- CREATES (TIMELINE) --------------------
(p1)-[:Creates]->(t1),
(p2)-[:Creates]->(t2),
(p6)-[:Creates]->(t3),

// -------------------- TIMELINE REFERENCE_FOR STORY --------------------
(t1)-[:Reference_for]->(s1),
(t1)-[:Reference_for]->(s2),
(t2)-[:Reference_for]->(s3),
(t3)-[:Reference_for]->(s1),

// -------------------- TIMELINE CONTAINS MESSAGES --------------------
(t1)-[:Contains]->(m1),
(t1)-[:Contains]->(m2),
(t1)-[:Contains]->(m6),
(t2)-[:Contains]->(m3),
(t3)-[:Contains]->(m4),
(t3)-[:Contains]->(m5);


// -------------------- VERIFICATION (run one at a time) --------------------

// Visualize the whole graph:
MATCH (n) RETURN n;

// Properties of nodes (example: library books):
MATCH (b:Book) RETURN properties(b);

// Node labels:
MATCH (n) RETURN DISTINCT labels(n) AS labels;

MATCH (n) RETURN id(n) AS id, labels(n) AS labels;

// Relationships with their properties:
MATCH (a)-[r]->(b) RETURN type(r) AS relationship, properties(r) AS props, a, b;

// Relationship types in use:
CALL db.relationshipTypes();
