# Technologies Used: Oracle Forms, Reports, PL/SQL, SQL, Excel Integration.

# Description:  
- Login Form: Designed a login mechanism with account locking after three failed attempts.
- Implemented dynamic menu visibility based on user privileges, ensuring that only authorized forms are accessible.
- Administrative Form: Created an admin interface to manage user privileges, including the ability to lock/unlock form access
  and set permissions for insert, update, delete, and query actions.
- Employee Management Form: Developed a form to perform CRUD operations on employee records.
- Department Management Form: Designed a form to manage department data with full CRUD capabilities.
- Location Management Form: Built a form to handle location data, allowing users to add, update, delete, and query locations.
- Advanced Search and Reporting Form: Created a search form with filters by employee name, phone number, department, and hire date. Integrated export options to Excel and dynamic report generation.

# Setup and Run Instructions
- Download the Project:
Clone or download the project repository from GitHub to your local machine.

-Install Oracle Software:
Ensure you have Oracle Forms and Reports Builder installed on your PC.
Install Toad or any other database client for connecting to your Oracle database.

- Setup the Database Schema:
Open Toad or your preferred database client.
Connect to your Oracle database.
Import the provided schema to set up the necessary tables and data.

- Compile Forms:
Open Oracle Forms Builder.
Open each .fmb file from the project directory.
Compile the forms to generate .fmx files if not already compiled.

- Run the Application:
Open Oracle Forms runtime environment.
Run login.fmx to start the application.
Navigate through the application:
Admin Form: Manage user privileges.
Employee Form: Perform CRUD operations on employee records.
Department Form: Manage department data.
Location Form: Handle location data.
Search Form: Use filters and generate reports or export to Excel.

- Testing and Verification:
Verify the login functionality and user access controls.
Test CRUD operations and search features to ensure everything works as expected.
