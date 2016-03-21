<!--
Exercise 1:
Return all Title elements (of both departments and courses). 
-->

for $d in doc("courses.xml")
return $d//Title
