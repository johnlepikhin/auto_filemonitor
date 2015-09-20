
type t = {
  name : string;
  stats : Unix.stats option;
}

let init name = {
  name;
  stats = Some (Unix.stat name);
}

let update t = init t.name

let differs t1 t2 =
  let open Unix in
  match (t1.stats, t2.stats) with
  | None, None -> false
  | Some _, None
  | None, Some _ -> true
  | Some t1, Some t2 ->
     t1.st_mtime <> t2.st_mtime
     || t2.st_size <> t2.st_size
     || t2.st_ino <> t2.st_ino

let changed t =
  differs t (update t)

let write_t ob _ =
  ()
(*
  Bi_outbuf.add_string ob "\"<unused>\""
*)

let read_t _ _ =
  {
    name = "";
    stats = None;
  }
    
