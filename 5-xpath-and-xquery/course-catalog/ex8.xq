<!--
Exercise 8:
Return last names of instructors teaching at least one course that has "system" in its description and enrollment greater than 100.
-->

for $c in doc("courses.xml")/Course_Catalog/Department/Course
where $c[@Enrollment > 100] and contains($c/Description, "system")
return $c/Instructors/(Professor|Lecturer)/Last_Name
