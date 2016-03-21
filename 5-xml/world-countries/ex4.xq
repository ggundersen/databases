<!--
Exercise 4:
Return the names of all countries that have at least three cities with population greater than 3 million.
-->
    
let $cs := doc("countries.xml")/countries/country[count(city[population > 3000000]) > 3]
return data($cs/@name)
