let load_image_as_rgb24 ~path =
  match OImages.(load path [] |> tag) with
  | Rgb24 img -> img
  | Rgba32 img -> img#to_rgb24
  | Index8 img -> img#to_rgb24
  | Index16 img -> img#to_rgb24
  | Cmyk32 _ -> failwith "Not supported image type: Cmyk32"

let blurhash ~x_components ~y_components src =
  Blurhash.blur_hash_for_pixels ~x_components ~y_components ~width:src#width
    ~height:src#height ~bytes_per_row:(src#width * 3) (Bytes.to_string src#dump)

let test_encode_case1 () =
  let src = load_image_as_rgb24 ~path:"../../../test/test.ppm" in
  let hash = blurhash ~x_components:4 ~y_components:3 src in
  Alcotest.(check string) "test1" "LFE.@D9F01_2%L%MIVD*9Goe-;WB" hash;
  ()

let () =
  let open Alcotest in
  run "blurhash" [ ("encode", [ test_case "case1" `Quick test_encode_case1 ]) ]
