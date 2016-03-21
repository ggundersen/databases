<!--
Exercise 3:
Return titles of courses with enrollment greater than 500.
-->

for $d in doc("courses.xml")/Course_Catalog/Department
return $d/Course[@Enrollment > 500]/Title
