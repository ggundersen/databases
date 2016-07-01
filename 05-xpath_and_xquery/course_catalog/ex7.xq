<!--
Exercise 7:
Return the average enrollment of all courses in the CS department.
-->

avg(
  doc("courses.xml")/Course_Catalog/Department[@Code = "CS"]/Course/data(@Enrollment)
)
