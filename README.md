# Kalitec Shop 5 Template
Version 1.0 - Stand 29.01.2025

## Besonderheiten
### Kundenspezifische Preise
Das Template bzw. der Kunde verwendet kundenspezifische Preise (nicht! Kundengruppen-Preise). Diese Preise pro Kunden werden im JTL Standard, wenn gesetzt, einfach direkt als Preis ausgerendert. Es gibt aber templateseitig die Möglichkeit abzufragen OB diese Eigenschaft gesetzt ist

`{if isset($Artikel->Preise->Kundenpreis_aktiv) && $Artikel->Preise->Kundenpreis_aktiv == 1}`

Im Template, in der *details.tpl* wird dies abgefragt und verarbeitet. Wenn der Kunde eingeloggt ist, und es für diesen Kunden, für diesen Artikel, einen spezifischen Preis gibt, wird der Hinweis "individuelle Kundenpreise" angezeigt.

Ist der Kunde eingeloggt, aber es ist kein spezieller Preis hinterlegt, ist dieses Feld ausgegraut.

Ist der Kunde ausgeloggt, ist das Feld nicht ausgegraut und triggert den Login-Modal.

