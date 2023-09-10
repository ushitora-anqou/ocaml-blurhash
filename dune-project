(lang dune 3.3)

(name blurhash)

(generate_opam_files true)

(implicit_transitive_deps false)

(source
 (github ushitora-anqou/ocaml-blurhash))

(authors "Ushitora Anqou")

(maintainers "Ushitora Anqou")

(license "MIT")

(package
 (name blurhash)
 (synopsis "A BlurHash encoder in OCaml")
 (description "A BlurHash encoder in OCaml")
 (depends
  (alcotest :with-test)
  (camlimages :with-test)
  (ocaml
   (>= 4.08.0)))
 (tags (blurhash)))
