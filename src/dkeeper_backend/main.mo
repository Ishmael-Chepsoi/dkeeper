import List "mo:base/List";
import Debug "mo:base/Debug";

actor Dkeeper {
  public type Note = {
    title : Text;
    content : Text;
  };

 stable var notes : List.List<Note> = List.nil<Note>();

//Create
  public func createNote(titleText : Text, contentText : Text) {
    let newNote : Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show (notes));

  };

//Query
  public query func readNotes() : async [Note] {
    return List.toArray(notes);
  };

  //Delete
  public func removeNote(id : Nat) {
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id + 1);
    notes := List.append(listFront, listBack);
  };

};