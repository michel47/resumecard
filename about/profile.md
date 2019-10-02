---
title: Ydentity Card

---
# Ydentity Card

<form action="https://iphs.ga/cgi-bin/env.pl" method=get>
I undersigned, <span id=name>Michel G. Combes</span>,
<br>borned on <input type=date value="26.01.1969" placeholder="dob" onChange="update('dob',this.value)">
<br>in <input type=location value="L'Isle Adam" placeholder="pob">

<br><input type=checkbox checked disabled> certify I am the person I am.
<br>on <input type=date value="today()" placeholder="date">
<br>at <input type=text value="ip" placeholder="ip-addresse">
<br><input type=text value="" placeholder="Name">
<br><input type=text value="" placeholder="signature" id=wetsign>
<br><input type=submit value="verify">
<br>--&nbsp;
<br><input type=text value="QmHMAC" name=hmac disabled>
</form>

<!-- a la query-graph
 form -> json template  ... -> reponses
-->
