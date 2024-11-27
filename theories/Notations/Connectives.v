Notation "x ∨ y" := (x \/ y) (at level 85, right associativity) : type_scope.
Notation "x ∧ y" := (x /\ y) (at level 80, right associativity) : type_scope.

Notation "x → y" := (x -> y) (at level 99, y at level 200, right associativity, only parsing): type_scope.

Notation "x ⇒ y" := (x -> y) (at level 99, y at level 200, right associativity, only parsing): type_scope.

Notation "x ⇨ y" := (x -> y) (at level 99, y at level 200, right associativity): type_scope.

Notation "x ↔ y" := (x <-> y) (at level 95, no associativity): type_scope.
Notation "x ⇔ y" := (x <-> y) (at level 95, no associativity): type_scope.
Notation "¬ x" := (~x) (at level 75, right associativity) : type_scope.