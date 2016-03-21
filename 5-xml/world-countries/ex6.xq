<!--
Exercise 6:
Return the countries with the highest and lowest population densities.
Note that because the "/" operator has its own meaning in XPath and XQuery, the division operator is infix "div".
To compute population density use "(@population div @area)".
You can assume density values are unique. The result should take the form:

<result>
  <highest density="value">country-name</highest>
  <lowest density="value">country-name</lowest>
</result>
-->

let $cs := doc("countries.xml")/countries/country
let $dmax := max($cs/(@population div @area))
let $dmin := min($cs/(@population div @area))
return
<result>
  <highest density='{ $dmax }'>
    { data($cs[(@population div @area) = $dmax]/@name) }
  </highest>
  <lowest density='{ $dmin }'>
    { data($cs[(@population div @area) = $dmin]/@name) }
  </lowest>
</result>
