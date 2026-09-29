Simple Queries

-------------------- (1) LIBRARY DATABASE --------------------

// (a) List all people who have issued the book "The Secret of Moonvale"
MATCH (p:Person)-[:IssuedBy]->(:Book {title:"The Secret of Moonvale"})
RETURN p.name;

// (b) Count the number of people who have read "Sands of Arkon"
MATCH (p:Person)-[:Read]->(:Book {title:"Sands of Arkon"})
RETURN count(p);

// (c) Add property "Number of books issued" for the selected reader and set its value as the count
MATCH (p:Person {name:"Manas Patil"})-[:IssuedBy]->(b:Book)
WITH p, count(b) AS total
SET p.`Number of books issued` = total
RETURN p.name, p.`Number of books issued`;

// (d) List the names of publishers from Nagpur city
MATCH (p:Publisher {city:"Nagpur"})
RETURN p.name;


-------------------- (2) SONG DATABASE --------------------

// (a) List the names of songs written by "Dev Mishra"
MATCH (s:Song)-[:WrittenBy]->(:SongAuthor {name:"Dev Mishra"})
RETURN s.title;

// (b) List the names of record companies who have financed the song "Midnight Blood"
MATCH (c:RecordingCompany)-[:Finances]->(:Song {title:"Midnight Blood"})
RETURN c.name;

// (c) List the names of artists performing the song "Open Skies"
MATCH (a:Artist)-[:Performs]->(:Song {title:"Open Skies"})
RETURN a.name;

// (d) Name the songs recorded by the studio "Aurora Studio"
MATCH (s:Song)-[:RecordedIn]->(:RecordingStudio {name:"Aurora Studio"})
RETURN s.title;


-------------------- (3) EMPLOYEE DATABASE --------------------

// (a) List the names of employees in the department "Product Engineering"
MATCH (e:Employee)-[:Works_in]->(:Department {name:"Product Engineering"})
RETURN e.name;

// (b) List the projects along with their properties, controlled by department "Business Analytics"
MATCH (p:Project)-[:Controlled_by]->(:Department {name:"Business Analytics"})
RETURN p, properties(p);

// (c) List the departments along with the count of employees in it
MATCH (e:Employee)-[:Works_in]->(d:Department)
RETURN d.name, count(e);

// (d) List the skillset for an employee "Sanket More"
MATCH (:Employee {name:"Sanket More"})-[:Has_acquired]->(s:Skillset)
RETURN s.skill;


-------------------- (4) MOVIE DATABASE --------------------

// (a) Find all actors who have acted in a movie "The Atomic Mind"
MATCH (a:Actor)-[:ACTED_IN]->(:Movie {title:"The Atomic Mind"})
RETURN a.name;

// (b) Find all reviewer pairs, one following the other and both reviewing the same movie, and return entire subgraphs
MATCH p = (r1:Reviewer)-[:FOLLOWS]->(r2:Reviewer)-[:REVIEWED]->(m:Movie)<-[:REVIEWED]-(r1)
RETURN p;

// (c) Find all actors that acted in a movie together after 2018 and return the actor names and movie node
MATCH (a1:Actor)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(a2:Actor)
WHERE m.releaseYear > 2018 AND a1.actorId < a2.actorId
RETURN a1.name, a2.name, m;

// (d) Find all movies produced by "Sophia Evans"
MATCH (:Producer {name:"Sophia Evans"})-[:PRODUCED]->(m:Movie)
RETURN m.title;


-------------------- (5) SOCIAL NETWORK DATABASE --------------------

// (a) Find all friends of "Nisha Kapoor", along with the year since when Nisha knows them
MATCH (:Person {name:"Nisha Kapoor"})-[r:Friend_of]-(f:Person)
RETURN f.name, r.since;

// (b) List out the affiliations of "Jordan"
MATCH (:Person {name:"Jordan"})-[:Affiliated_to]->(a:Affiliation)
RETURN a.name;

// (c) Find all friends of "Kiara Joshi", who are born in the same year as Kiara
MATCH (person:Person {name:"Kiara Joshi"})-[:Friend_of]-(f:Person)
WHERE f.birthYear = person.birthYear
RETURN f.name;

// (d) List out the messages posted by "Kabir Shah" in his timeline, during the year 2025
MATCH (:Person {name:"Kabir Shah"})-[:Creates]->(:Timeline {year:2025})-[:Contains]->(m:Message)
RETURN m.content, m.sentOn;
