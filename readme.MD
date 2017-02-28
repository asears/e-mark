Gamifying Agile Estimation
================
Andrew Sears
February, 2017

This is a presentation on Gamifying Agile Estimation practices using RStudio's presentation format.

*"gamification is exciting because it promises to make the hard stuff in life fun"*

This repository also contains the following R Scripts

<table style="width:11%;">
<colgroup>
<col width="5%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th>Script</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>DownloadSigs.R</td>
<td>Download signatories pages to /data/ folder in html format</td>
</tr>
<tr class="even">
<td>ConvertSigs.R</td>
<td>Reads signatories pages from /data html files, adds metadata and saves /data/sigs.RDS</td>
</tr>
<tr class="odd">
<td>AnalyzeSigs.R</td>
<td>Document Term Frequency and Association Analysis</td>
</tr>
<tr class="even">
<td>LoadSigs.R</td>
<td>Load signatories RDS file</td>
</tr>
<tr class="odd">
<td>PlotMap.R</td>
<td>Future mapping exercise</td>
</tr>
<tr class="even">
<td>RandomSigs.R</td>
<td>Random blat of signatories and their comments</td>
</tr>
<tr class="odd">
<td>WebService.R</td>
<td>Plumber web service against RandomSigs.R (<a href="http://localhost:8000/agilefortune" class="uri">http://localhost:8000/agilefortune</a>)</td>
</tr>
</tbody>
</table>

Best viewed with<br> <img src="https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gradient.png" alt="alt text" width="128" height="64">
