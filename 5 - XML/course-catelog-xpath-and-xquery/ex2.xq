<!--
Exercise 2:
Return last names of all department chairs.
-->

for $d in doc("courses.xml")/Course_Catalog/Department
return $d/Chair/Professor/Last_Name
