# Pet Clinic

A simple Java web application to store and view pet clinic visit records.

**Technologies:** Java(Servlets), MySQL, HTML, CSS

**Features:**
- Add pet visit details
- Store owner, pet, charges, and visit date
- View visit records# Pet Clinic

A simple Java web application to record and view pet clinic visits.


## Project Structure

PetClinic/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── pet/
│       │           ├── DBConnection.java
│       │           ├── PetServlet.java
│       │           ├── PetRecordsServlet.java
│       │           └── PetVisit.java
│       └── webapp/
│           ├── pet.jsp
│           └── petRecords.jsp
├── .gitignore
├── pom.xml
└── README.md

## Database Setup

1. Open MySQL Workbench.
2. Create a database named `petclinic`.
3. Create the `pet_visits` table with these columns:
   - `id`
   - `owner_name`
   - `pet_type`
   - `charges`
   - `visit_date`
4. Configure your database connection in `DBConnection.java`.

## How to Run

1. Install JDK, Maven, MySQL, and Apache Tomcat.
2. Configure the database connection.
3. Build the project using:

   ```bash
   mvn clean package
   ```

4. Deploy the generated WAR file from the `target` folder to Apache Tomcat.
5. Start Tomcat and open:

   `http://localhost:8080/PetClinic/`