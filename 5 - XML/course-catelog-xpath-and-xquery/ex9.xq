<!--
Exercise 8:
Return the title of the course with the largest enrollment.
-->

let $m := max(doc("courses.xml")/Course_Catalog/Department/Course/xs:int(@Enrollment))
for $c in doc("courses.xml")/Course_Catalog/Department/Course
where $c/xs:int(@Enrollment) = $m
return $c/Title
