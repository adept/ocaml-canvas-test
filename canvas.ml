open Js_of_ocaml
open! Js_of_ocaml_lwt
open  Graphics_js

module Html = Dom_html

let onload _ =
  let canvas =
    Js.Opt.get(
      Dom_html.CoerceTo.canvas
        (Dom_html.getElementById "screen")
    )
      (fun () -> assert false)
  in
  (* this does not work:

     canvas.bc.js:164237 Uncaught ReferenceError: caml_gr_state_create is not defined
     at open_canvas (canvas.bc.js:164237)
     at caml_call1 (canvas.bc.js:164415)
     at onload (canvas.bc.js:164438)
     at caml_call1 (canvas.bc.js:152942)
     at canvas.bc.js:154769
  *)
  open_canvas canvas;
  (* this works *)
  (* open_graph "height=1000,width=1000"; *)
  fill_rect 100 100 200 200;
  Js._false
;;

let () = Html.window##.onload := Html.handler onload


