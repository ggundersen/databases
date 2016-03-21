<!--
Exercise 5:
Return last names of all professors or lecturers who use a middle initial. Don't worry about eliminating duplicates. 
-->

for $c in doc("courses.xml")/Course_Catalog
return $c//(Professor|Lecturer)/Middle_Initial/../Last_Name
