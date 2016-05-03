<!--
Exercise 4:
Return titles of departments that have some course that takes "CS106B" as a prerequisite.
-->

for $d in doc("courses.xml")/Course_Catalog/Department
return $d/Course[Prerequisites/Prereq = "CS106B"]/../Title
