<!--
Exercise 3:
Return the average population of Russian-speaking countries.
-->
    
let $cs := doc("countries.xml")/countries/country[language = "Russian"]
return avg($cs/@population)
