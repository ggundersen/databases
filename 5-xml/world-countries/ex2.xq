<!--
Exercise 2:
Return the names of all cities that have the same name as the country in which they are located.
-->

for $ct in doc("countries.xml")/countries/country/city
where $ct/../@name = $ct/name
return $ct/name
