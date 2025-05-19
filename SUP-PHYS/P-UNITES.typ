#import "../ankiconf.typ": *
#show: doc => conf(doc)
#set text(lang: "fr")

#let custom-card(
  id: "",
  q: "",
  a: "",
  ..args,
) = {
  new_id(id)
  // Can add custom code here for preview only
  card(id: id, q: q, a: a, container: true, show-labels: true)
}


#custom-card(
  id: "2504152032",
  target-deck: "P_UNITES",
  q: [Quelles sont les sept unités du système international ?],
  a: [

    Dans aucun ordre particulier :
    + Seconde, s, pour le temps
    + Kilogramme, kg, pour la masse
    + Mole, mol, pour la quantité de matière
    + Candela, cd, pour l'intensité lumineuse
    + Kelvin, K, pour la température
    + Ampère, A, pour l'intensité électrique
    + Mètre, m, pour la longueur
  ],
)


#custom-card(
  id: "2504152038",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de la tension et expression dans le système SI],
  a: [
    Volt : $"V" = "kg" dot "m"^2 dot "s"^(-3) dot A^(-1)$
  ],
)


#custom-card(
  id: "2504152040",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de la résistance électrique et expression dans le système SI],
  a: [
    Ohm : $Omega = "V" dot "A"^(-1) = "m"^(-2) dot "kg" dot "s"^(-3) dot A^(-2)$
  ],
)


#custom-card(
  id: "2504152044",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de la charge électrique et expression dans le système SI],
  a: [
    Coulomb : $"C" = "A" dot "s"$
  ],
)


#custom-card(
  id: "2504152046",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de l'induction électromagnétique et expression dans le système SI],
  a: [
    Tesla : $"T" = "V" dot "s" dot "m"^(-2) = "kg" dot "A"^(-1) dot "s"^(-2)$
  ],
)


#custom-card(
  id: "2504152047",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de l'énergie et expression dans le système SI],
  a: [
    Joule : $"J" = "kg" dot "m"^2 dot s^(-2)$
  ],
)


#custom-card(
  id: "2504152050",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de la pression et expression dans le système SI],
  a: [
    Pascal : $"Pa" = "J" dot "m"^3 = "kg" dot "m"^(-1) dot s^(-2)$
  ],
)


#custom-card(
  id: "2504152051",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de la puissance et expression dans le système SI],
  a: [
    Watt : $"W" = "J" dot "s"^(-1) = "kg" dot "m"^2 dot s^(-3)$
  ],
)
#custom-card(
  id: "2504152054",
  target-deck: "P_UNITES",
  q: [Unité conventionnelle de la mesure de la force et expression dans le système SI],
  a: [
    Newton : $"N" = "kg" dot "m" dot "s"^(-2)$
  ],
)


#custom-card(id: "2504152048", target-deck: "P_UNITES", q: [], a: [

])


#custom-card(id: "2504152048", target-deck: "P_UNITES", q: [], a: [

])

