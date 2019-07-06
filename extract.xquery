
<Dickenson> {
for $line in /*/table/tbody/tr
return

$line/<entry>
  <show>{ td[contains-token(@class,'views-field-title')]/normalize-space(.) }</show>
  <def>{ td[contains-token(@class,'views-field-field-greek-definition')]/normalize-space(.) }</def>
  <poS>{ td[contains-token(@class,'views-field-field-greek-part-of-speech')]/normalize-space(.) }</poS>
  <cat>{ td[contains-token(@class,'views-field-field-greek-semantic-group')]/normalize-space(.) }</cat>
  <frq>{ td[contains-token(@class,'views-field-field-greek-frequency-rank')]/normalize-space(.) }</frq>
  </entry> }
</Dickenson>
