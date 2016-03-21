<!--
Exercise 6:
Return the count of courses that have a cross-listed course (i.e., that have "Cross-listed" in their description).
-->

count(
  doc("courses.xml")/Course_Catalog/Department/Course[
    contains(Description, "Cross-listed")
  ]
)
