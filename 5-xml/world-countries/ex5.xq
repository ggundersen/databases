<!--
Exercise 5:
Create a list of French-speaking and German-speaking countries. The result should take the form:

<result>
  <French>
    <country>country-name</country>
    <country>country-name</country>
    ...
  </French>
  <German>
    <country>country-name</country>
    <country>country-name</country>
    ...
  </German>
</result>
-->

<result>
  <French>
  {
    for $c in doc("countries.xml")/countries/country[language = "French"]
    return <country>{ data($c/@name) }</country>
  }
  </French>
  <German>
  {
    for $c in doc("countries.xml")/countries/country[language = "German"]
    return <country>{ data($c/@name) }</country>
  }
  </German>
</result>
